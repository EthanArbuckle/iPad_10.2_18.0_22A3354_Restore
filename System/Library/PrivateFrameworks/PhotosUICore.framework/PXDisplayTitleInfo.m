@implementation PXDisplayTitleInfo

- (PXDisplayTitleInfo)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayTitleInfo.m"), 26, CFSTR("%s is not available as initializer"), "-[PXDisplayTitleInfo init]");

  abort();
}

- (PXDisplayTitleInfo)initWithTitle:(id)a3 subtitle:(id)a4 fontName:(id)a5
{
  id v8;
  id v9;
  id v10;
  PXDisplayTitleInfo *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  uint64_t v18;
  NSString *fontName;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PXDisplayTitleInfo;
  v11 = -[PXDisplayTitleInfo init](&v21, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    v13 = (void *)v12;
    if (v12)
      v14 = (__CFString *)v12;
    else
      v14 = &stru_1E5149688;
    objc_storeStrong((id *)&v11->_title, v14);

    v15 = objc_msgSend(v9, "copy");
    v16 = (void *)v15;
    if (v15)
      v17 = (__CFString *)v15;
    else
      v17 = &stru_1E5149688;
    objc_storeStrong((id *)&v11->_subtitle, v17);

    v18 = objc_msgSend(v10, "copy");
    fontName = v11->_fontName;
    v11->_fontName = (NSString *)v18;

  }
  return v11;
}

- (PXDisplayTitleInfo)initWithAssetCollection:(id)a3 useVerboseSmartDescription:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  PXDisplayTitleInfo *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  int v14;
  id v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = -[PXDisplayTitleInfo initWithTitle:subtitle:fontName:](self, "initWithTitle:subtitle:fontName:", &stru_1E5149688, 0, &stru_1E5149688);
  v9 = v7;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;

    if (v10)
    {
      if (v8)
      {
        objc_storeStrong((id *)&v8->__assetCollection, a3);
        -[PHAssetCollection photoLibrary](v8->__assetCollection, "photoLibrary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "px_registerChangeObserver:", v8);

        -[PXDisplayTitleInfo setUseVerboseSmartDescription:](v8, "setUseVerboseSmartDescription:", v4);
        -[PXDisplayTitleInfo _updatePropertiesFromAssetCollection](v8, "_updatePropertiesFromAssetCollection");
      }
      goto LABEL_10;
    }
  }
  else
  {

  }
  PLUIGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v14 = 138412290;
    v15 = v9;
    _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "[PXDisplayTitleInfo] unsupported asset collection: %@", (uint8_t *)&v14, 0xCu);
  }

  v10 = 0;
LABEL_10:

  return v8;
}

- (void)_setAssetCollection:(id)a3
{
  PHAssetCollection *v5;
  PHAssetCollection *v6;

  v5 = (PHAssetCollection *)a3;
  if (self->__assetCollection != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->__assetCollection, a3);
    -[PXDisplayTitleInfo _updatePropertiesFromAssetCollection](self, "_updatePropertiesFromAssetCollection");
    v5 = v6;
  }

}

- (void)_updatePropertiesFromAssetCollection
{
  void *v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  objc_class *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  -[PXDisplayTitleInfo _assetCollection](self, "_assetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "assetCollectionType");
  v6 = v5;
  if (v4)
  {
    if (v5 == 6)
    {
      v7 = v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_4:
        if (-[PXDisplayTitleInfo useVerboseSmartDescription](self, "useVerboseSmartDescription"))
          objc_msgSend(v4, "verboseSmartDescription");
        else
          objc_msgSend(v4, "smartDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "dateDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "px_descriptionForAssertionMessage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayTitleInfo.m"), 70, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollection"), v15, v21);

LABEL_15:
      goto LABEL_4;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayTitleInfo.m"), 66, CFSTR("missing asset collection %@"), self);

    if (v6 == 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayTitleInfo.m"), 70, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollection"), v15);
      goto LABEL_15;
    }
  }
  objc_msgSend(v4, "localizedTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedSubtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 > 8 || ((1 << v6) & 0x130) == 0)
  {
LABEL_8:
    objc_msgSend(off_1E50B3470, "defaultHelper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "titleForDisplayableText:titleCategory:options:", v8, objc_msgSend(v4, "titleCategory"), 1);
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v11;
  }
  objc_msgSend(v4, "titleFontName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __58__PXDisplayTitleInfo__updatePropertiesFromAssetCollection__block_invoke;
  v22[3] = &unk_1E5142970;
  v23 = v8;
  v24 = v9;
  v25 = v16;
  v17 = v16;
  v18 = v9;
  v19 = v8;
  -[PXDisplayTitleInfo performChanges:](self, "performChanges:", v22);

}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXDisplayTitleInfo;
  -[PXDisplayTitleInfo performChanges:](&v3, sel_performChanges_, a3);
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *title;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_title;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      title = self->_title;
      self->_title = v6;

      -[PXDisplayTitleInfo signalChange:](self, "signalChange:", 1);
    }
  }

}

- (void)setSubtitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *subtitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_subtitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      subtitle = self->_subtitle;
      self->_subtitle = v6;

      -[PXDisplayTitleInfo signalChange:](self, "signalChange:", 2);
    }
  }

}

- (void)setFontName:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *fontName;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_fontName;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      fontName = self->_fontName;
      self->_fontName = v6;

      -[PXDisplayTitleInfo signalChange:](self, "signalChange:", 4);
    }
  }

}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  -[PXDisplayTitleInfo _assetCollection](self, "_assetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v8, "changeDetailsForObject:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "objectAfterChanges");
      v7 = objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[PXDisplayTitleInfo _setAssetCollection:](self, "_setAssetCollection:", v7);
        v4 = (void *)v7;
      }
      else
      {
        v4 = 0;
      }
    }
  }
  else
  {
    v6 = 0;
  }

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p, title=%@, subtitle=%@, fontName=%@>"), objc_opt_class(), self, self->_title, self->_subtitle, self->_fontName);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)fontName
{
  return self->_fontName;
}

- (PHAssetCollection)_assetCollection
{
  return self->__assetCollection;
}

- (BOOL)useVerboseSmartDescription
{
  return self->_useVerboseSmartDescription;
}

- (void)setUseVerboseSmartDescription:(BOOL)a3
{
  self->_useVerboseSmartDescription = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__assetCollection, 0);
  objc_storeStrong((id *)&self->_fontName, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

void __58__PXDisplayTitleInfo__updatePropertiesFromAssetCollection__block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setTitle:", v3);
  objc_msgSend(v4, "setSubtitle:", a1[5]);
  objc_msgSend(v4, "setFontName:", a1[6]);

}

+ (id)displayTitleInfoForDetailsOfAssetCollection:(id)a3 withTitleCategory:(int64_t)a4 defaultTitle:(id)a5 defaultTitleCategory:(int64_t)a6 titleKey:(id)a7 titleCategoryKey:(id)a8 defaultSubtitle:(id)a9 subtitleKey:(id)a10 simulatedLoadingDelay:(double)a11 preferredAttributesPromise:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  PXDisplayTitleInfo *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v33;
  PXDisplayTitleInfo *v35;
  void *v36;
  _QWORD block[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45[3];
  id location[4];

  location[2] = *(id *)MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a5;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a12;
  if (v21)
  {
    v24 = v21;
  }
  else
  {
    objc_msgSend(v17, "localizedSubtitle");
    v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  v25 = v24;
  objc_msgSend(MEMORY[0x1E0CD13B8], "titleFontNameForTitleCategory:", a4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v25;
  v27 = v19;
  if (v23)
  {
    v28 = -[PXDisplayTitleInfo initWithTitle:subtitle:fontName:]([PXDisplayTitleInfo alloc], "initWithTitle:subtitle:fontName:", CFSTR(" "), CFSTR(" "), v26);
    v33 = v26;
    if (displayTitleInfoForDetailsOfAssetCollection_withTitleCategory_defaultTitle_defaultTitleCategory_titleKey_titleCategoryKey_defaultSubtitle_subtitleKey_simulatedLoadingDelay_preferredAttributesPromise__onceToken != -1)
      dispatch_once(&displayTitleInfoForDetailsOfAssetCollection_withTitleCategory_defaultTitle_defaultTitleCategory_titleKey_titleCategoryKey_defaultSubtitle_subtitleKey_simulatedLoadingDelay_preferredAttributesPromise__onceToken, &__block_literal_global_269984);
    v35 = v28;
    objc_initWeak(location, v28);
    v29 = displayTitleInfoForDetailsOfAssetCollection_withTitleCategory_defaultTitle_defaultTitleCategory_titleKey_titleCategoryKey_defaultSubtitle_subtitleKey_simulatedLoadingDelay_preferredAttributesPromise__backgroundQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __221__PXDisplayTitleInfo_displayTitleInfoForDetailsOfAssetCollection_withTitleCategory_defaultTitle_defaultTitleCategory_titleKey_titleCategoryKey_defaultSubtitle_subtitleKey_simulatedLoadingDelay_preferredAttributesPromise___block_invoke_2;
    block[3] = &unk_1E51429E0;
    v38 = v27;
    v39 = v18;
    v40 = v20;
    v45[1] = (id)a6;
    v41 = v22;
    v30 = v25;
    v42 = v25;
    v44 = v23;
    v43 = v17;
    v45[2] = *(id *)&a11;
    objc_copyWeak(v45, location);
    dispatch_async(v29, block);
    objc_destroyWeak(v45);

    objc_destroyWeak(location);
    v26 = v33;
  }
  else
  {
    PLUIGetLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v17;
      _os_log_impl(&dword_1A6789000, v31, OS_LOG_TYPE_DEFAULT, "No preferred attributes promise for asset collection %@", (uint8_t *)location, 0xCu);
    }

    v35 = -[PXDisplayTitleInfo initWithTitle:subtitle:fontName:]([PXDisplayTitleInfo alloc], "initWithTitle:subtitle:fontName:", v18, v21, v26);
    v30 = v36;
  }

  return v35;
}

void __221__PXDisplayTitleInfo_displayTitleInfoForDetailsOfAssetCollection_withTitleCategory_defaultTitle_defaultTitleCategory_titleKey_titleCategoryKey_defaultSubtitle_subtitleKey_simulatedLoadingDelay_preferredAttributesPromise___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 96));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 48));

  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PLUIGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v6)
      goto LABEL_7;
    v7 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)buf = 138412546;
    v28 = v7;
    v29 = 2112;
    v30 = v4;
    v8 = "Preferred attributes for asset collection %@: %@";
    v9 = v5;
    v10 = 22;
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    v11 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)buf = 138412290;
    v28 = v11;
    v8 = "Preferred attributes promise returned nothing for asset collection %@";
    v9 = v5;
    v10 = 12;
  }
  _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_7:

  if (*(double *)(a1 + 104) > 0.0)
    objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:");
  v12 = *(id *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 96);
  v14 = *(id *)(a1 + 64);
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v15 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v16, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
    v17 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v15;
    v14 = (id)v17;
  }
  objc_msgSend(MEMORY[0x1E0CD13B8], "titleFontNameForTitleCategory:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __221__PXDisplayTitleInfo_displayTitleInfoForDetailsOfAssetCollection_withTitleCategory_defaultTitle_defaultTitleCategory_titleKey_titleCategoryKey_defaultSubtitle_subtitleKey_simulatedLoadingDelay_preferredAttributesPromise___block_invoke_153;
  v22[3] = &unk_1E51429B8;
  objc_copyWeak(&v26, (id *)(a1 + 88));
  v23 = v12;
  v24 = v14;
  v25 = v18;
  v19 = v18;
  v20 = v14;
  v21 = v12;
  dispatch_async(MEMORY[0x1E0C80D38], v22);

  objc_destroyWeak(&v26);
}

void __221__PXDisplayTitleInfo_displayTitleInfoForDetailsOfAssetCollection_withTitleCategory_defaultTitle_defaultTitleCategory_titleKey_titleCategoryKey_defaultSubtitle_subtitleKey_simulatedLoadingDelay_preferredAttributesPromise___block_invoke_153(id *a1)
{
  id WeakRetained;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __221__PXDisplayTitleInfo_displayTitleInfoForDetailsOfAssetCollection_withTitleCategory_defaultTitle_defaultTitleCategory_titleKey_titleCategoryKey_defaultSubtitle_subtitleKey_simulatedLoadingDelay_preferredAttributesPromise___block_invoke_2_154;
  v3[3] = &unk_1E5142970;
  v4 = a1[4];
  v5 = a1[5];
  v6 = a1[6];
  objc_msgSend(WeakRetained, "performChanges:", v3);

}

void __221__PXDisplayTitleInfo_displayTitleInfoForDetailsOfAssetCollection_withTitleCategory_defaultTitle_defaultTitleCategory_titleKey_titleCategoryKey_defaultSubtitle_subtitleKey_simulatedLoadingDelay_preferredAttributesPromise___block_invoke_2_154(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setTitle:", v3);
  objc_msgSend(v4, "setSubtitle:", a1[5]);
  objc_msgSend(v4, "setFontName:", a1[6]);

}

void __221__PXDisplayTitleInfo_displayTitleInfoForDetailsOfAssetCollection_withTitleCategory_defaultTitle_defaultTitleCategory_titleKey_titleCategoryKey_defaultSubtitle_subtitleKey_simulatedLoadingDelay_preferredAttributesPromise___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.photos.preferredattributespromise", v0);
  v2 = (void *)displayTitleInfoForDetailsOfAssetCollection_withTitleCategory_defaultTitle_defaultTitleCategory_titleKey_titleCategoryKey_defaultSubtitle_subtitleKey_simulatedLoadingDelay_preferredAttributesPromise__backgroundQueue;
  displayTitleInfoForDetailsOfAssetCollection_withTitleCategory_defaultTitle_defaultTitleCategory_titleKey_titleCategoryKey_defaultSubtitle_subtitleKey_simulatedLoadingDelay_preferredAttributesPromise__backgroundQueue = (uint64_t)v1;

}

@end
