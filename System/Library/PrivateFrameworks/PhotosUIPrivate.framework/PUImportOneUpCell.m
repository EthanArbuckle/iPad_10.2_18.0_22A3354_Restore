@implementation PUImportOneUpCell

- (void)_commonPUImportOneUpCellInitialization
{
  -[PUImportOneUpCell setThumbnailRequestID:](self, "setThumbnailRequestID:", 0);
}

- (PUImportOneUpCell)initWithFrame:(CGRect)a3
{
  PUImportOneUpCell *v3;
  PUImportOneUpCell *v4;
  PUImportOneUpCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUImportOneUpCell;
  v3 = -[PUPhotosSharingGridCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PUImportOneUpCell _commonPUImportOneUpCellInitialization](v3, "_commonPUImportOneUpCellInitialization");
    v5 = v4;
  }

  return v4;
}

- (PUImportOneUpCell)initWithCoder:(id)a3
{
  PUImportOneUpCell *v3;
  PUImportOneUpCell *v4;
  PUImportOneUpCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUImportOneUpCell;
  v3 = -[PUImportOneUpCell initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    -[PUImportOneUpCell _commonPUImportOneUpCellInitialization](v3, "_commonPUImportOneUpCellInitialization");
    v5 = v4;
  }

  return v4;
}

- (void)contextForObservingViewModelChanges
{
  return (void *)PXImportItemViewModelOneUpCellContext;
}

- (void)dealloc
{
  PXImportItemViewModel *importItem;
  void *v4;
  objc_super v5;

  importItem = self->_importItem;
  self->_importItem = 0;

  if (-[PUImportOneUpCell thumbnailRequestID](self, "thumbnailRequestID"))
  {
    -[PUImportOneUpCell displayDelegate](self, "displayDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "importOneUpCell:didRequestCancellationOfThumbnailRequestWithID:", self, -[PUImportOneUpCell thumbnailRequestID](self, "thumbnailRequestID"));

    -[PUImportOneUpCell setThumbnailRequestID:](self, "setThumbnailRequestID:", 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)PUImportOneUpCell;
  -[PUImportOneUpCell dealloc](&v5, sel_dealloc);
}

- (void)prepareForReuse
{
  PXImportItemViewModel *importItem;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUImportOneUpCell;
  -[PUPhotosSharingGridCell prepareForReuse](&v5, sel_prepareForReuse);
  -[PXImportItemViewModel unregisterChangeObserver:context:](self->_importItem, "unregisterChangeObserver:context:", self, -[PUImportOneUpCell contextForObservingViewModelChanges](self, "contextForObservingViewModelChanges"));
  importItem = self->_importItem;
  self->_importItem = 0;

  if (-[PUImportOneUpCell thumbnailRequestID](self, "thumbnailRequestID"))
  {
    -[PUImportOneUpCell displayDelegate](self, "displayDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "importOneUpCell:didRequestCancellationOfThumbnailRequestWithID:", self, -[PUImportOneUpCell thumbnailRequestID](self, "thumbnailRequestID"));

    -[PUImportOneUpCell setThumbnailRequestID:](self, "setThumbnailRequestID:", 0);
  }
}

- (void)setImportItem:(id)a3
{
  PXImportItemViewModel *v5;
  PXImportItemViewModel *importItem;
  void *v7;
  void *v8;
  PXImportItemViewModel *v9;

  v5 = (PXImportItemViewModel *)a3;
  importItem = self->_importItem;
  if (importItem != v5)
  {
    v9 = v5;
    -[PXImportItemViewModel unregisterChangeObserver:context:](importItem, "unregisterChangeObserver:context:", self, -[PUImportOneUpCell contextForObservingViewModelChanges](self, "contextForObservingViewModelChanges"));
    objc_storeStrong((id *)&self->_importItem, a3);
    -[PUImportOneUpCell importItem](self, "importItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportOneUpCell setSelected:](self, "setSelected:", objc_msgSend(v7, "isSelected"));

    -[PUImportOneUpCell importItem](self, "importItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportOneUpCell updatePhotoViewForImportItem:](self, "updatePhotoViewForImportItem:", v8);

    -[PUImportOneUpCell updateSelectedVisualAppearance](self, "updateSelectedVisualAppearance");
    -[PXImportItemViewModel registerChangeObserver:context:](self->_importItem, "registerChangeObserver:context:", self, -[PUImportOneUpCell contextForObservingViewModelChanges](self, "contextForObservingViewModelChanges"));
    v5 = v9;
  }

}

- (void)updatePhotoViewForImportItem:(id)a3
{
  void *v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  int v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];

  objc_msgSend(a3, "importAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isHDR"))
  {
    if (objc_msgSend(v4, "isImage"))
      v5 = 4;
    else
      v5 = 1024;
  }
  else
  {
    v5 = 0;
  }
  v6 = objc_msgSend(v4, "isBurst");
  v7 = objc_msgSend(v4, "isSDOF");
  v8 = 0;
  if (objc_msgSend(v4, "isMovie"))
  {
    objc_msgSend(v4, "durationTimeInterval");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v8 = v10;

  }
  v11 = *MEMORY[0x1E0C9D820];
  v12 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[PUPhotosSharingGridCell photoView](self, "photoView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentHelper");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "photoImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v12;
  v17 = v11;
  if (v15)
  {
    -[PUPhotosSharingGridCell photoView](self, "photoView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "contentHelper");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "photoImage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "size");
    v17 = v21;
    v16 = v22;

  }
  if (v17 == v11 && v16 == v12)
  {
    -[PUImportOneUpCell importItem](self, "importItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v25, "isPanoramicImage");

  }
  else
  {
    v24 = objc_msgSend(MEMORY[0x1E0D7B520], "hasPanoramaImageDimensions:", v17, v16);
  }
  v26 = v5 | 8;
  if (!v6)
    v26 = v5;
  if (v7)
    v26 |= 0x10uLL;
  if (v24)
    v27 = v26 | 2;
  else
    v27 = v26;
  -[PUPhotosSharingGridCell photoView](self, "photoView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "contentHelper");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v27;
  v32[1] = v8;
  v32[2] = 0;
  v32[3] = 0;
  objc_msgSend(v29, "setBadgeInfo:", v32);

  -[PUPhotosSharingGridCell photoView](self, "photoView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "contentHelper");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setBadgeStyle:", 7);

}

- (void)updateSelectedVisualAppearance
{
  void *v3;
  int v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  -[PUImportOneUpCell importItem](self, "importItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSelected");

  v5 = 1.0;
  if (v4)
  {
    +[PUImportOneUpCell alphaForSelectedCells](PUImportOneUpCell, "alphaForSelectedCells");
    v5 = v6;
  }
  -[PUPhotosSharingGridCell photoView](self, "photoView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentAlpha:", v5);

}

- (void)refreshThumbnail
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  -[PUImportOneUpCell importItem](self, "importItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDeleted");

  if ((v5 & 1) == 0)
  {
    -[PUImportOneUpCell displayDelegate](self, "displayDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUImportOneUpCell.m"), 162, CFSTR("Missing thumbnail provider"));

    }
    -[PUImportOneUpCell importItem](self, "importItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    -[PUImportOneUpCell displayDelegate](self, "displayDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportOneUpCell importItem](self, "importItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __37__PUImportOneUpCell_refreshThumbnail__block_invoke;
    v12[3] = &unk_1E58A0408;
    objc_copyWeak(&v14, &location);
    v10 = v7;
    v13 = v10;
    -[PUImportOneUpCell setThumbnailRequestID:](self, "setThumbnailRequestID:", objc_msgSend(v8, "importOneUpCell:requestedThumbnailForImportItem:completion:", self, v9, v12));

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
}

- (void)setImage:(id)a3 isPlaceholder:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  -[PUPhotosSharingGridCell photoView](self, "photoView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "size");
  objc_msgSend(v7, "setPhotoSize:");
  objc_msgSend(v7, "setFillMode:", !v4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v8);

  }
  else
  {
    objc_msgSend(v7, "setBackgroundColor:", 0);
  }
  objc_msgSend(v7, "setPhotoImage:", v10);
  -[PUImportOneUpCell importItem](self, "importItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportOneUpCell updatePhotoViewForImportItem:](self, "updatePhotoViewForImportItem:", v9);

}

- (void)updateBadge
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  -[PUImportOneUpCell importItem](self, "importItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDeleted");

  if ((v4 & 1) == 0)
  {
    -[PUImportOneUpCell displayDelegate](self, "displayDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PUImportOneUpCell importItem](self, "importItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "importOneUpCell:requestedBadgeUpdateForImportItem:", self, v5);

  }
}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)PUImportOneUpCell;
  -[PUPhotosSharingGridCell layoutSubviews](&v3, sel_layoutSubviews);
  if (self->_debugTextField)
  {
    -[PUImportOneUpCell bounds](self, "bounds");
    -[UITextField setFrame:](self->_debugTextField, "setFrame:", 0.0, 0.0, CGRectGetWidth(v4), 18.0);
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v9;
  unint64_t v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUImportOneUpCell.m"), 211, CFSTR("Expecting main thread only for cell signals"));

  }
  if (-[PUImportOneUpCell contextForObservingViewModelChanges](self, "contextForObservingViewModelChanges") == a5)
  {
    if ((a4 & 1) != 0)
    {
      -[PUImportOneUpCell importItem](self, "importItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUImportOneUpCell setSelected:](self, "setSelected:", objc_msgSend(v9, "isSelected"));

      LODWORD(v10) = 1;
    }
    else
    {
      v10 = (a4 >> 2) & 1;
    }
    v11 = a4 & 1;
    if ((a4 & 8) != 0)
    {
      -[PUImportOneUpCell importItem](self, "importItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isDuplicate");

      LODWORD(v10) = v10 | v13;
    }
    if ((a4 & 2) != 0)
    {
      -[PUImportOneUpCell importItem](self, "importItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUImportOneUpCell setSelected:](self, "setSelected:", objc_msgSend(v14, "isSelected"));

      LODWORD(v10) = 1;
      v11 = 1;
    }
    v15 = (a4 >> 4) & 1 | v10;
    if ((a4 & 0x80) != 0 && -[PUImportOneUpCell thumbnailRequestID](self, "thumbnailRequestID"))
    {
      -[PUImportOneUpCell displayDelegate](self, "displayDelegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "importOneUpCell:didRequestCancellationOfThumbnailRequestWithID:", self, -[PUImportOneUpCell thumbnailRequestID](self, "thumbnailRequestID"));

      -[PUImportOneUpCell setThumbnailRequestID:](self, "setThumbnailRequestID:", 0);
    }
    if (v15)
      -[PUImportOneUpCell updateBadge](self, "updateBadge");
    if (v11)
      -[PUImportOneUpCell updateSelectedVisualAppearance](self, "updateSelectedVisualAppearance");
  }
}

- (void)updateDebugLabel:(id)a3
{
  __CFString *v4;
  const __CFString *v5;
  id v6;
  UITextField *v7;
  UITextField *debugTextField;
  void *v9;
  __CFString *v10;

  v4 = (__CFString *)a3;
  v10 = v4;
  if (v4)
  {
    v5 = v4;
    if (!self->_debugTextField)
    {
      v6 = objc_alloc(MEMORY[0x1E0DC3DB8]);
      v7 = (UITextField *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      debugTextField = self->_debugTextField;
      self->_debugTextField = v7;

      -[UITextField setTextAlignment:](self->_debugTextField, "setTextAlignment:", 1);
      -[UITextField setAdjustsFontSizeToFitWidth:](self->_debugTextField, "setAdjustsFontSizeToFitWidth:", 1);
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextField setBackgroundColor:](self->_debugTextField, "setBackgroundColor:", v9);

      -[UITextField setEnabled:](self->_debugTextField, "setEnabled:", 0);
      -[PUImportOneUpCell addSubview:](self, "addSubview:", self->_debugTextField);
      -[PUImportOneUpCell setNeedsLayout](self, "setNeedsLayout");
      v4 = v10;
      v5 = v10;
    }
  }
  else
  {
    v5 = &stru_1E58AD278;
  }
  -[UITextField setHidden:](self->_debugTextField, "setHidden:", -[__CFString length](v4, "length") == 0);
  -[UITextField setText:](self->_debugTextField, "setText:", v5);

}

- (PUImportOneUpCellDisplayDelegate)displayDelegate
{
  return (PUImportOneUpCellDisplayDelegate *)objc_loadWeakRetained((id *)&self->_displayDelegate);
}

- (void)setDisplayDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_displayDelegate, a3);
}

- (PXImportItemViewModel)importItem
{
  return self->_importItem;
}

- (UITextField)debugTextField
{
  return self->_debugTextField;
}

- (void)setDebugTextField:(id)a3
{
  objc_storeStrong((id *)&self->_debugTextField, a3);
}

- (int64_t)thumbnailRequestID
{
  return self->_thumbnailRequestID;
}

- (void)setThumbnailRequestID:(int64_t)a3
{
  self->_thumbnailRequestID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugTextField, 0);
  objc_storeStrong((id *)&self->_importItem, 0);
  objc_destroyWeak((id *)&self->_displayDelegate);
}

void __37__PUImportOneUpCell_refreshThumbnail__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v5 = a2;
  if (v5)
  {
    v6 = (id *)(a1 + 40);
    v11 = v5;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "importItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 32);

    v5 = v11;
    if (v8 == v9)
    {
      v10 = objc_loadWeakRetained(v6);
      objc_msgSend(v10, "setImage:isPlaceholder:", v11, a3);

      v5 = v11;
    }
  }

}

+ (double)alphaForSelectedCells
{
  return 1.0;
}

@end
