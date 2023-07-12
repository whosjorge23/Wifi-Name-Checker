//
//  ContentView.swift
//  Wifi Name Checker
//
//  Created by Giorgio Giannotta on 12/07/23.
//

import SwiftUI
import NetworkExtension

struct ContentView: View {
    @State private var wifiName: String = "Unknown"

    var body: some View {
        VStack {
            Text("Wi-Fi Network's name:")
            Text(wifiName)
                .font(.headline)
                .padding()
        }
        .onAppear {
            getWifiName()
        }
    }

    func getWifiName() {
        if let ssid = getSSID() {
            wifiName = ssid
        } else {
            wifiName = "No Wi-Fi Connection"
        }
    }

    func getSSID() -> String? {
        guard let interface = NEHotspotHelper.supportedNetworkInterfaces()?.first else {
            return nil
        }
        
        return "\((interface as AnyObject).ssid)"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
