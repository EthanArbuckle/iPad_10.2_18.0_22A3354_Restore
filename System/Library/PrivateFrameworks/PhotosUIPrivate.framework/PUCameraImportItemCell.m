@implementation PUCameraImportItemCell

- (PUCameraImportItemCell)initWithFrame:(CGRect)a3
{
  PUCameraImportItemCell *v3;
  PUPhotoView *v4;
  uint64_t v5;
  PUPhotoView *photoView;
  UIView *v7;
  UIView *badgeContainerView;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUCameraImportItemCell;
  v3 = -[PUCameraImportItemCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    if (initWithFrame__onceToken != -1)
      dispatch_once(&initWithFrame__onceToken, &__block_literal_global_19739);
    v4 = [PUPhotoView alloc];
    -[PUCameraImportItemCell bounds](v3, "bounds");
    v5 = -[PUPhotoView initWithFrame:](v4, "initWithFrame:");
    photoView = v3->_photoView;
    v3->_photoView = (PUPhotoView *)v5;

    -[PUCameraImportItemCell addSubview:](v3, "addSubview:", v3->_photoView);
    v7 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    badgeContainerView = v3->_badgeContainerView;
    v3->_badgeContainerView = v7;

    -[PUCameraImportItemCell insertSubview:aboveSubview:](v3, "insertSubview:aboveSubview:", v3->_badgeContainerView, v3->_photoView);
    v3->_thumbnailRequestID = 0;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[PUCameraImportItemCell cancelThumbnailLoadIfActive](self, "cancelThumbnailLoadIfActive");
  v3.receiver = self;
  v3.super_class = (Class)PUCameraImportItemCell;
  -[PUCameraImportItemCell dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  BOOL v3;
  PUPhotoView *photoView;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double MaxX;
  CGFloat MaxY;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double MidX;
  double MidY;
  UIActivityIndicatorView *spinner;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat Height;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  objc_super v44;
  NSRect v45;
  NSRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v44.receiver = self;
  v44.super_class = (Class)PUCameraImportItemCell;
  -[PUCameraImportItemCell layoutSubviews](&v44, sel_layoutSubviews);
  -[PUCameraImportItemCell updateBadgeUIIfNeeded](self, "updateBadgeUIIfNeeded");
  -[PUCameraImportItemCell scaledDisplayRect](self, "scaledDisplayRect");
  v3 = NSIsEmptyRect(v45);
  photoView = self->_photoView;
  if (v3)
    -[PUCameraImportItemCell bounds](self, "bounds");
  else
    -[PUCameraImportItemCell scaledDisplayRect](self, "scaledDisplayRect");
  -[PUPhotoView setFrame:](photoView, "setFrame:");
  -[PUCameraImportItemCell scaledDisplayRect](self, "scaledDisplayRect");
  if (NSIsEmptyRect(v46))
  {
    -[PUPhotoView contentHelper](self->_photoView, "contentHelper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageContentFrame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

  }
  else
  {
    -[PUCameraImportItemCell scaledDisplayRect](self, "scaledDisplayRect");
    v7 = v14;
    v9 = v15;
    v11 = v16;
    v13 = v17;
  }
  v40 = v13;
  v41 = v11;
  v42 = v9;
  v43 = v7;
  v47.origin.x = v7;
  v47.origin.y = v9;
  v47.size.width = v11;
  v47.size.height = v13;
  MaxX = CGRectGetMaxX(v47);
  v48.origin.x = v7;
  v48.origin.y = v9;
  v48.size.width = v11;
  v48.size.height = v13;
  MaxY = CGRectGetMaxY(v48);
  v20 = *(double *)&PUCameraImportItemBadgeSize_0;
  v21 = MaxX - *(double *)&PUCameraImportItemBadgeSize_0 + -6.0;
  v22 = *(double *)&PUCameraImportItemBadgeSize_1;
  v23 = MaxY - *(double *)&PUCameraImportItemBadgeSize_1 + -6.0;
  -[PUCameraImportItemCell badgeContainerView](self, "badgeContainerView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", v21, v23, v20, v22);

  -[PUCameraImportItemCell badgeView](self, "badgeView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "frame");
  v27 = v26;
  v29 = v28;

  v30 = *MEMORY[0x1E0C9D538];
  v31 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PUCameraImportItemCell badgeView](self, "badgeView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFrame:", v30, v31, v27, v29);

  v49.origin.x = v21;
  v49.origin.y = v23;
  v49.size.width = v20;
  v49.size.height = v22;
  MidX = CGRectGetMidX(v49);
  v50.origin.x = v21;
  v50.origin.y = v23;
  v50.size.width = v20;
  v50.size.height = v22;
  MidY = CGRectGetMidY(v50);
  -[UIActivityIndicatorView sizeToFit](self->_spinner, "sizeToFit");
  -[UIActivityIndicatorView setCenter:](self->_spinner, "setCenter:", MidX, MidY);
  spinner = self->_spinner;
  -[UIActivityIndicatorView frame](spinner, "frame");
  v52 = CGRectIntegral(v51);
  -[UIActivityIndicatorView setFrame:](spinner, "setFrame:", v52.origin.x, v52.origin.y, v52.size.width, v52.size.height);
  v53.origin.x = v43;
  v53.origin.y = v42;
  v53.size.width = v41;
  v53.size.height = v40;
  v36 = CGRectGetMidX(v53);
  v54.origin.x = v43;
  v54.origin.y = v42;
  v54.size.width = v41;
  v54.size.height = v40;
  v37 = CGRectGetMidY(v54);
  v55.origin.x = v43;
  v55.origin.y = v42;
  v55.size.width = v41;
  v55.size.height = v40;
  v38 = CGRectGetWidth(v55) * 0.5;
  v56.origin.x = v43;
  v56.origin.y = v42;
  v56.size.width = v41;
  v56.size.height = v40;
  Height = CGRectGetHeight(v56);
  self->_badgeTapZone.origin.x = v36;
  self->_badgeTapZone.origin.y = v37;
  self->_badgeTapZone.size.width = v38;
  self->_badgeTapZone.size.height = Height * 0.5;
  if (self->_debugTextField)
  {
    -[PUCameraImportItemCell frame](self, "frame");
    -[UITextField setFrame:](self->_debugTextField, "setFrame:", 0.0, 0.0, CGRectGetWidth(v57), 18.0);
  }
}

- (BOOL)shouldBeginGestureForPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGPoint v6;
  CGRect v7;

  y = a3.y;
  x = a3.x;
  -[PUCameraImportItemCell bounds](self, "bounds");
  v6.x = x;
  v6.y = y;
  return CGRectContainsPoint(v7, v6);
}

- (void)showActivityBadge:(BOOL)a3
{
  UIActivityIndicatorView *spinner;
  UIActivityIndicatorView *v5;
  UIActivityIndicatorView *v6;
  void *v7;
  UIActivityIndicatorView *v8;
  void *v9;

  spinner = self->_spinner;
  if (a3)
  {
    if (!spinner)
    {
      v5 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
      v6 = self->_spinner;
      self->_spinner = v5;

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIActivityIndicatorView setColor:](self->_spinner, "setColor:", v7);

      v8 = self->_spinner;
      -[PUCameraImportItemCell badgeContainerView](self, "badgeContainerView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCameraImportItemCell insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v8, v9);

      spinner = self->_spinner;
    }
    -[UIActivityIndicatorView startAnimating](spinner, "startAnimating");
  }
  else
  {
    -[UIActivityIndicatorView stopAnimating](spinner, "stopAnimating");
  }
}

- (void)prepareForReuse
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _importGridLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[PUCameraImportItemCell representedImportItem](self, "representedImportItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v9 = "-[PUCameraImportItemCell prepareForReuse]";
    v10 = 2112;
    v11 = v6;
    _os_log_debug_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEBUG, "%s: clearing item from cell: %@", buf, 0x16u);

  }
  v7.receiver = self;
  v7.super_class = (Class)PUCameraImportItemCell;
  -[PUCameraImportItemCell prepareForReuse](&v7, sel_prepareForReuse);
  -[PUCameraImportItemCell setBadgeType:](self, "setBadgeType:", 0);
  -[PUCameraImportItemCell badgeView](self, "badgeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[PUCameraImportItemCell setBadgeView:](self, "setBadgeView:", 0);
  -[PUCameraImportItemCell representedImportItem](self, "representedImportItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterChangeObserver:context:", self, PXImportItemViewModelContext);

  -[PUCameraImportItemCell cancelThumbnailLoadIfActive](self, "cancelThumbnailLoadIfActive");
  -[PUCameraImportItemCell setRepresentedImportItem:](self, "setRepresentedImportItem:", 0);
  -[PUCameraImportItemCell setScaledDisplayRect:](self, "setScaledDisplayRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void)setRepresentedImportItem:(id)a3
{
  PXImportItemViewModel *v5;
  NSObject *v6;
  PXImportItemViewModel **p_representedImportItem;
  PXImportItemViewModel *representedImportItem;
  void *v9;
  int v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  PXImportItemViewModel *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (PXImportItemViewModel *)a3;
  _importGridLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v12 = 136315394;
    v13 = "-[PUCameraImportItemCell setRepresentedImportItem:]";
    v14 = 2112;
    v15 = v5;
    _os_log_debug_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEBUG, "%s: %@", (uint8_t *)&v12, 0x16u);
  }

  p_representedImportItem = &self->_representedImportItem;
  representedImportItem = self->_representedImportItem;
  if (representedImportItem != v5)
  {
    -[PXImportItemViewModel unregisterChangeObserver:context:](representedImportItem, "unregisterChangeObserver:context:", self, PXImportItemViewModelContext);
    objc_storeStrong((id *)&self->_representedImportItem, a3);
    -[PXImportItemViewModel registerChangeObserver:context:](*p_representedImportItem, "registerChangeObserver:context:", self, PXImportItemViewModelContext);
    -[PUCameraImportItemCell setSelectable:](self, "setSelectable:", -[PXImportItemViewModel isSelectable](v5, "isSelectable"));
    -[PUCameraImportItemCell setBadgeType:](self, "setBadgeType:", -[PXImportItemViewModel badgeType](v5, "badgeType"));
    self->_needsThumbnailRefresh = 1;
    if (*p_representedImportItem)
    {
      if ((-[PXImportItemViewModel isMediaAsset](*p_representedImportItem, "isMediaAsset") & 1) == 0)
      {
        -[PXImportItemViewModel kind](*p_representedImportItem, "kind");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D7C430]);

        if (v10)
        {
          objc_msgSend(MEMORY[0x1E0DC3870], "pu_PhotosUIImageNamed:", CFSTR("ImportEllipsis"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "size");
          -[PUCameraImportItemCell setPhotoImage:withSize:fillMode:videoDuration:isPlaceholder:](self, "setPhotoImage:withSize:fillMode:videoDuration:isPlaceholder:", v11, 0, 0);

        }
        else
        {
          -[PUCameraImportItemCell clearImage](self, "clearImage");
        }
        self->_needsThumbnailRefresh = 0;
      }
    }
  }

}

- (void)setBadgeType:(int64_t)a3
{
  self->_badgeType = a3;
  -[PUCameraImportItemCell setNeedsBadgeUpdate:](self, "setNeedsBadgeUpdate:", 1);
}

- (void)setSelectable:(BOOL)a3
{
  self->_selectable = a3;
  -[PUCameraImportItemCell setNeedsBadgeUpdate:](self, "setNeedsBadgeUpdate:", 1);
}

- (void)updateBadgeUIIfNeeded
{
  int64_t v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (-[PUCameraImportItemCell needsBadgeUpdate](self, "needsBadgeUpdate"))
  {
    -[PUCameraImportItemCell setNeedsBadgeUpdate:](self, "setNeedsBadgeUpdate:", 0);
    v3 = -[PUCameraImportItemCell badgeType](self, "badgeType");
    v4 = 1.0;
    if (-[PUCameraImportItemCell badgeType](self, "badgeType") == 1)
    {
      +[PUCameraImportItemCell alphaForSelectedCells](PUCameraImportItemCell, "alphaForSelectedCells");
      v4 = v5;
    }
    -[PUCameraImportItemCell badgeView](self, "badgeView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[PUCameraImportItemCell setBadgeView:](self, "setBadgeView:", 0);
    -[PUCameraImportItemCell badgeType](self, "badgeType");
    -[PUCameraImportItemCell selectable](self, "selectable");
    PXImportBadgeViewForTypeAndSelectable();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[PUCameraImportItemCell badgeContainerView](self, "badgeContainerView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", v10);

      -[PUCameraImportItemCell setBadgeView:](self, "setBadgeView:", v10);
    }
    -[PUCameraImportItemCell showActivityBadge:](self, "showActivityBadge:", v3 == 2);
    -[PUCameraImportItemCell photoView](self, "photoView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentHelper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContentAlpha:", v4);

    -[PUCameraImportItemCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)refreshThumbnail
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[PUCameraImportItemCell representedImportItem](self, "representedImportItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMediaAsset");

  if (v4)
  {
    _importGridLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[PUCameraImportItemCell representedImportItem](self, "representedImportItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 136315394;
      v8 = "-[PUCameraImportItemCell refreshThumbnail]";
      v9 = 2112;
      v10 = v6;
      _os_log_debug_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEBUG, "%s: public interfacing callig for thumbnail: %@", (uint8_t *)&v7, 0x16u);

    }
    -[PUCameraImportItemCell _fetchThumbnailReady](self, "_fetchThumbnailReady");
  }
}

- (void)_fetchThumbnailReady
{
  NSObject *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, uint64_t, uint64_t);
  void *v19;
  id v20;
  id v21;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  _importGridLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(location[0]) = 136315138;
    *(id *)((char *)location + 4) = "-[PUCameraImportItemCell _fetchThumbnailReady]";
    _os_log_debug_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)location, 0xCu);
  }

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCameraImportItemCell.m"), 225, CFSTR("Expecting main thread only"));

  }
  -[PUCameraImportItemCell delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == 0;

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCameraImportItemCell.m"), 226, CFSTR("Missing thumbnail provider"));

  }
  -[PUCameraImportItemCell representedImportItem](self, "representedImportItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isDeleted");

  if ((v8 & 1) == 0)
  {
    -[PUCameraImportItemCell representedImportItem](self, "representedImportItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(location, self);
    -[PUCameraImportItemCell delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCameraImportItemCell representedImportItem](self, "representedImportItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __46__PUCameraImportItemCell__fetchThumbnailReady__block_invoke;
    v19 = &unk_1E589DB28;
    objc_copyWeak(&v21, location);
    v12 = v9;
    v20 = v12;
    v13 = objc_msgSend(v10, "importCell:requestImageForImportItem:ofSize:completion:", self, v11, 0, &v16);
    -[PUCameraImportItemCell setThumbnailRequestID:](self, "setThumbnailRequestID:", v13, v16, v17, v18, v19);

    objc_destroyWeak(&v21);
    objc_destroyWeak(location);

  }
}

- (void)setCachedImage:(id)a3 isPlaceholder:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[PUCameraImportItemCell representedImportItem](self, "representedImportItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "duration");

  -[PUCameraImportItemCell delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "contentFillModeForImportCell:", self);

  objc_msgSend(v9, "size");
  -[PUCameraImportItemCell setPhotoImage:withSize:fillMode:videoDuration:isPlaceholder:](self, "setPhotoImage:withSize:fillMode:videoDuration:isPlaceholder:", v9, v8, v4);

}

- (void)setPhotoImage:(id)a3 withSize:(CGSize)a4 fillMode:(int64_t)a5 videoDuration:(double)a6 isPlaceholder:(BOOL)a7
{
  double height;
  double width;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[2];
  __int128 v19;

  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = MEMORY[0x1E0D7CE00];
  v15 = *MEMORY[0x1E0D7CE00];
  if (objc_msgSend(MEMORY[0x1E0D7B520], "hasPanoramaImageDimensions:", width, height))
  {
    if (a5 != 1)
    {
      -[PUCameraImportItemCell _filledPhotosRectForImage:](self, "_filledPhotosRectForImage:", v13);
      -[PUCameraImportItemCell setScaledDisplayRect:](self, "setScaledDisplayRect:");
    }
    v15 |= 2uLL;
    a5 = 1;
  }
  -[PUPhotoView contentHelper](self->_photoView, "contentHelper");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFillMode:", a5);
  objc_msgSend(v16, "setPhotoSize:", width, height);
  objc_msgSend(v16, "setPhotoImage:", v13);
  v18[0] = v15;
  *(double *)&v18[1] = a6;
  v19 = *(_OWORD *)(v14 + 16);
  objc_msgSend(v16, "setBadgeInfo:", v18);
  objc_msgSend(v16, "setBadgeStyle:", 7);
  if (a7)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBackgroundColor:", v17);

  }
  else
  {
    objc_msgSend(v16, "setBackgroundColor:", 0);
  }
  -[PUCameraImportItemCell setNeedsLayout](self, "setNeedsLayout");
  self->_needsThumbnailRefresh = 0;

}

- (void)cancelThumbnailLoadIfActive
{
  void *v3;

  if (-[PUCameraImportItemCell thumbnailRequestID](self, "thumbnailRequestID"))
  {
    -[PUCameraImportItemCell delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "importCell:didRequestCancellationOfThumbnailRequestWithID:", self, -[PUCameraImportItemCell thumbnailRequestID](self, "thumbnailRequestID"));

  }
  -[PUCameraImportItemCell setThumbnailRequestID:](self, "setThumbnailRequestID:", 0);
}

- (void)clearImage
{
  void *v3;
  __int128 v4;
  _OWORD v5[2];

  -[PUPhotoView contentHelper](self->_photoView, "contentHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFillMode:", 0);
  objc_msgSend(v3, "setPhotoSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  objc_msgSend(v3, "setPhotoImage:", 0);
  v4 = *(_OWORD *)(MEMORY[0x1E0D7CE00] + 16);
  v5[0] = *MEMORY[0x1E0D7CE00];
  v5[1] = v4;
  objc_msgSend(v3, "setBadgeInfo:", v5);
  objc_msgSend(v3, "setBadgeStyle:", 0);
  -[PUCameraImportItemCell setNeedsLayout](self, "setNeedsLayout");

}

- (CGRect)_filledPhotosRectForImage:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  objc_msgSend(a3, "size");
  v5 = v4;
  v7 = v6;
  -[PUCameraImportItemCell bounds](self, "bounds");
  if (v5 >= v7)
  {
    v12 = (v9 - v7 * (*(double *)&PUCameraImportItemBadgeSize_1 * 3.0 / v7)) * 0.5;
    v11 = 0.0;
    v10 = v8;
    v9 = v7 * (*(double *)&PUCameraImportItemBadgeSize_1 * 3.0 / v7);
  }
  else
  {
    v10 = v5 * (*(double *)&PUCameraImportItemBadgeSize_0 * 3.0 / v5);
    v11 = (v8 - v10) * 0.5;
    v12 = 0.0;
  }
  v13 = v10;
  result.size.height = v9;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  NSObject *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCameraImportItemCell.m"), 330, CFSTR("Expecting main thread only for cell signals"));

  }
  _importGridLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v18 = 136315394;
    v19 = "-[PUCameraImportItemCell observable:didChange:context:]";
    v20 = 2048;
    v21 = a4;
    _os_log_debug_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_DEBUG, "%s: message %llu", (uint8_t *)&v18, 0x16u);
  }

  if ((void *)PXImportItemViewModelContext == a5)
  {
    if ((a4 & 4) != 0)
    {
      -[PUCameraImportItemCell representedImportItem](self, "representedImportItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCameraImportItemCell setSelectable:](self, "setSelectable:", objc_msgSend(v10, "isSelectable"));

    }
    v11 = (a4 & 5) != 0;
    if ((a4 & 8) != 0)
    {
      -[PUCameraImportItemCell representedImportItem](self, "representedImportItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isDuplicate");

      if ((a4 & 5) != 0)
        v11 = 1;
      else
        v11 = v13;
    }
    v14 = (a4 & 0x12) != 0 || v11;
    if ((a4 & 0x80) != 0)
    {
      _importGridLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v18 = 136315138;
        v19 = "-[PUCameraImportItemCell observable:didChange:context:]";
        _os_log_debug_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_DEBUG, "%s: Cell has been told to remove itself from the grid", (uint8_t *)&v18, 0xCu);
      }

      -[PUCameraImportItemCell cancelThumbnailLoadIfActive](self, "cancelThumbnailLoadIfActive");
    }
    if (v14)
    {
      -[PUCameraImportItemCell representedImportItem](self, "representedImportItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCameraImportItemCell setBadgeType:](self, "setBadgeType:", objc_msgSend(v16, "badgeType"));

      -[PUCameraImportItemCell updateBadgeUIIfNeeded](self, "updateBadgeUIIfNeeded");
    }
  }
}

- (void)handleTapGesture:(id)a3
{
  CGRect *p_badgeTapZone;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  uint64_t v8;
  CGPoint v9;

  p_badgeTapZone = &self->_badgeTapZone;
  objc_msgSend(a3, "locationInView:", self);
  v9.x = v5;
  v9.y = v6;
  if (CGRectContainsPoint(*p_badgeTapZone, v9) && -[PUCameraImportItemCell selectable](self, "selectable"))
  {
    -[PUCameraImportItemCell representedImportItem](self, "representedImportItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "state");

    if (v8 != 1)
      -[PUCameraImportItemCell _selectAction](self, "_selectAction");
  }
  else
  {
    -[PUCameraImportItemCell _enterOneUpAction](self, "_enterOneUpAction");
  }
}

- (void)_enterOneUpAction
{
  id v3;

  -[PUCameraImportItemCell delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleTouchEvent:forCell:", 1, self);

}

- (void)_selectAction
{
  id v3;

  -[PUCameraImportItemCell delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleTouchEvent:forCell:", 0, self);

}

- (int64_t)dragState
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[PUCameraImportItemCell representedImportItem](self, "representedImportItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x1E0DC46B0];
}

- (void)accessibilityElementDidBecomeFocused
{
  void *v3;
  id v4;

  -[PUCameraImportItemCell superview](self, "superview");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForCell:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollToItemAtIndexPath:atScrollPosition:animated:", v3, 18, 0);

  UIAccessibilityPostNotification(*MEMORY[0x1E0DC4578], self);
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void **v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v20;
  void *v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  -[PUCameraImportItemCell representedImportItem](self, "representedImportItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "isSelected");
  PLLocalizedFrameworkString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC33F0]), "initWithName:target:selector:", v4, self, sel__selectAction);
  -[PUCameraImportItemCell representedImportItem](self, "representedImportItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isMediaAsset");

  if (v7)
  {
    PLLocalizedFrameworkString();
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC33F0]), "initWithName:target:selector:", v8, self, sel__enterOneUpAction);
    -[PUCameraImportItemCell representedImportItem](self, "representedImportItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isSelectable");

    if (v11)
    {
      v22[0] = v9;
      v22[1] = v5;
      v12 = (void *)MEMORY[0x1E0C99D20];
      v13 = (void **)v22;
      v14 = 2;
    }
    else
    {
      v21 = v9;
      v12 = (void *)MEMORY[0x1E0C99D20];
      v13 = &v21;
      v14 = 1;
    }
    objc_msgSend(v12, "arrayWithObjects:count:", v13, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }
  else
  {
    -[PUCameraImportItemCell representedImportItem](self, "representedImportItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "kind");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0D7C430]);

    if (v17)
    {
      v20 = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
  }

  return v18;
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
      -[PUCameraImportItemCell addSubview:](self, "addSubview:", self->_debugTextField);
      -[PUCameraImportItemCell setNeedsLayout](self, "setNeedsLayout");
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

- (PUCameraImportItemCellDelegate)delegate
{
  return (PUCameraImportItemCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXImportItemViewModel)representedImportItem
{
  return self->_representedImportItem;
}

- (BOOL)needsThumbnailRefresh
{
  return self->_needsThumbnailRefresh;
}

- (PUPhotoView)photoView
{
  return self->_photoView;
}

- (void)setPhotoView:(id)a3
{
  objc_storeStrong((id *)&self->_photoView, a3);
}

- (int64_t)badgeType
{
  return self->_badgeType;
}

- (BOOL)selectable
{
  return self->_selectable;
}

- (UIView)badgeContainerView
{
  return self->_badgeContainerView;
}

- (void)setBadgeContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeContainerView, a3);
}

- (UIView)badgeView
{
  return self->_badgeView;
}

- (void)setBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeView, a3);
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (UITextField)debugTextField
{
  return self->_debugTextField;
}

- (void)setDebugTextField:(id)a3
{
  objc_storeStrong((id *)&self->_debugTextField, a3);
}

- (BOOL)needsBadgeUpdate
{
  return self->_needsBadgeUpdate;
}

- (void)setNeedsBadgeUpdate:(BOOL)a3
{
  self->_needsBadgeUpdate = a3;
}

- (CGRect)scaledDisplayRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_scaledDisplayRect.origin.x;
  y = self->_scaledDisplayRect.origin.y;
  width = self->_scaledDisplayRect.size.width;
  height = self->_scaledDisplayRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setScaledDisplayRect:(CGRect)a3
{
  self->_scaledDisplayRect = a3;
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
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_badgeContainerView, 0);
  objc_storeStrong((id *)&self->_photoView, 0);
  objc_storeStrong((id *)&self->_representedImportItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __46__PUCameraImportItemCell__fetchThumbnailReady__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  id *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v6 = a2;
  if (v6)
  {
    v7 = (id *)(a1 + 40);
    v12 = v6;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "representedImportItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 32);

    v6 = v12;
    if (v9 == v10)
    {
      v11 = objc_loadWeakRetained(v7);
      objc_msgSend(v11, "setCachedImage:isPlaceholder:", v12, a4);

      v6 = v12;
    }
  }

}

void __40__PUCameraImportItemCell_initWithFrame___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  PXImportBadgeViewForTypeAndSelectable();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  PUCameraImportItemBadgeSize_0 = v0;
  PUCameraImportItemBadgeSize_1 = v1;

}

+ (double)alphaForSelectedCells
{
  return 0.6;
}

@end
