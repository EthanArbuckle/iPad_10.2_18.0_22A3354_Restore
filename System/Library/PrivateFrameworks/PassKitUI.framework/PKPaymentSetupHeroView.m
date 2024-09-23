@implementation PKPaymentSetupHeroView

- (id)pk_childrenForAppearance
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (PKPaymentSetupHeroView)initWithContext:(int64_t)a3 heroImageController:(id)a4 heroImages:(id)a5
{
  return -[PKPaymentSetupHeroView initWithContext:heroImageController:heroImages:product:](self, "initWithContext:heroImageController:heroImages:product:", a3, a4, a5, 0);
}

- (PKPaymentSetupHeroView)initWithContext:(int64_t)a3 heroImageController:(id)a4 heroImages:(id)a5 product:(id)a6
{
  id v11;
  id v12;
  id v13;
  PKPaymentSetupHeroView *v14;
  PKPaymentSetupHeroView *v15;
  double v16;
  double v17;
  PKImageSequenceView *v18;
  PKImageSequenceView *cardCarouselView;
  id v20;
  void *v21;
  PKImageSequenceView *v22;
  uint64_t v23;
  PKImageSequenceView *v24;
  _QWORD v26[4];
  PKPaymentSetupHeroView *v27;
  id v28;
  uint64_t v29;
  double v30;
  objc_super v31;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v31.receiver = self;
  v31.super_class = (Class)PKPaymentSetupHeroView;
  v14 = -[PKPaymentSetupHeroView initWithFrame:](&v31, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v15 = v14;
  if (v14)
  {
    v14->_context = a3;
    objc_storeStrong((id *)&v14->_heroImageController, a4);
    objc_msgSend(MEMORY[0x1E0D67138], "cardAspectRatio");
    if (v13)
    {
      v17 = 300.0 / v16;
      v18 = -[PKImageSequenceView initWitImages:]([PKImageSequenceView alloc], "initWitImages:", 0);
      cardCarouselView = v15->_cardCarouselView;
      v15->_cardCarouselView = v18;

      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __81__PKPaymentSetupHeroView_initWithContext_heroImageController_heroImages_product___block_invoke;
      v26[3] = &unk_1E3E631C8;
      v27 = v15;
      v28 = v13;
      v29 = 0x4072C00000000000;
      v30 = v17;
      v20 = (id)objc_msgSend(v28, "digitalCardCachedImage:", v26);

      v21 = v27;
    }
    else
    {
      -[PKPaymentHeroImageController setDelegate:](v15->_heroImageController, "setDelegate:", v15);
      -[PKPaymentSetupHeroView _configureHeroCardsFromHeroImages:](v15, "_configureHeroCardsFromHeroImages:", v12);
      v22 = [PKImageSequenceView alloc];
      -[PKPaymentSetupHeroView _heroImages](v15, "_heroImages");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[PKImageSequenceView initWitImages:](v22, "initWitImages:", v21);
      v24 = v15->_cardCarouselView;
      v15->_cardCarouselView = (PKImageSequenceView *)v23;

    }
    -[PKPaymentSetupHeroView setClipsToBounds:](v15, "setClipsToBounds:", 0);
    -[PKPaymentSetupHeroView _createSubviews](v15, "_createSubviews");
  }

  return v15;
}

void __81__PKPaymentSetupHeroView_initWithContext_heroImageController_heroImages_product___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 472);
    v13[0] = a3;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = a3;
    objc_msgSend(v5, "arrayWithObjects:count:", v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateImages:", v7);
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __81__PKPaymentSetupHeroView_initWithContext_heroImageController_heroImages_product___block_invoke_2;
    v10[3] = &unk_1E3E631A0;
    v8 = *(void **)(a1 + 40);
    v11 = *(id *)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    v9 = (id)objc_msgSend(v8, "thumbnailCachedImageForSize:completion:", v10, *(double *)(a1 + 48), *(double *)(a1 + 56));

    v7 = 0;
    v6 = v11;
  }

}

void __81__PKPaymentSetupHeroView_initWithContext_heroImageController_heroImages_product___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 472);
  if (a3)
  {
    v8[0] = a3;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateImages:", v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_heroImages");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateImages:");

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
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
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (!PKPaymentSetupContextIsBridge())
  {
    if (!PKIsPad())
    {
      if (-[PKPaymentSetupHeroView _isSmallPhone](self, "_isSmallPhone"))
      {
        -[PKPaymentSetupHeroView bounds](self, "bounds");
        v9 = v8 * 0.560000002;
        objc_msgSend(MEMORY[0x1E0D67138], "cardAspectRatio");
        v11 = v9 / v10;
        -[PKPaymentSetupHeroView _phoneTopPadding](self, "_phoneTopPadding");
        v13 = v12 + v11;
        -[PKPaymentSetupHeroView _phoneCardHeightInset](self, "_phoneCardHeightInset");
        v7 = v14 + v13;
      }
      else
      {
        PKScreenSize();
        PKFloatRoundToPixel();
        v7 = v15;
      }
      goto LABEL_9;
    }
LABEL_5:
    v7 = 236.0;
LABEL_9:
    v6 = width;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  -[UIView sizeThatFits:](self->_heroDeviceView, "sizeThatFits:", width, height);
LABEL_10:
  result.height = v7;
  result.width = v6;
  return result;
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
  double v11;
  double v12;
  UIView *heroDeviceView;
  id v14;
  uint64_t v15;
  double v16;
  double v17;
  UIView *v18;
  id v19;
  void *v20;
  UIImageView *faceIDGlyphView;
  objc_super v22;
  CGRect v23;
  CGRect v24;

  v22.receiver = self;
  v22.super_class = (Class)PKPaymentSetupHeroView;
  -[PKPaymentSetupHeroView layoutSubviews](&v22, sel_layoutSubviews);
  -[PKPaymentSetupHeroView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView sizeThatFits:](self->_heroDeviceView, "sizeThatFits:", v7 * 0.560000002, 1.79769313e308);
  v12 = v11;
  if (PKPaymentSetupContextIsBridge())
  {
    heroDeviceView = self->_heroDeviceView;
    PKSizeAlignedInRect();
    -[UIView setFrame:](heroDeviceView, "setFrame:");
    -[UIView cardFrame](self->_heroDeviceView, "cardFrame");
    -[PKImageSequenceView setFrame:](self->_cardCarouselView, "setFrame:");
    -[PKImageSequenceView layer](self->_cardCarouselView, "layer");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    PKPaymentStyleApplyCorners();
  }
  else
  {
    if (PKIsPad())
    {
      -[UIView setFrame:](self->_heroDeviceView, "setFrame:", v4, v6, v8, v10);
      goto LABEL_9;
    }
    v15 = PKContentAlignmentMake();
    -[PKPaymentSetupHeroView _phoneTopPadding](self, "_phoneTopPadding");
    v17 = v10 - v16;
    v18 = self->_heroDeviceView;
    PKSizeAlignedInRect();
    -[UIView setFrame:](v18, "setFrame:");
    v14 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v14, "setBackgroundColor:", objc_msgSend(v19, "CGColor"));

    objc_msgSend(v14, "setFrame:", -50.0, -50.0, v12 + 100.0, v17 + 50.0);
    -[UIView layer](self->_heroDeviceView, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setMask:", v14);

    -[PKPaymentSetupHeroView _layoutCardCarouselWithAlignment:](self, "_layoutCardCarouselWithAlignment:", v15);
    if (self->_faceIDGlyphView)
    {
      -[PKImageSequenceView frame](self->_cardCarouselView, "frame");
      CGRectGetMaxY(v23);
      v24.origin.x = v4;
      v24.origin.y = v6;
      v24.size.width = v8;
      v24.size.height = v10;
      CGRectGetMaxY(v24);
      faceIDGlyphView = self->_faceIDGlyphView;
      PKSizeAlignedInRect();
      -[UIImageView setFrame:](faceIDGlyphView, "setFrame:");
    }
    -[PKPaymentSetupHeroView _layoutBottomDividerViewForBounds:](self, "_layoutBottomDividerViewForBounds:", v4, v6, v8, v10);
  }

LABEL_9:
  if ((PKPaymentSetupContextIsBridge() & 1) == 0)
  {
    -[UIView frame](self->_backgroundView, "frame");
    -[UIView setFrame:](self->_backgroundView, "setFrame:");
  }
}

- (void)_layoutCardCarouselWithAlignment:(id)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  PKImageSequenceView *cardCarouselView;
  id v15;
  id v16;
  CGRect v17;

  -[UIView frame](self->_heroDeviceView, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PKPaymentSetupHeroView _phoneCardHeightInset](self, "_phoneCardHeightInset");
  v13 = v12;
  v17.origin.x = v5;
  v17.origin.y = v7;
  v17.size.width = v9;
  v17.size.height = v11;
  CGRectInset(v17, 9.0, v13);
  objc_msgSend(MEMORY[0x1E0D67138], "cardAspectRatio");
  cardCarouselView = self->_cardCarouselView;
  PKSizeAlignedInRect();
  -[PKImageSequenceView setFrame:](cardCarouselView, "setFrame:");
  -[PKImageSequenceView layer](self->_cardCarouselView, "layer");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.1);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v15, "CGColor");
  PKPaymentStyleApplyCorners();

}

- (void)_layoutBottomDividerViewForBounds:(CGRect)a3
{
  double height;
  double width;
  double v6;

  height = a3.size.height;
  width = a3.size.width;
  v6 = PKUIPixelLength();
  -[UIView setFrame:](self->_bottomDividerView, "setFrame:", 0.0, height - v6, width, v6);
}

- (void)startAnimation
{
  -[PKImageSequenceView startAnimation](self->_cardCarouselView, "startAnimation");
}

- (void)stopAnimation
{
  -[PKImageSequenceView stopAnimation](self->_cardCarouselView, "stopAnimation");
}

- (void)heroImageController:(id)a3 didFinishDownloadingImageData:(id)a4 forImage:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  PKPaymentSetupHeroView *v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__PKPaymentSetupHeroView_heroImageController_didFinishDownloadingImageData_forImage_error___block_invoke;
  v15[3] = &unk_1E3E62460;
  v16 = v11;
  v17 = v9;
  v18 = v10;
  v19 = self;
  v12 = v10;
  v13 = v9;
  v14 = v11;
  dispatch_async(MEMORY[0x1E0C80D38], v15);

}

void __91__PKPaymentSetupHeroView_heroImageController_didFinishDownloadingImageData_forImage_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;

  if (!*(_QWORD *)(a1 + 32) && *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 496), "containsObject:") & 1) == 0)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 496), "addObject:", v8);
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66DF8]), "initWithData:scale:", *(_QWORD *)(a1 + 40), PKUIScreenScale());
    if (v2)
    {
      v3 = *(void **)(*(_QWORD *)(a1 + 56) + 504);
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithPKImage:", v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v4, v8);

    }
    v5 = *(_QWORD **)(a1 + 56);
    v6 = (void *)v5[59];
    objc_msgSend(v5, "_heroImages");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateImages:", v7);

  }
}

- (id)_heroImages
{
  id v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_heroImageIdentifiers;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary objectForKey:](self->_heroImagesDictionary, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)_configureHeroCardsFromHeroImages:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void (**v10)(void *, _QWORD);
  id v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t j;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  NSMutableArray *v25;
  NSMutableArray *heroImageIdentifiers;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD aBlock[4];
  id v37;
  uint8_t buf[16];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[PKPaymentHeroImageController downloadImages:](self->_heroImageController, "downloadImages:", v4);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "No hero card images provided, using defaults.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D67138], "defaultImages");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "mutableCopy");

    v4 = (id)v7;
  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PKPaymentSetupHeroView__configureHeroCardsFromHeroImages___block_invoke;
  aBlock[3] = &unk_1E3E631F0;
  v9 = v8;
  v37 = v9;
  v10 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (!v12)
  {

LABEL_16:
    PKLogFacilityTypeGetObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v17, OS_LOG_TYPE_DEFAULT, "No hero card images downloaded, using defaults.", buf, 2u);
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(MEMORY[0x1E0D67138], "defaultImages", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v29 != v21)
            objc_enumerationMutation(v18);
          v10[2](v10, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
      }
      while (v20);
    }

    goto LABEL_26;
  }
  v13 = v12;
  v14 = 0;
  v15 = *(_QWORD *)v33;
  do
  {
    for (j = 0; j != v13; ++j)
    {
      if (*(_QWORD *)v33 != v15)
        objc_enumerationMutation(v11);
      v14 |= ((uint64_t (*)(void *, _QWORD))v10[2])(v10, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j));
    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  }
  while (v13);

  if ((v14 & 1) == 0)
    goto LABEL_16;
LABEL_26:
  objc_storeStrong((id *)&self->_heroImagesDictionary, v8);
  objc_msgSend(v9, "allKeys");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "pk_shuffledArray");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (NSMutableArray *)objc_msgSend(v24, "mutableCopy");
  heroImageIdentifiers = self->_heroImageIdentifiers;
  self->_heroImageIdentifiers = v25;

  -[PKPaymentHeroImageController primaryImageIdentifier](self->_heroImageController, "primaryImageIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    -[NSMutableArray removeObject:](self->_heroImageIdentifiers, "removeObject:", v27);
    -[NSMutableArray insertObject:atIndex:](self->_heroImageIdentifiers, "insertObject:atIndex:", v27, 0);
  }

}

uint64_t __60__PKPaymentSetupHeroView__configureHeroCardsFromHeroImages___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(v3, "imageWithScale:", PKUIScreenScale());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66DF8]), "initWithData:scale:", v4, PKUIScreenScale())) != 0)
  {
    v6 = (void *)v5;
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithPKImage:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

    v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_createSubviews
{
  int IsAvailable;
  PKWatchHeroImageView *v4;
  UIView *heroDeviceView;
  int v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PKPhoneHeroImageView *v12;
  UIView *v13;
  PKPhoneHeroView *v14;
  UIView *v15;
  UIView *v16;
  UIView *v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  id v23;
  double v24;
  void *v25;
  UIImageView *v26;
  UIImageView *faceIDGlyphView;
  UIView *v28;
  UIView *bottomDividerView;
  UIView *v30;
  UIView *v31;
  UIView *backgroundView;
  UIView *v33;
  void *v34;

  IsAvailable = PKPearlIsAvailable();
  if ((PKPaymentSetupContextIsBridge() & 1) != 0)
  {
    v4 = objc_alloc_init(PKWatchHeroImageView);
    heroDeviceView = self->_heroDeviceView;
    self->_heroDeviceView = &v4->super;

    -[UIView setContentMode:](self->_heroDeviceView, "setContentMode:", 2);
    -[UIView addSubview:](self->_heroDeviceView, "addSubview:", self->_cardCarouselView);
    v6 = 0;
  }
  else
  {
    v7 = PKIsPad();
    if (v7)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("HeroPad"));
      v9 = v8;
      if (IsAvailable)
        objc_msgSend(v8, "appendString:", CFSTR("-FaceID"));
      objc_msgSend(v9, "stringByAppendingString:", CFSTR("-Dark"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PKUIDynamicImageNamed(v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = -[PKPhoneHeroImageView initWithImage:]([PKPhoneHeroImageView alloc], "initWithImage:", v11);
      v13 = self->_heroDeviceView;
      self->_heroDeviceView = &v12->super;

      -[UIView setContentMode:](self->_heroDeviceView, "setContentMode:", 1);
    }
    else
    {
      v14 = [PKPhoneHeroView alloc];
      v15 = -[PKPhoneHeroView initWithFrame:](v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v16 = self->_heroDeviceView;
      self->_heroDeviceView = v15;

      v17 = self->_heroDeviceView;
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v17, "setBackgroundColor:", v18);

      if (!-[PKPaymentSetupHeroView _isSmallPhone](self, "_isSmallPhone"))
      {
        v19 = CFSTR("TouchIDIcon");
        if (IsAvailable)
          v19 = CFSTR("PearlIDIcon");
        v20 = v19;
        PKPassKitUIBundle();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "URLForResource:withExtension:", v20, CFSTR("pdf"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = objc_alloc(MEMORY[0x1E0DC3890]);
        v24 = PKUIScreenScale();
        PKUIImageFromPDF(v22, 40.0, 40.0, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (UIImageView *)objc_msgSend(v23, "initWithImage:", v25);
        faceIDGlyphView = self->_faceIDGlyphView;
        self->_faceIDGlyphView = v26;

      }
      v28 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      bottomDividerView = self->_bottomDividerView;
      self->_bottomDividerView = v28;

      v30 = self->_bottomDividerView;
      objc_msgSend((id)objc_opt_class(), "assetBackgroundColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v30, "setBackgroundColor:", v9);
    }

    v6 = v7 ^ 1;
    v31 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    backgroundView = self->_backgroundView;
    self->_backgroundView = v31;

    v33 = self->_backgroundView;
    objc_msgSend((id)objc_opt_class(), "assetBackgroundColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v33, "setBackgroundColor:", v34);

    -[PKPaymentSetupHeroView addSubview:](self, "addSubview:", self->_backgroundView);
  }
  -[PKPaymentSetupHeroView addSubview:](self, "addSubview:", self->_heroDeviceView);
  if (self->_faceIDGlyphView)
    -[PKPaymentSetupHeroView addSubview:](self, "addSubview:");
  if (self->_bottomDividerView)
    -[PKPaymentSetupHeroView addSubview:](self, "addSubview:");
  if (v6)
    -[PKPaymentSetupHeroView addSubview:](self, "addSubview:", self->_cardCarouselView);
}

- (CGSize)_watchCardCarouselSizeForSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  unint64_t v8;
  double *v9;
  double *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIView *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (PKPaymentSetupContextIsBridge())
  {
    -[UIView sizeThatFits:](self->_heroDeviceView, "sizeThatFits:", width, height);
  }
  else
  {
    v8 = PKUIGetMinScreenType();
    v9 = (double *)((char *)&unk_19DF14CC0 + 8 * v8);
    v10 = (double *)((char *)&unk_19DF14D50 + 8 * v8);
    if (v8 >= 0x12)
    {
      v10 = (double *)(MEMORY[0x1E0C9D820] + 8);
      v9 = (double *)MEMORY[0x1E0C9D820];
    }
    v6 = *v9;
    v7 = *v10;
  }
  -[PKPaymentHeroImageController cardArtSizeForSize:](self->_heroImageController, "cardArtSizeForSize:", v6, v7);
  v12 = v11;
  v14 = v13;
  if (PKPaymentSetupContextIsBridge())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = self->_heroDeviceView;
      -[UIView setNeedsLayout](v15, "setNeedsLayout");
      -[UIView layoutIfNeeded](v15, "layoutIfNeeded");
      -[UIView watchScreenFrame](v15, "watchScreenFrame");
      v12 = v16;

      +[PKBridgeWatchAttributeController heroWatchSize](PKBridgeWatchAttributeController, "heroWatchSize");
      UIRoundToViewScale();
      v14 = v17;
    }
  }
  v18 = v12;
  v19 = v14;
  result.height = v19;
  result.width = v18;
  return result;
}

- (double)_instructionFontSizeForContext:(int64_t)a3
{
  int IsAvailable;
  double result;

  IsAvailable = PKPearlIsAvailable();
  result = 5.0;
  if (IsAvailable)
    return 5.5;
  return result;
}

- (BOOL)_isSmallPhone
{
  return PKUIGetMinScreenWidthType() == 0;
}

- (double)_phoneTopPadding
{
  _BOOL4 v2;
  double result;

  v2 = -[PKPaymentSetupHeroView _isSmallPhone](self, "_isSmallPhone");
  result = 20.0;
  if (v2)
    return 0.0;
  return result;
}

- (double)_phoneCardHeightInset
{
  char isKindOfClass;
  double result;
  double v5;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  result = 0.0;
  if ((isKindOfClass & 1) != 0)
  {
    -[UIView deviceCornerRadius](self->_heroDeviceView, "deviceCornerRadius", 0.0);
    return v5 + 5.0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heroImagesDictionary, 0);
  objc_storeStrong((id *)&self->_heroImageIdentifiers, 0);
  objc_storeStrong((id *)&self->_faceIDGlyphView, 0);
  objc_storeStrong((id *)&self->_heroImageController, 0);
  objc_storeStrong((id *)&self->_cardCarouselView, 0);
  objc_storeStrong((id *)&self->_heroDeviceView, 0);
  objc_storeStrong((id *)&self->_bottomDividerView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
