@implementation WLURLSessionController

- (WLURLSessionController)initWithAuthentication:(id)a3
{
  id v5;
  WLURLSessionController *v6;
  WLURLSessionController *v7;
  void *v8;
  NSOperationQueue *v9;
  NSOperationQueue *delegateOperationQueue;
  uint64_t v11;
  NSURLSession *urlSession;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WLURLSessionController;
  v6 = -[WLURLSessionController init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_auth, a3);
    objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTLSMinimumSupportedProtocolVersion:", 771);
    objc_msgSend(v8, "setTLSMaximumSupportedProtocolVersion:", 772);
    objc_msgSend(v8, "setHTTPMaximumConnectionsPerHost:", 1);
    v9 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    delegateOperationQueue = v7->_delegateOperationQueue;
    v7->_delegateOperationQueue = v9;

    objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:delegate:delegateQueue:", v8, v7, v7->_delegateOperationQueue);
    v11 = objc_claimAutoreleasedReturnValue();
    urlSession = v7->_urlSession;
    v7->_urlSession = (NSURLSession *)v11;

    _WLLog();
  }

  return v7;
}

- (void)dealloc
{
  NSURLSession *urlSession;
  objc_super v5;

  _WLLog();
  -[NSURLSession invalidateAndCancel](self->_urlSession, "invalidateAndCancel", self);
  urlSession = self->_urlSession;
  self->_urlSession = 0;

  v5.receiver = self;
  v5.super_class = (Class)WLURLSessionController;
  -[WLURLSessionController dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  NSURLSession *v3;
  NSURLSession *urlSession;

  urlSession = self->_urlSession;
  _WLLog();
  -[NSURLSession invalidateAndCancel](self->_urlSession, "invalidateAndCancel", self, urlSession);
  v3 = self->_urlSession;
  self->_urlSession = 0;

}

- (BOOL)isValid
{
  return self->_urlSession != 0;
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFArray *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  objc_msgSend(v9, "protectionSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "authenticationMethod");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  if (objc_msgSend(v9, "previousFailureCount", self, v8, v9, v34))
  {
    objc_msgSend(v9, "failureResponse");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    _WLLog();

LABEL_3:
    v10[2](v10, 1, 0);
    goto LABEL_14;
  }
  objc_msgSend(v9, "protectionSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "authenticationMethod");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BDD12D0]);

  if (v14)
  {
    +[WLCredentialStore sharedInstance](WLCredentialStore, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "credentialsForAuthentication:", self->_auth);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "localCertificate");
    objc_msgSend(v16, "privateKey");
    v17 = SecIdentityCreate();
    v18 = (void *)MEMORY[0x24BDD1818];
    v35[0] = objc_msgSend(v16, "localCertificate");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "credentialWithIdentity:certificates:persistence:", v17, v19, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v20);
    goto LABEL_14;
  }
  objc_msgSend(v9, "protectionSpace");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "authenticationMethod");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEqualToString:", *MEMORY[0x24BDD12F8]);

  if (!v23)
    goto LABEL_3;
  +[WLCredentialStore sharedInstance](WLCredentialStore, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "credentialsForAuthentication:", self->_auth);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "remoteCertificate");
  SecCertificateCopySHA256Digest();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "protectionSpace");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = SecTrustCopyCertificateChain((SecTrustRef)objc_msgSend(v27, "serverTrust"));

  if (CFArrayGetCount(v28))
  {
    CFArrayGetValueAtIndex(v28, 0);
    SecCertificateCopySHA256Digest();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "isEqualToData:", v29))
    {
      v30 = (void *)MEMORY[0x24BDD1818];
      objc_msgSend(v9, "protectionSpace");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "credentialForTrust:", objc_msgSend(v31, "serverTrust"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v32);

    }
    else
    {
      _WLLog();
      v10[2](v10, 3, 0);
    }

  }
  else
  {
    _WLLog();
    v10[2](v10, 3, 0);
  }

LABEL_14:
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  _WLLog();
}

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_delegateOperationQueue, 0);
  objc_storeStrong((id *)&self->_auth, 0);
}

@end
