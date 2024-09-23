@implementation PKPassFaceView

- (void)setDimmer:(double)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  if (self->_dimmer != a3)
  {
    v4 = a4;
    self->_dimmer = a3;
    -[PKPassFaceView _createDimmingFilterIfNecessary](self, "_createDimmingFilterIfNecessary");
    -[PKPassFaceView layer](self, "layer");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0 - self->_dimmer);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v7 = (void *)MEMORY[0x1E0DC3658];
      objc_msgSend(v14, "valueForKeyPath:", CFSTR("filters.dimmingFilter.inputColor"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "colorWithCGColor:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("filters.dimmingFilter.inputColor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setDuration:", 0.25);
      objc_msgSend(v10, "setFillMode:", *MEMORY[0x1E0CD2B60]);
      v11 = v9;
      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "setFromValue:", objc_msgSend(objc_retainAutorelease(v11), "CGColor"));
      if (!v9)

      objc_msgSend(v10, "setToValue:", objc_msgSend(objc_retainAutorelease(v6), "CGColor"));
      v12 = (id)objc_msgSend(v14, "pkui_addAdditiveAnimation:", v10);

    }
    v13 = objc_retainAutorelease(v6);
    objc_msgSend(v14, "setValue:forKeyPath:", objc_msgSend(v13, "CGColor"), CFSTR("filters.dimmingFilter.inputColor"));

  }
}

- (void)_createBucketsIfNecessary
{
  NSArray *buckets;
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  PKPaymentService *v17;
  PKPaymentService *v18;
  void *v19;
  PKPaymentService *v20;
  PKPaymentService *paymentService;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  buckets = self->_buckets;
  if (!buckets)
  {
    -[PKPassFaceView _relevantBuckets](self, "_relevantBuckets");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_buckets;
    self->_buckets = v4;

    buckets = self->_buckets;
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = buckets;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v10);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v23;
LABEL_10:
          v16 = 0;
          while (1)
          {
            if (*(_QWORD *)v23 != v15)
              objc_enumerationMutation(v12);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v16), "foreignReferenceType") == 1)
              break;
            if (v14 == ++v16)
            {
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
              if (v14)
                goto LABEL_10;
              goto LABEL_16;
            }
          }

          if (self->_paymentService)
            return;
          v20 = (PKPaymentService *)objc_msgSend(objc_alloc(MEMORY[0x1E0D672B0]), "initWithDelegate:", self);
          paymentService = self->_paymentService;
          self->_paymentService = v20;

          -[PKPassFaceView _updateForeignBalances](self, "_updateForeignBalances");
          +[PKUIForegroundActiveArbiter sharedInstance](PKUIForegroundActiveArbiter, "sharedInstance");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          self->_foregroundActive = ((unsigned __int16)objc_msgSend(v19, "registerObserver:", self) >> 8) & 1;
          goto LABEL_22;
        }
LABEL_16:

        ++v10;
      }
      while (v10 != v8);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v8)
        continue;
      break;
    }
  }

  v17 = self->_paymentService;
  if (v17)
  {
    -[PKPaymentService setDelegate:](v17, "setDelegate:", 0);
    v18 = self->_paymentService;
    self->_paymentService = 0;

    +[PKUIForegroundActiveArbiter sharedInstance](PKUIForegroundActiveArbiter, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "unregisterObserver:", self);
LABEL_22:

  }
}

void __43__PKPassFaceView__loadFaceImageIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  __int16 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v3 = a2;
  v4 = *((_WORD *)v3 + 248);
  if ((v4 & 0x800) == 0)
  {
    *((_WORD *)v3 + 248) = v4 | 0x800;
    if ((v4 & 0x400) == 0)
    {
      v5 = (void *)MEMORY[0x1E0DC3870];
      v25 = v3;
      objc_msgSend(*((id *)v3 + 56), "partialFrontFaceImage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "imageWithPKImage:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)*((_QWORD *)v25 + 79);
      *((_QWORD *)v25 + 79) = v7;

      v9 = (void *)MEMORY[0x1E0DC3658];
      objc_msgSend(*((id *)v25 + 56), "partialFrontFaceImageAverageColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pkui_colorWithPKColor:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)*((_QWORD *)v25 + 77);
      *((_QWORD *)v25 + 77) = v11;

      PKPassFaceShadowInsets();
      *((_QWORD *)v25 + 80) = v13;
      *((_QWORD *)v25 + 81) = v14;
      *((_QWORD *)v25 + 83) = v15;
      *((_QWORD *)v25 + 82) = 0;
      objc_msgSend(*((id *)v25 + 79), "size");
      v18 = v17 - (*((double *)v25 + 80) + *((double *)v25 + 82));
      v19 = *(double *)(a1 + 48);
      v20 = *(double *)(a1 + 40) - (v16 - (*((double *)v25 + 81) + *((double *)v25 + 83)));
      *((_QWORD *)v25 + 84) = 0;
      *((double *)v25 + 86) = v19 - v18;
      PKFloatRoundToPixel();
      *((double *)v25 + 85) = v21;
      *((double *)v25 + 87) = v20 - v21;
      v22 = (void *)*((_QWORD *)v25 + 67);
      *((_QWORD *)v25 + 67) = 0;

      v23 = (void *)*((_QWORD *)v25 + 64);
      if (v23)
      {
        objc_msgSend(v23, "removeFromSuperview");
        v24 = (void *)*((_QWORD *)v25 + 64);
        *((_QWORD *)v25 + 64) = 0;

      }
      objc_msgSend(v25, "setNeedsLayout");
      v3 = v25;
    }
  }

}

- (int64_t)style
{
  return self->_style;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIImageView *backgroundPlaceholderView;
  UIImage *v12;
  UIImage *placeholderFaceImage;
  UIImageView *v14;
  $2C2C0F74643FC2F4D213D6D0647A904C flags;
  UIImageView *shadowBackgroundView;
  UIImage *v17;
  UIImage *faceImage;
  UIImage *v19;
  UIImage *faceShadowImage;
  UIImageView *backgroundView;
  UIImage *v22;
  UIImage *partialFaceImage;
  void *v24;
  __int16 v25;
  PKLiveRenderedCardFaceView *liveBackgroundView;
  _BOOL8 v27;
  uint64_t v28;
  PKLiveRenderedCardFaceView *v29;
  UIEdgeInsets *p_faceImageAlignmentInsets;
  unint64_t v31;
  UIView *primaryAccountNumberSuffixView;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  NSMutableArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  objc_super v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  -[PKPassFaceView shadowInsets](self, "shadowInsets");
  -[PKPassFaceView bounds](self, "bounds");
  -[PKPassFaceView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PKLiveRenderedCardFaceView setFrame:](self->_liveBackgroundView, "setFrame:");
  -[PKTransactionDataOverlayCardFaceView setFrame:](self->_transactionDataOverlayView, "setFrame:", v4, v6, v8, v10);
  backgroundPlaceholderView = self->_backgroundPlaceholderView;
  if (backgroundPlaceholderView)
  {
    -[UIImageView image](backgroundPlaceholderView, "image");
    v12 = (UIImage *)objc_claimAutoreleasedReturnValue();
    placeholderFaceImage = self->_placeholderFaceImage;

    if (v12 != placeholderFaceImage)
      -[UIImageView setImage:](self->_backgroundPlaceholderView, "setImage:", self->_placeholderFaceImage);
    v14 = self->_backgroundPlaceholderView;
    UIRectInset();
    -[UIImageView setFrame:](v14, "setFrame:");
  }
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    shadowBackgroundView = self->_shadowBackgroundView;
    -[PKPassFaceView shadowBackgroundInsets](self, "shadowBackgroundInsets");
    UIRectInset();
    -[UIImageView setFrame:](shadowBackgroundView, "setFrame:");
    if (self->_faceImage || self->_backgroundMode == 1 && self->_modallyPresented)
    {
      -[UIImageView image](self->_backgroundView, "image");
      v17 = (UIImage *)objc_claimAutoreleasedReturnValue();
      faceImage = self->_faceImage;

      if (v17 != faceImage)
        -[UIImageView setImage:](self->_backgroundView, "setImage:", self->_faceImage);
      -[UIImageView image](self->_shadowBackgroundView, "image");
      v19 = (UIImage *)objc_claimAutoreleasedReturnValue();
      faceShadowImage = self->_faceShadowImage;

      if (v19 != faceShadowImage)
        -[UIImageView setImage:](self->_shadowBackgroundView, "setImage:", self->_faceShadowImage);
      backgroundView = self->_backgroundView;
      UIRectInset();
    }
    else
    {
      -[UIImageView image](self->_backgroundView, "image");
      v22 = (UIImage *)objc_claimAutoreleasedReturnValue();
      partialFaceImage = self->_partialFaceImage;

      if (v22 != partialFaceImage)
        -[UIImageView setImage:](self->_backgroundView, "setImage:", self->_partialFaceImage);
      -[UIImage size](self->_partialFaceImage, "size");
      PKSizeAlignedInRect();
      backgroundView = self->_backgroundView;
    }
    -[UIImageView setFrame:](backgroundView, "setFrame:");
    -[PKDynamicLayerView layer](self->_dynamicCardView, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    PKPaymentStyleApplyCorners();

    -[PKDynamicLayerView setFrame:](self->_dynamicCardView, "setFrame:", v4, v6, v8, v10);
    flags = self->_flags;
  }
  -[UIView setHidden:](self->_contentView, "setHidden:", (*(unsigned int *)&flags >> 5) & 1);
  v25 = (__int16)self->_flags;
  if ((v25 & 0x10) == 0)
  {
    -[PKLiveRenderedCardFaceView clearFaceImage](self->_liveBackgroundView, "clearFaceImage");
    liveBackgroundView = self->_liveBackgroundView;
    v27 = (v25 & 8) == 0;
    goto LABEL_34;
  }
  v28 = 544;
  if (self->_faceImage)
  {
    v29 = self->_liveBackgroundView;
    p_faceImageAlignmentInsets = &self->_faceImageAlignmentInsets;
    v31 = 584;
LABEL_27:
    -[PKLiveRenderedCardFaceView setFaceImage:withAverageColor:alignmentInsets:contentInsets:](v29, "setFaceImage:withAverageColor:alignmentInsets:contentInsets:", p_faceImageAlignmentInsets->top, p_faceImageAlignmentInsets->left, p_faceImageAlignmentInsets->bottom, p_faceImageAlignmentInsets->right, *(double *)((char *)&self->super.super.super.super.isa + v31), *(double *)((char *)&self->super.super.super._responderFlags + v31), *(double *)((char *)&self->super.super.super.__layeringSceneIdentity + v31), *(double *)&(&self->super.super._constraintsExceptingSubviewAutoresizingConstraints)[v31 / 8]);
    goto LABEL_29;
  }
  if (self->_backgroundMode == 1 && self->_modallyPresented)
  {
    v29 = self->_liveBackgroundView;
  }
  else
  {
    v28 = 632;
    v29 = self->_liveBackgroundView;
    if (self->_partialFaceImage)
    {
      v31 = 672;
      p_faceImageAlignmentInsets = &self->_partialFaceImageAlignmentInsets;
      goto LABEL_27;
    }
  }
  -[PKLiveRenderedCardFaceView clearFaceImage](v29, "clearFaceImage");
LABEL_29:
  liveBackgroundView = self->_liveBackgroundView;
  if ((v25 & 8) != 0)
  {
    if (*(Class *)((char *)&self->super.super.super.super.isa + v28))
      v27 = 0;
    else
      v27 = self->_backgroundPlaceholderView != 0;
  }
  else
  {
    v27 = 1;
  }
LABEL_34:
  -[PKLiveRenderedCardFaceView setHidden:](liveBackgroundView, "setHidden:", v27);
  -[UIView setFrame:](self->_contentView, "setFrame:", v4, v6, v8, v10);
  primaryAccountNumberSuffixView = self->_primaryAccountNumberSuffixView;
  if (primaryAccountNumberSuffixView)
  {
    -[UIView frame](primaryAccountNumberSuffixView, "frame");
    PKPaymentPassContentInsets();
    -[UIView bounds](self->_contentView, "bounds");
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UIView setFrame:](self->_primaryAccountNumberSuffixView, "setFrame:");
  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v33 = self->_headerBucketViews;
  v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v53 != v36)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        objc_msgSend(v38, "bucketTemplate");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "bucketRect");
        objc_msgSend(v38, "setFrame:");

      }
      v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    }
    while (v35);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v40 = self->_bodyBucketViews;
  v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v42; ++j)
      {
        if (*(_QWORD *)v49 != v43)
          objc_enumerationMutation(v40);
        v45 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
        objc_msgSend(v45, "bucketTemplate");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "bucketRect");
        objc_msgSend(v45, "setFrame:");

      }
      v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    }
    while (v42);
  }

  v47.receiver = self;
  v47.super_class = (Class)PKPassFaceView;
  -[PKPassFaceView layoutSubviews](&v47, sel_layoutSubviews);
}

- (UIEdgeInsets)alignmentRectInsets
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
  UIEdgeInsets result;

  -[PKPassFaceView shadowInsets](self, "shadowInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (self->_clipsContent)
  {
    v11 = fmax(self->_clippedContentHeight, 0.0);
    -[PKPassFaceView contentSize](self, "contentSize");
    v8 = v8 + fmax(v11 - fmax(v12, 0.0), 0.0);
  }
  v13 = v4;
  v14 = v6;
  v15 = v8;
  v16 = v10;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (UIEdgeInsets)shadowInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  PKPassFaceShadowInsets();
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (PKPass)pass
{
  return self->_pass;
}

- (BOOL)viewExpanded
{
  return self->_viewExpanded;
}

- (UIEdgeInsets)shadowBackgroundInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIEdgeInsets result;

  PKPassFaceShadowInsets();
  v3 = v2 + 15.0;
  v5 = v4 + 15.0;
  v7 = v6 + 15.0;
  v9 = v8 + 15.0;
  result.right = v9;
  result.bottom = v5;
  result.left = v7;
  result.top = v3;
  return result;
}

- (PKPassFaceTemplate)faceTemplate
{
  return self->_faceTemplate;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)createBodyContentViews
{
  NSMutableArray *v3;
  NSMutableArray *bodyBucketViews;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  PKPassBucketView *v13;
  void *v14;
  void *v15;
  UIView *primaryAccountNumberSuffixView;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[PKPassFaceView _createBucketsIfNecessary](self, "_createBucketsIfNecessary");
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  bodyBucketViews = self->_bodyBucketViews;
  self->_bodyBucketViews = v3;

  -[NSArray subarrayWithRange:](self->_buckets, "subarrayWithRange:", 1, -[NSArray count](self->_buckets, "count") - 1);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v10, "count"))
        {
          -[PKPassFaceTemplate templateForBucketAtIndex:](self->_faceTemplate, "templateForBucketAtIndex:", v7 + i);
          v11 = objc_claimAutoreleasedReturnValue();
          if (!v11)
            goto LABEL_11;
          v12 = (void *)v11;
          v13 = objc_alloc_init(PKPassBucketView);
          -[PKPassFaceView pass](self, "pass");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPassBucketView setPass:](v13, "setPass:", v14);

          -[PKPassBucketView setBucketTemplate:](v13, "setBucketTemplate:", v12);
          -[PKPassFaceView colorProfile](self, "colorProfile");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPassBucketView setColorProfile:](v13, "setColorProfile:", v15);

          -[PKPassBucketView setBucket:](v13, "setBucket:", v10);
          -[PKPassFaceView insertContentView:ofType:](self, "insertContentView:ofType:", v13, 2);
          -[NSMutableArray addObject:](self->_bodyBucketViews, "addObject:", v13);

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v7 += i;
    }
    while (v6);
  }
LABEL_11:

  primaryAccountNumberSuffixView = self->_primaryAccountNumberSuffixView;
  if (primaryAccountNumberSuffixView)
    -[PKPassFaceView insertContentView:ofType:](self, "insertContentView:ofType:", primaryAccountNumberSuffixView, 2);

}

- (void)insertContentView:(id)a3 ofType:(int64_t)a4
{
  id v6;
  UIView *v7;
  UIView *contentView;
  id v9;
  id v10;

  v6 = a3;
  if (v6)
  {
    v10 = v6;
    objc_msgSend(v6, "superview");
    v7 = (UIView *)objc_claimAutoreleasedReturnValue();
    contentView = self->_contentView;

    if (v7 != contentView)
      -[UIView addSubview:](self->_contentView, "addSubview:", v10);
    if ((unint64_t)a4 <= 3)
      objc_msgSend(v10, "setHidden:", ((0x2000200010001uLL >> (16 * a4)) & *(_WORD *)&self->_flags) == 0);
    v9 = -[PKPassFaceView _viewSetForContentViewType:](self, "_viewSetForContentViewType:", a4);
    objc_msgSend(v9, "addObject:", v10);

    -[PKPassFaceView setNeedsLayout](self, "setNeedsLayout");
    v6 = v10;
  }

}

- (id)_viewSetForContentViewType:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 0;
  else
    return *(id *)((char *)&self->super.super.super.super.isa + *off_1E3E62BA8[a3]);
}

- (void)setVisibleRegions:(unint64_t)a3
{
  -[PKPassFaceView _createInvariantViewsForRegions:](self, "_createInvariantViewsForRegions:");
  -[PKPassFaceView _createContentViewsForRegions:](self, "_createContentViewsForRegions:", a3);
  -[PKPassFaceView _setShowsHeaderViews:](self, "_setShowsHeaderViews:", (a3 >> 1) & 1);
  -[PKPassFaceView _setShowsBodyViews:](self, "_setShowsBodyViews:", (a3 >> 2) & 1);
  -[PKPassFaceView _setShowsBackgroundView:](self, "_setShowsBackgroundView:", a3 & 1);
  self->_visibleRegions = a3;
}

- (void)_createContentViewsForRegions:(unint64_t)a3
{
  unint64_t v5;
  NSMutableSet *v6;
  NSMutableSet *headerContentViews;
  PKPassFaceTemplate *v8;
  PKPassFaceTemplate *faceTemplate;
  NSMutableSet *v10;
  NSMutableSet *bodyContentViews;

  if (-[PKPass isContentLoaded](self->_pass, "isContentLoaded"))
  {
    v5 = a3 & ~self->_contentViewCreatedRegions;
    if ((v5 & 2) != 0)
    {
      v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      headerContentViews = self->_headerContentViews;
      self->_headerContentViews = v6;

      -[PKPassFaceView createHeaderContentViews](self, "createHeaderContentViews");
    }
    if ((v5 & 4) != 0)
    {
      if (!self->_faceTemplate)
      {
        -[PKPassFaceView passFaceTemplate](self, "passFaceTemplate");
        v8 = (PKPassFaceTemplate *)objc_claimAutoreleasedReturnValue();
        faceTemplate = self->_faceTemplate;
        self->_faceTemplate = v8;

      }
      v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      bodyContentViews = self->_bodyContentViews;
      self->_bodyContentViews = v10;

      -[PKPassFaceView createBodyContentViews](self, "createBodyContentViews");
    }
    self->_contentViewCreatedRegions |= v5;
    -[PKPassFaceView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowsLiveRendering:(BOOL)a3 rendererState:(id)a4
{
  _BOOL4 v4;
  __int16 flags;
  __int16 v7;
  __int16 v8;
  PKPass *pass;
  PKTransactionDataOverlayCardFaceView *transactionDataOverlayView;
  int v11;
  __int16 v12;
  _BOOL4 v13;
  PKPass *v14;
  PKPass *v15;
  PKLiveRenderedCardFaceView *liveBackgroundView;
  int v17;
  void *v18;
  PKTransactionDataOverlayCardFaceView *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  PKTransactionDataOverlayCardFaceView *v24;
  PKTransactionDataOverlayCardFaceView *v25;
  PKTransactionDataOverlayCardFaceView *v26;
  PKLiveRenderedCardFaceView *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  PKLiveRenderedCardFaceView *v32;
  PKLiveRenderedCardFaceView *v33;
  PKLiveRenderedCardFaceView *v34;
  __int16 v35;
  id v36;

  v4 = a3;
  v36 = a4;
  flags = (__int16)self->_flags;
  if (v4)
    v7 = 4;
  else
    v7 = 0;
  v8 = flags & 0xFFFB | v7;
  *(_WORD *)&self->_flags = v8;
  if (v4)
  {
    if (-[PKPass passType](self->_pass, "passType") == PKPassTypeSecureElement)
      pass = self->_pass;
    else
      pass = 0;
    v14 = pass;
    v15 = self->_pass;
    if (v15)
    {
      if (-[PKPass liveRenderType](v15, "liveRenderType"))
      {
        liveBackgroundView = self->_liveBackgroundView;
        if (!liveBackgroundView)
        {
          v27 = [PKLiveRenderedCardFaceView alloc];
          v28 = *MEMORY[0x1E0C9D538];
          v29 = *(double *)(MEMORY[0x1E0C9D538] + 8);
          -[PKPass style](self->_pass, "style");
          PKPassFrontFaceContentSize();
          v32 = -[PKLiveRenderedCardFaceView initWithFrame:pass:](v27, "initWithFrame:pass:", self->_pass, v28, v29, v30, v31);
          v33 = self->_liveBackgroundView;
          self->_liveBackgroundView = v32;

          v34 = self->_liveBackgroundView;
          if (!v34)
            goto LABEL_24;
          -[PKLiveRenderedCardFaceView setMotionEnabled:](v34, "setMotionEnabled:", self->_liveMotionEnabled);
          -[PKPassFaceView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_liveBackgroundView, self->_contentView);
          liveBackgroundView = self->_liveBackgroundView;
          if (!liveBackgroundView)
            goto LABEL_24;
        }
        LODWORD(transactionDataOverlayView) = -[PKLiveRenderedCardFaceView requiresFaceImage](liveBackgroundView, "requiresFaceImage");

        v8 = (__int16)self->_flags;
        if ((v8 & 8) != 0)
        {
          v17 = 0;
          v13 = 1;
          goto LABEL_35;
        }
LABEL_33:
        v12 = 8;
        v11 = 1;
        goto LABEL_34;
      }
      v15 = self->_pass;
    }
    if (!-[PKPass supportsCategoryVisualization](v15, "supportsCategoryVisualization")
      || !v14
      || (-[PKPass associatedAccountServiceAccountIdentifier](v14, "associatedAccountServiceAccountIdentifier"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v18,
          !v18))
    {
LABEL_24:

      LODWORD(transactionDataOverlayView) = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v8 = (__int16)self->_flags;
      if ((v8 & 8) != 0)
        goto LABEL_34;
LABEL_28:
      if ((v8 & 0x10) == 0)
      {
        -[PKTransactionDataOverlayCardFaceView setHidden:](self->_transactionDataOverlayView, "setHidden:", !v13);
        goto LABEL_43;
      }
      v35 = 0;
      goto LABEL_41;
    }
    transactionDataOverlayView = self->_transactionDataOverlayView;
    if (!transactionDataOverlayView)
    {
      v19 = [PKTransactionDataOverlayCardFaceView alloc];
      v20 = *MEMORY[0x1E0C9D538];
      v21 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      -[PKPass style](self->_pass, "style");
      PKPassFrontFaceContentSize();
      v24 = -[PKTransactionDataOverlayCardFaceView initWithFrame:pass:rendererState:](v19, "initWithFrame:pass:rendererState:", self->_pass, v36, v20, v21, v22, v23);
      v25 = self->_transactionDataOverlayView;
      self->_transactionDataOverlayView = v24;

      v26 = self->_transactionDataOverlayView;
      if (v26)
      {
        -[PKPassFaceView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v26, self->_contentView);
        transactionDataOverlayView = self->_transactionDataOverlayView;
      }
      else
      {
        transactionDataOverlayView = 0;
      }
    }
    v13 = transactionDataOverlayView != 0;

    v8 = (__int16)self->_flags;
    if (v13 != ((v8 & 8) == 0))
      goto LABEL_28;
    if (!transactionDataOverlayView)
    {
      v11 = 0;
      v12 = 0;
      goto LABEL_34;
    }
    LODWORD(transactionDataOverlayView) = 0;
    goto LABEL_33;
  }
  LODWORD(transactionDataOverlayView) = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  if ((flags & 8) == 0)
    goto LABEL_28;
LABEL_34:
  v8 = v8 & 0xFFF7 | v12;
  *(_WORD *)&self->_flags = v8;
  v17 = 1;
  v13 = v11;
LABEL_35:
  if (((((v8 & 0x10) == 0) ^ transactionDataOverlayView) & 1) == 0)
  {
    if ((_DWORD)transactionDataOverlayView)
      v35 = 16;
    else
      v35 = 0;
LABEL_41:
    *(_WORD *)&self->_flags = v8 & 0xFFEF | v35;
    -[PKTransactionDataOverlayCardFaceView setHidden:](self->_transactionDataOverlayView, "setHidden:", !v13);
    goto LABEL_42;
  }
  -[PKTransactionDataOverlayCardFaceView setHidden:](self->_transactionDataOverlayView, "setHidden:", !v13);
  if (v17)
LABEL_42:
    -[PKPassFaceView setNeedsLayout](self, "setNeedsLayout");
LABEL_43:
  -[PKPassFaceView _updateEffectiveShowsBackgroundView](self, "_updateEffectiveShowsBackgroundView");
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
    -[PKPassFaceView _loadFaceImageIfNecessary](self, "_loadFaceImageIfNecessary");

}

- (void)_updateEffectiveShowsBackgroundView
{
  __int16 flags;
  int v3;
  void *v5;
  PKDynamicLayerView *dynamicCardView;
  uint64_t v7;
  PKDynamicLayerView *v8;
  PKDynamicLayerView *v9;
  PKDynamicLayerView *v10;

  flags = (__int16)self->_flags;
  v3 = flags & 0x48;
  if (((flags & 0x80) == 0) == (v3 == 64))
  {
    *(_WORD *)&self->_flags = flags & 0xFF7F | ((v3 == 64) << 7);
    if (v3 != 64)
    {
      -[UIImageView setImage:](self->_backgroundPlaceholderView, "setImage:", 0);
      -[UIImageView setImage:](self->_backgroundView, "setImage:", 0);
      -[UIImageView setImage:](self->_shadowBackgroundView, "setImage:", 0);
      -[PKDynamicLayerView setHidden:](self->_dynamicCardView, "setHidden:", 1);
      -[PKPassFaceView setNeedsLayout](self, "setNeedsLayout");
LABEL_11:
      -[PKPassFaceView _updateShowsPanSuffix](self, "_updateShowsPanSuffix");
      return;
    }
    if (-[PKPass passType](self->_pass, "passType") == PKPassTypeSecureElement
      && (-[PKPass dynamicLayerConfiguration](self->_pass, "dynamicLayerConfiguration"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v5,
          v5))
    {
      dynamicCardView = self->_dynamicCardView;
      if (!dynamicCardView)
      {
        v8 = [PKDynamicLayerView alloc];
        v9 = -[PKDynamicLayerView initWithFrame:pass:automaticallyLoadContent:](v8, "initWithFrame:pass:automaticallyLoadContent:", self->_pass, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v10 = self->_dynamicCardView;
        self->_dynamicCardView = v9;

        -[PKDynamicLayerView setClipsToBounds:](self->_dynamicCardView, "setClipsToBounds:", 1);
        -[PKPassFaceView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_dynamicCardView, self->_contentView);
        goto LABEL_10;
      }
      v7 = 0;
    }
    else
    {
      dynamicCardView = self->_dynamicCardView;
      v7 = 1;
    }
    -[PKDynamicLayerView setHidden:](dynamicCardView, "setHidden:", v7);
LABEL_10:
    -[PKPassFaceView _loadFaceImageIfNecessary](self, "_loadFaceImageIfNecessary");
    goto LABEL_11;
  }
}

- (void)setLiveMotionEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  self->_liveMotionEnabled = a3;
  -[PKLiveRenderedCardFaceView setMotionEnabled:](self->_liveBackgroundView, "setMotionEnabled:");
  -[PKTransactionDataOverlayCardFaceView setMotionEnabled:](self->_transactionDataOverlayView, "setMotionEnabled:", v3);
  -[PKDynamicLayerView setMotionEnabled:](self->_dynamicCardView, "setMotionEnabled:", v3);
}

- (void)setClipsContent:(BOOL)a3
{
  if (self->_clipsContent != a3)
  {
    -[PKPassFaceView setClipsToBounds:](self, "setClipsToBounds:");
    self->_clipsContent = a3;
  }
}

- (void)setBackgroundMode:(int64_t)a3
{
  __int16 flags;

  flags = (__int16)self->_flags;
  if (self->_backgroundMode != a3 || (flags & 0x2000) == 0)
  {
    *(_WORD *)&self->_flags = flags | 0x2000;
    self->_backgroundMode = a3;
    -[PKPassFaceView _loadFaceImageIfNecessary](self, "_loadFaceImageIfNecessary");
    -[PKPassFaceView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_loadFaceImageIfNecessary
{
  __int16 flags;
  _BOOL4 modallyPresented;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void (**v14)(void *, PKPassFaceView *);
  int v15;
  $2C2C0F74643FC2F4D213D6D0647A904C v16;
  PKPass *v17;
  id *v18;
  void (**v19)(void *, PKPassFaceView *);
  __int16 v20;
  PKPass *pass;
  _QWORD v22[4];
  void (**v23)(void *, PKPassFaceView *);
  id v24;
  _QWORD v25[4];
  void (**v26)(void *, PKPassFaceView *);
  id v27;
  id location;
  _QWORD v29[7];
  _QWORD v30[7];
  _QWORD aBlock[5];

  flags = (__int16)self->_flags;
  if ((flags & 0x80) != 0 || (flags & 0x18) == 0x18)
  {
    if (self->_backgroundMode)
      modallyPresented = 1;
    else
      modallyPresented = self->_modallyPresented;
    if (self->_faceImage || (!self->_partialFaceImage ? (v5 = 1) : (v5 = modallyPresented), (v5 & 1) == 0))
    {
      -[PKPassFaceView setNeedsLayout](self, "setNeedsLayout");
      return;
    }
    v6 = -[PKPass style](self->_pass, "style");
    -[PKPassFaceView contentSize](self, "contentSize");
    v8 = v7;
    v10 = v9;
    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __43__PKPassFaceView__loadFaceImageIfNecessary__block_invoke;
    aBlock[3] = &__block_descriptor_40_e24_v16__0__PKPassFaceView_8l;
    aBlock[4] = v6;
    v12 = _Block_copy(aBlock);
    v30[0] = v11;
    v30[1] = 3221225472;
    v30[2] = __43__PKPassFaceView__loadFaceImageIfNecessary__block_invoke_2;
    v30[3] = &__block_descriptor_56_e24_v16__0__PKPassFaceView_8l;
    v30[4] = v6;
    v30[5] = v8;
    v30[6] = v10;
    v13 = _Block_copy(v30);
    v29[0] = v11;
    v29[1] = 3221225472;
    v29[2] = __43__PKPassFaceView__loadFaceImageIfNecessary__block_invoke_3;
    v29[3] = &__block_descriptor_56_e24_v16__0__PKPassFaceView_8l;
    v29[4] = v6;
    v29[5] = v8;
    v29[6] = v10;
    v14 = (void (**)(void *, PKPassFaceView *))_Block_copy(v29);
    v15 = -[PKPass isImageSetLoaded:](self->_pass, "isImageSetLoaded:", 0);
    if (((modallyPresented | v15) & 1) != 0)
    {
      if ((v15 & 1) != 0 || self->_modallyPresented)
        goto LABEL_14;
      v20 = (__int16)self->_flags;
      if ((v20 & 0x200) == 0)
      {
        *(_WORD *)&self->_flags = v20 | 0x200;
        -[PKPass loadCachedImageSet:](self->_pass, "loadCachedImageSet:", 0);
        if ((-[PKPass isImageSetLoaded:](self->_pass, "isImageSetLoaded:", 0) & 1) != 0)
        {
LABEL_14:
          v14[2](v14, self);
LABEL_21:

          return;
        }
        v20 = (__int16)self->_flags;
      }
      if ((v20 & 0x4000) != 0)
        goto LABEL_21;
      *(_WORD *)&self->_flags = v20 | 0x4000;
      (*((void (**)(void *, PKPassFaceView *))v12 + 2))(v12, self);
      objc_initWeak(&location, self);
      pass = self->_pass;
      v22[0] = v11;
      v22[1] = 3221225472;
      v22[2] = __43__PKPassFaceView__loadFaceImageIfNecessary__block_invoke_6;
      v22[3] = &unk_1E3E61C80;
      v18 = &v24;
      objc_copyWeak(&v24, &location);
      v23 = v14;
      -[PKPass loadImageSetAsync:preheat:withCompletion:](pass, "loadImageSetAsync:preheat:withCompletion:", 0, 0, v22);
      v19 = v23;
    }
    else
    {
      if (-[PKPass isImageSetLoaded:](self->_pass, "isImageSetLoaded:", 2))
      {
        (*((void (**)(void *, PKPassFaceView *))v13 + 2))(v13, self);
        goto LABEL_21;
      }
      v16 = self->_flags;
      if ((*(_DWORD *)&v16 & 0x80000000) != 0)
        goto LABEL_21;
      *(_WORD *)&self->_flags = *(_WORD *)&v16 | 0x8000;
      (*((void (**)(void *, PKPassFaceView *))v12 + 2))(v12, self);
      objc_initWeak(&location, self);
      v17 = self->_pass;
      v25[0] = v11;
      v25[1] = 3221225472;
      v25[2] = __43__PKPassFaceView__loadFaceImageIfNecessary__block_invoke_4;
      v25[3] = &unk_1E3E61C80;
      v18 = &v27;
      objc_copyWeak(&v27, &location);
      v26 = v13;
      -[PKPass loadImageSetAsync:preheat:withCompletion:](v17, "loadImageSetAsync:preheat:withCompletion:", 2, 0, v25);
      v19 = v26;
    }

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
    goto LABEL_21;
  }
}

- (void)_setShowsHeaderViews:(BOOL)a3
{
  _BOOL4 v3;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableSet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = self->_headerContentViews;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v9++), "setHidden:", !v3);
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = self->_headerInvariantViews;
  v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    v14 = !v3;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "setHidden:", v14, (_QWORD)v16);
      }
      while (v12 != v15);
      v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }

}

- (void)_setShowsBodyViews:(BOOL)a3
{
  _BOOL4 v3;
  __int16 v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  if (a3)
    v5 = 2;
  else
    v5 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v5;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = self->_bodyContentViews;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "setHidden:", !v3);
      }
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = self->_bodyInvariantViews;
  v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    v15 = !v3;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * j), "setHidden:", v15, (_QWORD)v17);
      }
      v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

}

- (void)_setShowsBackgroundView:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
  -[PKPassFaceView _updateEffectiveShowsBackgroundView](self, "_updateEffectiveShowsBackgroundView");
}

- (void)_createInvariantViewsForRegions:(unint64_t)a3
{
  unint64_t v4;
  NSMutableSet *v5;
  NSMutableSet *headerInvariantViews;
  NSMutableSet *v7;
  NSMutableSet *bodyInvariantViews;

  v4 = a3 & ~self->_invariantViewCreatedRegions;
  if ((v4 & 2) != 0)
  {
    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    headerInvariantViews = self->_headerInvariantViews;
    self->_headerInvariantViews = v5;

    -[PKPassFaceView createHeaderInvariantViews](self, "createHeaderInvariantViews");
  }
  if ((v4 & 4) != 0)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    bodyInvariantViews = self->_bodyInvariantViews;
    self->_bodyInvariantViews = v7;

    -[PKPassFaceView createBodyInvariantViews](self, "createBodyInvariantViews");
  }
  self->_invariantViewCreatedRegions |= v4;
  -[PKPassFaceView setNeedsLayout](self, "setNeedsLayout");
}

- (PKPassColorProfile)colorProfile
{
  return self->_colorProfile;
}

- (void)setClippedContentHeight:(double)a3
{
  self->_clippedContentHeight = a3;
}

- (void)createContentViewsWithFade:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD v5[5];

  v3 = a3;
  -[PKPassFaceView _createContentViewsForRegions:](self, "_createContentViewsForRegions:", self->_visibleRegions);
  if (v3)
  {
    -[PKPassFaceView _setContentViewsAlpha:](self, "_setContentViewsAlpha:", 0.0);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __45__PKPassFaceView_createContentViewsWithFade___block_invoke;
    v5[3] = &unk_1E3E612E8;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v5, 0.2);
  }
}

- (void)_updateShowsPanSuffix
{
  __int16 flags;
  PKDynamicLayerView *dynamicCardView;
  int v5;
  _BOOL4 v6;
  PKPass *v7;
  void *v8;
  uint64_t v9;
  __int16 v10;
  UIView *primaryAccountNumberSuffixView;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  PKMaskedPANSuffixView *v16;
  UIView *v17;
  UIView *v18;
  id v19;

  flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0 || (dynamicCardView = self->_dynamicCardView) == 0)
  {
    v5 = 0;
    if ((flags & 8) != 0)
      goto LABEL_4;
LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
  v5 = -[PKDynamicLayerView isHidden](dynamicCardView, "isHidden") ^ 1;
  if ((*(_WORD *)&self->_flags & 8) == 0)
    goto LABEL_6;
LABEL_4:
  v6 = -[PKLiveRenderedCardFaceView requiresFaceImage](self->_liveBackgroundView, "requiresFaceImage");
LABEL_7:
  if ((v5 | v6) != 1 || -[PKPass passType](self->_pass, "passType") != PKPassTypeSecureElement)
  {
    v7 = 0;
LABEL_16:
    v19 = 0;
    v10 = (__int16)self->_flags;
    if ((v10 & 0x100) == 0)
      goto LABEL_19;
    goto LABEL_17;
  }
  v7 = self->_pass;
  -[PKPass primaryAccountNumberSuffix](v7, "primaryAccountNumberSuffix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_16;
  v19 = v8;
  v9 = objc_msgSend(v8, "length");
  v10 = (__int16)self->_flags;
  if ((v9 != 0) != ((v10 & 0x100) == 0))
    goto LABEL_19;
  if (v9)
  {
    *(_WORD *)&self->_flags = v10 | 0x100;
    primaryAccountNumberSuffixView = self->_primaryAccountNumberSuffixView;
    if (!primaryAccountNumberSuffixView)
    {
      v12 = (void *)MEMORY[0x1E0DC3658];
      -[PKPass displayProfile](v7, "displayProfile");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "foregroundColor");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v12, "colorWithCGColor:", objc_msgSend(v14, "CGColor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = -[PKMaskedPANSuffixView initWithSuffix:foregroundColor:]([PKMaskedPANSuffixView alloc], "initWithSuffix:foregroundColor:", v19, v15);
      v17 = self->_primaryAccountNumberSuffixView;
      self->_primaryAccountNumberSuffixView = &v16->super;

      primaryAccountNumberSuffixView = self->_primaryAccountNumberSuffixView;
    }
    -[PKPassFaceView insertContentView:ofType:](self, "insertContentView:ofType:", primaryAccountNumberSuffixView, 2);
    goto LABEL_19;
  }
LABEL_17:
  *(_WORD *)&self->_flags = v10 & 0xFEFF;
  v18 = self->_primaryAccountNumberSuffixView;
  if (v18)
    -[PKPassFaceView removeContentView:ofType:](self, "removeContentView:ofType:", v18, 2);
LABEL_19:

}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_paused != a3)
  {
    v3 = a3;
    self->_paused = a3;
    -[PKTransactionDataOverlayCardFaceView setPaused:](self->_transactionDataOverlayView, "setPaused:");
    -[PKDynamicLayerView setPaused:](self->_dynamicCardView, "setPaused:", v3);
  }
}

- (void)setPass:(id)a3 colorProfile:(id)a4
{
  PKPassColorProfile *v7;
  PKPass **p_pass;
  _BOOL4 v9;
  $2C2C0F74643FC2F4D213D6D0647A904C *p_flags;
  __int16 flags;
  __int16 v12;
  PKPass *v13;

  v13 = (PKPass *)a3;
  v7 = (PKPassColorProfile *)a4;
  p_pass = &self->_pass;
  if (self->_pass != v13)
  {
    objc_storeStrong((id *)&self->_pass, a3);
    if (*p_pass)
    {
      v9 = +[PKLiveRenderedCardFaceView replacesContentForType:](PKLiveRenderedCardFaceView, "replacesContentForType:", -[PKPass liveRenderType](*p_pass, "liveRenderType"));
      p_flags = &self->_flags;
      flags = (__int16)self->_flags;
      if (((v9 ^ ((flags & 0x20) == 0)) & 1) != 0)
        goto LABEL_10;
      if (v9)
        v12 = 32;
      else
        v12 = 0;
    }
    else
    {
      p_flags = &self->_flags;
      flags = (__int16)self->_flags;
      if ((flags & 0x20) == 0)
        goto LABEL_10;
      v12 = 0;
    }
    *(_WORD *)p_flags = flags & 0xFFDF | v12;
    -[PKPassFaceView setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_10:
  if (self->_colorProfile != v7)
    objc_storeStrong((id *)&self->_colorProfile, a4);

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKPassFaceView)initWithStyle:(int64_t)a3
{
  PKPassFaceView *v4;
  PKPassFaceView *v5;
  UIImageView *v6;
  UIImageView *shadowBackgroundView;
  void *v8;
  id v9;
  uint64_t v10;
  double v11;
  UIImageView *v12;
  UIImageView *backgroundPlaceholderView;
  UIImageView *v14;
  UIImageView *backgroundView;
  WLEasyToHitCustomView *v16;
  UIView *contentView;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PKPassFaceView;
  v4 = -[PKPassFaceView initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    *(_WORD *)&v4->_flags |= 7u;
    if (PKIsLowEndDevice())
    {
      v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      shadowBackgroundView = v5->_shadowBackgroundView;
      v5->_shadowBackgroundView = v6;

      -[UIImageView layer](v5->_shadowBackgroundView, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.09803922, 1.0);
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v10 = objc_msgSend(v9, "CGColor");

      objc_msgSend(v8, "setContentsMultiplyColor:", v10);
      LODWORD(v11) = 0;
      objc_msgSend(v8, "setOpacity:", v11);
      -[UIImageView setClipsToBounds:](v5->_shadowBackgroundView, "setClipsToBounds:", 0);
      -[PKPassFaceView addSubview:](v5, "addSubview:", v5->_shadowBackgroundView);

    }
    v12 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    backgroundPlaceholderView = v5->_backgroundPlaceholderView;
    v5->_backgroundPlaceholderView = v12;

    -[PKPassFaceView addSubview:](v5, "addSubview:", v5->_backgroundPlaceholderView);
    v14 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    backgroundView = v5->_backgroundView;
    v5->_backgroundView = v14;

    -[PKPassFaceView addSubview:](v5, "addSubview:", v5->_backgroundView);
    -[WLEasyToHitCustomView setMargins:](v5, "setMargins:", 0.0, 0.0, 20.0, 20.0);
    v16 = objc_alloc_init(WLEasyToHitCustomView);
    contentView = v5->_contentView;
    v5->_contentView = &v16->super;

    -[UIView setMargins:](v5->_contentView, "setMargins:", 0.0, 0.0, 20.0, 20.0);
    -[PKPassFaceView addSubview:](v5, "addSubview:", v5->_contentView);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v5, sel__handleTimeOrLocaleChange_, *MEMORY[0x1E0DC4838], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v5, sel__handleTimeOrLocaleChange_, *MEMORY[0x1E0C99720], 0);

    -[PKPassFaceView layer](v5, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "scale");
    objc_msgSend(v20, "setRasterizationScale:");

  }
  return v5;
}

+ (id)newFrontFaceViewForStyle:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "_faceClassForStyle:")), "initWithStyle:", a3);
}

+ (Class)_faceClassForStyle:(int64_t)a3
{
  void *v3;

  if ((unint64_t)a3 > 9 || ((0x3D7u >> a3) & 1) == 0 || (v3 = (void *)objc_opt_class()) == 0)
    v3 = (void *)objc_opt_class();
  return (Class)v3;
}

- (void)setModallyPresented:(BOOL)a3
{
  if (self->_modallyPresented != a3)
  {
    self->_modallyPresented = a3;
    -[PKPassFaceView _loadFaceImageIfNecessary](self, "_loadFaceImageIfNecessary");
    if (self->_modallyPresented)
      -[PKPassFaceView didPresent](self, "didPresent");
    else
      -[PKPassFaceView didDismiss](self, "didDismiss");
  }
}

- (void)createHeaderContentViews
{
  NSMutableArray *v3;
  NSMutableArray *headerBucketViews;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  PKPassBucketView *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[PKPassFaceView _createBucketsIfNecessary](self, "_createBucketsIfNecessary");
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  headerBucketViews = self->_headerBucketViews;
  self->_headerBucketViews = v3;

  -[PKPassFaceView pass](self, "pass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cobrandLogoRect");
  self->_cobrandLogoSize.width = v6;
  self->_cobrandLogoSize.height = v7;

  -[NSArray objectAtIndex:](self->_buckets, "objectAtIndex:", 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    v8 = objc_alloc_init(PKPassBucketView);
    -[PKPassFaceView pass](self, "pass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassBucketView setPass:](v8, "setPass:", v9);

    -[PKPassFaceView headerTemplate](self, "headerTemplate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassBucketView setBucketTemplate:](v8, "setBucketTemplate:", v10);

    -[PKPassFaceView colorProfile](self, "colorProfile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassBucketView setColorProfile:](v8, "setColorProfile:", v11);

    -[PKPassBucketView setBucket:](v8, "setBucket:", v12);
    -[PKPassFaceView insertContentView:ofType:](self, "insertContentView:ofType:", v8, 0);
    -[NSMutableArray addObject:](self->_headerBucketViews, "addObject:", v8);

  }
}

void __43__PKPassFaceView__loadFaceImageIfNecessary__block_invoke_3(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id *v30;

  v3 = a2;
  v30 = v3;
  if (((_WORD)v3[62] & 0x400) == 0)
  {
    *((_WORD *)v3 + 248) |= 0x600u;
    v4 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(v3[56], "frontFaceImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageWithPKImage:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v30[68];
    v30[68] = (id)v6;

    v8 = (void *)MEMORY[0x1E0DC3658];
    objc_msgSend(v30[56], "frontFaceImageAverageColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pkui_colorWithPKColor:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v30[77];
    v30[77] = (id)v10;

    PKPassFaceShadowInsets();
    v30[69] = v12;
    v30[70] = v13;
    v30[71] = v14;
    v30[72] = v15;
    objc_msgSend(v30[68], "size");
    v18 = v17 - (*((double *)v30 + 69) + *((double *)v30 + 71));
    v19 = *(double *)(a1 + 48);
    v20 = *(double *)(a1 + 40) - (v16 - (*((double *)v30 + 70) + *((double *)v30 + 72)));
    v30[73] = 0;
    *((double *)v30 + 75) = v19 - v18;
    PKFloatRoundToPixel();
    *((double *)v30 + 74) = v21;
    *((double *)v30 + 76) = v20 - v21;
    v22 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(v30[56], "frontFaceShadowImage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "imageWithPKImage:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v30[78];
    v30[78] = (id)v24;

    v26 = v30[79];
    v30[79] = 0;

    v27 = v30[67];
    v30[67] = 0;

    v28 = v30[64];
    if (v28)
    {
      objc_msgSend(v28, "removeFromSuperview");
      v29 = v30[64];
      v30[64] = 0;

    }
    if ((objc_msgSend(v30[95], "isLoaded") & 1) == 0)
      objc_msgSend(v30[95], "loadContent");
    objc_msgSend(v30, "setNeedsLayout");
  }

}

void __43__PKPassFaceView__loadFaceImageIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  _WORD *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD *v13;

  v3 = a2;
  v4 = v3[248];
  if ((v4 & 0x1000) == 0)
  {
    v3[248] = v4 | 0x1000;
    if ((v4 & 0xC00) == 0)
    {
      v13 = v3;
      v5 = *(_QWORD *)(a1 + 32);
      os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_5_2);
      if (!qword_1EE4F8FD0)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "pk_copiedToWeakObjectsMapTable");
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = (void *)qword_1EE4F8FD0;
        qword_1EE4F8FD0 = v6;

      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)qword_1EE4F8FD0, "objectForKey:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        v10 = (void *)MEMORY[0x1E0DC3870];
        PKPassGrayPlaceholderImage();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "imageWithPKImage:", v11);
        v9 = objc_claimAutoreleasedReturnValue();

        objc_msgSend((id)qword_1EE4F8FD0, "setObject:forKey:", v9, v8);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_5_2);

      v12 = (void *)v13[67];
      v13[67] = v9;

      objc_msgSend(v13, "setNeedsLayout");
      v3 = v13;
    }
  }

}

void __43__PKPassFaceView__loadFaceImageIfNecessary__block_invoke_4(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __43__PKPassFaceView__loadFaceImageIfNecessary__block_invoke_5;
  v2[3] = &unk_1E3E61C80;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

  objc_destroyWeak(&v4);
}

- (NSArray)buckets
{
  return self->_buckets;
}

- (PKPassFaceView)init
{

  return 0;
}

- (PKPassFaceView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (PKPassFaceView)initWithCoder:(id)a3
{

  return 0;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  PKPaymentService *paymentService;
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4838], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0C99720], 0);

  paymentService = self->_paymentService;
  if (paymentService)
  {
    -[PKPaymentService setDelegate:](paymentService, "setDelegate:", 0);
    +[PKUIForegroundActiveArbiter sharedInstance](PKUIForegroundActiveArbiter, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unregisterObserver:", self);

  }
  -[PKPassFaceView invalidate](self, "invalidate");
  v7.receiver = self;
  v7.super_class = (Class)PKPassFaceView;
  -[PKPassFaceView dealloc](&v7, sel_dealloc);
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    -[PKPassFaceView didInvalidate](self, "didInvalidate");
  }
}

- (void)didInvalidate
{
  -[PKTransactionDataOverlayCardFaceView invalidate](self->_transactionDataOverlayView, "invalidate");
  -[PKLiveRenderedCardFaceView invalidate](self->_liveBackgroundView, "invalidate");
  -[PKDynamicLayerView invalidate](self->_dynamicCardView, "invalidate");
}

- (void)removeContentView:(id)a3 ofType:(int64_t)a4
{
  id v6;
  UIView *v7;
  UIView *contentView;
  id v9;
  id v10;

  v6 = a3;
  if (v6)
  {
    v10 = v6;
    objc_msgSend(v6, "superview");
    v7 = (UIView *)objc_claimAutoreleasedReturnValue();
    contentView = self->_contentView;

    if (v7 == contentView)
      objc_msgSend(v10, "removeFromSuperview");
    v9 = -[PKPassFaceView _viewSetForContentViewType:](self, "_viewSetForContentViewType:", a4);
    objc_msgSend(v9, "removeObject:", v10);

    -[PKPassFaceView setNeedsLayout](self, "setNeedsLayout");
    v6 = v10;
  }

}

- (BOOL)isPaused
{
  return self->_paused;
}

- (BOOL)bodyContentCreated
{
  return (LOBYTE(self->_contentViewCreatedRegions) >> 2) & 1;
}

- (void)_createDimmingFilterIfNecessary
{
  void *v3;
  id v4;
  CAFilter *v5;
  CAFilter *dimmingFilter;
  CAFilter *v7;
  id v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (!self->_dimmingFilter)
  {
    -[PKPassFaceView layer](self, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc(MEMORY[0x1E0CD2780]);
    v5 = (CAFilter *)objc_msgSend(v4, "initWithType:", *MEMORY[0x1E0CD2E60]);
    dimmingFilter = self->_dimmingFilter;
    self->_dimmingFilter = v5;

    -[CAFilter setName:](self->_dimmingFilter, "setName:", CFSTR("dimmingFilter"));
    v7 = self->_dimmingFilter;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0 - self->_dimmer);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAFilter setValue:forKey:](v7, "setValue:forKey:", objc_msgSend(v8, "CGColor"), CFSTR("inputColor"));

    v10[0] = self->_dimmingFilter;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFilters:", v9);

  }
}

uint64_t __45__PKPassFaceView_createContentViewsWithFade___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setContentViewsAlpha:", 1.0);
}

- (void)presentDiff:(id)a3 completion:(id)a4
{
  _BOOL8 clipsContent;
  id v7;
  id v8;
  id v9;

  if (a3)
    clipsContent = 1;
  else
    clipsContent = self->_clipsContent;
  v7 = a4;
  v8 = a3;
  -[PKPassFaceView setClipsToBounds:](self, "setClipsToBounds:", clipsContent);
  -[NSMutableArray arrayByAddingObjectsFromArray:](self->_headerBucketViews, "arrayByAddingObjectsFromArray:", self->_bodyBucketViews);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPassFaceView _presentDiffRecursivelyDiff:forBucketAtIndex:withBuckets:completion:](self, "_presentDiffRecursivelyDiff:forBucketAtIndex:withBuckets:completion:", v8, 0, v9, v7);

}

- (void)_presentDiffRecursivelyDiff:(id)a3 forBucketAtIndex:(unint64_t)a4 withBuckets:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  void (**v17)(_QWORD);
  id v18[2];
  id location;

  v10 = a3;
  v11 = a5;
  v12 = (void (**)(_QWORD))a6;
  if (objc_msgSend(v11, "count") <= a4)
  {
    if (v12)
      v12[2](v12);
  }
  else
  {
    objc_initWeak(&location, self);
    objc_msgSend(v11, "objectAtIndex:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __86__PKPassFaceView__presentDiffRecursivelyDiff_forBucketAtIndex_withBuckets_completion___block_invoke;
    v14[3] = &unk_1E3E62A90;
    objc_copyWeak(v18, &location);
    v15 = v10;
    v18[1] = (id)a4;
    v16 = v11;
    v17 = v12;
    objc_msgSend(v13, "presentDiff:inView:completion:", v15, self, v14);

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }

}

void __86__PKPassFaceView__presentDiffRecursivelyDiff_forBucketAtIndex_withBuckets_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_presentDiffRecursivelyDiff:forBucketAtIndex:withBuckets:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64) + 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)updateShadow:(double)a3 animated:(BOOL)a4 withDelay:(double)a5
{
  _BOOL4 v6;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  PKRemoveableAnimationTrackerStore *delayedAnimations;
  PKRemoveableAnimationTrackerStore *v15;
  PKRemoveableAnimationTrackerStore *v16;
  id v17;

  v6 = a4;
  -[PKRemoveableAnimationTrackerStore preempt](self->_delayedAnimations, "preempt");
  -[UIImageView layer](self->_shadowBackgroundView, "layer");
  v9 = a3 * 0.27;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "opacity");
  if (v6)
  {
    v11 = *(float *)&v10;
    if (v9 != *(float *)&v10)
    {
      objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("opacity"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setBeginTime:", a5);
      objc_msgSend(v12, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v11, v9);
      objc_msgSend(v12, "duration");
      objc_msgSend(v12, "setDuration:", fmax(v13 + a5, 0.0));
      delayedAnimations = self->_delayedAnimations;
      if (!delayedAnimations)
      {
        v15 = (PKRemoveableAnimationTrackerStore *)objc_alloc_init(MEMORY[0x1E0D675A8]);
        v16 = self->_delayedAnimations;
        self->_delayedAnimations = v15;

        delayedAnimations = self->_delayedAnimations;
      }

    }
  }
  *(float *)&v10 = v9;
  objc_msgSend(v17, "setOpacity:", v10);

}

void __50__PKPassFaceView_updateShadow_animated_withDelay___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  float v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "opacity");
  v7 = v6;
  objc_msgSend(v4, "fromValue");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "doubleValue");
  v9 = v8 + v7;
  *(float *)&v9 = v9;
  objc_msgSend(v5, "setOpacity:", v9);

}

- (id)passFaceTemplate
{
  return 0;
}

- (id)headerTemplate
{
  return 0;
}

- (CGSize)contentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (PKPassFaceViewRendererState)rendererState
{
  return (PKPassFaceViewRendererState *)-[PKTransactionDataOverlayCardFaceView rendererState](self->_transactionDataOverlayView, "rendererState");
}

- (BOOL)showsLiveRendering
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)setShowsLiveRendering:(BOOL)a3
{
  -[PKPassFaceView setShowsLiveRendering:rendererState:](self, "setShowsLiveRendering:rendererState:", a3, 0);
}

- (void)didPresent
{
  -[PKLiveRenderedCardFaceView didPresent](self->_liveBackgroundView, "didPresent");
}

- (void)didDismiss
{
  -[PKLiveRenderedCardFaceView didDismiss](self->_liveBackgroundView, "didDismiss");
}

- (void)didAuthenticate
{
  -[PKLiveRenderedCardFaceView didAuthenticate](self->_liveBackgroundView, "didAuthenticate");
  -[PKTransactionDataOverlayCardFaceView setContentSuppressed:](self->_transactionDataOverlayView, "setContentSuppressed:", 0);
}

- (void)didTransact
{
  -[PKDynamicLayerView runTransactionEffect](self->_dynamicCardView, "runTransactionEffect");
}

- (void)_flushContentViewsForRegions:(unint64_t)a3
{
  unint64_t contentViewCreatedRegions;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableSet *headerContentViews;
  NSMutableSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableSet *bodyContentViews;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  contentViewCreatedRegions = self->_contentViewCreatedRegions;
  if ((contentViewCreatedRegions & 2) != 0)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v5 = self->_headerContentViews;
    v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v9++), "removeFromSuperview");
        }
        while (v7 != v9);
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v7);
    }

    headerContentViews = self->_headerContentViews;
    self->_headerContentViews = 0;

    contentViewCreatedRegions = self->_contentViewCreatedRegions & 0xFFFFFFFFFFFFFFFDLL;
    self->_contentViewCreatedRegions = contentViewCreatedRegions;
  }
  if ((contentViewCreatedRegions & 4) != 0)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = self->_bodyContentViews;
    v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15++), "removeFromSuperview", (_QWORD)v17);
        }
        while (v13 != v15);
        v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v13);
    }

    bodyContentViews = self->_bodyContentViews;
    self->_bodyContentViews = 0;

    self->_contentViewCreatedRegions &= ~4uLL;
  }
}

- (void)_setContentViewsAlpha:(double)a3
{
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableSet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_headerContentViews;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v9++), "setAlpha:", a3);
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_bodyContentViews;
  v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "setAlpha:", a3, (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

void __43__PKPassFaceView__loadFaceImageIfNecessary__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    *((_WORD *)WeakRetained + 248) &= ~0x8000u;
    v4 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v3 = v4;
  }

}

void __43__PKPassFaceView__loadFaceImageIfNecessary__block_invoke_6(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __43__PKPassFaceView__loadFaceImageIfNecessary__block_invoke_7;
  v2[3] = &unk_1E3E61C80;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

  objc_destroyWeak(&v4);
}

void __43__PKPassFaceView__loadFaceImageIfNecessary__block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    *((_WORD *)WeakRetained + 248) &= ~0x4000u;
    v4 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v3 = v4;
  }

}

- (id)_relevantBuckets
{
  return 0;
}

- (void)_updateForeignBalances
{
  PKPaymentService *paymentService;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  if (self->_paymentService)
  {
    objc_initWeak(&location, self);
    paymentService = self->_paymentService;
    -[PKPassFaceView pass](self, "pass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__PKPassFaceView__updateForeignBalances__block_invoke;
    v6[3] = &unk_1E3E62B38;
    objc_copyWeak(&v7, &location);
    -[PKPaymentService balancesForPaymentPassWithUniqueIdentifier:completion:](paymentService, "balancesForPaymentPassWithUniqueIdentifier:completion:", v5, v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __40__PKPassFaceView__updateForeignBalances__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__PKPassFaceView__updateForeignBalances__block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __40__PKPassFaceView__updateForeignBalances__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_setBalances:", *(_QWORD *)(a1 + 32));

}

- (void)_setBalances:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  char v29;
  void *v30;
  PKPassFaceView *v31;
  uint64_t v32;
  NSArray *v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  id v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v31 = self;
  if (self->_paymentService && objc_msgSend(v4, "count"))
  {
    v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v48 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_msgSend(v11, "identifiers");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v37, "setObject:forKeyedSubscript:", v11, v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      }
      while (v8);
    }

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v13 = v31->_buckets;
    v34 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    if (v34)
    {
      v30 = v5;
      v36 = 0;
      v32 = *(_QWORD *)v44;
      v33 = v13;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v44 != v32)
            objc_enumerationMutation(v13);
          v35 = v14;
          v15 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v14);
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          obj = v15;
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v40;
            do
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v40 != v18)
                  objc_enumerationMutation(obj);
                v20 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
                if (objc_msgSend(v20, "foreignReferenceType") == 1)
                {
                  objc_msgSend(v20, "foreignReferenceIdentifiers");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v21)
                  {
                    objc_msgSend(v37, "objectForKeyedSubscript:", v21);
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    v23 = v22;
                    if (v22)
                    {
                      objc_msgSend(v22, "localizedTitle");
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v23, "formattedValue");
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      v25 = 0;
                      v24 = 0;
                    }
                    objc_msgSend(v20, "label");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v27 = PKEqualObjects();

                    if ((v27 & 1) == 0)
                    {
                      objc_msgSend(v20, "setLabel:", v24);
                      v36 = 1;
                    }
                    objc_msgSend(v20, "value");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    v29 = PKEqualObjects();

                    if ((v29 & 1) == 0)
                    {
                      objc_msgSend(v20, "setUnformattedValue:", v25);
                      objc_msgSend(v20, "flushCachedValue");
                      v36 = 1;
                    }

                  }
                }
              }
              v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
            }
            while (v17);
          }

          v14 = v35 + 1;
          v13 = v33;
        }
        while (v35 + 1 != v34);
        v34 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      }
      while (v34);

      v5 = v30;
      if ((v36 & 1) != 0)
        -[PKPassFaceView _recreateFieldDerivedContent](v31, "_recreateFieldDerivedContent");
    }
    else
    {

    }
  }

}

- (void)_recreateFieldDerivedContent
{
  unint64_t v3;

  v3 = self->_contentViewCreatedRegions & 6;
  -[PKPassFaceView _flushContentViewsForRegions:](self, "_flushContentViewsForRegions:", 6);
  -[PKPassFaceView _createContentViewsForRegions:](self, "_createContentViewsForRegions:", v3);
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PKPassFaceView_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke;
  block[3] = &unk_1E3E61400;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __74__PKPassFaceView_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "pass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = PKEqualObjects();

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "_setBalances:", *(_QWORD *)(a1 + 48));
}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
  if (self->_foregroundActive != ((*(_QWORD *)&a4.var0 >> 8) & 1))
  {
    self->_foregroundActive = (unsigned __int16)(*(_WORD *)&a4 & 0x100) >> 8;
    if ((*(_WORD *)&a4 & 0x100) != 0)
      -[PKPassFaceView _updateForeignBalances](self, "_updateForeignBalances", a3);
  }
}

- (void)_handleTimeOrLocaleChange:(id)a3
{
  void *v4;
  NSArray *buckets;

  -[PKPassFaceView pass](self, "pass", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flushFormattedFieldValues");

  if (self->_style == 9)
  {
    buckets = self->_buckets;
    self->_buckets = 0;

  }
  -[PKPassFaceView _recreateFieldDerivedContent](self, "_recreateFieldDerivedContent");
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (int64_t)backgroundMode
{
  return self->_backgroundMode;
}

- (unint64_t)visibleRegions
{
  return self->_visibleRegions;
}

- (BOOL)modallyPresented
{
  return self->_modallyPresented;
}

- (BOOL)clipsContent
{
  return self->_clipsContent;
}

- (double)clippedContentHeight
{
  return self->_clippedContentHeight;
}

- (BOOL)liveMotionEnabled
{
  return self->_liveMotionEnabled;
}

- (void)setViewExpanded:(BOOL)a3
{
  self->_viewExpanded = a3;
}

- (NSData)dynamicBarcodeData
{
  return self->_dynamicBarcodeData;
}

- (void)setDynamicBarcodeData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 840);
}

- (PKPassFaceViewDelegate)delegate
{
  return (PKPassFaceViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PKColor)averageFaceColor
{
  return self->_averageFaceColor;
}

- (void)setAverageFaceColor:(id)a3
{
  self->_averageFaceColor = (PKColor *)a3;
}

- (NSMutableArray)headerBucketViews
{
  return self->_headerBucketViews;
}

- (void)setHeaderBucketViews:(id)a3
{
  objc_storeStrong((id *)&self->_headerBucketViews, a3);
}

- (PKPassBucketTemplate)headerBucketTemplate
{
  return self->_headerBucketTemplate;
}

- (CGSize)cobrandLogoSize
{
  double width;
  double height;
  CGSize result;

  width = self->_cobrandLogoSize.width;
  height = self->_cobrandLogoSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIImageView)backgroundView
{
  return self->_backgroundView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buckets, 0);
  objc_storeStrong((id *)&self->_headerBucketTemplate, 0);
  objc_storeStrong((id *)&self->_faceTemplate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dynamicBarcodeData, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_primaryAccountNumberSuffixView, 0);
  objc_storeStrong((id *)&self->_dynamicCardView, 0);
  objc_storeStrong((id *)&self->_transactionDataOverlayView, 0);
  objc_storeStrong((id *)&self->_liveBackgroundView, 0);
  objc_storeStrong((id *)&self->_delayedAnimations, 0);
  objc_storeStrong((id *)&self->_bodyBucketViews, 0);
  objc_storeStrong((id *)&self->_headerBucketViews, 0);
  objc_storeStrong((id *)&self->_dimmingFilter, 0);
  objc_storeStrong((id *)&self->_partialFaceImage, 0);
  objc_storeStrong((id *)&self->_faceShadowImage, 0);
  objc_storeStrong((id *)&self->_faceImageAverageColor, 0);
  objc_storeStrong((id *)&self->_faceImage, 0);
  objc_storeStrong((id *)&self->_placeholderFaceImage, 0);
  objc_storeStrong((id *)&self->_shadowBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundPlaceholderView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_bodyContentViews, 0);
  objc_storeStrong((id *)&self->_headerContentViews, 0);
  objc_storeStrong((id *)&self->_bodyInvariantViews, 0);
  objc_storeStrong((id *)&self->_headerInvariantViews, 0);
  objc_storeStrong((id *)&self->_colorProfile, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
