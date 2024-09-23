@implementation PXPeopleScalableAvatarView

- (PXPeopleScalableAvatarView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PXPeopleScalableAvatarView *v7;
  uint64_t v8;
  UIImageView *imageView;
  void *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)PXPeopleScalableAvatarView;
  v7 = -[PXPeopleScalableAvatarView initWithFrame:](&v12, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", x, y, width, height);
    imageView = v7->_imageView;
    v7->_imageView = (UIImageView *)v8;

    -[UIImageView setAccessibilityIgnoresInvertColors:](v7->_imageView, "setAccessibilityIgnoresInvertColors:", 1);
    v7->_cornerStyle = +[PXPeopleFaceCropFetchOptions recommendedCornerStyleForCurrentAppConfiguration](PXPeopleFaceCropFetchOptions, "recommendedCornerStyleForCurrentAppConfiguration");
    -[UIImageView layer](v7->_imageView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMasksToBounds:", 1);

    -[PXPeopleScalableAvatarView addSubview:](v7, "addSubview:", v7->_imageView);
  }
  return v7;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v11;
  double v12;
  objc_super v14;
  CGRect v15;
  CGRect v16;

  v14.receiver = self;
  v14.super_class = (Class)PXPeopleScalableAvatarView;
  -[PXPeopleScalableAvatarView layoutSubviews](&v14, sel_layoutSubviews);
  -[PXPeopleScalableAvatarView imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleScalableAvatarView bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");
  -[PXPeopleScalableAvatarView imageViewCornerRadius](self, "imageViewCornerRadius");
  v5 = v4;
  objc_msgSend(v3, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerRadius:", v5);

  -[PXPeopleScalableAvatarView bounds](self, "bounds");
  x = v15.origin.x;
  y = v15.origin.y;
  width = v15.size.width;
  height = v15.size.height;
  v11 = vabdd_f64(CGRectGetHeight(v15), self->_imagePixelSize.height);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  v12 = vabdd_f64(CGRectGetWidth(v16), self->_imagePixelSize.width);
  if (v11 > 5.0 || v12 > 5.0)
    -[PXPeopleScalableAvatarView updateImage](self, "updateImage", v12);

}

- (void)setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
  -[PXPeopleScalableAvatarView updateImage](self, "updateImage");
}

- (void)setFace:(id)a3
{
  objc_storeStrong((id *)&self->_face, a3);
  -[PXPeopleScalableAvatarView updateImage](self, "updateImage");
}

- (void)setCornerStyle:(int64_t)a3
{
  if (self->_cornerStyle != a3)
  {
    self->_cornerStyle = a3;
    -[PXPeopleScalableAvatarView updateImage](self, "updateImage");
  }
}

- (void)setImageViewCornerRadius:(double)a3
{
  if (self->_imageViewCornerRadius != a3)
  {
    self->_imageViewCornerRadius = a3;
    -[PXPeopleScalableAvatarView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPersonAndWaitForImage:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
  -[PXPeopleScalableAvatarView _updateImageAndWait:](self, "_updateImageAndWait:", 1);
}

- (void)updateImage
{
  -[PXPeopleScalableAvatarView _updateImageAndWait:](self, "_updateImageAndWait:", 0);
}

- (void)_updateImageAndWait:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  int64_t v16;
  double v17;
  PXPeopleFaceCropFetchOptions *v18;
  PXPeopleFaceCropFetchOptions *v19;
  PXPeopleFaceCropFetchOptions *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  CGRect v25;
  CGRect v26;

  -[PXPeopleScalableAvatarView person](self, "person", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  -[PXPeopleScalableAvatarView face](self, "face");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v4 | v5)
  {
    -[PXPeopleScalableAvatarView bounds](self, "bounds");
    x = v25.origin.x;
    y = v25.origin.y;
    width = v25.size.width;
    height = v25.size.height;
    v10 = CGRectGetWidth(v25);
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    v11 = CGRectGetHeight(v26);
    -[PXSmartScaleView displayScale](self, "displayScale");
    v13 = v12;
    v14 = v10 - v11;
    if (v10 - v11 < 0.0)
      v14 = -(v10 - v11);
    if (v14 >= 2.0)
    {
      -[PXPeopleScalableAvatarView imageView](self, "imageView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setContentMode:", 2);

    }
    else
    {
      if (v10 >= v11)
        v10 = v11;
      v11 = v10;
      height = v10;
      width = v10;
    }
    self->_imagePixelSize.width = v10;
    self->_imagePixelSize.height = v11;
    v16 = -[PXPeopleScalableAvatarView cornerStyle](self, "cornerStyle");
    if (v16 == 1)
    {
      +[PXPeopleFaceCropManager roundedCornerRadiusForTargetSize:displayScale:](PXPeopleFaceCropManager, "roundedCornerRadiusForTargetSize:displayScale:", width, height, v13);
    }
    else
    {
      v17 = 0.0;
      if (v16 == 2)
      {
        v17 = width * 0.5;
        if (width * 0.5 < 0.0)
          v17 = 0.0;
      }
    }
    -[PXPeopleScalableAvatarView setImageViewCornerRadius:](self, "setImageViewCornerRadius:", v17);
    if (height > 0.0 && width > 0.0)
    {
      v18 = [PXPeopleFaceCropFetchOptions alloc];
      if (v4)
        v19 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:](v18, "initWithPerson:targetSize:displayScale:", v4, width, height, v13);
      else
        v19 = -[PXPeopleFaceCropFetchOptions initWithFace:targetSize:displayScale:](v18, "initWithFace:targetSize:displayScale:", v5, width, height, v13);
      v20 = v19;
      -[PXPeopleFaceCropFetchOptions setUseLowMemoryMode:](v19, "setUseLowMemoryMode:", -[PXPeopleScalableAvatarView useLowMemoryMode](self, "useLowMemoryMode"));
      -[PXPeopleFaceCropFetchOptions setCornerStyle:](v20, "setCornerStyle:", -[PXPeopleScalableAvatarView cornerStyle](self, "cornerStyle"));
      +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __50__PXPeopleScalableAvatarView__updateImageAndWait___block_invoke;
      v22[3] = &unk_1E51356B8;
      v22[4] = self;
      v23 = (id)v4;
      v24 = (id)v5;
      objc_msgSend(v21, "requestFaceCropForOptions:resultHandler:", v20, v22);

    }
  }

}

- (UIImageView)imageView
{
  return (UIImageView *)objc_getProperty(self, a2, 456, 1);
}

- (void)setImageView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 456);
}

- (PXPerson)person
{
  return self->_person;
}

- (PHFace)face
{
  return self->_face;
}

- (int64_t)cornerStyle
{
  return self->_cornerStyle;
}

- (BOOL)useLowMemoryMode
{
  return self->_useLowMemoryMode;
}

- (void)setUseLowMemoryMode:(BOOL)a3
{
  self->_useLowMemoryMode = a3;
}

- (double)imageViewCornerRadius
{
  return self->_imageViewCornerRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_face, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

void __50__PXPeopleScalableAvatarView__updateImageAndWait___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PXPeopleContentsRectKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "CGRectValue");
  v11 = MEMORY[0x1E0C809B0];
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v14 = *(id *)(a1 + 48);
  v15 = v5;
  v8 = v5;
  px_dispatch_on_main_queue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PXPeopleErrorKey"), v11, 3221225472, __50__PXPeopleScalableAvatarView__updateImageAndWait___block_invoke_2, &unk_1E511E8A0, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    PLUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v9;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "PXPeopleScalableAvatarView: error requesting face crop: %@", buf, 0xCu);
    }

  }
}

void __50__PXPeopleScalableAvatarView__updateImageAndWait___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "person");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 != *(void **)(a1 + 40))
    goto LABEL_2;
  v10 = v2;
  objc_msgSend(*(id *)(a1 + 32), "face");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 48);

  if (v3 == v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "imageView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setImage:", *(_QWORD *)(a1 + 56));
    v5 = *(double *)(a1 + 64);
    v6 = *(double *)(a1 + 72);
    v7 = *(double *)(a1 + 80);
    v8 = *(double *)(a1 + 88);
    objc_msgSend(v11, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContentsRect:", v5, v6, v7, v8);

    v2 = v11;
LABEL_2:

  }
}

@end
