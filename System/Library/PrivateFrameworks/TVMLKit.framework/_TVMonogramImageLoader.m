@implementation _TVMonogramImageLoader

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_18);
  return (id)sharedInstance_sharedInstance;
}

- (_TVMonogramImageLoader)init
{
  _TVMonogramImageLoader *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSDictionary *generatorByType;
  objc_super v10;
  _QWORD v11[6];
  _QWORD v12[7];

  v12[6] = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)_TVMonogramImageLoader;
  v2 = -[_TVMonogramImageLoader init](&v10, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    v11[0] = &unk_24EBCCB20;
    v4 = (void *)objc_opt_new();
    v12[0] = v4;
    v11[1] = &unk_24EBCCB38;
    v5 = (void *)objc_opt_new();
    v12[1] = v5;
    v11[2] = &unk_24EBCCB50;
    v6 = (void *)objc_opt_new();
    v12[2] = v6;
    v12[3] = v3;
    v11[3] = &unk_24EBCCB68;
    v11[4] = &unk_24EBCCB80;
    v11[5] = &unk_24EBCCB98;
    v12[4] = v3;
    v12[5] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 6);
    v7 = objc_claimAutoreleasedReturnValue();
    generatorByType = v2->_generatorByType;
    v2->_generatorByType = (NSDictionary *)v7;

  }
  return v2;
}

- (id)imageKeyForObject:(id)a3
{
  id v4;
  NSDictionary *generatorByType;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    generatorByType = self->_generatorByType;
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = v4;
    objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "preferedMonogramType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](generatorByType, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "imageKeyForObject:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)URLForObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "imageURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[_TVMonogramAppleAccountImageGenerator isAppleAccountsURL:](_TVMonogramAppleAccountImageGenerator, "isAppleAccountsURL:", v4))
    {
      v5 = 0;
    }
    else
    {
      v5 = v4;
    }
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8
{
  _BOOL8 v11;
  double height;
  double width;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void (**v23)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  NSDictionary *generatorByType;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  _QWORD v31[4];
  id v32;

  v11 = a5;
  height = a4.height;
  width = a4.width;
  v15 = a3;
  v16 = a7;
  v17 = a8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = v15;
    v19 = v18;
    if (v16)
    {
      v20 = v16;
    }
    else
    {
      objc_msgSend(v18, "requestLoader");
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    v22 = objc_msgSend(v19, "preferedMonogramType", v20);
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __114___TVMonogramImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke;
    v31[3] = &unk_24EB86068;
    v32 = v17;
    v23 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x22767F470](v31);
    generatorByType = self->_generatorByType;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](generatorByType, "objectForKey:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = v30;
      objc_msgSend(v26, "loadImageForObject:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:", v19, v11, a6, v30, v23, width, height);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "tv_setGeneratorType:", v22);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TVMLKitErrorDomain"), 11, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, void *))v23)[2](v23, 0, 0, 0, 0, v28);

      v21 = 0;
      v27 = v30;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)cancelLoad:(id)a3
{
  id v4;
  uint64_t v5;
  NSDictionary *generatorByType;
  void *v7;
  id v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "tv_generatorType");
  generatorByType = self->_generatorByType;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](generatorByType, "objectForKey:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "cancelLoad:", v4);
}

- (id)_imageLoadError
{
  return (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -18, 0);
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 completionHandler:(id)a6
{
  return -[_TVMonogramImageLoader loadImageForObject:scaleToSize:cropToFit:imageDirection:completionHandler:](self, "loadImageForObject:scaleToSize:cropToFit:imageDirection:completionHandler:", a3, a5, 1, a6, a4.width, a4.height);
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 completionHandler:(id)a7
{
  return -[_TVMonogramImageLoader loadImageForObject:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:](self, "loadImageForObject:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:", a3, a5, a6, 0, a7, a4.width, a4.height);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generatorByType, 0);
}

@end
