@implementation UIItemProvider

- (UIItemProvider)initWithPBItem:(id)a3 loadRequestContext:(id)a4 secureRetryHandler:(id)a5
{
  id v8;
  UIItemProvider *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id obj;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v33 = a4;
  v32 = a5;
  v42.receiver = self;
  v42.super_class = (Class)UIItemProvider;
  v9 = -[UIItemProvider init](&v42, sel_init);
  if (v9)
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(v8, "availableTypes");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v39 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v8, "representationConformingToType:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v8, "isDataAvailableImmediatelyForType:", v14))
            -[NSItemProvider setDataAvailability:forTypeIdentifier:](v9, "setDataAvailability:forTypeIdentifier:", 1, v14);
          if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v15, "isDerivedRepresentation"))
            -[NSItemProvider setDerivedRepresentation:forTypeIdentifier:](v9, "setDerivedRepresentation:forTypeIdentifier:", 1, v14);
          objc_msgSend(v8, "preferredRepresentationForType:", v14);
          v16 = PBNSPreferredRepresentationFromPB();
          v34[0] = MEMORY[0x1E0C809B0];
          v34[1] = 3221225472;
          v34[2] = __71__UIItemProvider_initWithPBItem_loadRequestContext_secureRetryHandler___block_invoke;
          v34[3] = &unk_1E16D9C70;
          v17 = v15;
          v35 = v17;
          v36 = v33;
          v37 = v32;
          -[UIItemProvider _addRepresentationType_v2:preferredRepresentation:loader:](v9, "_addRepresentationType_v2:preferredRepresentation:loader:", v14, v16, v34);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v18 = objc_msgSend(v17, "visibility");
            -[UIItemProvider _representationConformingToType:](v9, "_representationConformingToType:", v14);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setVisibility:", v18);

          }
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v11);
    }

    objc_msgSend(v8, "metadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "mutableCopy");

    v22 = *MEMORY[0x1E0D6C140];
    objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D6C140]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v21, "removeObjectForKey:", v22);
      -[UIItemProvider setSuggestedName:](v9, "setSuggestedName:", v23);
    }
    v24 = *MEMORY[0x1E0D6C148];
    objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D6C148]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(v21, "removeObjectForKey:", v24);
      -[NSItemProvider setTeamData:](v9, "setTeamData:", v25);
    }
    v26 = *MEMORY[0x1E0D6C130];
    objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D6C130]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      objc_msgSend(v21, "removeObjectForKey:", v26);
      -[UIItemProvider _setMetadataValue:forKey:](v9, "_setMetadataValue:forKey:", v27, v26);
    }
    v28 = *MEMORY[0x1E0D6C138];
    objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D6C138]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v21, "removeObjectForKey:", v28);
      -[UIItemProvider _setMetadataValue:forKey:](v9, "_setMetadataValue:forKey:", v29, v28);
    }
    if (objc_msgSend(v21, "count"))
      -[UIItemProvider _setMetadataValue:forKey:](v9, "_setMetadataValue:forKey:", v21, *MEMORY[0x1E0D6C128]);

  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamMetadata, 0);
}

id __71__UIItemProvider_initWithPBItem_loadRequestContext_secureRetryHandler___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD aBlock[4];
  id v19;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__UIItemProvider_initWithPBItem_loadRequestContext_secureRetryHandler___block_invoke_2;
  aBlock[3] = &unk_1E16D9C20;
  v19 = v4;
  v6 = v4;
  v7 = _Block_copy(aBlock);
  v8 = a1[4];
  v9 = a1[5];
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __71__UIItemProvider_initWithPBItem_loadRequestContext_secureRetryHandler___block_invoke_3;
  v13[3] = &unk_1E16D9C48;
  v16 = a1[6];
  v14 = a1[4];
  v15 = a1[5];
  v17 = v7;
  v10 = v7;
  objc_msgSend(v8, "loadWithContext:completionHandler:", v9, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __71__UIItemProvider_initWithPBItem_loadRequestContext_secureRetryHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v10 = (void *)MEMORY[0x1E0CB36D0];
  v11 = a6;
  v12 = a5;
  v13 = a2;
  objc_msgSend(a3, "nsURLWrapper");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resultWithData:urlWrapper:cleanupHandler:error:", v13, v14, v11, v12);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__UIItemProvider_initWithPBItem_loadRequestContext_secureRetryHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  unint64_t v11;
  unint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v11 | v12)
    goto LABEL_7;
  objc_msgSend(v14, "domain");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0D6C118]) || objc_msgSend(v14, "code") != 20)
  {

    goto LABEL_7;
  }
  v17 = *(_QWORD *)(a1 + 48);

  if (!v17)
  {
LABEL_7:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_8;
  }
  v18 = *(_QWORD *)(a1 + 48);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __71__UIItemProvider_initWithPBItem_loadRequestContext_secureRetryHandler___block_invoke_4;
  v19[3] = &unk_1E16BAD68;
  v20 = *(id *)(a1 + 32);
  v21 = *(id *)(a1 + 40);
  v22 = *(id *)(a1 + 56);
  (*(void (**)(uint64_t, _QWORD *))(v18 + 16))(v18, v19);

LABEL_8:
}

id __71__UIItemProvider_initWithPBItem_loadRequestContext_secureRetryHandler___block_invoke_4(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "loadWithContext:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (UIItemProvider)initWithPBItem:(id)a3
{
  return -[UIItemProvider initWithPBItem:loadRequestContext:secureRetryHandler:](self, "initWithPBItem:loadRequestContext:secureRetryHandler:", a3, 0, 0);
}

- (UIItemProvider)initWithPBItem:(id)a3 loadRequestContext:(id)a4
{
  return -[UIItemProvider initWithPBItem:loadRequestContext:secureRetryHandler:](self, "initWithPBItem:loadRequestContext:secureRetryHandler:", a3, a4, 0);
}

- (id)loadObjectOfClass:(Class)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  objc_super v9;
  _QWORD v10[4];
  id v11;

  v10[1] = 3221225472;
  v10[2] = __54__UIItemProvider_loadObjectOfClass_completionHandler___block_invoke;
  v10[3] = &unk_1E16D9C98;
  v11 = a4;
  v9.receiver = self;
  v9.super_class = (Class)UIItemProvider;
  v10[0] = MEMORY[0x1E0C809B0];
  v6 = v11;
  -[UIItemProvider loadObjectOfClass:completionHandler:](&v9, sel_loadObjectOfClass_completionHandler_, a3, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __54__UIItemProvider_loadObjectOfClass_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  char isKindOfClass;
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0C99E98], "_allowsCreationOfFileURLFromItemProvider") & 1) == 0)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v8 = v11;
      if (objc_msgSend(v8, "isFileURL"))
      {

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4864, 0);
        v9 = objc_claimAutoreleasedReturnValue();

        v10 = 0;
        v5 = (id)v9;
      }
      else
      {
        v10 = v8;
      }
      v11 = v10;

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_availableTypes
{
  void *v3;
  objc_super v5;

  if (objc_msgSend(MEMORY[0x1E0CB36C8], "instancesRespondToSelector:", sel__availableTypes))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIItemProvider;
    -[UIItemProvider _availableTypes](&v5, sel__availableTypes);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIItemProvider registeredTypeIdentifiers](self, "registeredTypeIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)canLoadObjectOfClass:(Class)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0;
  -[UIItemProvider _readableTypeIdentifiersForItemProviderForClass:](self, "_readableTypeIdentifiersForItemProviderForClass:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB36C8];
  -[UIItemProvider _availableTypes](self, "_availableTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_uikit_bestMatchConformingToTypes:availableTypes:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 != 0;

  return v9;
}

- (id)_readableTypeIdentifiersForItemProviderForClass:(Class)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[objc_class _uikit_readableTypeIdentifiersForItemProviderConsideringLinkage:](a3, "_uikit_readableTypeIdentifiersForItemProviderConsideringLinkage:", 0);
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[objc_class readableTypeIdentifiersForItemProvider](a3, "readableTypeIdentifiersForItemProvider");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = (void *)-[objc_class _ui_augmentingNSItemProviderReadingClass](a3, "_ui_augmentingNSItemProviderReadingClass");
    objc_msgSend(v7, "additionalLeadingReadableTypeIdentifiersForItemProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "additionalTrailingReadableTypeIdentifiersForItemProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
  }
  if (-[NSItemProvider hasDerivedRepresentations](self, "hasDerivedRepresentations"))
  {
    -[UIItemProvider registeredTypeIdentifiers](self, "registeredTypeIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v6, "mutableCopy");
    while (1)
    {
      objc_msgSend(MEMORY[0x1E0CB36C8], "_uikit_bestMatchConformingToTypes:availableTypes:", v13, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14
        || !-[NSItemProvider isDerivedRepresentationForTypeIdentifier:](self, "isDerivedRepresentationForTypeIdentifier:", v14))
      {
        break;
      }
      objc_msgSend(v13, "removeObject:", v14);

      if (!objc_msgSend(v13, "count"))
        goto LABEL_17;
    }

    if (objc_msgSend(v13, "count"))
    {
      v15 = v13;

      v6 = v15;
    }
LABEL_17:

  }
  if (v6)
    v16 = v6;
  else
    v16 = (void *)MEMORY[0x1E0C9AA60];
  v17 = v16;

  return v17;
}

- (id)_objectOfClass:(Class)a3 data:(id)a4 typeIdentifier:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;

  v9 = a4;
  v10 = a5;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend((id)-[objc_class _ui_augmentingNSItemProviderReadingClass](a3, "_ui_augmentingNSItemProviderReadingClass"), "objectWithItemProviderData:typeIdentifier:requestedClass:error:", v9, v10, a3, a6), (v11 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[objc_class objectWithItemProviderData:typeIdentifier:error:](a3, "objectWithItemProviderData:typeIdentifier:error:", v9, v10, a6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (void)registerDataRepresentationForTypeIdentifier:(id)a3 options:(id)a4 loadHandler:(id)a5
{
  -[UIItemProvider registerDataRepresentationForTypeIdentifier:visibility:loadHandler:](self, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", a3, 0, a5);
}

- (void)registerFileRepresentationForTypeIdentifier:(id)a3 fileOptions:(int64_t)a4 options:(id)a5 loadHandler:(id)a6
{
  -[UIItemProvider registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:](self, "registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:", a3, a4, 0, a6);
}

- (void)registerDataRepresentationForTypeIdentifier:(id)a3 loadHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__UIItemProvider_registerDataRepresentationForTypeIdentifier_loadHandler___block_invoke;
  v8[3] = &unk_1E16D9CC0;
  v9 = v6;
  v7 = v6;
  -[UIItemProvider registerDataRepresentationForTypeIdentifier:visibility:loadHandler:](self, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", a3, 0, v8);

}

uint64_t __74__UIItemProvider_registerDataRepresentationForTypeIdentifier_loadHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void (*v5)(uint64_t, _QWORD *, _QWORD);
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__UIItemProvider_registerDataRepresentationForTypeIdentifier_loadHandler___block_invoke_2;
  v8[3] = &unk_1E16D9A08;
  v9 = v3;
  v5 = *(void (**)(uint64_t, _QWORD *, _QWORD))(v4 + 16);
  v6 = v3;
  v5(v4, v8, 0);

  return 0;
}

uint64_t __74__UIItemProvider_registerDataRepresentationForTypeIdentifier_loadHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)registerFileRepresentationForTypeIdentifier:(id)a3 fileOptions:(int64_t)a4 loadHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86__UIItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_loadHandler___block_invoke;
  v10[3] = &unk_1E16D9CE8;
  v11 = v8;
  v9 = v8;
  -[UIItemProvider registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:](self, "registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:", a3, a4, 0, v10);

}

uint64_t __86__UIItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_loadHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void (*v5)(uint64_t, _QWORD *, _QWORD);
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__UIItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_loadHandler___block_invoke_2;
  v8[3] = &unk_1E16D8588;
  v9 = v3;
  v5 = *(void (**)(uint64_t, _QWORD *, _QWORD))(v4 + 16);
  v6 = v3;
  v5(v4, v8, 0);

  return 0;
}

uint64_t __86__UIItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_loadHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)copyDataRepresentationForTypeIdentifier:(id)a3 completionBlock:(id)a4
{
  -[UIItemProvider loadDataRepresentationForTypeIdentifier:completionHandler:](self, "loadDataRepresentationForTypeIdentifier:completionHandler:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)copyDataRepresentationForTypeIdentifier:(id)a3 options:(id)a4 completionBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v7 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__UIItemProvider_copyDataRepresentationForTypeIdentifier_options_completionBlock___block_invoke;
  v10[3] = &unk_1E16D9A08;
  v11 = v7;
  v8 = v7;
  v9 = (id)-[UIItemProvider loadDataRepresentationForTypeIdentifier:completionHandler:](self, "loadDataRepresentationForTypeIdentifier:completionHandler:", a3, v10);

}

uint64_t __82__UIItemProvider_copyDataRepresentationForTypeIdentifier_options_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)copyDataRepresentationForTypeIdentifier:(id)a3 error:(id *)a4
{
  return -[UIItemProvider copyDataRepresentationForTypeIdentifier:options:error:](self, "copyDataRepresentationForTypeIdentifier:options:error:", a3, 0, a4);
}

- (id)copyDataRepresentationForTypeIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  dispatch_semaphore_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v8 = a3;
  v9 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__147;
  v29 = __Block_byref_object_dispose__147;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__147;
  v23 = __Block_byref_object_dispose__147;
  v24 = 0;
  v10 = dispatch_semaphore_create(0);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__UIItemProvider_copyDataRepresentationForTypeIdentifier_options_error___block_invoke;
  v15[3] = &unk_1E16D9D10;
  v17 = &v25;
  v18 = &v19;
  v11 = v10;
  v16 = v11;
  -[UIItemProvider copyDataRepresentationForTypeIdentifier:options:completionBlock:](self, "copyDataRepresentationForTypeIdentifier:options:completionBlock:", v8, v9, v15);
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  if (a5)
  {
    v12 = (void *)v20[5];
    if (v12)
      *a5 = objc_retainAutorelease(v12);
  }
  v13 = (id)v26[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v13;
}

void __72__UIItemProvider_copyDataRepresentationForTypeIdentifier_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)copyFileRepresentationForTypeIdentifier:(id)a3 completionBlock:(id)a4
{
  -[UIItemProvider loadFileRepresentationForTypeIdentifier:completionHandler:](self, "loadFileRepresentationForTypeIdentifier:completionHandler:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)copyFileRepresentationForTypeIdentifier:(id)a3 toURL:(id)a4 options:(id)a5 completionBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v9 = a4;
  v10 = a6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __88__UIItemProvider_copyFileRepresentationForTypeIdentifier_toURL_options_completionBlock___block_invoke;
  v14[3] = &unk_1E16D9D38;
  v15 = v9;
  v16 = v10;
  v11 = v10;
  v12 = v9;
  v13 = (id)-[UIItemProvider loadFileRepresentationForTypeIdentifier:completionHandler:](self, "loadFileRepresentationForTypeIdentifier:completionHandler:", a3, v14);

}

void __88__UIItemProvider_copyFileRepresentationForTypeIdentifier_toURL_options_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v11 = 0;
    objc_msgSend(v8, "copyItemAtURL:toURL:error:", v5, v9, &v11);
    v7 = v11;

  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, BOOL, id))(v10 + 16))(v10, v7 == 0, v7);

}

- (id)copyFileRepresentationForTypeIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  _UITemporaryFileWithUniqueName(CFSTR("com.apple.UIKit.ItemProvider"), v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[UIItemProvider copyFileRepresentationForTypeIdentifier:toURL:options:error:](self, "copyFileRepresentationForTypeIdentifier:toURL:options:error:", v6, v7, 0, a4);

  if ((a4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeItemAtURL:error:", v7, 0);

    return 0;
  }
  return v7;
}

- (BOOL)copyFileRepresentationForTypeIdentifier:(id)a3 toURL:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  dispatch_semaphore_t v13;
  NSObject *v14;
  void *v15;
  char v16;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__147;
  v26 = __Block_byref_object_dispose__147;
  v27 = 0;
  v13 = dispatch_semaphore_create(0);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __78__UIItemProvider_copyFileRepresentationForTypeIdentifier_toURL_options_error___block_invoke;
  v18[3] = &unk_1E16D9D60;
  v20 = &v28;
  v21 = &v22;
  v14 = v13;
  v19 = v14;
  -[UIItemProvider copyFileRepresentationForTypeIdentifier:toURL:options:completionBlock:](self, "copyFileRepresentationForTypeIdentifier:toURL:options:completionBlock:", v10, v11, v12, v18);
  dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  if (a6)
  {
    v15 = (void *)v23[5];
    if (v15)
      *a6 = objc_retainAutorelease(v15);
  }
  v16 = *((_BYTE *)v29 + 24);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v16;
}

void __78__UIItemProvider_copyFileRepresentationForTypeIdentifier_toURL_options_error___block_invoke(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)getInPlaceFileRepresentationForTypeIdentifier:(id)a3 inPlace:(BOOL *)a4 error:(id *)a5
{
  return 0;
}

- (id)getInPlaceFileRepresentationForTypeIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  return 0;
}

- (void)registerObject:(id)a3 options:(id)a4
{
  -[UIItemProvider registerObject:visibility:](self, "registerObject:visibility:", a3, 0);
}

- (void)registerObjectOfClass:(Class)a3 options:(id)a4 loadHandler:(id)a5
{
  -[UIItemProvider registerObjectOfClass:visibility:loadHandler:](self, "registerObjectOfClass:visibility:loadHandler:", a3, 0, a5);
}

- (void)instantiateObjectOfClass:(Class)a3 options:(id)a4 completionBlock:(id)a5
{
  id v5;

  v5 = -[UIItemProvider loadObjectOfClass:completionHandler:](self, "loadObjectOfClass:completionHandler:", a3, a5);
}

- (id)createObjectOfClass:(Class)a3 error:(id *)a4
{
  return -[UIItemProvider instantiateObjectOfClass:options:error:](self, "instantiateObjectOfClass:options:error:", a3, 0, a4);
}

- (id)instantiateObjectOfClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  dispatch_semaphore_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__147;
  v28 = __Block_byref_object_dispose__147;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__147;
  v22 = __Block_byref_object_dispose__147;
  v23 = 0;
  v9 = dispatch_semaphore_create(0);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__UIItemProvider_instantiateObjectOfClass_options_error___block_invoke;
  v14[3] = &unk_1E16D9D88;
  v16 = &v24;
  v17 = &v18;
  v10 = v9;
  v15 = v10;
  -[UIItemProvider instantiateObjectOfClass:options:completionBlock:](self, "instantiateObjectOfClass:options:completionBlock:", a3, v8, v14);
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  if (a5)
  {
    v11 = (void *)v19[5];
    if (v11)
      *a5 = objc_retainAutorelease(v11);
  }
  v12 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

void __57__UIItemProvider_instantiateObjectOfClass_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (NSString)name
{
  return 0;
}

- (NSDate)modificationDate
{
  return 0;
}

- (NSNumber)size
{
  return 0;
}

- (NSDictionary)teamMetadata
{
  return self->_teamMetadata;
}

- (void)setTeamMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

@end
