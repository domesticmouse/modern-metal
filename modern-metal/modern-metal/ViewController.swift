
import UIKit
import MetalKit

class ViewController: UIViewController {
    
    var mtkView: MTKView!
    var renderer: Renderer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mtkView = MTKView()
        mtkView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mtkView)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[mtkView]|", options: [], metrics: nil, views: ["mtkView" : mtkView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[mtkView]|", options: [], metrics: nil, views: ["mtkView" : mtkView]))
        
        let device = MTLCreateSystemDefaultDevice()!
        mtkView.device = device
        
        mtkView.colorPixelFormat = .bgra8Unorm
        
        renderer = Renderer(view: mtkView, device: device)
        mtkView.delegate = renderer
    }
}

