@implementation ACM2SVTransportController

- (void)loadTrustedDevicesWithContext:(id)a3 completion:(id)a4
{
  -[ACM2SVTransportControllerDelegate twoSVTransportController:scheduleHandler:withCompletion:](-[ACM2SVTransportController delegate](self, "delegate"), "twoSVTransportController:scheduleHandler:withCompletion:", self, +[ACCHTTPHandler handlerWithContext:](ACM2SVHTTPGetTrustedDevicesHandler, "handlerWithContext:", a3), a4);
}

- (void)generateAndSendSecCodeWithContext:(id)a3 completion:(id)a4
{
  -[ACM2SVTransportControllerDelegate twoSVTransportController:scheduleHandler:withCompletion:](-[ACM2SVTransportController delegate](self, "delegate"), "twoSVTransportController:scheduleHandler:withCompletion:", self, +[ACCHTTPHandler handlerWithContext:](ACM2SVHTTPSendSecurityCodeHandler, "handlerWithContext:", a3), a4);
}

- (void)verifySecureCodeWithContext:(id)a3 completion:(id)a4
{
  -[ACM2SVTransportControllerDelegate twoSVTransportController:scheduleHandler:withCompletion:](-[ACM2SVTransportController delegate](self, "delegate"), "twoSVTransportController:scheduleHandler:withCompletion:", self, +[ACCHTTPHandler handlerWithContext:](ACM2SVHTTPVerifySecurityCodeHandler, "handlerWithContext:", a3), a4);
}

- (void)getImageWithURL:(id)a3 completion:(id)a4
{
  if (a3)
  {
    -[ACM2SVTransportControllerDelegate twoSVTransportController:fetchImageWithHandler:completion:](-[ACM2SVTransportController delegate](self, "delegate"), "twoSVTransportController:fetchImageWithHandler:completion:", self, +[ACM2SVHTTPImageDownloadHandler handlerWithURLString:](ACM2SVHTTPImageDownloadHandler, "handlerWithURLString:"), a4);
  }
  else if (ACFLog)
  {
    if ((ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"-[ACM2SVTransportController getImageWithURL:completion:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACM2SVTransportController.m", 45, 0, "Image download URL is empty");
  }
}

- (void)cancelImageFetching
{
  -[ACM2SVTransportControllerDelegate twoSVTransportControllerCancelFetchingImages:](-[ACM2SVTransportController delegate](self, "delegate"), "twoSVTransportControllerCancelFetchingImages:", self);
}

- (ACM2SVTransportControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (ACM2SVTransportControllerDelegate *)a3;
}

@end
