@implementation UISSlotMachine

- (UISSlotMachine)initWithSlotDrawer:(id)a3 options:(unint64_t)a4
{
  id v8;
  UISSlotMachine *v9;
  UISSlotMachine *v10;
  char v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  unint64_t v16;
  void *v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *cachedContents;
  CAContext *layerContext;
  uint64_t v22;
  NSMapTable *LRUTagsByClass;
  objc_super v25;

  v8 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UISSlotMachine;
  v9 = -[UISSlotMachine init](&v25, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_slotDrawer, a3);
    v11 = objc_opt_respondsToSelector();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = 2;
    else
      v12 = 0;
    v13 = v12 & 0xFFFFFFFFFFFFFFFELL | v11 & 1;
    v14 = objc_opt_respondsToSelector();
    v15 = 4;
    if ((v14 & 1) == 0)
      v15 = 0;
    v16 = v13 | v15;
    if (v16 > 5 || ((1 << v16) & 0x36) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("UISSlotMachine.m"), 75, CFSTR("Unsupported drawer method configuration."));

    }
    else
    {
      v10->_slotDrawerMethod = v16;
    }
    v10->_options = a4;
    *(_QWORD *)&v10->_cachedContentsLock._os_unfair_lock_opaque = 0;
    v10->_LRUTagsByClassLock._os_unfair_lock_opaque = 0;
    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cachedContents = v10->_cachedContents;
    v10->_cachedContents = v19;

    layerContext = v10->_layerContext;
    v10->_layerContext = 0;

    if ((a4 & 2) != 0)
    {
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 258, 0, 0);
      LRUTagsByClass = v10->_LRUTagsByClass;
      v10->_LRUTagsByClass = (NSMapTable *)v22;

    }
  }

  return v10;
}

+ (id)allowedLocalizations
{
  if (qword_1ECDA58F0 != -1)
    dispatch_once(&qword_1ECDA58F0, &__block_literal_global_8);
  return (id)_MergedGlobals_11;
}

void __38__UISSlotMachine_allowedLocalizations__block_invoke()
{
  void *v0;
  void *v1;
  __CFBundle *Unique;
  CFArrayRef v3;
  uint64_t v4;
  void *v5;
  id v6;

  v0 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", "/", 1, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", "System/Library/PrivateFrameworks/UIKitCore.framework", 1, v1);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  Unique = (__CFBundle *)_CFBundleCreateUnique();
  v3 = CFBundleCopyBundleLocalizations(Unique);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_MergedGlobals_11;
  _MergedGlobals_11 = v4;

  if (v3)
    CFRelease(v3);
  if (Unique)
    CFRelease(Unique);

}

- (NSSet)allTags
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[NSMutableDictionary allKeys](self->_cachedContents, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  return (NSSet *)v5;
}

- (void)_getRemoteContentForLayerContextWithId:(unint64_t)a3 style:(id)a4 tag:(id)a5 forceSync:(BOOL)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(_QWORD, _QWORD);
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void (**v27)(_QWORD, _QWORD, _QWORD);
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  UISSlotDrawer *slotDrawer;
  void *v33;
  void *v34;
  double v35;
  double v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  _BOOL4 v43;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  void (**v48)(_QWORD, _QWORD, _QWORD);
  id v49;
  BOOL v50;
  uint8_t buf[16];
  _QWORD v52[4];
  id v53;
  id v54;
  UISSlotMachine *v55;
  id v56;
  id v57;
  id v58;
  id v59[5];
  id location;
  _QWORD v61[4];
  id v62;

  v43 = a6;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __83__UISSlotMachine__getRemoteContentForLayerContextWithId_style_tag_forceSync_reply___block_invoke;
  v61[3] = &unk_1E2CAF8C0;
  v15 = v14;
  v62 = v15;
  v16 = (void (**)(_QWORD, _QWORD))MEMORY[0x194010C34](v61);
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISSlotMachine.m"), 137, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layerContextId"));

  }
  v17 = objc_msgSend(v13, "failGradeForStyle:", v12);
  if (v17)
  {
    v18 = v17;
    if ((v17 & 0x100) != 0)
      +[UISSlotMachine allowedLocalizations](UISSlotMachine, "allowedLocalizations");
    else
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "gradeWithOnlyFails:allowedLocalizations:", v18, v19))
      v16[2](v16, 0);

  }
  if ((objc_msgSend(v13, "isValid") & 1) == 0)
    v16[2](v16, 0);
  v20 = (void *)objc_opt_class();
  v21 = v20;
  if ((self->_options & 2) != 0)
    v22 = objc_msgSend(v20, "cacheLimit");
  else
    v22 = -1;
  objc_msgSend(v13, "resolvedStyleForStyle:", v12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __83__UISSlotMachine__getRemoteContentForLayerContextWithId_style_tag_forceSync_reply___block_invoke_2;
  v52[3] = &unk_1E2CAF8E8;
  objc_copyWeak(v59, &location);
  v24 = v16;
  v57 = v24;
  v25 = v13;
  v53 = v25;
  v26 = v23;
  v54 = v26;
  v55 = self;
  v59[1] = (id)a2;
  v59[2] = (id)a3;
  v45 = v12;
  v56 = v45;
  v59[3] = (id)v22;
  v59[4] = v21;
  v44 = v15;
  v58 = v44;
  v27 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x194010C34](v52);
  if (v22)
  {
    os_unfair_lock_lock(&self->_cachedContentsLock);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedContents, "objectForKeyedSubscript:", v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(&self->_cachedContentsLock);
    if (v29)
    {
      ((void (**)(_QWORD, void *, _QWORD))v27)[2](v27, v29, 0);
      goto LABEL_33;
    }
  }
  switch(self->_slotDrawerMethod)
  {
    case 1uLL:
      v30 = -[UISSlotDrawer imageWithStyle:tag:forRemote:](self->_slotDrawer, "imageWithStyle:tag:forRemote:", v26, v25, 1);
      if (v30)
        goto LABEL_30;
      _UISSlotMachineServiceLogger();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190875000, v38, OS_LOG_TYPE_DEFAULT, "Cannot create local content from empty image.", buf, 2u);
      }

      (*((void (**)(id, _QWORD))v24 + 2))(v24, 0);
      v29 = 0;
      goto LABEL_33;
    case 2uLL:
      if (v43)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISSlotMachine.m"), 282, CFSTR("Cannot synchronously create local content with asynchronous image drawer method."));

      }
      slotDrawer = self->_slotDrawer;
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __83__UISSlotMachine__getRemoteContentForLayerContextWithId_style_tag_forceSync_reply___block_invoke_34;
      v46[3] = &unk_1E2CAF910;
      v48 = v27;
      v47 = v26;
      v50 = v22 != 0;
      v49 = v24;
      -[UISSlotDrawer getImageWithStyle:tag:forRemote:reply:](slotDrawer, "getImageWithStyle:tag:forRemote:reply:", v47, v25, 1, v46);

      v29 = 0;
      v33 = v48;
      goto LABEL_32;
    case 4uLL:
      -[UISSlotDrawer drawingWithStyle:tag:forRemote:](self->_slotDrawer, "drawingWithStyle:tag:forRemote:", v26, v25, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v34;
      if (v34)
      {
        objc_msgSend(v34, "drawingSize");
        if (v35 > 0.0)
        {
          objc_msgSend(v29, "drawingSize");
          if (v36 > 0.0)
            goto LABEL_28;
        }
      }
      _UISSlotMachineServiceLogger();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190875000, v37, OS_LOG_TYPE_DEFAULT, "Cannot create local content from empty drawing.", buf, 2u);
      }
      goto LABEL_36;
    case 5uLL:
      v30 = -[UISSlotDrawer imageWithStyle:tag:forRemote:](self->_slotDrawer, "imageWithStyle:tag:forRemote:", v26, v25, 1);
      if (v30)
      {
LABEL_30:
        +[UISSlotLocalContent contentWithImage:scale:](UISSlotLocalContent, "contentWithImage:scale:", v30, objc_msgSend(v26, "displayScale"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, BOOL))v27)[2](v27, v33, v22 != 0);
LABEL_31:
        v29 = 0;
        goto LABEL_32;
      }
      -[UISSlotDrawer drawingWithStyle:tag:forRemote:](self->_slotDrawer, "drawingWithStyle:tag:forRemote:", v26, v25, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v39;
      if (v39)
      {
        objc_msgSend(v39, "drawingSize");
        if (v40 > 0.0)
        {
          objc_msgSend(v29, "drawingSize");
          if (v41 > 0.0)
          {
LABEL_28:
            +[UISSlotLocalContent contentWithDrawing:style:](UISSlotLocalContent, "contentWithDrawing:style:", v29, v26);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *, BOOL))v27)[2](v27, v33, v22 != 0);
LABEL_32:

            goto LABEL_33;
          }
        }
      }
      _UISSlotMachineServiceLogger();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190875000, v37, OS_LOG_TYPE_DEFAULT, "Cannot create local content from empty drawing.", buf, 2u);
      }
LABEL_36:

      (*((void (**)(id, _QWORD))v24 + 2))(v24, 0);
LABEL_33:

      objc_destroyWeak(v59);
      objc_destroyWeak(&location);

      return;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISSlotMachine.m"), 275, CFSTR("Unsupported drawer method configuration."));
      goto LABEL_31;
  }
}

void __83__UISSlotMachine__getRemoteContentForLayerContextWithId_style_tag_forceSync_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t))(v2 + 16))(*(_QWORD *)(a1 + 32), 0, a2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UISSlotMachineErrorDomain"), 0, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

  }
}

void __83__UISSlotMachine__getRemoteContentForLayerContextWithId_style_tag_forceSync_reply___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  char *WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  UISSlotRemoteContent *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  UISSlotRemoteContent *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  id v31;
  void *v32;
  void *v33;
  UISLRUCache *v34;
  void *v35;
  void *v36;
  id v37;

  v37 = a2;
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    if (!a3)
      goto LABEL_9;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    if (!a3)
      goto LABEL_9;
  }
  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 8);
  objc_msgSend(*((id *)WeakRetained + 6), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v37, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v37, *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)WeakRetained + 6), "setObject:forKeyedSubscript:", v8, *(_QWORD *)(a1 + 32));

  }
  os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 8);

LABEL_9:
  if ((objc_msgSend(MEMORY[0x1E0CD28B0], "currentState") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 48), CFSTR("UISSlotMachine.m"), 175, CFSTR("An active implicit transaction will delay slot creation; please use an explicit transaction instead"));

  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 9);
  v9 = [UISSlotRemoteContent alloc];
  objc_msgSend(v37, "contentSize");
  v11 = v10;
  v13 = v12;
  v14 = objc_msgSend(v37, "contentScale");
  objc_msgSend(v37, "image");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[UISSlotRemoteContent initWithContentSize:contentScale:localImage:toLayerContext:](v9, "initWithContentSize:contentScale:localImage:toLayerContext:", v14, v15, WeakRetained + 56, v11, v13);

  -[UISSlotRemoteContent transferFromLayerContext:toLayerContextWithId:](v16, "transferFromLayerContext:toLayerContextWithId:", *((_QWORD *)WeakRetained + 7), *(_QWORD *)(a1 + 96));
  os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 9);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  if ((WeakRetained[24] & 1) != 0)
  {
    v17 = objc_msgSend(*(id *)(a1 + 32), "authenticationMessageContextForStyle:", *(_QWORD *)(a1 + 56));
    v18 = objc_msgSend(*(id *)(a1 + 32), "backgroundStatisticsRegionForStyle:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "backgroundStatisticsForegroundForStyle:", *(_QWORD *)(a1 + 56));
    v20 = v19;
    objc_msgSend(*(id *)(a1 + 32), "backgroundStatisticsPassingContrastForStyle:", *(_QWORD *)(a1 + 56));
    v22 = v21;
    objc_msgSend(*(id *)(a1 + 32), "backgroundStatisticsFailingContrastForStyle:", *(_QWORD *)(a1 + 56));
    v24 = v23;
    v25 = objc_msgSend(*(id *)(a1 + 32), "hitTestInformationMaskForStyle:", *(_QWORD *)(a1 + 56));
    v26 = objc_msgSend(*(id *)(a1 + 32), "initialSampleEventForStyle:", *(_QWORD *)(a1 + 56));
    v27 = objc_msgSend(*(id *)(a1 + 32), "secureNameForStyle:", *(_QWORD *)(a1 + 56));
    LODWORD(v28) = v20;
    LODWORD(v29) = v22;
    LODWORD(v30) = v24;
    v31 = -[UISSlotRemoteContent newTouchAuthenticationSpecificationWithAuthenticationMessageContext:backgroundStatisticsRegion:backgroundStatisticsForeground:backgroundStatisticsPassingContrast:backgroundStatisticsFailingContrast:hitTestInformationMask:initialSampleEvent:secureName:](v16, "newTouchAuthenticationSpecificationWithAuthenticationMessageContext:backgroundStatisticsRegion:backgroundStatisticsForeground:backgroundStatisticsPassingContrast:backgroundStatisticsFailingContrast:hitTestInformationMask:initialSampleEvent:secureName:", v17, v18, v25, v26, v27, v28, v29, v30);
    objc_msgSend(MEMORY[0x1E0D00E18], "sharedInstance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addTouchAuthenticationSpecifications:forReason:", v33, CFSTR("slot machine"));

  }
  if (a3 && *(_QWORD *)(a1 + 104) != -1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 10);
    objc_msgSend(*((id *)WeakRetained + 8), "objectForKey:", *(_QWORD *)(a1 + 112));
    v34 = (UISLRUCache *)objc_claimAutoreleasedReturnValue();
    if (!v34)
    {
      v34 = -[UISLRUCache initWithLimit:]([UISLRUCache alloc], "initWithLimit:", *(_QWORD *)(a1 + 104));
      objc_msgSend(*((id *)WeakRetained + 8), "setObject:forKey:", v34, *(_QWORD *)(a1 + 112));
    }
    -[UISLRUCache evictedObjectForUsedObject:](v34, "evictedObjectForUsedObject:", *(_QWORD *)(a1 + 32));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 10);
    if (v35)
      objc_msgSend(*(id *)(a1 + 48), "removeContentsForTag:", v35);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

}

void __83__UISSlotMachine__getRemoteContentForLayerContextWithId_style_tag_forceSync_reply___block_invoke_34(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v5 = a3;
  if (a2)
  {
    v6 = *(_QWORD *)(a1 + 40);
    +[UISSlotLocalContent contentWithImage:scale:](UISSlotLocalContent, "contentWithImage:scale:", a2, objc_msgSend(*(id *)(a1 + 32), "displayScale"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v7, *(unsigned __int8 *)(a1 + 56));

  }
  else
  {
    _UISSlotMachineServiceLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_190875000, v8, OS_LOG_TYPE_DEFAULT, "Cannot create local content from empty image.", v9, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)getRemoteContentForLayerContextWithId:(unint64_t)a3 style:(id)a4 tag:(id)a5 reply:(id)a6
{
  -[UISSlotMachine _getRemoteContentForLayerContextWithId:style:tag:forceSync:reply:](self, "_getRemoteContentForLayerContextWithId:style:tag:forceSync:reply:", a3, a4, a5, 0, a6);
}

- (id)remoteContentForLayerContextWithId:(unint64_t)a3 style:(id)a4 tag:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v8 = a4;
  v9 = a5;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__UISSlotMachine_remoteContentForLayerContextWithId_style_tag___block_invoke;
  v12[3] = &unk_1E2CAF938;
  v12[4] = &v13;
  -[UISSlotMachine _getRemoteContentForLayerContextWithId:style:tag:forceSync:reply:](self, "_getRemoteContentForLayerContextWithId:style:tag:forceSync:reply:", a3, v8, v9, 1, v12);
  v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __63__UISSlotMachine_remoteContentForLayerContextWithId_style_tag___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)removeContentForStyle:(id)a3 tag:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(v8, "resolvedStyleForStyle:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_cachedContentsLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedContents, "objectForKeyedSubscript:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v6);
  if (!objc_msgSend(v7, "count"))
    -[NSMutableDictionary removeObjectForKey:](self->_cachedContents, "removeObjectForKey:", v8);
  os_unfair_lock_unlock(&self->_cachedContentsLock);

}

- (void)removeContentsForTag:(id)a3
{
  os_unfair_lock_s *p_cachedContentsLock;
  id v5;

  p_cachedContentsLock = &self->_cachedContentsLock;
  v5 = a3;
  os_unfair_lock_lock(p_cachedContentsLock);
  -[NSMutableDictionary removeObjectForKey:](self->_cachedContents, "removeObjectForKey:", v5);

  os_unfair_lock_unlock(p_cachedContentsLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_LRUTagsByClass, 0);
  objc_storeStrong((id *)&self->_layerContext, 0);
  objc_storeStrong((id *)&self->_cachedContents, 0);
  objc_storeStrong((id *)&self->_slotDrawer, 0);
}

@end
