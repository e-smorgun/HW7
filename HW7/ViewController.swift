//
//  ViewController.swift
//  Lect7
//
//  Created by AlexeiPozdnyakov on 21.04.2022.
//

import UIKit


enum rectStyle: Int {
    case redColor = 1
    case greenColor = 2
    case blackColor = 3
    case cyanColor = 4
    case blueColor = 5
    case brownColor = 6
    case grayColor = 7
    case purpleColor = 8
    case pinkColor = 9
    
    func getColor() -> UIColor {
        switch self {
        case .redColor:
            return .red
        case .greenColor:
            return .green
        case .blackColor:
            return .black
        case .cyanColor:
            return .cyan
        case .blueColor:
            return .blue
        case .brownColor:
            return .brown
        case .grayColor:
            return .gray
        case .purpleColor:
            return .purple
        case .pinkColor:
            return .systemPink
        }
    }

    func getText() -> String {
        switch self {
        case .redColor:
            return "Красный"
        case .greenColor:
            return "Зелёный"
        case .blackColor:
            return "Чёрный"
        case .cyanColor:
            return "Циановый"
        case .blueColor:
            return "Синий"
        case .brownColor:
            return "Коричневый"
        case .grayColor:
            return "Серый"
        case .purpleColor:
            return "Фиолетовый"
        case .pinkColor:
            return "Розовый"
        }
    }
}


class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    var buttons = [UIButton]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        textField.text = "80"
    }


    @IBAction func didTabBigRad() {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = Int(screenSize.width)
        var newPositionX = 10
        var newPositionY = 50
        let squareSide = Int(textField.text!)
        
        for index in 0..<buttons.count {
            self.buttons[index].removeFromSuperview()
        }
        buttons.removeAll()
        
        for _ in 0...(.random(in: 10...28))
        {
            buttons.append(UIButton())
        }
        
        for index in 0..<buttons.count {
            if newPositionX + squareSide! + 10 > screenWidth {
                newPositionY = squareSide! + newPositionY + 10
                newPositionX = 10
            }
            buttons[index].frame = CGRect(x: newPositionX, y: newPositionY, width: squareSide!, height: squareSide!)
            newPositionX = (Int(buttons[index].frame.maxX) + 10)
            
            let randNum: rectStyle! = rectStyle(rawValue: .random(in: 1...9))
            
            buttons[index].setRectParams(rectStyle: randNum)
            
            self.view.addSubview(buttons[index])
        }
    }
}

extension UIButton {
    func setRectParams(rectStyle: rectStyle) {
        self.backgroundColor = rectStyle.getColor()
        self.setTitle(rectStyle.getText(), for: .normal)
    }
}

