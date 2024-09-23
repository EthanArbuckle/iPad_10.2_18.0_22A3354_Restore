@implementation WLPhotoLibrary

- (WLPhotoLibrary)init
{
  WLPhotoLibrary *v2;
  WLPhotoLibrary *v3;
  WLFileProvider *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSString *rootPath;
  id v11;
  void *v13;
  id v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WLPhotoLibrary;
  v2 = -[WLPhotoLibrary init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WLPhotoLibrary setContentType:](v2, "setContentType:", 0);
    v4 = objc_alloc_init(WLFileProvider);
    -[WLFileProvider fetchRootPath](v4, "fetchRootPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      WLLocalizedString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      -[WLPhotoLibrary setRootPath:](v3, "setRootPath:", v7);

      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v7) = objc_msgSend(v8, "fileExistsAtPath:", v3->_rootPath);

      if ((v7 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        rootPath = v3->_rootPath;
        v14 = 0;
        objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", rootPath, 0, 0, &v14);
        v11 = v14;

        if (v11)
        {
          objc_msgSend(v11, "description");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          _WLLog();

        }
      }
    }
    else
    {
      _WLLog();
    }

  }
  return v3;
}

- (WLPhotoLibrary)initWithContentType:(unint64_t)a3
{
  WLPhotoLibrary *v4;
  WLPhotoLibrary *v5;

  v4 = -[WLPhotoLibrary init](self, "init");
  v5 = v4;
  if (v4)
    -[WLPhotoLibrary setContentType:](v4, "setContentType:", a3);
  return v5;
}

- (void)addAsset:(id)a3 filename:(id)a4 size:(unint64_t)a5 collection:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id location;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (v12 && v13)
  {
    if (a5)
    {
      _WLLog();
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x24BDE35F0], "sharedPhotoLibrary", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = MEMORY[0x24BDAC760];
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __63__WLPhotoLibrary_addAsset_filename_size_collection_completion___block_invoke;
      v27[3] = &unk_24E376A70;
      objc_copyWeak(&v30, &location);
      v18 = v12;
      v28 = v18;
      v29 = v14;
      v22[0] = v17;
      v22[1] = 3221225472;
      v22[2] = __63__WLPhotoLibrary_addAsset_filename_size_collection_completion___block_invoke_2;
      v22[3] = &unk_24E3765E0;
      objc_copyWeak(&v26, &location);
      v23 = v18;
      v24 = v13;
      v25 = v15;
      objc_msgSend(v16, "performChanges:completionHandler:", v27, v22);

      objc_destroyWeak(&v26);
      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
    else
    {
      _WLLog();
      if (v15)
        (*((void (**)(id, uint64_t, _QWORD))v15 + 2))(v15, 1, 0);
    }
  }
  else
  {
    _WLLog();
    if (v15)
    {
      v19 = (void *)MEMORY[0x24BDD1540];
      v32 = *MEMORY[0x24BDD0FC8];
      v33[0] = CFSTR("WLPhotoLibrary did receive nil.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC2878], 1, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, _QWORD, void *))v15 + 2))(v15, 0, v21);
    }
  }

}

void __63__WLPhotoLibrary_addAsset_filename_size_collection_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "addAsset:collection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __63__WLPhotoLibrary_addAsset_filename_size_collection_completion___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3)
{
  id *v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;

  v5 = (id *)(a1 + 7);
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  v8 = a1[4];
  v9 = a1[5];
  v13 = v6;
  v10 = objc_msgSend(WeakRetained, "photoLibraryDidComplete:filename:success:error:", v8, v9, a2, &v13);
  v11 = v13;

  v12 = a1[6];
  if (v12)
    (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, v10, v11);

}

- (void)addAsset:(id)a3 collection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t contentType;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  if (v6)
  {
    -[WLPhotoLibrary assetCollectionChangeRequest:](self, "assetCollectionChangeRequest:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
    _WLLog();
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  contentType = self->_contentType;
  if (contentType == 1)
  {
    v13 = (void *)MEMORY[0x24BDE3490];
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "creationRequestForAssetFromVideoAtFileURL:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!contentType)
  {
    v10 = (void *)MEMORY[0x24BDE3490];
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "creationRequestForAssetFromImageAtFileURL:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v14 = (void *)v12;

    goto LABEL_10;
  }
  v16 = self->_contentType;
  _WLLog();
  v14 = 0;
LABEL_10:
  objc_msgSend(v14, "placeholderForCreatedAsset", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v15);

  objc_msgSend(v14, "placeholderForCreatedAsset");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  if (v8)
  {
    objc_msgSend(v7, "addAssets:", v8, v14, v17, v18);
    _WLLog();
  }

}

- (BOOL)photoLibraryDidComplete:(id)a3 filename:(id)a4 success:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  id v19;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *a6;
  _WLLog();

  if (v7)
    goto LABEL_3;
  ++self->_errorCount;
  v13 = -[WLPhotoLibrary copy:filename:error:](self, "copy:filename:error:", v10, v11, a6, v12, v19, v10);
  objc_msgSend(v10, "pathExtension");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lowercaseString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEC2850], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "photoLibraryDidFailWithExtension:", v15);

  if (v13)
  {
LABEL_3:
    *a6 = 0;
    v17 = 1;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)copy:(id)a3 filename:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSString *rootPath;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  int v21;
  void *v22;
  id *v24;
  void *v25;
  id v26;

  v8 = a3;
  v9 = a4;
  rootPath = self->_rootPath;
  if (rootPath)
  {
    -[NSString stringByAppendingPathComponent:](rootPath, "stringByAppendingPathComponent:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "fileExistsAtPath:", v11))
    {
      v24 = a5;
      v25 = v12;
      objc_msgSend(v9, "stringByDeletingPathExtension");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v9;
      objc_msgSend(v9, "pathExtension");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      while (1)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %ld"), v13, v15 + 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "length"))
        {
          objc_msgSend(v16, "stringByAppendingFormat:", CFSTR(".%@"), v14);
          v17 = objc_claimAutoreleasedReturnValue();

          v16 = (void *)v17;
        }
        -[NSString stringByAppendingPathComponent:](self->_rootPath, "stringByAppendingPathComponent:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "fileExistsAtPath:", v18);

        if ((v20 & 1) == 0)
          break;
        ++v15;
        v11 = v18;
        if (v15 == 2147483645)
        {

          LOBYTE(v21) = 0;
          v9 = v26;
          goto LABEL_15;
        }
      }

      v9 = v26;
      a5 = v24;
      v12 = v25;
    }
    else
    {
      v18 = v11;
    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v22, "moveItemAtPath:toPath:error:", v8, v18, a5);

    if (a5 && v21)
    {
      *a5 = 0;
      LOBYTE(v21) = 1;
    }
  }
  else
  {
    LOBYTE(v21) = 0;
  }
LABEL_15:

  return v21;
}

- (id)assetCollectionChangeRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("localizedTitle = %@"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(MEMORY[0x24BDE3498], "fetchAssetCollectionsWithType:subtype:options:", 1, 2, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(MEMORY[0x24BDE34A0], "changeRequestForAssetCollection:", v7);
  else
    objc_msgSend(MEMORY[0x24BDE34A0], "creationRequestForAssetCollectionWithTitle:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)errorCount
{
  return self->_errorCount;
}

- (void)setErrorCount:(unint64_t)a3
{
  self->_errorCount = a3;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(unint64_t)a3
{
  self->_contentType = a3;
}

- (NSString)rootPath
{
  return self->_rootPath;
}

- (void)setRootPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootPath, 0);
}

@end
