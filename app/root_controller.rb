class RootController < UIViewController
  def viewDidLoad
    alert = UIAlertView.alloc.initWithTitle( "This is foo title",
                                             message:"Do you like this example?",
                                             delegate: self,
                                             cancelButtonTitle: "cancel",
                                             otherButtonTitles: "Yes","No",nil)
    alert.show
  end

  def alertView(alertView, clickedButtonAtIndex:buttonIndex)
    background = UIColor.blackColor
    self.view = UIView.alloc.initWithFrame(UIScreen.mainScreen.applicationFrame)
    self.view.backgroundColor = background
    webFrame = UIScreen.mainScreen.applicationFrame
    webFrame.origin.y = 0.0
    @webView = UIWebView.alloc.initWithFrame(webFrame)
    @webView.backgroundColor = background
    @webView.scalesPageToFit = true
    @webView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)
    @webView.delegate = self
    case buttonIndex
    when 0 # 'cancel'
      @webView.loadRequest(NSURLRequest.requestWithURL(NSURL.URLWithString("http://d.hatena.ne.jp/shigemk2")))
    when 1 # 'Yes'
      @webView.loadRequest(NSURLRequest.requestWithURL(NSURL.URLWithString("http://github.com/shigemk2")))
    when 2 # 'No'
      @webView.loadRequest(NSURLRequest.requestWithURL(NSURL.URLWithString("http://twitter.com/shigemk2")))
    end
  end

  def webViewDidFinishLoad(webView)
    self.view.addSubview(@webView)
  end

end
