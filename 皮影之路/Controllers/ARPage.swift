//
//  ViewController.swift
//  皮影之路
//
//  Created by 张雨飞 on 12/08/20.
//  Copyright © 2020 张雨飞. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ARPage: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        sceneView.debugOptions = .showFeaturePoints
        
        sceneView.autoenablesDefaultLighting = true
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/pyCharacter.scn")!

        // Set the scene to the view
        sceneView.scene = scene
    }
    
    @IBAction func returnB(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        configuration.planeDetection = .horizontal
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        if let planeAnchor = anchor as? ARPlaneAnchor {
            let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
            guard let material = plane.firstMaterial else {return}
            material.diffuse.contents = UIColor.init(white: 1, alpha: 0.2)

            let planeNode = SCNNode(geometry: plane)
            planeNode.simdPosition = planeAnchor.center
            planeNode.eulerAngles.x = -.pi / 2
            node.addChildNode(planeNode)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        guard let location = touches.first?.location(in: sceneView) else {return}

        guard let results = sceneView.hitTest(location, types: .existingPlaneUsingExtent).first else {return}
        let position = results.worldTransform.columns.3

        guard let pyScene = SCNScene(named: "art.scnassets/pyCharacter.scn") else {return}
        guard let pyNode = pyScene.rootNode.childNode(withName: "pyCharacter", recursively: true) else {return}
        pyNode.position = SCNVector3(x: position.x, y: position.y, z: position.z)

        sceneView.scene.rootNode.addChildNode(pyNode)
    }

/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
