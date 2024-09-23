@implementation _PUIStylePickerHomeScreenCAAsset

- (_PUIStylePickerHomeScreenCAAsset)initWithAssetName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  _PUIStylePickerHomeScreenCAAsset *v9;
  _PUIStylePickerHomeScreenCAAsset *v10;
  NSBundle *v11;
  NSBundle *bundle;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_PUIStylePickerHomeScreenCAAsset;
  v9 = -[_PUIStylePickerHomeScreenCAAsset init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetName, a3);
    if (v8)
    {
      v11 = (NSBundle *)v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v11 = (NSBundle *)objc_claimAutoreleasedReturnValue();
    }
    bundle = v10->_bundle;
    v10->_bundle = v11;

  }
  return v10;
}

- (void)configureAssetPackageView:(id)a3 withColorStops:(id)a4 accentColor:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  id v20;

  v20 = a4;
  v8 = a5;
  v9 = a3;
  -[_PUIStylePickerHomeScreenCAAsset assetName](self, "assetName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PUIStylePickerHomeScreenCAAsset bundle](self, "bundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateAsset:bundle:", v10, v11);

  objc_msgSend(v9, "publishedObjectWithName:", CFSTR("gradient"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "publishedObjectWithName:", CFSTR("accented"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PUIStylePickerHomeScreenCAAsset assetName](self, "assetName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("choice-1"));

  if (v15)
  {
    v16 = objc_msgSend(v20, "count");
  }
  else
  {
    -[_PUIStylePickerHomeScreenCAAsset assetName](self, "assetName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("choice-3"));

    if (!v18)
      goto LABEL_9;
    v16 = objc_msgSend(v20, "count");
    if (v8)
      objc_msgSend(v13, "setContentsMultiplyColor:", objc_msgSend(objc_retainAutorelease(v8), "CGColor"));
  }
  if (v20 && v16)
  {
    objc_msgSend(v20, "bs_mapNoNulls:", &__block_literal_global_251);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setColors:", v19);

  }
LABEL_9:

}

- (NSString)assetName
{
  return self->_assetName;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_assetName, 0);
}

@end
