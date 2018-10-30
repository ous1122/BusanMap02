//
//  ViewController.swift
//  BusanMap02
//
//  Created by D7703_24 on 2018. 10. 30..
//  Copyright © 2018년 D7703_24. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var myMap: MKMapView!
    let addrs:[String:[String]] = [
        "광복동" : ["중구 광복로 55번길 10", "35.0999630", "129.0304170", "광복동 주민센터", "도시대기", "상업지역"],
        "장림동" : ["사하구 장림로 161번길 2", "35.0829920", "128.9668750", "사하여성회관", "도시대기","공업지역"],
        "학장동" : ["사상구 대동로 205", "35.1460850", "128.9838270", "학장초등학교", "도시대기","공업지역"],
        "덕천동" : ["북구 만덕대로 155번길 81", "35.2158660", "129.0197570", "한국환경공단", "도시대기", "주거지역"],
        "연산동" : ["연제구 중앙대로 1065번길 14", "35.1841140", "129.0786090", "연제초등학교", "도시대기", "주거지역"],
        "대연동" : ["남구수영로 196번길 80", "35.1303210", "129.0876850", "부산공업고등학교", "도시대기", "주거지역"],
        "청룡동" : ["금정구 청룡로 25", "35.2752570", "129.0898810","청룡노포동 주민센터 옥상", "도시대기", "주거지역"],
        "전포동" : ["부산진구 전포대로 175번길 22", "35.1530480", "129.0635640","경남공고 옥상", "도시대기",  "상업지역"],
        "태종대" : ["영도구 전망로 24", "35.0597260", "129.0798400", "태종대유원지관리사무소", "도시대기", "녹지지역"],
        "기장읍" : ["기장군 기장읍 읍내로 69", "35.2460560", "129.2118280","기장초등학교 옥상", "도시대기", "주거지역"],
        "대저동" : ["강서구 낙동북로 236", "35.2114600", "128.9547110","대저차량사업소 옥상", "도시대기", "녹지지역"],
        "부곡동" : ["금정구 부곡로 156번길 7", "35.2298390", "129.0927140","부곡2동 주민센터 옥상", "도시대기", "주거지역"],
        "광안동" : ["수영구 수영로 521번길 55", "35.1527040", "129.1078090","구 보건환경연구원 3층", "도시대기", "주거지역"],
        "명장동" : ["동래구 명장로 32", "35.2047550", "129.1043270","명장동 주민센터 옥상", "도시대기", "주거지역"],
        "녹산동" : ["강서구 녹산산업중로 333", "35.0953270", "128.8556680", "(주)삼성전기부산사업장 옥상", "도시대기",  "공업지역"],
        "용수리" : ["기장군 정관면 용수로4", "35.3255580", "129.1801400", "정관면 주민센터 2층 옥상", "도시대기", "주거지역"],
        "좌동"  : ["해운대구 양운로 91", "35.1708900", "129.1742250", "좌1동 주민센터 옥상", "도시대기", "주거지역"],
        "수정동" : ["동구 구청로 1", "35.1293350", "129.0454230", "동구청사 옥상", "도시대기", "주거지역"],
        "대신동" : ["서구 대신로 150", "35.1173230", "129.0156410", "부산국민체육센터", "도시대기", "주거지역"],
        "온천동" : ["동래구 중앙대로 동래역", "35.2056140", "129.0785020", "동래지하철 앞", "도로변", "상업지역"],
        "초량동" : ["동구 초량동 윤흥신장군 동상앞", "35.11194650", "129.0354560", "윤흥신장군 동상 앞", "도로변", "상업지역"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "부산 미세먼지 지도"
        
        let a = BusanData(coordinate: CLLocationCoordinate2D(latitude:35.0999630, longitude: 35.0999630), title: "광복동", subTitle: "")
        
        //print(addrs["광복동"]![1])
        
        
        let b = BusanData(coordinate: CLLocationCoordinate2D(latitude: 35.0829920, longitude: 128.9668750), title: "장림동", subTitle: "")
        let c = BusanData(coordinate: CLLocationCoordinate2D(latitude: 35.1460850, longitude: 128.9838270), title: "학장동", subTitle: "")
        let d = BusanData(coordinate: CLLocationCoordinate2D(latitude: 35.2158660, longitude: 129.0197570), title: "덕천동", subTitle: "")
        let e = BusanData(coordinate: CLLocationCoordinate2D(latitude: 35.1841140, longitude: 129.0786090), title: " 연산동", subTitle: "")
        let f = BusanData(coordinate: CLLocationCoordinate2D(latitude: 35.1303210, longitude: 129.0876850), title: "대연동", subTitle: "")
        let g = BusanData(coordinate: CLLocationCoordinate2D(latitude: 35.2752570, longitude: 129.0898810), title: "청룡동", subTitle: "")
        let h = BusanData(coordinate: CLLocationCoordinate2D(latitude: 35.1530480, longitude: 129.0635640), title: "전포동", subTitle: "")
        let i = BusanData(coordinate: CLLocationCoordinate2D(latitude: 35.0597260, longitude: 129.0798400), title: "태종대", subTitle: "")
        let j = BusanData(coordinate: CLLocationCoordinate2D(latitude: 35.2460560, longitude: 129.2118280), title: "기장읍", subTitle: "")
        let k = BusanData(coordinate: CLLocationCoordinate2D(latitude: 35.2114600, longitude: 128.9547110), title: "대저동", subTitle: "")
        let l = BusanData(coordinate: CLLocationCoordinate2D(latitude: 35.2298390, longitude:  129.0927140), title: "부곡동", subTitle: "")
        
        myMap.addAnnotations([a,b,c,d,e,f,g,h,i,j,k,l])
        myMap.delegate = self
        
        zoomToRegion()
        
    }
    
    // 초기 맵 region 설정
    func zoomToRegion() {
        
        print("zoom to Location")
        // 부산지도 구글 중심정 35.163246, 129.066297
        let location = CLLocationCoordinate2D(latitude: 35.180100, longitude: 129.081017)
        let span = MKCoordinateSpan(latitudeDelta: 0.27, longitudeDelta: 0.27)
        let region = MKCoordinateRegion(center: location, span: span)
        myMap.setRegion(region, animated: true)
        
    }
    
    // MKMapViewDelegate 메소드 호출
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "myPin"
        
        // as?는 다운 캐스팅(형변환) 하려는 타입의 옵셔널 값을 리턴, 다운 캐스트가 가능하지 않으면 nil 반환, 형변환이 성공하리란 보장이 없으면 as? 사용
        // as!는 강제 형변환(force unwrap), 다운 캐스트가 가능하지 않으면 runtime error 발생, 형변환이 확실히 성공 가능하면 as! 사용
        var annotationView = myMap.dequeueReusableAnnotationView(withIdentifier: "identifier") as? MKPinAnnotationView
        
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
        //let stationInfo = viewAnno?.subtitle
        
        //        print(stationName)
        //        print(stationInfo)
        
        let ac = UIAlertController(title: stationName!, message: "test", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(ac, animated: true, completion: nil)
        
    }
}
