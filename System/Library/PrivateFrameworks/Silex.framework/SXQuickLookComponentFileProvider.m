@implementation SXQuickLookComponentFileProvider

- (SXQuickLookComponentFileProvider)initWithDOMObjectProvider:(id)a3 resourceDataSourceProvider:(id)a4 shareURLProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  SXQuickLookComponentFileProvider *v12;
  SXQuickLookComponentFileProvider *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXQuickLookComponentFileProvider;
  v12 = -[SXQuickLookComponentFileProvider init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_DOMObjectProvider, a3);
    objc_storeStrong((id *)&v13->_resourceDataSourceProvider, a4);
    objc_storeStrong((id *)&v13->_shareURLProvider, a5);
  }

  return v13;
}

- (void)fileForComponent:(id)a3 onCompletion:(id)a4 onError:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  SXQuickLookComponentFileProvider *v25;
  id v26;
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SXQuickLookComponentFileProvider DOMObjectProvider](self, "DOMObjectProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resourceIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resourceForIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXQuickLookComponentFileProvider resourceDataSourceProvider](self, "resourceDataSourceProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "resourceDataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __74__SXQuickLookComponentFileProvider_fileForComponent_onCompletion_onError___block_invoke;
  v23[3] = &unk_24D68B500;
  v24 = v8;
  v25 = self;
  v26 = v9;
  v27 = v10;
  v21[0] = v17;
  v21[1] = 3221225472;
  v21[2] = __74__SXQuickLookComponentFileProvider_fileForComponent_onCompletion_onError___block_invoke_3;
  v21[3] = &unk_24D68B528;
  v22 = v27;
  v18 = v27;
  v19 = v9;
  v20 = v8;
  objc_msgSend(v15, "fileURLForURL:onCompletion:onError:", v16, v23, v21);

}

void __74__SXQuickLookComponentFileProvider_fileForComponent_onCompletion_onError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__SXQuickLookComponentFileProvider_fileForComponent_onCompletion_onError___block_invoke_2;
  block[3] = &unk_24D68B4D8;
  v8 = *(id *)(a1 + 32);
  v9 = v3;
  v5 = *(void **)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = v5;
  v12 = *(id *)(a1 + 56);
  v6 = v3;
  dispatch_async(v4, block);

}

void __74__SXQuickLookComponentFileProvider_fileForComponent_onCompletion_onError___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  SXQuickLookFile *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  SXQuickLookFile *v20;
  void *v21;
  id v22;

  objc_msgSend(*(id *)(a1 + 32), "fileExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "fileExtension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingPathExtension:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }

  NSTemporaryDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v22 = 0;
  v11 = (void *)objc_msgSend(v9, "copyFileIfNeeded:to:error:", v10, v8, &v22);
  v12 = v22;
  if (v11)
  {
    v13 = [SXQuickLookFile alloc];
    objc_msgSend(*(id *)(a1 + 32), "caption");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "shareURLProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "shareURL");
    v16 = v8;
    v17 = v12;
    v18 = v7;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[SXQuickLookFile initWithFileURL:title:shareURL:](v13, "initWithFileURL:title:shareURL:", v11, v14, v19);

    v7 = v18;
    v12 = v17;
    v8 = v16;

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

uint64_t __74__SXQuickLookComponentFileProvider_fileForComponent_onCompletion_onError___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)copyFileIfNeeded:(id)a3 to:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  id v18;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "pathExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  v12 = v7;
  if ((v11 & 1) != 0)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "fileExistsAtPath:", v14);

  v12 = v8;
  if ((v15 & 1) != 0
    || (objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "copyItemAtURL:toURL:error:", v7, v8, a5),
        v16,
        v12 = v8,
        v17))
  {
LABEL_4:
    v18 = v12;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (SXResourceDataSourceProvider)resourceDataSourceProvider
{
  return self->_resourceDataSourceProvider;
}

- (SXDocumentShareURLProvider)shareURLProvider
{
  return self->_shareURLProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareURLProvider, 0);
  objc_storeStrong((id *)&self->_resourceDataSourceProvider, 0);
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
}

@end
