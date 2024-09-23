@implementation AMSupportOSURLSession

- (id)_defaultSessionConfigurationWithIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDB74B8], "ephemeralSessionConfiguration", a3);
  v5 = -[NSDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("SocksProxySettings"));
  if (v5)
  {
    v6 = v5;
    v7 = v5;
LABEL_3:
    objc_msgSend(v4, "setConnectionProxyDictionary:", v6);

    goto LABEL_4;
  }
  if ((objc_msgSend(-[NSDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("UsePurpleReverseProxy")), "BOOLValue") & 1) != 0)
  {
    v6 = (void *)AMSupportHttpCopyProxySettings(0, 0);
    if (v6)
      goto LABEL_3;
  }
LABEL_4:
  objc_msgSend(v4, "setTimeoutIntervalForRequest:", self->_timeout);
  objc_msgSend(v4, "setAllowsCellularAccess:", 1);
  objc_msgSend(v4, "set_shouldSkipPreferredClientCertificateLookup:", 1);
  return v4;
}

- (id)_newSession
{
  return (id)objc_msgSend(MEMORY[0x24BDB74B0], "sessionWithConfiguration:delegate:delegateQueue:", -[AMSupportOSURLSession _defaultSessionConfigurationWithIdentifier:](self, "_defaultSessionConfigurationWithIdentifier:", CFSTR("com.apple.libamsupport.http-traffic")), self, 0);
}

- (AMSupportOSURLSession)initWithOptions:(id)a3
{
  AMSupportOSURLSession *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  float v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)AMSupportOSURLSession;
  v4 = -[AMSupportOSURLSession init](&v10, sel_init);
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("Timeout"));
    if (v5)
      objc_msgSend(v5, "doubleValue");
    else
      v6 = 0x4072C00000000000;
    *(_QWORD *)&v4->_timeout = v6;
    v7 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("Priority"));
    if (v7)
      objc_msgSend(v7, "floatValue");
    else
      v8 = 0.5;
    v4->_priority = v8;
    v4->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.libamsupport.http-session", 0);
    v4->_options = (NSDictionary *)a3;
    v4->_session = (NSURLSession *)-[AMSupportOSURLSession _newSession](v4, "_newSession");
    v4->_sslEvalFailed = 0;
  }
  return v4;
}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)AMSupportOSURLSession;
  -[AMSupportOSURLSession dealloc](&v4, sel_dealloc);
}

- (void)invalidateAndCancel
{
  -[NSURLSession invalidateAndCancel](self->_session, "invalidateAndCancel");
}

- (id)_urlRequestForHTTPMessage:(__CFHTTPMessage *)a3
{
  const __CFURL *v5;
  void *v6;
  const __CFString *v7;
  const __CFDictionary *v8;
  const __CFData *v9;

  if (!a3)
    return 0;
  v5 = CFHTTPMessageCopyRequestURL(a3);
  if (!v5)
    return 0;
  v6 = (void *)objc_msgSend(MEMORY[0x24BDB7458], "requestWithURL:cachePolicy:timeoutInterval:", v5, 1, self->_timeout);
  if (!v6)
    return v6;
  v7 = (id)CFHTTPMessageCopyRequestMethod(a3);
  if (!v7)
    return 0;
  objc_msgSend(v6, "setHTTPMethod:", v7);
  v8 = CFHTTPMessageCopyAllHeaderFields(a3);
  if (v8)
    objc_msgSend(v6, "setAllHTTPHeaderFields:", v8);
  v9 = CFHTTPMessageCopyBody(a3);
  if (v9)
    objc_msgSend(v6, "setHTTPBody:", v9);
  return v6;
}

- (void)sendRequest:(__CFHTTPMessage *)a3 completion:(id)a4
{
  NSObject *queue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x24BDAC8D0];
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__AMSupportOSURLSession_sendRequest_completion___block_invoke;
  v5[3] = &unk_24C381A90;
  v5[5] = a4;
  v5[6] = a3;
  v5[4] = self;
  dispatch_sync(queue, v5);
}

void __48__AMSupportOSURLSession_sendRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  NSObject *global_queue;
  _QWORD block[6];

  block[5] = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_urlRequestForHTTPMessage:", *(_QWORD *)(a1 + 48));
  if (v2)
  {
    v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "dataTaskWithRequest:completionHandler:", v2, *(_QWORD *)(a1 + 40));
    LODWORD(v9) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24);
    objc_msgSend(v8, "setPriority:", v9);
    objc_msgSend(v8, "resume");
  }
  else
  {
    AMSupportLogInternal(3, (uint64_t)"-[AMSupportOSURLSession sendRequest:completion:]_block_invoke", (uint64_t)"Could not construct NSURLRequest from message %@", v3, v4, v5, v6, v7, *(_QWORD *)(a1 + 48));
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__AMSupportOSURLSession_sendRequest_completion___block_invoke_2;
    block[3] = &unk_24C381A68;
    block[4] = *(_QWORD *)(a1 + 40);
    dispatch_async(global_queue, block);
  }
}

uint64_t __48__AMSupportOSURLSession_sendRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, 0, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("AMSupportError"), 3, 0));
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a4)
    AMSupportLogInternal(3, (uint64_t)"-[AMSupportOSURLSession URLSession:didBecomeInvalidWithError:]", (uint64_t)"Session %@ became invalid: %@", (uint64_t)a4, v4, v5, v6, v7, (char)a3);
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(id, uint64_t, _QWORD);
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char isKindOfClass;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const __CFAllocator *v39;
  uint64_t i;
  const __CFData *v41;
  SecCertificateRef v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  SecCertificateRef v48;
  __SecTrust *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  AMSupportOSURLSession *v66;
  char v67;
  char v68;
  AMSupportOSURLSession *v69;
  id v70;
  int v71;
  _BYTE v72[128];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v8 = (void *)objc_msgSend((id)objc_msgSend(a4, "protectionSpace", a3), "authenticationMethod");
  AMSupportLogInternal(7, (uint64_t)"-[AMSupportOSURLSession URLSession:didReceiveChallenge:completionHandler:]", (uint64_t)"Authentication challenge received.  Method: %@", v9, v10, v11, v12, v13, (char)v8);
  if (objc_msgSend(a4, "previousFailureCount") >= 1)
  {
    AMSupportLogInternal(3, (uint64_t)"-[AMSupportOSURLSession URLSession:didReceiveChallenge:completionHandler:]", (uint64_t)"Multiple challenge failures. Request failed.", v14, v15, v16, v17, v18, v67);
    v19 = (void (*)(id, uint64_t, _QWORD))*((_QWORD *)a5 + 2);
    v20 = a5;
    v21 = 2;
LABEL_3:
    v19(v20, v21, 0);
    return;
  }
  if (objc_msgSend(v8, "isEqual:", *MEMORY[0x24BDB73D8])
    && -[NSDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("ClientIdentity")))
  {
    AMSupportLogInternal(6, (uint64_t)"-[AMSupportOSURLSession URLSession:didReceiveChallenge:completionHandler:]", (uint64_t)"Received client certificate challenge. Client SSL authentication failed.", v22, v23, v24, v25, v26, v67);
LABEL_32:
    (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 2, 0);
    return;
  }
  if ((objc_msgSend(v8, "isEqual:", *MEMORY[0x24BDB7410]) & 1) == 0)
  {
    v19 = (void (*)(id, uint64_t, _QWORD))*((_QWORD *)a5 + 2);
    v20 = a5;
    v21 = 1;
    goto LABEL_3;
  }
  v27 = -[NSDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("DisableSSLValidation"));
  if (objc_msgSend(v27, "isEqual:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1)))
  {
    AMSupportLogInternal(6, (uint64_t)"-[AMSupportOSURLSession URLSession:didReceiveChallenge:completionHandler:]", (uint64_t)"SSL validation disabled.  Attempting to continue without authentication.", v28, v29, v30, v31, v32, v67);
    (*((void (**)(id, _QWORD, uint64_t))a5 + 2))(a5, 0, objc_msgSend(MEMORY[0x24BDB7480], "credentialForTrust:", objc_msgSend((id)objc_msgSend(a4, "protectionSpace"), "serverTrust")));
    return;
  }
  -[NSDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("TrustedServerCAs"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[NSDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("TrustedServerCAs"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      (*((void (**)(id, uint64_t, uint64_t))a5 + 2))(a5, 1, objc_msgSend(MEMORY[0x24BDB7480], "credentialForTrust:", objc_msgSend((id)objc_msgSend(a4, "protectionSpace"), "serverTrust")));
      return;
    }
  }
  -[NSDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("TrustedServerCAs"));
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v34 = -[NSDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("TrustedServerCAs"));
  v69 = self;
  v70 = a5;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v34 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", -[NSDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("TrustedServerCAs")));
    else
      v34 = 0;
  }
  v35 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v34, "count"));
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v73, v72, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v74;
    v39 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v74 != v38)
          objc_enumerationMutation(v34);
        v41 = *(const __CFData **)(*((_QWORD *)&v73 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v42 = SecCertificateCreateWithData(v39, v41);
          if (v42)
          {
            v48 = v42;
            objc_msgSend(v35, "addObject:", v42);
            CFRelease(v48);
          }
          else
          {
            AMSupportLogInternal(4, (uint64_t)"-[AMSupportOSURLSession URLSession:didReceiveChallenge:completionHandler:]", (uint64_t)"trusted certificate could not be loaded %@", v43, v44, v45, v46, v47, (char)v41);
          }
        }
      }
      v37 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v73, v72, 16);
    }
    while (v37);
  }
  v49 = (__SecTrust *)objc_msgSend((id)objc_msgSend(a4, "protectionSpace"), "serverTrust");
  v71 = 0;
  AMSupportLogInternal(7, (uint64_t)"-[AMSupportOSURLSession URLSession:didReceiveChallenge:completionHandler:]", (uint64_t)"Attempting trust evaluate", v50, v51, v52, v53, v54, v67);
  v60 = AMSupportX509ChainEvaluateTrust(v49, (CFArrayRef)v35, &v71, v55, v56, v57, v58, v59);
  if (v60)
  {
    AMSupportLogInternal(3, (uint64_t)"-[AMSupportOSURLSession URLSession:didReceiveChallenge:completionHandler:]", (uint64_t)"trust evaluation failed (OSStatus=%d)", v61, v62, v63, v64, v65, v60);
    v66 = v69;
    a5 = v70;
LABEL_31:
    v66->_sslEvalFailed = 1;
    goto LABEL_32;
  }
  v66 = v69;
  a5 = v70;
  if (v71 != 4 && v71 != 1)
  {
    AMSupportLogInternal(4, (uint64_t)"-[AMSupportOSURLSession URLSession:didReceiveChallenge:completionHandler:]", (uint64_t)"trust evaluation did not result in okay to proceed (result=%d)", v61, v62, v63, v64, v65, v71);
    goto LABEL_31;
  }
  AMSupportLogInternal(7, (uint64_t)"-[AMSupportOSURLSession URLSession:didReceiveChallenge:completionHandler:]", (uint64_t)"Trust evaluation succeeded, proceeding..", v61, v62, v63, v64, v65, v68);
  (*((void (**)(id, _QWORD, uint64_t))v70 + 2))(v70, 0, objc_msgSend(MEMORY[0x24BDB7480], "credentialForTrust:", v49));
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (float)priority
{
  return self->_priority;
}

- (void)setPriority:(float)a3
{
  self->_priority = a3;
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (BOOL)sslEvalFailed
{
  return self->_sslEvalFailed;
}

@end
