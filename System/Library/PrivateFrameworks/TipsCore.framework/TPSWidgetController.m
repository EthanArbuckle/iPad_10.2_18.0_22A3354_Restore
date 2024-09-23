@implementation TPSWidgetController

- (TPSDocument)preferredDocument
{
  os_unfair_lock_s *p_documentLock;
  TPSDocument *preferredDocument;
  void *v5;
  void *v6;
  TPSDocument *v7;
  TPSDocument *v8;
  void *v9;

  p_documentLock = &self->_documentLock;
  os_unfair_lock_lock(&self->_documentLock);
  preferredDocument = self->_preferredDocument;
  if (!preferredDocument)
  {
    +[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appGroupDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[TPSSecureArchivingUtilities unarchivedObjectOfClass:forKey:userDefaults:](TPSSecureArchivingUtilities, "unarchivedObjectOfClass:forKey:userDefaults:", objc_opt_class(), CFSTR("TPSWidgetDocument"), v6);
    v7 = (TPSDocument *)objc_claimAutoreleasedReturnValue();
    v8 = self->_preferredDocument;
    self->_preferredDocument = v7;

    preferredDocument = self->_preferredDocument;
  }
  v9 = (void *)-[TPSDocument copy](preferredDocument, "copy");
  os_unfair_lock_unlock(p_documentLock);
  return (TPSDocument *)v9;
}

- (void)dealloc
{
  objc_super v3;

  -[NSMutableDictionary removeAllObjects](self->_assetURLSessionMap, "removeAllObjects");
  v3.receiver = self;
  v3.super_class = (Class)TPSWidgetController;
  -[TPSWidgetController dealloc](&v3, sel_dealloc);
}

- (TPSWidgetController)init
{
  TPSWidgetController *v2;
  uint64_t v3;
  NSMutableDictionary *assetURLSessionMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSWidgetController;
  v2 = -[TPSWidgetController init](&v6, sel_init);
  +[TPSPersonaUtilities _adoptPersonaForContainerLookupIfNeeded](TPSPersonaUtilities, "_adoptPersonaForContainerLookupIfNeeded");
  if (v2)
  {
    *(_QWORD *)&v2->_documentLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    assetURLSessionMap = v2->_assetURLSessionMap;
    v2->_assetURLSessionMap = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)setPreferredDocument:(id)a3
{
  os_unfair_lock_s *p_documentLock;
  TPSDocument *v5;
  TPSDocument *preferredDocument;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_documentLock = &self->_documentLock;
  os_unfair_lock_lock(&self->_documentLock);
  v5 = (TPSDocument *)objc_msgSend(v9, "copy");
  preferredDocument = self->_preferredDocument;
  self->_preferredDocument = v5;

  +[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appGroupDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[TPSSecureArchivingUtilities archivedDataWithRootObject:forKey:userDefaults:](TPSSecureArchivingUtilities, "archivedDataWithRootObject:forKey:userDefaults:", v9, CFSTR("TPSWidgetDocument"), v8);
  os_unfair_lock_unlock(p_documentLock);

}

- (void)updateSessionMapValue:(id)a3 forKey:(id)a4
{
  id v6;
  os_unfair_lock_s *p_urlSessionLock;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  p_urlSessionLock = &self->_urlSessionLock;
  os_unfair_lock_lock(&self->_urlSessionLock);
  -[TPSWidgetController assetURLSessionMap](self, "assetURLSessionMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v6);

  os_unfair_lock_unlock(p_urlSessionLock);
}

- (void)attemptWidgetUpdateWith:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;

  v4 = a3;
  if (+[TPSCommonDefines isInternalBuild](TPSCommonDefines, "isInternalBuild"))
  {
    if (objc_msgSend(v4, "hasWidgetContent"))
    {
      +[TPSLogger widget](TPSLogger, "widget");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[TPSWidgetController attemptWidgetUpdateWith:].cold.1(v4, v5);

      -[TPSWidgetController updatePreferredWidget:completionHandler:](self, "updatePreferredWidget:completionHandler:", v4, 0);
    }
    else
    {
      +[TPSLogger widget](TPSLogger, "widget");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
      if (v4)
      {
        if (v7)
          -[TPSWidgetController attemptWidgetUpdateWith:].cold.3();
      }
      else if (v7)
      {
        -[TPSWidgetController attemptWidgetUpdateWith:].cold.2();
      }

    }
  }

}

- (void)updateWidgetDocumentWithDocumentsMap:(id)a3 documentsDeliveryInfoMap:(id)a4 deliveryInfoMap:(id)a5 preferHardwareWelcome:(BOOL)a6 completionHandler:(id)a7
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void (**v28)(void *, void *);
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  _QWORD *v52;
  _QWORD aBlock[4];
  id v54;
  TPSWidgetController *v55;
  id v56;
  id v57;
  _QWORD v58[5];
  id v59;
  id v60;
  _QWORD *v61;
  BOOL v62;
  _QWORD v63[5];
  id v64;
  void *v65;
  void *v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v41 = a4;
  v42 = a5;
  v43 = a7;
  v47 = v11;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x3032000000;
  v63[3] = __Block_byref_object_copy__1;
  v63[4] = __Block_byref_object_dispose__1;
  objc_msgSend(v46, "objectForKey:", CFSTR("TPSWidgetShownTips"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0C99DE8];
  if (v12)
  {
    objc_msgSend(v46, "objectForKey:", CFSTR("TPSWidgetShownTips"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayWithArray:", v14);
    v64 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v64 = (id)objc_claimAutoreleasedReturnValue();
  }

  +[TPSDefaultsManager widgetDocument](TPSDefaultsManager, "widgetDocument");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v47, "objectForKeyedSubscript:", v15, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "hasWidgetContent"))
    {
      +[TPSLogger widget](TPSLogger, "widget");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v16, "identifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "widgetContent");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "titleContent");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v68 = v36;
        v69 = 2112;
        v70 = v38;
        _os_log_debug_impl(&dword_19A906000, v17, OS_LOG_TYPE_DEBUG, "Found override widget content (%@). TitleContent: %@", buf, 0x16u);

      }
      objc_msgSend(v45, "addObject:", v16);
    }
    else
    {
      if (v16)
      {
        +[TPSLogger widget](TPSLogger, "widget");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[TPSWidgetController updateWidgetDocumentWithDocumentsMap:documentsDeliveryInfoMap:deliveryInfoMap:preferHardwareWelcome:completionHandler:].cold.2();
      }
      else
      {
        +[TPSLogger widget](TPSLogger, "widget");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[TPSWidgetController updateWidgetDocumentWithDocumentsMap:documentsDeliveryInfoMap:deliveryInfoMap:preferHardwareWelcome:completionHandler:].cold.1();
      }

    }
  }
  else
  {
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __141__TPSWidgetController_updateWidgetDocumentWithDocumentsMap_documentsDeliveryInfoMap_deliveryInfoMap_preferHardwareWelcome_completionHandler___block_invoke;
    v58[3] = &unk_1E395C430;
    v58[4] = self;
    v61 = v63;
    v59 = v44;
    v62 = a6;
    v60 = v45;
    objc_msgSend(v47, "enumerateKeysAndObjectsUsingBlock:", v58, 0);

  }
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("widgetContent"), 0);
  v20 = (void *)MEMORY[0x1E0C99DE8];
  v66 = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "sortedArrayUsingDescriptors:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "arrayWithArray:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "sortedArrayUsingDescriptors:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "addObjectsFromArray:", v25);
  v26 = objc_msgSend(v23, "count");
  if (v26)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __141__TPSWidgetController_updateWidgetDocumentWithDocumentsMap_documentsDeliveryInfoMap_deliveryInfoMap_preferHardwareWelcome_completionHandler___block_invoke_22;
    aBlock[3] = &unk_1E395C480;
    v27 = v23;
    v54 = v27;
    v55 = self;
    v56 = v41;
    v57 = v42;
    v28 = (void (**)(void *, void *))_Block_copy(aBlock);
    v29 = 0;
    while (v29 < objc_msgSend(v27, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v29, v26 - v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v28[2](v28, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v31)
      {
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v29);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v28[2](v28, v32);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v33 = objc_msgSend(v27, "indexOfObject:", v31);

      v29 = v33 + 1;
      if (v31)
      {
        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __141__TPSWidgetController_updateWidgetDocumentWithDocumentsMap_documentsDeliveryInfoMap_deliveryInfoMap_preferHardwareWelcome_completionHandler___block_invoke_3;
        v48[3] = &unk_1E395C4A8;
        v51 = v43;
        v52 = v63;
        v34 = v31;
        v49 = v34;
        v50 = v46;
        -[TPSWidgetController updatePreferredWidget:completionHandler:](self, "updatePreferredWidget:completionHandler:", v34, v48);

        goto LABEL_28;
      }
    }
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v43 + 2))(v43, 0, 0, 0);
LABEL_28:

  }
  else
  {
    +[TPSLogger widget](TPSLogger, "widget");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A906000, v35, OS_LOG_TYPE_DEFAULT, "No suitable widget tip found", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v43 + 2))(v43, 0, 0, 0);
  }

  _Block_object_dispose(v63, 8);
}

void __141__TPSWidgetController_updateWidgetDocumentWithDocumentsMap_documentsDeliveryInfoMap_deliveryInfoMap_preferHardwareWelcome_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  char v9;
  id *v10;
  id v11;

  v11 = a3;
  if (objc_msgSend(v11, "hasWidgetContent"))
  {
    objc_msgSend(*(id *)(a1 + 32), "timeSinceOSInstallDate");
    v5 = v4;
    v6 = *(double *)&TPSAcceptableWelcomeTimeframe;
    if (!objc_msgSend(v11, "isWelcome") || v5 < v6)
    {
      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      objc_msgSend(v11, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "containsObject:", v8))
      {
        v9 = objc_msgSend(v11, "isWelcome");

        if ((v9 & 1) == 0)
        {
          v10 = (id *)(a1 + 40);
LABEL_15:
          objc_msgSend(*v10, "addObject:", v11);
          goto LABEL_16;
        }
      }
      else
      {

      }
      if (!objc_msgSend(v11, "isWelcome")
        || ((objc_msgSend(v11, "isSwitcherWelcome") & 1) != 0 || objc_msgSend(v11, "isSoftwareWelcome"))
        && !*(_BYTE *)(a1 + 64)
        || objc_msgSend(v11, "isHardwareWelcome") && *(_BYTE *)(a1 + 64))
      {
        v10 = (id *)(a1 + 48);
        goto LABEL_15;
      }
    }
  }
LABEL_16:

}

id __141__TPSWidgetController_updateWidgetDocumentWithDocumentsMap_documentsDeliveryInfoMap_deliveryInfoMap_preferHardwareWelcome_completionHandler___block_invoke_22(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = a2;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1;
  v19 = __Block_byref_object_dispose__1;
  v20 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __141__TPSWidgetController_updateWidgetDocumentWithDocumentsMap_documentsDeliveryInfoMap_deliveryInfoMap_preferHardwareWelcome_completionHandler___block_invoke_2;
  v9[3] = &unk_1E395C458;
  v14 = &v15;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v10 = v4;
  v11 = v5;
  v12 = v6;
  v13 = *(id *)(a1 + 56);
  objc_msgSend(v3, "enumerateIndexesUsingBlock:", v9);
  v7 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v7;
}

void __141__TPSWidgetController_updateWidgetDocumentWithDocumentsMap_documentsDeliveryInfoMap_deliveryInfoMap_preferHardwareWelcome_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "notification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "widgetController:validForDocument:documentDeliveryInfoMap:deliveryInfoMap:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

    if ((v10 & 1) == 0)
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = 0;

    }
  }
  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) != 0;
}

void __141__TPSWidgetController_updateWidgetDocumentWithDocumentsMap_documentsDeliveryInfoMap_deliveryInfoMap_preferHardwareWelcome_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  void (*v11)(void);
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a2;
  v9 = a3;
  v10 = a4;
  if (a5)
  {
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = objc_msgSend(v12, "containsObject:", v13);

    if ((_DWORD)v12)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

    }
    v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v18);

    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), CFSTR("TPSWidgetShownTips"));
    objc_msgSend(*(id *)(a1 + 40), "synchronize");
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v11();

}

- (void)updatePreferredWidget:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__TPSWidgetController_updatePreferredWidget_completionHandler___block_invoke;
  v10[3] = &unk_1E395C4F8;
  v8 = v7;
  v12 = v8;
  objc_copyWeak(&v13, &location);
  v9 = v6;
  v11 = v9;
  -[TPSWidgetController fetchWidgetAssetsForDocument:preferCacheIfAvailable:completionHandler:](self, "fetchWidgetAssetsForDocument:preferCacheIfAvailable:completionHandler:", v9, 0, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __63__TPSWidgetController_updatePreferredWidget_completionHandler___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__TPSWidgetController_updatePreferredWidget_completionHandler___block_invoke_2;
  v13[3] = &unk_1E395C4D0;
  v14 = v9;
  v18 = a1[5];
  v10 = v9;
  objc_copyWeak(&v19, a1 + 6);
  v15 = a1[4];
  v16 = v7;
  v17 = v8;
  v11 = v8;
  v12 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

  objc_destroyWeak(&v19);
}

void __63__TPSWidgetController_updatePreferredWidget_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  int v6;
  uint64_t v7;
  const __CFString *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32)
    && +[TPSNetworkPathMonitor isNetworkError:](TPSNetworkPathMonitor, "isNetworkError:"))
  {
    +[TPSLogger widget](TPSLogger, "widget");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __63__TPSWidgetController_updatePreferredWidget_completionHandler___block_invoke_2_cold_4();

    v3 = *(_QWORD *)(a1 + 64);
    if (v3)
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(v3 + 16))(v3, 0, 0, 0, *(_QWORD *)(a1 + 32));
    return;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "setPreferredDocument:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "widgetContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasAssets");

  if (!v6)
    goto LABEL_10;
  v7 = *(_QWORD *)(a1 + 56);
  if (!*(_QWORD *)(a1 + 48))
  {
    +[TPSLogger default](TPSLogger, "default");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v7)
    {
      if (v10)
        __63__TPSWidgetController_updatePreferredWidget_completionHandler___block_invoke_2_cold_2();
      v8 = CFSTR("widgetDocumentAssetErrorLight");
    }
    else
    {
      if (v10)
        __63__TPSWidgetController_updatePreferredWidget_completionHandler___block_invoke_2_cold_1();
      v8 = CFSTR("widgetDocumentAssetErrorBoth");
    }
    goto LABEL_21;
  }
  if (!v7)
  {
    +[TPSLogger default](TPSLogger, "default");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __63__TPSWidgetController_updatePreferredWidget_completionHandler___block_invoke_2_cold_3();
    v8 = CFSTR("widgetDocumentAssetErrorDark");
LABEL_21:

    goto LABEL_22;
  }
LABEL_10:
  v8 = 0;
LABEL_22:
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "correlationID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPSAnalyticsEventContentRetrieved eventWithTipID:correlationID:serviceError:](TPSAnalyticsEventContentRetrieved, "eventWithTipID:correlationID:serviceError:", v11, v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "log");

  +[TPSLogger widget](TPSLogger, "widget");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "widgetContent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "titleContent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412546;
    v24 = v15;
    v25 = 2112;
    v26 = v17;
    _os_log_impl(&dword_19A906000, v14, OS_LOG_TYPE_DEFAULT, "Reloading timeline with preferred document (%@). TitleContent: %@", (uint8_t *)&v23, 0x16u);

  }
  v18 = objc_alloc(MEMORY[0x1E0D10110]);
  +[TPSCommonDefines clientBundleIdentifier](TPSCommonDefines, "clientBundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithExtensionBundleIdentifier:kind:", CFSTR("com.apple.tips.TipsSwift"), v19);

  v21 = (id)objc_msgSend(v20, "reloadTimelineWithReason:", CFSTR("client update"));
  v22 = *(_QWORD *)(a1 + 64);
  if (v22)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(v22 + 16))(v22, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0);

}

- (void)widgetAssetsForDocument:(id)a3 preferCacheIfAvailable:(BOOL)a4 userInterfaceStyle:(int64_t)a5 completionHandler:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  int64_t v24;
  uint8_t buf[4];
  int64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v8 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  objc_msgSend(v10, "widgetContent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "assets");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "language");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_8;
  objc_msgSend(v10, "assetFileInfoManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSWidgetController cacheFileURLForAssets:language:userInterfaceStyle:assetFileInfoManager:](self, "cacheFileURLForAssets:language:userInterfaceStyle:assetFileInfoManager:", v13, v14, a5, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "path");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "fileExistsAtPath:", v18);

  if ((v19 & 1) == 0)
  {

    goto LABEL_8;
  }
  if (!v16)
  {
LABEL_8:
    objc_msgSend(v10, "assetFileInfoManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __107__TPSWidgetController_widgetAssetsForDocument_preferCacheIfAvailable_userInterfaceStyle_completionHandler___block_invoke;
    v22[3] = &unk_1E395C520;
    v24 = a5;
    v23 = v11;
    -[TPSWidgetController fetchAssetForAssets:language:userInterfaceStyle:assetFileInfoManager:completionHandler:](self, "fetchAssetForAssets:language:userInterfaceStyle:assetFileInfoManager:completionHandler:", v13, v14, a5, v21, v22);

    v16 = v23;
    goto LABEL_9;
  }
  +[TPSLogger widget](TPSLogger, "widget");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v26 = a5;
    v27 = 2112;
    v28 = v16;
    _os_log_impl(&dword_19A906000, v20, OS_LOG_TYPE_DEFAULT, "Asset with interface %ld found in cache %@", buf, 0x16u);
  }

  (*((void (**)(id, void *, _QWORD))v11 + 2))(v11, v16, 0);
LABEL_9:

}

void __107__TPSWidgetController_widgetAssetsForDocument_preferCacheIfAvailable_userInterfaceStyle_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[TPSLogger widget](TPSLogger, "widget");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 134218242;
    v10 = v8;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_19A906000, v7, OS_LOG_TYPE_DEFAULT, "Asset with interface %ld fetched and stored at %@", (uint8_t *)&v9, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchWidgetAssetsForDocument:(id)a3 preferCacheIfAvailable:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  TPSAsyncBlockOperation *v14;
  uint64_t v15;
  id v16;
  TPSAsyncBlockOperation *v17;
  TPSAsyncBlockOperation *v18;
  id v19;
  TPSAsyncBlockOperation *v20;
  void *v21;
  TPSAsyncBlockOperation *v22;
  TPSAsyncBlockOperation *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  _QWORD v28[4];
  TPSAsyncBlockOperation *v29;
  TPSAsyncBlockOperation *v30;
  id v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD v34[4];
  id v35;
  _QWORD *v36;
  id v37;
  BOOL v38;
  _QWORD v39[4];
  id v40;
  _QWORD *v41;
  id v42;
  BOOL v43;
  id location;
  _QWORD v45[5];
  id v46;
  _QWORD v47[5];
  id v48;
  char v49[16];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "widgetContent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v47[0] = 0;
    v47[1] = v47;
    v47[2] = 0x3032000000;
    v47[3] = __Block_byref_object_copy__1;
    v47[4] = __Block_byref_object_dispose__1;
    v48 = 0;
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x3032000000;
    v45[3] = __Block_byref_object_copy__1;
    v45[4] = __Block_byref_object_dispose__1;
    v46 = 0;
    +[TPSLogger widget](TPSLogger, "widget");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v11, "debugDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPSWidgetController fetchWidgetAssetsForDocument:preferCacheIfAvailable:completionHandler:].cold.2(v13, (uint64_t)v49, v12);
    }

    objc_initWeak(&location, self);
    v14 = [TPSAsyncBlockOperation alloc];
    v15 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __93__TPSWidgetController_fetchWidgetAssetsForDocument_preferCacheIfAvailable_completionHandler___block_invoke;
    v39[3] = &unk_1E395C570;
    objc_copyWeak(&v42, &location);
    v16 = v8;
    v43 = a4;
    v40 = v16;
    v41 = v47;
    v17 = -[TPSAsyncBlockOperation initWithAsyncBlock:](v14, "initWithAsyncBlock:", v39);
    v18 = [TPSAsyncBlockOperation alloc];
    v34[0] = v15;
    v34[1] = 3221225472;
    v34[2] = __93__TPSWidgetController_fetchWidgetAssetsForDocument_preferCacheIfAvailable_completionHandler___block_invoke_3;
    v34[3] = &unk_1E395C570;
    objc_copyWeak(&v37, &location);
    v19 = v16;
    v38 = a4;
    v35 = v19;
    v36 = v45;
    v20 = -[TPSAsyncBlockOperation initWithAsyncBlock:](v18, "initWithAsyncBlock:", v34);
    v21 = (void *)MEMORY[0x1E0CB34C8];
    v28[0] = v15;
    v28[1] = 3221225472;
    v28[2] = __93__TPSWidgetController_fetchWidgetAssetsForDocument_preferCacheIfAvailable_completionHandler___block_invoke_5;
    v28[3] = &unk_1E395C598;
    v22 = v17;
    v29 = v22;
    v23 = v20;
    v30 = v23;
    v31 = v9;
    v32 = v47;
    v33 = v45;
    objc_msgSend(v21, "blockOperationWithBlock:", v28);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addDependency:", v22);
    objc_msgSend(v24, "addDependency:", v23);
    v25 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    objc_msgSend(v25, "setMaxConcurrentOperationCount:", 4);
    objc_msgSend(v25, "setSuspended:", 1);
    objc_msgSend(v25, "addOperation:", v22);
    objc_msgSend(v25, "addOperation:", v23);
    objc_msgSend(v25, "addOperation:", v24);
    objc_msgSend(v25, "setSuspended:", 0);

    objc_destroyWeak(&v37);
    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
    _Block_object_dispose(v45, 8);

    _Block_object_dispose(v47, 8);
  }
  else
  {
    +[TPSLogger widget](TPSLogger, "widget");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      -[TPSWidgetController fetchWidgetAssetsForDocument:preferCacheIfAvailable:completionHandler:].cold.1(v8, v26);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.tips.TPSWidgetController"), 1, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, v27);

  }
}

void __93__TPSWidgetController_fetchWidgetAssetsForDocument_preferCacheIfAvailable_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = *(unsigned __int8 *)(a1 + 56);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __93__TPSWidgetController_fetchWidgetAssetsForDocument_preferCacheIfAvailable_completionHandler___block_invoke_2;
  v9[3] = &unk_1E395C548;
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v10 = v3;
  v11 = v6;
  v8 = v3;
  objc_msgSend(WeakRetained, "widgetAssetsForDocument:preferCacheIfAvailable:userInterfaceStyle:completionHandler:", v7, v5, 0, v9);

}

void __93__TPSWidgetController_fetchWidgetAssetsForDocument_preferCacheIfAvailable_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v6 = a2;
  v7 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __93__TPSWidgetController_fetchWidgetAssetsForDocument_preferCacheIfAvailable_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = *(unsigned __int8 *)(a1 + 56);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __93__TPSWidgetController_fetchWidgetAssetsForDocument_preferCacheIfAvailable_completionHandler___block_invoke_4;
  v9[3] = &unk_1E395C548;
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v10 = v3;
  v11 = v6;
  v8 = v3;
  objc_msgSend(WeakRetained, "widgetAssetsForDocument:preferCacheIfAvailable:userInterfaceStyle:completionHandler:", v7, v5, 1, v9);

}

void __93__TPSWidgetController_fetchWidgetAssetsForDocument_preferCacheIfAvailable_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v6 = a2;
  v7 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __93__TPSWidgetController_fetchWidgetAssetsForDocument_preferCacheIfAvailable_completionHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "error");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)fetchAssetForAssets:(id)a3 language:(id)a4 userInterfaceStyle:(int64_t)a5 assetFileInfoManager:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD, void *);
  TPSAssetsConfiguration *v16;
  void *v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v24;
  int v25;
  id v26;
  double v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  void (**v32)(id, _QWORD, void *);
  id v33;
  id location;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void (**)(id, _QWORD, void *))a7;
  v28 = v12;
  v29 = v13;
  v16 = -[TPSAssetsConfiguration initWithAssets:language:userInterfaceStyle:assetFileInfoManager:]([TPSAssetsConfiguration alloc], "initWithAssets:language:userInterfaceStyle:assetFileInfoManager:", v12, v13, a5, v14);
  -[TPSAssetsConfiguration cacheIdentifierForType:](v16, "cacheIdentifierForType:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPSContentURLController assetPathFromAssetConfiguration:type:](TPSContentURLController, "assetPathFromAssetConfiguration:type:", v16, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  if (v18)
    v19 = v17 == 0;
  else
    v19 = 1;
  if (v19)
  {
    +[TPSLogger widget](TPSLogger, "widget");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[TPSWidgetController fetchAssetForAssets:language:userInterfaceStyle:assetFileInfoManager:completionHandler:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.tips.TPSWidgetController"), 2, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, 0, v21);
  }
  else
  {
    +[TPSLogger widget](TPSLogger, "widget");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v18;
      _os_log_impl(&dword_19A906000, v22, OS_LOG_TYPE_DEFAULT, "widget asset path: %@", buf, 0xCu);
    }

    +[TPSAssetCacheController sharedInstance](TPSAssetCacheController, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __110__TPSWidgetController_fetchAssetForAssets_language_userInterfaceStyle_assetFileInfoManager_completionHandler___block_invoke;
    v30[3] = &unk_1E395C5C0;
    objc_copyWeak(&v33, &location);
    v25 = *MEMORY[0x1E0CB3338];
    v26 = v17;
    v31 = v26;
    v32 = v15;
    LODWORD(v27) = v25;
    objc_msgSend(v24, "formattedDataForPath:identifier:attributionIdentifier:priority:completionHandler:", v18, v26, 0, v30, v27);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[TPSWidgetController updateSessionMapValue:forKey:](self, "updateSessionMapValue:forKey:", v21, v26);
    objc_destroyWeak(&v33);
  }

  objc_destroyWeak(&location);
}

void __110__TPSWidgetController_fetchAssetForAssets_language_userInterfaceStyle_assetFileInfoManager_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;

  v9 = a3;
  v10 = a7;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v12 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "updateSessionMapValue:forKey:", 0, *(_QWORD *)(a1 + 32));
  +[TPSLogger widget](TPSLogger, "widget");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    __110__TPSWidgetController_fetchAssetForAssets_language_userInterfaceStyle_assetFileInfoManager_completionHandler___block_invoke_cold_2(v9, v13);

  if (v10)
  {
    +[TPSLogger widget](TPSLogger, "widget");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      __110__TPSWidgetController_fetchAssetForAssets_language_userInterfaceStyle_assetFileInfoManager_completionHandler___block_invoke_cold_1((uint64_t)v10, v14, v15);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)cacheFileURLForAssets:(id)a3 language:(id)a4 userInterfaceStyle:(int64_t)a5 assetFileInfoManager:(id)a6
{
  id v9;
  id v10;
  id v11;
  TPSAssetsConfiguration *v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = -[TPSAssetsConfiguration initWithAssets:language:userInterfaceStyle:assetFileInfoManager:]([TPSAssetsConfiguration alloc], "initWithAssets:language:userInterfaceStyle:assetFileInfoManager:", v11, v10, a5, v9);

  -[TPSAssetsConfiguration cacheIdentifierForType:](v12, "cacheIdentifierForType:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPSAssetCacheController sharedInstance](TPSAssetCacheController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "cacheFileURLForIdentifier:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (double)timeSinceOSInstallDate
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("TPSWelcomeNotificationStartDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v3);
    v6 = v5;

  }
  else
  {
    v6 = *(double *)&TPSAcceptableWelcomeTimeframe;
  }

  return v6;
}

- (TPSWidgetControllerDelegate)delegate
{
  return (TPSWidgetControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (os_unfair_lock_s)documentLock
{
  return self->_documentLock;
}

- (void)setDocumentLock:(os_unfair_lock_s)a3
{
  self->_documentLock = a3;
}

- (os_unfair_lock_s)urlSessionLock
{
  return self->_urlSessionLock;
}

- (void)setUrlSessionLock:(os_unfair_lock_s)a3
{
  self->_urlSessionLock = a3;
}

- (NSMutableDictionary)assetURLSessionMap
{
  return self->_assetURLSessionMap;
}

- (void)setAssetURLSessionMap:(id)a3
{
  objc_storeStrong((id *)&self->_assetURLSessionMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetURLSessionMap, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_preferredDocument, 0);
}

- (void)attemptWidgetUpdateWith:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "widgetContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "titleContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v4;
  v9 = 2112;
  v10 = v6;
  _os_log_debug_impl(&dword_19A906000, a2, OS_LOG_TYPE_DEBUG, "Overriding widget document from client: (%@). TitleContent: %@", (uint8_t *)&v7, 0x16u);

}

- (void)attemptWidgetUpdateWith:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_19A906000, v0, v1, "Overriding widget document from client failed. Document invalid not found in documents map", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)attemptWidgetUpdateWith:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_19A906000, v0, v1, "Overriding widget document from client failed. Document does not have widget content", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)updateWidgetDocumentWithDocumentsMap:documentsDeliveryInfoMap:deliveryInfoMap:preferHardwareWelcome:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_19A906000, v0, v1, "Override widget content not found in tips map", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)updateWidgetDocumentWithDocumentsMap:documentsDeliveryInfoMap:deliveryInfoMap:preferHardwareWelcome:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_19A906000, v0, v1, "Override widget content does not have valid widget content configured?", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __63__TPSWidgetController_updatePreferredWidget_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_19A906000, v0, v1, "ERROR: failed to download both widget assets", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __63__TPSWidgetController_updatePreferredWidget_completionHandler___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_19A906000, v0, v1, "ERROR: failed to download light widget assets", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __63__TPSWidgetController_updatePreferredWidget_completionHandler___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_19A906000, v0, v1, "ERROR: failed to download dark widget assets", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __63__TPSWidgetController_updatePreferredWidget_completionHandler___block_invoke_2_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_19A906000, v0, v1, "Network unreachable...skipping widget update", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)fetchWidgetAssetsForDocument:(void *)a1 preferCacheIfAvailable:(NSObject *)a2 completionHandler:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_3_0(&dword_19A906000, a2, v4, "Asset not available in document %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_4();
}

- (void)fetchWidgetAssetsForDocument:(void *)a1 preferCacheIfAvailable:(uint64_t)a2 completionHandler:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_3_0(&dword_19A906000, a3, (uint64_t)a3, "Asset available %@", (uint8_t *)a2);

}

- (void)fetchAssetForAssets:language:userInterfaceStyle:assetFileInfoManager:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_19A906000, v0, v1, "Cannot generate asset path to fetch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __110__TPSWidgetController_fetchAssetForAssets_language_userInterfaceStyle_assetFileInfoManager_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_3_0(&dword_19A906000, a2, a3, "widget asset error: %@", (uint8_t *)&v3);
}

void __110__TPSWidgetController_fetchAssetForAssets_language_userInterfaceStyle_assetFileInfoManager_completionHandler___block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_3_0(&dword_19A906000, a2, v4, "widget asset file url: %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_4();
}

@end
