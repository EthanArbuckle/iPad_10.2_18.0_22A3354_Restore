@implementation WFOnScreenContentManager

- (void)getOnScreenContentWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  void *v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)os_transaction_create();
  v17 = 0;
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    v18 = xmmword_1E7AA8010;
    v19 = 0;
    UIKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    self = (WFOnScreenContentManager *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *UIKitLibrary(void)");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[WFOnScreenContentManager handleFailureInFunction:file:lineNumber:description:](self, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("WFOnScreenContentManager.m"), 33, CFSTR("%s"), v17);

    __break(1u);
    free(v12);
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__WFOnScreenContentManager_getOnScreenContentWithOptions_completionHandler___block_invoke;
  v13[3] = &unk_1E7AA7EE8;
  v13[4] = self;
  v14 = v6;
  v15 = v8;
  v16 = v7;
  v9 = v8;
  v10 = v6;
  v11 = v7;
  -[WFOnScreenContentManager getNodeForGlobalUserActivityWithCompletionHandler:](self, "getNodeForGlobalUserActivityWithCompletionHandler:", v13);

}

- (void)getOnScreenContentWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__WFOnScreenContentManager_getOnScreenContentWithOptions_completion___block_invoke;
  v8[3] = &unk_1E7AA7F10;
  v9 = v6;
  v7 = v6;
  -[WFOnScreenContentManager getOnScreenContentWithOptions:completionHandler:](self, "getOnScreenContentWithOptions:completionHandler:", a3, v8);

}

- (void)getContentForLayoutElement:(id)a3 serviceOptions:(id)a4 completionHandler:(id)a5
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v7 = a5;
  v8 = (objc_class *)MEMORY[0x1E0CBD8E8];
  v9 = a4;
  v10 = a3;
  v11 = [v8 alloc];
  objc_msgSend(v10, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithSceneIdentifier:serviceOptions:", v12, v9);

  v14 = objc_alloc(MEMORY[0x1E0CBD740]);
  objc_msgSend(v10, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(v14, "initWithBundleIdentifier:intentForwardingAction:", v15, v13);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __88__WFOnScreenContentManager_getContentForLayoutElement_serviceOptions_completionHandler___block_invoke;
  v18[3] = &unk_1E7AA7F38;
  v19 = v7;
  v17 = v7;
  objc_msgSend(v16, "deliverIntentForwardingActionWithResponseHandler:", v18);

}

- (void)getVisibleApplicationsWithCompletionHandler:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  FBSDisplayLayoutMonitor *v9;
  FBSDisplayLayoutMonitor *layoutMonitor;
  FBSDisplayLayoutMonitor *v11;
  WFDebouncer *debouncer;
  id v13;
  void *v14;
  id visibleApplicationFetchCompletionHandler;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, int, id);
  void *v19;
  WFOnScreenContentManager *v20;
  id v21;

  v4 = (objc_class *)MEMORY[0x1E0DD9D10];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithDelay:maximumDelay:queue:", 0, 0.2, 0.5);
  objc_msgSend(v6, "addTarget:action:", self, sel_finishGettingVisibleApplications);
  objc_msgSend(MEMORY[0x1E0D230E0], "configurationForDefaultMainDisplayMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __72__WFOnScreenContentManager_getVisibleApplicationsWithCompletionHandler___block_invoke;
  v19 = &unk_1E7AA7F60;
  v20 = self;
  v8 = v6;
  v21 = v8;
  objc_msgSend(v7, "setTransitionHandler:", &v16);
  objc_msgSend(v7, "setNeedsUserInteractivePriority:", 1, v16, v17, v18, v19, v20);
  objc_msgSend(MEMORY[0x1E0D230D0], "monitorWithConfiguration:", v7);
  v9 = (FBSDisplayLayoutMonitor *)objc_claimAutoreleasedReturnValue();
  layoutMonitor = self->_layoutMonitor;
  self->_layoutMonitor = v9;
  v11 = v9;

  debouncer = self->_debouncer;
  self->_debouncer = (WFDebouncer *)v8;
  v13 = v8;

  v14 = (void *)objc_msgSend(v5, "copy");
  visibleApplicationFetchCompletionHandler = self->_visibleApplicationFetchCompletionHandler;
  self->_visibleApplicationFetchCompletionHandler = v14;

}

- (void)finishGettingVisibleApplications
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;

  -[WFOnScreenContentManager layoutMonitor](self, "layoutMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[WFOnScreenContentManager setLayoutMonitor:](self, "setLayoutMonitor:", 0);
  -[WFOnScreenContentManager setDebouncer:](self, "setDebouncer:", 0);
  -[WFOnScreenContentManager visibleApplicationFetchCompletionHandler](self, "visibleApplicationFetchCompletionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFOnScreenContentManager visibleApplicationFetchCompletionHandler](self, "visibleApplicationFetchCompletionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[WFOnScreenContentManager lastSeenLayout](self, "lastSeenLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFOnScreenContentManager visibleApplicationsFromLayout:](self, "visibleApplicationsFromLayout:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v5)[2](v5, v7, 0);

    -[WFOnScreenContentManager setVisibleApplicationFetchCompletionHandler:](self, "setVisibleApplicationFetchCompletionHandler:", 0);
  }
}

- (id)visibleApplicationsFromLayout:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "elements"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6))
  {
    objc_msgSend(v4, "elements");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "if_compactMap:", &__block_literal_global_6479);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (void)getNodeForGlobalUserActivityWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0DC5EB8];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__WFOnScreenContentManager_getNodeForGlobalUserActivityWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E7AA7FF0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "currentUserActivityUUIDWithOptions:completionHandler:", 0, v6);

}

- (WFDebouncer)debouncer
{
  return self->_debouncer;
}

- (void)setDebouncer:(id)a3
{
  objc_storeStrong((id *)&self->_debouncer, a3);
}

- (FBSDisplayLayoutMonitor)layoutMonitor
{
  return self->_layoutMonitor;
}

- (void)setLayoutMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_layoutMonitor, a3);
}

- (id)visibleApplicationFetchCompletionHandler
{
  return self->_visibleApplicationFetchCompletionHandler;
}

- (void)setVisibleApplicationFetchCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (FBSDisplayLayout)lastSeenLayout
{
  return self->_lastSeenLayout;
}

- (void)setLastSeenLayout:(id)a3
{
  objc_storeStrong((id *)&self->_lastSeenLayout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSeenLayout, 0);
  objc_storeStrong(&self->_visibleApplicationFetchCompletionHandler, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_debouncer, 0);
}

void __78__WFOnScreenContentManager_getNodeForGlobalUserActivityWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a3;
  if (a2)
  {
    v6 = (void *)MEMORY[0x1E0DC5EB8];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __78__WFOnScreenContentManager_getNodeForGlobalUserActivityWithCompletionHandler___block_invoke_2;
    v7[3] = &unk_1E7AA7FC8;
    v9 = *(id *)(a1 + 32);
    v8 = v5;
    objc_msgSend(v6, "fetchUserActivityWithUUID:completionHandler:", a2, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __78__WFOnScreenContentManager_getNodeForGlobalUserActivityWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id WFContentItemClass;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t);
  void *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_32;
  }
  objc_msgSend(v5, "typeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.mobileslideshow.oneUp")) & 1) != 0)
    goto LABEL_5;
  objc_msgSend(v5, "typeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.Photos.oneUp")))
  {

LABEL_5:
    goto LABEL_6;
  }
  objc_msgSend(v5, "typeIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("com.apple.screenshotservices.sirisharing"));

  if ((v23 & 1) == 0)
  {
    objc_msgSend(v5, "typeIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("com.apple.Contacts.ViewingCard"));

    if (v25)
    {
      objc_msgSend(v5, "userInfo");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKey:", CFSTR("contact-identifier"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v47 = 0;
        v48 = &v47;
        v49 = 0x2050000000;
        v28 = (void *)getWFCNContactStoreClass_softClass;
        v50 = getWFCNContactStoreClass_softClass;
        if (!getWFCNContactStoreClass_softClass)
        {
          v42 = MEMORY[0x1E0C809B0];
          v43 = 3221225472;
          v44 = __getWFCNContactStoreClass_block_invoke;
          v45 = &unk_1E7AA8030;
          v46 = &v47;
          __getWFCNContactStoreClass_block_invoke((uint64_t)&v42);
          v28 = (void *)v48[3];
        }
        v29 = objc_retainAutorelease(v28);
        _Block_object_dispose(&v47, 8);
        v30 = (void *)objc_opt_new();
        objc_msgSend(v30, "contactWithIdentifier:", v27);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          objc_msgSend(getWFContentItemClass(), "itemWithObject:", v31);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

      v32 = 0;
      v17 = 0;
    }
    else
    {
      objc_msgSend(v5, "typeIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("com.apple.Messages"));

      if (v40)
      {
        objc_msgSend(v5, "userInfo");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectForKey:", CFSTR("__kIMChatRegistryContinuityURLKey"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v32 = 0;
      }
      v17 = 0;
      v14 = 0;
    }
    goto LABEL_24;
  }
LABEL_6:
  objc_msgSend(v5, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("selectedUUIDs"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v47 = 0;
    v48 = &v47;
    v49 = 0x2050000000;
    v12 = (void *)getWFPhotoMediaContentItemClass_softClass;
    v50 = getWFPhotoMediaContentItemClass_softClass;
    if (!getWFPhotoMediaContentItemClass_softClass)
    {
      v42 = MEMORY[0x1E0C809B0];
      v43 = 3221225472;
      v44 = __getWFPhotoMediaContentItemClass_block_invoke;
      v45 = &unk_1E7AA8030;
      v46 = &v47;
      __getWFPhotoMediaContentItemClass_block_invoke((uint64_t)&v42);
      v12 = (void *)v48[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v47, 8);
    objc_msgSend(v13, "itemWithAssetIdentifier:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "asset");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "mainFileURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v18 = (void *)MEMORY[0x1E0CBD8A8];
        objc_msgSend(v16, "mainFileURL");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "filename");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "uniformTypeIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "fileWithFileURL:filename:typeIdentifier:", v19, v20, v21);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
    v14 = 0;
  }

  v32 = 0;
LABEL_24:
  objc_msgSend(v5, "webpageURL");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    WFContentItemClass = getWFContentItemClass();
    objc_msgSend(v5, "webpageURL");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WFContentItemClass, "itemWithObject:", v35);
    v36 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v36;
  }
  if (v14 || v17 || v32)
  {
    v37 = objc_alloc(MEMORY[0x1E0DC7BF8]);
    v38 = (void *)objc_msgSend(v37, "initWithContentItem:file:applicationBundleIdentifier:source:", v14, v17, *(_QWORD *)(a1 + 32), *MEMORY[0x1E0DC8268]);
    objc_msgSend(v38, "setChatRegistryContinuityKey:", v32);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

LABEL_32:
}

id __58__WFOnScreenContentManager_visibleApplicationsFromLayout___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (objc_msgSend(v2, "isUIApplicationElement"))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

void __72__WFOnScreenContentManager_getVisibleApplicationsWithCompletionHandler___block_invoke(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), obj);
  v5 = obj;
  objc_msgSend(*(id *)(a1 + 40), "poke");

}

void __88__WFOnScreenContentManager_getContentForLayoutElement_serviceOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "node");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v3 + 16))(v3, v4, v5);

  }
  else
  {

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __69__WFOnScreenContentManager_getOnScreenContentWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC7BF0]);
    objc_msgSend(v7, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "file");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithURL:file:", v4, v5);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __76__WFOnScreenContentManager_getOnScreenContentWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;

  v5 = a2;
  v6 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__6494;
  v19[4] = __Block_byref_object_dispose__6495;
  v7 = v5;
  v20 = v7;
  v8 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__WFOnScreenContentManager_getOnScreenContentWithOptions_completionHandler___block_invoke_122;
  v12[3] = &unk_1E7AA7EC0;
  v17 = *(id *)(a1 + 56);
  v18 = v19;
  v9 = v7;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = *(id *)(a1 + 48);
  objc_msgSend(v8, "getVisibleApplicationsWithCompletionHandler:", v12);

  _Block_object_dispose(v19, 8);
}

void __76__WFOnScreenContentManager_getOnScreenContentWithOptions_completionHandler___block_invoke_122(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  __int128 v10;
  _QWORD v11[4];
  id v12;
  __int128 v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "applicationBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2] = __76__WFOnScreenContentManager_getOnScreenContentWithOptions_completionHandler___block_invoke_2;
    v14[3] = &unk_1E7AA7E70;
    v18 = *(_QWORD *)(a1 + 72);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(a1 + 48);
    v15 = v4;
    v16 = v5;
    v7 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v17 = v6;
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __76__WFOnScreenContentManager_getOnScreenContentWithOptions_completionHandler___block_invoke_3;
    v11[3] = &unk_1E7AA7E98;
    v10 = *(_OWORD *)(a1 + 64);
    v8 = (id)v10;
    v13 = v10;
    v12 = *(id *)(a1 + 56);
    v9 = v4;
    objc_msgSend(v3, "if_mapAsynchronously:completionHandler:", v14, v11);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __76__WFOnScreenContentManager_getOnScreenContentWithOptions_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;

  v27 = a2;
  v6 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    objc_msgSend(v27, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if (v8)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "chatRegistryContinuityKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc(MEMORY[0x1E0DC7BF8]);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "contentItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "file");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "applicationBundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "frame");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v27, "level"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "source");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v10, "initWithContentItem:file:applicationBundleIdentifier:applicationFrame:applicationLevel:source:linkPresentationMetadata:", v11, v12, v13, v22, v23, 0, v15, v17, v19, v21);
      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v26 = *(void **)(v25 + 40);
      *(_QWORD *)(v25 + 40) = v24;

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setChatRegistryContinuityKey:", v9);
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "getContentForLayoutElement:serviceOptions:completionHandler:", v27, *(_QWORD *)(a1 + 48), v6);

}

void __76__WFOnScreenContentManager_getOnScreenContentWithOptions_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v12 = v3;
  if (v4)
  {
    v5 = v3;
LABEL_5:
    objc_msgSend(v4, "addChildren:", v5);
    goto LABEL_6;
  }
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0DC7BF8]);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v5 = v12;
    goto LABEL_5;
  }
  if (objc_msgSend(v12, "count") == 1)
  {
    objc_msgSend(v12, "firstObject");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
LABEL_6:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
