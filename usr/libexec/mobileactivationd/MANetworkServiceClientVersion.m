@implementation MANetworkServiceClientVersion

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t, _QWORD);
  NSError *v9;
  void *v10;
  id v11;
  id v12;
  unsigned __int8 v13;
  id v14;
  uint64_t v15;
  id v16;
  NSURLCredential *v17;
  id v18;
  void *v19;
  SecTrustResultType result;

  v7 = a4;
  v8 = (void (**)(id, uint64_t, _QWORD))a5;
  if ((uint64_t)objc_msgSend(v7, "previousFailureCount") < 1)
  {
    v11 = objc_msgSend(v7, "protectionSpace");
    v12 = objc_msgSend(v11, "authenticationMethod");
    v13 = objc_msgSend(v12, "isEqualToString:", NSURLAuthenticationMethodServerTrust);

    if ((v13 & 1) == 0)
    {
      v8[2](v8, 1, 0);
      goto LABEL_5;
    }
    result = kSecTrustResultInvalid;
    v14 = objc_msgSend(v7, "protectionSpace");
    SecTrustEvaluate((SecTrustRef)objc_msgSend(v14, "serverTrust"), &result);

    if (-[MANetworkServiceClientVersion allowInvalidCert](self, "allowInvalidCert")
      || (v15 = result, result == kSecTrustResultProceed)
      || result == kSecTrustResultUnspecified)
    {
      v16 = objc_msgSend(v7, "protectionSpace");
      v17 = +[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", objc_msgSend(v16, "serverTrust"));

      ((void (**)(id, uint64_t, NSURLCredential *))v8)[2](v8, 0, v17);
      v10 = v17;
      goto LABEL_4;
    }
    v18 = objc_msgSend(v7, "protectionSpace");
    v19 = (void *)SecTrustCopyFailureDescription(objc_msgSend(v18, "serverTrust"));
    v9 = createMobileActivationError((uint64_t)"-[MANetworkServiceClientVersion URLSession:didReceiveChallenge:completionHandler:]", 131, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to evaluate trust: %d (%@)"), v15, v19);

  }
  else
  {
    v9 = createMobileActivationError((uint64_t)"-[MANetworkServiceClientVersion URLSession:didReceiveChallenge:completionHandler:]", 60, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Previous challenge failures."));
  }
  -[MANetworkServiceClientVersion setLastNetworkError:](self, "setLastNetworkError:", v9);
  v8[2](v8, 2, 0);
  v10 = v9;
LABEL_4:

LABEL_5:
}

- (BOOL)allowInvalidCert
{
  return self->_allowInvalidCert;
}

- (void)setAllowInvalidCert:(BOOL)a3
{
  self->_allowInvalidCert = a3;
}

- (NSError)lastNetworkError
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLastNetworkError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastNetworkError, 0);
}

@end
