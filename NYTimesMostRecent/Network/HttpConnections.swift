//
//  HttpConnections.swift



import Alamofire
import MBProgressHUD

class HttpConections{
  
    
    var jsonresponse:String="";
    
    static let sharedInstance = HttpConections()
  
    func submitPostRequest(parameters: [String: Any],url:String,completionHandler: @escaping (String) -> Void) -> Void{
        
        Alamofire.request(url, method: HTTPMethod.post, parameters: parameters as? Parameters, encoding: URLEncoding.default, headers: nil) .responseString { response in
            
            switch(response.result) {
            case .success(_):
                if response.result.value != nil{
                    
                    
                    DispatchQueue.main.async(execute: { () -> Void in
                        self.jsonresponse=response.result.value!;
                     
                        completionHandler(self.jsonresponse)
                    });
                }
                break
                
            case .failure(_):
                
                self.jsonresponse="error";
                
                completionHandler(self.jsonresponse)
              
                break
                
            }
        }
        
    }
    
    
    func submitGetRequest(url:String,completionHandler: @escaping (String) -> Void) -> Void{
        Alamofire.request(url, method: HTTPMethod.get, parameters: nil, encoding: URLEncoding.default, headers: nil) .responseString { response in
            
            switch(response.result) {
            case .success(_):
                
                self.jsonresponse=response.result.value!;
                completionHandler(self.jsonresponse)
         
                break
                
            case .failure(_):
                self.jsonresponse="error"
                completionHandler(self.jsonresponse)
                break
                
            }
        }
    }
  
    func submitPostRequestWithProgressBar(view: UIView,parameters: [String: Any],url:String,completionHandler: @escaping (String) -> Void) -> Void{
        
        Alamofire.request(url, method: HTTPMethod.post, parameters: parameters as? Parameters, encoding: URLEncoding.default, headers: nil) .responseString { response in
            switch(response.result) {
            case .success(_):
                if response.result.value != nil{
                    DispatchQueue.main.async(execute: { () -> Void in
                        self.jsonresponse=response.result.value!;
                        completionHandler(self.jsonresponse)
                    });
                }
                break
            case .failure(_):
                self.jsonresponse="error";
                completionHandler(self.jsonresponse)
                break
                
            }
        }
        
    }
  
 
}
