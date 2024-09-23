@implementation BKLibraryBookshelfGridBookCell

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  id v14;
  void *v15;
  objc_super v17;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[BKLibraryBookshelfInfoCell convertPoint:fromView:](self->_infoCell, "convertPoint:fromView:", self, x, y);
  v9 = v8;
  v11 = v10;
  if ((-[BKLibraryBookshelfGridBookCell isHidden](self, "isHidden") & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell superview](self->_infoCell, "superview"));
    if (v12 && (-[BKLibraryBookshelfInfoCell alpha](self->_infoCell, "alpha"), v13 == 1.0))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfInfoCell hitTest:withEvent:](self->_infoCell, "hitTest:withEvent:", v7, v9, v11));

      if (v15)
        goto LABEL_6;
    }
    else
    {

    }
  }
  v17.receiver = self;
  v17.super_class = (Class)BKLibraryBookshelfGridBookCell;
  v14 = -[BKLibraryBookshelfGridBookCell hitTest:withEvent:](&v17, "hitTest:withEvent:", v7, x, y);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
LABEL_6:

  return v15;
}

- (BKLibraryBookshelfGridBookCell)initWithFrame:(CGRect)a3
{
  BKLibraryBookshelfGridBookCell *v3;
  UILabel *v4;
  UILabel *seriesSequenceLabel;
  void *v6;
  UILabel *v7;
  UILabel *supplementalContentPdfTitleLabel;
  void *v9;
  BKLibraryBookshelfInfoCell *v10;
  BKLibraryBookshelfInfoCell *infoCell;
  void *v12;
  BKLibraryBookshelfCoverView *v13;
  BKLibraryBookshelfCoverView *coverView;
  void *v15;
  UIImageView *v16;
  UIImageView *selectIndicatorView;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)BKLibraryBookshelfGridBookCell;
  v3 = -[BKLibraryBookshelfCollectionViewCell initWithFrame:](&v20, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", 0.0, 0.0, 10.0, 10.0);
    seriesSequenceLabel = v3->_seriesSequenceLabel;
    v3->_seriesSequenceLabel = v4;

    -[UILabel setNumberOfLines:](v3->_seriesSequenceLabel, "setNumberOfLines:", 1);
    -[UILabel setHidden:](v3->_seriesSequenceLabel, "setHidden:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell contentView](v3, "contentView"));
    objc_msgSend(v6, "addSubview:", v3->_seriesSequenceLabel);

    v7 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", 0.0, 0.0, 10.0, 10.0);
    supplementalContentPdfTitleLabel = v3->_supplementalContentPdfTitleLabel;
    v3->_supplementalContentPdfTitleLabel = v7;

    -[UILabel setNumberOfLines:](v3->_supplementalContentPdfTitleLabel, "setNumberOfLines:", 1);
    -[UILabel setHidden:](v3->_supplementalContentPdfTitleLabel, "setHidden:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell contentView](v3, "contentView"));
    objc_msgSend(v9, "addSubview:", v3->_supplementalContentPdfTitleLabel);

    v10 = objc_alloc_init(BKLibraryBookshelfInfoCell);
    infoCell = v3->_infoCell;
    v3->_infoCell = v10;

    -[BKLibraryBookshelfInfoCell setDelegate:](v3->_infoCell, "setDelegate:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell contentView](v3, "contentView"));
    objc_msgSend(v12, "addSubview:", v3->_infoCell);

    v13 = objc_alloc_init(BKLibraryBookshelfCoverView);
    coverView = v3->_coverView;
    v3->_coverView = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell contentView](v3, "contentView"));
    objc_msgSend(v15, "addSubview:", v3->_coverView);

    v16 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    selectIndicatorView = v3->_selectIndicatorView;
    v3->_selectIndicatorView = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell contentView](v3, "contentView"));
    objc_msgSend(v18, "addSubview:", v3->_selectIndicatorView);

    -[BKLibraryBookshelfCollectionViewCell setHighlightBackgroundColor:](v3, "setHighlightBackgroundColor:", 0);
  }
  return v3;
}

- (void)dealloc
{
  BKLibraryAsset *libraryAsset;
  objc_super v4;

  -[AEAssetAudiobookStatus removeObserver:forKeyPath:context:](self->_audiobookStatus, "removeObserver:forKeyPath:context:", self, CFSTR("assetAudiobookStatusIsPlaying"), off_1009CAA88);
  -[AEAssetAudiobookStatus removeObserver:forKeyPath:context:](self->_audiobookStatus, "removeObserver:forKeyPath:context:", self, CFSTR("assetAudiobookStatusTrackProgress"), off_1009CAA90);
  libraryAsset = self->_libraryAsset;
  if (libraryAsset && (-[BKLibraryAsset isContainer](libraryAsset, "isContainer") & 1) == 0)
  {
    -[BKLibraryAsset removeObserver:forKeyPath:context:](self->_libraryAsset, "removeObserver:forKeyPath:context:", self, CFSTR("state"), off_1009CAA98);
    -[BKLibraryAsset removeObserver:forKeyPath:context:](self->_libraryAsset, "removeObserver:forKeyPath:context:", self, CFSTR("title"), off_1009CAAA0);
    -[BKLibraryAsset removeObserver:forKeyPath:context:](self->_libraryAsset, "removeObserver:forKeyPath:context:", self, CFSTR("author"), off_1009CAAA0);
    -[BKLibraryAsset removeObserver:forKeyPath:context:](self->_libraryAsset, "removeObserver:forKeyPath:context:", self, CFSTR("genre"), off_1009CAAA0);
  }
  v4.receiver = self;
  v4.super_class = (Class)BKLibraryBookshelfGridBookCell;
  -[BKLibraryBookshelfCollectionViewCell dealloc](&v4, "dealloc");
}

- (BKDimmedCoverDownloadProgressView)progressView
{
  BKDimmedCoverDownloadProgressView *progressView;
  BKDimmedCoverDownloadProgressView *v4;
  BKDimmedCoverDownloadProgressView *v5;
  void *v6;

  progressView = self->_progressView;
  if (!progressView)
  {
    v4 = objc_alloc_init(BKDimmedCoverDownloadProgressView);
    v5 = self->_progressView;
    self->_progressView = v4;

    -[BKDimmedCoverDownloadProgressView setHidden:](self->_progressView, "setHidden:", 1);
    -[BKDimmedCoverDownloadProgressView setDelegate:](self->_progressView, "setDelegate:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell contentView](self, "contentView"));
    objc_msgSend(v6, "addSubview:", self->_progressView);

    progressView = self->_progressView;
  }
  return progressView;
}

- (id)coverLayer
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell coverView](self, "coverView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "coverLayer"));

  return v3;
}

- (void)cleanupCell
{
  void *v3;
  __int128 v4;
  void *v5;
  double v6;
  void *v7;
  _OWORD v8[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell coverLayer](self, "coverLayer"));
  v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v8[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v8[1] = v4;
  v8[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  objc_msgSend(v3, "setAffineTransform:", v8);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell coverLayer](self, "coverLayer"));
  LODWORD(v6) = 1.0;
  objc_msgSend(v5, "setOpacity:", v6);

  -[BKLibraryBookshelfGridBookCell setLibraryAsset:](self, "setLibraryAsset:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell infoCell](self, "infoCell"));
  objc_msgSend(v7, "setAudiobookStatus:", 0);

  -[BKLibraryBookshelfGridBookCell setAudiobookStatus:](self, "setAudiobookStatus:", 0);
}

- (void)prepareForReuse
{
  void *v3;
  unsigned int v4;
  objc_super v5;

  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v5.receiver = self;
  v5.super_class = (Class)BKLibraryBookshelfGridBookCell;
  -[BKLibraryBookshelfCollectionViewCell prepareForReuse](&v5, "prepareForReuse");
  -[BKLibraryBookshelfGridBookCell cleanupCell](self, "cleanupCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell coverLayer](self, "coverLayer"));
  v4 = objc_msgSend(v3, "isHidden");

  if (v4)
    -[BKLibraryBookshelfGridBookCell setCoverHidden:](self, "setCoverHidden:", 0);
  +[CATransaction commit](CATransaction, "commit");
}

- (id)cellMetrics
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_opt_class(BKLibraryBookshelfCellMetrics_Grid);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell metrics](self, "metrics"));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (BOOL)shrinkInEditMode
{
  return 1;
}

- (id)_checkmarkImageForSelectedState:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("ios_library_edit_selected_checkmark");
  else
    v3 = CFSTR("ios_library_edit_unselected_checkmark");
  return (id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v3));
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  if (-[BKLibraryBookshelfGridBookCell isSelected](self, "isSelected") != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)BKLibraryBookshelfGridBookCell;
    -[BKLibraryBookshelfGridBookCell setSelected:](&v7, "setSelected:", v3);
    if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
    {
      if (-[BKLibraryBookshelfGridBookCell shrinkInEditMode](self, "shrinkInEditMode"))
      {
        if (-[BKLibraryBookshelfGridBookCell isSelected](self, "isSelected"))
        {
          -[BKLibraryBookshelfGridBookCell _animateGrow](self, "_animateGrow");
          -[BKLibraryBookshelfGridBookCell _animateMakeVisible](self, "_animateMakeVisible");
        }
        else
        {
          -[BKLibraryBookshelfGridBookCell _animateShrink](self, "_animateShrink");
          -[BKLibraryBookshelfGridBookCell _animateDim](self, "_animateDim");
        }
      }
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell _checkmarkImageForSelectedState:](self, "_checkmarkImageForSelectedState:", -[BKLibraryBookshelfGridBookCell isSelected](self, "isSelected")));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell selectIndicatorView](self, "selectIndicatorView"));
      objc_msgSend(v6, "setImage:", v5);

    }
  }
}

- (void)_animateShrink
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10010F0C8;
  v2[3] = &unk_1008E72C0;
  v2[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v2, 0.2);
}

- (void)_animateGrow
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10010F1C0;
  v2[3] = &unk_1008E72C0;
  v2[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v2, 0.2);
}

- (void)_animateDim
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10010F260;
  v2[3] = &unk_1008E72C0;
  v2[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v2, 0.2);
}

- (void)_animateMakeVisible
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10010F308;
  v2[3] = &unk_1008E72C0;
  v2[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v2, 0.2);
}

- (id)dragPreview
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc((Class)UIDragPreview);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell coverView](self, "coverView"));
  v5 = objc_msgSend(v3, "initWithView:", v4);

  return v5;
}

- (id)dragPreviewParametersForDrop:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  float v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  id v38;
  float v39;
  double v40;
  CGFloat v41;
  double v42;
  double v43;
  double Height;
  CGRect v46;
  CGRect v47;

  v3 = a3;
  v5 = objc_alloc_init((Class)UIDragPreviewParameters);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell traitCollection](self, "traitCollection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "traitCollectionByModifyingTraits:", &stru_1008EB170));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "resolvedColorWithTraitCollection:", v7));
  objc_msgSend(v5, "setBackgroundColor:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell coverLayer](self, "coverLayer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "boundingPath"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell coverLayer](self, "coverLayer"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "boundingPath"));
    v14 = objc_msgSend(v13, "copy");
    objc_msgSend(v5, "setVisiblePath:", v14);

  }
  else
  {
    -[BKLibraryBookshelfGridBookCell coverFrame](self, "coverFrame");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    if (v3)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell libraryAsset](self, "libraryAsset"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "assetID"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "metadataForIdentifier:", v25));

      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "intrinsicAspectRatio"));
      v28 = v27;
      if (v27)
      {
        objc_msgSend(v27, "floatValue");
        if (v29 > 0.0)
        {
          -[BKLibraryBookshelfGridBookCell coverContainerFrame](self, "coverContainerFrame");
          v31 = v30;
          v33 = v32;
          v35 = v34;
          v37 = v36;
          v38 = objc_msgSend(v28, "floatValue");
          v16 = CGRectFitRectInRect(v38, 0.0, 0.0, 100.0, (float)(v39 * 100.0), v31, v33, v35, v37);
          v41 = v40;
          v20 = v42;
          v22 = v43;
          v46.origin.x = v31;
          v46.origin.y = v33;
          v46.size.width = v35;
          v46.size.height = v37;
          Height = CGRectGetHeight(v46);
          v47.origin.x = v16;
          v47.origin.y = v41;
          v47.size.width = v20;
          v47.size.height = v22;
          v18 = Height - CGRectGetHeight(v47);
        }
      }

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v16, v18, v20, v22));
    objc_msgSend(v5, "setVisiblePath:", v12);
  }

  return v5;
}

- (double)_desiredAlphaFromRawAlpha:(double)a3
{
  void *v5;
  double v6;

  if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
  {
    a3 = 1.0;
    if ((-[BKLibraryBookshelfGridBookCell isSelected](self, "isSelected") & 1) == 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell cellMetrics](self, "cellMetrics"));
      objc_msgSend(v5, "dimmedAlpha");
      a3 = v6;

    }
  }
  return a3;
}

- (BCUCoverEffectsEnvironment)coverEffectsEnvironment
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell coverLayer](self, "coverLayer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "coverEffectsEnvironment"));

  return (BCUCoverEffectsEnvironment *)v3;
}

- (void)setCoverEffectsEnvironment:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell coverLayer](self, "coverLayer"));
  objc_msgSend(v5, "setCoverEffectsEnvironment:", v4);

}

- (void)handleTapWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell actionHandler](self, "actionHandler"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell indexPath](self, "indexPath"));
  objc_msgSend(v6, "bookTapped:completion:", v5, v4);

}

- (void)setCoverHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell coverLayer](self, "coverLayer"));
  objc_msgSend(v5, "setHidden:", v3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCell audiobookControl](self, "audiobookControl"));
  objc_msgSend(v6, "setHidden:", v3);

  +[CATransaction commit](CATransaction, "commit");
}

- (id)coverImage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell coverLayer](self, "coverLayer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "image"));

  return v3;
}

- (BKLibraryBookshelfCoverView)coverView
{
  return self->_coverView;
}

- (CGRect)coverFrame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell layer](self, "layer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell coverLayer](self, "coverLayer"));
  objc_msgSend(v4, "coverBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell coverLayer](self, "coverLayer"));
  objc_msgSend(v3, "convertRect:fromLayer:", v13, v6, v8, v10, v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)coverArea
{
  double v3;
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

  -[BKLibraryBookshelfGridBookCell _areaAboveInfoCell](self, "_areaAboveInfoCell");
  v4 = v3;
  v6 = v5;
  -[BKLibraryBookshelfGridBookCell _seriesSequenceLabelHeight](self, "_seriesSequenceLabelHeight");
  v8 = v7;
  -[BKLibraryBookshelfGridBookCell _seriesSequenceLabelTopMargin](self, "_seriesSequenceLabelTopMargin");
  v10 = v6 - (v8 + v9);
  v11 = 0.0;
  v12 = 0.0;
  v13 = v4;
  result.size.height = v10;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)_areaAboveInfoCell
{
  double v3;
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  -[BKLibraryBookshelfGridBookCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[BKLibraryBookshelfGridBookCell infoCellHeight](self, "infoCellHeight");
  v12 = v11;
  -[BKLibraryBookshelfGridBookCell infoCellPadding](self, "infoCellPadding");
  v14 = v12 + v13;
  -[BKLibraryBookshelfGridBookCell infoCellExpectedDateHeight](self, "infoCellExpectedDateHeight");
  v16 = v10 - (v14 + v15);
  v17 = v4;
  v18 = v6;
  v19 = v8;
  result.size.height = v16;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  BOOL v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGPoint v18;
  CGRect v19;

  v5 = a4;
  if ((-[BKLibraryBookshelfGridBookCell isHidden](self, "isHidden") & 1) != 0)
  {
    v6 = 0;
  }
  else if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
  {
    v6 = 1;
  }
  else
  {
    -[BKLibraryBookshelfGridBookCell coverFrame](self, "coverFrame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(v5, "locationInView:", self);
    v18.x = v15;
    v18.y = v16;
    v19.origin.x = v8;
    v19.origin.y = v10;
    v19.size.width = v12;
    v19.size.height = v14;
    v6 = CGRectContainsPoint(v19, v18);
  }

  return v6;
}

- (double)_seriesSequenceLabelHeight
{
  void *v3;
  double v4;
  double v5;

  if (!-[BKLibraryBookshelfGridBookCell hasSeriesSequenceLabel](self, "hasSeriesSequenceLabel"))
    return 0.0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell cellMetrics](self, "cellMetrics"));
  objc_msgSend(v3, "seriesSequenceLabelHeight");
  v5 = v4;

  return v5;
}

- (double)_seriesSequenceLabelTopMargin
{
  void *v3;
  double v4;
  double v5;

  if (!-[BKLibraryBookshelfGridBookCell hasSeriesSequenceLabel](self, "hasSeriesSequenceLabel"))
    return 0.0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell cellMetrics](self, "cellMetrics"));
  objc_msgSend(v3, "seriesSequenceLabelTopMargin");
  v5 = v4;

  return v5;
}

- (CGRect)infoFrame
{
  double v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  CGFloat width;
  double MaxY;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect result;

  v3 = 0.0;
  if (!-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell cellMetrics](self, "cellMetrics"));
    objc_msgSend(v4, "infoBarHeight");
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell cellMetrics](self, "cellMetrics"));
    objc_msgSend(v7, "infoBarDateSpacing");
    v9 = v6 + v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell cellMetrics](self, "cellMetrics"));
    objc_msgSend(v10, "infoBarExpectedDateHeight");
    v3 = v9 + v11;

  }
  -[BKLibraryBookshelfGridBookCell _areaAboveInfoCell](self, "_areaAboveInfoCell");
  width = v19.size.width;
  MaxY = CGRectGetMaxY(v19);
  -[BKLibraryBookshelfGridBookCell infoCellPadding](self, "infoCellPadding");
  v15 = MaxY + v14;
  v16 = 0.0;
  v17 = width;
  v18 = v3;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v15;
  result.origin.x = v16;
  return result;
}

- (double)infoCellExpectedDateHeight
{
  double v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;

  v3 = 0.0;
  if (!-[BKLibraryBookshelfGridBookCell hideInfoBar](self, "hideInfoBar"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell cellMetrics](self, "cellMetrics"));
    objc_msgSend(v4, "infoBarDateSpacing");
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell cellMetrics](self, "cellMetrics"));
    objc_msgSend(v7, "infoBarExpectedDateHeight");
    v3 = v6 + v8;

  }
  return v3;
}

- (double)infoCellHeight
{
  void *v4;
  double v5;
  double v6;

  if (-[BKLibraryBookshelfGridBookCell hideInfoBar](self, "hideInfoBar"))
    return 0.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell cellMetrics](self, "cellMetrics"));
  objc_msgSend(v4, "infoBarHeight");
  v6 = v5;

  return v6;
}

- (double)infoCellPadding
{
  double v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  double v8;

  v3 = 0.0;
  if (!-[BKLibraryBookshelfGridBookCell hideInfoBar](self, "hideInfoBar"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell seriesSequenceLabel](self, "seriesSequenceLabel"));
    v5 = objc_msgSend(v4, "isHidden");

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell cellMetrics](self, "cellMetrics"));
    v7 = v6;
    if (v5)
      objc_msgSend(v6, "infoBarSpacing");
    else
      objc_msgSend(v6, "seriesSequenceLabelBottomMargin");
    v3 = v8;

  }
  return v3;
}

- (void)_layoutCoverView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  void *v15;
  void *v16;
  _OWORD v17[3];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _OWORD v21[3];
  __int128 v22;
  __int128 v23;
  __int128 v24;

  -[BKLibraryBookshelfGridBookCell coverArea](self, "coverArea");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v23 = 0u;
  v24 = 0u;
  v22 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell coverLayer](self, "coverLayer"));
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "affineTransform");
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v22 = 0u;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell coverLayer](self, "coverLayer"));
  v14 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v21[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v21[1] = v14;
  v21[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  objc_msgSend(v13, "setAffineTransform:", v21);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell coverView](self, "coverView"));
  objc_msgSend(v15, "setFrame:", v4, v6, v8, v10);

  v18 = v22;
  v19 = v23;
  v20 = v24;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell coverLayer](self, "coverLayer"));
  v17[0] = v18;
  v17[1] = v19;
  v17[2] = v20;
  objc_msgSend(v16, "setAffineTransform:", v17);

}

- (CGRect)supplementalContentPDFTitleFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  double v13;
  CGFloat Width;
  double Height;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect result;

  -[BKLibraryBookshelfGridBookCell coverArea](self, "coverArea");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell supplementalContentPdfTitleLabel](self, "supplementalContentPdfTitleLabel"));
  v23.origin.x = v4;
  v23.origin.y = v6;
  v23.size.width = v8;
  v23.size.height = v10;
  objc_msgSend(v11, "sizeThatFits:", CGRectGetWidth(v23), 3.40282347e38);
  v13 = v12;

  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  Width = CGRectGetWidth(v24);
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  Height = CGRectGetHeight(v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell cellMetrics](self, "cellMetrics"));
  objc_msgSend(v16, "smallTitleTopMargin");
  v18 = Height + v17;

  v19 = v4;
  v20 = v18;
  v21 = Width;
  v22 = v13;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)layoutSubviews
{
  unsigned int v3;
  void *v4;
  double x;
  double y;
  double width;
  double height;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  void *v21;
  void *v22;
  double MaxY;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  unsigned __int8 v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  CGFloat v55;
  CGFloat v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  _QWORD v68[5];
  objc_super v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;

  v69.receiver = self;
  v69.super_class = (Class)BKLibraryBookshelfGridBookCell;
  -[BKLibraryBookshelfGridBookCell layoutSubviews](&v69, "layoutSubviews");
  v3 = -[BKLibraryBookshelfGridBookCell wantsAnimatedLayoutChange](self, "wantsAnimatedLayoutChange");
  +[CATransaction begin](CATransaction, "begin");
  if (v3)
  {
    +[UIView inheritedAnimationDuration](UIView, "inheritedAnimationDuration");
    +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
    +[CATransaction setAnimationTimingFunction:](CATransaction, "setAnimationTimingFunction:", v4);

    -[BKLibraryBookshelfGridBookCell _layoutCoverView](self, "_layoutCoverView");
    +[CATransaction commit](CATransaction, "commit");
    -[BKLibraryBookshelfGridBookCell infoFrame](self, "infoFrame");
    x = v70.origin.x;
    y = v70.origin.y;
    width = v70.size.width;
    height = v70.size.height;
    if (!CGRectIsEmpty(v70))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell infoCell](self, "infoCell"));
      objc_msgSend(v9, "setFrame:", x, y, width, height);

    }
  }
  else
  {
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    -[BKLibraryBookshelfGridBookCell _layoutCoverView](self, "_layoutCoverView");
    +[CATransaction commit](CATransaction, "commit");
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_1001103E0;
    v68[3] = &unk_1008E72C0;
    v68[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v68);
  }
  -[BKLibraryBookshelfGridBookCell coverArea](self, "coverArea");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell seriesSequenceLabel](self, "seriesSequenceLabel"));
  v19 = objc_msgSend(v18, "isHidden");

  if ((v19 & 1) == 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell cellMetrics](self, "cellMetrics"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "seriesSequenceLabelFontAttributes"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "font"));

    v71.origin.x = v11;
    v71.origin.y = v13;
    v71.size.width = v15;
    v71.size.height = v17;
    MaxY = CGRectGetMaxY(v71);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell cellMetrics](self, "cellMetrics"));
    objc_msgSend(v24, "seriesSequenceLabelTopMargin");
    v26 = MaxY + v25;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell cellMetrics](self, "cellMetrics"));
    objc_msgSend(v27, "seriesSequenceLabelHeight");
    v29 = v26 + v28;
    objc_msgSend(v22, "descender");
    v31 = v29 - v30;

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell seriesSequenceLabel](self, "seriesSequenceLabel"));
    v72.origin.x = v11;
    v72.origin.y = v13;
    v72.size.width = v15;
    v72.size.height = v17;
    objc_msgSend(v32, "sizeThatFits:", CGRectGetWidth(v72), 3.40282347e38);
    v34 = v33;

    v73.origin.x = v11;
    v73.origin.y = v13;
    v73.size.width = v15;
    v73.size.height = v17;
    v35 = CGRectGetWidth(v73);
    v74.origin.x = v11;
    v74.origin.y = v13;
    v74.size.width = v35;
    v74.size.height = v34;
    v36 = v31 - CGRectGetHeight(v74);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell seriesSequenceLabel](self, "seriesSequenceLabel"));
    objc_msgSend(v37, "setFrame:", v11, v36, v35, v34);

  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell supplementalContentPdfTitleLabel](self, "supplementalContentPdfTitleLabel"));
  v39 = objc_msgSend(v38, "isHidden");

  if ((v39 & 1) == 0)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell progressView](self, "progressView"));
    objc_msgSend(v40, "setFrame:", v11, v13, v15, v17);

    -[BKLibraryBookshelfGridBookCell supplementalContentPDFTitleFrame](self, "supplementalContentPDFTitleFrame");
    v42 = v41;
    v44 = v43;
    v46 = v45;
    v48 = v47;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell supplementalContentPdfTitleLabel](self, "supplementalContentPdfTitleLabel"));
    objc_msgSend(v49, "setFrame:", v42, v44, v46, v48);

  }
  v50 = *(double *)&qword_1009F4FD0;
  if (*(double *)&qword_1009F4FD0 == 0.0)
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("ios_library_edit_selected_checkmark")));
    objc_msgSend(v51, "size");
    qword_1009F4FC8 = v52;
    qword_1009F4FD0 = v53;

    v50 = *(double *)&qword_1009F4FD0;
  }
  v54 = *(double *)&qword_1009F4FC8;
  v75.origin.x = v11;
  v75.origin.y = v13;
  v75.size.width = v15;
  v75.size.height = v17;
  v55 = CGRectGetMaxX(v75) - v54 + -8.0;
  v76.origin.x = v11;
  v76.origin.y = v13;
  v76.size.width = v15;
  v76.size.height = v17;
  v56 = CGRectGetMaxY(v76) - v50 + -8.0;
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell selectIndicatorView](self, "selectIndicatorView"));
  objc_msgSend(v57, "setFrame:", v55, v56, v54, v50);

  v58 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCell audiobookControl](self, "audiobookControl"));
  if (v58)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell cellMetrics](self, "cellMetrics"));
    objc_msgSend(v59, "audiobookControlMargin");
    v61 = v60;

    objc_msgSend(v58, "frame");
    v63 = v62;
    v65 = v64;
    v66 = v11 + v61;
    v67 = v13 + v17 - v64 - v61;
    objc_msgSend(v58, "frame");
    v78.origin.x = v66;
    v78.origin.y = v67;
    v78.size.width = v63;
    v78.size.height = v65;
    if (!CGRectEqualToRect(v77, v78))
      objc_msgSend(v58, "setFrame:", IMRectFlippedForRTL(-[BKLibraryBookshelfGridBookCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == (id)1, v66, v67, v63, v65, v11, v13, v15, v17));
  }
  -[BKLibraryBookshelfGridBookCell setWantsAnimatedLayoutChange:](self, "setWantsAnimatedLayoutChange:", 0);

}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _BOOL4 v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unsigned int v46;
  double v47;
  void *v48;
  unsigned __int8 v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  BKLibraryAsset *libraryAsset;
  double v56;
  double v57;
  objc_super v58;

  v4 = a3;
  v5 = objc_opt_class(BKLibraryLayoutAttributes);
  v6 = BUDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = -[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode");
  v9 = v8 ^ objc_msgSend(v7, "editMode");
  v58.receiver = self;
  v58.super_class = (Class)BKLibraryBookshelfGridBookCell;
  -[BKLibraryBookshelfCollectionViewCell applyLayoutAttributes:](&v58, "applyLayoutAttributes:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPath"));
  -[BKLibraryBookshelfGridBookCell setIndexPath:](self, "setIndexPath:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  -[BKLibraryBookshelfGridBookCell setIsRTL:](self, "setIsRTL:", objc_msgSend(v11, "userInterfaceLayoutDirection") == (id)1);

  v12 = objc_msgSend(v7, "layoutDebugMode");
  if (-[BKLibraryBookshelfGridBookCell layoutDebugMode](self, "layoutDebugMode") == (_DWORD)v12)
  {
    if ((v9 & 1) != 0)
    {
LABEL_3:
      v13 = 1;
      goto LABEL_12;
    }
  }
  else
  {
    -[BKLibraryBookshelfGridBookCell setLayoutDebugMode:](self, "setLayoutDebugMode:", v12);
    if (objc_msgSend(v7, "layoutDebugMode"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "colorWithAlphaComponent:", 0.2)));
      v16 = objc_msgSend(v15, "CGColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell layer](self, "layer"));
      objc_msgSend(v17, "setBorderColor:", v16);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell layer](self, "layer"));
      objc_msgSend(v18, "setBorderWidth:", 0.5);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "colorWithAlphaComponent:", 0.2)));
      v21 = objc_msgSend(v20, "CGColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell seriesSequenceLabel](self, "seriesSequenceLabel"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "layer"));
      objc_msgSend(v23, "setBorderColor:", v21);

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell seriesSequenceLabel](self, "seriesSequenceLabel"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "layer"));
      objc_msgSend(v25, "setBorderWidth:", 0.5);

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
      v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "colorWithAlphaComponent:", 0.2)));
      v28 = objc_msgSend(v27, "CGColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell infoCell](self, "infoCell"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "layer"));
      objc_msgSend(v30, "setBorderColor:", v28);

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell infoCell](self, "infoCell"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "layer"));
      v33 = v32;
      v34 = 0.5;
    }
    else
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell layer](self, "layer"));
      objc_msgSend(v35, "setBorderWidth:", 0.0);

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell seriesSequenceLabel](self, "seriesSequenceLabel"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "layer"));
      objc_msgSend(v37, "setBorderWidth:", 0.0);

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell infoCell](self, "infoCell"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "layer"));
      v33 = v32;
      v34 = 0.0;
    }
    objc_msgSend(v32, "setBorderWidth:", v34);

    if ((v9 & 1) != 0)
      goto LABEL_3;
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell metrics](self, "metrics"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellMetrics"));
  if (v38 == v39)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell columnMetrics](self, "columnMetrics"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "columnMetrics"));
    v13 = v40 != v41;

  }
  else
  {
    v13 = 1;
  }

LABEL_12:
  -[BKLibraryBookshelfGridBookCell setWantsAnimatedLayoutChange:](self, "setWantsAnimatedLayoutChange:", v9);
  -[BKLibraryBookshelfGridBookCell setHideInfoBar:](self, "setHideInfoBar:", objc_msgSend(v7, "editMode"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellMetrics"));
  -[BKLibraryBookshelfGridBookCell setMetrics:](self, "setMetrics:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "columnMetrics"));
  -[BKLibraryBookshelfGridBookCell setColumnMetrics:](self, "setColumnMetrics:", v43);

  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellMetrics"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell infoCell](self, "infoCell"));
  objc_msgSend(v45, "setMetrics:", v44);

  -[BKLibraryBookshelfGridBookCell setHideSelectIndicator:](self, "setHideSelectIndicator:", objc_msgSend(v7, "editMode") ^ 1);
  -[BKLibraryBookshelfGridBookCell assetStateChanged](self, "assetStateChanged");
  objc_msgSend(v4, "alpha");
  -[BKLibraryBookshelfCollectionViewCell setAlpha:](self, "setAlpha:");
  v46 = -[BKLibraryBookshelfGridBookCell hideInfoBar](self, "hideInfoBar");
  v47 = 1.0;
  if (v46)
    v47 = 0.0;
  -[BKLibraryBookshelfInfoCell setAlpha:](self->_infoCell, "setAlpha:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell seriesSequenceLabel](self, "seriesSequenceLabel"));
  v49 = objc_msgSend(v48, "isHidden");

  if ((v49 & 1) == 0)
    -[BKLibraryBookshelfGridBookCell _updateSeriesSequenceLabelText](self, "_updateSeriesSequenceLabelText");
  -[BKLibraryBookshelfGridBookCell _updateSupplementalContentPDFTitleLabelText](self, "_updateSupplementalContentPDFTitleLabelText");
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell _checkmarkImageForSelectedState:](self, "_checkmarkImageForSelectedState:", -[BKLibraryBookshelfGridBookCell isSelected](self, "isSelected")));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell selectIndicatorView](self, "selectIndicatorView"));
  objc_msgSend(v51, "setImage:", v50);

  if (v13)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell libraryAsset](self, "libraryAsset"));

    if (v52)
    {
      -[BKLibraryBookshelfGridBookCell setNeedsLayout](self, "setNeedsLayout");
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell coverView](self, "coverView"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "coverLayer"));
      libraryAsset = self->_libraryAsset;
      -[BKLibraryBookshelfGridBookCell coverArea](self, "coverArea");
      objc_msgSend(v54, "setLibraryAsset:size:", libraryAsset, v56, v57);

    }
  }

}

- (BOOL)needsAsset
{
  void *v3;
  unsigned __int8 v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell libraryAsset](self, "libraryAsset"));
  if ((objc_msgSend(v3, "isStoreItem") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell libraryAsset](self, "libraryAsset"));
    v4 = objc_msgSend(v5, "isSeriesItem");

  }
  return v4;
}

- (void)setAsset:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell infoCell](self, "infoCell"));
  objc_msgSend(v5, "setAsset:", v4);

}

- (BFMAsset)asset
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell infoCell](self, "infoCell"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "asset"));

  return (BFMAsset *)v3;
}

- (void)assetStateChanged
{
  void *v3;
  unsigned __int8 v4;
  double v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell libraryAsset](self, "libraryAsset"));

  if (v3)
  {
    v4 = -[BKLibraryBookshelfGridBookCell hideSelectIndicator](self, "hideSelectIndicator");
    if ((v4 & 1) != 0)
    {
      v5 = 0.0;
    }
    else
    {
      v7 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell libraryAsset](self, "libraryAsset"));
      if (objc_msgSend(v7, "state") == 2)
        v5 = 0.0;
      else
        v5 = 1.0;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell selectIndicatorView](self, "selectIndicatorView"));
    objc_msgSend(v6, "setAlpha:", v5);

    if ((v4 & 1) == 0)
  }
}

- (BOOL)showSeriesSequenceLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell dataSource](self, "dataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "seriesID"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell libraryAsset](self, "libraryAsset"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sequenceDisplayName"));
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_updateSeriesSequenceLabelText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell cellMetrics](self, "cellMetrics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "seriesSequenceLabelFontAttributes"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributesWithTruncated:", 1));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell libraryAsset](self, "libraryAsset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sequenceDisplayName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v6, v9));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell seriesSequenceLabel](self, "seriesSequenceLabel"));
  objc_msgSend(v8, "setAttributedText:", v7);

  -[BKLibraryBookshelfGridBookCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateSupplementalContentPDFTitleLabelText
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v15 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell dataSource](self, "dataSource"));
  if (objc_msgSend(v15, "supplementalContentPDFPicker"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell dataSource](self, "dataSource"));
    v4 = objc_msgSend(v3, "viewMode");

    if (v4 != (id)1)
      return;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell supplementalContentPdfTitleLabel](self, "supplementalContentPdfTitleLabel"));
    objc_msgSend(v5, "setHidden:", 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell cellMetrics](self, "cellMetrics"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "smallTitleFontAttributes"));
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "attributesWithCentered:truncated:", 1, 1));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell libraryAsset](self, "libraryAsset"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v9, v15));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell supplementalContentPdfTitleLabel](self, "supplementalContentPdfTitleLabel"));
    objc_msgSend(v11, "setAttributedText:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell cellMetrics](self, "cellMetrics"));
    v13 = objc_msgSend(v12, "numOfLinesSmallTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell supplementalContentPdfTitleLabel](self, "supplementalContentPdfTitleLabel"));
    objc_msgSend(v14, "setNumberOfLines:", v13);

    -[BKLibraryBookshelfGridBookCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_updateSeriesSequenceLabel:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unsigned int v6;
  unsigned int v7;
  void *v8;
  void *v9;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell seriesSequenceLabel](self, "seriesSequenceLabel"));
  v6 = objc_msgSend(v5, "isHidden");

  v7 = -[BKLibraryBookshelfGridBookCell showSeriesSequenceLabel](self, "showSeriesSequenceLabel");
  if (v6 == v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell seriesSequenceLabel](self, "seriesSequenceLabel"));
    objc_msgSend(v8, "setHidden:", v7 ^ 1);

    if ((v7 & 1) != 0)
    {
      v3 = 1;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell seriesSequenceLabel](self, "seriesSequenceLabel"));
      objc_msgSend(v9, "setAttributedText:", 0);

    }
    -[BKLibraryBookshelfGridBookCell setNeedsLayout](self, "setNeedsLayout");
  }
  if ((v7 & v3) == 1)
    -[BKLibraryBookshelfGridBookCell _updateSeriesSequenceLabelText](self, "_updateSeriesSequenceLabelText");
}

- (void)setLibraryAsset:(id)a3
{
  BKLibraryAsset *v5;
  BKLibraryAsset **p_libraryAsset;
  BKLibraryAsset *libraryAsset;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  BKLibraryAsset *v17;

  v5 = (BKLibraryAsset *)a3;
  p_libraryAsset = &self->_libraryAsset;
  libraryAsset = self->_libraryAsset;
  if (libraryAsset != v5)
  {
    v17 = v5;
    if ((-[BKLibraryAsset isContainer](libraryAsset, "isContainer") & 1) == 0)
    {
      -[BKLibraryAsset removeObserver:forKeyPath:context:](*p_libraryAsset, "removeObserver:forKeyPath:context:", self, CFSTR("state"), off_1009CAA98);
      -[BKLibraryAsset removeObserver:forKeyPath:context:](*p_libraryAsset, "removeObserver:forKeyPath:context:", self, CFSTR("title"), off_1009CAAA0);
      -[BKLibraryAsset removeObserver:forKeyPath:context:](*p_libraryAsset, "removeObserver:forKeyPath:context:", self, CFSTR("author"), off_1009CAAA0);
      -[BKLibraryAsset removeObserver:forKeyPath:context:](*p_libraryAsset, "removeObserver:forKeyPath:context:", self, CFSTR("genre"), off_1009CAAA0);
    }
    objc_storeStrong((id *)&self->_libraryAsset, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell libraryAsset](self, "libraryAsset"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell dataSource](self, "dataSource"));
    v10 = objc_msgSend(v9, "supplementalContentPDFPicker");

    if (v10)
    {
      -[BKLibraryBookshelfGridBookCell _updateSupplementalContentPDFTitleLabelText](self, "_updateSupplementalContentPDFTitleLabelText");
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell progressView](self, "progressView"));
      objc_msgSend(v11, "setHidden:", 0);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell progressView](self, "progressView"));
      objc_msgSend(v12, "setAsset:", v8);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell infoCell](self, "infoCell"));
    objc_msgSend(v13, "setLibraryAsset:", v8);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell coverLayer](self, "coverLayer"));
    -[BKLibraryBookshelfGridBookCell coverArea](self, "coverArea");
    objc_msgSend(v14, "setLibraryAsset:size:", v8, v15, v16);

    if (v8)
    {
      if ((objc_msgSend(v8, "isOwned") & 1) == 0)
        -[BKLibraryBookshelfGridBookCell updateLibraryAssetPrice](self, "updateLibraryAssetPrice");
      -[BKLibraryBookshelfGridBookCell _updateSeriesSequenceLabel:](self, "_updateSeriesSequenceLabel:", 1);
      if ((objc_msgSend(v8, "isContainer") & 1) == 0)
      {
        objc_msgSend(v8, "addObserver:forKeyPath:options:context:", self, CFSTR("state"), 0, off_1009CAA98);
        objc_msgSend(v8, "addObserver:forKeyPath:options:context:", self, CFSTR("title"), 0, off_1009CAAA0);
        objc_msgSend(v8, "addObserver:forKeyPath:options:context:", self, CFSTR("author"), 0, off_1009CAAA0);
        objc_msgSend(v8, "addObserver:forKeyPath:options:context:", self, CFSTR("genre"), 0, off_1009CAAA0);
      }
      -[BKLibraryBookshelfGridBookCell assetStateChanged](self, "assetStateChanged");
      -[BKLibraryBookshelfGridBookCell setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      -[BKLibraryBookshelfGridBookCell _updateSeriesSequenceLabel:](self, "_updateSeriesSequenceLabel:", 1);
      -[BKLibraryBookshelfGridBookCell assetStateChanged](self, "assetStateChanged");
    }

    v5 = v17;
  }

}

- (void)updateLibraryAssetPrice
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BKLibraryBookshelfGridBookCell *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "priceManager"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell libraryAsset](self, "libraryAsset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storeID"));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100111244;
  v8[3] = &unk_1008EB198;
  v9 = v6;
  v10 = self;
  v7 = v6;
  objc_msgSend(v4, "fetchPriceForAssetID:completion:", v7, v8);

}

- (void)setDataSource:(id)a3
{
  BKLibraryBookshelfSupplementaryDataSource **p_dataSource;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  p_dataSource = &self->_dataSource;
  v5 = a3;
  objc_storeWeak((id *)p_dataSource, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell infoCell](self, "infoCell"));
  objc_msgSend(v6, "setDataSource:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell _checkmarkImageForSelectedState:](self, "_checkmarkImageForSelectedState:", -[BKLibraryBookshelfGridBookCell isSelected](self, "isSelected")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell selectIndicatorView](self, "selectIndicatorView"));
  objc_msgSend(v8, "setImage:", v7);

  -[BKLibraryBookshelfGridBookCell _updateSeriesSequenceLabel:](self, "_updateSeriesSequenceLabel:", 0);
  LODWORD(v7) = objc_msgSend(v5, "supplementalContentPDFPicker");

  if ((_DWORD)v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell infoCell](self, "infoCell"));
    objc_msgSend(v9, "setHidden:", 1);

    -[BKLibraryBookshelfGridBookCell _updateSupplementalContentPDFTitleLabelText](self, "_updateSupplementalContentPDFTitleLabelText");
  }
  -[BKLibraryBookshelfGridBookCell layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)setAudiobookStatus:(id)a3
{
  AEAssetAudiobookStatus *v5;
  AEAssetAudiobookStatus **p_audiobookStatus;
  AEAssetAudiobookStatus *audiobookStatus;
  void *v8;
  void *v9;
  AEAssetAudiobookStatus *v10;

  v5 = (AEAssetAudiobookStatus *)a3;
  p_audiobookStatus = &self->_audiobookStatus;
  audiobookStatus = self->_audiobookStatus;
  if (audiobookStatus != v5)
  {
    v10 = v5;
    if (audiobookStatus)
    {
      -[AEAssetAudiobookStatus removeObserver:forKeyPath:context:](audiobookStatus, "removeObserver:forKeyPath:context:", self, CFSTR("assetAudiobookStatusIsPlaying"), off_1009CAA88);
      -[AEAssetAudiobookStatus removeObserver:forKeyPath:context:](*p_audiobookStatus, "removeObserver:forKeyPath:context:", self, CFSTR("assetAudiobookStatusTrackProgress"), off_1009CAA90);
    }
    objc_storeStrong((id *)&self->_audiobookStatus, a3);
    if (*p_audiobookStatus)
    {
      -[AEAssetAudiobookStatus addObserver:forKeyPath:options:context:](*p_audiobookStatus, "addObserver:forKeyPath:options:context:", self, CFSTR("assetAudiobookStatusIsPlaying"), 0, off_1009CAA88);
      -[AEAssetAudiobookStatus addObserver:forKeyPath:options:context:](*p_audiobookStatus, "addObserver:forKeyPath:options:context:", self, CFSTR("assetAudiobookStatusTrackProgress"), 0, off_1009CAA90);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell infoCell](self, "infoCell"));
    objc_msgSend(v8, "setAudiobookStatus:", v10);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell cellMetrics](self, "cellMetrics"));
    objc_msgSend(v9, "audiobookControlDiameter");
    -[BKLibraryBookshelfCollectionViewCell updateAudiobookControlWithStatus:diameter:](self, "updateAudiobookControlWithStatus:diameter:", v10);

    v5 = v10;
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void ***v13;
  id *v14;
  void (*v15)(uint64_t);
  objc_super v16;
  void **v17;
  uint64_t v18;
  void **v19;
  uint64_t v20;
  void **v21;
  uint64_t v22;
  void **v23;
  uint64_t v24;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_initWeak(&location, self);
  if (off_1009CAA98 == a6)
  {
    v13 = &v23;
    v14 = (id *)&v24;
    v23 = _NSConcreteStackBlock;
    v15 = sub_100111714;
LABEL_10:
    v13[1] = (void **)3221225472;
    v13[2] = (void **)v15;
    v13[3] = (void **)&unk_1008E74C8;
    objc_copyWeak(v14, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
    objc_destroyWeak(v14);
    goto LABEL_11;
  }
  if (off_1009CAA88 == a6)
  {
    v14 = (id *)&v22;
    v21 = _NSConcreteStackBlock;
    v15 = sub_100111740;
    v13 = &v21;
    goto LABEL_10;
  }
  if (off_1009CAA90 == a6)
  {
    v14 = (id *)&v20;
    v19 = _NSConcreteStackBlock;
    v15 = sub_1001117BC;
    v13 = &v19;
    goto LABEL_10;
  }
  if (off_1009CAAA0 == a6)
  {
    v14 = (id *)&v18;
    v17 = _NSConcreteStackBlock;
    v15 = sub_100111840;
    v13 = &v17;
    goto LABEL_10;
  }
  v16.receiver = self;
  v16.super_class = (Class)BKLibraryBookshelfGridBookCell;
  -[BKLibraryBookshelfGridBookCell observeValueForKeyPath:ofObject:change:context:](&v16, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
LABEL_11:
  objc_destroyWeak(&location);

}

- (void)didTapStopDownloadButtonWithAsset:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell actionHandler](self, "actionHandler", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell libraryAsset](self, "libraryAsset"));
  objc_msgSend(v5, "bookCancelDownload:", v4);

}

- (id)trackerForLibraryBookshelfInfoCell:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell actionHandler](self, "actionHandler", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tracker"));

  return v4;
}

- (id)libraryBookshelfInfoCell:(id)a3 analyticsAssetPropertyProviderForLibraryAsset:(id)a4 fromSourceView:(id)a5 inCollection:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell actionHandler](self, "actionHandler"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "analyticsAssetPropertyProviderForLibraryAsset:fromSourceView:inCollection:", v11, v10, v9));

  return v13;
}

- (id)libraryBookshelfInfoCell:(id)a3 menuWithLibraryAsset:(id)a4 sourceView:(id)a5 collection:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell actionHandler](self, "actionHandler"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "menuWithLibraryAsset:sourceView:collection:", v11, v10, v9));

  return v13;
}

- (void)libraryBookshelfInfoCellDidSelectCancelDownload:(id)a3 sourceView:(id)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell actionHandler](self, "actionHandler", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell libraryAsset](self, "libraryAsset"));
  objc_msgSend(v6, "bookCancelDownload:", v5);

}

- (void)libraryBookshelfInfoCellDidSelectResumeDownload:(id)a3 sourceView:(id)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell actionHandler](self, "actionHandler", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell libraryAsset](self, "libraryAsset"));
  objc_msgSend(v6, "bookResumeDownload:", v5);

}

- (BOOL)shouldDragWithTouch:(id)a3
{
  return 1;
}

- (void)setupMenuWithLibraryAsset:(id)a3 withActionHandler:(id)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell infoCell](self, "infoCell", a3, a4));
  objc_msgSend(v4, "setupMenu");

}

- (void)togglePlayPause:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell audiobookStatus](self, "audiobookStatus", a3));
  objc_msgSend(v3, "assetAudiobookStatusTogglePlayPause");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  return 1;
}

- (int64_t)accessibilityElementCount
{
  return 0;
}

- (id)accessibilityElements
{
  return 0;
}

- (id)accessibilityLabel
{
  NSMutableArray *v3;
  NSMutableArray *v4;
  NSMutableArray *v5;
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
  void *v20;
  void *v21;
  int v22;
  void *v23;
  unsigned int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  float v45;
  float v46;
  uint64_t v47;
  void *v48;
  unsigned int v49;
  void *v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  unsigned int v61;
  void *v62;
  unsigned int v63;
  void *v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  NSMutableArray *v86;
  void *v87;
  uint64_t v89;
  NSMutableArray *v90;
  NSMutableArray *v91;
  void *v92;
  unsigned int v93;

  v3 = objc_opt_new(NSMutableArray);
  v4 = objc_opt_new(NSMutableArray);
  v5 = objc_opt_new(NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell libraryAsset](self, "libraryAsset"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell formattedPrice](self, "formattedPrice"));
  if ((objc_msgSend(v6, "isDownloading") & 1) != 0)
  {
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Downloading"), &stru_10091C438, 0));
    -[NSMutableArray addObject:](v3, "addObject:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryAssetStatusController sharedController](BKLibraryAssetStatusController, "sharedController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "permanentOrTemporaryAssetID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "statusForAssetID:", v12));

    if (objc_msgSend(v13, "state") == (id)4 && (uint64_t)objc_msgSend(v13, "timeRemaining") >= 1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("%@ remaining"), &stru_10091C438, 0));

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryBookshelfGridBookCell bkaxDownloadAndAudiobookProgressFormatter](BKLibraryBookshelfGridBookCell, "bkaxDownloadAndAudiobookProgressFormatter"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringFromTimeInterval:", (double)(uint64_t)objc_msgSend(v13, "timeRemaining")));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v17));
      -[NSMutableArray addObject:](v3, "addObject:", v18);

    }
    v93 = 0;
    v7 = v8;
    goto LABEL_64;
  }
  if (objc_msgSend(v6, "isAudiobook"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetID"));
    if (v19 && objc_msgSend(v6, "isOwned"))
      v93 = objc_msgSend(v6, "isNew");
    else
      v93 = 0;
    goto LABEL_15;
  }
  if (objc_msgSend(v6, "isOwned") && objc_msgSend(v6, "isNew"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "readingProgress"));
    v93 = v19 == 0;
LABEL_15:

    goto LABEL_16;
  }
  v93 = 0;
LABEL_16:
  if ((objc_msgSend(v6, "isSample") & 1) != 0
    || (objc_msgSend(v6, "isOwned") & 1) == 0 && objc_msgSend(v6, "isInSamples"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Sample"), &stru_10091C438, 0));
    -[NSMutableArray addObject:](v3, "addObject:", v21);

    v22 = 1;
  }
  else
  {
    v22 = 0;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell asset](self, "asset"));
  v24 = objc_msgSend(v23, "isPreorder");

  if (v24)
  {
    if (objc_msgSend(v6, "isPreorderBook"))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Preordered"), &stru_10091C438, 0));
    }
    else
    {
      if (!v7)
      {
LABEL_30:
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell asset](self, "asset"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "expectedReleaseDate"));

        if (!v30)
          goto LABEL_41;
        v91 = v4;
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v89 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("Expected %@"), &stru_10091C438, 0));

        v32 = objc_alloc_init((Class)NSDateFormatter);
        objc_msgSend(v32, "setDateStyle:", 3);
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneForSecondsFromGMT:](NSTimeZone, "timeZoneForSecondsFromGMT:", 0));
        objc_msgSend(v32, "setTimeZone:", v33);

        v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell asset](self, "asset"));
        v90 = v5;
        v35 = v7;
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "expectedReleaseDate"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "stringFromDate:", v36));
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v89, v37));
        -[NSMutableArray addObject:](v3, "addObject:", v38);

        v39 = (void *)v89;
        v7 = v35;
        v5 = v90;
        goto LABEL_39;
      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Preorder for %@"), &stru_10091C438, 0));

      v26 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v25, v7));
    }
    v28 = (void *)v26;
    -[NSMutableArray addObject:](v3, "addObject:", v26);

    goto LABEL_30;
  }
  if ((objc_msgSend(v6, "isStoreItem") & 1) == 0)
  {
    if (((v22 | objc_msgSend(v6, "isSeriesItem") ^ 1) & 1) != 0)
      goto LABEL_41;
    goto LABEL_33;
  }
  if ((v22 & 1) == 0)
  {
LABEL_33:
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell asset](self, "asset"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "price"));

    v41 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v39, v41) & 1) != 0
      && (v42 = objc_opt_class(NSNumber),
          v43 = BUDynamicCast(v42, v39),
          v44 = (void *)objc_claimAutoreleasedReturnValue(v43),
          objc_msgSend(v44, "floatValue"),
          v46 = v45,
          v44,
          v46 == 0.0))
    {
      v91 = v4;
      v32 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("Free download"), &stru_10091C438, 0));
    }
    else
    {
      if (!v7)
      {
LABEL_40:

        goto LABEL_41;
      }
      v91 = v4;
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v32 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("Buy for %@"), &stru_10091C438, 0));

      v47 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v32, v7));
    }
    v34 = (void *)v47;
    -[NSMutableArray addObject:](v3, "addObject:", v47);
LABEL_39:

    v4 = v91;
    goto LABEL_40;
  }
LABEL_41:
  if (objc_msgSend(v6, "isFinished"))
  {
    v49 = objc_msgSend(v6, "isAudiobook");
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v51 = v50;
    if (v49)
      v52 = CFSTR("Finished");
    else
      v52 = CFSTR("Finished book");
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "localizedStringForKey:value:table:", v52, &stru_10091C438, 0));
    -[NSMutableArray addObject:](v4, "addObject:", v55);
    goto LABEL_52;
  }
  if (objc_msgSend(v6, "isOwned"))
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("%@ finished"), &stru_10091C438, 0));

    if (objc_msgSend(v6, "isAudiobook"))
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell infoCell](self, "infoCell"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "bkaxAudiobookReadPercentage"));

      if (!v55)
        goto LABEL_52;
    }
    else
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "readingProgress"));
      if (!v55)
      {
LABEL_52:

        goto LABEL_53;
      }
    }
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString bc_formattedReadingProgress:isFinished:](NSString, "bc_formattedReadingProgress:isFinished:", v55, objc_msgSend(v6, "isFinished")));
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v51, v56));
    -[NSMutableArray addObject:](v4, "addObject:", v57);

    goto LABEL_52;
  }
LABEL_53:
  if (objc_msgSend(v6, "isOwned") && objc_msgSend(v6, "isCloud"))
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "localizedStringForKey:value:table:", CFSTR("In iCloud"), &stru_10091C438, 0));
    -[NSMutableArray addObject:](v4, "addObject:", v59);

  }
  if (objc_msgSend(v6, "isAudiobook"))
  {
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell infoCell](self, "infoCell"));
    v61 = objc_msgSend(v60, "showsPlaybackProgress");

    if (v61)
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell audiobookStatus](self, "audiobookStatus"));
      v63 = objc_msgSend(v62, "assetAudiobookStatusIsPlaying");

      v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v65 = v64;
      if (v63)
        v66 = CFSTR("Playing");
      else
        v66 = CFSTR("Paused");
      v92 = v7;
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "localizedStringForKey:value:table:", v66, &stru_10091C438, 0));
      -[NSMutableArray addObject:](v4, "addObject:", v67);

      v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "localizedStringForKey:value:table:", CFSTR("%@ remaining in chapter"), &stru_10091C438, 0));

      v70 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryBookshelfGridBookCell bkaxDownloadAndAudiobookProgressFormatter](BKLibraryBookshelfGridBookCell, "bkaxDownloadAndAudiobookProgressFormatter"));
      v71 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell audiobookStatus](self, "audiobookStatus"));
      objc_msgSend(v71, "assetAudiobookStatusTrackTimeRemaining");
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "stringFromTimeInterval:"));
      v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v69, v72));
      -[NSMutableArray addObject:](v4, "addObject:", v73);

      v7 = v92;
    }
  }
  if (-[BKLibraryBookshelfGridBookCell showSeriesSequenceLabel](self, "showSeriesSequenceLabel"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sequenceDisplayName"));
    -[NSMutableArray addObject:](v5, "addObject:", v13);
LABEL_64:

  }
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  v75 = objc_msgSend(v74, "length");

  if (v75)
  {
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
    -[NSMutableArray addObject:](v5, "addObject:", v76);

  }
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayAuthor"));
  v78 = objc_msgSend(v77, "length");

  if (v78)
  {
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayAuthor"));
    -[NSMutableArray addObject:](v5, "addObject:", v79);

  }
  if ((objc_msgSend(v6, "isContainer") & 1) == 0 && objc_msgSend(v6, "isAudiobook"))
  {
    v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "localizedStringForKey:value:table:", CFSTR("Audiobook"), &stru_10091C438, 0));
    -[NSMutableArray addObject:](v4, "addObject:", v81);

  }
  if (objc_msgSend(v6, "isContainer"))
  {
    v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "localizedStringForKey:value:table:", CFSTR("Series"), &stru_10091C438, 0));
    -[NSMutableArray addObject:](v4, "addObject:", v83);

  }
  if (v93)
  {
    v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "localizedStringForKey:value:table:", CFSTR("New"), &stru_10091C438, 0));
    -[NSMutableArray insertObject:atIndex:](v3, "insertObject:atIndex:", v85, 0);

  }
  v86 = objc_opt_new(NSMutableArray);
  -[NSMutableArray addObjectsFromArray:](v86, "addObjectsFromArray:", v3);
  -[NSMutableArray addObjectsFromArray:](v86, "addObjectsFromArray:", v5);
  -[NSMutableArray addObjectsFromArray:](v86, "addObjectsFromArray:", v4);
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v86, "componentsJoinedByString:", CFSTR(", ")));

  return v87;
}

- (id)accessibilityUserInputLabels
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell libraryAsset](self, "libraryAsset"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));

  if (objc_msgSend(v5, "length"))
    objc_msgSend(v3, "addObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell accessibilityLabel](self, "accessibilityLabel"));
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v3, "addObject:", v6);

  return v3;
}

- (id)accessibilityHint
{
  void *v3;
  unsigned __int8 v4;
  id v6;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell libraryAsset](self, "libraryAsset"));
  v4 = objc_msgSend(v3, "isDownloading");

  if ((v4 & 1) != 0)
    return 0;
  v7.receiver = self;
  v7.super_class = (Class)BKLibraryBookshelfGridBookCell;
  v6 = -[BKLibraryBookshelfGridBookCell accessibilityHint](&v7, "accessibilityHint");
  return (id)objc_claimAutoreleasedReturnValue(v6);
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  unsigned int v5;
  UIAccessibilityTraits v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKLibraryBookshelfGridBookCell;
  v3 = -[BKLibraryBookshelfGridBookCell accessibilityTraits](&v8, "accessibilityTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell libraryAsset](self, "libraryAsset"));
  v5 = objc_msgSend(v4, "isDownloading");

  v6 = UIAccessibilityTraitButton;
  if (v5)
    v6 = 0;
  return v6 | v3 | UIAccessibilityTraitUpdatesFrequently;
}

- (id)accessibilityCustomActions
{
  NSMutableArray *v3;
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;

  v3 = objc_opt_new(NSMutableArray);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell infoCell](self, "infoCell"));
  if (objc_msgSend(v4, "_accessibilityViewIsVisible"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell infoCell](self, "infoCell"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "moreButton"));
    v7 = objc_msgSend(v6, "_accessibilityViewIsVisible");

    if (!v7)
      goto LABEL_5;
    v8 = objc_alloc((Class)UIAccessibilityCustomAction);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Show Actions Popover"), &stru_10091C438, 0));
    v4 = objc_msgSend(v8, "initWithName:target:selector:", v10, self, "_accessibilityDidTriggerShowMenuAction");

    -[NSMutableArray addObject:](v3, "addObject:", v4);
  }

LABEL_5:
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell libraryAsset](self, "libraryAsset"));
  if (!objc_msgSend(v11, "isAudiobook"))
  {
LABEL_14:

    goto LABEL_15;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell infoCell](self, "infoCell"));
  v13 = objc_msgSend(v12, "showsPlaybackProgress");

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell audiobookStatus](self, "audiobookStatus"));
    v15 = objc_msgSend(v14, "assetAudiobookStatusIsPlaying");

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = v16;
    if (v15)
      v18 = CFSTR("Pause");
    else
      v18 = CFSTR("Play");
    if (v15)
      v19 = CFSTR("pause.fill");
    else
      v19 = CFSTR("play.fill");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", v18, &stru_10091C438, 0));

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 30.0));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v19, v20));

    v22 = objc_msgSend(objc_alloc((Class)UIAccessibilityCustomAction), "initWithName:image:target:selector:", v11, v21, self, "_accessibilityDidTriggerPlayPauseAction");
    -[NSMutableArray addObject:](v3, "addObject:", v22);

    goto LABEL_14;
  }
LABEL_15:
  v23 = -[NSMutableArray copy](v3, "copy");

  return v23;
}

- (BOOL)_accessibilityDidTriggerShowMenuAction
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell infoCell](self, "infoCell"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "moreButton"));
  objc_msgSend(v3, "sendActionsForControlEvents:", 64);

  return 1;
}

- (BOOL)_accessibilityDidTriggerPlayPauseAction
{
  -[BKLibraryBookshelfGridBookCell togglePlayPause:](self, "togglePlayPause:", 0);
  return 1;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  objc_super v9;

  if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCell delegate](self, "delegate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathForCell:", self));

    if (v4)
    {
      v5 = -[BKLibraryBookshelfGridBookCell isSelected](self, "isSelected");
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCell delegate](self, "delegate"));
      v7 = v6;
      if (v5)
        objc_msgSend(v6, "selectItemAtIndexPath:animated:scrollPosition:", v4, 1, 0);
      else
        objc_msgSend(v6, "deselectItemAtIndexPath:animated:", v4, 1);

    }
    return 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)BKLibraryBookshelfGridBookCell;
    return -[BKLibraryBookshelfGridBookCell accessibilityActivate](&v9, "accessibilityActivate");
  }
}

+ (NSDateComponentsFormatter)bkaxDownloadAndAudiobookProgressFormatter
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)qword_1009F4FD8;
  if (!qword_1009F4FD8)
  {
    v3 = objc_alloc_init((Class)NSDateComponentsFormatter);
    objc_msgSend(v3, "setZeroFormattingBehavior:", 14);
    objc_msgSend(v3, "setAllowedUnits:", 224);
    objc_msgSend(v3, "setUnitsStyle:", 4);
    v4 = (void *)qword_1009F4FD8;
    qword_1009F4FD8 = (uint64_t)v3;

    v2 = (void *)qword_1009F4FD8;
  }
  return (NSDateComponentsFormatter *)v2;
}

- (void)setCoverView:(id)a3
{
  objc_storeStrong((id *)&self->_coverView, a3);
}

- (BKLibraryAsset)libraryAsset
{
  return self->_libraryAsset;
}

- (BKLibraryBookshelfSupplementaryDataSource)dataSource
{
  return (BKLibraryBookshelfSupplementaryDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (BKLibraryBookshelfCellMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (BKLibraryBookshelfColumnMetrics)columnMetrics
{
  return self->_columnMetrics;
}

- (void)setColumnMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_columnMetrics, a3);
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_indexPath, a3);
}

- (BKLibraryBookshelfStorageProvider)storageProvider
{
  return (BKLibraryBookshelfStorageProvider *)objc_loadWeakRetained((id *)&self->_storageProvider);
}

- (void)setStorageProvider:(id)a3
{
  objc_storeWeak((id *)&self->_storageProvider, a3);
}

- (BKLibraryBookshelfLayoutManager)layoutManager
{
  return (BKLibraryBookshelfLayoutManager *)objc_loadWeakRetained((id *)&self->_layoutManager);
}

- (void)setLayoutManager:(id)a3
{
  objc_storeWeak((id *)&self->_layoutManager, a3);
}

- (BKLibraryActionHandler)actionHandler
{
  return (BKLibraryActionHandler *)objc_loadWeakRetained((id *)&self->_actionHandler);
}

- (void)setActionHandler:(id)a3
{
  objc_storeWeak((id *)&self->_actionHandler, a3);
}

- (AEAssetAudiobookStatus)audiobookStatus
{
  return self->_audiobookStatus;
}

- (BOOL)hasSeriesSequenceLabel
{
  return self->_hasSeriesSequenceLabel;
}

- (void)setHasSeriesSequenceLabel:(BOOL)a3
{
  self->_hasSeriesSequenceLabel = a3;
}

- (BKLibraryBookshelfInfoCell)infoCell
{
  return self->_infoCell;
}

- (void)setInfoCell:(id)a3
{
  objc_storeStrong((id *)&self->_infoCell, a3);
}

- (BOOL)hideSelectIndicator
{
  return self->_hideSelectIndicator;
}

- (void)setHideSelectIndicator:(BOOL)a3
{
  self->_hideSelectIndicator = a3;
}

- (BOOL)pendingTouchUp
{
  return self->_pendingTouchUp;
}

- (void)setPendingTouchUp:(BOOL)a3
{
  self->_pendingTouchUp = a3;
}

- (BOOL)pendingAnimationCompletion
{
  return self->_pendingAnimationCompletion;
}

- (void)setPendingAnimationCompletion:(BOOL)a3
{
  self->_pendingAnimationCompletion = a3;
}

- (BOOL)wantsAnimatedLayoutChange
{
  return self->_wantsAnimatedLayoutChange;
}

- (void)setWantsAnimatedLayoutChange:(BOOL)a3
{
  self->_wantsAnimatedLayoutChange = a3;
}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_progressView, a3);
}

- (NSString)formattedPrice
{
  return self->_formattedPrice;
}

- (void)setFormattedPrice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (int)layoutDebugMode
{
  return self->_layoutDebugMode;
}

- (void)setLayoutDebugMode:(int)a3
{
  self->_layoutDebugMode = a3;
}

- (UIImageView)selectIndicatorView
{
  return self->_selectIndicatorView;
}

- (void)setSelectIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_selectIndicatorView, a3);
}

- (UILabel)seriesSequenceLabel
{
  return self->_seriesSequenceLabel;
}

- (void)setSeriesSequenceLabel:(id)a3
{
  objc_storeStrong((id *)&self->_seriesSequenceLabel, a3);
}

- (BOOL)hideInfoBar
{
  return self->_hideInfoBar;
}

- (void)setHideInfoBar:(BOOL)a3
{
  self->_hideInfoBar = a3;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (UILabel)supplementalContentPdfTitleLabel
{
  return self->_supplementalContentPdfTitleLabel;
}

- (void)setSupplementalContentPdfTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_supplementalContentPdfTitleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementalContentPdfTitleLabel, 0);
  objc_storeStrong((id *)&self->_seriesSequenceLabel, 0);
  objc_storeStrong((id *)&self->_selectIndicatorView, 0);
  objc_storeStrong((id *)&self->_formattedPrice, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_infoCell, 0);
  objc_storeStrong((id *)&self->_audiobookStatus, 0);
  objc_destroyWeak((id *)&self->_actionHandler);
  objc_destroyWeak((id *)&self->_layoutManager);
  objc_destroyWeak((id *)&self->_storageProvider);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_columnMetrics, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_libraryAsset, 0);
  objc_storeStrong((id *)&self->_coverView, 0);
}

@end
