@implementation ICImagesAndMoviesBaseCell

- (ICImagesAndMoviesBaseCell)initWithThumbnailView:(id)a3 frame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  ICImagesAndMoviesBaseCell *v10;
  ICImagesAndMoviesBaseCell *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  objc_super v20;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ICImagesAndMoviesBaseCell;
  v10 = -[ICImagesAndMoviesBaseCell initWithFrame:](&v20, "initWithFrame:", x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[ICImagesAndMoviesBaseCell setThumbnailView:](v10, "setThumbnailView:", v9);
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9, "setClipsToBounds:", 1);
    if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layer"));
      objc_msgSend(v12, "setCornerRadius:", 16.0);
    }
    else
    {
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor")));
      v14 = objc_msgSend(v13, "CGColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layer"));
      objc_msgSend(v15, "setBorderColor:", v14);

      -[ICImagesAndMoviesBaseCell ic_hairlineWidth](v11, "ic_hairlineWidth");
      v17 = v16;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layer"));
      objc_msgSend(v12, "setBorderWidth:", v17);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesBaseCell thumbnailView](v11, "thumbnailView"));
    -[ICImagesAndMoviesBaseCell addSubview:](v11, "addSubview:", v18);

    -[ICImagesAndMoviesBaseCell needsUpdateConstraints](v11, "needsUpdateConstraints");
  }

  return v11;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));
    objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, CFSTR("sizeWidth"), &off_1005CD440);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));
    objc_msgSend(v5, "ic_removeObserver:forKeyPath:context:", self, CFSTR("sizeHeight"), &off_1005CD440);

  }
  v6.receiver = self;
  v6.super_class = (Class)ICImagesAndMoviesBaseCell;
  -[ICBrowseAttachmentsBaseCell dealloc](&v6, "dealloc");
}

- (void)didMoveToWindow
{
  double v3;
  double v4;
  void *v5;
  id v6;

  if ((+[UIDevice ic_isVision](UIDevice, "ic_isVision") & 1) == 0)
  {
    -[ICImagesAndMoviesBaseCell ic_hairlineWidth](self, "ic_hairlineWidth");
    v4 = v3;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesBaseCell thumbnailView](self, "thumbnailView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
    objc_msgSend(v5, "setBorderWidth:", v4);

  }
}

- (void)setThumbnailLayout:(unint64_t)a3
{
  if (self->_thumbnailLayout != a3)
  {
    self->_thumbnailLayout = a3;
    -[ICImagesAndMoviesBaseCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));
    objc_msgSend(v6, "ic_removeObserver:forKeyPath:context:", self, CFSTR("sizeWidth"), &off_1005CD440);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));
    objc_msgSend(v7, "ic_removeObserver:forKeyPath:context:", self, CFSTR("sizeHeight"), &off_1005CD440);

  }
  v11.receiver = self;
  v11.super_class = (Class)ICImagesAndMoviesBaseCell;
  -[ICBrowseAttachmentsBaseCell setAttachment:](&v11, "setAttachment:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));
    objc_msgSend(v9, "ic_addObserver:forKeyPath:context:", self, CFSTR("sizeWidth"), &off_1005CD440);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));
    objc_msgSend(v10, "ic_addObserver:forKeyPath:context:", self, CFSTR("sizeHeight"), &off_1005CD440);

  }
  -[ICImagesAndMoviesBaseCell updateAspectRatio](self, "updateAspectRatio");
  -[ICImagesAndMoviesBaseCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

- (void)updateAspectRatio
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));
  objc_msgSend(v3, "sizeWidth");
  v4 = 1.0;
  if (v5 <= 0.0)
    goto LABEL_4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));
  objc_msgSend(v6, "sizeHeight");
  v8 = v7;

  if (v8 > 0.0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));
    objc_msgSend(v3, "sizeWidth");
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));
    objc_msgSend(v11, "sizeHeight");
    v4 = v10 / v12;

LABEL_4:
  }
  -[ICImagesAndMoviesBaseCell setAspectRatio:](self, "setAspectRatio:", v4);
}

- (void)setAspectRatio:(double)a3
{
  if (self->_aspectRatio != a3)
  {
    self->_aspectRatio = a3;
    if (-[ICImagesAndMoviesBaseCell thumbnailLayout](self, "thumbnailLayout"))
      -[ICImagesAndMoviesBaseCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  double v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;
  const __CFString *v25;
  void *v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesBaseCell ourConstraints](self, "ourConstraints"));
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 4));
  if (-[ICImagesAndMoviesBaseCell computedThumbnailLayout](self, "computedThumbnailLayout"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesBaseCell thumbnailView](self, "thumbnailView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 9, 0, self, 9, 1.0, 0.0));
    objc_msgSend(v4, "addObject:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesBaseCell thumbnailView](self, "thumbnailView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 10, 0, self, 10, 1.0, 0.0));
    objc_msgSend(v4, "addObject:", v8);

    v9 = -[ICImagesAndMoviesBaseCell computedThumbnailLayout](self, "computedThumbnailLayout");
    -[ICImagesAndMoviesBaseCell aspectRatio](self, "aspectRatio");
    if (v9 == 1)
      v11 = v10 > 1.0;
    else
      v11 = v10 < 1.0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesBaseCell thumbnailView](self, "thumbnailView"));
    if (v11)
      v13 = 8;
    else
      v13 = 7;
    if (v11)
      v14 = 7;
    else
      v14 = 8;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, v13, 0, self, v13, 1.0, 0.0));
    objc_msgSend(v4, "addObject:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesBaseCell thumbnailView](self, "thumbnailView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v16, v14, -1, self, v14, 1.0, 0.0));
    objc_msgSend(v4, "addObject:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesBaseCell thumbnailView](self, "thumbnailView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesBaseCell thumbnailView](self, "thumbnailView"));
    -[ICImagesAndMoviesBaseCell aspectRatio](self, "aspectRatio");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint ic_constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:](NSLayoutConstraint, "ic_constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:", v18, 7, 0, v19, 8));
    objc_msgSend(v4, "addObject:", v20);

  }
  else
  {
    v25 = CFSTR("thumbnailView");
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesBaseCell thumbnailView](self, "thumbnailView"));
    v26 = v21;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[thumbnailView]|"), 0, 0, v18));
    objc_msgSend(v4, "addObjectsFromArray:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[thumbnailView]|"), 0, 0, v18));
    objc_msgSend(v4, "addObjectsFromArray:", v23);

  }
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v4);
  -[ICImagesAndMoviesBaseCell setOurConstraints:](self, "setOurConstraints:", v4);
  v24.receiver = self;
  v24.super_class = (Class)ICImagesAndMoviesBaseCell;
  -[ICImagesAndMoviesBaseCell updateConstraints](&v24, "updateConstraints");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  unsigned __int8 v13;
  objc_super v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  if ((-[ICImagesAndMoviesBaseCell ic_didAddObserverForContext:inScope:](self, "ic_didAddObserverForContext:inScope:", a6, "/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/iOS/Attachment Browser/ImageScroller/ICImagesAndMoviesBaseCell.m") & 1) != 0)
  {
    v13 = -[ICImagesAndMoviesBaseCell ic_shouldIgnoreObserveValue:ofObject:forKeyPath:](self, "ic_shouldIgnoreObserveValue:ofObject:forKeyPath:", v10, v11, v12);

    if (a6 == &off_1005CD440 && (v13 & 1) == 0)
      -[ICImagesAndMoviesBaseCell updateAspectRatio](self, "updateAspectRatio");
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICImagesAndMoviesBaseCell;
    -[ICImagesAndMoviesBaseCell observeValueForKeyPath:ofObject:change:context:](&v14, "observeValueForKeyPath:ofObject:change:context:", v12, v11, v10, a6);

  }
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;

  v4 = a3;
  if ((id)-[ICImagesAndMoviesBaseCell thumbnailLayout](self, "thumbnailLayout") == (id)1)
  {
    objc_msgSend(v4, "size");
    v6 = v5;
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;

    if (v11 <= 0.0 || v13 <= 0.0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesBaseCell window](self, "window"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "screen"));
      objc_msgSend(v16, "scale");
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "attachmentPreviewImageWithMinSize:scale:", v6, v8, v17));

      objc_msgSend(v18, "width");
      v11 = v19;
      objc_msgSend(v18, "height");
      v13 = v20;

    }
    if (v11 > 0.0 && v13 > 0.0)
    {
      v6 = v8 * v11 / v13;
      if (v6 > v8 + v8)
        v6 = v8 + v8;
    }
    objc_msgSend(v4, "size");
    if (v21 != v6)
      objc_msgSend(v4, "setSize:", v6, v8);
  }
  return v4;
}

- (id)collectionView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesBaseCell scrollView](self, "scrollView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "collectionView"));

  return v3;
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (UIView)thumbnailView
{
  return self->_thumbnailView;
}

- (void)setThumbnailView:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailView, a3);
}

- (unint64_t)thumbnailLayout
{
  return self->_thumbnailLayout;
}

- (ICImagesAndMoviesScrollView)scrollView
{
  return (ICImagesAndMoviesScrollView *)objc_loadWeakRetained((id *)&self->_scrollView);
}

- (void)setScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_scrollView, a3);
}

- (NSArray)ourConstraints
{
  return self->_ourConstraints;
}

- (void)setOurConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ourConstraints, 0);
  objc_destroyWeak((id *)&self->_scrollView);
  objc_storeStrong((id *)&self->_thumbnailView, 0);
}

@end
