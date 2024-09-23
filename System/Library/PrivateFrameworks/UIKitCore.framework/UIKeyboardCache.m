@implementation UIKeyboardCache

- (id)displayImagesForView:(id)a3 fromLayout:(id)a4 imageFlags:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  CGImage *v15;
  CGImage *v16;
  size_t Width;
  double v18;
  double v19;
  double v20;
  UIKBCachedImage *v21;
  UIKBCachedImage *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  int v28;
  int v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  void *v43;
  uint64_t m;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _BOOL4 v49;
  void *v50;
  unsigned __int8 v51;
  id v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  id v58;
  uint64_t v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  TIImageCacheClient *store;
  void *v65;
  _BOOL4 v66;
  uint64_t v67;
  _BOOL4 v68;
  void *v69;
  objc_class *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  _BOOL4 v74;
  void *v75;
  dispatch_time_t v76;
  void *context;
  unsigned int v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  id obj;
  id v87;
  id v89;
  _QWORD block[4];
  id v91;
  id v92;
  UIKeyboardCache *v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  char v97;
  _QWORD v98[5];
  _QWORD v99[5];
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  uint64_t v121;
  CGRect v122;

  v121 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v89 = a4;
  v8 = a5;
  if (!objc_msgSend(v8, "count"))
  {

    v8 = &unk_1E1A93B90;
  }
  objc_msgSend(v7, "cacheKeysForRenderFlags:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  v87 = (id)objc_claimAutoreleasedReturnValue();
  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v120, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v114;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v114 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "keepNonPersistent")
          && (v15 = (CGImage *)_nonPersistentCacheForKey(v14, 0), (v16 = CGImageRetain(v15)) != 0)
          || (v16 = -[UIKeyboardCache cachedImageForKey:fromLayout:](self, "cachedImageForKey:fromLayout:", v14, v89)) != 0)
        {
          Width = CGImageGetWidth(v16);
          objc_msgSend(v7, "bounds");
          v19 = v18;
          objc_msgSend(v7, "contentScaleFactor");
          if (vabdd_f64((double)Width, v20 * v19) <= 1.0)
          {
            v21 = [UIKBCachedImage alloc];
            objc_msgSend(v7, "contentScaleFactor");
            v22 = -[UIImage initWithCGImage:scale:orientation:](v21, "initWithCGImage:scale:orientation:", v16, 0);
            objc_msgSend(v87, "setObject:forKey:", v22, v13);

            if (objc_msgSend(v7, "keepNonPersistent"))
              _nonPersistentCacheForKey(v14, v16);
          }
          CGImageRelease(v16);
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v120, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "cachedWidth");
  v24 = v23;
  objc_msgSend(v7, "bounds");
  v26 = v25;
  v27 = objc_msgSend(v87, "count");
  if (v27 != objc_msgSend(obj, "count") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v122.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
    v122.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
    v122.size.width = v24;
    v122.size.height = v26;
    if (!CGRectIsEmpty(v122))
    {
      v28 = _UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UIKeyboardGrayscaleCachingEnabled, (uint64_t)CFSTR("UIKeyboardGrayscaleCachingEnabled"));
      if (byte_1ECD7668C)
        v29 = 1;
      else
        v29 = v28;
      if (v29 == 1)
        v79 = objc_msgSend(v7, "displaysColorImage") ^ 1;
      else
        v79 = 0;
      context = (void *)MEMORY[0x186DC9484]();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(obj, "count"));
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = objc_msgSend(v7, "assetIdiom");
      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      v30 = obj;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v109, v119, 16);
      if (v31)
      {
        v32 = *(_QWORD *)v110;
        do
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v110 != v32)
              objc_enumerationMutation(v30);
            v34 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * j);
            objc_msgSend(v87, "objectForKey:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v35)
            {
              objc_msgSend(v7, "contentScaleFactor");
              +[UIKBRenderer rendererWithContext:withSize:withScale:opaque:renderFlags:assetIdiom:](UIKBRenderer, "rendererWithContext:withSize:withScale:opaque:renderFlags:assetIdiom:", 0, objc_msgSend(v7, "isOpaque"), objc_msgSend(v34, "integerValue"), v82, v24, v26, v36);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "objectForKey:", v34);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setCacheKey:", v38);

              if (objc_msgSend(v7, "displaysColorImage"))
                objc_msgSend(v37, "forceColorFormat:", 0);
              else
                objc_msgSend(v37, "setColorDetectMode:", v79);
              objc_msgSend(v84, "addObject:", v37);

            }
          }
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v109, v119, 16);
        }
        while (v31);
      }

      if (v79)
      {
        objc_msgSend(v7, "drawContentsOfRenderers:", v84);
        v107 = 0u;
        v108 = 0u;
        v105 = 0u;
        v106 = 0u;
        v39 = v84;
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v105, v118, 16);
        if (v40)
        {
          v41 = *(_QWORD *)v106;
          do
          {
            for (k = 0; k != v40; ++k)
            {
              if (*(_QWORD *)v106 != v41)
                objc_enumerationMutation(v39);
              v43 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * k);
              objc_msgSend(v43, "forceColorFormat:", objc_msgSend(v43, "contentColorFormat"));
              objc_msgSend(v43, "setColorDetectMode:", 0);
            }
            v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v105, v118, 16);
          }
          while (v40);
        }

      }
      objc_msgSend(v7, "drawContentsOfRenderers:", v84);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v80 = objc_msgSend(v7, "cacheDeferPriority");
      else
        v80 = objc_msgSend(v7, "cacheDeferable");
      v103 = 0u;
      v104 = 0u;
      v101 = 0u;
      v102 = 0u;
      v81 = v84;
      v85 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v101, v117, 16);
      if (v85)
      {
        v83 = *(_QWORD *)v102;
        do
        {
          for (m = 0; m != v85; ++m)
          {
            if (*(_QWORD *)v102 != v83)
              objc_enumerationMutation(v81);
            v45 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * m);
            objc_msgSend(v45, "renderedImage");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            if (v46)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v45, "renderFlags"));
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "setObject:forKey:", v46, v47);

            }
            if (objc_msgSend(v7, "keepNonPersistent"))
            {
              objc_msgSend(v45, "cacheKey");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              _nonPersistentCacheForKey(v48, (const void *)objc_msgSend(objc_retainAutorelease(v46), "CGImage"));

            }
            if (+[UIKeyboardCache enabled](UIKeyboardCache, "enabled"))
            {
              v49 = v80 == 0;
              objc_msgSend(v45, "cacheKey");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v50)
                v49 = 0;

              if (v49)
              {
                if (v79)
                {
                  if (objc_msgSend(v45, "contentColorFormat") == 2)
                  {
                    v51 = 5;
LABEL_71:
                    v99[0] = 0;
                    v99[1] = v99;
                    v99[2] = 0x3032000000;
                    v99[3] = __Block_byref_object_copy__123;
                    v99[4] = __Block_byref_object_dispose__123;
                    v52 = v45;
                    v100 = v52;
                    v53 = (void *)MEMORY[0x1E0DBDB98];
                    objc_msgSend(v52, "size");
                    v55 = v54;
                    v57 = v56;
                    objc_msgSend(v52, "singleColor");
                    v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                    v59 = objc_msgSend(v58, "CGColor");
                    objc_msgSend(v52, "scale");
                    v61 = v60;
                    objc_msgSend(v52, "contextData");
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    v98[0] = MEMORY[0x1E0C809B0];
                    v98[1] = 3221225472;
                    v98[2] = __62__UIKeyboardCache_displayImagesForView_fromLayout_imageFlags___block_invoke;
                    v98[3] = &unk_1E16B14C0;
                    v98[4] = v99;
                    objc_msgSend(v53, "cacheItemWithSize:format:formatColor:scale:data:dataReleaseHandler:", v51, v59, v62, v98, v55, v57, v61);
                    v63 = (void *)objc_claimAutoreleasedReturnValue();

                    store = self->_store;
                    objc_msgSend(v52, "cacheKey");
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    -[TIImageCacheClient storeImageDataForKey:inGroup:item:](store, "storeImageDataForKey:inGroup:item:", v65, v89, v63);

                    _Block_object_dispose(v99, 8);
                    goto LABEL_72;
                  }
                  if (objc_msgSend(v45, "contentColorFormat") == 1)
                  {
                    if (objc_msgSend(v7, "isOpaque"))
                      v51 = 4;
                    else
                      v51 = 3;
                    goto LABEL_71;
                  }
                }
                v51 = objc_msgSend(v7, "isOpaque");
                goto LABEL_71;
              }
            }
LABEL_72:

          }
          v85 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v101, v117, 16);
        }
        while (v85);
      }

      v66 = +[UIKeyboardCache enabled](UIKeyboardCache, "enabled");
      v67 = v80;
      if (v80)
        v68 = v66;
      else
        v68 = 0;
      if (v68)
      {
        if (v80 == 2)
        {
          v69 = (void *)UIApp;
          v70 = (objc_class *)objc_opt_class();
          NSStringFromClass(v70);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = objc_msgSend(v69, "_beginBackgroundTaskWithName:expirationHandler:", v71, 0);

          v67 = 2;
        }
        else
        {
          v72 = 0;
        }
        v76 = dispatch_time(0, 100000000);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __62__UIKeyboardCache_displayImagesForView_fromLayout_imageFlags___block_invoke_2;
        block[3] = &unk_1E16D3F40;
        v91 = v81;
        v97 = v79;
        v92 = v7;
        v93 = self;
        v94 = v89;
        v95 = v67;
        v96 = v72;
        dispatch_after(v76, MEMORY[0x1E0C80D38], block);

        v75 = v91;
      }
      else
      {
        -[UIKeyboardCache idleAction](self, "idleAction");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = v73 == 0;

        if (!v74)
        {
LABEL_85:

          objc_autoreleasePoolPop(context);
          goto LABEL_86;
        }
        +[_UIActionWhenIdle actionWhenIdleWithTarget:selector:object:](_UIActionWhenIdle, "actionWhenIdleWithTarget:selector:object:", self, sel__didIdleAndShouldWait, 0);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardCache setIdleAction:](self, "setIdleAction:", v75);
      }

      goto LABEL_85;
    }
  }
LABEL_86:

  return v87;
}

- (CGImage)cachedImageForKey:(id)a3 fromLayout:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  CGImage *v10;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  if (pthread_main_np() != 1)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v14, OS_LOG_TYPE_FAULT, "Unsupported use of -[UIKeyboardCache cachedImageForKey:fromLayout:] off the main thread", buf, 2u);
      }

    }
    else
    {
      v12 = cachedImageForKey_fromLayout____s_category;
      if (!cachedImageForKey_fromLayout____s_category)
      {
        v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v12, (unint64_t *)&cachedImageForKey_fromLayout____s_category);
      }
      v13 = *(NSObject **)(v12 + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Unsupported use of -[UIKeyboardCache cachedImageForKey:fromLayout:] off the main thread", v15, 2u);
      }
    }
  }
  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[UIKeyboardCache cachedImageForKey:fromLayout:traitCollection:](self, "cachedImageForKey:fromLayout:traitCollection:", v7, v6, v9);

  return v10;
}

- (CGImage)cachedImageForKey:(id)a3 fromLayout:(id)a4 traitCollection:(id)a5
{
  id v8;
  id v9;
  id v10;
  UIKeyboardCache *v11;
  CGImage *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8
    && +[UIKeyboardCache enabledForTraitCollection:](UIKeyboardCache, "enabledForTraitCollection:", v10))
  {
    v11 = self;
    objc_sync_enter(v11);
    v12 = (CGImage *)-[TIImageCacheClient copyImageForKey:inGroup:](v11->_store, "copyImageForKey:inGroup:", v8, v9);
    objc_sync_exit(v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)enabledForTraitCollection:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "userInterfaceIdiom") == 3)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    if (TIGetKeyboardCachingDisabledValue_onceToken != -1)
      dispatch_once(&TIGetKeyboardCachingDisabledValue_onceToken, &__block_literal_global_327);
    objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForPreferenceKey:", CFSTR("KeyboardCachingDisabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v7, "BOOLValue") ^ 1;
  }

  return v5;
}

- (void)commitTransaction
{
  -[TIImageCacheClient idleAfter:](self->_store, "idleAfter:", 0.0);
}

- (void)clearNonPersistentCache
{
  objc_msgSend((id)_MergedGlobals_1121, "removeAllObjects");
}

+ (id)sharedInstance
{
  void *v2;
  UIKeyboardCache *v3;
  void *v4;

  v2 = (void *)__cache;
  if (!__cache)
  {
    v3 = objc_alloc_init(UIKeyboardCache);
    v4 = (void *)__cache;
    __cache = (uint64_t)v3;

    v2 = (void *)__cache;
  }
  return v2;
}

- (void)incrementExpectedRender:(id)a3
{
  id v4;

  if (self->_activeRenderers)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((-[NSMutableSet containsObject:](self->_activeRenderers, "containsObject:") & 1) == 0)
      -[NSMutableSet addObject:](self->_activeRenderers, "addObject:", v4);

  }
}

- (void)decrementExpectedRender:(id)a3
{
  NSMutableSet *activeRenderers;
  void *v5;
  id v6;

  if (self->_activeRenderers)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (-[NSMutableSet containsObject:](self->_activeRenderers, "containsObject:"))
    {
      -[NSMutableSet removeObject:](self->_activeRenderers, "removeObject:", v6);
      if (!-[NSMutableSet count](self->_activeRenderers, "count"))
      {
        activeRenderers = self->_activeRenderers;
        self->_activeRenderers = 0;

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "postNotificationName:object:", CFSTR("UIKeyboardRenderDidFinishNotification"), 0);

      }
    }

  }
}

+ (BOOL)enabled
{
  void *v3;
  void *v4;
  char v5;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  if (pthread_main_np() != 1)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "Unsupported use of +[UIKeyboardCache enabled] off the main thread", buf, 2u);
      }

    }
    else
    {
      v7 = enabled___s_category;
      if (!enabled___s_category)
      {
        v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&enabled___s_category);
      }
      v8 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Unsupported use of +[UIKeyboardCache enabled] off the main thread", v10, 2u);
      }
    }
  }
  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "enabledForTraitCollection:", v4);

  return v5;
}

- (UIKeyboardCache)init
{
  UIKeyboardCache *v2;
  uint64_t v3;
  TIImageCacheClient *store;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v6;
  NSMutableSet *v7;
  NSMutableSet *activeRenderers;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIKeyboardCache;
  v2 = -[UIKeyboardCache init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0DBDB90]), "initWithLocalAccess:", 1);
    store = v2->_store;
    v2->_store = (TIImageCacheClient *)v3;

    if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UIKeyboardCachingLockOnRead, (uint64_t)CFSTR("UIKeyboardCachingLockOnRead")) & 1) == 0&& byte_1ECD76694)
    {
      -[TIImageCacheClient setLockOnRead:](v2->_store, "setLockOnRead:", objc_msgSend((id)UIApp, "launchedToTest"));
    }
    -[TIImageCacheClient setCacheItemLimit:](v2->_store, "setCacheItemLimit:", 80);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)AXSSensitiveSettingChanged, (CFStringRef)*MEMORY[0x1E0DDE0A0], 0, (CFNotificationSuspensionBehavior)0);
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v6, v2, (CFNotificationCallback)AXSSensitiveSettingChanged, (CFStringRef)*MEMORY[0x1E0DDE088], 0, (CFNotificationSuspensionBehavior)0);
    if (objc_msgSend((id)UIApp, "launchedToTest"))
    {
      v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      activeRenderers = v2->_activeRenderers;
      v2->_activeRenderers = v7;

    }
  }
  return v2;
}

- (void)dealloc
{
  _UIActionWhenIdle *idleAction;
  NSMutableSet *activeRenderers;
  __CFNotificationCenter *DarwinNotifyCenter;
  TIImageCacheClient *store;
  NSSet *layouts;
  objc_super v8;

  idleAction = self->_idleAction;
  self->_idleAction = 0;

  activeRenderers = self->_activeRenderers;
  self->_activeRenderers = 0;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E0DDE0A0], 0);
  store = self->_store;
  self->_store = 0;

  layouts = self->_layouts;
  self->_layouts = 0;

  v8.receiver = self;
  v8.super_class = (Class)UIKeyboardCache;
  -[UIKeyboardCache dealloc](&v8, sel_dealloc);
}

- (void)purge
{
  -[TIImageCacheClient purge](self->_store, "purge");
}

- (CGImage)cachedCompositeImageForCacheKeys:(id)a3 fromLayout:(id)a4 opacities:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  CGImage *v16;
  CGImageRef Image;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CGImage *v24;
  UIKBCachedImage *v25;
  CGColorSpace *ColorSpace;
  id v27;
  _BOOL4 v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGContext *v40;
  uint64_t v41;
  void *v42;
  double v43;
  void *v44;
  float v45;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v8, "count") || !+[UIKeyboardCache enabled](UIKeyboardCache, "enabled"))
  {
    Image = 0;
    goto LABEL_36;
  }
  v50 = v10;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "count");
  if (v12)
  {
    v13 = v12;
    for (i = 0; i != v13; ++i)
    {
      objc_msgSend(v8, "objectAtIndex:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appendFormat:", CFSTR("%lul:"), objc_msgSend(v15, "hash"));

    }
  }
  v16 = (CGImage *)_nonPersistentCacheForKey(v11, 0);
  if (v16)
  {
    Image = CGImageRetain(v16);
    v10 = v50;
    goto LABEL_35;
  }
  v48 = v11;
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v49 = v8;
  v18 = v8;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (!v19)
  {
    v22 = 1;
    goto LABEL_27;
  }
  v20 = v19;
  v21 = *(_QWORD *)v53;
  v22 = 1;
  do
  {
    v23 = 0;
    do
    {
      if (*(_QWORD *)v53 != v21)
        objc_enumerationMutation(v18);
      v24 = -[UIKeyboardCache cachedImageForKey:fromLayout:](self, "cachedImageForKey:fromLayout:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v23), v9);
      v25 = -[UIImage initWithCGImage:]([UIKBCachedImage alloc], "initWithCGImage:", v24);
      CGImageRelease(v24);
      if (!v22)
        goto LABEL_18;
      ColorSpace = CGImageGetColorSpace(v24);
      if (CGColorSpaceGetNumberOfComponents(ColorSpace) == 4
        || (-[UIKBCachedImage formatColor](v25, "formatColor"),
            v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()),
            v28 = UIKBColorUsesRGB(objc_msgSend(v27, "CGColor")),
            v27,
            v28))
      {
        v22 = 0;
LABEL_18:
        if (!v25)
          goto LABEL_20;
LABEL_19:
        objc_msgSend(v51, "addObject:", v25);
        goto LABEL_20;
      }
      v22 = 1;
      if (v25)
        goto LABEL_19;
LABEL_20:

      ++v23;
    }
    while (v20 != v23);
    v29 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    v20 = v29;
  }
  while (v29);
LABEL_27:

  v30 = v51;
  v31 = objc_msgSend(v51, "count");
  if (v31)
  {
    v32 = v31;
    v10 = v50;
    v33 = objc_msgSend(v50, "count");
    objc_msgSend(v51, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "size");
    v36 = v35;
    v38 = v37;
    v47 = v34;
    objc_msgSend(v34, "scale");
    v40 = +[UIKBRenderer imageContextWithSize:scale:colorFormat:opaque:invert:](UIKBRenderer, "imageContextWithSize:scale:colorFormat:opaque:invert:", v22, 0, 0, v36, v38, v39);
    v41 = 0;
    v8 = v49;
    do
    {
      objc_msgSend(v30, "objectAtIndex:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 1.0;
      if (v32 == v33)
      {
        objc_msgSend(v50, "objectAtIndex:", v41);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "floatValue");
        v43 = v45;

        v30 = v51;
      }
      -[UIKeyboardCache drawCachedImage:alpha:inContext:](self, "drawCachedImage:alpha:inContext:", v42, v40, v43);

      ++v41;
    }
    while (v32 != v41);
    Image = CGBitmapContextCreateImage(v40);
    CGContextRelease(v40);
    v11 = v48;
    _nonPersistentCacheForKey(v48, Image);

  }
  else
  {
    Image = 0;
    v10 = v50;
    v11 = v48;
  }

LABEL_35:
LABEL_36:

  return Image;
}

- (void)drawCachedImage:(id)a3 alpha:(double)a4 inContext:(CGContext *)a5
{
  id v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  id v14;
  CGImage *v15;
  CGImage *v16;
  id v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v7 = a3;
  if (v7)
  {
    v17 = v7;
    CGContextSaveGState(a5);
    CGContextSetAlpha(a5, a4);
    v9 = *MEMORY[0x1E0C9D538];
    v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v17, "size");
    v11 = v10;
    v13 = v12;
    if (objc_msgSend(v17, "hasFormatColor"))
    {
      objc_msgSend(v17, "formatColor");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetFillColorWithColor(a5, (CGColorRef)objc_msgSend(v14, "CGColor"));

      v15 = (CGImage *)objc_msgSend(objc_retainAutorelease(v17), "CGImage");
      v18.origin.x = v9;
      v18.origin.y = v8;
      v18.size.width = v11;
      v18.size.height = v13;
      CGContextClipToMask(a5, v18, v15);
      v19.origin.x = v9;
      v19.origin.y = v8;
      v19.size.width = v11;
      v19.size.height = v13;
      CGContextFillRect(a5, v19);
    }
    else
    {
      v16 = (CGImage *)objc_msgSend(objc_retainAutorelease(v17), "CGImage");
      v20.origin.x = v9;
      v20.origin.y = v8;
      v20.size.width = v11;
      v20.size.height = v13;
      CGContextDrawImage(a5, v20, v16);
    }
    CGContextRestoreGState(a5);
    v7 = v17;
  }

}

void __62__UIKeyboardCache_displayImagesForView_fromLayout_imageFlags___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

void __62__UIKeyboardCache_displayImagesForView_fromLayout_imageFlags___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  BOOL v7;
  unsigned __int8 v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  id obj;
  _QWORD v27[5];
  _QWORD v28[5];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v31 != v3)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v5, "cacheKey");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6 == 0;

        if (!v7)
        {
          if (*(_BYTE *)(a1 + 80))
          {
            if (objc_msgSend(v5, "contentColorFormat") == 2)
            {
              v8 = 5;
LABEL_16:
              v28[0] = 0;
              v28[1] = v28;
              v28[2] = 0x3032000000;
              v28[3] = __Block_byref_object_copy__123;
              v28[4] = __Block_byref_object_dispose__123;
              v9 = v5;
              v29 = v9;
              v10 = (void *)MEMORY[0x1E0DBDB98];
              objc_msgSend(v9, "size");
              v12 = v11;
              v14 = v13;
              objc_msgSend(v9, "singleColor");
              v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v16 = objc_msgSend(v15, "CGColor");
              objc_msgSend(v9, "scale");
              v18 = v17;
              objc_msgSend(v9, "contextData");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v27[0] = MEMORY[0x1E0C809B0];
              v27[1] = 3221225472;
              v27[2] = __62__UIKeyboardCache_displayImagesForView_fromLayout_imageFlags___block_invoke_3;
              v27[3] = &unk_1E16B14C0;
              v27[4] = v28;
              objc_msgSend(v10, "cacheItemWithSize:format:formatColor:scale:data:dataReleaseHandler:", v8, v16, v19, v27, v12, v14, v18);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              v21 = *(void **)(*(_QWORD *)(a1 + 48) + 8);
              objc_msgSend(v9, "cacheKey");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "storeImageDataForKey:inGroup:item:", v22, *(_QWORD *)(a1 + 56), v20);

              _Block_object_dispose(v28, 8);
              continue;
            }
            if (*(_BYTE *)(a1 + 80) && objc_msgSend(v5, "contentColorFormat") == 1)
            {
              if (objc_msgSend(*(id *)(a1 + 40), "isOpaque"))
                v8 = 4;
              else
                v8 = 3;
              goto LABEL_16;
            }
          }
          v8 = objc_msgSend(*(id *)(a1 + 40), "isOpaque");
          goto LABEL_16;
        }
      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v2);
  }

  objc_msgSend(*(id *)(a1 + 48), "idleAction");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23 == 0;

  if (v24)
  {
    +[_UIActionWhenIdle actionWhenIdleWithTarget:selector:object:](_UIActionWhenIdle, "actionWhenIdleWithTarget:selector:object:", *(_QWORD *)(a1 + 48), sel__didIdle, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setIdleAction:", v25);

  }
  if (*(_QWORD *)(a1 + 64) == 2)
    objc_msgSend((id)UIApp, "_endBackgroundTask:", *(_QWORD *)(a1 + 72));
}

void __62__UIKeyboardCache_displayImagesForView_fromLayout_imageFlags___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (void)_didIdle
{
  -[UIKeyboardCache setIdleAction:](self, "setIdleAction:", 0);
  -[TIImageCacheClient setIdleWhenDone](self->_store, "setIdleWhenDone");
}

- (void)_didIdleAndShouldWait
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 150000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__UIKeyboardCache__didIdleAndShouldWait__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
}

uint64_t __40__UIKeyboardCache__didIdleAndShouldWait__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didIdle");
}

- (id)uniqueLayoutsFromInputModes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (UIKeyboardInputModeUsesKBStar(v10))
        {
          KBStarLayoutString(v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11, (_QWORD)v13);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)updateCacheForInputModes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  TIImageCacheClient *store;
  _QWORD v12[5];

  v4 = a3;
  if (+[UIKeyboardCache enabled](UIKeyboardCache, "enabled"))
  {
    -[UIKeyboardCache uniqueLayoutsFromInputModes:](self, "uniqueLayoutsFromInputModes:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSSet isEqualToSet:](self->_layouts, "isEqualToSet:", v5))
    {
      v6 = (void *)-[NSSet mutableCopy](self->_layouts, "mutableCopy");
      objc_msgSend(v6, "minusSet:", v5);
      v7 = (void *)UIApp;
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "_beginBackgroundTaskWithName:expirationHandler:", v9, 0);

      store = self->_store;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __44__UIKeyboardCache_updateCacheForInputModes___block_invoke;
      v12[3] = &__block_descriptor_40_e5_v8__0l;
      v12[4] = v10;
      -[TIImageCacheClient removeImagesInGroups:completion:](store, "removeImagesInGroups:completion:", v6, v12);

    }
  }

}

uint64_t __44__UIKeyboardCache_updateCacheForInputModes___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)UIApp, "_endBackgroundTask:", *(_QWORD *)(a1 + 32));
}

- (_UIActionWhenIdle)idleAction
{
  return self->_idleAction;
}

- (void)setIdleAction:(id)a3
{
  objc_storeStrong((id *)&self->_idleAction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleAction, 0);
  objc_storeStrong((id *)&self->_activeRenderers, 0);
  objc_storeStrong((id *)&self->_layouts, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end
