//
//  Data.swift
//  Neumorphic
//
//  Created by mohammad yasir on 03/12/20.
//

import SwiftUI
import Combine

class DataStore : ObservableObject {
    @Published var updates : [Update] = updateData
}
