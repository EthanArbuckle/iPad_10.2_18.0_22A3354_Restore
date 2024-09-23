@implementation _VUIMonogramImageLoader

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_32);
  return (id)sharedInstance_sharedInstance_3;
}

- (_VUIMonogramImageLoader)init
{
  _VUIMonogramImageLoader *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSDictionary *generatorByType;
  objc_super v10;
  _QWORD v11[6];
  _QWORD v12[7];

  v12[6] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)_VUIMonogramImageLoader;
  v2 = -[_VUIMonogramImageLoader init](&v10, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    v11[0] = &unk_1EA0B92B0;
    v4 = (void *)objc_opt_new();
    v12[0] = v4;
    v11[1] = &unk_1EA0B92C8;
    v5 = (void *)objc_opt_new();
    v12[1] = v5;
    v11[2] = &unk_1EA0B92E0;
    v6 = (void *)objc_opt_new();
    v12[2] = v6;
    v12[3] = v3;
    v11[3] = &unk_1EA0B92F8;
    v11[4] = &unk_1EA0B9310;
    v11[5] = &unk_1EA0B9328;
    v12[4] = v3;
    v12[5] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 6);
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
    v6 = (void *)MEMORY[0x1E0CB37E8];
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
    if (+[_VUIMonogramAppleAccountImageGenerator isAppleAccountsURL:](_VUIMonogramAppleAccountImageGenerator, "isAppleAccountsURL:", v4))
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
  void *v23;
  NSDictionary *generatorByType;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  _QWORD aBlock[4];
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
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __115___VUIMonogramImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke;
    aBlock[3] = &unk_1E9F9B930;
    v32 = v17;
    v23 = _Block_copy(aBlock);
    generatorByType = self->_generatorByType;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22);
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
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DC6BA8], 107, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, _QWORD, _QWORD, void *))v23 + 2))(v23, 0, 0, 0, 0, v28);

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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](generatorByType, "objectForKey:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "cancelLoad:", v4);
}

- (id)_imageLoadError
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generatorByType, 0);
}

@end
