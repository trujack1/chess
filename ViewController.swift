//
//  ViewController.swift
//  TJChess
//
//  Created by Tru Jackson on 4/26/23.
//

import UIKit

class ViewController: UIViewController, ChessDelegate {
    
    var chessEngine: ChessEngine = ChessEngine()
    
    @IBOutlet weak var boardView: BoardView!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        boardView.chessDelegate = self
              chessEngine.initializeGame()
              boardView.shadowPieces = chessEngine.pieces
              boardView.setNeedsDisplay()
          }
         
          func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
              chessEngine.movePiece(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
              boardView.shadowPieces = chessEngine.pieces
              boardView.setNeedsDisplay()
              
              if chessEngine.whitesTurn {
                  infoLabel.text = "White"
              }else{
                  infoLabel.text = "Black"
              }
             }
             
             func pieceAt(col: Int, row: Int) -> ChessPiece? {
                 return chessEngine.pieceAt(col: col, row: row)
             }
    @IBAction func reset(_ sender: Any) {
              chessEngine.initializeGame()
              boardView.shadowPieces = chessEngine.pieces
              boardView.setNeedsDisplay()
              infoLabel.text = "White"
          }
          
      }

    
    
        
    
    

