@implementation _UIPathLazyImageAsset

- (id)_initWithAssetName:(id)a3 forFilesInBundle:(id)a4 imagePaths:(id)a5 haveCGCacheImages:(BOOL)a6
{
  id v10;
  _BYTE *v11;
  _BYTE *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_UIPathLazyImageAsset;
  v11 = -[UIImageAsset _initWithAssetName:forFilesInBundle:](&v16, sel__initWithAssetName_forFilesInBundle_, a3, a4);
  v12 = v11;
  if (v11)
  {
    v11[88] &= ~2u;
    v13 = objc_msgSend(v10, "copy");
    v14 = (void *)*((_QWORD *)v12 + 12);
    *((_QWORD *)v12 + 12) = v13;

    v12[88] = v12[88] & 0xFE | a6;
  }

  return v12;
}

- (id)imageWithConfiguration:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *ImageAtPath;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  if ((*(_BYTE *)&self->_plaFlags & 2) == 0)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_imagePaths;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v10);
          _UserInterfaceTraitFromPath(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          ImageAtPath = (void *)GetImageAtPath(v11, self->_haveCGCacheImages, 0.0);
          if (ImageAtPath)
          {
            if (v12)
              v14 = (void *)objc_msgSend(v12, "imageConfiguration");
            else
              v14 = 0;
            v15 = v14;
            -[UIImageAsset _withLock_registerImage:withConfiguration:](self, "_withLock_registerImage:withConfiguration:", ImageAtPath, v15);

          }
          ++v10;
        }
        while (v8 != v10);
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        v8 = v16;
      }
      while (v16);
    }

    *(_BYTE *)&self->_plaFlags |= 2u;
    p_lock = &self->super._lock;
  }
  os_unfair_lock_unlock(p_lock);
  v19.receiver = self;
  v19.super_class = (Class)_UIPathLazyImageAsset;
  -[UIImageAsset imageWithConfiguration:](&v19, sel_imageWithConfiguration_, v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (_UIPathLazyImageAsset)init
{
  unint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _UIPathLazyImageAsset *v7;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "Must use designated initializer", buf, 2u);
    }

  }
  else
  {
    v3 = init___s_category_1;
    if (!init___s_category_1)
    {
      v3 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&init___s_category_1);
    }
    v4 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "Must use designated initializer", v10, 2u);
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_UIPathLazyImageAsset _initWithAssetName:forManager:](self, "_initWithAssetName:forManager:", v6, 0);

  return v7;
}

- (_UIPathLazyImageAsset)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIPathLazyImageAsset;
  return -[UIImageAsset initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (id)_initWithAssetName:(id)a3 forManager:(id)a4
{
  id v5;
  unint64_t v6;
  NSObject *v7;
  id v8;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v5 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "Must use designated initializer", buf, 2u);
    }

  }
  else
  {
    v6 = _initWithAssetName_forManager____s_category;
    if (!_initWithAssetName_forManager____s_category)
    {
      v6 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&_initWithAssetName_forManager____s_category);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Must use designated initializer", v11, 2u);
    }
  }
  v8 = -[_UIPathLazyImageAsset _initWithAssetName:forFilesInBundle:imagePaths:haveCGCacheImages:](self, "_initWithAssetName:forFilesInBundle:imagePaths:haveCGCacheImages:", v5, 0, 0, 0);

  return v8;
}

- (id)_initWithAssetName:(id)a3 forFilesInBundle:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  NSObject *v9;
  id v10;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v12, OS_LOG_TYPE_FAULT, "Must use designated initializer", buf, 2u);
    }

  }
  else
  {
    v8 = _initWithAssetName_forFilesInBundle____s_category;
    if (!_initWithAssetName_forFilesInBundle____s_category)
    {
      v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&_initWithAssetName_forFilesInBundle____s_category);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Must use designated initializer", v13, 2u);
    }
  }
  v10 = -[_UIPathLazyImageAsset _initWithAssetName:forFilesInBundle:imagePaths:haveCGCacheImages:](self, "_initWithAssetName:forFilesInBundle:imagePaths:haveCGCacheImages:", v7, v6, 0, 0);

  return v10;
}

- (void)_clearResolvedImageResources
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  if ((*(_BYTE *)&self->_plaFlags & 2) != 0)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = self->_imagePaths;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          _UserInterfaceTraitFromPath(*(void **)(*((_QWORD *)&v11 + 1) + 8 * v8));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "_namedImageDescription", (_QWORD)v11);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIImageAsset _withLock_unregisterImageWithDescription:](self, "_withLock_unregisterImageWithDescription:", v10);

          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

    *(_BYTE *)&self->_plaFlags &= ~2u;
  }
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_containsImagesInPath:(id)a3
{
  id v4;
  NSArray *imagePaths;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  imagePaths = self->_imagePaths;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47___UIPathLazyImageAsset__containsImagesInPath___block_invoke;
  v8[3] = &unk_1E16CB2A0;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  -[NSArray enumerateObjectsUsingBlock:](imagePaths, "enumerateObjectsUsingBlock:", v8);
  LOBYTE(imagePaths) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)imagePaths;
}

- (NSArray)imagePaths
{
  return self->_imagePaths;
}

- (BOOL)haveCGCacheImages
{
  return self->_haveCGCacheImages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imagePaths, 0);
}

@end
