@implementation _BSUITemplateBundleURLProtocol

+ (BOOL)canInitWithRequest:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "URL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scheme"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("bundle"));

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
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUITemplateBundleURLProtocol request](self, "request"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URL"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByDeletingPathExtension"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathExtension"));
  v8 = BSUIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLForResource:withExtension:", v6, v7));

  if (v10)
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v10));
  else
    v11 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUITemplateBundleURLProtocol client](self, "client"));
  if (v11)
  {
    v13 = objc_msgSend(objc_alloc((Class)NSURLResponse), "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v4, CFSTR("application/octet-stream"), objc_msgSend(v11, "length"), 0);
    objc_msgSend(v12, "URLProtocol:didReceiveResponse:cacheStoragePolicy:", self, v13, 1);
    objc_msgSend(v12, "URLProtocol:didLoadData:", self, v11);
    v14 = BSUITemplateLog(objc_msgSend(v12, "URLProtocolDidFinishLoading:", self));
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v18 = 138543362;
      v19 = v4;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Success Bundle resource: %{public}@", (uint8_t *)&v18, 0xCu);
    }

  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("kBSUIJetPackURLProtocolErrorDomain"), 0, 0));
    objc_msgSend(v12, "URLProtocol:didFailWithError:", self, v16);

    v17 = ((uint64_t (*)(void))BSUITemplateLog)();
    v13 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      sub_2386FC();
  }

}

@end
