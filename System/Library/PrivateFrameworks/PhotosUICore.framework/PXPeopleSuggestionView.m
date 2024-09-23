@implementation PXPeopleSuggestionView

- (void)commonInit
{
  UIView *v3;
  UIView *suggestionView;
  UIImageView *v5;
  UIImageView *imageView;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSDateFormatter *v11;
  NSDateFormatter *dateFormatter;
  void *v13;
  UILabel *v14;
  UILabel *dateLabel;
  void *v16;
  id v17;

  v3 = (UIView *)objc_opt_new();
  suggestionView = self->_suggestionView;
  self->_suggestionView = v3;

  -[PXPeopleSuggestionView addSubview:](self, "addSubview:", self->_suggestionView);
  v5 = (UIImageView *)objc_opt_new();
  imageView = self->_imageView;
  self->_imageView = v5;

  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 1);
  -[UIImageView setClipsToBounds:](self->_imageView, "setClipsToBounds:", 1);
  -[UIImageView setAccessibilityIgnoresInvertColors:](self->_imageView, "setAccessibilityIgnoresInvertColors:", 1);
  -[UIView addSubview:](self->_suggestionView, "addSubview:", self->_imageView);
  v17 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBackgroundColor:", v7);

  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v17, "setAlpha:", 0.0);
  objc_msgSend(v17, "setAccessibilityIgnoresInvertColors:", 1);
  -[PXPeopleSuggestionView setDimView:](self, "setDimView:", v17);
  -[UIView addSubview:](self->_suggestionView, "addSubview:", v17);
  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFillRule:", *MEMORY[0x1E0CD2B70]);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "setFillColor:", objc_msgSend(v9, "CGColor"));

  objc_msgSend(v17, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMask:", v8);

  -[PXPeopleSuggestionView setSpotlightLayer:](self, "setSpotlightLayer:", v8);
  self->_validSpotlight = 0;
  if (PFOSVariantHasInternalUI())
  {
    v11 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    dateFormatter = self->_dateFormatter;
    self->_dateFormatter = v11;

    -[NSDateFormatter setDateFormat:](self->_dateFormatter, "setDateFormat:", CFSTR("MM/dd/yyyy"));
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    -[NSDateFormatter setLocale:](self->_dateFormatter, "setLocale:", v13);

    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    dateLabel = self->_dateLabel;
    self->_dateLabel = v14;

    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_dateLabel, "setTextColor:", v16);

    -[PXPeopleSuggestionView addSubview:](self, "addSubview:", self->_dateLabel);
  }
  -[PXPeopleSuggestionView setClipsToBounds:](self, "setClipsToBounds:", 1);

}

- (PXPeopleSuggestionView)init
{
  PXPeopleSuggestionView *v2;
  PXPeopleSuggestionView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPeopleSuggestionView;
  v2 = -[PXPeopleSuggestionView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PXPeopleSuggestionView commonInit](v2, "commonInit");
  return v3;
}

- (PXPeopleSuggestionView)initWithFrame:(CGRect)a3
{
  PXPeopleSuggestionView *v3;
  PXPeopleSuggestionView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXPeopleSuggestionView;
  v3 = -[PXPeopleSuggestionView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PXPeopleSuggestionView commonInit](v3, "commonInit");
  return v4;
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  double MidX;
  CGFloat MidY;
  float v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v28.receiver = self;
  v28.super_class = (Class)PXPeopleSuggestionView;
  -[PXPeopleSuggestionView layoutSubviews](&v28, sel_layoutSubviews);
  -[PXPeopleSuggestionView bounds](self, "bounds");
  x = v29.origin.x;
  y = v29.origin.y;
  width = v29.size.width;
  height = v29.size.height;
  v7 = CGRectGetWidth(v29);
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  v8 = CGRectGetHeight(v30);
  if (v7 >= v8)
    v9 = v7;
  else
    v9 = v8;
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  MidX = CGRectGetMidX(v31);
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  MidY = CGRectGetMidY(v32);
  v12 = MidX - v9 * 0.5;
  v13 = floorf(v12);
  *(float *)&MidY = MidY - v9 * 0.5;
  v14 = floorf(*(float *)&MidY);
  *(float *)&MidY = v9;
  v15 = floorf(*(float *)&MidY);
  -[PXPeopleSuggestionView suggestionView](self, "suggestionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v13, v14, v15, v15);
  objc_msgSend(v16, "bounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  -[PXPeopleSuggestionView imageView](self, "imageView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

  -[PXPeopleSuggestionView dimView](self, "dimView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFrame:", v18, v20, v22, v24);

  -[PXPeopleSuggestionView spotlightLayer](self, "spotlightLayer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFrame:", v18, v20, v22, v24);

  if (PFOSVariantHasInternalUI())
  {
    v33.origin.x = v18;
    v33.origin.y = v20;
    v33.size.width = v22;
    v33.size.height = v24;
    -[UILabel setFrame:](self->_dateLabel, "setFrame:", CGRectGetMaxX(v33) + -120.0, 0.0, 120.0, 16.0);
  }
  if (-[PXPeopleSuggestionView validSpotlight](self, "validSpotlight"))
    -[PXPeopleSuggestionView _updateSpotlightAnimated:](self, "_updateSpotlightAnimated:", 0);

}

- (void)viewScaleDidChange
{
  if (-[PXPeopleSuggestionView validSpotlight](self, "validSpotlight"))
    -[PXPeopleSuggestionView _updateSuggestionImageWithAnimatedSpotlight:withCompletion:](self, "_updateSuggestionImageWithAnimatedSpotlight:withCompletion:", 1, 0);
}

- (void)setSuggestion:(id)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  void *v6;
  PXPerson *v9;
  void (**v10)(id, uint64_t);
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  PXPersonImageRequest *v23;
  double v24;
  PXPeopleFaceCropFetchOptions *v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  PXPerson *v30;
  PXPeopleFaceCropFetchOptions *v31;
  void *v32;
  PXPersonImageRequest *v33;
  void *v34;
  void (**v35)(id, uint64_t);
  char v36;
  id v37;
  id v38;
  PXPerson *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  PXPeopleSuggestionView *v43;
  void (**v44)(id, uint64_t);
  char v45;
  CGRect v46;

  LODWORD(v6) = a4;
  v9 = (PXPerson *)a3;
  v10 = (void (**)(id, uint64_t))a5;
  if (self->_suggestion == v9)
  {
    if ((_DWORD)v6)
    {
      -[PXPeopleSuggestionView faceRect](self, "faceRect");
      v46.origin.x = v26;
      v46.origin.y = v27;
      v46.size.width = v28;
      v46.size.height = v29;
      if (CGRectEqualToRect(*MEMORY[0x1E0C9D648], v46))
      {
        -[PXPeopleSuggestionView setNeedsSpotlightUpdate:](self, "setNeedsSpotlightUpdate:", 1);
        if (!v10)
          goto LABEL_14;
      }
      else
      {
        -[PXPeopleSuggestionView _updateSpotlightAnimated:](self, "_updateSpotlightAnimated:", 1);
        if (!v10)
          goto LABEL_14;
      }
      v10[2](v10, 1);
    }
  }
  else
  {
    -[PXPeopleSuggestionView imageRequest](self, "imageRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cancel");

    objc_storeStrong((id *)&self->_suggestion, a3);
    -[PXPeopleSuggestionView imageView](self, "imageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(MEMORY[0x1E0DC3890]);
    objc_msgSend(v12, "frame");
    objc_msgSend(v13, "setFrame:");
    objc_msgSend(v13, "setContentMode:", 1);
    objc_msgSend(v13, "setClipsToBounds:", 1);
    objc_msgSend(v13, "setAccessibilityIgnoresInvertColors:", 1);
    objc_msgSend(v13, "setAlpha:", 0.0);
    -[PXPeopleSuggestionView suggestionView](self, "suggestionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleSuggestionView imageView](self, "imageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "insertSubview:aboveSubview:", v13, v15);

    -[PXPeopleSuggestionView setImageView:](self, "setImageView:", v13);
    -[PXPeopleSuggestionView superview](self, "superview");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    v18 = v17;
    v20 = v19;

    if (v18 < v20)
      v20 = v18;
    -[PXSmartScaleView displayScale](self, "displayScale");
    v22 = v21;
    v23 = -[PXPersonImageRequest initWithPerson:]([PXPersonImageRequest alloc], "initWithPerson:", v9);
    -[PXPeopleSuggestionView setImageRequest:](self, "setImageRequest:", v23);
    if (PFOSVariantHasInternalUI())
      -[PXPeopleSuggestionView _updateDateFieldWithSuggestion:](self, "_updateDateFieldWithSuggestion:", v9);
    v24 = v22 * v20;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:]([PXPeopleFaceCropFetchOptions alloc], "initWithPerson:targetSize:displayScale:", v9, v24, v24, v22);
    }
    else
    {
      v30 = v9;
      v31 = [PXPeopleFaceCropFetchOptions alloc];
      -[PXPerson person](v30, "person");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPerson keyFace](v30, "keyFace");
      v39 = v9;
      v33 = v23;
      v34 = v12;
      v35 = v10;
      v36 = (char)v6;
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = -[PXPeopleFaceCropFetchOptions initWithPerson:face:targetSize:displayScale:](v31, "initWithPerson:face:targetSize:displayScale:", v32, v6, v24, v24, v22);
      LOBYTE(v6) = v36;
      v10 = v35;
      v12 = v34;
      v23 = v33;
      v9 = v39;

    }
    -[PXPeopleFaceCropFetchOptions setWantsSmallFaceRect:](v25, "setWantsSmallFaceRect:", 1, v39);
    -[PXPeopleFaceCropFetchOptions setCropFactor:](v25, "setCropFactor:", 1);
    -[PXPeopleFaceCropFetchOptions setCornerStyle:](v25, "setCornerStyle:", 0);
    -[PXPeopleFaceCropFetchOptions setShouldCacheResult:](v25, "setShouldCacheResult:", 0);
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __64__PXPeopleSuggestionView_setSuggestion_animated_withCompletion___block_invoke;
    v40[3] = &unk_1E513E460;
    v41 = v13;
    v42 = v12;
    v43 = self;
    v44 = v10;
    v45 = (char)v6;
    v37 = v12;
    v38 = v13;
    -[PXPersonImageRequest requestFaceCropWithOptions:timeout:resultHandler:](v23, "requestFaceCropWithOptions:timeout:resultHandler:", v25, v40, 1.0);

  }
LABEL_14:

}

- (void)_updateSuggestionImageWithAnimatedSpotlight:(BOOL)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  PXPeopleFaceCropFetchOptions *v17;
  id v18;
  PXPeopleFaceCropFetchOptions *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  PXPeopleSuggestionView *v27;
  id v28;
  id v29;
  BOOL v30;
  id location;

  v6 = a4;
  -[PXPeopleSuggestionView superview](self, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;

  if (v9 < v11)
    v11 = v9;
  -[PXSmartScaleView displayScale](self, "displayScale");
  v13 = v12;
  -[PXPeopleSuggestionView imageView](self, "imageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[PXPeopleSuggestionView suggestion](self, "suggestion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v16 = v13 * v11;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:]([PXPeopleFaceCropFetchOptions alloc], "initWithPerson:targetSize:displayScale:", v15, v16, v16, v13);
  }
  else
  {
    v18 = v15;
    v19 = [PXPeopleFaceCropFetchOptions alloc];
    objc_msgSend(v18, "person");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "keyFace");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PXPeopleFaceCropFetchOptions initWithPerson:face:targetSize:displayScale:](v19, "initWithPerson:face:targetSize:displayScale:", v20, v21, v16, v16, v13);

  }
  -[PXPeopleFaceCropFetchOptions setWantsSmallFaceRect:](v17, "setWantsSmallFaceRect:", 1);
  -[PXPeopleFaceCropFetchOptions setCropFactor:](v17, "setCropFactor:", 1);
  -[PXPeopleFaceCropFetchOptions setCornerStyle:](v17, "setCornerStyle:", 0);
  -[PXPeopleFaceCropFetchOptions setShouldCacheResult:](v17, "setShouldCacheResult:", 0);
  -[PXPeopleSuggestionView imageRequest](self, "imageRequest");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __85__PXPeopleSuggestionView__updateSuggestionImageWithAnimatedSpotlight_withCompletion___block_invoke;
  v25[3] = &unk_1E513E4B0;
  v23 = v6;
  v28 = v23;
  objc_copyWeak(&v29, &location);
  v24 = v14;
  v26 = v24;
  v27 = self;
  v30 = a3;
  objc_msgSend(v22, "requestFaceCropWithOptions:timeout:resultHandler:", v17, v25, 1.0);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

- (void)_updateSpotlightAnimated:(BOOL)a3
{
  _BOOL4 v3;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  double Width;
  double Height;
  double v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  double x;
  double y;
  double v38;
  double v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  _QWORD v52[4];
  id v53;
  id location;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v3 = a3;
  -[PXPeopleSuggestionView faceRect](self, "faceRect");
  v58.origin.x = v5;
  v58.origin.y = v6;
  v58.size.width = v7;
  v58.size.height = v8;
  if (!CGRectEqualToRect(*MEMORY[0x1E0C9D648], v58))
  {
    -[PXPeopleSuggestionView spotlightLayer](self, "spotlightLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[PXPeopleSuggestionView _scaledFaceRect](self, "_scaledFaceRect");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v50 = v13;
    v51 = v11;
    v48 = v17;
    v49 = v15;
    if (!-[PXPeopleSuggestionView validSpotlight](self, "validSpotlight"))
    {
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", v11, v13, v15, v17);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", v11 - v15 * 0.5, v13 - v17 * 0.5, v15 + v15, v17 + v17);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "appendPath:", v27);

      v28 = objc_retainAutorelease(v26);
      objc_msgSend(v9, "setPath:", objc_msgSend(v28, "CGPath"));
      -[PXPeopleSuggestionView dimView](self, "dimView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setAlpha:", 1.0);

    }
    v55.origin.x = v19;
    v55.origin.y = v21;
    v55.size.width = v23;
    v55.size.height = v25;
    Width = CGRectGetWidth(v55);
    v56.origin.x = v19;
    v56.origin.y = v21;
    v56.size.width = v23;
    v56.size.height = v25;
    Height = CGRectGetHeight(v56);
    if (Width >= Height)
      v32 = Width;
    else
      v32 = Height;
    v33 = v19;
    v34 = v21;
    v35 = v32;
    v57 = CGRectIntegral(*(CGRect *)(&v32 - 2));
    x = v57.origin.x;
    y = v57.origin.y;
    v38 = v57.size.width;
    v39 = v57.size.height;
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", v51, v50, v49, v48);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", x, y, v38, v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "appendPath:", v41);

    v42 = objc_retainAutorelease(v40);
    v43 = objc_msgSend(v42, "CGPath");
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("path"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setFromValue:", objc_msgSend(v9, "path"));
    objc_msgSend(v44, "setToValue:", v43);
    v45 = 0.33;
    if (!v3)
      v45 = 0.0;
    objc_msgSend(v44, "setDuration:", v45, *(_QWORD *)&v48, *(_QWORD *)&v49, *(_QWORD *)&v50, *(_QWORD *)&v51);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setTimingFunction:", v46);

    objc_msgSend(v44, "setRemovedOnCompletion:", 0);
    objc_msgSend(v9, "addAnimation:forKey:", v44, CFSTR("path"));
    objc_msgSend(v9, "setPath:", v43);
    objc_initWeak(&location, self);
    v47 = (void *)MEMORY[0x1E0CD28B0];
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __51__PXPeopleSuggestionView__updateSpotlightAnimated___block_invoke;
    v52[3] = &unk_1E5148D30;
    objc_copyWeak(&v53, &location);
    objc_msgSend(v47, "setCompletionBlock:", v52);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    objc_destroyWeak(&v53);
    objc_destroyWeak(&location);

  }
}

- (void)_updateDateFieldWithSuggestion:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  +[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "displayReviewMorePhotosDate");

  if (v10 && v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "px_keyPhotoDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleSuggestionView dateFormatter](self, "dateFormatter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringFromDate:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXPeopleSuggestionView dateLabel](self, "dateLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

  }
  else
  {
    -[PXPeopleSuggestionView dateLabel](self, "dateLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", &stru_1E5149688);
  }

}

- (CGRect)_scaledFaceRect
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
  CGRect result;

  -[PXPeopleSuggestionView _faceScale](self, "_faceScale");
  v4 = v3;
  -[PXPeopleSuggestionView faceRect](self, "faceRect");
  v6 = v4 * v5;
  v8 = v4 * v7;
  v10 = v4 * v9;
  v12 = v4 * v11;
  result.size.height = v12;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v6;
  return result;
}

- (double)_faceScale
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  -[PXPeopleSuggestionView imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v6 = v5;

  -[PXPeopleSuggestionView imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;

  return v9 / v6;
}

- (PXPerson)suggestion
{
  return self->_suggestion;
}

- (CGRect)faceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_faceRect.origin.x;
  y = self->_faceRect.origin.y;
  width = self->_faceRect.size.width;
  height = self->_faceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFaceRect:(CGRect)a3
{
  self->_faceRect = a3;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UIView)suggestionView
{
  return self->_suggestionView;
}

- (void)setSuggestionView:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionView, a3);
}

- (UIView)dimView
{
  return self->_dimView;
}

- (void)setDimView:(id)a3
{
  objc_storeStrong((id *)&self->_dimView, a3);
}

- (CAShapeLayer)spotlightLayer
{
  return self->_spotlightLayer;
}

- (void)setSpotlightLayer:(id)a3
{
  objc_storeStrong((id *)&self->_spotlightLayer, a3);
}

- (BOOL)needsSpotlightUpdate
{
  return self->_needsSpotlightUpdate;
}

- (void)setNeedsSpotlightUpdate:(BOOL)a3
{
  self->_needsSpotlightUpdate = a3;
}

- (BOOL)validSpotlight
{
  return self->_validSpotlight;
}

- (void)setValidSpotlight:(BOOL)a3
{
  self->_validSpotlight = a3;
}

- (PXPersonImageRequest)imageRequest
{
  return self->_imageRequest;
}

- (void)setImageRequest:(id)a3
{
  objc_storeStrong((id *)&self->_imageRequest, a3);
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatter, a3);
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (void)setDateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dateLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_imageRequest, 0);
  objc_storeStrong((id *)&self->_spotlightLayer, 0);
  objc_storeStrong((id *)&self->_dimView, 0);
  objc_storeStrong((id *)&self->_suggestionView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
}

void __51__PXPeopleSuggestionView__updateSpotlightAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setValidSpotlight:", 1);

}

void __85__PXPeopleSuggestionView__updateSuggestionImageWithAnimatedSpotlight_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  char v15;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_copyWeak(&v14, (id *)(a1 + 56));
    v10 = *(id *)(a1 + 32);
    v11 = v5;
    v7 = v6;
    v8 = *(void **)(a1 + 48);
    v12 = v7;
    v15 = *(_BYTE *)(a1 + 64);
    v13 = v8;
    px_dispatch_on_main_queue();

    objc_destroyWeak(&v14);
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
      (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, 0);
  }

}

void __85__PXPeopleSuggestionView__updateSuggestionImageWithAnimatedSpotlight_withCompletion___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
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
  void *v14;
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
  uint64_t v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  BOOL v30;
  id v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v2 = (id *)(a1 + 72);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));

  if (WeakRetained)
  {
    v31 = objc_loadWeakRetained(v2);
    objc_msgSend(*(id *)(a1 + 32), "setImage:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("PXPeopleContentsRectKey"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "CGRectValue");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(*(id *)(a1 + 32), "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentsRect:", v6, v8, v10, v12);

    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("PXPeopleSmallFaceRectKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "CGRectValue");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v23 = *(void **)(a1 + 32);
    objc_msgSend(v31, "imageView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23 == v24
      && (v32.origin.x = v16,
          v32.origin.y = v18,
          v32.size.width = v20,
          v32.size.height = v22,
          !CGRectEqualToRect(v32, *MEMORY[0x1E0C9D648])))
    {
      objc_msgSend(*(id *)(a1 + 56), "faceRect");
      v34.origin.x = v26;
      v34.origin.y = v27;
      v34.size.width = v28;
      v34.size.height = v29;
      v33.origin.x = v16;
      v33.origin.y = v18;
      v33.size.width = v20;
      v33.size.height = v22;
      v30 = CGRectEqualToRect(v33, v34);

      if (!v30)
      {
        objc_msgSend(v31, "setFaceRect:", v16, v18, v20, v22);
        if (*(_BYTE *)(a1 + 80))
          objc_msgSend(v31, "_updateSpotlightAnimated:", 1);
      }
    }
    else
    {

    }
    v25 = *(_QWORD *)(a1 + 64);
    if (v25)
      (*(void (**)(uint64_t, uint64_t))(v25 + 16))(v25, 1);

  }
}

void __64__PXPeopleSuggestionView_setSuggestion_animated_withCompletion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(id, _QWORD);
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v8 = a1[4];
    v9 = v5;
    v10 = v6;
    v11 = a1[5];
    v12 = a1[7];
    px_dispatch_on_main_queue();

  }
  else
  {
    v7 = (void (**)(id, _QWORD))a1[7];
    if (v7)
      v7[2](v7, 0);
  }

}

void __64__PXPeopleSuggestionView_setSuggestion_animated_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
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
  uint64_t v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t);
  void *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  objc_msgSend(*(id *)(a1 + 32), "setImage:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("PXPeopleContentsRectKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CGRectValue");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContentsRect:", v4, v6, v8, v10);

  v12 = MEMORY[0x1E0C809B0];
  v13 = (void *)MEMORY[0x1E0DC3F10];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __64__PXPeopleSuggestionView_setSuggestion_animated_withCompletion___block_invoke_3;
  v36[3] = &unk_1E5149198;
  v37 = *(id *)(a1 + 32);
  v31 = v12;
  v32 = 3221225472;
  v33 = __64__PXPeopleSuggestionView_setSuggestion_animated_withCompletion___block_invoke_4;
  v34 = &unk_1E5147360;
  v35 = *(id *)(a1 + 56);
  objc_msgSend(v13, "animateWithDuration:delay:options:animations:completion:", 0, v36, &v31, 0.33, 0.0);
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("PXPeopleSmallFaceRectKey"), v31, v32, v33, v34);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "CGRectValue");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 64), "imageView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23 == v24
    && (v38.origin.x = v16,
        v38.origin.y = v18,
        v38.size.width = v20,
        v38.size.height = v22,
        !CGRectEqualToRect(v38, *MEMORY[0x1E0C9D648])))
  {
    objc_msgSend(*(id *)(a1 + 64), "faceRect");
    v40.origin.x = v26;
    v40.origin.y = v27;
    v40.size.width = v28;
    v40.size.height = v29;
    v39.origin.x = v16;
    v39.origin.y = v18;
    v39.size.width = v20;
    v39.size.height = v22;
    v30 = CGRectEqualToRect(v39, v40);

    if (!v30)
    {
      objc_msgSend(*(id *)(a1 + 64), "setFaceRect:", v16, v18, v20, v22);
      objc_msgSend(*(id *)(a1 + 64), "_updateSpotlightAnimated:", *(unsigned __int8 *)(a1 + 80));
    }
  }
  else
  {

  }
  v25 = *(_QWORD *)(a1 + 72);
  if (v25)
    (*(void (**)(uint64_t, uint64_t))(v25 + 16))(v25, 1);

}

uint64_t __64__PXPeopleSuggestionView_setSuggestion_animated_withCompletion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __64__PXPeopleSuggestionView_setSuggestion_animated_withCompletion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

@end
