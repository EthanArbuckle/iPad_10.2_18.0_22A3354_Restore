@implementation BSUIStorefrontCache

+ (BSUIStorefrontCache)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_7590;
  block[3] = &unk_2E4068;
  block[4] = a1;
  if (qword_32BF48 != -1)
    dispatch_once(&qword_32BF48, block);
  return (BSUIStorefrontCache *)(id)qword_32BF50;
}

- (BSUIStorefrontCache)initWithMemoryCapacity:(unint64_t)a3 diskCapacity:(unint64_t)a4
{
  BSUIStorefrontCache *v6;
  void *v7;
  id v8;
  uint64_t v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSURLSession *session;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)BSUIStorefrontCache;
  v6 = -[BSUIStorefrontCache init](&v17, "init");
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration defaultSessionConfiguration](NSURLSessionConfiguration, "defaultSessionConfiguration"));
    v8 = objc_alloc((Class)NSURLCache);
    v10 = (objc_class *)objc_opt_class(v6, v9);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = objc_msgSend(v8, "initWithMemoryCapacity:diskCapacity:diskPath:", a3, a4, v12);
    objc_msgSend(v7, "setURLCache:", v13);

    v14 = objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:](NSURLSession, "sessionWithConfiguration:", v7));
    session = v6->_session;
    v6->_session = (NSURLSession *)v14;

  }
  return v6;
}

- (void)imageWithURLString:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  -[BSUIStorefrontCache imageWithURLString:size:fileType:completion:](self, "imageWithURLString:size:fileType:completion:", a3, CFSTR("jpeg"), a5, a4.width, a4.height);
}

- (void)imageWithURLString:(id)a3 size:(CGSize)a4 fileType:(id)a5 completion:(id)a6
{
  double height;
  double width;
  id v11;
  void *v12;
  NSURLSession *session;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  height = a4.height;
  width = a4.width;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIStorefrontCache _resolveURLString:size:fileType:](self, "_resolveURLString:size:fileType:", a3, a5, width, height));
  session = self->_session;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_7798;
  v16[3] = &unk_2E4090;
  v17 = v11;
  v14 = v11;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLSession dataTaskWithURL:completionHandler:](session, "dataTaskWithURL:completionHandler:", v12, v16));
  objc_msgSend(v15, "resume");

}

- (id)_resolveURLString:(id)a3 size:(CGSize)a4 fileType:(id)a5
{
  double height;
  double width;
  id v8;
  id v9;
  __CFString *v10;
  double v11;
  __CFString *v12;
  _BOOL4 v13;
  float v14;
  float v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v20;

  height = a4.height;
  width = a4.width;
  v8 = a5;
  v9 = objc_msgSend(a3, "mutableCopy");
  v10 = (__CFString *)v8;
  v12 = v10;
  if ((-[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("jpeg")) & 1) == 0)
  {
    v12 = v10;
    if ((-[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("png")) & 1) == 0)
    {

      v12 = CFSTR("jpeg");
    }
  }
  v13 = width <= 0.0;
  if (height <= 0.0)
    v13 = 1;
  v14 = width;
  if (v13)
    v14 = 100.0;
  v20 = llroundf(v14);
  if (v13)
    v15 = 100.0;
  else
    v15 = height;
  *(float *)&v11 = height;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v11, v20));
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{w}"), v16, 2, 0, objc_msgSend(v9, "length"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), llroundf(v15)));
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{h}"), v17, 2, 0, objc_msgSend(v9, "length"));

  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{f}"), v12, 2, 0, objc_msgSend(v9, "length"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v9));

  return v18;
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
}

@end
