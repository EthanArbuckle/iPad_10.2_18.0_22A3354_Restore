@implementation DCDocument

- (DCDocument)initWithURL:(id)a3 annotation:(id)a4
{
  id v7;
  id v8;
  DCDocument *v9;
  uint64_t v10;
  NSURL *fileURL;
  DCDocument *v12;
  void *v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DCDocument.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileURL"));

  }
  v15.receiver = self;
  v15.super_class = (Class)DCDocument;
  v9 = -[DCDocument init](&v15, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    fileURL = v9->_fileURL;
    v9->_fileURL = (NSURL *)v10;

    objc_storeStrong(&v9->_annotation, a4);
    v12 = v9;
  }

  return v9;
}

- (void)openWithAppBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__DCDocument_openWithAppBundleIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E7AF8378;
  v11 = v6;
  v12 = v7;
  block[4] = self;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)openInDefaultAppWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__DCDocument_openInDefaultAppWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E7AF76F0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (id)annotation
{
  return self->_annotation;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_annotation, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

void __52__DCDocument_openInDefaultAppWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void *v9;
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__25804;
  v16 = __Block_byref_object_dispose__25805;
  v17 = 0;
  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __52__DCDocument_openInDefaultAppWithCompletionHandler___block_invoke_2;
  v9 = &unk_1E7AF03A0;
  v11 = &v12;
  v10 = *(id *)(a1 + 40);
  WFCreateDocumentInteractionController(v2, &v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v13[5];
  v13[5] = v3;

  objc_msgSend(*(id *)(a1 + 32), "annotation", v6, v7, v8, v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v13[5], "setAnnotation:", v5);

  objc_msgSend((id)v13[5], "openDocumentWithDefaultApplication");
  _Block_object_dispose(&v12, 8);

}

uint64_t __52__DCDocument_openInDefaultAppWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t result;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void __60__DCDocument_openWithAppBundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__25804;
  v18 = __Block_byref_object_dispose__25805;
  v19 = 0;
  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __60__DCDocument_openWithAppBundleIdentifier_completionHandler___block_invoke_6;
  v11 = &unk_1E7AF03A0;
  v13 = &v14;
  v12 = *(id *)(a1 + 48);
  WFCreateDocumentInteractionController(v2, &v8);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v15[5];
  v15[5] = v3;

  objc_msgSend(*(id *)(a1 + 32), "annotation", v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v15[5], "setAnnotation:", v5);

  v6 = (void *)v15[5];
  objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_openDocumentWithApplication:", v7);

  _Block_object_dispose(&v14, 8);
}

uint64_t __60__DCDocument_openWithAppBundleIdentifier_completionHandler___block_invoke_6(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t result;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

+ (id)documentWithURL:(id)a3
{
  id v3;
  DCDocument *v4;

  v3 = a3;
  v4 = -[DCDocument initWithURL:annotation:]([DCDocument alloc], "initWithURL:annotation:", v3, 0);

  return v4;
}

+ (id)documentWithURL:(id)a3 annotation:(id)a4
{
  id v5;
  id v6;
  DCDocument *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[DCDocument initWithURL:annotation:]([DCDocument alloc], "initWithURL:annotation:", v6, v5);

  return v7;
}

@end
