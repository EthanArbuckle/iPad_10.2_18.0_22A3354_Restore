@implementation _UIAssetManager

- (id)imageNamed:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int64_t preferredIdiom;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;

  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    v7 = -[_UIAssetManager _assetFromMapForName:](self, "_assetFromMapForName:", a3);
    if (v7)
      v8 = (id)objc_msgSend(v7, "imageWithConfiguration:", a4);
    else
      v8 = -[_UIAssetManager imageNamed:configuration:cachingOptions:attachCatalogImage:](self, "imageNamed:configuration:cachingOptions:attachCatalogImage:", a3, a4, 0, 0);
    v13 = v8;
    if (!v8)
    {
      v14 = objc_msgSend(a3, "stringByDeletingPathExtension");
      v15 = -[_UIAssetManager _assetFromMapForName:](self, "_assetFromMapForName:", v14);
      v16 = v15
          ? (id)objc_msgSend(v15, "imageWithConfiguration:", a4)
          : -[_UIAssetManager imageNamed:configuration:cachingOptions:attachCatalogImage:](self, "imageNamed:configuration:cachingOptions:attachCatalogImage:", v14, a4, 0, 0);
      v13 = v16;
      if ((objc_msgSend(v16, "_isSymbolImage") & 1) != 0 || !v13)
      {
        if (!-[_UIAssetManager _isSystemAssetManager](self, "_isSystemAssetManager")
          && (*(_BYTE *)&self->_assetManagerFlags & 2) == 0)
        {
          os_unfair_lock_lock(&stru_1ECD81E74);
          v17 = (void *)objc_msgSend(+[_UIAssetManager sharedRuntimeAssetMap](_UIAssetManager, "sharedRuntimeAssetMap"), "objectForKey:", +[_UIAssetManager _sharedRuntimeAssetMapKeyForAssetName:inAssetManager:](_UIAssetManager, "_sharedRuntimeAssetMapKeyForAssetName:inAssetManager:", v14, self));
          os_unfair_lock_unlock(&stru_1ECD81E74);
          return (id)objc_msgSend(v17, "imageWithConfiguration:", a4);
        }
        return 0;
      }
    }
    return v13;
  }
  else
  {
    v9 = (void *)objc_msgSend(a4, "_effectiveTraitCollectionForImageLookup");
    if (!v9 || (v10 = v9, objc_msgSend(v9, "userInterfaceIdiom") == -1))
      preferredIdiom = self->_preferredIdiom;
    else
      preferredIdiom = objc_msgSend(v10, "userInterfaceIdiom");
    return -[_UIAssetManager imageNamed:idiom:](self, "imageNamed:idiom:", a3, preferredIdiom);
  }
}

+ (uint64_t)_convertTraitCollection:(double *)a3 toCUIScale:(_QWORD *)a4 CUIIdiom:(unint64_t *)a5 UIKitIdiom:(uint64_t *)a6 UIKitUserInterfaceStyle:(uint64_t *)a7 subtype:(uint64_t *)a8 CUIDisplayGamut:(uint64_t *)a9 UIKitLayoutDirection:(uint64_t *)a10 CUILayoutDirection:
{
  uint64_t v17;
  double v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;

  v17 = objc_opt_self();
  if (!a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__convertTraitCollection_toCUIScale_CUIIdiom_UIKitIdiom_UIKitUserInterfaceStyle_subtype_CUIDisplayGamut_UIKitLayoutDirection_CUILayoutDirection_, v17, CFSTR("_UIAssetManager.m"), 1196, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scale != NULL"));
  objc_msgSend(a2, "displayScale");
  if (v18 == 0.0)
  {
    v18 = *a3;
    if (*a3 == 0.0)
      v18 = 1.0;
  }
  *a3 = v18;
  v19 = objc_msgSend(a2, "userInterfaceIdiom");
  v20 = v19;
  if (a5)
    *a5 = v19;
  if (v19 > 5)
  {
    v21 = 0;
    if (!a4)
      goto LABEL_13;
    goto LABEL_12;
  }
  v21 = qword_186684BB8[v19];
  if (a4)
LABEL_12:
    *a4 = v21;
LABEL_13:
  v22 = objc_msgSend(a2, "userInterfaceStyle");
  if (a6)
    *a6 = v22;
  v23 = objc_msgSend(a2, "artworkSubtype");
  if (!v23)
    v23 = __preferredIdiomSubtypeForIdiom(v20);
  *a7 = v23;
  v24 = objc_msgSend(a2, "displayGamut");
  if (v24 == -1)
    v25 = 0;
  else
    v25 = v24;
  *a8 = v25;
  result = objc_msgSend(a2, "layoutDirection");
  if (result == -1)
    result = *a9;
  *a9 = result;
  if (a10)
  {
    v27 = 5;
    if (result)
      v27 = 0;
    if (result == 1)
      v27 = 4;
    *a10 = v27;
  }
  return result;
}

- (id)imageNamed:(id)a3 configuration:(id)a4 cachingOptions:(unint64_t)a5 attachCatalogImage:(BOOL)a6
{
  char v9;
  id v10;
  unint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  _BOOL4 v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _QWORD v25[2];
  uint64_t (*v26)(uint64_t, uint64_t, char);
  void *v27;
  id v28;
  _UIAssetManager *v29;
  id v30;
  uint64_t *v31;
  char v32;
  BOOL v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  uint64_t v40;

  if ((*(_BYTE *)&self->_assetManagerFlags & 8) != 0)
    v9 = 3;
  else
    v9 = a5;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3052000000;
  v38 = __Block_byref_object_copy__221;
  v39 = __Block_byref_object_dispose__221;
  v40 = 0;
  v10 = +[UIImageConfiguration _completeConfiguration:fromConfiguration:]((uint64_t)UIImageConfiguration, a4, 0);
  v11 = (unint64_t)(v9 & 2) >> 1;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v26 = __78___UIAssetManager_imageNamed_configuration_cachingOptions_attachCatalogImage___block_invoke;
  v27 = &unk_1E16E8288;
  v32 = v9 & 1;
  v28 = v10;
  v29 = self;
  v33 = a6;
  v34 = v11;
  v30 = a3;
  v31 = &v35;
  if (-[_UIAssetManager _isSystemAssetManager](self, "_isSystemAssetManager")
    || dyld_program_sdk_at_least())
  {
    v12 = (void *)v26((uint64_t)v25, (uint64_t)a3, 1);
    v13 = a3;
    if (!v12)
    {
      v13 = (id)objc_msgSend(a3, "stringByDeletingPathExtension");
      v14 = v26((uint64_t)v25, (uint64_t)v13, 0);
      goto LABEL_10;
    }
  }
  else
  {
    v13 = (id)objc_msgSend(a3, "stringByDeletingPathExtension");
    v12 = (void *)v26((uint64_t)v25, (uint64_t)v13, 0);
    if (!v12)
    {
      v14 = v26((uint64_t)v25, (uint64_t)a3, 0);
LABEL_10:
      v12 = (void *)v14;
      if (!v14)
        goto LABEL_26;
    }
  }
  if ((v9 & 2) != 0)
  {
    if ((objc_msgSend(v12, "_isSymbolImage") & 1) != 0)
    {
      v15 = 1;
    }
    else
    {
      -[UIScreen bounds](+[UIScreen mainScreen](UIScreen, "mainScreen"), "bounds");
      v17 = v16;
      v19 = v18;
      objc_msgSend(v12, "size");
      v21 = v20;
      objc_msgSend(v12, "size");
      v15 = v21 * v22 <= v17 * v19 * 0.125 && (_DWORD)v11 != 0;
    }
  }
  else
  {
    v15 = 0;
  }
  _UIImageDecorateFallbackImage(v12);
  if (v15)
  {
    -[_UICache setObject:forKey:](self->_imageCache, "setObject:forKey:", v12, +[_UIImageCacheKey keyWithName:configuration:](_UIImageCacheKey, "keyWithName:configuration:", v13, v10));
    if (v36[5])
      -[_UICache setObject:forKey:](self->_imageCache, "setObject:forKey:", v12, +[_UIImageCacheKey keyWithName:configuration:](_UIImageCacheKey, "keyWithName:configuration:", v13));
    if (v13 != a3)
    {
      +[_UIImageCacheKey keyWithName:configuration:](_UIImageCacheKey, "keyWithName:configuration:", a3, v10);
      -[_UICache setObject:forKey:](self->_imageCache, "setObject:forKey:", v12, a3);
    }
  }
LABEL_26:
  _Block_object_dispose(&v35, 8);
  return v12;
}

- (BOOL)_isSystemAssetManager
{
  return (*(_BYTE *)&self->_assetManagerFlags & 0xC) != 0;
}

- (id)_lookUpObjectForTraitCollection:(id)a3 objectAccessor:(id)a4
{
  uint64_t v5;

  if (!a3)
    return (id)(*((uint64_t (**)(id, _QWORD))a4 + 2))(a4, 0);
  v5 = 0;
  return -[_UIAssetManager _performLookUpObjectForTraitCollection:outNamedLookup:objectAccessor:](self, "_performLookUpObjectForTraitCollection:outNamedLookup:objectAccessor:", a3, &v5, a4);
}

- (id)_performLookUpObjectForTraitCollection:(id)a3 outNamedLookup:(id *)a4 objectAccessor:(id)a5
{
  id v9;
  void *v10;
  _QWORD v12[9];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;

  v9 = -[_UIAssetManager _appearanceNames](self, "_appearanceNames");
  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__221;
  v17 = __Block_byref_object_dispose__221;
  v18 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88___UIAssetManager__performLookUpObjectForTraitCollection_outNamedLookup_objectAccessor___block_invoke;
  v12[3] = &unk_1E16E8370;
  v12[4] = self;
  v12[5] = v9;
  v12[6] = a5;
  v12[7] = &v13;
  v12[8] = a4;
  -[UITraitCollection _enumerateThemeAppearanceNamesForLookup:](a3, (uint64_t)v12);
  v10 = (void *)v14[5];
  _Block_object_dispose(&v13, 8);
  return v10;
}

- (id)_translateAppearanceNameToNative:(id)a3
{
  return a3;
}

- (id)_appearanceNames
{
  void *v3;
  void *v4;

  v3 = (void *)-[CUICatalog appearanceNames](self->_catalog, "appearanceNames");
  if (v3 && (v4 = v3, objc_msgSend(v3, "count")))
    return v4;
  else
    return -[_UIAssetManager _defaultAppearanceNames](self, "_defaultAppearanceNames");
}

- (id)_assetForName:(id)a3
{
  void *v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__221;
  v10 = __Block_byref_object_dispose__221;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33___UIAssetManager__assetForName___block_invoke;
  v5[3] = &unk_1E16E8348;
  v5[5] = a3;
  v5[6] = &v6;
  v5[4] = self;
  -[_UIAssetManager _performBlockWithAssetLock:](self, "_performBlockWithAssetLock:", v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_performBlockWithAssetLock:(id)a3
{
  os_unfair_lock_s *p_assetMapLock;

  p_assetMapLock = &self->_assetMapLock;
  os_unfair_lock_lock(&self->_assetMapLock);
  (*((void (**)(id))a3 + 2))(a3);
  os_unfair_lock_unlock(p_assetMapLock);
}

- (id)_insertAssetIntoMap:(id)a3 forName:(id)a4 lock:(BOOL)a5
{
  void *v5;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__221;
  v12 = __Block_byref_object_dispose__221;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52___UIAssetManager__insertAssetIntoMap_forName_lock___block_invoke;
  v7[3] = &unk_1E16E8320;
  v7[4] = self;
  v7[5] = a4;
  v7[6] = a3;
  v7[7] = &v8;
  if (a5)
    -[_UIAssetManager _performBlockWithAssetLock:](self, "_performBlockWithAssetLock:", v7);
  else
    __52___UIAssetManager__insertAssetIntoMap_forName_lock___block_invoke((uint64_t)v7);
  v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)_assetFromMapForName:(id)a3 lock:(BOOL)a4
{
  void *v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__221;
  v11 = __Block_byref_object_dispose__221;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45___UIAssetManager__assetFromMapForName_lock___block_invoke;
  v6[3] = &unk_1E16CC3B0;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = &v7;
  if (a4)
    -[_UIAssetManager _performBlockWithAssetLock:](self, "_performBlockWithAssetLock:", v6);
  else
    __45___UIAssetManager__assetFromMapForName_lock___block_invoke(v6);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)_assetFromMapForName:(id)a3
{
  return -[_UIAssetManager _assetFromMapForName:lock:](self, "_assetFromMapForName:lock:", a3, 1);
}

- (NSBundle)bundle
{
  return self->_bundle;
}

+ (id)_sharedRuntimeAssetMapKeyForAssetName:(id)a3 inAssetManager:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<image asset named '%@' in asset catalog '%@' for bundle '%@' at path '%@'>"), a3, objc_msgSend(a4, "carFileName"), objc_msgSend((id)objc_msgSend(a4, "bundle"), "bundleIdentifier"), objc_msgSend((id)objc_msgSend(a4, "bundle"), "bundlePath"));
}

- (NSString)carFileName
{
  return self->_assetManagerName;
}

+ (int64_t)_userInterfaceIdiomForDeviceClass:(unint64_t)a3
{
  unint64_t v3;

  v3 = a3 - 1;
  if (a3 - 1 < 7 && ((0x5Fu >> v3) & 1) != 0)
    return qword_186684BE8[v3];
  else
    return -[UIDevice userInterfaceIdiom](+[UIDevice currentDevice](UIDevice, "currentDevice"), "userInterfaceIdiom");
}

- (id)_initWithName:(id)a3 inBundle:(id)a4 idiom:(int64_t)a5 lock:(BOOL)a6 allowMissingCatalog:(BOOL)a7
{
  _BOOL8 v8;
  _UIAssetManager *v12;
  double v13;
  UITraitEnvironmentLayoutDirection v14;
  UIScreen *v15;
  double v16;
  uint64_t v17;
  unint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v22;
  objc_super v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v8 = a6;
  v28 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)_UIAssetManager;
  v12 = -[_UIAssetManager init](&v23, sel_init);
  if (v12)
  {
    v12->_assetManagerName = (NSString *)objc_msgSend(a3, "copy");
    v12->_bundle = (NSBundle *)a4;
    if (+[UIDevice _isWatchCompanion](UIDevice, "_isWatchCompanion"))
    {
      objc_msgSend((id)objc_msgSend((id)getWKInterfaceDeviceClass(), "currentDevice"), "screenScale");
      v12->_preferredScale = v13;
      v12->_preferredGamut = 0;
      v12->_preferredIdiom = 4;
      v14 = -[UITraitCollection layoutDirection](-[UIScreen traitCollection](+[UIScreen mainScreen](UIScreen, "mainScreen"), "traitCollection"), "layoutDirection");
    }
    else
    {
      v15 = +[UIScreen mainScreen](UIScreen, "mainScreen");
      -[UIScreen scale](v15, "scale");
      v12->_preferredScale = v16;
      v12->_preferredGamut = -[UIScreen gamut](v15, "gamut");
      v12->_preferredIdiom = a5;
      v14 = objc_msgSend((id)UIApp, "userInterfaceLayoutDirection");
    }
    v12->_preferredLayoutDirectionTrait = v14;
    v12->_preferredIdiomSubtype = __preferredIdiomSubtypeForIdiom(v12->_preferredIdiom);
    v12->_imageCache = (_UICache *)objc_alloc_init((Class)off_1E167C048);
    v12->_assetMap = (NSMapTable *)(id)objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v12->_assetMapLock._os_unfair_lock_opaque = 0;
    v12->_runtimeCatalogCreationLock._os_unfair_lock_opaque = 0;
    v22 = 0;
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1A6A8]), "initWithName:fromBundle:error:", CFSTR("Assets"), a4, &v22);
    v12->_catalog = (CUICatalog *)v17;
    if (v17 || a7)
    {
      v20 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      objc_msgSend(v20, "addObserver:selector:name:object:", v12, sel__clearCachedResources_, CFSTR("UIApplicationDidReceiveMemoryWarningNotification"), UIApp);
      objc_msgSend(v20, "addObserver:selector:name:object:", v12, sel__clearCachedResources_, CFSTR("UIApplicationDidEnterBackgroundNotification"), UIApp);
      +[_UIAssetManager _saveAssetManager:forBundle:lock:](_UIAssetManager, "_saveAssetManager:forBundle:lock:", v12, a4, v8);
    }
    else
    {

      v18 = _initWithName_inBundle_idiom_lock_allowMissingCatalog____s_category[0];
      if (!_initWithName_inBundle_idiom_lock_allowMissingCatalog____s_category[0])
      {
        v18 = __UILogCategoryGetNode("AssetManager", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v18, _initWithName_inBundle_idiom_lock_allowMissingCatalog____s_category);
      }
      v19 = *(NSObject **)(v18 + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v25 = a4;
        v26 = 2112;
        v27 = v22;
        _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_DEFAULT, "Could not load asset catalog from bundle %@: %@", buf, 0x16u);
      }
      +[_UIAssetManager _saveAssetManager:forBundle:lock:](_UIAssetManager, "_saveAssetManager:forBundle:lock:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), a4, v8);
      return 0;
    }
  }
  return v12;
}

+ (void)_saveAssetManager:(id)a3 forBundle:(id)a4 lock:(BOOL)a5
{
  _BOOL4 v5;
  id v8;

  if (a4)
  {
    v5 = a5;
    v8 = +[_UIAssetManager _assetManagerCache](_UIAssetManager, "_assetManagerCache");
    if (v5)
    {
      os_unfair_lock_lock(&_MergedGlobals_1284);
      objc_msgSend(v8, "setObject:forKey:", a3, objc_msgSend(a4, "bundlePath"));
      os_unfair_lock_unlock(&_MergedGlobals_1284);
    }
    else
    {
      objc_msgSend(v8, "setObject:forKey:", a3, objc_msgSend(a4, "bundlePath"));
    }
  }
}

- (id)resolvedColorNamed:(id)a3 withTraitCollection:(id)a4
{
  UIDisplayGamut v7;
  UIUserInterfaceIdiom v8;
  UIUserInterfaceStyle v9;
  UIAccessibilityContrast v10;
  uint64_t v11;
  UIDisplayGamut v12;
  _QWORD v14[8];
  _QWORD v15[8];

  if ((((!a4 || (v7 = objc_msgSend(a4, "displayGamut"), v7 == UIDisplayGamutUnspecified))
      && (v7 = -[UITraitCollection displayGamut](-[_UIAssetManager preferredTraitCollection](self, "preferredTraitCollection"), "displayGamut"), !a4)|| (v8 = objc_msgSend(a4, "userInterfaceIdiom"), v8 == UIUserInterfaceIdiomUnspecified))&& (v8 = -[UITraitCollection userInterfaceIdiom](-[_UIAssetManager preferredTraitCollection](self, "preferredTraitCollection"), "userInterfaceIdiom"), !a4)|| (v9 = objc_msgSend(a4, "userInterfaceStyle")) == UIUserInterfaceStyleUnspecified)&& (v9 = -[UITraitCollection userInterfaceStyle](-[_UIAssetManager preferredTraitCollection](self, "preferredTraitCollection"), "userInterfaceStyle"), !a4)|| (v10 = objc_msgSend(a4, "accessibilityContrast"), v10 == UIAccessibilityContrastUnspecified))
  {
    v10 = -[UITraitCollection accessibilityContrast](-[_UIAssetManager preferredTraitCollection](self, "preferredTraitCollection"), "accessibilityContrast");
  }
  if ((unint64_t)v8 > UIUserInterfaceIdiomMac)
    v11 = 0;
  else
    v11 = qword_186684BB8[v8];
  if (v7 == UIDisplayGamutUnspecified)
    v12 = UIDisplayGamutSRGB;
  else
    v12 = v7;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58___UIAssetManager_resolvedColorNamed_withTraitCollection___block_invoke;
  v15[3] = &__block_descriptor_64_e27_v16__0___UIMutableTraits__8l;
  v15[4] = v7;
  v15[5] = v8;
  v15[6] = v9;
  v15[7] = v10;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58___UIAssetManager_resolvedColorNamed_withTraitCollection___block_invoke_2;
  v14[3] = &unk_1E16E82F8;
  v14[4] = self;
  v14[5] = a3;
  v14[6] = v12;
  v14[7] = v11;
  return _UIColorFromCUINamedColor(-[_UIAssetManager _lookUpObjectForTraitCollection:objectAccessor:](self, "_lookUpObjectForTraitCollection:objectAccessor:", +[UITraitCollection traitCollectionWithTraits:](UITraitCollection, "traitCollectionWithTraits:", v15), v14));
}

- (id)colorNamed:(id)a3 withTraitCollection:(id)a4
{
  UIDisplayGamut v7;
  UIUserInterfaceIdiom v8;
  uint64_t v9;
  UIDisplayGamut v10;
  UIColor *v11;

  if ((!a4 || (v7 = objc_msgSend(a4, "displayGamut"), v7 == UIDisplayGamutUnspecified))
    && (v7 = -[UITraitCollection displayGamut](-[_UIAssetManager preferredTraitCollection](self, "preferredTraitCollection"), "displayGamut"), !a4)|| (v8 = objc_msgSend(a4, "userInterfaceIdiom"), v8 == UIUserInterfaceIdiomUnspecified))
  {
    v8 = -[UITraitCollection userInterfaceIdiom](-[_UIAssetManager preferredTraitCollection](self, "preferredTraitCollection"), "userInterfaceIdiom");
  }
  v9 = 0;
  if (v7 == UIDisplayGamutUnspecified)
    v10 = UIDisplayGamutSRGB;
  else
    v10 = v7;
  if ((unint64_t)v8 <= UIUserInterfaceIdiomMac)
    v9 = qword_186684BB8[v8];
  v11 = _UIColorFromCUINamedColor((void *)-[CUICatalog colorWithName:displayGamut:deviceIdiom:](self->_catalog, "colorWithName:displayGamut:deviceIdiom:", a3, v10, v9));
  if (v11 && -[_UIAssetManager _hasMultipleAppearances](self, "_hasMultipleAppearances"))
    return -[UIDynamicCatalogColor initWithName:assetManager:genericColor:]((id *)[UIDynamicCatalogColor alloc], a3, self, v11);
  -[UIColor _setDebugName:](v11, "_setDebugName:", a3);
  -[UIColor _setDebugCatalogBundleIdentifier:](v11, "_setDebugCatalogBundleIdentifier:", -[NSBundle bundleIdentifier](self->_bundle, "bundleIdentifier"));
  return v11;
}

- (UITraitCollection)preferredTraitCollection
{
  UITraitCollection *result;
  _QWORD v4[5];

  result = self->_preferredTraitCollection;
  if (!result)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __43___UIAssetManager_preferredTraitCollection__block_invoke;
    v4[3] = &unk_1E16CC690;
    v4[4] = self;
    result = +[UITraitCollection traitCollectionWithTraits:](UITraitCollection, "traitCollectionWithTraits:", v4);
    self->_preferredTraitCollection = result;
  }
  return result;
}

- (BOOL)_hasMultipleAppearances
{
  void *v3;
  uint64_t v4;

  v3 = (void *)-[CUICatalog appearanceNames](self->_catalog, "appearanceNames");
  v4 = objc_msgSend(v3, "count");
  if (v4)
    LOBYTE(v4) = objc_msgSend(v3, "isEqualToArray:", -[_UIAssetManager _defaultAppearanceNames](self, "_defaultAppearanceNames")) ^ 1;
  return v4;
}

- (id)_defaultAppearanceNames
{
  if (qword_1ECD81EE8 != -1)
    dispatch_once(&qword_1ECD81EE8, &__block_literal_global_86_3);
  return (id)qword_1ECD81EE0;
}

+ (id)assetManagerForBundle:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = +[_UIAssetManager _assetManagerCache](_UIAssetManager, "_assetManagerCache");
  v6 = objc_msgSend(a3, "bundlePath");
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  os_unfair_lock_lock(&_MergedGlobals_1284);
  v7 = (void *)objc_msgSend(v5, "objectForKey:", v6);
  if (!v7)
  {
    v8 = (id)objc_msgSend(objc_alloc((Class)a1), "_initWithName:inBundle:idiom:lock:allowMissingCatalog:", CFSTR("Assets"), a3, -[UIDevice userInterfaceIdiom](+[UIDevice currentDevice](UIDevice, "currentDevice"), "userInterfaceIdiom"), 0, 0);
    v7 = v8;
    if (v8)
      objc_msgSend(v8, "disableCacheFlushing");
  }
  os_unfair_lock_unlock(&_MergedGlobals_1284);
  if (objc_msgSend(v7, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")))
    return 0;
  else
    return v7;
}

+ (id)_assetManagerCache
{
  if (qword_1ECD81E80 != -1)
    dispatch_once(&qword_1ECD81E80, &__block_literal_global_601);
  return (id)qword_1ECD81E78;
}

+ (id)newAssetNamed:(id)a3 fromBundle:(id)a4
{
  int v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  char v13;
  id v14;
  id v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *ImageAtPath;
  uint64_t v29;
  NSObject *v30;
  unint64_t v31;
  NSObject *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[16];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_diagnostics())
  {
    if (!a4)
    {
      v30 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v30, OS_LOG_TYPE_FAULT, "Callers must provide a bundle", buf, 2u);
      }
    }
  }
  else if (!a4)
  {
    v31 = qword_1ECD81EB8;
    if (!qword_1ECD81EB8)
    {
      v31 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v31, (unint64_t *)&qword_1ECD81EB8);
    }
    v32 = *(NSObject **)(v31 + 8);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v32, OS_LOG_TYPE_ERROR, "Callers must provide a bundle", buf, 2u);
    }
  }
  if (!a3 || !objc_msgSend(a3, "length"))
    return 0;
  v6 = objc_msgSend(a3, "hasPrefix:", CFSTR("/"));
  v7 = a3;
  if (v6)
    v7 = (id)objc_msgSend(a3, "lastPathComponent");
  v8 = +[_UIAssetManager _sharedRuntimeAssetMapKeyForAssetName:fromFilesInBundle:](_UIAssetManager, "_sharedRuntimeAssetMapKeyForAssetName:fromFilesInBundle:", a3, a4);
  os_unfair_lock_lock(&stru_1ECD81E74);
  v9 = objc_msgSend(+[_UIAssetManager sharedRuntimeAssetMap](_UIAssetManager, "sharedRuntimeAssetMap"), "objectForKey:", v8);
  if (v9)
  {
    v10 = (void *)v9;
    os_unfair_lock_unlock(&stru_1ECD81E74);
    return v10;
  }
  else
  {
    if (+[UIDevice _isWatch](UIDevice, "_isWatch"))
      v13 = 1;
    else
      v13 = +[UIDevice _isWatchCompanion](UIDevice, "_isWatchCompanion");
    if (v6)
      v14 = 0;
    else
      v14 = a4;
    v15 = _UIImageCollectImagePathsForPath(a3, v14, 0, v13);
    if (objc_msgSend(v15, "count"))
    {
      v16 = _CFAppVersionCheck();
      if (v6)
        v17 = objc_msgSend(a3, "stringByDeletingLastPathComponent");
      else
        v17 = objc_msgSend(a4, "bundlePath");
      v18 = v17;
      v19 = objc_alloc_init(MEMORY[0x1E0CB3620]);
      LODWORD(v18) = objc_msgSend(v19, "isWritableFileAtPath:", v18);

      if (!(_DWORD)v18 || v16)
      {
        v11 = -[_UIPathLazyImageAsset _initWithAssetName:forFilesInBundle:imagePaths:haveCGCacheImages:]([_UIPathLazyImageAsset alloc], "_initWithAssetName:forFilesInBundle:imagePaths:haveCGCacheImages:", v7, a4, v15, v6 ^ 1u);
      }
      else
      {
        v11 = -[UIImageAsset _initWithAssetName:forFilesInBundle:]([UIImageAsset alloc], "_initWithAssetName:forFilesInBundle:", v7, a4);
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v20 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v34;
          v23 = v6 ^ 1;
          do
          {
            v24 = 0;
            do
            {
              if (*(_QWORD *)v34 != v22)
                objc_enumerationMutation(v15);
              v25 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v24);
              v26 = _UserInterfaceTraitFromPath(v25);
              if (v26)
                v27 = objc_msgSend(v26, "imageConfiguration");
              else
                v27 = 0;
              ImageAtPath = (void *)GetImageAtPath(v25, v23, 0.0);
              objc_msgSend(v11, "_registerImage:withConfiguration:", ImageAtPath, v27);

              ++v24;
            }
            while (v21 != v24);
            v29 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
            v21 = v29;
          }
          while (v29);
        }
      }
      objc_msgSend(+[_UIAssetManager sharedRuntimeAssetMap](_UIAssetManager, "sharedRuntimeAssetMap"), "setObject:forKey:", v11, v8);
    }
    else
    {
      v11 = 0;
    }
    os_unfair_lock_unlock(&stru_1ECD81E74);
  }
  return v11;
}

+ (id)sharedRuntimeAssetMap
{
  if (qword_1ECD81ED8 != -1)
    dispatch_once(&qword_1ECD81ED8, &__block_literal_global_75_3);
  return (id)qword_1ECD81ED0;
}

+ (id)_sharedRuntimeAssetMapKeyForAssetName:(id)a3 fromFilesInBundle:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<image asset named %@ from files in bundle '%@' at path '%@'>"), a3, objc_msgSend(a4, "bundleIdentifier"), objc_msgSend(a4, "bundlePath"));
}

- (void)disableCacheFlushing
{
  -[_UICache setClearsCacheOnApplicationBackground:](self->_imageCache, "setClearsCacheOnApplicationBackground:", 0);
  -[_UICache setClearsCacheOnLowMemoryWarnings:](self->_imageCache, "setClearsCacheOnLowMemoryWarnings:", 0);
}

- (id)dataNamed:(id)a3
{
  return (id)-[CUICatalog dataWithName:](self->_catalog, "dataWithName:", a3);
}

- (BOOL)_imageBelongsToCoreGlyphs:(id)a3
{
  _UIAssetManager *v4;
  _BOOL4 v5;

  v4 = (_UIAssetManager *)objc_msgSend((id)objc_msgSend(a3, "imageAsset"), "_assetManager");
  LOBYTE(v5) = 0;
  if (v4 && v4 == self)
    return (*(_BYTE *)&self->_assetManagerFlags >> 3) & 1;
  return v5;
}

- (BOOL)_imageBelongsToUIKit:(id)a3
{
  uint64_t v3;

  if ((*(_BYTE *)&self->_assetManagerFlags & 4) != 0)
  {
    v3 = objc_msgSend((id)objc_msgSend(a3, "imageAsset"), "_assetManager");
    if (!v3)
      return v3;
    if ((_UIAssetManager *)v3 == self || (*(_BYTE *)(v3 + 116) & 1) != 0)
    {
      LOBYTE(v3) = 1;
      return v3;
    }
  }
  LOBYTE(v3) = 0;
  return v3;
}

+ (id)sharedRuntimeCatalog
{
  if (qword_1ECD81EC8 != -1)
    dispatch_once(&qword_1ECD81EC8, &__block_literal_global_72_3);
  return (id)qword_1ECD81EC0;
}

- (_UIAssetManager)initWithName:(id)a3 inBundle:(id)a4 idiom:(int64_t)a5
{
  return (_UIAssetManager *)-[_UIAssetManager _initWithName:inBundle:idiom:lock:allowMissingCatalog:](self, "_initWithName:inBundle:idiom:lock:allowMissingCatalog:", a3, a4, a5, 1, 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5[0] = CFSTR("UIApplicationDidReceiveMemoryWarningNotification");
  v5[1] = CFSTR("UIApplicationDidEnterBackgroundNotification");
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2));
  -[_UIAssetManager _disconnectImageAssets](self, "_disconnectImageAssets");

  self->_assetMap = 0;
  self->_runtimeCatalog = 0;

  self->_preferredTraitCollection = 0;
  v4.receiver = self;
  v4.super_class = (Class)_UIAssetManager;
  -[_UIAssetManager dealloc](&v4, sel_dealloc);
}

- (void)_disconnectImageAssets
{
  os_unfair_lock_s *p_assetMapLock;
  NSMapTable *assetMap;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_assetMapLock = &self->_assetMapLock;
  os_unfair_lock_lock(&self->_assetMapLock);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  assetMap = self->_assetMap;
  v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](assetMap, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(assetMap);
        objc_msgSend((id)objc_msgSend(-[NSMapTable objectForKey:](self->_assetMap, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i)), "imageAsset"), "_disconnectFromAssetManager");
      }
      v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](assetMap, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
  os_unfair_lock_unlock(p_assetMapLock);
}

- (id)imageNamed:(id)a3 scale:(double)a4 idiom:(int64_t)a5 subtype:(unint64_t)a6
{
  int v11;
  UITraitCollection *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[8];

  v11 = dyld_program_sdk_at_least();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50___UIAssetManager_imageNamed_scale_idiom_subtype___block_invoke;
  v16[3] = &unk_1E16E82B0;
  *(double *)&v16[5] = a4;
  v16[6] = a5;
  v16[7] = a6;
  v16[4] = self;
  v12 = +[UITraitCollection traitCollectionWithTraits:](UITraitCollection, "traitCollectionWithTraits:", v16);
  if (v12)
    v13 = -[UITraitCollection imageConfiguration](v12, "imageConfiguration");
  else
    v13 = 0;
  if (v11)
    v14 = 0;
  else
    v14 = 3;
  return -[_UIAssetManager imageNamed:configuration:cachingOptions:attachCatalogImage:](self, "imageNamed:configuration:cachingOptions:attachCatalogImage:", a3, v13, v14, 0);
}

- (id)imageNamed:(id)a3 idiom:(int64_t)a4 subtype:(unint64_t)a5
{
  return -[_UIAssetManager imageNamed:scale:idiom:subtype:](self, "imageNamed:scale:idiom:subtype:", a3, a4, a5, self->_preferredScale);
}

- (id)imageNamed:(id)a3 idiom:(int64_t)a4
{
  return -[_UIAssetManager imageNamed:idiom:subtype:](self, "imageNamed:idiom:subtype:", a3, a4, self->_preferredIdiomSubtype);
}

- (id)imageNamed:(id)a3
{
  return -[_UIAssetManager imageNamed:idiom:](self, "imageNamed:idiom:", a3, self->_preferredIdiom);
}

- (_UIAssetManager)initWithURL:(id)a3 idiom:(int64_t)a4 error:(id *)a5
{
  id v7;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  CUICatalog *v14;
  _UIAssetManager *v15;
  UIScreen *v16;
  double v17;
  objc_super v19;
  void *v20;
  uint8_t buf[4];
  uint64_t v22;
  _QWORD v23[2];

  v7 = a3;
  v23[1] = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v23[0] = *MEMORY[0x1E0C999D0];
  v9 = (void *)objc_msgSend((id)objc_msgSend(a3, "resourceValuesForKeys:error:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1), &v20), "objectForKey:", v23[0]);
  if (v9)
  {
    if (objc_msgSend(v9, "BOOLValue"))
      v7 = (id)objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("Assets.car"));
  }
  else
  {
    v10 = initWithURL_idiom_error____s_category;
    if (!initWithURL_idiom_error____s_category)
    {
      v10 = __UILogCategoryGetNode("_UIAssetManager", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&initWithURL_idiom_error____s_category);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend((id)objc_msgSend(v7, "absoluteString"), "UTF8String");
      *(_DWORD *)buf = 136315138;
      v22 = v12;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Could not determine whether path is directory: %s", buf, 0xCu);
    }
  }
  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1A6A8]), "initWithURL:error:", v7, &v20);
  if (v13)
  {
    v14 = (CUICatalog *)v13;
    v19.receiver = self;
    v19.super_class = (Class)_UIAssetManager;
    v15 = -[_UIAssetManager init](&v19, sel_init);
    if (v15)
    {
      v16 = +[UIScreen mainScreen](UIScreen, "mainScreen");
      -[UIScreen scale](v16, "scale");
      v15->_preferredScale = v17;
      v15->_preferredIdiom = a4;
      v15->_preferredIdiomSubtype = __preferredIdiomSubtypeForIdiom(a4);
      v15->_preferredGamut = -[UIScreen gamut](v16, "gamut");
      v15->_preferredLayoutDirectionTrait = objc_msgSend((id)UIApp, "userInterfaceLayoutDirection");
      v15->_catalog = v14;
      v15->_runtimeCatalogCreationLock._os_unfair_lock_opaque = 0;
      v15->_assetMap = (NSMapTable *)(id)objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v15->_assetMapLock._os_unfair_lock_opaque = 0;
      *(_BYTE *)&v15->_assetManagerFlags |= 2u;
    }
    else
    {

    }
  }
  else
  {
    if (a5)
      *a5 = v20;

    return 0;
  }
  return v15;
}

- (id)initManagerWithoutCatalogWithName:(id)a3
{
  return -[_UIAssetManager _initWithName:inBundle:idiom:lock:allowMissingCatalog:](self, "_initWithName:inBundle:idiom:lock:allowMissingCatalog:", a3, 0, -1, 0, 1);
}

+ (void)_executeUnitTestWithAssetManagerCache:(id)a3
{
  os_unfair_lock_lock(&_MergedGlobals_1284);
  (*((void (**)(id, uint64_t))a3 + 2))(a3, objc_msgSend(a1, "_assetManagerCache"));
  os_unfair_lock_unlock(&_MergedGlobals_1284);
}

- (id)_carPlayAssetManager
{
  _QWORD block[5];

  if ((*(_BYTE *)&self->_assetManagerFlags & 4) == 0)
    return 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39___UIAssetManager__carPlayAssetManager__block_invoke;
  block[3] = &unk_1E16B41B8;
  block[4] = self;
  if (qword_1ECD81E90 != -1)
    dispatch_once(&qword_1ECD81E90, block);
  return (id)qword_1ECD81E88;
}

- (BOOL)_managingUIKitAssets
{
  return (*(_BYTE *)&self->_assetManagerFlags >> 2) & 1;
}

- (BOOL)_managingCoreGlyphs
{
  return (*(_BYTE *)&self->_assetManagerFlags >> 3) & 1;
}

- (id)imageNamed:(id)a3 withTrait:(id)a4
{
  if (a4)
    a4 = (id)objc_msgSend(a4, "imageConfiguration");
  return -[_UIAssetManager imageNamed:configuration:](self, "imageNamed:configuration:", a3, a4);
}

- (id)_catalog
{
  return self->_catalog;
}

- (id)_insertAssetIntoMap:(id)a3 forName:(id)a4
{
  return -[_UIAssetManager _insertAssetIntoMap:forName:lock:](self, "_insertAssetIntoMap:forName:lock:", a3, a4, 1);
}

- (CUIMutableCatalog)runtimeCatalog
{
  NSString *v4;

  if (-[_UIAssetManager _isSystemAssetManager](self, "_isSystemAssetManager"))
    return 0;
  os_unfair_lock_lock(&self->_runtimeCatalogCreationLock);
  if (!self->_runtimeCatalog)
  {
    v4 = -[NSString stringByAppendingString:](-[NSBundle bundlePath](self->_bundle, "bundlePath"), "stringByAppendingString:", CFSTR(" - runtime catalog"));
    self->_runtimeCatalog = (CUIMutableCatalog *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1A6B8]), "initWithName:", v4);
  }
  os_unfair_lock_unlock(&self->_runtimeCatalogCreationLock);
  return self->_runtimeCatalog;
}

+ (void)clearSharedRuntimeAssetMapForUnitTests
{
  os_unfair_lock_lock(&stru_1ECD81E74);
  objc_msgSend(+[_UIAssetManager sharedRuntimeAssetMap](_UIAssetManager, "sharedRuntimeAssetMap"), "removeAllObjects");
  os_unfair_lock_unlock(&stru_1ECD81E74);
}

- (void)_clearCachedResources:(id)a3
{
  uint64_t v4;
  _QWORD v5[5];

  if ((objc_msgSend((id)objc_msgSend(a3, "name"), "isEqualToString:", CFSTR("UIApplicationDidEnterBackgroundNotification")) & 1) != 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __41___UIAssetManager__clearCachedResources___block_invoke;
    v5[3] = &__block_descriptor_40_e5_v8__0l;
    v5[4] = 0;
    v4 = objc_msgSend((id)UIApp, "_beginBackgroundTaskWithName:expirationHandler:", CFSTR("com.apple.asset_manager.cache_resource_cleanup"), v5);
    -[_UIAssetManager _clearCachedResources](self, "_clearCachedResources");
    if (v4)
      objc_msgSend((id)UIApp, "_endBackgroundTask:", v4);
  }
  else
  {
    -[_UIAssetManager _clearCachedResources](self, "_clearCachedResources");
  }
}

- (void)_clearCachedResources
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[CUICatalog clearCachedImageResources](self->_catalog, "clearCachedImageResources");
  os_unfair_lock_lock(&stru_1ECD81E74);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = +[_UIAssetManager sharedRuntimeAssetMap](_UIAssetManager, "sharedRuntimeAssetMap");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend((id)objc_msgSend(+[_UIAssetManager sharedRuntimeAssetMap](_UIAssetManager, "sharedRuntimeAssetMap"), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i)), "_clearResolvedImageResources");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v5);
  }
  os_unfair_lock_unlock(&stru_1ECD81E74);
  os_unfair_lock_lock(&self->_assetMapLock);
  v8 = NSAllMapTableKeys(self->_assetMap);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * j);
        if (!objc_msgSend(-[NSMapTable objectForKey:](self->_assetMap, "objectForKey:", v13), "imageAsset"))
          -[NSMapTable removeObjectForKey:](self->_assetMap, "removeObjectForKey:", v13);
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v10);
  }
  os_unfair_lock_unlock(&self->_assetMapLock);
}

- (BOOL)_imageIsSystemImage:(id)a3
{
  return -[_UIAssetManager _imageBelongsToUIKit:](self, "_imageBelongsToUIKit:")
      || -[_UIAssetManager _imageBelongsToCoreGlyphs:](self, "_imageBelongsToCoreGlyphs:", a3);
}

- (id)_allImageNames
{
  return (id)-[CUICatalog allImageNames](self->_catalog, "allImageNames");
}

+ (void)_clearAllCachedImagesAndAssets
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock(&stru_1ECD81E74);
  objc_msgSend(+[_UIAssetManager sharedRuntimeAssetMap](_UIAssetManager, "sharedRuntimeAssetMap"), "removeAllObjects");
  os_unfair_lock_unlock(&stru_1ECD81E74);
  os_unfair_lock_lock(&_MergedGlobals_1284);
  v2 = (void *)MEMORY[0x186DC9484]();
  v3 = +[_UIAssetManager _assetManagerCache](_UIAssetManager, "_assetManagerCache");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)objc_msgSend(v3, "cacheKeys", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_msgSend(v3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          objc_msgSend(v9, "_clearCachedResources");
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  objc_msgSend(+[_UIAssetManager _assetManagerCache](_UIAssetManager, "_assetManagerCache"), "removeAllObjects");
  objc_autoreleasePoolPop(v2);
  os_unfair_lock_unlock(&_MergedGlobals_1284);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p (%@)>: scale: %f, idiom: %ld, subtype: %lu"), NSStringFromClass(v4), self, self->_assetManagerName, *(_QWORD *)&self->_preferredScale, self->_preferredIdiom, self->_preferredIdiomSubtype);
}

+ (double)_watchScreenScale
{
  double v2;
  double v3;
  double result;

  -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
  v3 = v2;
  if (!+[UIDevice _isWatchCompanion](UIDevice, "_isWatchCompanion"))
    return v3;
  objc_msgSend((id)objc_msgSend((id)getWKInterfaceDeviceClass(), "currentDevice"), "screenScale");
  return result;
}

- (double)preferredScale
{
  return self->_preferredScale;
}

- (void)setPreferredScale:(double)a3
{
  self->_preferredScale = a3;
}

- (void)setPreferredTraitCollection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

@end
