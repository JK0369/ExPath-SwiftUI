//
//  ContentView.swift
//  ExPath
//
//  Created by 김종권 on 2022/10/12.
//

import SwiftUI

struct ContentView: View {
  var totalWidth = UIScreen.main.bounds.width
  var totalHeight = 200.0
  
  var body: some View {
    VStack {
      Text("jake iOS 앱 개발 알아가기")
        .foregroundColor(.white)
      getLinePath(values: datas)
        .stroke(.green ,style: StrokeStyle(lineWidth: 2, lineJoin: .round))
        .rotationEffect(.degrees(180), anchor: .center) // 시계방향으로 180도 회전
        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0)) // y축 대칭
    }
  }
  
  private func getLinePath(values: [Double]) -> Path {
    guard values.count > 1 else { return Path() }
    let offset = (values.max()! - values.min()!) / 2.0
    
    let step = CGPoint(
      x: totalWidth / CGFloat(values.count - 1),
      y: totalHeight / CGFloat(values.max()! - values.min()!)
    )
    var path = Path()
    let p1 = CGPoint(x: 0, y: step.y * (values[0] - offset))
    path.move(to: p1)
    
    for i in 1..<values.count {
      let p2 = CGPoint(x: step.x * CGFloat(i), y: step.y * (values[i] - offset))
      path.addLine(to: p2)
    }
    
    return path
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

//let datas = (0...40)
//  .map { _ in Double.random(in: 200...300) }

let datas = [205.87664248616824, 212.36591529463246, 258.8049099609528, 271.15419904110513, 273.86096203639727, 200.5959198527124, 217.96883356777028, 200.65573463890772, 261.3261775414218, 296.3419276530915, 242.74453036813378, 261.1769798545026, 221.55057031565565, 249.33001867026115, 235.89561987798092, 231.4278357622111, 257.1897839965552, 291.26324127070046, 234.27449372375384, 225.20342071447678, 256.0687554460256, 251.9884291086963, 271.4570906908704, 285.46843524640906, 221.93316123890222, 289.2200239699109, 270.0400095996903, 288.05903959368084, 265.5227107292555, 249.45236572757034, 228.50355096112676, 266.0659074095188, 219.7226062948684, 252.55327498248647, 289.5215302974416, 257.2631777132392, 241.1341168669185, 251.2296256239748, 247.38185750757185, 278.1093403927073, 216.7238654210636]
