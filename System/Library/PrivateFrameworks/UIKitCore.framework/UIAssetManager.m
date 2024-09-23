@implementation UIAssetManager

uint64_t __78___UIAssetManager_imageNamed_configuration_cachingOptions_attachCatalogImage___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int8 *v18;
  unsigned int v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _QWORD v24[4];
  id v25;
  unsigned __int8 *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  char v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  unint64_t v44;
  uint64_t v45;

  if (!*(_BYTE *)(a1 + 64)
    || (v6 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "objectForKey:", +[_UIImageCacheKey keyWithName:configuration:](_UIImageCacheKey, "keyWithName:configuration:", a2, *(_QWORD *)(a1 + 32))), v7 = (uint64_t)v6, (a3 & 1) == 0)&& (objc_msgSend(v6, "isSymbolImage") & 1) != 0|| !v7)
  {
    if ((*(_BYTE *)(*(_QWORD *)(a1 + 40) + 116) & 6) != 4
      || objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_effectiveTraitCollectionForImageLookup"), "userInterfaceIdiom") != 3|| (v8 = (void *)objc_msgSend(*(id *)(a1 + 40), "_carPlayAssetManager"), *(void **)(a1 + 40) == v8)|| (v7 = objc_msgSend(v8, "imageNamed:configuration:cachingOptions:attachCatalogImage:", a2, *(_QWORD *)(a1 + 32), 0, *(unsigned __int8 *)(a1 + 65))) == 0)
    {
      v9 = (void *)objc_msgSend(*(id *)(a1 + 32), "_effectiveTraitCollectionForImageLookup");
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64);
      v44 = -1;
      v45 = v10;
      v11 = _UICurrentImageTraitCollectionDisplayScale();
      if (v11 == 0.0)
        v11 = 1.0;
      v43 = v11;
      v41 = 0;
      v42 = 0;
      v12 = objc_msgSend(v9, "horizontalSizeClass");
      v13 = objc_msgSend(v9, "verticalSizeClass");
      +[_UIAssetManager _convertTraitCollection:toCUIScale:CUIIdiom:UIKitIdiom:UIKitUserInterfaceStyle:subtype:CUIDisplayGamut:UIKitLayoutDirection:CUILayoutDirection:]((uint64_t)_UIAssetManager, v9, &v43, 0, &v44, 0, &v42, &v41, &v45, 0);
      v14 = 0;
      if (v44 <= 5)
        v14 = qword_186684BB8[v44];
      v15 = 5;
      if (v45)
        v15 = 0;
      if (v45 == 1)
        v16 = 4;
      else
        v16 = v15;
      v17 = objc_msgSend(*(id *)(a1 + 32), "locale");
      v18 = *(unsigned __int8 **)(a1 + 40);
      v19 = v18[116];
      v20 = a2;
      if ((v19 & 8) != 0)
      {
        v21 = (void *)objc_msgSend(MEMORY[0x1E0D89788], "infoForName:allowsPrivate:locale:", *(_QWORD *)(a1 + 48), (v19 >> 4) & 1, v17);
        if (!v21)
          return 0;
        v20 = objc_msgSend(v21, "name");
        v18 = *(unsigned __int8 **)(a1 + 40);
      }
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __78___UIAssetManager_imageNamed_configuration_cachingOptions_attachCatalogImage___block_invoke_2;
      v24[3] = &unk_1E16E8260;
      v38 = a3;
      v25 = *(id *)(a1 + 32);
      v26 = v18;
      v31 = v43;
      v32 = v14;
      v33 = v16;
      v27 = v20;
      v28 = v17;
      v39 = *(_BYTE *)(a1 + 66);
      v22 = *(_QWORD *)(a1 + 56);
      v29 = a2;
      v30 = v22;
      v34 = v42;
      v35 = v41;
      v36 = v12;
      v37 = v13;
      v40 = *(_BYTE *)(a1 + 65);
      return objc_msgSend(v18, "_lookUpObjectForTraitCollection:objectAccessor:", objc_msgSend(v25, "_effectiveTraitCollectionForImageLookup"), v24);
    }
  }
  return v7;
}

uint64_t __88___UIAssetManager__performLookUpObjectForTraitCollection_outNamedLookup_objectAccessor___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "containsObject:", objc_msgSend(*(id *)(a1 + 32), "_translateAppearanceNameToNative:", a2));
  if ((_DWORD)result)
  {
    result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      *a3 = 1;
  }
  return result;
}

uint64_t __78___UIAssetManager_imageNamed_configuration_cachingOptions_attachCatalogImage___block_invoke_2(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  UIImageConfiguration *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[9];
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  double v28;
  uint64_t v29;
  uint64_t v30;

  if (!*(_BYTE *)(a1 + 136))
    goto LABEL_13;
  v29 = 0;
  v30 = 0;
  v28 = 0.0;
  v6 = -[UIImageConfiguration configurationByApplyingConfiguration:](+[UIImageSymbolConfiguration unspecifiedConfiguration](UIImageSymbolConfiguration, "unspecifiedConfiguration"), "configurationByApplyingConfiguration:", *(_QWORD *)(a1 + 32));
  -[UIImageConfiguration _deriveGlyphSize:weight:pointSize:](v6, "_deriveGlyphSize:weight:pointSize:", &v30, &v29, &v28);
  v7 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "namedVectorGlyphWithName:scaleFactor:deviceIdiom:layoutDirection:glyphSize:glyphWeight:glyphPointSize:appearanceName:locale:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), v30, v29, a2, *(double *)(a1 + 80), v28, *(_QWORD *)(a1 + 56));
  if (!v7)
    goto LABEL_13;
  v8 = v7;
  v9 = objc_msgSend(v7, "layoutDirection");
  if (v9 && v9 != *(_QWORD *)(a1 + 96))
  {
    if ((objc_msgSend(v8, "isFlippable") & 1) != 0)
    {
      v10 = 1;
      goto LABEL_9;
    }
    v6 = (UIImageConfiguration *)_UIImageConfigurationWithFlippedLayoutDirection(v6);
  }
  v10 = 0;
LABEL_9:
  v11 = objc_msgSend(v8, "UIImageWithAsset:configuration:flippedHorizontally:", objc_msgSend(*(id *)(a1 + 40), "_assetForName:", *(_QWORD *)(a1 + 64)), v6, v10);
  v12 = v11;
  if (*(_BYTE *)(a1 + 137) && v11)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = v6;
    return v12;
  }
  if (v11)
    return v12;
LABEL_13:
  v13 = *(_QWORD *)(a1 + 40);
  if ((*(_BYTE *)(v13 + 116) & 8) != 0)
    return 0;
  v14 = objc_msgSend(*(id *)(v13 + 16), "namedLookupWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:locale:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 120), *(double *)(a1 + 80), *(_QWORD *)(a1 + 128), a2, *(_QWORD *)(a1 + 56));
  if (!v14)
    return 0;
  v15 = (void *)v14;
  if (!_isKindOfCUINamedLayerStack___CUINamedLayerStackClass)
    _isKindOfCUINamedLayerStack___CUINamedLayerStackClass = objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = (void *)objc_msgSend(*(id *)(a1 + 40), "_assetForName:", *(_QWORD *)(a1 + 64));
    v12 = objc_msgSend(v15, "flattenedUIImageWithAsset:configuration:", v16, *(_QWORD *)(a1 + 32));
    v24[0] = MEMORY[0x1E0C809B0];
    v24[2] = __78___UIAssetManager_imageNamed_configuration_cachingOptions_attachCatalogImage___block_invoke_3;
    v24[3] = &unk_1E16E8238;
    v17 = *(_QWORD *)(a1 + 96);
    v24[8] = *(_QWORD *)(a1 + 88);
    v24[1] = 3221225472;
    v24[7] = *(_QWORD *)(a1 + 80);
    v25 = *(_OWORD *)(a1 + 104);
    v26 = v17;
    v27 = *(_OWORD *)(a1 + 120);
    v18 = *(_QWORD *)(a1 + 56);
    v24[4] = *(_QWORD *)(a1 + 64);
    v24[5] = a2;
    v24[6] = v18;
    objc_msgSend(v16, "_setRebuildStackImage:", v24);
    return v12;
  }
  v20 = *(id *)(a1 + 32);
  if (a3)
    *a3 = v15;
  v21 = objc_msgSend(v15, "layoutDirection");
  if (v21 && v21 != *(_QWORD *)(a1 + 96))
  {
    if ((objc_msgSend(v15, "isFlippable") & 1) != 0)
    {
      v22 = 1;
      goto LABEL_29;
    }
    v20 = _UIImageConfigurationWithFlippedLayoutDirection(v20);
  }
  v22 = 0;
LABEL_29:
  v23 = (void *)objc_msgSend(v15, "UIImageWithAsset:configuration:flippedHorizontally:optionalVectorImage:", objc_msgSend(*(id *)(a1 + 40), "_assetForName:", *(_QWORD *)(a1 + 64)), v20, v22, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "namedVectorImageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:locale:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 120), *(double *)(a1 + 80), *(_QWORD *)(a1 + 128), a2, *(_QWORD *)(a1 + 56)));
  v12 = (uint64_t)v23;
  if (*(_BYTE *)(a1 + 138))
    objc_setAssociatedObject(v23, &CUINamedImageKey, v15, (void *)1);
  return v12;
}

uint64_t __33___UIAssetManager__assetForName___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_assetFromMapForName:lock:", *(_QWORD *)(a1 + 40), 0);
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (!v2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = -[UIImageAsset _initWithAssetName:forManager:]([UIImageAsset alloc], "_initWithAssetName:forManager:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  }
  result = objc_msgSend(*(id *)(a1 + 32), "_insertAssetIntoMap:forName:lock:", v2, *(_QWORD *)(a1 + 40), 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  return result;
}

uint64_t __52___UIAssetManager__insertAssetIntoMap_forName_lock___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "_assetFromMapForName:lock:", *(_QWORD *)(a1 + 40), 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = result;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (!*(_QWORD *)(v3 + 40))
  {
    *(_QWORD *)(v3 + 40) = *(_QWORD *)(a1 + 48);
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setObject:forKey:", +[_UIImageAssetMapEnvelope wrapAsset:](_UIImageAssetMapEnvelope, "wrapAsset:", *(_QWORD *)(a1 + 48)), *(_QWORD *)(a1 + 40));
  }
  return result;
}

id __45___UIAssetManager__assetFromMapForName_lock___block_invoke(_QWORD *a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1[4] + 80), "objectForKey:", a1[5]);
  if (result)
  {
    result = (id)objc_msgSend(result, "imageAsset");
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
    if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
      return (id)objc_msgSend(*(id *)(a1[4] + 80), "removeObjectForKey:", a1[5]);
  }
  return result;
}

uint64_t __58___UIAssetManager_resolvedColorNamed_withTraitCollection___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 16), "colorWithName:displayGamut:deviceIdiom:appearanceName:", a1[5], a1[6], a1[7], a2);
  if (a3)
  {
    if (result)
      *a3 = result;
  }
  return result;
}

uint64_t __58___UIAssetManager_resolvedColorNamed_withTraitCollection___block_invoke(_QWORD *a1, void *a2)
{
  objc_msgSend(a2, "setDisplayGamut:", a1[4]);
  objc_msgSend(a2, "setUserInterfaceIdiom:", a1[5]);
  objc_msgSend(a2, "setUserInterfaceStyle:", a1[6]);
  return objc_msgSend(a2, "setAccessibilityContrast:", a1[7]);
}

uint64_t __50___UIAssetManager_imageNamed_scale_idiom_subtype___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setDisplayScale:", *(double *)(a1 + 40));
  objc_msgSend(a2, "setUserInterfaceIdiom:", *(_QWORD *)(a1 + 48));
  objc_msgSend(a2, "_setNSIntegerValue:forTraitToken:", *(_QWORD *)(a1 + 56), 0x1E1A99630);
  objc_msgSend(a2, "setDisplayGamut:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  return objc_msgSend(a2, "setLayoutDirection:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
}

uint64_t __43___UIAssetManager_preferredTraitCollection__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setDisplayScale:", *(double *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(a2, "setUserInterfaceIdiom:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(a2, "setLayoutDirection:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
  return objc_msgSend(a2, "setDisplayGamut:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
}

uint64_t __37___UIAssetManager__assetManagerCache__block_invoke()
{
  qword_1ECD81E78 = (uint64_t)objc_alloc_init((Class)off_1E167C048);
  objc_msgSend((id)qword_1ECD81E78, "setClearsCacheOnApplicationBackground:", 0);
  return objc_msgSend((id)qword_1ECD81E78, "setClearsCacheOnLowMemoryWarnings:", 0);
}

uint64_t __39___UIAssetManager_sharedRuntimeCatalog__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0D1A6B8]), "initWithName:", CFSTR("Shared Image Catalog"));
  qword_1ECD81EC0 = result;
  return result;
}

id __40___UIAssetManager_sharedRuntimeAssetMap__block_invoke()
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  qword_1ECD81ED0 = (uint64_t)result;
  return result;
}

id __42___UIAssetManager__defaultAppearanceNames__block_invoke()
{
  id result;
  _QWORD v1[2];

  v1[1] = *MEMORY[0x1E0C80C00];
  v1[0] = CFSTR("UIAppearanceAny");
  result = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 1);
  qword_1ECD81EE0 = (uint64_t)result;
  return result;
}

uint64_t __39___UIAssetManager__carPlayAssetManager__block_invoke(uint64_t a1)
{
  _UIAssetManager *v2;
  uint64_t result;
  void *v4;

  v2 = [_UIAssetManager alloc];
  result = -[_UIAssetManager initWithName:inBundle:idiom:](v2, "initWithName:inBundle:idiom:", CFSTR("UIKit_Stark_Artwork"), objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", _UIKitResourceBundlePath(CFSTR("CarPlayArtwork.bundle"))), 3);
  qword_1ECD81E88 = result;
  if (result)
  {
    v4 = (void *)result;
    objc_msgSend(*(id *)(a1 + 32), "preferredScale");
    objc_msgSend(v4, "setPreferredScale:");
    result = objc_msgSend((id)qword_1ECD81E88, "setPreferredTraitCollection:", objc_msgSend(*(id *)(a1 + 32), "preferredTraitCollection"));
    *(_BYTE *)(qword_1ECD81E88 + 116) |= 5u;
  }
  return result;
}

uint64_t __78___UIAssetManager_imageNamed_configuration_cachingOptions_attachCatalogImage___block_invoke_3(uint64_t result, void *a2, uint64_t a3)
{
  uint64_t v4;

  if (a2)
  {
    if (a3)
    {
      result = objc_msgSend(*(id *)(a3 + 16), "namedLookupWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:locale:", *(_QWORD *)(result + 32), *(_QWORD *)(result + 64), *(_QWORD *)(result + 72), *(_QWORD *)(result + 80), *(_QWORD *)(result + 88), *(_QWORD *)(result + 96), *(double *)(result + 56), *(_QWORD *)(result + 104), *(_QWORD *)(result + 40), *(_QWORD *)(result + 48));
      if (result)
      {
        v4 = result;
        if (!_isKindOfCUINamedLayerStack___CUINamedLayerStackClass)
          _isKindOfCUINamedLayerStack___CUINamedLayerStackClass = objc_opt_class();
        result = objc_opt_isKindOfClass();
        if ((result & 1) != 0)
          return objc_msgSend(a2, "_setLayerStack:", v4);
      }
    }
  }
  return result;
}

uint64_t __41___UIAssetManager__clearCachedResources___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)UIApp, "_endBackgroundTask:", *(_QWORD *)(a1 + 32));
}

@end
