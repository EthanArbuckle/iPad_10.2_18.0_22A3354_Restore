@implementation PFDURLProtocol

+ (void)_performWithProtocolLock:(id)a3
{
  void (**v3)(void);

  v3 = (void (**)(void))a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_543748);
  if (v3)
    v3[2]();
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_543748);

}

+ (void)registerHost:(id)a3 bookRootURL:(id)a4 withDRMContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1F7E9C;
  v11[3] = &unk_42C1E0;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a1;
  v8 = v14;
  v9 = v13;
  v10 = v12;
  objc_msgSend(a1, "_performWithProtocolLock:", v11);

}

+ (void)unregisterHost:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1F7F60;
  v5[3] = &unk_4291C0;
  v6 = a3;
  v7 = a1;
  v4 = v6;
  objc_msgSend(a1, "_performWithProtocolLock:", v5);

}

+ (BOOL)canInitWithRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PFDUrlHandler supportedSchemes](PFDUrlHandler, "supportedSchemes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URL"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "scheme"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lowercaseString"));
  v8 = objc_msgSend(v4, "containsObject:", v7);

  return v8;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URL"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "standardizedURL"));
  if (!v5 || (v6 = objc_msgSend(v3, "mutableCopy"), objc_msgSend(v6, "setURL:", v5), !v6))
    v6 = v3;

  return v6;
}

+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4
{
  return 0;
}

- (void)startLoading
{
  PFDUrlHandler *urlHandler;
  PFDUrlHandler *v4;
  PFDUrlHandler *v5;
  id v6;

  -[PFDURLProtocol setSelfReference:](self, "setSelfReference:", self);
  urlHandler = self->_urlHandler;
  if (!urlHandler)
  {
    v4 = -[PFDUrlHandler initWithQueueMode:requestScope:]([PFDUrlHandler alloc], "initWithQueueMode:requestScope:", 0, 0);
    v5 = self->_urlHandler;
    self->_urlHandler = v4;

    -[PFDUrlHandler setDelegate:](self->_urlHandler, "setDelegate:", self);
    urlHandler = self->_urlHandler;
  }
  v6 = (id)objc_claimAutoreleasedReturnValue(-[PFDURLProtocol request](self, "request"));
  -[PFDUrlHandler loadRequest:](urlHandler, "loadRequest:", v6);

}

- (void)stopLoading
{
  -[PFDURLProtocol setSelfReference:](self, "setSelfReference:", 0);
}

- (void)urlHandler:(id)a3 didReceiveResponse:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[PFDURLProtocol client](self, "client"));
  objc_msgSend(v6, "URLProtocol:didReceiveResponse:cacheStoragePolicy:", self, v5, 1);

}

- (void)urlHandler:(id)a3 didReceiveData:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[PFDURLProtocol client](self, "client"));
  objc_msgSend(v6, "URLProtocol:didLoadData:", self, v5);

}

- (void)urlHandlerDidFinish:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PFDURLProtocol client](self, "client", a3));
  objc_msgSend(v4, "URLProtocolDidFinishLoading:", self);

  -[PFDURLProtocol setSelfReference:](self, "setSelfReference:", 0);
}

- (void)urlHandler:(id)a3 didFailWithError:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PFDURLProtocol client](self, "client"));
  objc_msgSend(v6, "URLProtocol:didFailWithError:", self, v5);

  -[PFDURLProtocol setSelfReference:](self, "setSelfReference:", 0);
}

- (PFDURLProtocol)selfReference
{
  return self->_selfReference;
}

- (void)setSelfReference:(id)a3
{
  objc_storeStrong((id *)&self->_selfReference, a3);
}

- (PFDUrlHandler)urlHandler
{
  return self->_urlHandler;
}

- (void)setUrlHandler:(id)a3
{
  objc_storeStrong((id *)&self->_urlHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlHandler, 0);
  objc_storeStrong((id *)&self->_selfReference, 0);
}

@end
