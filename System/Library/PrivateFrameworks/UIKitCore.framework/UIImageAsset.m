@implementation UIImageAsset

- (id)_withLock_imageWithConfiguration:(id)a3
{
  UIImageAsset *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  int v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  id v31;
  _QWORD *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  void *v47;
  void *v48;
  _QWORD v49[2];
  void (*v50)(uint64_t);
  void *v51;
  UIImageAsset *v52;
  id v53;
  uint64_t *v54;
  _QWORD aBlock[12];
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  uint64_t v64;
  id *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  _QWORD v70[4];

  v70[2] = *MEMORY[0x1E0C80C00];
  v4 = self;
  v5 = a3;
  -[UIImageAsset _defaultTraitCollection](v4, "_defaultTraitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = (void *)objc_msgSend(v6, "imageConfiguration");
  else
    v8 = 0;
  v9 = v8;
  +[UIImageConfiguration _completeConfiguration:fromConfiguration:]((uint64_t)UIImageConfiguration, v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "_effectiveTraitCollectionForImageLookup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0;
  v65 = (id *)&v64;
  v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__110;
  v68 = __Block_byref_object_dispose__110;
  v69 = 0;
  v62 = 0;
  v63 = 0.0;
  v60 = 0;
  v61 = 0;
  v58 = 0;
  v59 = 0;
  v57 = 0;
  v56 = objc_msgSend(v11, "layoutDirection");
  v12 = objc_msgSend(v11, "horizontalSizeClass");
  v13 = objc_msgSend(v11, "verticalSizeClass");
  +[_UIAssetManager _convertTraitCollection:toCUIScale:CUIIdiom:UIKitIdiom:UIKitUserInterfaceStyle:subtype:CUIDisplayGamut:UIKitLayoutDirection:CUILayoutDirection:]((uint64_t)_UIAssetManager, v11, &v63, &v62, &v59, &v58, &v60, &v61, &v56, &v57);
  -[UIImageAsset _assetManager](v4, "_assetManager");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if ((*(_BYTE *)&v4->_assetFlags & 1) != 0)
  {
    v24 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__UIImageAsset__withLock_imageWithConfiguration___block_invoke;
    aBlock[3] = &unk_1E16CB228;
    aBlock[4] = v4;
    *(double *)&aBlock[5] = v63;
    aBlock[6] = v62;
    aBlock[7] = v60;
    aBlock[8] = v61;
    aBlock[9] = v57;
    aBlock[10] = v12;
    aBlock[11] = v13;
    v48 = _Block_copy(aBlock);
    -[UIImageAsset _withLock_lookUpRegisteredObjectForTraitCollection:withAccessorWithAppearanceName:](v4, "_withLock_lookUpRegisteredObjectForTraitCollection:withAccessorWithAppearanceName:", v11, v48);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (!v25)
    {
      if (dyld_program_sdk_at_least())
      {
        v49[0] = v24;
        v49[1] = 3221225472;
        v50 = __49__UIImageAsset__withLock_imageWithConfiguration___block_invoke_2;
        v51 = &unk_1E16BDBB0;
        v52 = v4;
        v53 = v10;
        v54 = &v64;
        v32 = v49;
        os_unfair_lock_lock((os_unfair_lock_t)&__UIImageAssetRegisterLock);
        v50((uint64_t)v32);

        os_unfair_lock_unlock((os_unfair_lock_t)&__UIImageAssetRegisterLock);
      }
      if (!v65[5] && (*(_BYTE *)&v4->_assetFlags & 2) != 0)
      {
        -[UIImageAsset _withLock_updateAssetFromBlockGenerationWithConfiguration:resolvedCatalogImage:](v4, "_withLock_updateAssetFromBlockGenerationWithConfiguration:resolvedCatalogImage:", v10, 0);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = v65[5];
        v65[5] = (id)v33;

      }
      goto LABEL_29;
    }
    objc_msgSend(v25, "configuration");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "_effectiveTraitCollectionForImageLookup");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[UITraitCollection _matchesIntersectionWithTraitCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly:]((uint64_t)v11, (uint64_t)v28);

    if (v29)
      goto LABEL_28;
    if (v15)
    {
      -[UIImageAsset assetName](v4, "assetName");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "imageNamed:configuration:cachingOptions:attachCatalogImage:", v37, v10, 0, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v38)
      {
LABEL_26:

LABEL_27:
        if (v65[5])
        {
LABEL_29:

          goto LABEL_30;
        }
LABEL_28:
        objc_msgSend(v26, "UIImageWithAsset:configuration:flippedHorizontally:optionalVectorImage:", v4, v10, 0, 0);
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = v65[5];
        v65[5] = (id)v43;

        _UIImageDecorateFallbackImage(v65[5]);
        goto LABEL_29;
      }
      objc_getAssociatedObject(v38, &CUINamedImageKey);
      v39 = (id)objc_claimAutoreleasedReturnValue();
      v47 = (void *)MEMORY[0x1E0D1A6A8];
      v70[0] = v26;
      v70[1] = v39;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "bestMatchUsingImages:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:", v40, v62, v60, v61, v57, v12, v63, v13);
      v41 = (id)objc_claimAutoreleasedReturnValue();

      if (v41 == v39)
        objc_storeStrong(v65 + 5, v38);
      objc_setAssociatedObject(v38, &CUINamedImageKey, 0, (void *)1);

    }
    else
    {
      if ((*(_BYTE *)&v4->_assetFlags & 2) == 0)
        goto LABEL_27;
      objc_msgSend(v26, "UIImageWithAsset:configuration:flippedHorizontally:optionalVectorImage:", v4, v10, 0, 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageAsset _withLock_updateAssetFromBlockGenerationWithConfiguration:resolvedCatalogImage:](v4, "_withLock_updateAssetFromBlockGenerationWithConfiguration:resolvedCatalogImage:", v10, v38);
      v42 = objc_claimAutoreleasedReturnValue();
      v39 = v65[5];
      v65[5] = (id)v42;
    }

    goto LABEL_26;
  }
  if (v14)
  {
    -[UIImageAsset assetName](v4, "assetName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imageNamed:configuration:cachingOptions:attachCatalogImage:", v16, v10, 0, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v65[5];
    v65[5] = (id)v17;

    v19 = dyld_program_sdk_at_least();
    v20 = v65[5];
    if (v19)
    {
      objc_msgSend(v65[5], "configuration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_imageWithImageAsset:configuration:", v4, v21);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v65[5];
      v65[5] = (id)v22;

    }
    else
    {
      objc_msgSend(v65[5], "_imageWithImageAsset:", v4);
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = v65[5];
      v65[5] = (id)v35;

    }
  }
  else if ((*(_BYTE *)&v4->_assetFlags & 2) != 0)
  {
    -[UIImageAsset _withLock_updateAssetFromBlockGenerationWithConfiguration:resolvedCatalogImage:](v4, "_withLock_updateAssetFromBlockGenerationWithConfiguration:resolvedCatalogImage:", v10, 0);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v65[5];
    v65[5] = (id)v30;

  }
LABEL_30:
  v45 = v65[5];

  _Block_object_dispose(&v64, 8);
  return v45;
}

- (NSString)assetName
{
  return self->_assetName;
}

- (_UIAssetManager)_assetManager
{
  return (_UIAssetManager *)objc_loadWeakRetained((id *)&self->_assetManager);
}

- (UITraitCollection)_defaultTraitCollection
{
  return self->_defaultTraitCollection;
}

- (id)_initWithAssetName:(id)a3 forManager:(id)a4
{
  id v6;
  id v7;
  UIImageAsset *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UIImageAsset;
  v8 = -[UIImageAsset init](&v11, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "bundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CommonInit_1(v8, v6, v7, v9);

  }
  return v8;
}

void __96__UIImageAsset__performLookUpRegisteredObjectForTraitCollection_withAccessorWithAppearanceName___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      *a3 = 1;
  }

}

- (UIImage)imageWithConfiguration:(UIImageConfiguration *)configuration
{
  os_unfair_lock_s *p_lock;
  UIImageConfiguration *v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = configuration;
  os_unfair_lock_lock(p_lock);
  -[UIImageAsset _withLock_imageWithConfiguration:](self, "_withLock_imageWithConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return (UIImage *)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  NSBundle *v7;
  NSBundle *v8;
  NSBundle *v9;
  int v10;
  void *v11;
  NSBundle *v12;
  void *v13;
  void *v14;
  NSBundle *v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = (void *)v5[10];
    v7 = self->_assetName;
    v8 = v6;
    if (v7 == v8)
    {

    }
    else
    {
      v9 = v8;
      LOBYTE(v10) = 0;
      if (!v7 || !v8)
        goto LABEL_21;
      v10 = -[NSBundle isEqual:](v7, "isEqual:", v8);

      if (!v10)
        goto LABEL_22;
    }
    v11 = (void *)v5[2];
    v7 = self->_containingBundle;
    v12 = v11;
    if (v7 == v12)
    {

LABEL_15:
      -[UIImageAsset _assetManager](self, "_assetManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_assetManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v13;
      v15 = v14;
      v9 = v15;
      if (v7 == v15)
      {
        LOBYTE(v10) = 1;
      }
      else
      {
        LOBYTE(v10) = 0;
        if (v7 && v15)
          LOBYTE(v10) = -[NSBundle isEqual:](v7, "isEqual:", v15);
      }

      goto LABEL_21;
    }
    v9 = v12;
    LOBYTE(v10) = 0;
    if (v7 && v12)
    {
      v10 = -[NSBundle isEqual:](v7, "isEqual:", v12);

      if (!v10)
        goto LABEL_22;
      goto LABEL_15;
    }
LABEL_21:

LABEL_22:
    goto LABEL_23;
  }
  LOBYTE(v10) = 0;
LABEL_23:

  return v10;
}

- (CUINamedLayerStack)_layerStack
{
  void *v3;
  void (**layerStack)(void *, UIImageAsset *, void *);
  BOOL v5;
  CUINamedLayerStack *v6;

  -[UIImageAsset _assetManager](self, "_assetManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  layerStack = (void (**)(void *, UIImageAsset *, void *))self->_layerStack;
  if (layerStack)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (!v5)
  {
    layerStack = (void (**)(void *, UIImageAsset *, void *))self->_rebuildStackImage;
    if (layerStack)
    {
      layerStack[2](layerStack, self, v3);
      layerStack = (void (**)(void *, UIImageAsset *, void *))self->_layerStack;
    }
  }
  v6 = layerStack;

  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  id v7;
  objc_super v8;

  if ((*(_BYTE *)&self->_assetFlags & 1) != 0)
  {
    -[UIImageAsset _unsafe_mutableCatalog](self, "_unsafe_mutableCatalog");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageAsset _nameForStoringRuntimeRegisteredImagesInMutableCatalog](self, "_nameForStoringRuntimeRegisteredImagesInMutableCatalog");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeImagesNamed:", v4);

  }
  WeakRetained = objc_loadWeakRetained(&self->_unpinObserver);

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_loadWeakRetained(&self->_unpinObserver);
    objc_msgSend(v6, "removeObserver:", v7);

  }
  v8.receiver = self;
  v8.super_class = (Class)UIImageAsset;
  -[UIImageAsset dealloc](&v8, sel_dealloc);
}

- (id)_initWithAssetName:(id)a3 forFilesInBundle:(id)a4
{
  id v6;
  id v7;
  UIImageAsset *v8;
  UIImageAsset *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UIImageAsset;
  v8 = -[UIImageAsset init](&v11, sel_init);
  v9 = v8;
  if (v8)
    CommonInit_1(v8, v6, 0, v7);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetName, 0);
  objc_storeStrong(&self->_creationBlock, 0);
  objc_storeStrong(&self->_rebuildStackImage, 0);
  objc_destroyWeak(&self->_unpinObserver);
  objc_storeStrong((id *)&self->_layerStack, 0);
  objc_destroyWeak((id *)&self->_assetManager);
  objc_storeStrong((id *)&self->_defaultTraitCollection, 0);
  objc_storeStrong((id *)&self->_containingBundle, 0);
}

- (UIImage)imageWithTraitCollection:(UITraitCollection *)traitCollection
{
  UIImageConfiguration *v4;
  UIImageConfiguration *v5;
  void *v6;

  if (traitCollection)
    v4 = -[UITraitCollection imageConfiguration](traitCollection, "imageConfiguration");
  else
    v4 = 0;
  v5 = v4;
  -[UIImageAsset imageWithConfiguration:](self, "imageWithConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v6;
}

- (id)_withLock_lookUpRegisteredObjectForTraitCollection:(id)a3 withAccessorWithAppearanceName:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  os_unfair_lock_assert_owner(&self->_lock);
  if (v6)
    -[UIImageAsset _performLookUpRegisteredObjectForTraitCollection:withAccessorWithAppearanceName:](self, "_performLookUpRegisteredObjectForTraitCollection:withAccessorWithAppearanceName:", v6, v7);
  else
    v7[2](v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_performLookUpRegisteredObjectForTraitCollection:(id)a3 withAccessorWithAppearanceName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  -[UIImageAsset _withLock_registeredAppearanceNames](self, "_withLock_registeredAppearanceNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__110;
  v21 = __Block_byref_object_dispose__110;
  v22 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __96__UIImageAsset__performLookUpRegisteredObjectForTraitCollection_withAccessorWithAppearanceName___block_invoke;
  v13[3] = &unk_1E16CB278;
  v9 = v8;
  v14 = v9;
  v16 = &v17;
  v10 = v7;
  v15 = v10;
  -[UITraitCollection _enumerateThemeAppearanceNamesForLookup:](v6, (uint64_t)v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (void)registerImage:(UIImage *)image withTraitCollection:(UITraitCollection *)traitCollection
{
  UIImage *v6;
  UIImageConfiguration *v7;
  UIImageConfiguration *v8;

  v6 = image;
  if (traitCollection)
    v7 = -[UITraitCollection imageConfiguration](traitCollection, "imageConfiguration");
  else
    v7 = 0;
  v8 = v7;
  -[UIImageAsset _registerImage:withConfiguration:](self, "_registerImage:withConfiguration:", v6, v8);

}

- (UIImageAsset)init
{
  UIImageAsset *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIImageAsset;
  v2 = -[UIImageAsset init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    CommonInit_1(v2, v4, 0, 0);

  }
  return v2;
}

- (void)_registerImage:(id)a3 withConfiguration:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_lock);
  -[UIImageAsset _withLock_registerImage:withConfiguration:](self, "_withLock_registerImage:withConfiguration:", v8, v7);

  os_unfair_lock_unlock(p_lock);
}

- (void)_withLock_registerImage:(id)a3 withConfiguration:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_assert_owner(p_lock);
  -[UIImageAsset _unsafe_registerImage:withConfiguration:](self, "_unsafe_registerImage:withConfiguration:", v8, v7);

}

- (id)_withLock_registeredAppearanceNames
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  -[UIImageAsset _withLock_mutableCatalog](self, "_withLock_mutableCatalog");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appearanceNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(v4, "count"))
  {
    v5 = v4;
  }
  else
  {
    v8[0] = CFSTR("UIAppearanceAny");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

id __49__UIImageAsset__withLock_imageWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_withLock_mutableCatalog");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_nameForStoringRuntimeRegisteredImagesInMutableCatalog");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:", v6, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(double *)(a1 + 40), *(_QWORD *)(a1 + 88), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_unsafe_registerImage:(id)a3 withConfiguration:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  UIImageAsset *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  _QWORD v30[7];

  v29 = a3;
  v6 = a4;
  if (v29)
  {
    -[UIImageAsset _assetManager](self, "_assetManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && (objc_msgSend(v7, "_managingUIKitAssets") & 1) != 0)
      goto LABEL_24;
    if ((dyld_program_sdk_at_least() & 1) != 0 || (objc_msgSend(v29, "isSymbolImage") & 1) != 0)
    {
      objc_msgSend(v29, "content", v29);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isCGImageOnly");

      if (!v10)
      {
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __56__UIImageAsset__unsafe_registerImage_withConfiguration___block_invoke_2;
        v30[3] = &unk_1E16B47A8;
        v30[4] = self;
        v30[5] = v29;
        v30[6] = v6;
        os_unfair_lock_lock((os_unfair_lock_t)&__UIImageAssetRegisterLock);
        __56__UIImageAsset__unsafe_registerImage_withConfiguration___block_invoke_2((uint64_t)v30);
        os_unfair_lock_unlock((os_unfair_lock_t)&__UIImageAssetRegisterLock);
LABEL_24:

        goto LABEL_25;
      }
    }
    else
    {
      objc_msgSend(v29, "content");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isCGImage");

      if ((v12 & 1) == 0)
        goto LABEL_24;
    }
    v13 = self;
    objc_msgSend(v6, "_effectiveTraitCollectionForImageLookup");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_namedImageDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v29, "renderingMode");
    v17 = 1;
    if (v16 != 2)
      v17 = 2;
    if (v16 == 1)
      v18 = 0;
    else
      v18 = v17;
    objc_msgSend(v15, "setTemplateRenderingMode:", v18, v29);
    objc_msgSend(v29, "alignmentRectInsets");
    objc_msgSend(v15, "setAlignmentEdgeInsets:");
    objc_msgSend(v15, "setResizingMode:", objc_msgSend(v29, "resizingMode") != 0);
    objc_msgSend(v29, "capInsets");
    if (v22 == 0.0 && v19 == 0.0 && v21 == 0.0 && v20 == 0.0)
    {
      objc_msgSend(v15, "setImageType:", 0);
    }
    else
    {
      objc_msgSend(v15, "setImageType:", 3);
      objc_msgSend(v29, "capInsets");
      objc_msgSend(v15, "setEdgeInsets:");
    }
    v23 = objc_msgSend(v29, "imageOrientation");
    if (v23 >= 8)
      v24 = 0;
    else
      v24 = (0x75426831u >> (4 * v23)) & 0xF;
    objc_msgSend(v15, "setExifOrientation:", v24);
    -[UIImageAsset _unsafe_mutableCatalog](v13, "_unsafe_mutableCatalog");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_retainAutorelease(v29);
    v27 = objc_msgSend(v26, "CGImage");
    -[UIImageAsset _nameForStoringRuntimeRegisteredImagesInMutableCatalog](v13, "_nameForStoringRuntimeRegisteredImagesInMutableCatalog");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "insertCGImage:withName:andDescription:", v27, v28, v15);

    *(_BYTE *)&v13->_assetFlags |= 1u;
    objc_msgSend(v26, "_setImageAsset:", v13);

    goto LABEL_24;
  }
LABEL_25:

}

- (id)_unsafe_mutableCatalog
{
  void *v2;
  void *v3;
  void *v4;

  -[UIImageAsset _assetManager](self, "_assetManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "runtimeCatalog");
  else
    +[_UIAssetManager sharedRuntimeCatalog](_UIAssetManager, "sharedRuntimeCatalog");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_nameForStoringRuntimeRegisteredImagesInMutableCatalog
{
  void *v3;
  void *v4;
  NSString *v5;
  void *v6;
  NSBundle *containingBundle;
  void *v8;
  NSString *v9;
  void *v10;
  int has_internal_diagnostics;
  int v12;
  void *v13;
  NSString *assetName;
  void *v15;
  NSObject *v17;
  unint64_t v18;
  NSObject *v19;
  uint8_t buf[16];
  uint8_t v21[16];

  -[UIImageAsset _assetManager](self, "_assetManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (!dyld_program_sdk_at_least())
    {
      has_internal_diagnostics = os_variant_has_internal_diagnostics();
      v12 = objc_msgSend(v3, "_managingUIKitAssets");
      if (has_internal_diagnostics)
      {
        if (v12)
        {
          __UIFaultDebugAssertLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v21 = 0;
            _os_log_fault_impl(&dword_185066000, v17, OS_LOG_TYPE_FAULT, "Should never try to add variants to a UIKit asset", v21, 2u);
          }

        }
      }
      else if (v12)
      {
        v18 = _nameForStoringRuntimeRegisteredImagesInMutableCatalog___s_category;
        if (!_nameForStoringRuntimeRegisteredImagesInMutableCatalog___s_category)
        {
          v18 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v18, (unint64_t *)&_nameForStoringRuntimeRegisteredImagesInMutableCatalog___s_category);
        }
        v19 = *(NSObject **)(v18 + 8);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "Should never try to add variants to a UIKit asset", buf, 2u);
        }
      }
      v13 = (void *)MEMORY[0x1E0CB3940];
      assetName = self->_assetName;
      objc_msgSend(v3, "carFileName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSBundle bundlePath](self->_containingBundle, "bundlePath");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("<image asset '%@' in catalog '%@' in bundle at path '%@'>"), assetName, v6, v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = self->_assetName;
    -[NSBundle bundlePath](self->_containingBundle, "bundlePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<image asset '%@' in bundle at path '%@'>"), v5, v6);
  }
  else
  {
    containingBundle = self->_containingBundle;
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = self->_assetName;
    if (!containingBundle)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<runtime image asset '%@'>"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    -[NSBundle bundlePath](containingBundle, "bundlePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("<image asset '%@' in resources for bundle at path '%@'>"), v9, v6);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

LABEL_11:
  return v10;
}

- (id)_withLock_mutableCatalog
{
  os_unfair_lock_assert_owner(&self->_lock);
  return -[UIImageAsset _unsafe_mutableCatalog](self, "_unsafe_mutableCatalog");
}

+ (id)_dynamicAssetNamed:(id)a3 generator:(id)a4
{
  id v7;
  id v8;
  _BYTE *v9;
  _BYTE *v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIImageAsset.m"), 148, CFSTR("assets initialized with _dynamicAssetNamed:generator must provide a block"));

  }
  v9 = (_BYTE *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithAssetName:forManager:", v7, 0);
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "setCreationBlock:", v8);
    v10[32] |= 2u;
  }

  return v10;
}

- (UIImageAsset)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  UIImageAsset *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  UIImageAsset *v25;
  UIImageAsset *v26;
  UIImageAsset *v27;
  UIImageAsset *v28;
  void *v30;
  void *v31;
  NSCoder *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = coder;
  -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIImageAssetName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = 0;
  if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIImageAssetHadAssetManager")) && v5)
  {
    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIImageAssetManagerBundlePath")))
      {
        v8 = (void *)MEMORY[0x1E0CB34D0];
        -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIImageAssetManagerBundlePath"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "bundleWithPath:", v9);
        v10 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v10;
      }
      +[_UIAssetManager assetManagerForBundle:](_UIAssetManager, "assetManagerForBundle:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
      v7 = 0;
    }
  }
  objc_msgSend(v7, "_assetFromMapForName:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;

LABEL_10:
    CommonInit_1(v13, v5, v7, v6);
LABEL_11:
    if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIImageAssetHasRegisteredImages")))
    {
      v31 = v12;
      *(_BYTE *)&v13->_assetFlags |= 1u;
      v14 = (void *)MEMORY[0x1E0C99E60];
      v15 = objc_opt_class();
      objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
      v32 = v4;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCoder decodeObjectOfClasses:forKey:](v4, "decodeObjectOfClasses:forKey:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v34 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_msgSend(v21, "configuration");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIImageAsset _unsafe_registerImage:withConfiguration:](v13, "_unsafe_registerImage:withConfiguration:", v21, v22);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        }
        while (v18);
      }

      v12 = v31;
      v4 = v32;
    }
    goto LABEL_30;
  }
  v37.receiver = self;
  v37.super_class = (Class)UIImageAsset;
  v13 = -[UIImageAsset init](&v37, sel_init);
  if (!v13)
  {
    CommonInit_1(0, v5, v7, v6);
    goto LABEL_30;
  }
  if (!v5 || !objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "UUIDString");
    v24 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v24;
  }
  if (!v7)
    goto LABEL_10;
  objc_msgSend(v7, "_insertAssetIntoMap:forName:", v13, v13->_assetName);
  v25 = (UIImageAsset *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25 != v13)
  {
    v27 = v25;

    v13 = v27;
  }

  CommonInit_1(v13, v5, v7, v6);
  if (v13)
    goto LABEL_11;
LABEL_30:
  v28 = v13;

  return v28;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  os_unfair_lock_s *p_lock;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIImageAsset assetName](self, "assetName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("UIImageAssetName"));

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[UIImageAsset _assetManager](self, "_assetManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((objc_msgSend(v7, "_managingUIKitAssets") & 1) == 0)
    {
      objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIImageAssetHadAssetManager"));
      objc_msgSend(v8, "bundle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 != v10)
      {
        objc_msgSend(v8, "bundle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bundlePath");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("UIImageAssetManagerBundlePath"));

      }
    }
  }
  objc_msgSend(v4, "encodeBool:forKey:", *(_BYTE *)&self->_assetFlags & 1, CFSTR("UIImageAssetHasRegisteredImages"));
  if ((*(_BYTE *)&self->_assetFlags & 1) != 0)
  {
    -[UIImageAsset _withLock_mutableCatalog](self, "_withLock_mutableCatalog");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageAsset _nameForStoringRuntimeRegisteredImagesInMutableCatalog](self, "_nameForStoringRuntimeRegisteredImagesInMutableCatalog");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imagesWithName:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v15, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v22, "configuration");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "UIImageWithAsset:configuration:flippedHorizontally:optionalVectorImage:", self, v23, 0, 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "addObject:", v24);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v19);
    }

    objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("UIImageAssetRegisteredImages"));
    p_lock = &self->_lock;
  }
  os_unfair_lock_unlock(p_lock);

}

- (id)_symbolConfiguration
{
  return 0;
}

void __49__UIImageAsset__withLock_imageWithConfiguration___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_getAssociatedObject(*(id *)(a1 + 32), &ImageRegisterKey);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v7, "matchesConfiguration:", *(_QWORD *)(a1 + 40), (_QWORD)v11))
        {
          objc_msgSend(v7, "image");
          v8 = objc_claimAutoreleasedReturnValue();
          v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v10 = *(void **)(v9 + 40);
          *(_QWORD *)(v9 + 40) = v8;

          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)_unregisterImageWithDescription:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[UIImageAsset _withLock_unregisterImageWithDescription:](self, "_withLock_unregisterImageWithDescription:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)_withLock_unregisterImageWithDescription:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  -[UIImageAsset _nameForStoringRuntimeRegisteredImagesInMutableCatalog](self, "_nameForStoringRuntimeRegisteredImagesInMutableCatalog");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImageAsset _withLock_mutableCatalog](self, "_withLock_mutableCatalog");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeImageNamed:withDescription:", v9, v5);

  -[UIImageAsset _withLock_mutableCatalog](self, "_withLock_mutableCatalog");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imagesWithName:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)&self->_assetFlags = *(_BYTE *)&self->_assetFlags & 0xFE | (objc_msgSend(v8, "count") != 0);
}

- (void)unregisterImageWithConfiguration:(UIImageConfiguration *)configuration
{
  void *v4;
  id v5;

  -[UIImageConfiguration _effectiveTraitCollectionForImageLookup](configuration, "_effectiveTraitCollectionForImageLookup");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_namedImageDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageAsset _unregisterImageWithDescription:](self, "_unregisterImageWithDescription:", v4);

}

- (void)unregisterImageWithTraitCollection:(UITraitCollection *)traitCollection
{
  id v4;

  -[UITraitCollection _namedImageDescription](traitCollection, "_namedImageDescription");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImageAsset _unregisterImageWithDescription:](self, "_unregisterImageWithDescription:", v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_assetName, "hash");
}

- (void)_setLayerStack:(id)a3
{
  CUINamedLayerStack *v5;
  void *v6;
  id v7;
  id *p_unpinObserver;
  id WeakRetained;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id location;

  v5 = (CUINamedLayerStack *)a3;
  if (self->_layerStack != v5)
  {
    objc_storeStrong((id *)&self->_layerStack, a3);
    -[UIImageAsset _assetManager](self, "_assetManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_7;
    if (-[CUINamedLayerStack representsOnDemandContent](v5, "representsOnDemandContent")
      && v6
      && (v7 = objc_loadWeakRetained(&self->_unpinObserver), v7, !v7))
    {
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bundle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *MEMORY[0x1E0CB3BB8];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __31__UIImageAsset__setLayerStack___block_invoke;
      v17[3] = &unk_1E16CB250;
      objc_copyWeak(&v18, &location);
      v17[4] = self;
      v16 = (id)objc_msgSend(v12, "addObserverForName:object:queue:usingBlock:", v15, v13, v14, v17);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else if ((-[CUINamedLayerStack representsOnDemandContent](v5, "representsOnDemandContent") & 1) == 0)
    {
LABEL_7:
      p_unpinObserver = &self->_unpinObserver;
      WeakRetained = objc_loadWeakRetained(p_unpinObserver);

      if (WeakRetained)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_loadWeakRetained(p_unpinObserver);
        objc_msgSend(v10, "removeObserver:", v11);

      }
    }

  }
}

void __31__UIImageAsset__setLayerStack___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((_QWORD *)WeakRetained + 6);
    *((_QWORD *)WeakRetained + 6) = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
    objc_msgSend(v3, "removeObserver:", v4);

  }
}

void __56__UIImageAsset__unsafe_registerImage_withConfiguration___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_getAssociatedObject(*(id *)(a1 + 32), &ImageRegisterKey);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = (id)objc_opt_new();
    objc_setAssociatedObject(*(id *)(a1 + 32), &ImageRegisterKey, v3, (void *)1);
  }
  +[_UIImageAssetLocalRegistration registrationWithImage:configuration:](_UIImageAssetLocalRegistration, "registrationWithImage:configuration:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "insertObject:atIndex:", v2, 0);

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) |= 1u;
}

- (id)_withLock_updateAssetFromBlockGenerationWithConfiguration:(id)a3 resolvedCatalogImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  -[UIImageAsset creationBlock](self, "creationBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIImageAsset creationBlock](self, "creationBlock");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, UIImageAsset *, id, id))v9)[2](v9, self, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (void *)v10;
    else
      v12 = v7;
    v13 = v12;

    v14 = v7;
    if (v13 != v7)
    {
      objc_msgSend(v13, "_primitiveImageAsset");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        objc_msgSend(v13, "_imageWithImageAsset:configuration:", self, v6);
        v16 = objc_claimAutoreleasedReturnValue();

        v13 = (id)v16;
      }
      -[UIImageAsset _withLock_registerImage:withConfiguration:](self, "_withLock_registerImage:withConfiguration:", v13, v6);
      v14 = v13;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)_containsImagesInPath:(id)a3
{
  return 0;
}

- (void)_disconnectFromAssetManager
{
  -[UIImageAsset set_assetManager:](self, "set_assetManager:", 0);
}

- (id)_renditionCache:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  BOOL v6;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v3 = a3;
  if (pthread_main_np() != 1)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "Accessing rendition cache from non-main thread is not safe!", buf, 2u);
      }

    }
    else
    {
      v8 = _renditionCache____s_category;
      if (!_renditionCache____s_category)
      {
        v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v8, (unint64_t *)&_renditionCache____s_category);
      }
      v9 = *(NSObject **)(v8 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Accessing rendition cache from non-main thread is not safe!", v11, 2u);
      }
    }
  }
  objc_getAssociatedObject(self, (const void *)_renditionCache__key);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = 1;
  else
    v6 = !v3;
  if (!v6)
  {
    v5 = (void *)objc_opt_new();
    objc_setAssociatedObject(self, (const void *)_renditionCache__key, v5, (void *)1);
  }
  return v5;
}

- (void)_cacheRendition:(id)a3 forSize:(CGSize)a4 tintColor:(id)a5 traitCollection:(id)a6 bold:(BOOL)a7 drawMode:(unsigned int)a8
{
  uint64_t v8;
  _BOOL8 v9;
  double height;
  double width;
  id v15;
  void *v16;
  id v17;

  v8 = *(_QWORD *)&a8;
  v9 = a7;
  height = a4.height;
  width = a4.width;
  v15 = a3;
  +[_UIImageAssetRenditionCacheKey keyWithSize:unresolvedTintColor:traitCollection:bold:drawMode:](_UIImageAssetRenditionCacheKey, "keyWithSize:unresolvedTintColor:traitCollection:bold:drawMode:", a5, a6, v9, v8, width, height);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImageAsset _renditionCache:](self, "_renditionCache:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", v15, v17);

}

- (id)_cachedRenditionWithSize:(CGSize)a3 tintColor:(id)a4 traitCollection:(id)a5 bold:(BOOL)a6 drawMode:(unsigned int)a7
{
  uint64_t v7;
  _BOOL8 v8;
  double height;
  double width;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = *(_QWORD *)&a7;
  v8 = a6;
  height = a3.height;
  width = a3.width;
  v13 = a4;
  v14 = a5;
  -[UIImageAsset _renditionCache:](self, "_renditionCache:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    +[_UIImageAssetRenditionCacheKey keyWithSize:unresolvedTintColor:traitCollection:bold:drawMode:](_UIImageAssetRenditionCacheKey, "keyWithSize:unresolvedTintColor:traitCollection:bold:drawMode:", v13, v14, v8, v7, width, height);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)set_assetManager:(id)a3
{
  objc_storeWeak((id *)&self->_assetManager, a3);
}

- (id)_unpinObserver
{
  return objc_loadWeakRetained(&self->_unpinObserver);
}

- (void)_setUnpinObserver:(id)a3
{
  objc_storeWeak(&self->_unpinObserver, a3);
}

- (id)_rebuildStackImage
{
  return self->_rebuildStackImage;
}

- (void)_setRebuildStackImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)creationBlock
{
  return self->_creationBlock;
}

- (void)setCreationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setAssetName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

@end
