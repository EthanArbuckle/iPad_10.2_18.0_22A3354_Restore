@implementation PXTCCPhotoGridView

- (PXTCCPhotoGridView)initWithColumns:(int64_t)a3 proposedRows:(int64_t)a4 width:(double)a5
{
  PXTCCPhotoGridView *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  unint64_t v17;
  double v18;
  uint64_t v19;
  PXTCCPhotoGridView *v20;
  double Helper_x8__OBJC_CLASS___APApplication;
  uint64_t v22;
  void *v23;
  double v24;
  double Helper_x8__OBJC_CLASS___APGuard;
  uint64_t v26;
  void *v27;
  id v28;
  _QWORD v30[4];
  PXTCCPhotoGridView *v31;
  id v32;
  unint64_t v33;
  objc_super v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  unint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)PXTCCPhotoGridView;
  v7 = -[PXTCCPhotoGridView init](&v34, sel_init, a5);
  if (!v7)
    goto LABEL_11;
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_systemPhotoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D77F00], "fetchCuratedAssetsForTCCWithLimit:seed:library:", a4 * a3, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _SynchronousThumbnailImagesForAssets(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  if (v11 < a3)
  {
    PLUIGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v36 = "-[PXTCCPhotoGridView initWithColumns:proposedRows:width:]";
      v13 = "%s: Not enough images to return a settings photo grid";
      v14 = v12;
      v15 = OS_LOG_TYPE_DEFAULT;
      v16 = 12;
LABEL_8:
      _os_log_impl(&dword_1A6789000, v14, v15, v13, buf, v16);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  v7->_totalColumns = a3;
  v7->_totalRows = v11 / a3;
  v17 = v11 / a3 * a3;
  if (objc_msgSend(v10, "count") >= v17)
  {
    Helper_x8__OBJC_CLASS___APApplication = gotLoadHelper_x8__OBJC_CLASS___APApplication(v18);
    objc_msgSend(*(id *)(v22 + 1672), "applicationWithBundleIdentifier:", CFSTR("com.apple.mobileslideshow"), Helper_x8__OBJC_CLASS___APApplication);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    Helper_x8__OBJC_CLASS___APGuard = gotLoadHelper_x8__OBJC_CLASS___APGuard(v24);
    objc_msgSend(*(id *)(v26 + 1680), "sharedGuard", Helper_x8__OBJC_CLASS___APGuard);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __57__PXTCCPhotoGridView_initWithColumns_proposedRows_width___block_invoke;
    v30[3] = &unk_1E51376D8;
    v31 = v7;
    v32 = v10;
    v33 = v17;
    v28 = v10;
    objc_msgSend(v27, "initiateAuthenticationWithShieldingForSubject:completion:", v23, v30);

LABEL_11:
    v20 = v7;
    goto LABEL_12;
  }
  PLUIGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v19 = objc_msgSend(v10, "count");
    *(_DWORD *)buf = 136315650;
    v36 = "-[PXTCCPhotoGridView initWithColumns:proposedRows:width:]";
    v37 = 2048;
    v38 = v19;
    v39 = 2048;
    v40 = v17;
    v13 = "%s: Not enough images provided (%ld) to hit target count (%ld)";
    v14 = v12;
    v15 = OS_LOG_TYPE_ERROR;
    v16 = 32;
    goto LABEL_8;
  }
LABEL_9:

  v20 = 0;
LABEL_12:

  return v20;
}

- (void)layoutSubviews
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXTCCPhotoGridView;
  -[PXTCCPhotoGridView layoutSubviews](&v4, sel_layoutSubviews);
  -[PXTCCPhotoGridView frame](self, "frame");
  -[PXTCCPhotoGridView _layoutItemsAndCalculateTotalSizeForTargetWidth:](self, "_layoutItemsAndCalculateTotalSizeForTargetWidth:", v3);
}

- (void)_setUpViewsWithImages:(id)a3 maximumItemCount:(int64_t)a4
{
  NSMutableArray *v6;
  NSMutableArray *imageViews;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  imageViews = self->_imageViews;
  self->_imageViews = v6;

  if (a4 >= 1)
  {
    v8 = 0;
    do
    {
      v9 = objc_alloc_init(MEMORY[0x1E0DC3890]);
      objc_msgSend(v9, "setContentMode:", 2);
      objc_msgSend(v9, "setClipsToBounds:", 1);
      objc_msgSend(v11, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setImage:", v10);

      -[PXTCCPhotoGridView addSubview:](self, "addSubview:", v9);
      -[NSMutableArray addObject:](self->_imageViews, "addObject:", v9);

      ++v8;
    }
    while (a4 != v8);
  }

}

- (CGSize)_layoutItemsAndCalculateTotalSizeForTargetWidth:(double)a3
{
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  CGSize result;

  v5 = -[PXTCCPhotoGridView totalColumns](self, "totalColumns");
  v6 = -[PXTCCPhotoGridView totalRows](self, "totalRows");
  v7 = (a3 - (double)(v5 - 1) * 2.0) / (double)v5;
  if (v6 * v5 >= 1)
  {
    v8 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_imageViews, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setFrame:", (v7 + 2.0) * (double)(v8 + -v5 * (v8 / v5)), (v7 + 2.0) * (double)(v8 / v5), v7, v7);

      ++v8;
    }
    while (v6 * v5 != v8);
  }
  v10 = (double)(v6 - 1) + (double)(v6 - 1) + (double)v6 * v7;
  v11 = a3;
  result.height = v10;
  result.width = v11;
  return result;
}

- (NSMutableArray)imageViews
{
  return self->_imageViews;
}

- (int64_t)totalColumns
{
  return self->_totalColumns;
}

- (void)setTotalColumns:(int64_t)a3
{
  self->_totalColumns = a3;
}

- (int64_t)totalRows
{
  return self->_totalRows;
}

- (void)setTotalRows:(int64_t)a3
{
  self->_totalRows = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViews, 0);
}

void __57__PXTCCPhotoGridView_initWithColumns_proposedRows_width___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[4];
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__PXTCCPhotoGridView_initWithColumns_proposedRows_width___block_invoke_2;
    block[3] = &unk_1E5145560;
    v10 = *(id *)(a1 + 32);
    v6 = *(id *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v11 = v6;
    v12 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v8 = v10;
  }
  else
  {
    PLUIGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "APGuard failed to intialize with error: %@", buf, 0xCu);
    }
  }

}

uint64_t __57__PXTCCPhotoGridView_initWithColumns_proposedRows_width___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setUpViewsWithImages:maximumItemCount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (id)photoGridViewForAlertPromptWithWidth:(double)a3
{
  void *v4;
  double v5;
  double v6;

  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithColumns:proposedRows:width:", 4, 2, a3);
  objc_msgSend(v4, "_layoutItemsAndCalculateTotalSizeForTargetWidth:", a3);
  objc_msgSend(v4, "setBounds:", 0.0, 0.0, v5, v6);
  return v4;
}

+ (id)photoGridViewForSettings
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithColumns:proposedRows:width:", 4, 2, 0.0);
  objc_msgSend(v2, "_layoutItemsAndCalculateTotalSizeForTargetWidth:", 300.0);
  v4 = v3;
  v6 = v5;
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v2, "heightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "widthAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:multiplier:", v8, v6 / v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  return v2;
}

@end
