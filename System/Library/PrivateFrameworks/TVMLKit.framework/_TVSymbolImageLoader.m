@implementation _TVSymbolImageLoader

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance_loader;
}

- (_TVSymbolImageLoader)init
{
  _TVSymbolImageLoader *v2;
  uint64_t v3;
  NSOperationQueue *imageLoaderQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVSymbolImageLoader;
  v2 = -[_TVSymbolImageLoader init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    imageLoaderQueue = v2->_imageLoaderQueue;
    v2->_imageLoaderQueue = (NSOperationQueue *)v3;

  }
  return v2;
}

- (BOOL)hasImageCache
{
  return 1;
}

- (id)imageKeyForObject:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "symbolName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageSymbolConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "stringByAppendingString:", CFSTR("_"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      _UIImageSymbolConfigurationTextualSummary();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "tv_MD5String");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByAppendingString:", v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)URLForObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "symbolName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("symbol://%@"), v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "URLWithString:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;

  v11 = a3;
  v12 = a7;
  v13 = a8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = 0;
    v16 = 0;
    goto LABEL_6;
  }
  v14 = v11;
  objc_msgSend(v14, "symbolName");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageSymbolConfiguration");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
LABEL_6:
    v20 = 0;
    goto LABEL_9;
  }
  -[_TVSymbolImageLoader URLForObject:](self, "URLForObject:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = v17;
  }
  else
  {
    v29 = (void *)MEMORY[0x24BDBCF48];
    v21 = (void *)MEMORY[0x24BDD17C8];
    -[_TVSymbolImageLoader imageKeyForObject:](self, "imageKeyForObject:", v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("imageKey://%@"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "URLWithString:", v23);
    v19 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v12, "recordForResource:withInitiator:", 3, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1840], "requestWithURL:", v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "willSendRequest:", v25);

  v26 = (void *)MEMORY[0x24BDD1478];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __112___TVSymbolImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke;
  v30[3] = &unk_24EB84930;
  v15 = v15;
  v31 = v15;
  v16 = v16;
  v32 = v16;
  v33 = v24;
  v34 = v13;
  v27 = v24;
  objc_msgSend(v26, "blockOperationWithBlock:", v30);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSOperationQueue addOperation:](self->_imageLoaderQueue, "addOperation:", v20);

LABEL_9:
  return v20;
}

- (void)cancelLoad:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "cancel");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageLoaderQueue, 0);
}

@end
