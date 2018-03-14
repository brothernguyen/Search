//
//  SearchCollectionViewController.swift
//  Search
//
//  Created by Anh Tuan Nguyen on 3/13/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit

class SearchCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    struct Device {
        var name: String
        var img: String
    }
    
    var dates = ["Today", "Yesterday", "Past 7 days", "Past 30 days", "Past 90 days"]
    var devices = [Device(name: "Lock", img: "lock.png"),
                   Device(name: "Motion", img: "motion.png"),
                   Device(name: "Thermostat", img: "thermostat.png"),
                   Device(name: "2 on", img: "bulb1.png"),
                   Device(name: "Windows", img: "window1.png"),
                   Device(name: "Blinds", img: "blinds.png")
                   ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {        
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            self.collectionView?.register(UINib(nibName: "SearchCategoryCell", bundle:nil), forCellWithReuseIdentifier: "SearchCell")
            return self.devices.count
        } else {
            self.collectionView?.register(UINib(nibName: "SearchDateCell", bundle:nil), forCellWithReuseIdentifier: "DateCell")
            return self.dates.count
        }        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: 100, height: 120)
        } else {
            return CGSize(width: 375, height: 60)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 {
            return 30
        } else {
            return 15
        }        
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {        
        case UICollectionElementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: "Header",
                                                                             for: indexPath) as! SearchHeaderView
            if indexPath.section == 0 {
                headerView.headerLabel.text = "     CATEGORY"
            } else if indexPath.section == 1 {
                headerView.headerLabel.text = "     DATE"
            }
            return headerView
        default:
            assert(false, "Unexpected element kind")
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //var cell = UICollectionViewCell()
        if indexPath.section == 0 {
            let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as? SearchCategoryCell)!
            let device = self.devices[indexPath.row]
            cell.deviceName.text = device.name
            cell.deviceImage.image = UIImage(named: device.img)
            
            return cell
            
        } else {
            let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "DateCell", for: indexPath) as? SearchDateCell)!
            let date = self.dates[indexPath.row]
            cell.dateLabel.text = date
            
            return cell
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
