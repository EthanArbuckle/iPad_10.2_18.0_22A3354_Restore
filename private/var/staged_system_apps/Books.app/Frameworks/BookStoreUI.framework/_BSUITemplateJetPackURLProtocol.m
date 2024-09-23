@implementation _BSUITemplateJetPackURLProtocol

+ (BOOL)canInitWithRequest:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "URL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scheme"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("jetpack"));

  return v5;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  return a3;
}

- (void)startLoading
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  id v19;
  __int16 v20;
  void *v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUITemplateJetPackURLProtocol request](self, "request"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URL"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentPackage"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUITemplateJetPackURLProtocol request](self, "request"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataAtPath:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUITemplateJetPackURLProtocol client](self, "client"));
  if (v10)
  {
    v12 = objc_msgSend(objc_alloc((Class)NSURLResponse), "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v4, CFSTR("application/octet-stream"), objc_msgSend(v10, "length"), 0);
    objc_msgSend(v11, "URLProtocol:didReceiveResponse:cacheStoragePolicy:", self, v12, 1);
    objc_msgSend(v11, "URLProtocol:didLoadData:", self, v10);
    v13 = BSUITemplateLog(objc_msgSend(v11, "URLProtocolDidFinishLoading:", self));
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v18 = 134218242;
      v19 = objc_msgSend(v10, "length");
      v20 = 2114;
      v21 = v4;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Success JetPack resource (%lu bytes): %{public}@", (uint8_t *)&v18, 0x16u);
    }

  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("kBSUIJetPackURLProtocolErrorDomain"), 0, 0));
    objc_msgSend(v11, "URLProtocol:didFailWithError:", self, v15);

    v17 = BSUITemplateLog(v16);
    v12 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_238768();
  }

}

@end
