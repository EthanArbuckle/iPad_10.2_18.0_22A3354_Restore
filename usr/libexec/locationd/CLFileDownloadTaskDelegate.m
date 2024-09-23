@implementation CLFileDownloadTaskDelegate

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  if (objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a4, "originalRequest", a3), "URL"), "scheme"), "isEqualToString:", CFSTR("https"))&& (objc_msgSend(objc_msgSend(objc_msgSend(a6, "URL"), "scheme"), "isEqualToString:", CFSTR("http")) & 1) != 0)
  {
    a6 = 0;
  }
  (*((void (**)(id, id))a7 + 2))(a7, a6);
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  +[CLCertificatePinningHelper URLSession:didReceiveChallenge:completionHandler:](CLCertificatePinningHelper, "URLSession:didReceiveChallenge:completionHandler:", a3, a4, a5);
}

@end
