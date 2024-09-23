@implementation _UIImageStackImageAsset

- (_UIImageStackImageAsset)initWithContentsOfFile:(id)a3
{
  id v4;
  _UIImageStackImageAsset *v5;
  _UIImageStackImageAsset *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  CUICatalog *catalog;
  id v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UIImageStackImageAsset;
  v5 = -[UIImageAsset init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    -[UIImageAsset setAssetName:](v5, "setAssetName:", v4);
    v7 = objc_alloc(MEMORY[0x1E0D1A6A8]);
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v9 = objc_msgSend(v7, "initWithURL:error:", v8, &v13);
    v10 = v13;
    catalog = v6->_catalog;
    v6->_catalog = (CUICatalog *)v9;

    if (!v6->_catalog)
    {

      v6 = 0;
    }

  }
  return v6;
}

- (id)imageWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;

  v4 = a3;
  -[UIImageAsset _layerStack](self, "_layerStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v4, "_effectiveTraitCollectionForImageLookup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v15 = 0.0;
    v12 = 0;
    v13 = 0;
    v11 = -1;
    +[_UIAssetManager _convertTraitCollection:toCUIScale:CUIIdiom:UIKitIdiom:UIKitUserInterfaceStyle:subtype:CUIDisplayGamut:UIKitLayoutDirection:CUILayoutDirection:]((uint64_t)_UIAssetManager, v6, &v15, &v13, 0, 0, &v14, &v12, &v11, 0);
    -[CUICatalog defaultLayerStackWithScaleFactor:deviceIdiom:deviceSubtype:sizeClassHorizontal:sizeClassVertical:](self->_catalog, "defaultLayerStackWithScaleFactor:deviceIdiom:deviceSubtype:sizeClassHorizontal:sizeClassVertical:", v13, v14, objc_msgSend(v6, "horizontalSizeClass"), objc_msgSend(v6, "verticalSizeClass"), v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageAsset _setLayerStack:](self, "_setLayerStack:", v7);

  }
  -[UIImageAsset _layerStack](self, "_layerStack");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "flattenedUIImageWithAsset:configuration:", self, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CUICatalog)catalog
{
  return self->_catalog;
}

- (void)setCatalog:(id)a3
{
  objc_storeStrong((id *)&self->_catalog, a3);
}

- (NSData)stackData
{
  return self->_stackData;
}

- (void)setStackData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackData, 0);
  objc_storeStrong((id *)&self->_catalog, 0);
}

@end
