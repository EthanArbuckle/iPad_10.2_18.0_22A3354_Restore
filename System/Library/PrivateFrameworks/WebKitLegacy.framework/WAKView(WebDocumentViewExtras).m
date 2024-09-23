@implementation WAKView(WebDocumentViewExtras)

- (uint64_t)_frame
{
  return objc_msgSend((id)objc_msgSend(a1, "_web_parentWebFrameView"), "webFrame");
}

- (uint64_t)_webView
{
  return objc_msgSend((id)objc_msgSend(a1, "_frame"), "webView");
}

@end
