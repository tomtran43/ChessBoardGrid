//
//  ViewController.swift
//  chessBoard
//
//  Created by Loc Tran on 3/1/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    
    @IBOutlet weak var boardViewLabel: UIView!
    
    
    var rowTotal = 8
    var colTotal = 8
    var boardSize: CGSize!
    var chessPiece: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        boardSize = self.boardViewLabel.bounds.size
        setupBoardLayer()
        addChessPiece()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func getSquareSize()->CGFloat{
        let squareSize = CGFloat(boardSize.width / 8)
        return squareSize
    }
    
    func setupBoardLayer(){
        
        let squareSize = getSquareSize()
        
        for rowIndex in 0..<rowTotal{
            for colIndex in 0..<colTotal{
                
                let square = CAShapeLayer()
                
                square.path = UIBezierPath(rect: CGRect(x: CGFloat(rowIndex) * squareSize, y: self.view.bounds.height / 2 - boardSize.width / 2 + CGFloat(colIndex) * squareSize, width: squareSize, height: squareSize)).cgPath
                square.opacity = 0.7
                
                
                if ((rowIndex + colIndex) % 2 == 0){
                    square.fillColor = UIColor.gray.cgColor
                    
                }else{
                    square.fillColor = UIColor.white.cgColor
                }
                
                view.layer.addSublayer(square)
            }
        }
        
    }
    
    func addChessPiece(){
        
        let squareSize = getSquareSize()
        var count = 0
        
        for colIndex in 0..<colTotal{
            for rowIndex in 0..<rowTotal{
                
                count += 1
                chessPiece = UILabel(frame: CGRect(x: CGFloat(rowIndex) * squareSize, y: self.view.bounds.height / 2 - boardSize.width / 2 + CGFloat(colIndex) * squareSize, width: squareSize, height: squareSize))
                chessPiece.textAlignment = NSTextAlignment.center
                chessPiece.font = chessPiece.font.withSize(30)
                chessPiece.tag = 100 + count
                self.view.addSubview(chessPiece)
                
                if(chessPiece.tag == 101 || chessPiece.tag == 108){       // Black Rook
                    chessPiece.text = "\u{265C}"
                }else if(chessPiece.tag == 102 || chessPiece.tag == 107){ // Black Knight
                    chessPiece.text = "\u{265E}"
                }else if(chessPiece.tag == 103 || chessPiece.tag == 106){ // Baclk Bishop
                    chessPiece.text = "\u{265D}"
                }else if(chessPiece.tag == 104){                          // Black Queen
                    chessPiece.text = "\u{265B}"
                }else if(chessPiece.tag == 105){                          // Black King
                    chessPiece.text = "\u{265A}"
                }else if(chessPiece.tag == 109 || chessPiece.tag == 110 || chessPiece.tag == 111 || chessPiece.tag == 112 || chessPiece.tag == 113 || chessPiece.tag == 114 ||
                    chessPiece.tag == 115 || chessPiece.tag == 116){      // Black Pawn
                    chessPiece.text = "\u{265F}"
                }else if(chessPiece.tag == 157 || chessPiece.tag == 164){ // White Rook
                    chessPiece.text = "\u{2656}"
                }else if(chessPiece.tag == 158 || chessPiece.tag == 163){ // White Knight
                    chessPiece.text = "\u{2658}"
                }else if(chessPiece.tag == 159 || chessPiece.tag == 162){ // White Bishop
                    chessPiece.text = "\u{2657}"
                }else if(chessPiece.tag == 160){                          // White Queen
                    chessPiece.text = "\u{2655}"
                }else if(chessPiece.tag == 161){                          // White King
                    chessPiece.text = "\u{2654}"
                }else if(chessPiece.tag == 149 || chessPiece.tag == 150 || chessPiece.tag == 151 || chessPiece.tag == 152 || chessPiece.tag == 153 || chessPiece.tag == 154 ||
                    chessPiece.tag == 155 || chessPiece.tag == 156){      // White Pawn
                    chessPiece.text = "\u{2659}"
                }
                
                let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
                chessPiece.isUserInteractionEnabled = true
                chessPiece.addGestureRecognizer(gestureRecognizer)
            }
        }
    }
    
    func onPan(_ panGesture: UIPanGestureRecognizer){
        if (panGesture.state == .began || panGesture.state == .changed){
            
            let point = panGesture.translation(in: self.view)
            panGesture.view?.center = CGPoint(x: (panGesture.view?.center.x)! + point.x, y: (panGesture.view?.center.y)! + point.y)
            panGesture.setTranslation(CGPoint.zero, in: self.view)
        }
    }
}


