@implementation ASKImageRequest

- (ASKImageRequest)initWithURLRequest:(id)a3 dataConsumer:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  ASKImageRequest *v11;
  NSURLRequest *v12;
  NSURLRequest *urlRequest;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ASKImageRequest;
  v11 = -[ASKResourceRequest init](&v15, "init");
  if (v11)
  {
    v12 = (NSURLRequest *)objc_msgSend(v8, "copy");
    urlRequest = v11->_urlRequest;
    v11->_urlRequest = v12;

    objc_storeStrong((id *)&v11->_dataConsumer, a4);
    objc_storeWeak((id *)&v11->_delegate, v10);
  }

  return v11;
}

- (ASKImageRequest)init
{
  -[ASKImageRequest doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASKImageRequest urlRequest](self, "urlRequest"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASKImageRequest dataConsumer](self, "dataConsumer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p urlRequest = %@, dataConsumer = %@>"), v5, self, v6, v7));

  return v8;
}

- (BOOL)isResourceRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PUIArtworkURLScheme resource](PUIArtworkURLScheme, "resource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASKImageRequest urlRequest](self, "urlRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "scheme"));
  v7 = objc_msgSend(v3, "isEqual:", v6);

  return v7;
}

- (BOOL)isMonogramRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PUIArtworkURLScheme monogram](PUIArtworkURLScheme, "monogram"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASKImageRequest urlRequest](self, "urlRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "scheme"));
  v7 = objc_msgSend(v3, "isEqual:", v6);

  return v7;
}

- (unint64_t)cacheOptions
{
  if (-[ASKImageRequest isResourceRequest](self, "isResourceRequest"))
    return 6;
  else
    return 2;
}

+ (void)setSearchBundles:(id)a3
{
  id v3;
  void *v4;

  v3 = objc_msgSend(a3, "copy");
  v4 = (void *)_searchBundles;
  _searchBundles = (uint64_t)v3;

}

+ (NSArray)searchBundles
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  if (_searchBundles)
    return (NSArray *)objc_msgSend((id)_searchBundles, "copy");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.ShelfKit")));
  v6[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 2));

  return (NSArray *)v5;
}

- (id)makeLoadOperation
{
  ASKLoadBundleResourceOperation *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  ASKLoadBundleResourceOperation *v10;
  ASKLoadMonogramResourceOperation *v11;
  ASKLoadMonogramResourceOperation *v12;
  ASKLoadImageResourceOperation *v13;

  if (-[ASKImageRequest isResourceRequest](self, "isResourceRequest"))
  {
    v3 = [ASKLoadBundleResourceOperation alloc];
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASKImageRequest urlRequest](self, "urlRequest"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "host"));
    v8 = objc_msgSend((id)objc_opt_class(self, v7), "searchBundles");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = -[ASKLoadBundleResourceOperation initWithResourceName:searchBundles:](v3, "initWithResourceName:searchBundles:", v6, v9);

  }
  else
  {
    if (-[ASKImageRequest isMonogramRequest](self, "isMonogramRequest"))
    {
      v11 = [ASKLoadMonogramResourceOperation alloc];
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASKImageRequest urlRequest](self, "urlRequest"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
      v12 = -[ASKLoadMonogramResourceOperation initWithMonogramResourceURL:](v11, "initWithMonogramResourceURL:", v5);
    }
    else
    {
      v13 = [ASKLoadImageResourceOperation alloc];
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASKImageRequest urlRequest](self, "urlRequest"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASKImageRequest dataConsumer](self, "dataConsumer"));
      v12 = -[ASKLoadImageResourceOperation initWithURLRequest:dataConsumer:](v13, "initWithURLRequest:dataConsumer:", v4, v5);
    }
    v10 = (ASKLoadBundleResourceOperation *)v12;
  }

  return v10;
}

- (void)didLoadResource:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASKImageRequest delegate](self, "delegate"));
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "imageRequest:didFailWithError:", self, v6);
  else
    objc_msgSend(v7, "imageRequest:didLoadImage:", self, v9);

}

- (ASKResourceDataConsumer)dataConsumer
{
  return self->_dataConsumer;
}

- (NSURLRequest)urlRequest
{
  return self->_urlRequest;
}

- (ASKImageRequestDelegate)delegate
{
  return (ASKImageRequestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_urlRequest, 0);
  objc_storeStrong((id *)&self->_dataConsumer, 0);
}

@end
