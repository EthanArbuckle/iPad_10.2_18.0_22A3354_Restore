@implementation SKUIJSModalDocumentController

- (SKUIJSModalDocumentController)initWithAppContext:(id)a3 modalDocumentController:(id)a4
{
  id v6;
  SKUIJSModalDocumentController *v7;
  id v8;
  objc_super v10;
  id location;

  v6 = a3;
  objc_initWeak(&location, a4);
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIJSModalDocumentController initWithAppContext:modalDocumentController:].cold.1();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIJSModalDocumentController;
  v7 = -[IKJSObject initWithAppContext:](&v10, sel_initWithAppContext_, v6);
  if (v7)
  {
    v8 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v7->_modalDocumentController, v8);

  }
  objc_destroyWeak(&location);

  return v7;
}

- (SKUIModalDocumentController)modalDocumentController
{
  return (SKUIModalDocumentController *)objc_loadWeakRetained((id *)&self->_modalDocumentController);
}

- (NSArray)documents
{
  void *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__102;
  v11 = __Block_byref_object_dispose__102;
  v12 = 0;
  -[IKJSObject appContext](self, "appContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__SKUIJSModalDocumentController_documents__block_invoke;
  v6[3] = &unk_1E73A8998;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "evaluateDelegateBlockSync:", v6);

  objc_msgSend((id)v8[5], "valueForKey:", CFSTR("jsDocument"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __42__SKUIJSModalDocumentController_documents__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "documents");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)popDocument
{
  void *v3;
  _QWORD v4[5];

  -[IKJSObject appContext](self, "appContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__SKUIJSModalDocumentController_popDocument__block_invoke;
  v4[3] = &unk_1E73A29C0;
  v4[4] = self;
  objc_msgSend(v3, "evaluateDelegateBlockSync:", v4);

}

void __44__SKUIJSModalDocumentController_popDocument__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "popDocument");

}

- (void)pushDocument:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  -[IKJSObject appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && objc_msgSend(MEMORY[0x1E0D3A5E8], "instancesRespondToSelector:", sel_initWithAppContext_document_owner_))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A5E8]), "initWithAppContext:document:owner:", v8, v6, self);
  }
  else
  {
    v9 = 0;
  }
  -[SKUIJSModalDocumentController _adjustedOptionsWithOptions:](self, "_adjustedOptionsWithOptions:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__102;
  v23 = __Block_byref_object_dispose__102;
  v24 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __47__SKUIJSModalDocumentController_pushDocument::__block_invoke;
  v14[3] = &unk_1E73A97B8;
  v14[4] = self;
  v11 = v9;
  v15 = v11;
  v12 = v10;
  v16 = v12;
  v18 = &v19;
  v13 = v8;
  v17 = v13;
  objc_msgSend(v13, "evaluateDelegateBlockSync:", v14);
  objc_msgSend(v6, "setNavigationDocument:", v20[5]);

  _Block_object_dispose(&v19, 8);
}

void __47__SKUIJSModalDocumentController_pushDocument::__block_invoke(_QWORD *a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
  objc_msgSend(WeakRetained, "pushDocument:options:", a1[5], a1[6]);

  v3 = objc_loadWeakRetained((id *)(a1[4] + 24));
  objc_msgSend(v3, "navigationDocumentForDocument:", a1[5]);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D3A6B0]), "initWithAppContext:navigationController:", a1[7], v7);
    v5 = *(_QWORD *)(a1[8] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

- (void)replaceDocument:(id)a3 :(id)a4 :(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[IKJSObject appContext](self, "appContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    && objc_msgSend(MEMORY[0x1E0D3A5E8], "instancesRespondToSelector:", sel_initWithAppContext_document_owner_))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A5E8]), "initWithAppContext:document:owner:", v11, v8, self);
  }
  else
  {
    v12 = 0;
  }
  -[SKUIJSModalDocumentController _adjustedOptionsWithOptions:](self, "_adjustedOptionsWithOptions:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__102;
  v35 = __Block_byref_object_dispose__102;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__102;
  v29 = __Block_byref_object_dispose__102;
  v30 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __51__SKUIJSModalDocumentController_replaceDocument_::__block_invoke;
  v18[3] = &unk_1E73A97E0;
  v18[4] = self;
  v14 = v9;
  v19 = v14;
  v23 = &v31;
  v15 = v12;
  v20 = v15;
  v16 = v13;
  v21 = v16;
  v24 = &v25;
  v17 = v11;
  v22 = v17;
  objc_msgSend(v17, "evaluateDelegateBlockSync:", v18);
  if (v32[5])
    objc_msgSend(v17, "setException:withErrorMessage:", 0);
  else
    objc_msgSend(v8, "setNavigationDocument:", v26[5]);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

}

void __51__SKUIJSModalDocumentController_replaceDocument_::__block_invoke(_QWORD *a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
  objc_msgSend(WeakRetained, "documents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
      objc_msgSend(v9, "valueForKey:", CFSTR("jsDocument"), (_QWORD)v20);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqual:", a1[5]);

      if ((v11 & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v12 = v9;

    if (!v12)
      goto LABEL_14;
    v13 = objc_loadWeakRetained((id *)(a1[4] + 24));
    objc_msgSend(v13, "replaceDocument:withDocument:options:", v12, a1[6], a1[7]);

    v14 = objc_loadWeakRetained((id *)(a1[4] + 24));
    objc_msgSend(v14, "navigationDocumentForDocument:", a1[6]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D3A6B0]), "initWithAppContext:navigationController:", a1[8], v15);
      v17 = *(_QWORD *)(a1[10] + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;

    }
  }
  else
  {
LABEL_9:

LABEL_14:
    v19 = *(_QWORD *)(a1[9] + 8);
    v12 = *(id *)(v19 + 40);
    *(_QWORD *)(v19 + 40) = CFSTR("Old document not found");
  }

}

- (id)_adjustedOptionsWithOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v3, "objectForKey:", CFSTR("sourceElement"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "getAttribute:", CFSTR("itmlID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("sourceElement"));
    else
      objc_msgSend(v4, "removeObjectForKey:", CFSTR("sourceElement"));

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_modalDocumentController);
}

- (void)initWithAppContext:modalDocumentController:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIJSModalDocumentController initWithAppContext:modalDocumentController:]";
}

@end
