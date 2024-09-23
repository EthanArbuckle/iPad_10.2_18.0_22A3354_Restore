@implementation PUPhotosSharingGridCell

- (PUPhotosSharingGridCell)initWithFrame:(CGRect)a3
{
  PUPhotosSharingGridCell *v3;
  PUPhotosSharingGridCell *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  PUPhotoView *v10;
  PUPhotoView *photoView;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PUPhotosSharingGridCell;
  v3 = -[PUPhotosSharingGridCell initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PUPhotosSharingGridCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v10 = -[PUPhotoView initWithFrame:]([PUPhotoView alloc], "initWithFrame:", v6, v7, v8, v9);
    photoView = v4->_photoView;
    v4->_photoView = v10;

    -[PUPhotoView contentHelper](v4->_photoView, "contentHelper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFillMode:", 1);

    objc_msgSend(v5, "addSubview:", v4->_photoView);
  }
  return v4;
}

- (void)_updateHighlight
{
  void *v3;
  char v4;
  id v5;
  UIView *v6;
  UIView *highlightOverlayView;
  UIView *v8;
  void *v9;
  uint64_t v10;

  if ((-[PUPhotosSharingGridCell isHighlighted](self, "isHighlighted") & 1) == 0
    || (-[PUPhotoView contentHelper](self->_photoView, "contentHelper"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "providesVisualFeedbackOnPress"),
        v3,
        (v4 & 1) != 0))
  {
    v10 = 1;
  }
  else
  {
    if (!self->_highlightOverlayView)
    {
      v5 = objc_alloc(MEMORY[0x1E0DC3F10]);
      -[PUPhotosSharingGridCell bounds](self, "bounds");
      v6 = (UIView *)objc_msgSend(v5, "initWithFrame:");
      highlightOverlayView = self->_highlightOverlayView;
      self->_highlightOverlayView = v6;

      -[UIView setUserInteractionEnabled:](self->_highlightOverlayView, "setUserInteractionEnabled:", 0);
      v8 = self->_highlightOverlayView;
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v9);

      -[UIView setAlpha:](self->_highlightOverlayView, "setAlpha:", 0.5);
      -[PUPhotosSharingGridCell addSubview:](self, "addSubview:", self->_highlightOverlayView);
    }
    v10 = 0;
  }
  -[UIView setHidden:](self->_highlightOverlayView, "setHidden:", v10);
  -[PUPhotosSharingGridCell _updateSubviewOrdering](self, "_updateSubviewOrdering");
  -[PUPhotosSharingGridCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateSubviewOrdering
{
  -[PUPhotosSharingGridCell bringSubviewToFront:](self, "bringSubviewToFront:", self->_highlightOverlayView);
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUPhotosSharingGridCell;
  -[PUPhotosSharingGridCell prepareForReuse](&v5, sel_prepareForReuse);
  -[PUPhotosSharingGridCell photoView](self, "photoView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setPhotoImage:", 0);
  objc_msgSend(v4, "setPlaceHolderImage:", 0);
  objc_msgSend(v4, "setLivePhoto:", 0);
  objc_msgSend(v4, "setLoopingVideoAsset:", 0);
  -[PUPhotosSharingGridCell setCurrentImageRequestID:](self, "setCurrentImageRequestID:", 0);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  -[PUPhotosSharingGridCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[PUPhotosSharingGridCell photoView](self, "photoView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeThatFits:", v4, v6);
  v9 = v8;
  v11 = v10;

  v12 = (v4 - v9) * 0.5;
  v13 = (v6 - v11) * 0.5;
  -[PUPhotoView setFrame:](self->_photoView, "setFrame:", v12, v13, v9, v11);
  -[UIView setFrame:](self->_highlightOverlayView, "setFrame:", v12, v13, v9, v11);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[PUPhotosSharingGridCell isHighlighted](self, "isHighlighted");
  v6.receiver = self;
  v6.super_class = (Class)PUPhotosSharingGridCell;
  -[PUPhotosSharingGridCell setHighlighted:](&v6, sel_setHighlighted_, v3);
  if (v5 != -[PUPhotosSharingGridCell isHighlighted](self, "isHighlighted"))
    -[PUPhotosSharingGridCell _updateHighlight](self, "_updateHighlight");
}

- (PUPhotoView)photoView
{
  return self->_photoView;
}

- (int64_t)currentImageRequestID
{
  return self->_currentImageRequestID;
}

- (void)setCurrentImageRequestID:(int64_t)a3
{
  self->_currentImageRequestID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomingCellSuperview, 0);
  objc_storeStrong((id *)&self->_zoomingCell, 0);
  objc_storeStrong((id *)&self->_highlightOverlayView, 0);
  objc_storeStrong((id *)&self->_photoView, 0);
}

@end
