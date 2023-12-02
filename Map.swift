//
//  Map.swift
//  SWEBloodBridge
//
//  Created by muhammad abdelmohsen on 18/11/2023.
//

import Foundation
import MapKit
import SwiftUI


struct MyAnnotationItem: Identifiable {
    var coordinate: CLLocationCoordinate2D
    let id = UUID()
}

struct MapView: View {
    @Binding var isPresented: Bool
    @State var BloodDriveBack = false
    @State var Location : String
    @State var annotationItems: [MyAnnotationItem]
    
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 26.8206, longitude: 30.8025),
        span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
    )
    
    var body: some View {
        
        VStack {
            Map(coordinateRegion: $region,  annotationItems: annotationItems) {item in
                MapPin(coordinate: item.coordinate)
            }
                .frame(width: 400 ,height: 600)
                .cornerRadius(10)
                .padding()
            
            Text(Location)

        }.padding()
    }
}
