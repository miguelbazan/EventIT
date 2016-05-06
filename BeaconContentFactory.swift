//
//  BeaconContentFactory.swift
//  Miguelc95HotmailComSPB1P
//

protocol BeaconContentFactory {

    func contentForBeaconID(beaconID: BeaconID, completion: (content: AnyObject) -> ())

}
