//
//  UpdateStore.swift
//  Munchin
//
//  Created by Joseph Torres on 5/3/21.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}
