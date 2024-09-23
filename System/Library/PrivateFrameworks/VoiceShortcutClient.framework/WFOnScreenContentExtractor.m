@implementation WFOnScreenContentExtractor

- (void)handleAction:(id)a3 completionHandler:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  id v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void (**v28)(id, void *);
  void *v29;
  id obj;
  id v32;
  void *v33;
  _QWORD v34[4];
  void (**v35)(id, void *);
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  WFOnScreenContentNode *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v28 = (void (**)(id, void *))a4;
  v47 = 0;
  v48 = &v47;
  v49 = 0x2050000000;
  v5 = (void *)getUIApplicationClass_softClass;
  v50 = getUIApplicationClass_softClass;
  if (!getUIApplicationClass_softClass)
  {
    v37 = MEMORY[0x1E0C809B0];
    v38 = 3221225472;
    v39 = (uint64_t)__getUIApplicationClass_block_invoke;
    v40 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E5FC8858;
    v41 = (void (*)(uint64_t))&v47;
    __getUIApplicationClass_block_invoke((uint64_t)&v37);
    v5 = (void *)v48[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v47, 8);
  objc_msgSend(v6, "sharedApplication");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "connectedScenes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (!v8)
  {

    v33 = 0;
LABEL_23:
    -[WFOnScreenContentExtractor responseWithError:](self, "responseWithError:", 0, v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2](v28, v27);

    v9 = 0;
    goto LABEL_24;
  }
  v33 = 0;
  v9 = 0;
  v10 = *(_QWORD *)v44;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v44 != v10)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
      v47 = 0;
      v48 = &v47;
      v49 = 0x2050000000;
      v13 = (void *)getUIWindowSceneClass_softClass;
      v50 = getUIWindowSceneClass_softClass;
      if (!getUIWindowSceneClass_softClass)
      {
        v37 = MEMORY[0x1E0C809B0];
        v38 = 3221225472;
        v39 = (uint64_t)__getUIWindowSceneClass_block_invoke;
        v40 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E5FC8858;
        v41 = (void (*)(uint64_t))&v47;
        __getUIWindowSceneClass_block_invoke((uint64_t)&v37);
        v13 = (void *)v48[3];
      }
      v14 = objc_retainAutorelease(v13);
      _Block_object_dispose(&v47, 8);
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v12;
      else
        v15 = 0;
      v16 = v15;
      v17 = v16;
      if (v16)
      {
        objc_msgSend(v16, "_FBSScene");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "sceneIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "isEqualToString:", v20);

        if (v21)
        {
          v22 = v17;

          v23 = v18;
          v33 = v23;
        }
        else
        {
          v12 = v9;
        }

        v9 = v12;
      }

    }
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  }
  while (v8);

  if (!v9)
    goto LABEL_23;
  -[WFOnScreenContentExtractor applicationFrameForScene:](self, "applicationFrameForScene:", v33);
  -[WFOnScreenContentExtractor setApplicationFrame:](self, "setApplicationFrame:");
  objc_msgSend(v33, "settings");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "level");
  -[WFOnScreenContentExtractor setApplicationLevel:](self, "setApplicationLevel:", (uint64_t)v25);

  v37 = 0;
  v38 = (uint64_t)&v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__16414;
  v41 = __Block_byref_object_dispose__16415;
  v42 = objc_alloc_init(WFOnScreenContentNode);
  objc_msgSend(v32, "serviceOptions");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __61__WFOnScreenContentExtractor_handleAction_completionHandler___block_invoke;
  v34[3] = &unk_1E5FC7E68;
  v36 = &v37;
  v35 = v28;
  -[WFOnScreenContentExtractor loadActivityItemsConfigurationItemsForScene:serviceOptions:completionHandler:](self, "loadActivityItemsConfigurationItemsForScene:serviceOptions:completionHandler:", v9, v26, v34);

  _Block_object_dispose(&v37, 8);
LABEL_24:

}

- (CGRect)applicationFrameForScene:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  objc_msgSend(a3, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (objc_msgSend(v3, "interfaceOrientation") == 1
    || objc_msgSend(v3, "interfaceOrientation") == 2
    || objc_msgSend(v3, "interfaceOrientation") != 4 && objc_msgSend(v3, "interfaceOrientation") != 3)
  {
    v12 = v9;
    v9 = v11;
  }
  else
  {
    v12 = v11;
  }

  v13 = v5;
  v14 = v7;
  v15 = v12;
  v16 = v9;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)loadActivityItemsConfigurationItemsForScene:(id)a3 serviceOptions:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  WFOnScreenContentExtractor *v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFOnScreenContentExtractor activityItemsConfigurationFromScene:](self, "activityItemsConfigurationFromScene:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "itemProvidersForActivityItemsConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__16414;
    v19[4] = __Block_byref_object_dispose__16415;
    objc_msgSend(v9, "supportedItemClasses");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)objc_msgSend(v13, "copy");

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __107__WFOnScreenContentExtractor_loadActivityItemsConfigurationItemsForScene_serviceOptions_completionHandler___block_invoke;
    v14[3] = &unk_1E5FC7F48;
    v18 = v19;
    v15 = v9;
    v16 = v11;
    v17 = self;
    objc_msgSend(v12, "if_mapAsynchronously:completionHandler:", v14, v10);

    _Block_object_dispose(v19, 8);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }

}

- (id)activityItemsConfigurationFromScene:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v3, "windows", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v10, "isKeyWindow"))
        {
          v11 = v10;

          v7 = v11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  objc_msgSend(v7, "_focusResponder");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    while (1)
    {
      objc_msgSend(v13, "activityItemsConfiguration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        break;
      objc_msgSend(v13, "nextResponder");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
        goto LABEL_20;
      objc_msgSend(v13, "nextResponder");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v15;
      if (!v15)
        goto LABEL_21;
    }
    objc_msgSend(v13, "activityItemsConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

  }
  else
  {
    v15 = 0;
  }
LABEL_21:

  return v15;
}

- (id)responseWithError:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CBD8F0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithNode:error:", 0, v4);

  return v5;
}

- (id)nodeWithContentCollection:(id)a3 file:(id)a4 linkPresentationMetadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  id WFStringContentItemClass;
  void *v26;
  uint64_t v27;
  WFOnScreenContentNode *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  WFOnScreenContentNode *v38;
  id v40;
  id v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "items");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "items");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16 >= 2)
  {
    objc_msgSend(v14, "name");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend(v8, "items");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v19)
    {
      v20 = v19;
      v40 = v10;
      v41 = v9;
      v21 = *(_QWORD *)v44;
      while (2)
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v44 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          getWFStringContentItemClass();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v17 = 0;
            goto LABEL_12;
          }
          objc_msgSend(v23, "string");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "appendString:", v24);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
        if (v20)
          continue;
        break;
      }
LABEL_12:
      v10 = v40;
      v9 = v41;
    }

    if (objc_msgSend(v17, "length"))
    {
      WFStringContentItemClass = getWFStringContentItemClass();
      v26 = (void *)objc_msgSend(v17, "copy");
      objc_msgSend(WFStringContentItemClass, "itemWithObject:named:", v26, v42);
      v27 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v27;
    }

  }
  v28 = [WFOnScreenContentNode alloc];
  -[WFOnScreenContentExtractor applicationFrame](self, "applicationFrame");
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[WFOnScreenContentExtractor applicationLevel](self, "applicationLevel"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[WFOnScreenContentNode initWithContentItem:file:applicationBundleIdentifier:applicationFrame:applicationLevel:source:linkPresentationMetadata:](v28, "initWithContentItem:file:applicationBundleIdentifier:applicationFrame:applicationLevel:source:linkPresentationMetadata:", v14, v9, v12, v37, CFSTR("UIActivityItemsConfiguration"), v10, v30, v32, v34, v36);

  return v38;
}

- (CGRect)applicationFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_applicationFrame.origin.x;
  y = self->_applicationFrame.origin.y;
  width = self->_applicationFrame.size.width;
  height = self->_applicationFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setApplicationFrame:(CGRect)a3
{
  self->_applicationFrame = a3;
}

- (int64_t)applicationLevel
{
  return self->_applicationLevel;
}

- (void)setApplicationLevel:(int64_t)a3
{
  self->_applicationLevel = a3;
}

void __107__WFOnScreenContentExtractor_loadActivityItemsConfigurationItemsForScene_serviceOptions_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  const __CFString *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2050000000;
  v8 = (void *)getWFContentItemClass_softClass_16417;
  v41 = getWFContentItemClass_softClass_16417;
  if (!getWFContentItemClass_softClass_16417)
  {
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __getWFContentItemClass_block_invoke_16418;
    v37[3] = &unk_1E5FC8858;
    v37[4] = &v38;
    __getWFContentItemClass_block_invoke_16418((uint64_t)v37);
    v8 = (void *)v39[3];
  }
  v25 = v7;
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v38, 8);
  objc_msgSend(v9, "itemWithObject:named:", v6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v10, "outputTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v34;
LABEL_5:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v13)
        objc_enumerationMutation(v11);
      v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v14);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v15, "string");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("public.rtf"));

        if ((v17 & 1) != 0)
          break;
      }
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
        if (v12)
          goto LABEL_5;
        goto LABEL_15;
      }
    }

    if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "containsObject:", CFSTR("WFStringContentItem")))goto LABEL_16;
    v42 = CFSTR("WFStringContentItem");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;
  }
LABEL_15:

LABEL_16:
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __107__WFOnScreenContentExtractor_loadActivityItemsConfigurationItemsForScene_serviceOptions_completionHandler___block_invoke_2;
  v26[3] = &unk_1E5FC7F20;
  v20 = *(_QWORD *)(a1 + 56);
  v31 = v25;
  v32 = v20;
  v27 = *(id *)(a1 + 32);
  v21 = *(id *)(a1 + 40);
  v22 = *(_QWORD *)(a1 + 48);
  v28 = v21;
  v29 = v22;
  v30 = v10;
  v23 = v10;
  v24 = v25;
  objc_msgSend(v23, "preloadImportantItemsWithCompletionHandler:", v26);

}

void __107__WFOnScreenContentExtractor_loadActivityItemsConfigurationItemsForScene_serviceOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WFCoercionRequestClass;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "if_compactMap:", &__block_literal_global_16424);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFCoercionRequestClass = getWFCoercionRequestClass();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __107__WFOnScreenContentExtractor_loadActivityItemsConfigurationItemsForScene_serviceOptions_completionHandler___block_invoke_4;
  v8[3] = &unk_1E5FC7EF8;
  v13 = *(id *)(a1 + 64);
  v9 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v10 = v4;
  v11 = v5;
  v12 = v6;
  objc_msgSend(WFCoercionRequestClass, "requestForCoercingToContentClasses:completionHandler:", v2, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "performCoercion:", v7);

}

void __107__WFOnScreenContentExtractor_loadActivityItemsConfigurationItemsForScene_serviceOptions_completionHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id WFCoercionRequestClass;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;

  v6 = a2;
  v7 = a4;
  objc_msgSend(v6, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    WFCoercionRequestClass = getWFCoercionRequestClass();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __107__WFOnScreenContentExtractor_loadActivityItemsConfigurationItemsForScene_serviceOptions_completionHandler___block_invoke_5;
    v14[3] = &unk_1E5FC7ED0;
    v15 = *(id *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    v16 = v11;
    v17 = v12;
    v18 = v6;
    v19 = *(id *)(a1 + 64);
    objc_msgSend(WFCoercionRequestClass, "requestForCoercingToFileType:completionHandler:", 0, v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "performCoercion:", v13);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __107__WFOnScreenContentExtractor_loadActivityItemsConfigurationItemsForScene_serviceOptions_completionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  const char *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _OWORD v31[2];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CBD8A8];
    objc_msgSend(v7, "fileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filename");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "wfType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileWithFileURL:filename:typeIdentifier:", v9, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "deletesFileOnDeallocation"))
      objc_msgSend(v13, "_setMarkedForDeletionOnDeallocation:", 1);
    objc_msgSend(v7, "fileURL");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      objc_msgSend(v7, "fileURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isFileURL");

      if (v17)
      {
        objc_msgSend(v7, "fileURL");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "path");
        v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v19, "fileSystemRepresentation");
        v20 = (const char *)sandbox_extension_issue_file();

        if (v20)
        {
          v21 = *(void **)(a1 + 32);
          if (v21)
            objc_msgSend(v21, "originatingProcessAuditToken");
          else
            memset(v31, 0, sizeof(v31));
          objc_msgSend(v13, "_setAssociatedAuditToken:", v31);
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", v20, strlen(v20) + 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "fileURL");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          MEMORY[0x1B5DFBD4C](v23, v22);

        }
      }
    }

  }
  else
  {
    v13 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v27 = 0;
    goto LABEL_19;
  }
  v24 = *(void **)(a1 + 40);
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v25 = (_QWORD *)getUIActivityItemsConfigurationMetadataKeyLinkPresentationMetadataSymbolLoc_ptr;
  v35 = getUIActivityItemsConfigurationMetadataKeyLinkPresentationMetadataSymbolLoc_ptr;
  if (!getUIActivityItemsConfigurationMetadataKeyLinkPresentationMetadataSymbolLoc_ptr)
  {
    v26 = UIKitLibrary();
    v25 = dlsym(v26, "UIActivityItemsConfigurationMetadataKeyLinkPresentationMetadata");
    v33[3] = (uint64_t)v25;
    getUIActivityItemsConfigurationMetadataKeyLinkPresentationMetadataSymbolLoc_ptr = (uint64_t)v25;
  }
  _Block_object_dispose(&v32, 8);
  if (v25)
  {
    objc_msgSend(v24, "activityItemsConfigurationMetadataForKey:", *v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
    objc_msgSend(*(id *)(a1 + 48), "nodeWithContentCollection:file:linkPresentationMetadata:", *(_QWORD *)(a1 + 56), v13, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

    return;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIActivityItemsConfigurationMetadataKey getUIActivityItemsConfigurationMetadataKeyLinkPresentationMetadata(void)");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, CFSTR("WFOnScreenContentExtractor.m"), 37, CFSTR("%s"), dlerror());

  __break(1u);
}

Class __107__WFOnScreenContentExtractor_loadActivityItemsConfigurationItemsForScene_serviceOptions_completionHandler___block_invoke_3(int a1, NSString *aClassName)
{
  return NSClassFromString(aClassName);
}

void __61__WFOnScreenContentExtractor_handleAction_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if ((unint64_t)objc_msgSend(v11, "count") < 2)
  {
    if (objc_msgSend(v11, "count") == 1)
    {
      objc_msgSend(v11, "firstObject");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;
    }
    else
    {
      if (v11)
        goto LABEL_8;
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = 0;
    }

    goto LABEL_8;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addChildren:", v11);
LABEL_8:
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD8F0]), "initWithNode:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
