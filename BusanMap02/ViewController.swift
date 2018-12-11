//
//  ViewController.swift
//  HeaundaeCCTVMap
//
//  Created by D7703_24 on 2018. 12. 10..
//  Copyright © 2018년 D7703_24. All rights reserved.
//



import UIKit
import MapKit // 지도
import CoreLocation //현재위치

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var myMap: MKMapView!
    let addrs:[String:[String]] = [ // 주소값을 입력해줌
        "해동초등학교~여상오거리" : ["우1동 394-20", "35.1683241", "129.15702269999997", "우1동", "어린이 보호", "시내"],
        "해강초등학교~부산은행" : ["우동 1388-1", "35.1608454", "129.14306599999998", "우1동", "어린이 보호","시내"],
        "수비교차로~우동 굴다리" : ["우동 1087-55", "35.1681089", "129.14035979999994", "우2동", "방범용","시내"],
        "햇살공원 주변" : ["좌1동 1293", "35.1752658", "129.1747944", "좌1동", "방범용", "도시공원"],
        "쥬노빌오피스텔 주변" : ["좌1동1458-5", "35.1700582", "129.17464710000002", "좌1동", "방범용", "시내"],
        "부흥초등학교" : ["좌동 1303", "35.1753041", "129.17818390000002", "좌2동", "어린이 보호", "시내"],
        "푸른공원" : ["대천로 53번길", "35.1714064", "129.17308460000004","좌3동", "방범용", "도시공원"],
        "영산대학교 위 반송어린이집 앞" : ["반송3 250-2831", "35.2225141", "129.15338659999998","반송3동", "어린이 보호",  "시내"],
        "재송시장 농협 아랫길" : ["재송1동 1090-1번지", "35.1858578", "129.1241758", "재송1동", "방범용", "시내"],
        "큐비 E 센텀" : ["센텀중앙로 90", "35.175605", "129.12638100000004", "재송동", "방범용", "시내"],
        "해운대 주공1단지 아파트" : ["좌동 대천로67번길 18", "35.1744336", "129.1686634", "좌동", "방범용", "시내"],
        "태극 한의원" : ["우동 1로 75", "35.1680098", "129.15690289999998", "우동", "방범용", "시내"],
        
    ]
    var locationManager:CLLocationManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 현재위치를 표기하기 위한 코드
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() //GPS사용 권한 요청
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        myMap.showsUserLocation = true //현재위치 표기를 true로 설정
        
        self.title = "해운대 CCTV위치 찾기 지도" //제목
        
        //주소에 위도 경도를 입력하여 그 위치에다 핀을 꽃아줌.
        let a = BusanData(coordinate: CLLocationCoordinate2D(latitude:35.1683241, longitude: 129.15702269999997), title: "해동초~여상", subtitle: "우1동 394-20")
        let b = BusanData(coordinate: CLLocationCoordinate2D(latitude: 35.1608454, longitude: 129.14306599999998), title: "해강초~부산은행", subtitle: "우동 1388-1")
        let c = BusanData(coordinate: CLLocationCoordinate2D(latitude: 35.1681089, longitude: 129.14035979999994), title: "수비교차로~굴다리", subtitle: "우동 1087-55")
        let d = BusanData(coordinate: CLLocationCoordinate2D(latitude: 35.1752658, longitude: 129.1747944), title: "햇살공원", subtitle: "좌1동 1293")
        let e = BusanData(coordinate: CLLocationCoordinate2D(latitude: 35.1700582, longitude: 129.17464710000002), title: " 쥬노빌오피스텔", subtitle: "좌1동1458-5")
        let f = BusanData(coordinate: CLLocationCoordinate2D(latitude: 35.1753041, longitude: 129.17818390000002), title: "부흥초", subtitle: "좌동 1303")
        let g = BusanData(coordinate: CLLocationCoordinate2D(latitude: 35.1714064, longitude: 129.17308460000004), title: "푸른공원", subtitle: "대천로 53번길")
        let h = BusanData(coordinate: CLLocationCoordinate2D(latitude: 35.2225141, longitude: 129.15338659999998), title: "반송 어린이집", subtitle: "반송3 250-2831")
        let i = BusanData(coordinate: CLLocationCoordinate2D(latitude: 35.1858578, longitude: 129.1241758), title: "재송시장 아랫길", subtitle: "재송1동 1090-1번지")
        let j = BusanData(coordinate: CLLocationCoordinate2D(latitude: 35.175605, longitude: 129.12638100000004), title: "큐비 E 센텀", subtitle: "센텀중앙로 90")
        let k = BusanData(coordinate: CLLocationCoordinate2D(latitude: 35.1744336, longitude: 129.1686634), title: "해운대 주공1단지 아파트", subtitle: "좌동 대천로67번길 18")
        let l = BusanData(coordinate: CLLocationCoordinate2D(latitude: 35.1680098, longitude: 129.15690289999998), title: "태극 한의원", subtitle: "우동 1로 75")
        
        
        myMap.addAnnotations([a,b,c,d,e,f,g,h,i,j,k,l])
        myMap.delegate = self
        
        zoomToRegion()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //위치가 업데이트될때마다 갱신해줌.
        if let coor = manager.location?.coordinate{
            print("latitude" + String(coor.latitude) + "/ longitude" + String(coor.longitude))
        }
    }
    
    
    
    // 초기 맵 region 설정
    func zoomToRegion() {
        
        print("zoom to Location")
        // 부산지도 해운대 해수욕장 중심정 35.1966103, 129.15170149999994
        let location = CLLocationCoordinate2D(latitude: 35.1966103, longitude: 129.15170149999994)
        //초기 지도를 실행했을 때 위치.
        let span = MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08)
        //지도의 확대 수준(숫자가 작을수록 확대된다).
        let region = MKCoordinateRegion(center: location, span: span)
        myMap.setRegion(region, animated: true)
        
    }
    
    
    // MKMapViewDelegate 메소드 호출
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "myPin"
        
        // as?는 다운 캐스팅(형변환) 하려는 타입의 옵셔널 값을 리턴, 다운 캐스트가 가능하지 않으면 nil 반환, 형변환이 성공하리란 보장이 없으면 as? 사용
        // as!는 강제 형변환(force unwrap), 다운 캐스트가 가능하지 않으면 runtime error 발생, 형변환이 확실히 성공 가능하면 as! 사용
        var annotationView = myMap.dequeueReusableAnnotationView(withIdentifier: "identifier") as? MKPinAnnotationView
        
        if annotation is MKUserLocation {
            return nil
        }
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
            annotationView?.animatesDrop = true
        } else {
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
    
    // callout accessary를 눌렀을때 alertView 보여줌
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let viewAnno = view.annotation
        let stationName = viewAnno?.title
        let stationInfo = viewAnno?.subtitle

        
        let ac = UIAlertController(title: stationName!, message: "", preferredStyle: .alert)
        
        //Alert를 통해 상세정보 확인가능.
        ac.addAction(UIAlertAction(title: "주소 : " + stationInfo!!, style: .default, handler: nil))
                        ac.addAction(UIAlertAction(title: "닫기", style: .cancel, handler: nil))
        present(ac, animated: true, completion: nil)
        
    }
}
