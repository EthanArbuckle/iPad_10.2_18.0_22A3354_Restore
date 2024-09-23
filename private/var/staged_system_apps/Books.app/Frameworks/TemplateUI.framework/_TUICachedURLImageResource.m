@implementation _TUICachedURLImageResource

- (_TUICachedURLImageResource)initWithCache:(id)a3 unsizedCacheSet:(id)a4 queue:(id)a5 templateURL:(id)a6 baseURL:(id)a7 url:(id)a8 naturalSize:(CGSize)a9 contentsScale:(double)a10 loader:(id)a11
{
  double height;
  double width;
  id v20;
  id v21;
  id v22;
  id v23;
  _TUICachedURLImageResource *v24;
  _TUICachedURLImageResource *v25;
  NSString *v26;
  NSString *templateURL;
  NSURL *v28;
  NSURL *baseURL;
  objc_super v31;

  height = a9.height;
  width = a9.width;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a11;
  v31.receiver = self;
  v31.super_class = (Class)_TUICachedURLImageResource;
  v24 = -[_TUICachedImageResource initWithCache:unsizedCacheSet:queue:naturalSize:contentsScale:](&v31, "initWithCache:unsizedCacheSet:queue:naturalSize:contentsScale:", a3, a4, a5, width, height, a10);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_loader, a11);
    objc_storeStrong((id *)&v25->super._url, a8);
    v26 = (NSString *)objc_msgSend(v20, "copy");
    templateURL = v25->_templateURL;
    v25->_templateURL = v26;

    v28 = (NSURL *)objc_msgSend(v21, "copy");
    baseURL = v25->_baseURL;
    v25->_baseURL = v28;

  }
  return v25;
}

- (id)debugFunctionalDescription
{
  return -[NSURL absoluteString](self->super._url, "absoluteString");
}

+ (id)sizedURLFromTemplatedURL:(id)a3 baseURL:(id)a4 naturalSize:(CGSize)a5 contentsScale:(double)a6
{
  CGFloat v7;
  CGFloat v8;
  id v9;
  id v10;
  float v11;
  void *v12;
  float v13;
  void *v14;
  void *v15;

  v7 = a5.width * a6;
  v8 = a5.height * a6;
  v9 = a4;
  v10 = objc_msgSend(a3, "mutableCopy");
  v11 = v7;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), llroundf(v11)));
  objc_msgSend(v10, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{w}"), v12, 2, 0, objc_msgSend(v10, "length"));

  v13 = v8;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), llroundf(v13)));
  objc_msgSend(v10, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{h}"), v14, 2, 0, objc_msgSend(v10, "length"));

  objc_msgSend(v10, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{c}"), &stru_243BF0, 2, 0, objc_msgSend(v10, "length"));
  objc_msgSend(v10, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{f}"), CFSTR("jpg"), 2, 0, objc_msgSend(v10, "length"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", v10, v9));

  return v15;
}

+ (id)sizedKeyFromTemplatedURL:(id)a3 baseURL:(id)a4 naturalSize:(CGSize)a5 contentScale:(double)a6
{
  void *v6;
  TUIImageResourceCacheKey *v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sizedURLFromTemplatedURL:baseURL:naturalSize:contentsScale:", a3, a4, a5.width, a5.height, a6));
  v7 = -[TUIImageResourceCacheKey initWithURL:]([TUIImageResourceCacheKey alloc], "initWithURL:", v6);

  return v7;
}

+ (id)unsizedKeyFromTemplatedURL:(id)a3 baseURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  TUIImageResourceCacheKey *v8;

  v5 = a4;
  v6 = objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{w}"), CFSTR("W"), 2, 0, objc_msgSend(v6, "length"));
  objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{h}"), CFSTR("H"), 2, 0, objc_msgSend(v6, "length"));
  objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{c}"), &stru_243BF0, 2, 0, objc_msgSend(v6, "length"));
  objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{f}"), CFSTR("jpg"), 2, 0, objc_msgSend(v6, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", v6, v5));

  v8 = -[TUIImageResourceCacheKey initWithURL:]([TUIImageResourceCacheKey alloc], "initWithURL:", v7);
  return v8;
}

+ (id)sizedKeyFromURL:(id)a3
{
  id v3;
  TUIImageResourceCacheKey *v4;

  v3 = a3;
  v4 = -[TUIImageResourceCacheKey initWithURL:]([TUIImageResourceCacheKey alloc], "initWithURL:", v3);

  return v4;
}

+ (id)unsizedKeyFromURL:(id)a3
{
  id v3;
  TUIImageResourceCacheKey *v4;

  v3 = a3;
  v4 = -[TUIImageResourceCacheKey initWithURL:]([TUIImageResourceCacheKey alloc], "initWithURL:", v3);

  return v4;
}

- (id)sizedKey
{
  return -[TUIImageResourceCacheKey initWithURL:]([TUIImageResourceCacheKey alloc], "initWithURL:", self->super._url);
}

- (id)unsizedKey
{
  NSString *templateURL;
  TUIImageResourceCacheKey *v3;

  templateURL = self->_templateURL;
  if (templateURL)
    v3 = (TUIImageResourceCacheKey *)objc_claimAutoreleasedReturnValue(+[_TUICachedURLImageResource unsizedKeyFromTemplatedURL:baseURL:](_TUICachedURLImageResource, "unsizedKeyFromTemplatedURL:baseURL:", templateURL, self->_baseURL));
  else
    v3 = -[TUIImageResourceCacheKey initWithURL:]([TUIImageResourceCacheKey alloc], "initWithURL:", self->super._url);
  return v3;
}

- (void)loadResource
{
  NSURL *v3;
  TUIResourceLoading *loader;
  NSURL *url;
  NSURL *v6;
  _QWORD v7[4];
  NSURL *v8;
  _TUICachedURLImageResource *v9;
  id v10;
  id location;

  objc_initWeak(&location, self);
  v3 = self->super._url;
  -[_TUICachedImageResource loadLargestLoadedImageAsTemporary](self, "loadLargestLoadedImageAsTemporary");
  loader = self->_loader;
  url = self->super._url;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_9E698;
  v7[3] = &unk_240528;
  v6 = v3;
  v8 = v6;
  v9 = self;
  objc_copyWeak(&v10, &location);
  -[TUIResourceLoading loadResourceWithURL:completion:](loader, "loadResourceWithURL:completion:", url, v7);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

- (void)_q_loadedImage:(id)a3 insets:(UIEdgeInsets)a4
{
  double width;
  double height;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  if (v7)
  {
    objc_msgSend(v7, "size");
  }
  else
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }
  -[_TUICachedImageResource _q_loadIntrinsicSize:](self, "_q_loadIntrinsicSize:", width, height);

}

- (id)newImageResourceWithSize:(CGSize)a3
{
  NSString *templateURL;
  id WeakRetained;
  NSString *v6;
  NSURL *baseURL;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  NSURL *url;
  void *v15;

  templateURL = self->_templateURL;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._cache);
  if (templateURL)
  {
    v6 = self->_templateURL;
    baseURL = self->_baseURL;
    -[_TUICachedImageResource naturalSize](self, "naturalSize");
    v9 = v8;
    v11 = v10;
    -[_TUICachedImageResource contentsScale](self, "contentsScale");
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "imageResourceForTemplatedURL:baseURL:naturalSize:contentsScale:", v6, baseURL, v9, v11, v12));
  }
  else
  {
    url = self->super._url;
    -[_TUICachedImageResource contentsScale](self, "contentsScale");
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "imageResourceForURL:contentsScale:", url));
  }
  v15 = (void *)v13;

  return v15;
}

- (NSString)templateURL
{
  return self->_templateURL;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_templateURL, 0);
  objc_storeStrong((id *)&self->_loader, 0);
}

@end
