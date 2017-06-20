//
//  ViewController.swift
//  calculette
//
//  Created by Admin on 20/06/2017.
//  Copyright © 2017 com.formation. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewCalcul: UILabel!
    @IBOutlet weak var viewMemori: UILabel!
    
    var varTemp: Int? = nil
    var operatorSelect: String? = nil
    
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonDivide: UIButton!
    @IBOutlet weak var buttonMultiply: UIButton!
    
    @IBOutlet weak var buttonEnter: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /**
     * ajoute l'un des 10 chiffres en fonction de leur tag
     */
    @IBAction func addCaractAction(_ sender: UIButton) {
        
        let addCaract: String
        addCaract = sender.tag.description
        
        viewCalcul.text = viewCalcul.text! + addCaract
    }
    
    /**
     * Fonction de changement d'affichage quand on choisi une des opérations
     */
    func chooseOperator(){
        varTemp = Int(viewCalcul.text!)
        
        viewMemori.text = viewCalcul.text! + " " + operatorSelect!
        
        viewCalcul.text = ""
        buttonEnter.backgroundColor = UIColor.purple
        buttonPlus.backgroundColor = UIColor.red
        buttonMinus.backgroundColor = UIColor.red
        buttonDivide.backgroundColor = UIColor.red
        buttonMultiply.backgroundColor = UIColor.red
    }
    
    /**
     * choisi l'opération d'addition
     */
    @IBAction func add(_ sender: UIButton) {
        
        if viewCalcul.text != ""{
            if operatorSelect == nil {
                operatorSelect = "+"
                
                chooseOperator()
            }
        
        }
    }
    
    /**
     * choisi l'opération de soustraction
     */
    @IBAction func minus(_ sender: UIButton) {
        if viewCalcul.text != ""{
            if operatorSelect == nil {
                operatorSelect = "-"
                
                chooseOperator()
            }
            
        }
    }
    
    
    /**
     * choisi l'opération de division
     */
    @IBAction func divide(_ sender: UIButton) {
        if viewCalcul.text != ""{
            if operatorSelect == nil {
                operatorSelect = "/"
                
                chooseOperator()
            }
            
        }
    }
    
    /**
     * choisi l'opération de multiplication
     */
    @IBAction func multiply(_ sender: UIButton) {
        if viewCalcul.text != ""{
            if operatorSelect == nil {
                operatorSelect = "*"
                
                chooseOperator()
            }
            
        }
    }
    
    /**
     * lance le calcul demander
     */
    @IBAction func Calculate(_ sender: UIButton) {
        if viewCalcul.text != ""{
            if operatorSelect != nil {
                var result: Int
                result = Int(viewCalcul.text!) ?? 0
                
                switch operatorSelect! {
                case "+":
                    result = varTemp! + result
                case "-":
                    result = varTemp! - result
                case "/":
                    if result != 0{
                        result = varTemp! / result
                    }
                case "*":
                    result = varTemp! * result
                default:
                    
                    viewCalcul.text = viewCalcul.text
                }
                
                viewMemori.text = ""
                
                operatorSelect = nil
                viewCalcul.text = String(result)
                
                buttonEnter.backgroundColor = UIColor.red
                buttonPlus.backgroundColor = UIColor.orange
                buttonMinus.backgroundColor = UIColor.orange
                buttonDivide.backgroundColor = UIColor.orange
                buttonMultiply.backgroundColor = UIColor.orange
            }
        }
    }
    
    /**
     * efface complétement les données
     */
    @IBAction func clear(_ sender: UIButton) {
        operatorSelect = nil
        varTemp = nil
        
        viewMemori.text = ""
        viewCalcul.text = ""

        buttonEnter.backgroundColor = UIColor.red
        buttonPlus.backgroundColor = UIColor.orange
        buttonMinus.backgroundColor = UIColor.orange
        buttonDivide.backgroundColor = UIColor.orange
        buttonMultiply.backgroundColor = UIColor.orange
    }
    
    /**
     * permet de passer le chiffre en négatif (et si il l'est déjà en positif)
     */
    @IBAction func negate(_ sender: UIButton) {
        if (viewCalcul.text?.contains("-"))!{
            let index = viewCalcul.text?.index((viewCalcul.text?.startIndex)!, offsetBy: 1)
            viewCalcul.text = viewCalcul.text?.substring(from: index!)
        }else {
            viewCalcul.text = "-" + viewCalcul.text!
        }
    }
    
    /**
     * permet d'effacer le dernier caractère
     */
    @IBAction func deleteCaract(_ sender: UIButton) {
        if viewCalcul.text != "" {
            let index = viewCalcul.text?.index((viewCalcul.text?.endIndex)!, offsetBy: -1)
            viewCalcul.text = viewCalcul.text?.substring(to: index!)
        }
    }
    
    /**
     * TODO : rajouter les ","
     */
}

