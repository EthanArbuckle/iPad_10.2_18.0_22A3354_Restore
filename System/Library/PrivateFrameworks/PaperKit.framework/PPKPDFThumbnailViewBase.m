@implementation PPKPDFThumbnailViewBase

- (PPKPDFThumbnailViewBase)init
{
  PPKPDFThumbnailViewBase *v2;
  PPKPDFThumbnailViewBase *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PPKPDFThumbnailViewBase;
  v2 = -[PPKPDFThumbnailViewBase init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PPKPDFThumbnailViewBase _commonInit](v2, "_commonInit");
  return v3;
}

- (PPKPDFThumbnailViewBase)initWithFrame:(CGRect)a3
{
  PPKPDFThumbnailViewBase *v3;
  PPKPDFThumbnailViewBase *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PPKPDFThumbnailViewBase;
  v3 = -[PPKPDFThumbnailViewBase initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PPKPDFThumbnailViewBase _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  __int128 v3;
  PPKPDFThumbnailsCollectionViewBase *v4;
  PPKPDFThumbnailsCollectionViewBase *iconsView;
  void *v6;
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
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  if (!self->_iconsView)
  {
    self->_thumbnailSize = (CGSize)kDefaultThumbnailSize;
    v3 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
    *(_OWORD *)&self->_contentInset.top = *MEMORY[0x1E0DC49E8];
    *(_OWORD *)&self->_contentInset.bottom = v3;
    v4 = (PPKPDFThumbnailsCollectionViewBase *)objc_msgSend(objc_alloc(NSClassFromString(CFSTR("PPKPDFThumbnailsCollectionView"))), "initFromThumbnailView:", self);
    iconsView = self->_iconsView;
    self->_iconsView = v4;

    -[PPKPDFThumbnailViewBase addSubview:](self, "addSubview:", self->_iconsView);
    -[PPKPDFThumbnailsCollectionViewBase setTranslatesAutoresizingMaskIntoConstraints:](self->_iconsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v15 = (void *)MEMORY[0x1E0CB3718];
    -[PPKPDFThumbnailsCollectionViewBase bottomAnchor](self->_iconsView, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKPDFThumbnailViewBase bottomAnchor](self, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v17;
    -[PPKPDFThumbnailsCollectionViewBase topAnchor](self->_iconsView, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKPDFThumbnailViewBase topAnchor](self, "topAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v7;
    -[PPKPDFThumbnailsCollectionViewBase leadingAnchor](self->_iconsView, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKPDFThumbnailViewBase leadingAnchor](self, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v10;
    -[PPKPDFThumbnailsCollectionViewBase trailingAnchor](self->_iconsView, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKPDFThumbnailViewBase trailingAnchor](self, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activateConstraints:", v14);

    -[PPKPDFThumbnailViewBase setupNotifications](self, "setupNotifications");
  }
}

- (void)setupNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_documentChanged_, *MEMORY[0x1E0CD0EC8], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_currentPageChanged_, *MEMORY[0x1E0CD0ED0], 0);
  -[PPKPDFThumbnailViewBase updateNotificationsForDocument](self, "updateNotificationsForDocument");

}

- (void)updateNotificationsForDocument
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);
  objc_msgSend(WeakRetained, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *MEMORY[0x1E0CD0E88];
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0CD0E88], 0);
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("PDFDocumentDidMutate"), 0);
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("PDFPageDidChangeBounds"), 0);
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("PDFPageDidRotate"), 0);
  if (v4)
  {
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_documentUnlocked_, v5, v4);
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_documentMutated_, CFSTR("PDFDocumentDidMutate"), v4);
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_pageChanged_, CFSTR("PDFPageDidChangeBounds"), v4);
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_pageChanged_, CFSTR("PDFPageDidRotate"), v4);
  }

}

- (void)setPDFView:(id)a3
{
  objc_storeWeak((id *)&self->_pdfView, a3);
  -[PPKPDFThumbnailsCollectionViewBase updateIconsImages](self->_iconsView, "updateIconsImages");
  -[PPKPDFThumbnailViewBase _updateLayout](self, "_updateLayout");
  -[PPKPDFThumbnailViewBase updateNotificationsForDocument](self, "updateNotificationsForDocument");
}

- (PDFView)PDFView
{
  return (PDFView *)objc_loadWeakRetained((id *)&self->_pdfView);
}

- (void)setBackgroundColor:(id)a3
{
  UIColor *v4;
  UIColor *backgroundColor;

  v4 = (UIColor *)objc_msgSend(a3, "copy");
  backgroundColor = self->_backgroundColor;
  self->_backgroundColor = v4;

  -[PPKPDFThumbnailsCollectionViewBase setBackgroundColor:](self->_iconsView, "setBackgroundColor:", self->_backgroundColor);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (NSArray)selectedPages
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[PPKPDFThumbnailsCollectionViewBase currentPage](self->_iconsView, "currentPage");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSArray *)v4;
}

- (void)setThumbnailSize:(CGSize)a3
{
  id v4;

  self->_thumbnailSize = a3;
  -[PPKPDFThumbnailViewBase _updateLayout](self, "_updateLayout");
  -[PPKPDFThumbnailsCollectionViewBase collectionView](self->_iconsView, "collectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (CGSize)thumbnailSize
{
  double width;
  double height;
  CGSize result;

  width = self->_thumbnailSize.width;
  height = self->_thumbnailSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setAllowsPageReordering:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[PPKPDFThumbnailsCollectionViewBase setAllowsPageReordering:](self->_iconsView, "setAllowsPageReordering:", v3);
}

- (BOOL)allowsPageReordering
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[PPKPDFThumbnailsCollectionViewBase allowsPageReordering](self->_iconsView, "allowsPageReordering");
}

- (void)setLargeThumbnails:(BOOL)a3
{
  -[PPKPDFThumbnailsCollectionViewBase setLargeThumbnails:](self->_iconsView, "setLargeThumbnails:", a3);
}

- (BOOL)largeThumbnails
{
  return -[PPKPDFThumbnailsCollectionViewBase largeThumbnails](self->_iconsView, "largeThumbnails");
}

- (void)setLayoutMode:(int64_t)a3
{
  self->_layoutMode = a3;
  -[PPKPDFThumbnailViewBase _updateLayout](self, "_updateLayout");
}

- (int64_t)layoutMode
{
  return self->_layoutMode;
}

- (UICollectionView)collectionView
{
  return -[PPKPDFThumbnailsCollectionViewBase collectionView](self->_iconsView, "collectionView");
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
  -[PPKPDFThumbnailViewBase _updateLayout](self, "_updateLayout");
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)_updateLayout
{
  -[PPKPDFThumbnailsCollectionViewBase setNeedsLayout](self->_iconsView, "setNeedsLayout");
}

- (void)documentChanged:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);
  objc_msgSend(v6, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (WeakRetained == v5)
  {
    -[PPKPDFThumbnailsCollectionViewBase documentChanged:](self->_iconsView, "documentChanged:", v6);
    -[PPKPDFThumbnailViewBase updateNotificationsForDocument](self, "updateNotificationsForDocument");
  }

}

- (void)documentUnlocked:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);
  objc_msgSend(WeakRetained, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
    -[PPKPDFThumbnailsCollectionViewBase documentChanged:](self->_iconsView, "documentChanged:", v7);

}

- (void)documentMutated:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);
  objc_msgSend(WeakRetained, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
    -[PPKPDFThumbnailsCollectionViewBase documentMutated:](self->_iconsView, "documentMutated:", v7);

}

- (void)currentPageChanged:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);
  objc_msgSend(v6, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (WeakRetained == v5)
    -[PPKPDFThumbnailsCollectionViewBase currentPageChanged:](self->_iconsView, "currentPageChanged:", v6);

}

- (void)pageChanged:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);
  objc_msgSend(WeakRetained, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_10;
  objc_msgSend(v14, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("PDFPageDidChangeBounds")))
  {

    goto LABEL_5;
  }
  objc_msgSend(v14, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("PDFPageDidRotate"));

  if (v8)
  {
LABEL_5:
    objc_msgSend(v14, "object");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 != v5)
      goto LABEL_10;
  }
  objc_msgSend(v14, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("page"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "document");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 == v5)
      -[PPKPDFThumbnailsCollectionViewBase pageChanged:](self->_iconsView, "pageChanged:", v14);
  }

LABEL_10:
}

- (void)reloadPageAt:(int64_t)a3
{
  -[PPKPDFThumbnailsCollectionViewBase reloadPageAt:](self->_iconsView, "reloadPageAt:", a3);
}

- (PPKPDFThumbnailContextMenuDelegate)thumbnailContextMenuDelegate
{
  return (PPKPDFThumbnailContextMenuDelegate *)objc_loadWeakRetained((id *)&self->thumbnailContextMenuDelegate);
}

- (void)setThumbnailContextMenuDelegate:(id)a3
{
  objc_storeWeak((id *)&self->thumbnailContextMenuDelegate, a3);
}

- (PPKPDFThumbnailDataSourceDelegate)thumbnailDataSourceDelegate
{
  return (PPKPDFThumbnailDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_thumbnailDataSourceDelegate);
}

- (void)setThumbnailDataSourceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_thumbnailDataSourceDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_thumbnailDataSourceDelegate);
  objc_destroyWeak((id *)&self->thumbnailContextMenuDelegate);
  objc_storeStrong((id *)&self->_iconsView, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_destroyWeak((id *)&self->_pdfView);
}

@end
