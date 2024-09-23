@implementation _TVResourceImageLoader

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_6);
  return (id)sharedInstance_loader_0;
}

- (_TVResourceImageLoader)init
{
  _TVResourceImageLoader *v2;
  uint64_t v3;
  NSOperationQueue *imageLoaderQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVResourceImageLoader;
  v2 = -[_TVResourceImageLoader init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    imageLoaderQueue = v2->_imageLoaderQueue;
    v2->_imageLoaderQueue = (NSOperationQueue *)v3;

  }
  return v2;
}

- (id)imageKeyForObject:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
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
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("resource://%@"), v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLWithString:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  _BOOL8 v35;

  v12 = a3;
  v13 = a7;
  v14 = a8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v12;
  else
    v15 = 0;
  v16 = v15;
  v17 = a6 == 1;
  if (v16)
  {
    -[_TVResourceImageLoader URLForObject:](self, "URLForObject:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = v18;
    }
    else
    {
      v22 = (void *)MEMORY[0x24BDBCF48];
      v23 = (void *)MEMORY[0x24BDD17C8];
      -[_TVResourceImageLoader imageKeyForObject:](self, "imageKeyForObject:", v12);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("imageKey://%@"), v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "URLWithString:", v25);
      v20 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v13, "recordForResource:withInitiator:", 3, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1840], "requestWithURL:", v20);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "willSendRequest:", v27);

    v28 = (void *)MEMORY[0x24BDD1478];
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __114___TVResourceImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke;
    v31[3] = &unk_24EB85588;
    v35 = v17;
    v32 = v16;
    v33 = v26;
    v34 = v14;
    v29 = v26;
    objc_msgSend(v28, "blockOperationWithBlock:", v31);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue addOperation:](self->_imageLoaderQueue, "addOperation:", v21);

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)cancelLoad:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "cancel");

}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 completionHandler:(id)a6
{
  return -[_TVResourceImageLoader loadImageForObject:scaleToSize:cropToFit:imageDirection:completionHandler:](self, "loadImageForObject:scaleToSize:cropToFit:imageDirection:completionHandler:", a3, a5, 1, a6, a4.width, a4.height);
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 completionHandler:(id)a7
{
  return -[_TVResourceImageLoader loadImageForObject:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:](self, "loadImageForObject:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:", a3, a5, a6, 0, a7, a4.width, a4.height);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageLoaderQueue, 0);
}

@end
