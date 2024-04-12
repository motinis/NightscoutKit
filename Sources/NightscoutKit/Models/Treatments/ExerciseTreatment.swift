//
//  ExerciseTreatment.swift
//  NightscoutKit
//
//  Created by Moti Nisenson-Ken on 12/04/2024.
//  Copyright © 2024 LoopKit Authors. All rights reserved.
//

import Foundation

public class ExerciseTreatment: NightscoutTreatment {
    
    let duration: TimeInterval

    public init(startDate: Date, enteredBy: String, duration: TimeInterval, notes: String? = nil, id: String? = nil) {
        self.duration = duration
        super.init(timestamp: startDate, enteredBy: enteredBy, notes: notes, id: id, eventType: .exercise)
    }

    required public init?(_ entry: [String : Any]) {
        if let durationMinutes = entry["duration"] as? Double {
            self.duration = TimeInterval(minutes: durationMinutes)
        } else {
            return nil
        }

        super.init(entry)
    }

    override public var dictionaryRepresentation: [String: Any] {
        var rval = super.dictionaryRepresentation

        rval["duration"] = duration.minutes

        return rval
    }
}

