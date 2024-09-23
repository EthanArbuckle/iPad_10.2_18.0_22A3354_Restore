@implementation NSItemProvider

void __88__NSItemProvider_SocialLayer__sl_loadRepresentationForTypeIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  SLSecurityScopedURL *v16;
  void *v17;
  void *v18;
  void *v19;
  SLSecurityScopedURL *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a2;
  objc_msgSend(*(id *)(a1 + 32), "typeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEC618], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  v6 = v26;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v26, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "typeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectWithItemProviderData:typeIdentifier:error:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = (void *)MEMORY[0x1E0CB3710];
      v12 = objc_opt_class();
      objc_msgSend(v26, "data");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "unarchivedObjectOfClass:fromData:error:", v12, v13, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v10, "isFileURL"))
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3910]), "initWithURL:readonly:", v10, 0);
      objc_msgSend(v26, "setUrlWrapper:", v14);

    }
    v6 = v26;
  }
  objc_msgSend(v6, "urlWrapper");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = [SLSecurityScopedURL alloc];
    objc_msgSend(v26, "urlWrapper");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "url");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "urlWrapper");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[SLSecurityScopedURL initWithURL:readonly:](v16, "initWithURL:readonly:", v18, objc_msgSend(v19, "isReadonly"));

  }
  else
  {
    v20 = 0;
  }

  objc_msgSend(v26, "data");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v26, "archivedObjectClass");
  v23 = objc_msgSend(v26, "wasOpenedInPlace");
  objc_msgSend(v26, "error");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[SLShareableContentLoadResult resultWithData:archivedObjectClass:urlWrapper:wasOpenedInPlace:error:](SLShareableContentLoadResult, "resultWithData:archivedObjectClass:urlWrapper:wasOpenedInPlace:error:", v21, v22, v20, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
