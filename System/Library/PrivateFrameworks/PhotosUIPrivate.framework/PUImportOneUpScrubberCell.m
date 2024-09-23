@implementation PUImportOneUpScrubberCell

- (void)_commonPUImportOneUpScrubberCellInitialization
{
  -[PUReviewScrubberCell setSuggested:](self, "setSuggested:", 0);
  -[PUReviewScrubberCell setWantsSmallSuggestionIndicators:](self, "setWantsSmallSuggestionIndicators:", 0);
  -[PUImportOneUpScrubberCell setThumbnailRequestID:](self, "setThumbnailRequestID:", 0);
}

- (PUImportOneUpScrubberCell)initWithFrame:(CGRect)a3
{
  PUImportOneUpScrubberCell *v3;
  PUImportOneUpScrubberCell *v4;
  PUImportOneUpScrubberCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUImportOneUpScrubberCell;
  v3 = -[PUReviewScrubberCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PUImportOneUpScrubberCell _commonPUImportOneUpScrubberCellInitialization](v3, "_commonPUImportOneUpScrubberCellInitialization");
    v5 = v4;
  }

  return v4;
}

- (PUImportOneUpScrubberCell)initWithCoder:(id)a3
{
  PUImportOneUpScrubberCell *v3;
  PUImportOneUpScrubberCell *v4;
  PUImportOneUpScrubberCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUImportOneUpScrubberCell;
  v3 = -[PUReviewScrubberCell initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    -[PUImportOneUpScrubberCell _commonPUImportOneUpScrubberCellInitialization](v3, "_commonPUImportOneUpScrubberCellInitialization");
    v5 = v4;
  }

  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
  if (-[PUImportOneUpScrubberCell thumbnailRequestID](self, "thumbnailRequestID"))
  {
    -[PUImportOneUpScrubberCell displayDelegate](self, "displayDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "importOneUpScrubberCell:didRequestCancellationOfThumbnailRequestWithID:", self, -[PUImportOneUpScrubberCell thumbnailRequestID](self, "thumbnailRequestID"));

    -[PUImportOneUpScrubberCell setThumbnailRequestID:](self, "setThumbnailRequestID:", 0);
  }
  v4.receiver = self;
  v4.super_class = (Class)PUImportOneUpScrubberCell;
  -[PUImportOneUpScrubberCell dealloc](&v4, sel_dealloc);
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  objc_super v8;
  CGRect v9;
  CGRect v10;

  v8.receiver = self;
  v8.super_class = (Class)PUImportOneUpScrubberCell;
  -[PUReviewScrubberCell layoutSubviews](&v8, sel_layoutSubviews);
  -[PUImportOneUpScrubberCell bounds](self, "bounds");
  x = v9.origin.x;
  y = v9.origin.y;
  width = v9.size.width;
  height = v9.size.height;
  MidX = CGRectGetMidX(v9);
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  -[UIActivityIndicatorView setCenter:](self->_spinner, "setCenter:", MidX, CGRectGetMidY(v10));
}

- (void)prepareForReuse
{
  void *v3;
  PXImportItemViewModel *importItem;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUImportOneUpScrubberCell;
  -[PUImportOneUpScrubberCell prepareForReuse](&v5, sel_prepareForReuse);
  -[PXImportItemViewModel unregisterChangeObserver:context:](self->_importItem, "unregisterChangeObserver:context:", self, PXImportItemViewModelOneUpScrubberCellContext);
  if (-[PUImportOneUpScrubberCell thumbnailRequestID](self, "thumbnailRequestID"))
  {
    -[PUImportOneUpScrubberCell displayDelegate](self, "displayDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "importOneUpScrubberCell:didRequestCancellationOfThumbnailRequestWithID:", self, -[PUImportOneUpScrubberCell thumbnailRequestID](self, "thumbnailRequestID"));

    -[PUImportOneUpScrubberCell setThumbnailRequestID:](self, "setThumbnailRequestID:", 0);
  }
  importItem = self->_importItem;
  self->_importItem = 0;

}

- (void)setImportItem:(id)a3
{
  PXImportItemViewModel **p_importItem;
  void *v6;
  PXImportItemViewModel *v7;

  p_importItem = &self->_importItem;
  v7 = (PXImportItemViewModel *)a3;
  if (*p_importItem != v7)
  {
    objc_storeStrong((id *)&self->_importItem, a3);
    -[PUImportOneUpScrubberCell importItem](self, "importItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportOneUpScrubberCell setSelectable:](self, "setSelectable:", objc_msgSend(v6, "isSelectable"));

    -[PUImportOneUpScrubberCell setBadgeType:](self, "setBadgeType:", -[PXImportItemViewModel badgeType](v7, "badgeType"));
    -[PUImportOneUpScrubberCell updateBadgeUIIfNeeded](self, "updateBadgeUIIfNeeded");
    -[PUImportOneUpScrubberCell updateToThumbnail:](self, "updateToThumbnail:", 0);
    -[PXImportItemViewModel registerChangeObserver:context:](*p_importItem, "registerChangeObserver:context:", self, PXImportItemViewModelOneUpScrubberCellContext);
  }

}

- (void)setBadgeType:(int64_t)a3
{
  self->_badgeType = a3;
  -[PUImportOneUpScrubberCell setNeedsBadgeUpdate:](self, "setNeedsBadgeUpdate:", 1);
}

- (void)setSelectable:(BOOL)a3
{
  self->_selectable = a3;
  -[PUImportOneUpScrubberCell setNeedsBadgeUpdate:](self, "setNeedsBadgeUpdate:", 1);
}

- (void)updateBadgeUIIfNeeded
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  if (-[PUImportOneUpScrubberCell needsBadgeUpdate](self, "needsBadgeUpdate"))
  {
    -[PUImportOneUpScrubberCell setNeedsBadgeUpdate:](self, "setNeedsBadgeUpdate:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v3 = 0;
    v4 = 1;
    switch(self->_badgeType)
    {
      case 0:
        v4 = 0;
        v3 = 0;
        break;
      case 2:
        v4 = 0;
        v3 = 1;
        break;
      case 3:
        objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      case 4:
        objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
        v5 = objc_claimAutoreleasedReturnValue();
LABEL_8:
        v6 = (void *)v5;

        v3 = 0;
        v8 = v6;
        break;
      default:
        break;
    }
    -[PUReviewScrubberCell _checkmarkImageView](self, "_checkmarkImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", v8);

    -[PUReviewScrubberCell setFavorite:](self, "setFavorite:", v4);
    if (v3)
    {
      -[PUImportOneUpScrubberCell _createSpinnerIfNecessary](self, "_createSpinnerIfNecessary");
      -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
    }
    else
    {
      -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
    }
    -[PUImportOneUpScrubberCell setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)refreshThumbnail
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  -[PUImportOneUpScrubberCell displayDelegate](self, "displayDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUImportOneUpScrubberCell.m"), 159, CFSTR("Missing thumbnail provider"));

  }
  -[PUImportOneUpScrubberCell importItem](self, "importItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[PUImportOneUpScrubberCell displayDelegate](self, "displayDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportOneUpScrubberCell importItem](self, "importItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__PUImportOneUpScrubberCell_refreshThumbnail__block_invoke;
  v10[3] = &unk_1E58A0408;
  objc_copyWeak(&v12, &location);
  v8 = v5;
  v11 = v8;
  -[PUImportOneUpScrubberCell setThumbnailRequestID:](self, "setThumbnailRequestID:", objc_msgSend(v6, "importOneUpScrubberCell:requestedThumbnailForImportItem:completion:", self, v7, v10));

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)updateToThumbnail:(id)a3
{
  void *v5;
  id v6;

  -[PUReviewScrubberCell setImage:](self, "setImage:");
  if (a3)
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  else
    +[PUImportOneUpScrubberCell emptyThumbnailBackgroundColor](PUImportOneUpScrubberCell, "emptyThumbnailBackgroundColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PUReviewScrubberCell _thumbnailImageView](self, "_thumbnailImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

}

- (void)_createSpinnerIfNecessary
{
  UIActivityIndicatorView *v3;
  UIActivityIndicatorView *spinner;
  void *v5;
  UIActivityIndicatorView *v6;
  void *v7;
  __int128 v8;
  UIActivityIndicatorView *v9;
  CGAffineTransform v10;
  CGAffineTransform v11;
  CGAffineTransform v12;

  if (!self->_spinner)
  {
    v3 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    spinner = self->_spinner;
    self->_spinner = v3;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView setColor:](self->_spinner, "setColor:", v5);

    -[UIActivityIndicatorView sizeToFit](self->_spinner, "sizeToFit");
    v6 = self->_spinner;
    -[PUReviewScrubberCell _checkmarkImageView](self, "_checkmarkImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportOneUpScrubberCell insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v6, v7);

    v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v11.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v11.c = v8;
    *(_OWORD *)&v11.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    CGAffineTransformScale(&v12, &v11, 0.5, 0.5);
    v9 = self->_spinner;
    v10 = v12;
    -[UIActivityIndicatorView setTransform:](v9, "setTransform:", &v10);
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  void *v9;
  _BOOL4 v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;

  v6 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUImportOneUpScrubberCell.m"), 203, CFSTR("Expecting main thread only for cell signals"));

  }
  if ((void *)PXImportItemViewModelOneUpScrubberCellContext == a5)
  {
    if ((v6 & 4) != 0)
    {
      -[PUImportOneUpScrubberCell importItem](self, "importItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUImportOneUpScrubberCell setSelectable:](self, "setSelectable:", objc_msgSend(v9, "isSelectable"));

    }
    v10 = (v6 & 5) != 0;
    if ((v6 & 8) != 0)
    {
      -[PUImportOneUpScrubberCell importItem](self, "importItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isDuplicate");

      if ((v6 & 5) != 0)
        v10 = 1;
      else
        v10 = v12;
    }
    if ((v6 & 0x12) != 0 || v10)
    {
      -[PUImportOneUpScrubberCell importItem](self, "importItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUImportOneUpScrubberCell setBadgeType:](self, "setBadgeType:", objc_msgSend(v13, "badgeType"));

      -[PUImportOneUpScrubberCell updateBadgeUIIfNeeded](self, "updateBadgeUIIfNeeded");
    }
  }
}

- (PUImportOneUpScrubberCellDisplayDelegate)displayDelegate
{
  return (PUImportOneUpScrubberCellDisplayDelegate *)objc_loadWeakRetained((id *)&self->_displayDelegate);
}

- (void)setDisplayDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_displayDelegate, a3);
}

- (PXImportItemViewModel)importItem
{
  return self->_importItem;
}

- (int64_t)badgeType
{
  return self->_badgeType;
}

- (BOOL)selectable
{
  return self->_selectable;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (BOOL)needsBadgeUpdate
{
  return self->_needsBadgeUpdate;
}

- (void)setNeedsBadgeUpdate:(BOOL)a3
{
  self->_needsBadgeUpdate = a3;
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
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_importItem, 0);
  objc_destroyWeak((id *)&self->_displayDelegate);
}

void __45__PUImportOneUpScrubberCell_refreshThumbnail__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  id *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v5 = a2;
  if (v5)
  {
    v12 = v5;
    v6 = (id *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "importItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 32);

    if (v8 == v9)
    {
      v10 = v12;
      if (a3)
      {

        v10 = 0;
      }
      v12 = v10;
      v11 = objc_loadWeakRetained(v6);
      objc_msgSend(v11, "updateToThumbnail:", v12);

    }
    v5 = v12;
  }

}

+ (id)emptyThumbnailBackgroundColor
{
  if (emptyThumbnailBackgroundColor_onceToken != -1)
    dispatch_once(&emptyThumbnailBackgroundColor_onceToken, &__block_literal_global_36779);
  return (id)emptyThumbnailBackgroundColor_emptyBackgroundColor;
}

void __58__PUImportOneUpScrubberCell_emptyThumbnailBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)emptyThumbnailBackgroundColor_emptyBackgroundColor;
  emptyThumbnailBackgroundColor_emptyBackgroundColor = v0;

}

@end
