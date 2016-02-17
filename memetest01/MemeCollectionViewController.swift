//
//  MemeCollectionViewController.swift
//  memetest01
//
//  Created by Cesar Ramirez on 4/23/15.
//  Copyright (c) 2015 Cesar Ramirez. All rights reserved.
//

import Foundation
import UIKit

class MemeCollectionViewController: UIViewController,  UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{

    var memes: [Meme]!

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let object = UIApplication.sharedApplication().delegate as! AppDelegate
        let appDelegate = object as AppDelegate
        memes = appDelegate.memes
    }

     func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print (self.memes.count)
        return self.memes.count
    }

     func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MemeCollectionViewCell", forIndexPath: indexPath) as! MemeCollectionViewCell
        
        let meme = self.memes[indexPath.item]
        cell.memed.image = meme.memedImage
        return cell
    }
    
     func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath:NSIndexPath)
    {
        
        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("MemeDetailViewController")! s! MemeDetailViewController
        
        detailController.meme = self.memes[indexPath.item]
        self.navigationController!.pushViewController(detailController, animated: true)
        
    }
    
}
