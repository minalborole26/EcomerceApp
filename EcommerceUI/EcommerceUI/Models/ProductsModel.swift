//
//  ProductModels.swift
//  EcommerceUI
//
//  Created by Minal Wani on 25/04/23.
//

import Foundation

struct ProductModel: Codable {
     var response: [Product]?
 }
 
struct Product: Codable {
     var categoryName: String?
     var products: [ProductDetails]?
 }

struct ProductDetails: Codable {
     var name: String?
     var imageName: String?
     var price: String?
     var description: String?
 } 
