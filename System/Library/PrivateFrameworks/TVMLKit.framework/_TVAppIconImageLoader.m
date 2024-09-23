@implementation _TVAppIconImageLoader

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_8);
  return (id)sharedInstance_loader_1;
}

- (_TVAppIconImageLoader)init
{
  _TVAppIconImageLoader *v2;
  uint64_t v3;
  NSOperationQueue *imageLoaderQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVAppIconImageLoader;
  v2 = -[_TVAppIconImageLoader init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    imageLoaderQueue = v2->_imageLoaderQueue;
    v2->_imageLoaderQueue = (NSOperationQueue *)v3;

  }
  return v2;
}

- (id)URLForObject:(id)a3
{
  id v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = 0;
  if (v3 && (isKindOfClass & 1) != 0)
  {
    v6 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("app://%@"), v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLWithString:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)imageKeyForObject:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR("-2"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  id v20;

  v10 = a3;
  v11 = a8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v10;
  else
    v12 = 0;
  v13 = v12;
  v14 = v13;
  if (v13)
  {
    v15 = (void *)MEMORY[0x24BDD1478];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __113___TVAppIconImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke;
    v18[3] = &unk_24EB85610;
    v18[4] = self;
    v19 = v13;
    v20 = v11;
    objc_msgSend(v15, "blockOperationWithBlock:", v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue addOperation:](self->_imageLoaderQueue, "addOperation:", v16);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)cancelLoad:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "cancel");

}

- (id)_createApplicationIconForIdentifier:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = v5;

  v7 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(v3, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_applicationIconImageForBundleIdentifier:format:scale:", v8, 2, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 completionHandler:(id)a6
{
  return -[_TVAppIconImageLoader loadImageForObject:scaleToSize:cropToFit:imageDirection:completionHandler:](self, "loadImageForObject:scaleToSize:cropToFit:imageDirection:completionHandler:", a3, a5, 1, a6, a4.width, a4.height);
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 completionHandler:(id)a7
{
  return -[_TVAppIconImageLoader loadImageForObject:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:](self, "loadImageForObject:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:", a3, a5, a6, 0, a7, a4.width, a4.height);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageLoaderQueue, 0);
}

@end
