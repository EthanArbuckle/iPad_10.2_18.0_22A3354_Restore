@implementation BSUIAppleIDImageURLProtocol

+ (BOOL)canInitWithRequest:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "URL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scheme"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("x-apple-identity-image"));

  return v5;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  return a3;
}

- (void)startLoading
{
  void *v3;
  id v4;
  UIImage *v5;
  void *v6;
  NSData *v7;
  void *v8;
  id v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAppleIDImageURLProtocol request](self, "request"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URL"));

  v4 = BSUIGetFamilyMemberImage(v10);
  v5 = (UIImage *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAppleIDImageURLProtocol client](self, "client"));
  if (v5)
  {
    v7 = UIImagePNGRepresentation(v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_msgSend(objc_alloc((Class)NSURLResponse), "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v10, CFSTR("image/png"), objc_msgSend(v8, "length"), 0);
    objc_msgSend(v6, "URLProtocol:didReceiveResponse:cacheStoragePolicy:", self, v9, 1);
    objc_msgSend(v6, "URLProtocol:didLoadData:", self, v8);
    objc_msgSend(v6, "URLProtocolDidFinishLoading:", self);

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("kBSUIAppleIDImageURLProtocolErrorDomain"), 0, 0));
    objc_msgSend(v6, "URLProtocol:didFailWithError:", self, v8);
  }

}

@end
