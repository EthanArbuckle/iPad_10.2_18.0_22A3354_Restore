@implementation PKTransactionDataOverlayCardFaceView

- (void)setMotionEnabled:(BOOL)a3
{
  -[PKCategoryVisualizationCardView setMotionEnabled:](self->_overlayView, "setMotionEnabled:", a3);
}

- (PKTransactionDataOverlayCardFaceView)initWithFrame:(CGRect)a3 pass:(id)a4 rendererState:(id)a5
{
  return -[PKTransactionDataOverlayCardFaceView initWithFrame:pass:rendererState:fetchInitialContentSynchronously:](self, "initWithFrame:pass:rendererState:fetchInitialContentSynchronously:", a4, a5, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setPaused:(BOOL)a3
{
  -[PKCategoryVisualizationCardView setPaused:](self->_overlayView, "setPaused:", a3);
}

- (PKTransactionDataOverlayCardFaceView)initWithFrame:(CGRect)a3 pass:(id)a4 rendererState:(id)a5 fetchInitialContentSynchronously:(BOOL)a6
{
  double height;
  double width;
  double y;
  double x;
  PKTransactionDataOverlayCardFaceView *v13;
  PKTransactionDataOverlayCardFaceView *v14;
  uint64_t v15;
  PKPaymentService *paymentService;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  PKCategoryVisualizationCardView *overlayView;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  PKCategoryVisualizationCardView *v33;
  void *v34;
  void *v35;
  void *v36;
  int *p_unlockNotifyToken;
  void *v38;
  void *v39;
  void *v40;
  const char *v41;
  NSObject *v42;
  id v43;
  NSObject *v44;
  uint64_t v46;
  _BOOL4 v47;
  PKCategoryVisualizationCardView *v48;
  id *p_pass;
  void *v50;
  id v51;
  id v52;
  _QWORD aBlock[4];
  id v54;
  id location;
  objc_super v56;
  uint8_t buf[4];
  PKTransactionDataOverlayCardFaceView *v58;
  _QWORD v59[10];

  v47 = a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v59[8] = *MEMORY[0x1E0C80C00];
  v51 = a4;
  v52 = a5;
  v56.receiver = self;
  v56.super_class = (Class)PKTransactionDataOverlayCardFaceView;
  v13 = -[PKTransactionDataOverlayCardFaceView initWithFrame:](&v56, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    p_pass = (id *)&v13->_pass;
    objc_storeStrong((id *)&v13->_pass, a4);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D672B0]), "initWithDelegate:", v14);
    paymentService = v14->_paymentService;
    v14->_paymentService = (PKPaymentService *)v15;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTransactionDataOverlayCardFaceView setBackgroundColor:](v14, "setBackgroundColor:", v17);

    -[PKTransactionDataOverlayCardFaceView layer](v14, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PKPassFrontFaceContentSize();
    objc_msgSend((id)objc_opt_class(), "borderWidth");
    objc_msgSend((id)objc_opt_class(), "borderColor");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v19, "CGColor");
    PKPaymentStyleApplyCorners();

    v14->_contentSuppressed = PKDeviceLocked();
    v20 = objc_alloc(MEMORY[0x1E0D6BFE8]);
    -[PKTransactionDataOverlayCardFaceView bounds](v14, "bounds");
    v21 = objc_msgSend(v20, "initWithFrame:");
    overlayView = v14->_overlayView;
    v14->_overlayView = (PKCategoryVisualizationCardView *)v21;

    -[PKCategoryVisualizationCardView setBlurDisabled:](v14->_overlayView, "setBlurDisabled:", PKBroadwayDisableDynamicCardBlur());
    v48 = v14->_overlayView;
    PKBrightColorForMerchantCategory(0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v50;
    PKBrightColorForMerchantCategory(1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v59[1] = v23;
    PKBrightColorForMerchantCategory(2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v59[2] = v24;
    PKBrightColorForMerchantCategory(3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v59[3] = v25;
    PKBrightColorForMerchantCategory(4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v59[4] = v26;
    PKBrightColorForMerchantCategory(5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v59[5] = v27;
    PKBrightColorForMerchantCategory(6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v59[6] = v28;
    PKBrightColorForMerchantCategory(7);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v59[7] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 8);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKCategoryVisualizationCardView setBucketColors:](v48, "setBucketColors:", v30);

    -[PKTransactionDataOverlayCardFaceView addSubview:](v14, "addSubview:", v14->_overlayView);
    -[PKPass liveRenderedImageSet](v14->_pass, "liveRenderedImageSet");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14->_contentSuppressed)
    {

      v32 = 0;
    }
    else
    {
      v32 = v52;
    }
    v52 = v32;
    -[PKCategoryVisualizationCardView renderWithTextures:rendererState:](v14->_overlayView, "renderWithTextures:rendererState:", v31, 440);
    if (!v14->_contentSuppressed)
    {
      if (v52 || !v47)
      {
        -[PKTransactionDataOverlayCardFaceView _updateMagnitudesWithStyle:completion:](v14, "_updateMagnitudesWithStyle:completion:", 0, 0);
      }
      else
      {
        v33 = v14->_overlayView;
        v34 = *(Class *)((char *)&v14->super.super.super.isa + v46);
        objc_msgSend(*p_pass, "uniqueID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "categoryVisualizationMagnitudesForPassUniqueID:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKCategoryVisualizationCardView setMagnitudes:withStyle:](v33, "setMagnitudes:withStyle:", v36, 0);

      }
    }
    p_unlockNotifyToken = &v14->_unlockNotifyToken;
    v14->_unlockNotifyToken = -1;
    +[PKUIForegroundActiveArbiter sharedInstance](PKUIForegroundActiveArbiter, "sharedInstance");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (v38)
    {
      v14->_foregroundActive = ((unsigned __int16)objc_msgSend(v38, "registerObserver:", v14) >> 8) & 1;
    }
    else
    {
      v14->_foregroundActive = 1;
      if (v14->_contentSuppressed)
      {
        objc_initWeak(&location, v14);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __106__PKTransactionDataOverlayCardFaceView_initWithFrame_pass_rendererState_fetchInitialContentSynchronously___block_invoke;
        aBlock[3] = &unk_1E3E62660;
        objc_copyWeak(&v54, &location);
        v40 = _Block_copy(aBlock);
        v41 = (const char *)*MEMORY[0x1E0D4E600];
        v42 = MEMORY[0x1E0C80D38];
        v43 = MEMORY[0x1E0C80D38];
        LODWORD(v41) = notify_register_dispatch(v41, &v14->_unlockNotifyToken, v42, v40);

        if ((_DWORD)v41)
        {
          PKLogFacilityTypeGetObject();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v58 = v14;
            _os_log_impl(&dword_19D178000, v44, OS_LOG_TYPE_DEFAULT, "PKTransactionDataOverlayCardFaceView (%p): failed to register for unlock notification.", buf, 0xCu);
          }

          if (*p_unlockNotifyToken != -1)
          {
            notify_cancel(*p_unlockNotifyToken);
            *p_unlockNotifyToken = -1;
          }
        }

        objc_destroyWeak(&v54);
        objc_destroyWeak(&location);
      }
    }

  }
  return v14;
}

+ (double)borderWidth
{
  return PKUIPixelLength() * 3.0;
}

+ (id)borderColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.21);
}

- (void)layoutSubviews
{
  PKCategoryVisualizationCardView *overlayView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKTransactionDataOverlayCardFaceView;
  -[PKTransactionDataOverlayCardFaceView layoutSubviews](&v4, sel_layoutSubviews);
  overlayView = self->_overlayView;
  -[PKTransactionDataOverlayCardFaceView bounds](self, "bounds");
  -[PKCategoryVisualizationCardView setFrame:](overlayView, "setFrame:");
}

- (PKTransactionDataOverlayCardFaceView)initWithFrame:(CGRect)a3 pass:(id)a4
{
  return -[PKTransactionDataOverlayCardFaceView initWithFrame:pass:rendererState:](self, "initWithFrame:pass:rendererState:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

void __106__PKTransactionDataOverlayCardFaceView_initWithFrame_pass_rendererState_fetchInitialContentSynchronously___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateContentIfPossible");
    WeakRetained = v2;
  }

}

- (void)dealloc
{
  objc_super v3;

  -[PKTransactionDataOverlayCardFaceView invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKTransactionDataOverlayCardFaceView;
  -[PKTransactionDataOverlayCardFaceView dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  void *v3;
  PKPaymentService *paymentService;
  int unlockNotifyToken;

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    +[PKUIForegroundActiveArbiter sharedInstance](PKUIForegroundActiveArbiter, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unregisterObserver:", self);

    -[PKCategoryVisualizationCardView invalidate](self->_overlayView, "invalidate");
    -[PKPaymentService setDelegate:](self->_paymentService, "setDelegate:", 0);
    paymentService = self->_paymentService;
    self->_paymentService = 0;

    unlockNotifyToken = self->_unlockNotifyToken;
    if (unlockNotifyToken != -1)
    {
      notify_cancel(unlockNotifyToken);
      self->_unlockNotifyToken = -1;
    }
  }
}

- (void)setContentSuppressed:(BOOL)a3
{
  if (((!self->_contentSuppressed ^ a3) & 1) == 0)
  {
    self->_contentSuppressed = a3;
    if (a3)
      -[PKCategoryVisualizationCardView setMagnitudes:withStyle:](self->_overlayView, "setMagnitudes:withStyle:", 0, 2);
    else
      -[PKTransactionDataOverlayCardFaceView _updateContentIfPossible](self, "_updateContentIfPossible");
  }
}

- (BOOL)isMotionEnabled
{
  return -[PKCategoryVisualizationCardView isMotionEnabled](self->_overlayView, "isMotionEnabled");
}

- (BOOL)isPaused
{
  return -[PKCategoryVisualizationCardView isPaused](self->_overlayView, "isPaused");
}

- (id)rendererState
{
  return (id)-[PKCategoryVisualizationCardView rendererState](self->_overlayView, "rendererState");
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateCategoryVisualizationWithStyle:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  int v9;
  id v10;

  v6 = a3;
  -[PKPass uniqueID](self->_pass, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6;
  v8 = v7;
  if (v8 == v10)
  {

  }
  else
  {
    if (!v10 || !v8)
    {

      goto LABEL_9;
    }
    v9 = objc_msgSend(v10, "isEqualToString:", v8);

    if (!v9)
      goto LABEL_9;
  }
  -[PKTransactionDataOverlayCardFaceView _updateMagnitudesWithStyle:completion:](self, "_updateMagnitudesWithStyle:completion:", a4, 0);
LABEL_9:

}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
  _BOOL8 v4;

  v4 = (*(_QWORD *)&a4.var0 >> 8) & 1;
  if (self->_foregroundActive != v4)
  {
    self->_foregroundActive = v4;
    -[PKTransactionDataOverlayCardFaceView _updateContentIfPossible](self, "_updateContentIfPossible", a3);
  }
}

- (void)_updateContentIfPossible
{
  char v3;
  int unlockNotifyToken;

  if (self->_foregroundActive)
  {
    if (!self->_contentSuppressed || (v3 = PKDeviceLocked(), self->_contentSuppressed = v3, (v3 & 1) == 0))
    {
      unlockNotifyToken = self->_unlockNotifyToken;
      if (unlockNotifyToken != -1)
      {
        notify_cancel(unlockNotifyToken);
        self->_unlockNotifyToken = -1;
      }
    }
    -[PKTransactionDataOverlayCardFaceView _updateMagnitudesWithStyle:completion:](self, "_updateMagnitudesWithStyle:completion:", 0, 0);
  }
}

- (void)_updateMagnitudesWithStyle:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  PKPaymentService *paymentService;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13[2];
  uint8_t buf[4];
  PKTransactionDataOverlayCardFaceView *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (self->_paymentService && !self->_contentSuppressed)
  {
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v15 = self;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "PKTransactionDataOverlayCardFaceView (%p): fetching magnitudes.", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    paymentService = self->_paymentService;
    -[PKPass uniqueID](self->_pass, "uniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __78__PKTransactionDataOverlayCardFaceView__updateMagnitudesWithStyle_completion___block_invoke;
    v11[3] = &unk_1E3E626B0;
    objc_copyWeak(v13, (id *)buf);
    v13[1] = (id)a3;
    v12 = v7;
    -[PKPaymentService categoryVisualizationMagnitudesForPassUniqueID:completion:](paymentService, "categoryVisualizationMagnitudesForPassUniqueID:completion:", v10, v11);

    objc_destroyWeak(v13);
    objc_destroyWeak((id *)buf);
  }
  else if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
  }

}

void __78__PKTransactionDataOverlayCardFaceView__updateMagnitudesWithStyle_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9[2];

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__PKTransactionDataOverlayCardFaceView__updateMagnitudesWithStyle_completion___block_invoke_2;
  v6[3] = &unk_1E3E62688;
  objc_copyWeak(v9, (id *)(a1 + 40));
  v4 = *(void **)(a1 + 48);
  v7 = v3;
  v9[1] = v4;
  v8 = *(id *)(a1 + 32);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

  objc_destroyWeak(v9);
}

void __78__PKTransactionDataOverlayCardFaceView__updateMagnitudesWithStyle_completion___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[54], "setMagnitudes:withStyle:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
    v3 = v5;
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    (*(void (**)(uint64_t, id *))(v4 + 16))(v4, v3);
    v3 = v5;
  }

}

- (BOOL)isContentSuppressed
{
  return self->_contentSuppressed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_maskView, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
