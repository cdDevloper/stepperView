//
//  ComplaintsMainController.swift
//  AES
//
//  Created by SITEFUEL-DEV on 13/05/20.
//  Copyright © 2020 MachineTest. All rights reserved.
//

import UIKit

struct Constant{
    struct  Color {
        static let barTitleColor = UIColor(red: 0.0, green: 119.0, blue: 183.0, alpha: 1.0)
    }
    
    struct  Storyboard {
        static let ubicacionController = "UbicacionController"
        static let evidencveController = "EvidencveController"
        static let finalizerController = "FinalizerController"
    }
}


class ComplaintsMainController: UIViewController {
  var pageMenu : CAPSPageMenu?
  @IBOutlet weak var stepIndicatorView:StepIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createPageMenu()
    }
    
    func createPageMenu(){
        var viewController : [UIViewController] = []
        let arrTitle = ["","",""]
        for i in 0...(arrTitle.count - 1)
        {
            if i == 0{
                let cntrller  = self.storyboard?.instantiateViewController(withIdentifier: Constant.Storyboard.ubicacionController) as! UbicacionController
                cntrller.title = arrTitle[i]
                viewController.append(cntrller)
            }else if i == 1{
                let cntrller  = self.storyboard?.instantiateViewController(withIdentifier: Constant.Storyboard.evidencveController) as! EvidencveController
                cntrller.title = arrTitle[i]
                viewController.append(cntrller)
            }else if i == 2{
                let cntrller  = self.storyboard?.instantiateViewController(withIdentifier: Constant.Storyboard.finalizerController) as! FinalizerController
                cntrller.title = arrTitle[i]
                viewController.append(cntrller)
            }
        }
        
        // Customize page menu to your liking (optional) or use default settings by sending nil for 'options' in the init
        // Example:
        //.menuItemFont(UIFont(name: fontAndSize.menuItemFont, size: fontAndSize.menuItemFontSize)!),
        
        let parameters: [CAPSPageMenuOption] = [
            .scrollMenuBackgroundColor(UIColor(red: 255.0/255.0, green: 20.0/255.0, blue: 147.0/255.0, alpha: 1.0)),
            .viewBackgroundColor(UIColor.clear),.unselectedMenuItemLabelColor(UIColor.darkGray),.selectedMenuItemLabelColor(UIColor.white),
            .selectionIndicatorColor(UIColor(red: 0.0/255.0, green: 206.0/255.0, blue: 209.0/255.0, alpha: 1.0)),
            .menuHeight(0.0),
            .menuItemWidth(self.view.frame.size.width/4),
            .centerMenuItems(true),
            .enableHorizontalBounce(false)]
       
        
        // Initialize page menu with controller array, frame, and optional parameters
        pageMenu = CAPSPageMenu(viewControllers: viewController, frame:CGRect(x: 0.0, y: 220, width: self.view.frame.width, height: self.view.frame.height - 55.0), pageMenuOptions: parameters)
        pageMenu!.delegate = self
        // Lastly add page menu as subview of base view controller view
        // or use pageMenu controller in you view hierachy as desired
        self.view.addSubview(pageMenu!.view)
    }
}

//MARK: CAPSPageMenuDelegate Deleagte Method
extension ComplaintsMainController:CAPSPageMenuDelegate{
    func willMoveToPage(_ controller: UIViewController, index: Int){
        
    }

    func didMoveToPage(_ controller: UIViewController, index: Int){
        stepIndicatorView.currentStep = index
    }
}
