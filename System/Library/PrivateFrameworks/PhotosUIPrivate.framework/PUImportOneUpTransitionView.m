@implementation PUImportOneUpTransitionView

- (PUImportOneUpTransitionView)initWithImportItem:(id)a3 startingImage:(id)a4 mediaProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  PUImportOneUpTransitionView *v15;
  PUImportOneUpTransitionView *v16;
  CGSize v17;
  CGPoint v18;
  PUImportOneUpCellBadgeView *v19;
  PUImportOneUpCellBadgeView *badgeView;
  void *v21;
  NSArray *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSArray *badgeViewOffsetConstraints;
  NSArray *v32;
  void *v33;
  void *v34;
  objc_super v36;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v36.receiver = self;
  v36.super_class = (Class)PUImportOneUpTransitionView;
  v11 = *MEMORY[0x1E0C9D648];
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v15 = -[PUImportOneUpCell initWithFrame:](&v36, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v12, v13, v14);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_startingImage, a4);
    objc_storeStrong((id *)&v16->_mediaProvider, a5);
    v18 = (CGPoint)*MEMORY[0x1E0C9D628];
    v17 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v16->_initialFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v16->_initialFrame.size = v17;
    v16->_targetFrame.origin = v18;
    v16->_targetFrame.size = v17;
    v16->_initialPhotoViewAlpha = 1.0;
    v16->_targetPhotoViewAlpha = 1.0;
    v19 = -[PUImportOneUpCellBadgeView initWithFrame:]([PUImportOneUpCellBadgeView alloc], "initWithFrame:", v11, v12, v13, v14);
    badgeView = v16->_badgeView;
    v16->_badgeView = v19;

    -[PUImportOneUpTransitionView contentView](v16, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubview:", v16->_badgeView);

    -[PUImportOneUpCellBadgeView setTranslatesAutoresizingMaskIntoConstraints:](v16->_badgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[PUImportOneUpCellBadgeView rightAnchor](v16->_badgeView, "rightAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosSharingGridCell photoView](v16, "photoView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "rightAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:constant:", v25, -6.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v22, "addObject:", v26);

    -[PUImportOneUpCellBadgeView bottomAnchor](v16->_badgeView, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosSharingGridCell photoView](v16, "photoView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:constant:", v29, -6.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v22, "addObject:", v30);

    badgeViewOffsetConstraints = v16->_badgeViewOffsetConstraints;
    v16->_badgeViewOffsetConstraints = v22;
    v32 = v22;

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v16->_badgeViewOffsetConstraints);
    -[PUImportOneUpCell setDisplayDelegate:](v16, "setDisplayDelegate:", v16);
    -[PUImportOneUpCell setImportItem:](v16, "setImportItem:", v8);
    if (v9)
      -[PUImportOneUpCell setImage:isPlaceholder:](v16, "setImage:isPlaceholder:", v9, 0);
    -[PUImportOneUpCell refreshThumbnail](v16, "refreshThumbnail");
    -[PUImportOneUpTransitionView updateBadgeView](v16, "updateBadgeView");
    -[PUPhotosSharingGridCell photoView](v16, "photoView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "contentHelper");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setImageViewEdgeAntialiasingEnabled:", 1);

  }
  return v16;
}

- (void)contextForObservingViewModelChanges
{
  return (void *)PUImportOneUpTransitionViewContext;
}

- (void)updateBadgeView
{
  void *v3;
  _QWORD v4[5];

  -[PUImportOneUpTransitionView badgeView](self, "badgeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__PUImportOneUpTransitionView_updateBadgeView__block_invoke;
  v4[3] = &unk_1E58ABD10;
  v4[4] = self;
  objc_msgSend(v3, "performBadgeUpdates:", v4);

}

- (double)currentProgress
{
  double result;
  CGRect v4;
  CGRect v5;
  CGRect v6;
  CGRect v7;
  CGRect v8;
  CGRect v9;
  CGRect v10;
  CGRect v11;

  -[PUImportOneUpTransitionView initialFrame](self, "initialFrame");
  if (CGRectIsNull(v4))
    return 1.0;
  -[PUImportOneUpTransitionView targetFrame](self, "targetFrame");
  if (CGRectIsNull(v5))
    return 1.0;
  -[PUImportOneUpTransitionView initialFrame](self, "initialFrame");
  CGRectGetWidth(v6);
  -[PUImportOneUpTransitionView initialFrame](self, "initialFrame");
  CGRectGetHeight(v7);
  -[PUImportOneUpTransitionView targetFrame](self, "targetFrame");
  CGRectGetWidth(v8);
  -[PUImportOneUpTransitionView targetFrame](self, "targetFrame");
  CGRectGetHeight(v9);
  -[PUImportOneUpTransitionView bounds](self, "bounds");
  CGRectGetWidth(v10);
  -[PUImportOneUpTransitionView bounds](self, "bounds");
  CGRectGetHeight(v11);
  PXClamp();
  return result;
}

- (void)updateConstraints
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v19 = *MEMORY[0x1E0C80C00];
  -[PUImportOneUpTransitionView initialFrame](self, "initialFrame");
  if (!CGRectIsNull(v20))
  {
    -[PUImportOneUpTransitionView targetFrame](self, "targetFrame");
    if (!CGRectIsNull(v21))
    {
      -[PUImportOneUpTransitionView currentProgress](self, "currentProgress");
      v4 = v3;
      -[PUImportOneUpTransitionView initialFrame](self, "initialFrame");
      -[PUImportOneUpTransitionView initialFrame](self, "initialFrame", CGRectGetWidth(v22));
      -[PUImportOneUpTransitionView targetFrame](self, "targetFrame", CGRectGetHeight(v23));
      -[PUImportOneUpTransitionView targetFrame](self, "targetFrame", CGRectGetWidth(v24));
      CGRectGetHeight(v25);
      objc_msgSend((id)objc_opt_class(), "interpolatedValueBetweenInitialValue:andFinalValue:atProgress:", 6.0, 6.0, v4);
      v6 = v5;
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      -[PUImportOneUpTransitionView badgeViewOffsetConstraints](self, "badgeViewOffsetConstraints");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v15;
        v11 = -v6;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v15 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "setConstant:", v11);
          }
          while (v9 != v12);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v9);
      }

    }
  }
  v13.receiver = self;
  v13.super_class = (Class)PUImportOneUpTransitionView;
  -[PUImportOneUpTransitionView updateConstraints](&v13, sel_updateConstraints);
}

- (void)updateAlphaIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  -[PUImportOneUpTransitionView initialPhotoViewAlpha](self, "initialPhotoViewAlpha");
  v4 = v3;
  -[PUImportOneUpTransitionView targetPhotoViewAlpha](self, "targetPhotoViewAlpha");
  if (v4 != v5)
  {
    -[PUImportOneUpTransitionView currentProgress](self, "currentProgress");
    v7 = v6;
    v8 = (void *)objc_opt_class();
    -[PUImportOneUpTransitionView initialPhotoViewAlpha](self, "initialPhotoViewAlpha");
    v10 = v9;
    -[PUImportOneUpTransitionView targetPhotoViewAlpha](self, "targetPhotoViewAlpha");
    objc_msgSend(v8, "interpolatedValueBetweenInitialValue:andFinalValue:atProgress:", v10, v11, v7);
    v13 = v12;
    -[PUPhotosSharingGridCell photoView](self, "photoView");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contentHelper");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setContentAlpha:", v13);

  }
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;
  CGRect v5;
  CGRect v6;

  v4.receiver = self;
  v4.super_class = (Class)PUImportOneUpTransitionView;
  -[PUImportOneUpTransitionView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PUImportOneUpTransitionView initialFrame](self, "initialFrame");
  if (!CGRectIsNull(v5))
  {
    -[PUImportOneUpTransitionView targetFrame](self, "targetFrame");
    if (!CGRectIsNull(v6))
    {
      -[PUImportOneUpTransitionView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
      -[PUImportOneUpTransitionView updateAlphaIfNeeded](self, "updateAlphaIfNeeded");
    }
  }
}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v4;
  _OWORD v5[3];
  objc_super v6;
  CGRect v7;
  CGRect v8;

  v6.receiver = self;
  v6.super_class = (Class)PUImportOneUpTransitionView;
  v4 = *(_OWORD *)&a3->c;
  v5[0] = *(_OWORD *)&a3->a;
  v5[1] = v4;
  v5[2] = *(_OWORD *)&a3->tx;
  -[PUImportOneUpTransitionView setTransform:](&v6, sel_setTransform_, v5);
  -[PUImportOneUpTransitionView initialFrame](self, "initialFrame");
  if (!CGRectIsNull(v7))
  {
    -[PUImportOneUpTransitionView targetFrame](self, "targetFrame");
    if (!CGRectIsNull(v8))
    {
      -[PUImportOneUpTransitionView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
      -[PUImportOneUpTransitionView updateAlphaIfNeeded](self, "updateAlphaIfNeeded");
    }
  }
}

- (void)setInitialFrame:(CGRect)a3 targetFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  CGRect v9;
  CGRect v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[PUImportOneUpTransitionView setInitialFrame:](self, "setInitialFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PUImportOneUpTransitionView setTargetFrame:](self, "setTargetFrame:", x, y, width, height);
  -[PUImportOneUpTransitionView initialFrame](self, "initialFrame");
  if (!CGRectIsNull(v9))
  {
    -[PUImportOneUpTransitionView targetFrame](self, "targetFrame");
    if (!CGRectIsNull(v10))
      -[PUImportOneUpTransitionView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setPhotoViewInitialAlpha:(double)a3 targetAlpha:(double)a4
{
  CGRect v6;
  CGRect v7;

  -[PUImportOneUpTransitionView setInitialPhotoViewAlpha:](self, "setInitialPhotoViewAlpha:", a3);
  -[PUImportOneUpTransitionView setTargetPhotoViewAlpha:](self, "setTargetPhotoViewAlpha:", a4);
  -[PUImportOneUpTransitionView initialFrame](self, "initialFrame");
  if (!CGRectIsNull(v6))
  {
    -[PUImportOneUpTransitionView targetFrame](self, "targetFrame");
    if (!CGRectIsNull(v7))
      -[PUImportOneUpTransitionView updateAlphaIfNeeded](self, "updateAlphaIfNeeded");
  }
}

- (int64_t)importOneUpCell:(id)a3 requestedThumbnailForImportItem:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  int64_t v11;
  _QWORD v13[4];
  id v14;

  v7 = a5;
  v8 = a4;
  -[PUImportOneUpTransitionView mediaProvider](self, "mediaProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __90__PUImportOneUpTransitionView_importOneUpCell_requestedThumbnailForImportItem_completion___block_invoke;
  v13[3] = &unk_1E58A0E68;
  v14 = v7;
  v10 = v7;
  v11 = objc_msgSend(v9, "requestImageForImportItem:ofSize:priority:completion:", v8, 3, 1, v13);

  return v11;
}

- (void)importOneUpCell:(id)a3 didRequestCancellationOfThumbnailRequestWithID:(int64_t)a4
{
  id v5;

  -[PUImportOneUpTransitionView mediaProvider](self, "mediaProvider", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelImageRequest:", a4);

}

- (UIImage)startingImage
{
  return self->_startingImage;
}

- (void)setStartingImage:(id)a3
{
  objc_storeStrong((id *)&self->_startingImage, a3);
}

- (PXImportMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (void)setMediaProvider:(id)a3
{
  objc_storeStrong((id *)&self->_mediaProvider, a3);
}

- (PUImportOneUpCellBadgeView)badgeView
{
  return self->_badgeView;
}

- (NSArray)badgeViewOffsetConstraints
{
  return self->_badgeViewOffsetConstraints;
}

- (CGRect)initialFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_initialFrame.origin.x;
  y = self->_initialFrame.origin.y;
  width = self->_initialFrame.size.width;
  height = self->_initialFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInitialFrame:(CGRect)a3
{
  self->_initialFrame = a3;
}

- (CGRect)targetFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_targetFrame.origin.x;
  y = self->_targetFrame.origin.y;
  width = self->_targetFrame.size.width;
  height = self->_targetFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTargetFrame:(CGRect)a3
{
  self->_targetFrame = a3;
}

- (double)initialPhotoViewAlpha
{
  return self->_initialPhotoViewAlpha;
}

- (void)setInitialPhotoViewAlpha:(double)a3
{
  self->_initialPhotoViewAlpha = a3;
}

- (double)targetPhotoViewAlpha
{
  return self->_targetPhotoViewAlpha;
}

- (void)setTargetPhotoViewAlpha:(double)a3
{
  self->_targetPhotoViewAlpha = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeViewOffsetConstraints, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_startingImage, 0);
}

uint64_t __90__PUImportOneUpTransitionView_importOneUpCell_requestedThumbnailForImportItem_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  return result;
}

void __46__PUImportOneUpTransitionView_updateBadgeView__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "importItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "badgeType");
  objc_msgSend(*(id *)(a1 + 32), "badgeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBadgeType:", v3);

  objc_msgSend(*(id *)(a1 + 32), "importItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "isSelectable");
  objc_msgSend(*(id *)(a1 + 32), "badgeView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelectable:", v5);

}

+ (double)interpolatedValueBetweenInitialValue:(double)a3 andFinalValue:(double)a4 atProgress:(double)a5
{
  return a3 + a5 * (a4 - a3);
}

@end
