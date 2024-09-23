@implementation UIStatusBarCache

+ (id)sharedInstance
{
  void *v2;
  UIStatusBarCache *v3;
  void *v4;

  v2 = (void *)sharedInstance___cache;
  if (!sharedInstance___cache)
  {
    v3 = objc_alloc_init(UIStatusBarCache);
    v4 = (void *)sharedInstance___cache;
    sharedInstance___cache = (uint64_t)v3;

    v2 = (void *)sharedInstance___cache;
  }
  return v2;
}

- (UIStatusBarCache)init
{
  UIStatusBarCache *v2;
  id v3;
  void *v4;
  uint64_t v5;
  CPBitmapStore *store;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  unint64_t v12;
  NSObject *v13;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)UIStatusBarCache;
  v2 = -[UIStatusBarCache init](&v15, sel_init);
  if (!v2)
    return v2;
  v3 = objc_alloc(MEMORY[0x1E0CFA988]);
  _cachePath();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1ECD80458 != -1)
    dispatch_once(&qword_1ECD80458, &__block_literal_global_40_4);
  v5 = objc_msgSend(v3, "initWithPath:version:", v4, qword_1ECD80450);
  store = v2->_store;
  v2->_store = (CPBitmapStore *)v5;

  if (v2->_store)
  {
    v7 = _MergedGlobals_1223;
    if (!_MergedGlobals_1223)
    {
      v7 = __UILogCategoryGetNode("StatusBar", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&_MergedGlobals_1223);
    }
    if ((*(_BYTE *)v7 & 1) == 0)
      goto LABEL_15;
    v8 = *(NSObject **)(v7 + 8);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v9 = v8;
    _cachePath();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v10;
    v11 = "Opened status bar cache at path %@";
  }
  else
  {
    v12 = qword_1ECD803D0;
    if (!qword_1ECD803D0)
    {
      v12 = __UILogCategoryGetNode("StatusBar", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, (unint64_t *)&qword_1ECD803D0);
    }
    v13 = *(NSObject **)(v12 + 8);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v9 = v13;
    _cachePath();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v10;
    v11 = "Failed to open status bar cache at path %@";
  }
  _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, v11, buf, 0xCu);

LABEL_15:
  v2->_writeable = objc_msgSend((id)UIApp, "_isSpringBoard");
  if (qword_1ECD80460 != -1)
    dispatch_once(&qword_1ECD80460, &__block_literal_global_41_2);
  return v2;
}

- (id)imageNamed:(id)a3 forGroup:(id)a4 withScale:(double)a5
{
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  CGImage *v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  unint64_t v16;
  NSObject *v18;
  NSObject *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = qword_1ECD803D8;
  if (!qword_1ECD803D8)
  {
    v10 = __UILogCategoryGetNode("StatusBar", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v10, (unint64_t *)&qword_1ECD803D8);
  }
  if ((*(_BYTE *)v10 & 1) != 0)
  {
    v18 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v20 = 138412546;
      v21 = v8;
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "Looking for image %@ for group %@...", (uint8_t *)&v20, 0x16u);
    }
  }
  v11 = -[CPBitmapStore copyImageForKey:inGroup:](self->_store, "copyImageForKey:inGroup:", v8, v9);
  if (v11)
  {
    v12 = (CGImage *)v11;
    +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v11, 0, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v12);
    v14 = qword_1ECD803E0;
    if (!qword_1ECD803E0)
    {
      v14 = __UILogCategoryGetNode("StatusBar", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v14, (unint64_t *)&qword_1ECD803E0);
    }
    if ((*(_BYTE *)v14 & 1) != 0)
    {
      v15 = *(NSObject **)(v14 + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v20 = 138412546;
        v21 = v8;
        v22 = 2112;
        v23 = v9;
        _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "...image %@ for group %@ found in the cache.", (uint8_t *)&v20, 0x16u);
      }
    }
  }
  else
  {
    v16 = qword_1ECD803E8;
    if (!qword_1ECD803E8)
    {
      v16 = __UILogCategoryGetNode("StatusBar", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v16, (unint64_t *)&qword_1ECD803E8);
    }
    if ((*(_BYTE *)v16 & 1) != 0)
    {
      v19 = *(NSObject **)(v16 + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = 138412546;
        v21 = v8;
        v22 = 2112;
        v23 = v9;
        _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "...image %@ for group %@ not found in the cache.", (uint8_t *)&v20, 0x16u);
      }
    }
    v13 = 0;
  }

  return v13;
}

- (void)cacheImage:(id)a3 named:(id)a4 forGroup:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[UIStatusBarCache isWriteable](self, "isWriteable"))
  {
    v11 = objc_retainAutorelease(v8);
    if (objc_msgSend(v11, "CGImage"))
    {
      v12 = qword_1ECD803F0;
      if (!qword_1ECD803F0)
      {
        v12 = __UILogCategoryGetNode("StatusBar", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v12, (unint64_t *)&qword_1ECD803F0);
      }
      if ((*(_BYTE *)v12 & 1) != 0)
      {
        v15 = *(NSObject **)(v12 + 8);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = 138412546;
          v17 = v9;
          v18 = 2112;
          v19 = v10;
          _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "Caching image %@ for group %@", (uint8_t *)&v16, 0x16u);
        }
      }
      -[CPBitmapStore storeImageForKey:inGroup:opaque:image:](self->_store, "storeImageForKey:inGroup:opaque:image:", v9, v10, 0, objc_msgSend(objc_retainAutorelease(v11), "CGImage"));
    }
  }
  else
  {
    v13 = qword_1ECD803F8;
    if (!qword_1ECD803F8)
    {
      v13 = __UILogCategoryGetNode("StatusBar", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v13, (unint64_t *)&qword_1ECD803F8);
    }
    if ((*(_BYTE *)v13 & 1) != 0)
    {
      v14 = *(NSObject **)(v13 + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "This process is not allowed to cache images.", (uint8_t *)&v16, 2u);
      }
    }
  }

}

- (void)removeImagesInGroup:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  CPBitmapStore *store;
  unint64_t v12;
  unint64_t v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  _QWORD v17[5];
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[UIStatusBarCache isWriteable](self, "isWriteable"))
  {
    if (v4)
    {
      v5 = qword_1ECD80400;
      if (!qword_1ECD80400)
      {
        v5 = __UILogCategoryGetNode("StatusBar", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v5, (unint64_t *)&qword_1ECD80400);
      }
      if ((*(_BYTE *)v5 & 1) != 0)
      {
        v16 = *(NSObject **)(v5 + 8);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v19 = v4;
          _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "Removing images in group %@", buf, 0xCu);
        }
      }
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)UIApp;
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "_beginBackgroundTaskWithName:expirationHandler:", v9, 0);

      store = self->_store;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __40__UIStatusBarCache_removeImagesInGroup___block_invoke;
      v17[3] = &__block_descriptor_40_e5_v8__0l;
      v17[4] = v10;
      -[CPBitmapStore removeImagesInGroups:completion:](store, "removeImagesInGroups:completion:", v6, v17);

      goto LABEL_10;
    }
    v13 = qword_1ECD80408;
    if (!qword_1ECD80408)
    {
      v13 = __UILogCategoryGetNode("StatusBar", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v13, (unint64_t *)&qword_1ECD80408);
    }
    v14 = *(NSObject **)(v13 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v15 = "Status bar cache was asked to remove images in a nil group.";
LABEL_15:
      _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, v15, buf, 2u);
    }
  }
  else
  {
    v12 = qword_1ECD80410;
    if (!qword_1ECD80410)
    {
      v12 = __UILogCategoryGetNode("StatusBar", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, (unint64_t *)&qword_1ECD80410);
    }
    if ((*(_BYTE *)v12 & 1) != 0)
    {
      v14 = *(NSObject **)(v12 + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v15 = "This process is not allowed to remove images in the cache.";
        goto LABEL_15;
      }
    }
  }
LABEL_10:

}

uint64_t __40__UIStatusBarCache_removeImagesInGroup___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)UIApp, "_endBackgroundTask:", *(_QWORD *)(a1 + 32));
}

- (BOOL)isWriteable
{
  return self->_writeable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

@end
