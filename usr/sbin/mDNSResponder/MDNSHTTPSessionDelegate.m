@implementation MDNSHTTPSessionDelegate

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  __SecTrust *v12;
  id v13;

  v13 = a5;
  v7 = (void (**)(id, uint64_t, _QWORD))a6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "protectionSpace"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "authenticationMethod"));
  v10 = objc_msgSend(v9, "isEqualToString:", NSURLAuthenticationMethodServerTrust);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "protectionSpace"));
    v12 = (__SecTrust *)objc_msgSend(v11, "serverTrust");

    if (v12)
      SecTrustSetNetworkFetchAllowed(v12, 0);
  }
  v7[2](v7, 1, 0);

}

@end
