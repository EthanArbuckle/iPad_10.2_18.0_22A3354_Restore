@implementation PKBillPaymentRingView

- (PKBillPaymentRingView)init
{

  return 0;
}

- (PKBillPaymentRingView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (PKBillPaymentRingView)initWithSuggestedAmountList:(id)a3 delegate:(id)a4 dataSource:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKBillPaymentRingView *v12;
  PKBillPaymentRingView *v13;
  PKRingGradientView *v14;
  PKRingGradientView *ringView;
  PKRingGradientView *v16;
  void *v17;
  PKRingGradientView *v18;
  void *v19;
  PKBillPaymentCircularView *v20;
  PKBillPaymentCircularView *handleView;
  PKEnterCurrencyAmountView *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  PKEnterCurrencyAmountView *enterCurrencyAmountView;
  PKCurvedTextLabel *v27;
  PKCurvedTextLabel *topCurvedTextLabel;
  PKCurvedTextLabel *v29;
  PKCurvedTextLabel *bottomCurvedTextLabel;
  UILabel *v31;
  UILabel *interestLabel;
  id v33;
  NSArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  PKBillPaymentSuggestedAmountView *v40;
  uint64_t v41;
  NSArray *suggestedAmountViews;
  uint64_t v43;
  UITapGestureRecognizer *tapRecognizer;
  uint64_t v45;
  UILongPressGestureRecognizer *pressRecognizer;
  uint64_t v47;
  UIPanGestureRecognizer *dragRecognizer;
  double *p_mass;
  double *v50;
  double v51;
  double stiffness;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  int64x2_t v61;
  PKRenderLoop *v62;
  PKRenderLoop *renderLoop;
  double v64;
  double v65;
  double v66;
  void *v67;
  uint64_t v68;
  void *v69;
  PKBillPaymentRingView *v70;
  void *v71;
  void *v72;
  void *v73;
  int v74;
  id v76;
  id *p_suggestedAmountList;
  id v78;
  _QWORD v79[4];
  PKBillPaymentRingView *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  objc_super v85;
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v85.receiver = self;
  v85.super_class = (Class)PKBillPaymentRingView;
  v12 = -[PKBillPaymentRingView initWithFrame:](&v85, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v13 = v12;
  if (v12)
  {
    v76 = v9;
    v12->_enabled = 1;
    v12->_needsInitialDisplay = 1;
    objc_storeStrong((id *)&v12->_suggestedAmountList, a3);
    v78 = v10;
    objc_storeWeak((id *)&v13->_delegate, v10);
    objc_storeWeak((id *)&v13->_dataSource, v11);
    v13->_pinnedAmountAngleIndex = 0x7FFFFFFFFFFFFFFFLL;
    v13->_dragCapture = 0;
    -[PKBillPaymentRingView _createSuggestedAmountsImageDictionary](v13, "_createSuggestedAmountsImageDictionary");
    -[PKBillPaymentRingView _createSuggestedAmountAngles](v13, "_createSuggestedAmountAngles");
    -[PKBillPaymentRingView _createStandardColors](v13, "_createStandardColors");
    -[PKBillPaymentRingView _createSuggestedAmountRingColorStops](v13, "_createSuggestedAmountRingColorStops");
    v14 = objc_alloc_init(PKRingGradientView);
    ringView = v13->_ringView;
    v13->_ringView = v14;

    v16 = v13->_ringView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRingGradientView setStrokeColor:](v16, "setStrokeColor:", v17);

    v18 = v13->_ringView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRingGradientView setFillColor:](v18, "setFillColor:", v19);

    -[PKRingGradientView setMinimumAngle:](v13->_ringView, "setMinimumAngle:", 0.523598776);
    v20 = objc_alloc_init(PKBillPaymentCircularView);
    handleView = v13->_handleView;
    v13->_handleView = v20;

    v22 = [PKEnterCurrencyAmountView alloc];
    p_suggestedAmountList = (id *)&v13->_suggestedAmountList;
    -[PKBillPaymentSuggestedAmountList currencyCode](v13->_suggestedAmountList, "currencyCode");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKBillPaymentRingView _roundedAmountForAngle:](v13, "_roundedAmountForAngle:", 0.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[PKEnterCurrencyAmountView initWithCurrency:amount:](v22, "initWithCurrency:amount:", v23, v24);
    enterCurrencyAmountView = v13->_enterCurrencyAmountView;
    v13->_enterCurrencyAmountView = (PKEnterCurrencyAmountView *)v25;

    -[PKEnterCurrencyAmountView setShowsDecimalPointButton:](v13->_enterCurrencyAmountView, "setShowsDecimalPointButton:", 1);
    -[PKEnterCurrencyAmountView setKerning:](v13->_enterCurrencyAmountView, "setKerning:", &unk_1E3FACA80);
    -[PKEnterCurrencyAmountView setIgnoreIntegralNumber:](v13->_enterCurrencyAmountView, "setIgnoreIntegralNumber:", 1);
    -[PKEnterCurrencyAmountView sizeToFit](v13->_enterCurrencyAmountView, "sizeToFit");
    v27 = objc_alloc_init(PKCurvedTextLabel);
    topCurvedTextLabel = v13->_topCurvedTextLabel;
    v13->_topCurvedTextLabel = v27;

    -[PKCurvedTextLabel setBaselineAdjustment:](v13->_topCurvedTextLabel, "setBaselineAdjustment:", 1);
    -[PKCurvedTextLabel setInterior:](v13->_topCurvedTextLabel, "setInterior:", 0);
    -[PKCurvedTextLabel setAccessibilityIdentifier:](v13->_topCurvedTextLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67960]);
    v29 = objc_alloc_init(PKCurvedTextLabel);
    bottomCurvedTextLabel = v13->_bottomCurvedTextLabel;
    v13->_bottomCurvedTextLabel = v29;

    -[PKCurvedTextLabel setBaselineAdjustment:](v13->_bottomCurvedTextLabel, "setBaselineAdjustment:", 1);
    -[PKCurvedTextLabel setInterior:](v13->_bottomCurvedTextLabel, "setInterior:", 1);
    -[PKCurvedTextLabel setAccessibilityIdentifier:](v13->_bottomCurvedTextLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67958]);
    v31 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    interestLabel = v13->_interestLabel;
    v13->_interestLabel = v31;

    -[UILabel setBaselineAdjustment:](v13->_interestLabel, "setBaselineAdjustment:", 1);
    -[UILabel setTextAlignment:](v13->_interestLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v13->_interestLabel, "setNumberOfLines:", 1);
    -[UILabel setAccessibilityIdentifier:](v13->_interestLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67CA0]);
    -[PKBillPaymentRingView addSubview:](v13, "addSubview:", v13->_ringView);
    -[PKBillPaymentRingView addSubview:](v13, "addSubview:", v13->_interestLabel);
    -[PKBillPaymentRingView addSubview:](v13, "addSubview:", v13->_enterCurrencyAmountView);
    -[PKBillPaymentRingView addSubview:](v13, "addSubview:", v13->_topCurvedTextLabel);
    -[PKBillPaymentRingView addSubview:](v13, "addSubview:", v13->_bottomCurvedTextLabel);
    v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v34 = v13->_suggestedAmountAngles;
    v35 = -[NSArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v82;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v82 != v37)
            objc_enumerationMutation(v34);
          -[NSDictionary objectForKeyedSubscript:](v13->_suggestedAmountsForAngle, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * i), v76);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (v39)
          {
            v40 = -[PKBillPaymentSuggestedAmountView initWithSuggestedAmount:]([PKBillPaymentSuggestedAmountView alloc], "initWithSuggestedAmount:", v39);
            objc_msgSend(v33, "addObject:", v40);
            -[PKBillPaymentRingView addSubview:](v13, "addSubview:", v40);

          }
        }
        v36 = -[NSArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
      }
      while (v36);
    }

    v41 = objc_msgSend(v33, "copy");
    suggestedAmountViews = v13->_suggestedAmountViews;
    v13->_suggestedAmountViews = (NSArray *)v41;

    -[PKBillPaymentRingView addSubview:](v13, "addSubview:", v13->_handleView);
    v43 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v13, sel__tapRecognized_);
    tapRecognizer = v13->_tapRecognizer;
    v13->_tapRecognizer = (UITapGestureRecognizer *)v43;

    -[UITapGestureRecognizer setDelegate:](v13->_tapRecognizer, "setDelegate:", v13);
    -[PKBillPaymentRingView addGestureRecognizer:](v13, "addGestureRecognizer:", v13->_tapRecognizer);
    v45 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v13, sel__pressRecognized_);
    pressRecognizer = v13->_pressRecognizer;
    v13->_pressRecognizer = (UILongPressGestureRecognizer *)v45;

    -[UILongPressGestureRecognizer setMinimumPressDuration:](v13->_pressRecognizer, "setMinimumPressDuration:", 0.0);
    -[UILongPressGestureRecognizer setDelegate:](v13->_pressRecognizer, "setDelegate:", v13);
    -[PKBillPaymentRingView addGestureRecognizer:](v13, "addGestureRecognizer:", v13->_pressRecognizer);
    v47 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", v13, sel__dragRecognizerChanged_);
    dragRecognizer = v13->_dragRecognizer;
    v13->_dragRecognizer = (UIPanGestureRecognizer *)v47;

    -[UIPanGestureRecognizer setDelegate:](v13->_dragRecognizer, "setDelegate:", v13);
    -[PKBillPaymentRingView addGestureRecognizer:](v13, "addGestureRecognizer:", v13->_dragRecognizer);
    -[UITapGestureRecognizer requireGestureRecognizerToFail:](v13->_tapRecognizer, "requireGestureRecognizerToFail:", v13->_dragRecognizer);
    p_mass = &v13->_spring.mass;
    if (v13->_spring.mass != 1.0)
    {
      *p_mass = 1.0;
      v13->_spring.dirty = 1;
    }
    v50 = &v13->_responseSpring.mass;
    if (v13->_responseSpring.mass != 1.0)
    {
      *v50 = 1.0;
      v13->_responseSpring.dirty = 1;
    }
    v10 = v78;
    if (v13->_scaleSpring.mass != 1.0)
    {
      v13->_scaleSpring.mass = 1.0;
      v13->_scaleSpring.dirty = 1;
    }
    v51 = *p_mass;
    stiffness = v13->_spring.stiffness;
    v53 = *p_mass * 322.272797;
    if (stiffness != v53)
    {
      v13->_spring.stiffness = v53;
      v13->_spring.dirty = 1;
      stiffness = v53;
    }
    v54 = sqrt(v51 * stiffness);
    v55 = v54 + v54;
    if (v13->_spring.damping != v55)
    {
      v13->_spring.damping = v55;
      v13->_spring.dirty = 1;
    }
    v56 = *v50;
    v57 = v13->_responseSpring.stiffness;
    v58 = *v50 * 3947.84176;
    if (v57 != v58)
    {
      v13->_responseSpring.stiffness = v58;
      v13->_responseSpring.dirty = 1;
      v57 = v58;
    }
    v59 = sqrt(v56 * v57);
    v60 = v59 + v59;
    if (v13->_responseSpring.damping != v60)
    {
      v13->_responseSpring.damping = v60;
      v13->_responseSpring.dirty = 1;
    }
    if (v13->_scaleSpring.stiffness != 631.654682)
    {
      v13->_scaleSpring.stiffness = 631.654682;
      v13->_scaleSpring.dirty = 1;
    }
    if (v13->_scaleSpring.damping != 50.2654825)
    {
      v13->_scaleSpring.damping = 50.2654825;
      v13->_scaleSpring.dirty = 1;
    }
    *(int64x2_t *)&v13->_responseState.positionThreshold = vdupq_n_s64(0x3F40624DD2F1A9FCuLL);
    v61 = vdupq_n_s64(0x3F916872B020C49CuLL);
    *(int64x2_t *)&v13->_angleState.positionThreshold = v61;
    *(int64x2_t *)&v13->_scaleState.positionThreshold = v61;
    v62 = (PKRenderLoop *)objc_alloc_init(MEMORY[0x1E0D6C028]);
    renderLoop = v13->_renderLoop;
    v13->_renderLoop = v62;

    -[PKRenderLoop setDelegate:](v13->_renderLoop, "setDelegate:", v13);
    -[PKRenderLoop setPaused:](v13->_renderLoop, "setPaused:", 1);
    LODWORD(v64) = 1117782016;
    LODWORD(v65) = 1123024896;
    LODWORD(v66) = 1123024896;
    -[PKRenderLoop setPreferredFrameRateRange:](v13->_renderLoop, "setPreferredFrameRateRange:", v64, v65, v66);
    -[PKBillPaymentRingView traitCollection](v13, "traitCollection");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "userInterfaceIdiom");

    if (!v68)
      -[PKRenderLoop setHighFrameRateReason:](v13->_renderLoop, "setHighFrameRateReason:", 2162690);
    v69 = (void *)MEMORY[0x1E0DC3F10];
    v79[0] = MEMORY[0x1E0C809B0];
    v79[1] = 3221225472;
    v79[2] = __73__PKBillPaymentRingView_initWithSuggestedAmountList_delegate_dataSource___block_invoke;
    v79[3] = &unk_1E3E612E8;
    v70 = v13;
    v80 = v70;
    objc_msgSend(v69, "performWithoutAnimation:", v79);
    -[PKBillPaymentRingView setOpaque:](v70, "setOpaque:", 0);
    objc_msgSend(*p_suggestedAmountList, "minimumAmount");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_suggestedAmountList, "remainingStatementAmount");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_suggestedAmountList, "sortedSuggestedAmounts");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v73, "count") == 1 && v71 && v72)
    {
      v74 = PKEqualObjects();

      v9 = v76;
      if (v74)
        v70->_ignoreTouches = 1;
    }
    else
    {

      v9 = v76;
    }

  }
  return v13;
}

uint64_t __73__PKBillPaymentRingView_initWithSuggestedAmountList_delegate_dataSource___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "didUpdateAngleSpringTarget");
  objc_msgSend(*(id *)(a1 + 32), "didUpdateAngleSpringPosition");
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = v2 + 888;
    *(_QWORD *)v3 = 0;
    if (!*(_BYTE *)(v3 + 40) && *(double *)(v3 + 8) != 0.0)
      *(_BYTE *)(v3 + 40) = 1;
    v4 = *(_QWORD *)(a1 + 32);
    if (v4 && *(_BYTE *)(v4 + 928))
    {
      *(_BYTE *)(v4 + 928) = 0;
      *(_QWORD *)(v4 + 896) = *(_QWORD *)(v4 + 888);
      *(_QWORD *)(v4 + 904) = 0;
      v4 = *(_QWORD *)(a1 + 32);
    }
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend((id)v4, "didUpdateScaleSpringPosition");
  objc_msgSend(*(id *)(a1 + 32), "setAngle:animated:forExplicitAmount:userInitiatedWithRing:userInitiatedWithKeypad:", 0, 0, 0, 0, 0.523598776);
  return objc_msgSend(*(id *)(a1 + 32), "_updateForEnabledState");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[PKRenderLoop invalidate](self->_renderLoop, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)PKBillPaymentRingView;
  -[PKBillPaymentRingView dealloc](&v4, sel_dealloc);
}

- (void)didMoveToWindow
{
  void *v3;
  PKRenderLoop *renderLoop;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKBillPaymentRingView;
  -[PKBillPaymentRingView didMoveToWindow](&v6, sel_didMoveToWindow);
  -[PKBillPaymentRingView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  renderLoop = self->_renderLoop;
  objc_msgSend(v3, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRenderLoop attachToWindowScene:](renderLoop, "attachToWindowScene:", v5);

}

- (void)layoutSubviews
{
  id v3;
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
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  _BOOL4 v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  PKEnterCurrencyAmountView *enterCurrencyAmountView;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  long double v44;
  long double v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  PKBillPaymentCircularView *handleView;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  _BOOL4 isSmall;
  PKEnterCurrencyAmountView *v62;
  double MidX;
  PKEnterCurrencyAmountView *v64;
  CGFloat v65;
  CGAffineTransform *v66;
  CGAffineTransform *v67;
  CGFloat v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  _BOOL4 v77;
  double v78;
  __int128 v79;
  NSArray *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t i;
  void *v85;
  void *v86;
  void *v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  void *v96;
  double v97;
  double v98;
  PKCurvedTextLabel *topCurvedTextLabel;
  UILabel *interestLabel;
  double interestLabelAlpha;
  double v102;
  CGFloat v103;
  double v104;
  double v105;
  double v106;
  void *context;
  CGFloat v108;
  CGFloat v109;
  CGFloat v110;
  double v111;
  CGAffineTransform v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  CGAffineTransform v117;
  CGAffineTransform v118;
  _BYTE v119[48];
  objc_super v120;
  _BYTE v121[128];
  uint64_t v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;

  v122 = *MEMORY[0x1E0C80C00];
  v120.receiver = self;
  v120.super_class = (Class)PKBillPaymentRingView;
  v3 = -[PKBillPaymentRingView layoutSubviews](&v120, sel_layoutSubviews);
  context = (void *)MEMORY[0x1A1AE621C](v3);
  -[PKBillPaymentRingView bounds](self, "bounds");
  v105 = v5;
  v106 = v4;
  PKSizeAlignedInRect();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[PKRingGradientView frame](self->_ringView, "frame");
  v128.origin.x = v14;
  v128.origin.y = v15;
  v128.size.width = v16;
  v128.size.height = v17;
  v123.origin.x = v7;
  v109 = v9;
  v110 = v13;
  v123.origin.y = v9;
  v123.size.width = v11;
  v123.size.height = v13;
  v18 = CGRectEqualToRect(v123, v128);
  if (!v18)
  {
    -[PKRingGradientView setFrame:](self->_ringView, "setFrame:", v7, v9, v11, v13);
    -[PKRingGradientView setNeedsDisplay](self->_ringView, "setNeedsDisplay");
  }
  -[PKBillPaymentRingView _ringWidth](self, "_ringWidth");
  v20 = v19;
  v21 = v11 + v19 * -2.0 + -20.0;
  if (v21 >= 0.0)
    v22 = v21;
  else
    v22 = 0.0;
  v111 = v11;
  v23 = v11 - v20;
  v108 = v7;
  v104 = v11 - v20;
  if (!v18)
  {
    -[PKBillPaymentRingView _amountLabelMaximumFontSize](self, "_amountLabelMaximumFontSize");
    v25 = v24;
    v26 = *MEMORY[0x1E0DC1438];
    PKRoundedSystemFontOfSizeAndWeight(v24, *MEMORY[0x1E0DC1438]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "pk_fixedWidthFont");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    PKRoundedSystemFontOfSizeAndWeight(v25 * 0.5, v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "pk_fixedWidthFont");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKEnterCurrencyAmountView setAmountFont:](self->_enterCurrencyAmountView, "setAmountFont:", v28);
    -[PKEnterCurrencyAmountView setCurrencySymbolFont:](self->_enterCurrencyAmountView, "setCurrencySymbolFont:", v30);
    -[PKEnterCurrencyAmountView currentAmount](self->_enterCurrencyAmountView, "currentAmount");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    enterCurrencyAmountView = self->_enterCurrencyAmountView;
    -[PKBillPaymentSuggestedAmountList maximumAmount](self->_suggestedAmountList, "maximumAmount");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKEnterCurrencyAmountView setCurrentAmount:](enterCurrencyAmountView, "setCurrentAmount:", v33);

    -[PKEnterCurrencyAmountView sizeThatFits:](self->_enterCurrencyAmountView, "sizeThatFits:", v22, 1.79769313e308);
    v35 = fmax(v25 * fmin(v22 / v34, 1.0), 12.0);
    PKRoundedSystemFontOfSizeAndWeight(v35, v26);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "pk_fixedWidthFont");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    PKRoundedSystemFontOfSizeAndWeight(v35 * 0.5, v26);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "pk_fixedWidthFont");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKEnterCurrencyAmountView setAmountFont:](self->_enterCurrencyAmountView, "setAmountFont:", v37);
    -[PKEnterCurrencyAmountView setCurrencySymbolFont:](self->_enterCurrencyAmountView, "setCurrencySymbolFont:", v39);
    -[PKEnterCurrencyAmountView setCurrentAmount:](self->_enterCurrencyAmountView, "setCurrentAmount:", v31);
    -[PKEnterCurrencyAmountView sizeThatFits:](self->_enterCurrencyAmountView, "sizeThatFits:", v22, 1.79769313e308);
    v41 = v40;
    v42 = v23 * 0.5;
    PKRoundedSystemFontOfSizeAndWeight(fmax(fmin(v23 * 0.5 * 0.096, 13.0), 2.0), *MEMORY[0x1E0DC1430]);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKCurvedTextLabel setFont:](self->_topCurvedTextLabel, "setFont:", v43);
    -[PKCurvedTextLabel setFont:](self->_bottomCurvedTextLabel, "setFont:", v43);
    v44 = acos(1.0 - (v42 - (v41 * 0.5 + 10.0)) / v42);
    v45 = sin((v44 + v44) * 0.5);
    PKRoundedSystemFontOfSizeAndWeight(fmax(fmin((v42 + v42) * v45 * 0.0856, 22.0), 2.0), v26);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "pk_fixedWidthFont");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel setFont:](self->_interestLabel, "setFont:", v47);
  }
  -[PKBillPaymentCircularView sizeThatFits:](self->_handleView, "sizeThatFits:", v20, v20);
  v48 = *MEMORY[0x1E0C9D538];
  v49 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PKBillPaymentCircularView setBounds:](self->_handleView, "setBounds:", *MEMORY[0x1E0C9D538], v49, v50, v51);
  handleView = self->_handleView;
  -[PKBillPaymentRingView _offsetCurrentAngle](self, "_offsetCurrentAngle");
  -[PKBillPaymentRingView _centerPointAtAngle:adjustToCover:](self, "_centerPointAtAngle:adjustToCover:", 0);
  -[PKBillPaymentCircularView setCenter:](handleView, "setCenter:");
  -[PKEnterCurrencyAmountView frame](self->_enterCurrencyAmountView, "frame");
  -[PKEnterCurrencyAmountView sizeThatFits:](self->_enterCurrencyAmountView, "sizeThatFits:", v22, 1.79769313e308);
  PKRectCenteredXInRect();
  PKRectCenteredYInRect();
  v54 = v53;
  v56 = v55;
  v58 = v57;
  v60 = v59;
  isSmall = self->_isSmall;
  -[PKEnterCurrencyAmountView setBounds:](self->_enterCurrencyAmountView, "setBounds:", v48, v49);
  v62 = self->_enterCurrencyAmountView;
  v124.origin.x = v54;
  v124.origin.y = v56;
  v124.size.width = v58;
  v124.size.height = v60;
  MidX = CGRectGetMidX(v124);
  v125.origin.x = v54;
  v125.origin.y = v56;
  v103 = v60;
  v125.size.width = v58;
  v125.size.height = v60;
  -[PKEnterCurrencyAmountView setCenter:](v62, "setCenter:", MidX, CGRectGetMidY(v125));
  v64 = self->_enterCurrencyAmountView;
  if (isSmall)
  {
    v65 = 0.00001;
    v66 = (CGAffineTransform *)v119;
    v67 = (CGAffineTransform *)v119;
    v68 = 0.00001;
  }
  else
  {
    v66 = &v118;
    v67 = &v118;
    v65 = 1.0;
    v68 = 1.0;
  }
  CGAffineTransformMakeScale(v67, v65, v68);
  -[PKEnterCurrencyAmountView setTransform:](v64, "setTransform:", v66);
  -[PKCurvedTextLabel frame](self->_topCurvedTextLabel, "frame");
  -[PKCurvedTextLabel text](self->_topCurvedTextLabel, "text");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCurvedTextLabel textAttributes](self->_topCurvedTextLabel, "textAttributes");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "sizeWithAttributes:", v70);
  v72 = v71;

  v102 = v111 * 0.5 - v20;
  -[PKCurvedTextLabel setCircleRadius:](self->_topCurvedTextLabel, "setCircleRadius:", v102 - v72 * 0.5 + -7.0);
  -[PKCurvedTextLabel sizeThatFits:](self->_topCurvedTextLabel, "sizeThatFits:", v106, v105);
  PKRectCenteredXInRect();
  -[PKCurvedTextLabel setFrame:](self->_topCurvedTextLabel, "setFrame:");
  -[PKCurvedTextLabel frame](self->_bottomCurvedTextLabel, "frame");
  -[PKCurvedTextLabel text](self->_bottomCurvedTextLabel, "text");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCurvedTextLabel textAttributes](self->_bottomCurvedTextLabel, "textAttributes");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "sizeWithAttributes:", v74);
  v76 = v75;

  -[PKCurvedTextLabel setCircleRadius:](self->_bottomCurvedTextLabel, "setCircleRadius:", v102 - v76 * 0.5 + -7.0);
  -[PKCurvedTextLabel sizeThatFits:](self->_bottomCurvedTextLabel, "sizeThatFits:", v106, v105);
  v126.origin.x = v108;
  v126.origin.y = v109;
  v126.size.width = v111;
  v126.size.height = v110;
  CGRectGetMaxY(v126);
  PKRectCenteredXInRect();
  -[PKCurvedTextLabel setFrame:](self->_bottomCurvedTextLabel, "setFrame:");
  -[UILabel frame](self->_interestLabel, "frame");
  -[UILabel sizeThatFits:](self->_interestLabel, "sizeThatFits:", v104, 3.40282347e38);
  v127.origin.y = v56;
  v127.origin.x = v54;
  v127.size.height = v103;
  v127.size.width = v58;
  CGRectGetMaxY(v127);
  PKRectCenteredXInRect();
  -[UILabel setFrame:](self->_interestLabel, "setFrame:");
  if (self->_dotsVisible)
  {
    v77 = self->_isSmall;
    memset(&v117.c, 0, 32);
    if (v77)
      v78 = 0.0;
    else
      v78 = 1.0;
    *(_OWORD *)&v117.a = 0uLL;
    if (!v77)
    {
      v79 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v117.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v117.c = v79;
      *(_OWORD *)&v117.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      goto LABEL_19;
    }
  }
  else
  {
    memset(&v117, 0, sizeof(v117));
    v78 = 0.0;
  }
  CGAffineTransformMakeScale(&v117, 0.00001, 0.00001);
LABEL_19:
  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v80 = self->_suggestedAmountViews;
  v81 = -[NSArray countByEnumeratingWithState:objects:count:](v80, "countByEnumeratingWithState:objects:count:", &v113, v121, 16);
  if (v81)
  {
    v82 = v81;
    v83 = *(_QWORD *)v114;
    do
    {
      for (i = 0; i != v82; ++i)
      {
        if (*(_QWORD *)v114 != v83)
          objc_enumerationMutation(v80);
        v85 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * i);
        objc_msgSend(v85, "suggestedAmount");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "amount");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKBillPaymentRingView _angleForAmount:](self, "_angleForAmount:", v87);
        -[PKBillPaymentRingView _offsetAngle:](self, "_offsetAngle:");
        -[PKBillPaymentRingView _centerPointAtAngle:adjustToCover:](self, "_centerPointAtAngle:adjustToCover:", 0);
        objc_msgSend(v85, "sizeThatFits:", v20, v20);
        v89 = v88;
        v91 = v90;
        objc_msgSend(v85, "setBounds:", v48, v49, v88, v90);
        PKPointRoundToPixel();
        v93 = v92;
        v95 = v94;
        objc_msgSend(v85, "layer");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "anchorPoint");
        objc_msgSend(v96, "setPosition:", v93 + v97 * v89, v95 + v98 * v91);
        objc_msgSend(v85, "setAlpha:", v78);
        v112 = v117;
        objc_msgSend(v85, "setTransform:", &v112);

      }
      v82 = -[NSArray countByEnumeratingWithState:objects:count:](v80, "countByEnumeratingWithState:objects:count:", &v113, v121, 16);
    }
    while (v82);
  }

  topCurvedTextLabel = self->_topCurvedTextLabel;
  if (self->_isSmall)
  {
    -[PKCurvedTextLabel setAlpha:](topCurvedTextLabel, "setAlpha:", 0.0);
    -[PKCurvedTextLabel setAlpha:](self->_bottomCurvedTextLabel, "setAlpha:", 0.0);
    -[PKEnterCurrencyAmountView setAlpha:](self->_enterCurrencyAmountView, "setAlpha:", 0.0);
    -[PKBillPaymentCircularView setAlpha:](self->_handleView, "setAlpha:", 0.0);
    interestLabel = self->_interestLabel;
    interestLabelAlpha = 0.0;
  }
  else
  {
    -[PKCurvedTextLabel setAlpha:](topCurvedTextLabel, "setAlpha:", 1.0);
    -[PKCurvedTextLabel setAlpha:](self->_bottomCurvedTextLabel, "setAlpha:", 1.0);
    -[PKEnterCurrencyAmountView setAlpha:](self->_enterCurrencyAmountView, "setAlpha:", 1.0);
    -[PKBillPaymentCircularView setAlpha:](self->_handleView, "setAlpha:", 1.0);
    interestLabel = self->_interestLabel;
    interestLabelAlpha = self->_interestLabelAlpha;
  }
  -[UILabel setAlpha:](interestLabel, "setAlpha:", interestLabelAlpha);
  objc_autoreleasePoolPop(context);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  unint64_t v4;
  double v5;
  CGSize result;

  if (-[UIView pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts", a3.width, a3.height))
  {
    v3 = 280.0;
  }
  else
  {
    v4 = PKUIGetMinScreenType();
    if (v4 > 3)
      v3 = 318.0;
    else
      v3 = dbl_19DF15F00[v4];
  }
  v5 = v3;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)renderLoop:(id)a3 drawAtTime:(double)a4
{
  id v6;
  void *v7;
  double lastDrawTime;
  double v9;
  double v10;
  $E58A6ABF409EF437589341D84DF456DA *p_angleState;
  double position;
  double v13;
  $E58A6ABF409EF437589341D84DF456DA *p_responseState;
  float v15;
  double v16;
  double (**v17)(void *, uint64_t);
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  double responseSpringElapsedDuration;
  double v26;
  double v27;
  double v28;
  BOOL v29;
  double v30;
  double v31;
  double v33;
  $4AA14E1B5A459DE1C6FA329F2826757D *p_spring;
  double v35;
  $4AA14E1B5A459DE1C6FA329F2826757D *v36;
  $E58A6ABF409EF437589341D84DF456DA *v37;
  _BOOL4 v38;
  PKBillPaymentRingGradientState *overrideGradientState;
  double target;
  void *v41;
  double v42;
  NSUInteger v43;
  uint64_t v44;
  NSUInteger v45;
  void *v46;
  double v47;
  double v48;
  BOOL v49;
  _BOOL4 v51;
  double pinnedAmountAngle;
  double v54;
  double v55;
  BOOL v56;
  BOOL v57;
  double v59;
  double v60;
  id v61;
  double v62;
  double v63;
  _QWORD aBlock[6];

  v6 = a3;
  v7 = v6;
  lastDrawTime = self->_lastDrawTime;
  v9 = fmax(a4 - lastDrawTime, 0.0);
  if (lastDrawTime <= 0.0)
    v10 = 0.0;
  else
    v10 = v9;
  self->_lastDrawTime = a4;
  p_angleState = &self->_angleState;
  position = self->_angleState.position;
  v13 = self->_scaleState.position;
  p_responseState = &self->_responseState;
  if (!self->_responseState.running)
  {
    SpringStatesUpdate((uint64_t)&self->_spring, (uint64_t)p_angleState, v10);
    goto LABEL_49;
  }
  v59 = self->_angleState.position;
  v60 = self->_scaleState.position;
  v61 = v6;
  -[PKRenderLoop preferredFrameRateRange](self->_renderLoop, "preferredFrameRateRange");
  v16 = v15;
  if (v15 < 0.0)
    v16 = 60.0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__PKBillPaymentRingView_renderLoop_drawAtTime___block_invoke;
  aBlock[3] = &__block_descriptor_40_e8_d16__0Q8l;
  *(double *)&aBlock[4] = v16;
  v17 = (double (**)(void *, uint64_t))_Block_copy(aBlock);
  v18 = v17[2](v17, 1);
  v19 = fmax(v18 - self->_responseSpringElapsedDuration, 0.0);
  v63 = v19;
  if (v10 - v19 <= 0.000001)
    v20 = v10;
  else
    v20 = v19;
  if (v20 <= v10)
    v21 = v20;
  else
    v21 = v10;
  v62 = v21;
  v22 = -1;
  v23 = 0.0;
  while (1)
  {
    v24 = v22 + 1;
    if (v22 == -1)
    {
      responseSpringElapsedDuration = self->_responseSpringElapsedDuration;
      v26 = v20;
      if (v20 >= v10)
      {
        v27 = v10 + responseSpringElapsedDuration;
        if (v20 <= v10)
          v27 = 0.0;
        self->_responseSpringElapsedDuration = v27;
        v26 = v62;
      }
      if (responseSpringElapsedDuration > 0.0)
      {
        v28 = v10;
        v29 = v20 >= v10;
        goto LABEL_40;
      }
      v28 = v10;
      v29 = v20 >= v10;
      if (v26 <= 0.0)
        goto LABEL_40;
LABEL_37:
      if (self->_responseState.running)
      {
        SpringStatesUpdate((uint64_t)&self->_responseSpring, (uint64_t)p_responseState, v18);
        p_spring = &self->_spring;
        SpringSetResponse((uint64_t)&self->_spring, self->_responseState.position);
        goto LABEL_41;
      }
LABEL_40:
      p_spring = &self->_spring;
LABEL_41:
      SpringStatesUpdate((uint64_t)p_spring, (uint64_t)p_angleState, v26);
      if (v29)
        goto LABEL_48;
      goto LABEL_42;
    }
    v30 = v63 + ((double (*)(double (**)(void *, uint64_t)))v17[2])(v17);
    v28 = v10 - v30;
    v31 = fmax(fmin(v10 - v30, v18), 0.0);
    v26 = v10 - v30 - v31 <= 0.000001 ? v10 - v30 : v31;
    if (v26 < v18 || v23 >= v30)
      break;
    if (v26 > 0.0)
    {
      v29 = 0;
LABEL_36:
      v23 = v30;
      goto LABEL_37;
    }
    p_spring = &self->_spring;
    SpringStatesUpdate((uint64_t)&self->_spring, (uint64_t)p_angleState, v26);
    v23 = v30;
LABEL_42:
    v22 = v24;
    if (!self->_responseState.running)
    {
      v35 = v28 - v26;
      v36 = p_spring;
      v37 = &self->_angleState;
      goto LABEL_47;
    }
  }
  if (v26 <= 0.0)
    v33 = 0.0;
  else
    v33 = v26;
  self->_responseSpringElapsedDuration = v33;
  if (v26 > 0.0)
  {
    v29 = 1;
    goto LABEL_36;
  }
  v36 = &self->_spring;
  v37 = &self->_angleState;
  v35 = v26;
LABEL_47:
  SpringStatesUpdate((uint64_t)v36, (uint64_t)v37, v35);
LABEL_48:

  v7 = v61;
  position = v59;
  v13 = v60;
LABEL_49:
  SpringStatesUpdate((uint64_t)&self->_scaleSpring, (uint64_t)&self->_scaleState, v10);
  v38 = -[PKBillPaymentRingView _preferredPausedState](self, "_preferredPausedState");
  if (!self->_angleState.running)
  {
    overrideGradientState = self->_overrideGradientState;
    self->_overrideGradientState = 0;

    if (self->_responseState.running)
    {
      self->_responseState.running = 0;
      target = p_responseState->target;
      self->_responseState.position = self->_responseState.target;
      self->_responseState.velocity = 0.0;
      SpringSetResponse((uint64_t)&self->_spring, target);
    }
  }
  v41 = (void *)MEMORY[0x1A1AE621C]();
  if (self->_angleState.position != position)
  {
    -[PKBillPaymentRingView didUpdateAngleSpringPosition](self, "didUpdateAngleSpringPosition");
    if (self->_feedbackGenerator)
    {
      v42 = self->_angleState.position;
      if (self->_dragging)
      {
        v43 = -[NSArray count](self->_suggestedAmountAngles, "count");
        if (v43)
        {
          v44 = 0;
          v45 = v43 - 1;
          while (1)
          {
            -[NSArray objectAtIndexedSubscript:](self->_suggestedAmountAngles, "objectAtIndexedSubscript:", v44);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "doubleValue");
            v48 = v47;

            v49 = v42 <= position || v42 < v48;
            if (!v49 && position < v48)
              break;
            v51 = v42 <= v48 && v42 <= position;
            if (position <= v48)
              v51 = 0;
            if (!v51 && v45 != v44++)
              continue;
            if (v51)
              break;
            goto LABEL_87;
          }
LABEL_86:
          -[UISelectionFeedbackGenerator selectionChanged](self->_feedbackGenerator, "selectionChanged");
        }
      }
      else if (self->_pinnedAmount && self->_pinnedAmountAngleIndex != 0x7FFFFFFFFFFFFFFFLL)
      {
        pinnedAmountAngle = self->_pinnedAmountAngle;
        v54 = pinnedAmountAngle + -0.04;
        v55 = pinnedAmountAngle + 0.04;
        v56 = position < v54 || position > v55;
        v57 = !v56 || v42 < v54;
        if (!v57 && v42 <= v55)
          goto LABEL_86;
      }
    }
  }
LABEL_87:
  if (self->_scaleState.position != v13)
    -[PKBillPaymentRingView didUpdateScaleSpringPosition](self, "didUpdateScaleSpringPosition");
  objc_autoreleasePoolPop(v41);
  if (v38)
    -[PKBillPaymentRingView _pauseRenderLoop](self, "_pauseRenderLoop");
  -[PKBillPaymentRingView layoutIfNeeded](self, "layoutIfNeeded");

}

double __47__PKBillPaymentRingView_renderLoop_drawAtTime___block_invoke(uint64_t a1, unint64_t a2)
{
  return (double)a2 / *(double *)(a1 + 32);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return !self->_ignoreTouches && !self->_isSmall;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  UILongPressGestureRecognizer *pressRecognizer;

  pressRecognizer = self->_pressRecognizer;
  return pressRecognizer == a3 || pressRecognizer == a4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UIPanGestureRecognizer *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double width;
  double height;
  CGFloat v31;
  CGFloat v32;
  double MidX;
  CGFloat MidY;
  double v35;
  double v36;
  CGRect v38;
  CGRect v39;

  v6 = (UIPanGestureRecognizer *)a3;
  objc_msgSend(a4, "locationInView:", self);
  v8 = v7;
  v10 = v9;
  if ((UIPanGestureRecognizer *)self->_tapRecognizer == v6)
  {
    -[PKBillPaymentRingView _ringWidth](self, "_ringWidth");
    v13 = v12;
    -[PKRingGradientView radius](self->_ringView, "radius");
    v15 = v14 + v13 * -0.5;
    v16 = v13 * 0.5 + 16.0;
    -[PKBillPaymentRingView _center](self, "_center");
    v19 = sqrt((v18 - v10) * (v18 - v10) + (v17 - v8) * (v17 - v8));
    v11 = v19 <= v16 + v15 && v19 >= v15 - v16;
  }
  else if (self->_dragRecognizer == v6 || (UIPanGestureRecognizer *)self->_pressRecognizer == v6)
  {
    -[PKBillPaymentCircularView layer](self->_handleView, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "anchorPoint");
    v22 = v21;
    v24 = v23;
    objc_msgSend(v20, "position");
    v26 = v25;
    v28 = v27;
    objc_msgSend(v20, "bounds");
    width = v38.size.width;
    height = v38.size.height;
    v31 = v26 - v22 * v38.size.width;
    v32 = v28 - v24 * v38.size.height;
    v38.origin.x = v31;
    v38.origin.y = v32;
    MidX = CGRectGetMidX(v38);
    v39.origin.x = v31;
    v39.origin.y = v32;
    v39.size.width = width;
    v39.size.height = height;
    MidY = CGRectGetMidY(v39);
    v35 = sqrt((MidY - v10) * (MidY - v10) + (MidX - v8) * (MidX - v8));
    if (width >= height)
      v36 = height;
    else
      v36 = width;
    v11 = v35 <= v36 + 16.0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (double)_angleForRecognizer:(id)a3
{
  double result;

  objc_msgSend(a3, "locationInView:", self);
  -[PKBillPaymentRingView _angleForPosition:](self, "_angleForPosition:");
  return result;
}

- (double)_angleForPosition:(CGPoint)a3
{
  double y;
  double x;
  double v5;
  double v6;
  long double v7;
  double result;

  y = a3.y;
  x = a3.x;
  -[PKBillPaymentRingView _center](self, "_center");
  v7 = atan2(y - v6, x - v5);
  result = fmod(v7 + -4.71238898, 6.28318531);
  if (result < 0.0)
    result = result + 6.28318531;
  if (result == 0.0)
    return 6.28318531;
  return result;
}

- (void)_tapRecognized:(id)a3
{
  double v4;

  -[PKBillPaymentRingView _angleForRecognizer:](self, "_angleForRecognizer:", a3);
  if (v4 < 0.523598776)
    v4 = 6.28318531;
  -[PKBillPaymentRingView setAngle:animated:forExplicitAmount:userInitiatedWithRing:userInitiatedWithKeypad:](self, "setAngle:animated:forExplicitAmount:userInitiatedWithRing:userInitiatedWithKeypad:", 1, 0, 1, 0, v4);
}

- (void)_pressRecognized:(id)a3
{
  uint64_t v4;
  char v5;

  v4 = objc_msgSend(a3, "state");
  v5 = v4 - 1;
  if ((unint64_t)(v4 - 1) <= 4 && ((0x1Du >> v5) & 1) != 0)
  {
    self->_pressed = 0x101uLL >> (8 * v5);
    -[PKBillPaymentRingView _updateHandleState](self, "_updateHandleState");
  }
}

- (void)_dragRecognizerChanged:(id)a3
{
  uint64_t v4;
  BOOL v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "state");
  if ((unint64_t)(v4 - 3) >= 3)
  {
    if (v4 != 2)
    {
      v5 = v4 == 1;
      v6 = v7;
      if (!v5)
        goto LABEL_9;
      -[PKBillPaymentRingView _dragStarted:](self, "_dragStarted:", v7);
    }
    -[PKBillPaymentRingView _dragMoved:](self, "_dragMoved:", v7);
  }
  else
  {
    -[PKBillPaymentRingView _dragMoved:](self, "_dragMoved:", v7);
    -[PKBillPaymentRingView _dragEnded:](self, "_dragEnded:", v7);
  }
  v6 = v7;
LABEL_9:

}

- (void)_dragMoved:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(a3, "locationInView:", self);
  v5 = v4;
  v7 = v6;
  -[PKRingGradientView radius](self->_ringView, "radius");
  -[PKBillPaymentRingView _center](self, "_center");
  -[PKBillPaymentRingView _angleForPosition:](self, "_angleForPosition:", v5, v7);
  -[PKBillPaymentRingView _dragMovedToAngle:normalizedRadius:](self, "_dragMovedToAngle:normalizedRadius:");
}

- (void)_dragStarted:(id)a3
{
  UISelectionFeedbackGenerator *feedbackGenerator;

  self->_dragging = 1;
  -[PKBillPaymentRingView _updateHandleState](self, "_updateHandleState", a3);
  feedbackGenerator = self->_feedbackGenerator;
  if (feedbackGenerator)
    -[UISelectionFeedbackGenerator userInteractionStarted](feedbackGenerator, "userInteractionStarted");
}

- (void)_dragEnded:(id)a3
{
  UISelectionFeedbackGenerator *feedbackGenerator;
  UISelectionFeedbackGenerator *v5;

  self->_dragging = 0;
  self->_dragCapture = 0;
  -[PKBillPaymentRingView _updateHandleState](self, "_updateHandleState", a3);
  feedbackGenerator = self->_feedbackGenerator;
  if (feedbackGenerator)
  {
    -[UISelectionFeedbackGenerator userInteractionEnded](feedbackGenerator, "userInteractionEnded");
    if (-[PKRenderLoop isPaused](self->_renderLoop, "isPaused"))
    {
      v5 = self->_feedbackGenerator;
      self->_feedbackGenerator = 0;

    }
  }
}

- (void)_dragMovedToAngle:(double)a3 normalizedRadius:(double)a4
{
  int64_t dragCapture;
  double target;

  dragCapture = self->_dragCapture;
  if ((unint64_t)(dragCapture - 1) >= 2)
  {
    if (!dragCapture)
    {
      if (a4 <= 0.25)
      {
LABEL_17:
        self->_dragCapture = 3;
LABEL_18:
        if (a4 <= 0.25)
        {
          target = self->_angleState.target;
          goto LABEL_24;
        }
        goto LABEL_22;
      }
      if (a3 < 6.28318531 && a3 > 0.523598776)
        goto LABEL_23;
      dragCapture = 2;
      if ((self->_angleState.target + -0.523598776) / 5.75958653 < 0.5)
        dragCapture = 1;
      self->_dragCapture = dragCapture;
    }
  }
  else if (a4 <= 0.25)
  {
    goto LABEL_17;
  }
  if (dragCapture == 1)
  {
    target = 0.523598776;
    if (a3 <= 0.523598776 || a3 > 0.696386372)
      goto LABEL_24;
LABEL_22:
    self->_dragCapture = 0;
    goto LABEL_23;
  }
  if (dragCapture == 3)
    goto LABEL_18;
  if (dragCapture != 2)
  {
LABEL_23:
    target = a3;
    goto LABEL_24;
  }
  target = 6.28318531;
  if (a3 >= 6.11039771 && a3 < 6.28318531)
    goto LABEL_22;
LABEL_24:
  -[PKBillPaymentRingView setAngle:animated:forExplicitAmount:userInitiatedWithRing:userInitiatedWithKeypad:](self, "setAngle:animated:forExplicitAmount:userInitiatedWithRing:userInitiatedWithKeypad:", 1, 0, 1, 0, target);
}

- (void)_updateHandleState
{
  double v2;

  if (self->_dragging)
  {
    v2 = 1.2;
  }
  else
  {
    v2 = 1.2;
    if (!self->_pressed)
      v2 = 1.0;
  }
  -[PKBillPaymentRingView setHandleScale:animated:](self, "setHandleScale:animated:", 1, v2);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 enabled;
  void *v5;

  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[PKBillPaymentRingView _updateForEnabledState](self, "_updateForEnabledState");
    -[PKBillPaymentRingView _updateCurvedText](self, "_updateCurvedText");
    enabled = self->_enabled;
    if (self->_enabled)
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&self->_overrideDisplayAmount, v5);
    if (!enabled)

    -[PKBillPaymentRingView _updateEffectiveDisplayAmount](self, "_updateEffectiveDisplayAmount");
  }
}

- (void)prepareForInitialDisplayWithAmount:(id)a3
{
  NSDecimalNumber *v4;
  NSDecimalNumber *initialDisplayAmount;

  if (self->_needsInitialDisplay)
  {
    v4 = (NSDecimalNumber *)objc_msgSend(a3, "copy");
    initialDisplayAmount = self->_initialDisplayAmount;
    self->_initialDisplayAmount = v4;

    -[PKBillPaymentRingView _updateInitialDisplayState](self, "_updateInitialDisplayState");
    self->_preparedForInitialDisplay = 1;
  }
}

- (void)_updateInitialDisplayState
{
  double v3;
  double v4;
  PKBillPaymentRingGradientState *v5;
  PKBillPaymentRingGradientState *overrideGradientState;

  if (self->_needsInitialDisplay)
  {
    if (self->_initialDisplayAmount)
    {
      -[PKBillPaymentRingView _angleForAmount:](self, "_angleForAmount:");
      v4 = v3;
    }
    else
    {
      v4 = dbl_19DF15E50[!self->_isSmall];
    }
    -[PKBillPaymentRingView _targetGradientStateForAngle:](self, "_targetGradientStateForAngle:", v4);
    v5 = (PKBillPaymentRingGradientState *)objc_claimAutoreleasedReturnValue();
    overrideGradientState = self->_overrideGradientState;
    self->_overrideGradientState = v5;

    self->_overrideGradientStartAngle = v4;
    -[PKBillPaymentRingView didUpdateAngleSpringTarget](self, "didUpdateAngleSpringTarget");
    -[PKBillPaymentRingView didUpdateAngleSpringPosition](self, "didUpdateAngleSpringPosition");
  }
}

- (void)completeInitialDisplayAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSDecimalNumber *initialDisplayAmount;

  if (self->_needsInitialDisplay)
  {
    v3 = a3;
    if (!self->_preparedForInitialDisplay)
      -[PKBillPaymentRingView prepareForInitialDisplayWithAmount:](self, "prepareForInitialDisplayWithAmount:", 0);
    self->_needsInitialDisplay = 0;
    -[PKBillPaymentRingView _setDotsVisible:animated:](self, "_setDotsVisible:animated:", 1, v3);
    initialDisplayAmount = self->_initialDisplayAmount;
    if (initialDisplayAmount)
      -[PKBillPaymentRingView setAmount:animated:](self, "setAmount:animated:", initialDisplayAmount, v3);
  }
}

- (void)setAmount:(id)a3 animated:(BOOL)a4
{
  -[PKBillPaymentRingView setAmount:animated:userInitiatedWithKeypad:](self, "setAmount:animated:userInitiatedWithKeypad:", a3, a4, 0);
}

- (void)setAmount:(id)a3 animated:(BOOL)a4 userInitiatedWithKeypad:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = v8;
  if (v8)
  {
    v10 = v8;
    if (self->_needsInitialDisplay)
    {
      -[PKBillPaymentRingView prepareForInitialDisplayWithAmount:](self, "prepareForInitialDisplayWithAmount:", v8);
    }
    else
    {
      -[PKBillPaymentRingView _angleForAmount:](self, "_angleForAmount:", v8);
      -[PKBillPaymentRingView setAngle:animated:forExplicitAmount:userInitiatedWithRing:userInitiatedWithKeypad:](self, "setAngle:animated:forExplicitAmount:userInitiatedWithRing:userInitiatedWithKeypad:", v6, v10, 0, v5);
    }
    v9 = v10;
  }

}

- (NSDecimalNumber)amount
{
  NSDecimalNumber *pinnedAmount;

  pinnedAmount = self->_pinnedAmount;
  if (pinnedAmount)
    return pinnedAmount;
  -[PKBillPaymentRingView _roundedAmountForAngle:](self, "_roundedAmountForAngle:", self->_angleState.target);
  return (NSDecimalNumber *)(id)objc_claimAutoreleasedReturnValue();
}

- (double)targetAngle
{
  return self->_angleState.target;
}

- (UIColor)currentStartColor
{
  void *v2;
  void *v3;

  -[PKBillPaymentRingView _targetGradientStateForAngle:](self, "_targetGradientStateForAngle:", self->_angleState.target);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (UIColor)currentEndColor
{
  void *v2;
  void *v3;

  -[PKBillPaymentRingView _targetGradientStateForAngle:](self, "_targetGradientStateForAngle:", self->_angleState.target);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setIsSmall:(BOOL)a3
{
  double v5;
  NSDecimalNumber *pinnedAmount;
  _QWORD v7[5];

  if (self->_isSmall != a3)
  {
    -[PKBillPaymentRingView layoutIfNeeded](self, "layoutIfNeeded");
    self->_isSmall = a3;
    -[PKBillPaymentRingView setNeedsLayout](self, "setNeedsLayout");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __36__PKBillPaymentRingView_setIsSmall___block_invoke;
    v7[3] = &unk_1E3E612E8;
    v7[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v7, 0);
    -[PKBillPaymentRingView setNeedsDisplay](self, "setNeedsDisplay");
    if (self->_needsInitialDisplay)
    {
      if (self->_preparedForInitialDisplay)
        -[PKBillPaymentRingView _updateInitialDisplayState](self, "_updateInitialDisplayState");
    }
    else
    {
      if (self->_pinnedAmount)
      {
        -[PKBillPaymentRingView _angleForAmount:](self, "_angleForAmount:");
        pinnedAmount = self->_pinnedAmount;
      }
      else
      {
        pinnedAmount = 0;
        v5 = fmin(fmax(self->_angleState.target, dbl_19DF15E50[!self->_isSmall]), 6.28318531);
      }
      -[PKBillPaymentRingView setAngle:animated:forExplicitAmount:userInitiatedWithRing:userInitiatedWithKeypad:](self, "setAngle:animated:forExplicitAmount:userInitiatedWithRing:userInitiatedWithKeypad:", 1, pinnedAmount, 0, 0, v5);
    }
  }
}

uint64_t __36__PKBillPaymentRingView_setIsSmall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)didUpdateAngleSpringTarget
{
  unint64_t pinnedAmountAngleIndex;
  void *v4;
  void *v5;

  if (self->_initialDisplayAmount)
  {
    -[PKBillPaymentRingView _angleForAmount:](self, "_angleForAmount:");
  }
  else if (self->_pinnedAmount)
  {
    pinnedAmountAngleIndex = self->_pinnedAmountAngleIndex;
    if (pinnedAmountAngleIndex != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_4;
  }
  pinnedAmountAngleIndex = -[PKBillPaymentRingView _unnormalizedAngleIndexForAngle:](self, "_unnormalizedAngleIndexForAngle:");
LABEL_4:
  -[PKBillPaymentRingView _suggestedAmountForAngleIndex:](self, "_suggestedAmountForAngleIndex:", pinnedAmountAngleIndex);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PKBillPaymentRingView _setSelectedSuggestedAmount:](self, "_setSelectedSuggestedAmount:", v4);
  }
  else
  {
    -[PKBillPaymentSuggestedAmountList initialSuggestedAmount](self->_suggestedAmountList, "initialSuggestedAmount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKBillPaymentRingView _setSelectedSuggestedAmount:](self, "_setSelectedSuggestedAmount:", v5);

  }
  if (self->_isSmall)
    -[PKBillPaymentRingView _updateHandleImage](self, "_updateHandleImage");
}

- (void)didUpdateAngleSpringPosition
{
  NSDecimalNumber **p_initialDisplayAmount;
  NSDecimalNumber *initialDisplayAmount;
  double v5;
  double target;
  _BOOL4 v7;
  double position;
  _BOOL4 v9;
  double pinnedAmountAngle;
  uint64_t v11;
  NSDecimalNumber *v12;
  unint64_t pinnedAmountAngleIndex;
  double v14;
  void *v15;
  PKBillPaymentRingGradientState *overrideGradientState;
  double overrideGradientStartAngle;
  PKBillPaymentRingGradientState *v18;
  PKBillPaymentRingGradientState *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSDecimalNumber *v24;

  -[PKBillPaymentRingView setNeedsLayout](self, "setNeedsLayout");
  p_initialDisplayAmount = &self->_initialDisplayAmount;
  initialDisplayAmount = self->_initialDisplayAmount;
  if (initialDisplayAmount)
  {
    -[PKBillPaymentRingView _angleForAmount:](self, "_angleForAmount:", self->_initialDisplayAmount);
    target = v5;
    v7 = 0;
    position = self->_angleState.position;
    v9 = 1;
  }
  else
  {
    target = self->_angleState.target;
    position = self->_angleState.position;
    if (self->_pinnedAmount
      && (pinnedAmountAngle = self->_pinnedAmountAngle, position >= pinnedAmountAngle + -0.172787596))
    {
      v9 = position <= pinnedAmountAngle + 0.172787596;
      v7 = v9;
    }
    else
    {
      v9 = 0;
      v7 = 0;
    }
  }
  -[PKRingGradientView setCurrentAngle:](self->_ringView, "setCurrentAngle:", position);
  if (!self->_isSmall)
    -[PKBillPaymentRingView _updateHandleImage](self, "_updateHandleImage");
  -[PKBillPaymentRingView _roundedAmountForAngle:](self, "_roundedAmountForAngle:", position);
  v11 = objc_claimAutoreleasedReturnValue();
  v24 = (NSDecimalNumber *)v11;
  if (self->_userEnteredAmountWithKeypad)
  {
    v12 = (NSDecimalNumber *)v11;
    v24 = self->_pinnedAmount;
  }
  else
  {
    if (!v9)
      goto LABEL_18;
    if (!initialDisplayAmount)
      p_initialDisplayAmount = &self->_pinnedAmount;
    v12 = *p_initialDisplayAmount;
    if (-[PKBillPaymentRingView _isAmount:withinRoundingUnitOfAmount:](self, "_isAmount:withinRoundingUnitOfAmount:", v24, v12))
    {
      v12 = v12;

      v24 = v12;
    }
  }

  if (initialDisplayAmount)
  {
    pinnedAmountAngleIndex = -[PKBillPaymentRingView _unnormalizedAngleIndexForAngle:](self, "_unnormalizedAngleIndexForAngle:", target);
    v14 = target;
    goto LABEL_24;
  }
LABEL_18:
  if (!v7 || (pinnedAmountAngleIndex = self->_pinnedAmountAngleIndex, pinnedAmountAngleIndex == 0x7FFFFFFFFFFFFFFFLL))
    pinnedAmountAngleIndex = -[PKBillPaymentRingView _unnormalizedAngleIndexForAngle:](self, "_unnormalizedAngleIndexForAngle:", position);
  if (self->_overrideGradientState)
    v14 = target;
  else
    v14 = position;
LABEL_24:
  -[PKBillPaymentRingView _targetGradientStateForAngle:](self, "_targetGradientStateForAngle:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  overrideGradientState = self->_overrideGradientState;
  if (overrideGradientState)
  {
    overrideGradientStartAngle = self->_overrideGradientStartAngle;
    if (target - overrideGradientStartAngle == 0.0)
    {
      v18 = overrideGradientState;
    }
    else
    {
      -[PKBillPaymentRingView _blendFromGradientState:toState:withProgress:](self, "_blendFromGradientState:toState:withProgress:", (position - overrideGradientStartAngle) / (target - overrideGradientStartAngle));
      v18 = (PKBillPaymentRingGradientState *)objc_claimAutoreleasedReturnValue();
    }
    v19 = v18;

    v15 = v19;
  }
  objc_msgSend(v15, "startColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "endColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRingGradientView setGradientStartColor:](self->_ringView, "setGradientStartColor:", v20);
  -[PKRingGradientView setGradientEndColor:](self->_ringView, "setGradientEndColor:", v21);
  -[PKBillPaymentCircularView setPrimaryColor:](self->_handleView, "setPrimaryColor:", v21);
  -[UILabel setTextColor:](self->_interestLabel, "setTextColor:", v20);
  -[PKBillPaymentRingView _suggestedAmountForAngleIndex:](self, "_suggestedAmountForAngleIndex:", pinnedAmountAngleIndex);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    -[PKBillPaymentRingView _setHighlightedSuggestedAmount:](self, "_setHighlightedSuggestedAmount:", v22);
  }
  else
  {
    -[PKBillPaymentSuggestedAmountList initialSuggestedAmount](self->_suggestedAmountList, "initialSuggestedAmount");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKBillPaymentRingView _setHighlightedSuggestedAmount:](self, "_setHighlightedSuggestedAmount:", v23);

  }
  if (!-[PKBillPaymentRingView _setDisplayAmount:](self, "_setDisplayAmount:", v24))
    -[PKBillPaymentRingView _updateInterestText](self, "_updateInterestText");

}

- (void)didUpdateScaleSpringPosition
{
  long double v3;
  void *v4;
  CATransform3D v5;

  v3 = exp(self->_scaleState.position);
  -[PKBillPaymentCircularView layer](self->_handleView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CATransform3DMakeScale(&v5, v3, v3, 1.0);
  objc_msgSend(v4, "setTransform:", &v5);

}

- (void)setAngle:(double)a3 animated:(BOOL)a4 forExplicitAmount:(id)a5 userInitiatedWithRing:(BOOL)a6 userInitiatedWithKeypad:(BOOL)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v12;
  _BOOL4 v13;
  $E58A6ABF409EF437589341D84DF456DA *p_angleState;
  double target;
  double position;
  char *v17;
  NSUInteger v18;
  NSUInteger v19;
  unint64_t v20;
  NSDictionary *suggestedAmountsForAngle;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  double v26;
  _BOOL4 v27;
  void *v28;
  char *v29;
  double v30;
  void *v31;
  double v32;
  BOOL v33;
  double v34;
  id v36;
  double v37;
  void *v38;
  NSDecimalNumber **p_initialDisplayAmount;
  NSDecimalNumber *initialDisplayAmount;
  _BOOL4 v41;
  NSDecimalNumber *v42;
  NSDecimalNumber *v43;
  NSDecimalNumber *v45;
  int v46;
  int v47;
  NSDecimalNumber *v48;
  NSDecimalNumber *pinnedAmount;
  void *v50;
  uint64_t v51;
  void *v52;
  PKBillPaymentRingGradientState *v53;
  PKBillPaymentRingGradientState *overrideGradientState;
  PKBillPaymentRingGradientState *v55;
  PKBillPaymentRingGradientState *v56;
  void *v57;
  void *v58;
  void *v59;
  UISelectionFeedbackGenerator *v60;
  UISelectionFeedbackGenerator *feedbackGenerator;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  _BOOL4 v69;
  id v70;

  v8 = a6;
  v9 = a4;
  v12 = a5;
  v13 = v9 && self->_enabled;
  self->_userSelectedAngleChange = v8;
  self->_userEnteredAmountWithKeypad = a7;
  p_angleState = &self->_angleState;
  target = self->_angleState.target;
  position = self->_angleState.position;
  v70 = v12;
  if (v12)
  {
    v17 = (char *)v12;
    v18 = -[NSArray count](self->_suggestedAmountAngles, "count");
    if (!v18)
    {
      p_initialDisplayAmount = &self->_initialDisplayAmount;
      initialDisplayAmount = self->_initialDisplayAmount;
      v41 = initialDisplayAmount != 0;
      v20 = 0x7FFFFFFFFFFFFFFFLL;
      v26 = a3;
      if (!initialDisplayAmount || v8)
        goto LABEL_42;
      goto LABEL_35;
    }
    v19 = v18;
    v69 = v13;
    v20 = 0;
    while (1)
    {
      suggestedAmountsForAngle = self->_suggestedAmountsForAngle;
      -[NSArray objectAtIndexedSubscript:](self->_suggestedAmountAngles, "objectAtIndexedSubscript:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](suggestedAmountsForAngle, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "amount");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = PKEqualObjects();

      if ((v25 & 1) != 0)
        break;
      if (v19 == ++v20)
      {
        v20 = 0x7FFFFFFFFFFFFFFFLL;
        break;
      }
    }
    v26 = a3;
    p_angleState = &self->_angleState;
    v13 = v69;
  }
  else
  {
    v17 = -[NSArray count](self->_suggestedAmountAngles, "count");
    if (!v17)
    {
      p_initialDisplayAmount = &self->_initialDisplayAmount;
      v42 = self->_initialDisplayAmount;
      v41 = v42 != 0;
      v20 = 0x7FFFFFFFFFFFFFFFLL;
      v26 = 0.0;
      if (!v42 || v8)
        goto LABEL_42;
      goto LABEL_36;
    }
    v27 = v13;
    v28 = 0;
    v29 = 0;
    v20 = 0x7FFFFFFFFFFFFFFFLL;
    v30 = 1.79769313e308;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_suggestedAmountAngles, "objectAtIndexedSubscript:", v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "doubleValue");
      v33 = v32 + -0.172787596 > a3 || v32 + 0.172787596 < a3;
      v34 = vabdd_f64(a3, v32);
      if (!v33 && v34 <= v30)
      {
        v36 = v31;

        v28 = v36;
        v20 = (unint64_t)v29;
        v30 = v34;
      }

      ++v29;
    }
    while (v17 != v29);
    if (v28)
    {
      objc_msgSend(v28, "doubleValue");
      v26 = v37;
      -[NSDictionary objectForKeyedSubscript:](self->_suggestedAmountsForAngle, "objectForKeyedSubscript:", v28);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "amount");
      v17 = (char *)objc_claimAutoreleasedReturnValue();

      a3 = v26;
    }
    else
    {
      v17 = 0;
      v26 = 0.0;
      v20 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v13 = v27;
  }
  p_initialDisplayAmount = &self->_initialDisplayAmount;
  v43 = self->_initialDisplayAmount;
  v41 = v43 != 0;
  if (!v43 || v8)
    goto LABEL_42;
  if (!v70)
    goto LABEL_36;
LABEL_35:
  if (PKEqualObjects())
  {
LABEL_36:
    v41 = !self->_needsInitialDisplay;
    if (!self->_needsInitialDisplay && v13)
    {
      if ((PKEqualObjects() & 1) == 0)
        goto LABEL_41;
LABEL_43:
      v46 = 0;
      goto LABEL_44;
    }
LABEL_42:
    if (v41)
      goto LABEL_41;
    goto LABEL_43;
  }
LABEL_41:
  v45 = *p_initialDisplayAmount;
  *p_initialDisplayAmount = 0;

  v46 = 1;
LABEL_44:
  if (PKEqualObjects() && self->_pinnedAmountAngle == v26)
  {
    if (self->_pinnedAmountAngleIndex == v20)
      v47 = v46;
    else
      v47 = 1;
    if (target == a3 && v47 == 0)
    {
      v47 = 0;
      if (v13)
        goto LABEL_59;
      goto LABEL_57;
    }
  }
  else
  {
    v47 = 1;
  }
  p_angleState->target = a3;
  if (!p_angleState->running && p_angleState->position != a3)
    p_angleState->running = 1;
  v48 = (NSDecimalNumber *)objc_msgSend(v17, "copy");
  pinnedAmount = self->_pinnedAmount;
  self->_pinnedAmount = v48;

  self->_pinnedAmountAngle = v26;
  self->_pinnedAmountAngleIndex = v20;
  if (self->_overrideGradientState)
  {
    -[PKRingGradientView gradientStartColor](self->_ringView, "gradientStartColor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRingGradientView gradientEndColor](self->_ringView, "gradientEndColor");
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = (void *)v51;
    if (v50 && v51)
    {
      v53 = -[PKBillPaymentRingGradientState initWithStartColor:endColor:]([PKBillPaymentRingGradientState alloc], "initWithStartColor:endColor:", v50, v51);
      overrideGradientState = self->_overrideGradientState;
      self->_overrideGradientState = v53;

      self->_overrideGradientStartAngle = position;
    }
    else
    {
      v55 = self->_overrideGradientState;
      self->_overrideGradientState = 0;

    }
  }
  -[PKBillPaymentRingView didUpdateAngleSpringTarget](self, "didUpdateAngleSpringTarget");
  if (!v13)
  {
LABEL_57:
    v56 = self->_overrideGradientState;
    self->_overrideGradientState = 0;

    if (p_angleState->running)
    {
      p_angleState->running = 0;
      p_angleState->position = p_angleState->target;
      p_angleState->velocity = 0.0;
    }
  }
LABEL_59:
  if (((p_angleState->position == position) & ~v47) == 0)
    -[PKBillPaymentRingView didUpdateAngleSpringPosition](self, "didUpdateAngleSpringPosition");
  if (p_angleState->running)
  {
    if (target != a3)
    {
      if (v13 && v8)
      {
        if (!self->_feedbackGenerator)
        {
          objc_msgSend(MEMORY[0x1E0DC4320], "defaultConfiguration");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "tweakedConfigurationForCaller:usage:", self, CFSTR("majorSelection"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0DC4100], "feedbackWithDictionaryRepresentation:", &unk_1E3FAEB90);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "setFeedback:", v59);

          v60 = (UISelectionFeedbackGenerator *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C60]), "initWithConfiguration:coordinateSpace:", v58, self);
          feedbackGenerator = self->_feedbackGenerator;
          self->_feedbackGenerator = v60;

          if (self->_dragging)
            -[UISelectionFeedbackGenerator userInteractionStarted](self->_feedbackGenerator, "userInteractionStarted");
          goto LABEL_69;
        }
      }
      else if (!self->_dragging)
      {
        v58 = self->_feedbackGenerator;
        self->_feedbackGenerator = 0;
LABEL_69:

      }
    }
    v62 = vabdd_f64(p_angleState->position, p_angleState->target);
    if (self->_dragging)
    {
      v63 = fmin(fmax((v62 + -0.575958653) / 5.18362788, 0.0), 1.0);
      v64 = 1.0 - v63;
      v65 = v63 * -0.356674944;
      v66 = -2.07944154;
    }
    else
    {
      v67 = v62 / 5.75958653;
      v64 = 1.0 - v67;
      v65 = v67 * -0.356674944;
      v66 = -1.04982212;
    }
    -[PKBillPaymentRingView _setResponse:](self, "_setResponse:", (double)exp(v65 + v64 * v66));
  }
  -[PKBillPaymentRingView _updatePausedState](self, "_updatePausedState");

}

- (void)setHandleScale:(double)a3 animated:(BOOL)a4
{
  $E58A6ABF409EF437589341D84DF456DA *p_scaleState;
  double position;
  double v8;
  double v10;

  p_scaleState = &self->_scaleState;
  position = self->_scaleState.position;
  v8 = log(a3);
  p_scaleState->target = v8;
  if (p_scaleState->running || position == v8)
  {
    v10 = position;
    if (!p_scaleState->running)
      goto LABEL_9;
  }
  else
  {
    p_scaleState->running = 1;
  }
  v10 = position;
  if (!a4)
  {
    p_scaleState->running = 0;
    p_scaleState->position = v8;
    v10 = v8;
    p_scaleState->velocity = 0.0;
  }
LABEL_9:
  if (v10 != position)
    -[PKBillPaymentRingView didUpdateScaleSpringPosition](self, "didUpdateScaleSpringPosition");
  -[PKBillPaymentRingView _updatePausedState](self, "_updatePausedState");
}

- (BOOL)_preferredPausedState
{
  return !self->_angleState.running && !self->_scaleState.running;
}

- (void)_updatePausedState
{
  double target;

  if (-[PKBillPaymentRingView _preferredPausedState](self, "_preferredPausedState"))
  {
    -[PKBillPaymentRingView _pauseRenderLoop](self, "_pauseRenderLoop");
  }
  else if (-[PKRenderLoop isPaused](self->_renderLoop, "isPaused"))
  {
    if (self->_responseState.running)
    {
      self->_responseState.running = 0;
      target = self->_responseState.target;
      self->_responseState.position = target;
      self->_responseState.velocity = 0.0;
      SpringSetResponse((uint64_t)&self->_spring, target);
    }
    self->_lastDrawTime = CACurrentMediaTime();
    -[PKRenderLoop setPaused:](self->_renderLoop, "setPaused:", 0);
  }
}

- (id)_blendFromGradientState:(id)a3 toState:(id)a4 withProgress:(double)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PKBillPaymentRingGradientState *v17;

  v7 = (void *)MEMORY[0x1E0DC3658];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "startColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pkui_blendFromColor:toColor:withProgress:", v10, v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0DC3658];
  objc_msgSend(v9, "endColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "endColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "pkui_blendFromColor:toColor:withProgress:", v14, v15, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[PKBillPaymentRingGradientState initWithStartColor:endColor:]([PKBillPaymentRingGradientState alloc], "initWithStartColor:endColor:", v12, v16);
  return v17;
}

- (void)_updateForEnabledState
{
  void *v3;
  id v4;

  if (self->_enabled)
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_enabled)
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKEnterCurrencyAmountView setTextColor:](self->_enterCurrencyAmountView, "setTextColor:", v4);
  -[PKCurvedTextLabel setTextColor:](self->_topCurvedTextLabel, "setTextColor:", v3);
  -[PKCurvedTextLabel setTextColor:](self->_bottomCurvedTextLabel, "setTextColor:", v3);
  -[UITapGestureRecognizer setEnabled:](self->_tapRecognizer, "setEnabled:", self->_enabled);
  -[UIPanGestureRecognizer setEnabled:](self->_dragRecognizer, "setEnabled:", self->_enabled);
  -[PKBillPaymentCircularView setHidden:](self->_handleView, "setHidden:", !self->_enabled);
  -[PKRingGradientView setEnabled:](self->_ringView, "setEnabled:", self->_enabled);

}

- (void)_updateCurvedText
{
  _BOOL4 enabled;
  PKBillPaymentRingViewDataSource **p_dataSource;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id v9;

  enabled = self->_enabled;
  p_dataSource = &self->_dataSource;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v6 = WeakRetained;
  if (enabled)
  {
    objc_msgSend(WeakRetained, "billPaymentRingView:topCurvedTextForSuggestedAmount:", self, self->_highlightedSuggestedAmount);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v7 = objc_loadWeakRetained((id *)p_dataSource);
    objc_msgSend(v7, "billPaymentRingView:bottomCurvedTextForSuggestedAmount:", self, self->_highlightedSuggestedAmount);
  }
  else
  {
    objc_msgSend(WeakRetained, "disabledTopCurvedTextForBillPaymentRingView:", self);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v7 = objc_loadWeakRetained((id *)p_dataSource);
    objc_msgSend(v7, "disabledBottomCurvedTextForBillPaymentRingView:", self);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKCurvedTextLabel setText:](self->_topCurvedTextLabel, "setText:", v9);
  -[PKCurvedTextLabel setText:](self->_bottomCurvedTextLabel, "setText:", v8);

}

- (void)_setResponse:(double)a3
{
  if (self->_responseState.target != a3)
  {
    self->_responseSpringElapsedDuration = 0.0;
    self->_responseState.target = a3;
    if (!self->_responseState.running && self->_responseState.position != a3)
      self->_responseState.running = 1;
  }
}

- (void)_setDotsVisible:(BOOL)a3 animated:(BOOL)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  _QWORD v10[5];

  if (((!self->_dotsVisible ^ a3) & 1) == 0)
  {
    if (a4)
    {
      -[PKBillPaymentRingView layoutIfNeeded](self, "layoutIfNeeded");
      self->_dotsVisible = a3;
      -[PKBillPaymentRingView setNeedsLayout](self, "setNeedsLayout");
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6C038]), "initWithMass:stiffness:damping:", 3.0, 1000.0, 500.0);
      v7 = v6;
      v8 = MEMORY[0x1E0C809B0];
      if (self->_dotsVisible)
      {
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __50__PKBillPaymentRingView__setDotsVisible_animated___block_invoke;
        v10[3] = &unk_1E3E6AB68;
        v10[4] = self;
        objc_msgSend(v6, "setAnimationDelayHandler:", v10);
      }
      v9[0] = v8;
      v9[1] = 3221225472;
      v9[2] = __50__PKBillPaymentRingView__setDotsVisible_animated___block_invoke_2;
      v9[3] = &unk_1E3E612E8;
      v9[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "pkui_animateUsingFactory:withDelay:options:animations:completion:", v7, 0, v9, 0, 0.0);

    }
    else
    {
      self->_dotsVisible = a3;
      -[PKBillPaymentRingView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

double __50__PKBillPaymentRingView__setDotsVisible_animated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  unint64_t v8;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("opacity")) & 1) != 0
    || (v7 = 0.0, objc_msgSend(v6, "isEqualToString:", CFSTR("transform"))))
  {
    v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "indexOfObjectIdenticalTo:", v5);
    v7 = 0.0;
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      v7 = (double)v8 * 0.15;
  }

  return v7;
}

uint64_t __50__PKBillPaymentRingView__setDotsVisible_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (BOOL)_setDisplayAmount:(id)a3
{
  id v4;
  BOOL v5;
  NSDecimalNumber *v6;
  NSDecimalNumber *displayAmount;

  v4 = a3;
  if ((PKEqualObjects() & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = (NSDecimalNumber *)objc_msgSend(v4, "copy");
    displayAmount = self->_displayAmount;
    self->_displayAmount = v6;

    v5 = -[PKBillPaymentRingView _updateEffectiveDisplayAmount](self, "_updateEffectiveDisplayAmount");
  }

  return v5;
}

- (BOOL)_updateEffectiveDisplayAmount
{
  NSDecimalNumber *overrideDisplayAmount;
  NSDecimalNumber *v4;
  NSDecimalNumber **p_effectiveDisplayAmount;
  char v6;
  id WeakRetained;
  void *v8;

  overrideDisplayAmount = self->_overrideDisplayAmount;
  if (!overrideDisplayAmount)
    overrideDisplayAmount = self->_displayAmount;
  v4 = overrideDisplayAmount;
  p_effectiveDisplayAmount = &self->_effectiveDisplayAmount;
  v6 = PKEqualObjects();
  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_effectiveDisplayAmount, overrideDisplayAmount);
    -[PKEnterCurrencyAmountView setCurrentAmount:forceFormatForDisplay:](self->_enterCurrencyAmountView, "setCurrentAmount:forceFormatForDisplay:", *p_effectiveDisplayAmount, PKIsVision() ^ 1);
    -[PKBillPaymentRingView _updateInterestText](self, "_updateInterestText");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v8 = (void *)-[NSDecimalNumber copy](*p_effectiveDisplayAmount, "copy");
      objc_msgSend(WeakRetained, "billPaymentRingView:amountChanged:", self, v8);

    }
    -[PKBillPaymentRingView setNeedsLayout](self, "setNeedsLayout");

  }
  return v6 ^ 1;
}

- (void)_setSelectedSuggestedAmount:(id)a3
{
  void *v3;
  void *v4;
  id v7;
  unint64_t pinnedAmountAngleIndex;
  NSDecimalNumber *initialDisplayAmount;
  NSDictionary *suggestedAmountsForAngle;
  uint64_t v11;
  void *v12;
  BOOL v13;
  id WeakRetained;
  id v15;

  v7 = a3;
  v15 = v7;
  if (v7)
  {
    pinnedAmountAngleIndex = self->_pinnedAmountAngleIndex;
    if (pinnedAmountAngleIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      suggestedAmountsForAngle = self->_suggestedAmountsForAngle;
      -[NSArray objectAtIndexedSubscript:](self->_suggestedAmountAngles, "objectAtIndexedSubscript:", self->_pinnedAmountAngleIndex);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](suggestedAmountsForAngle, "objectForKeyedSubscript:", v3);
      v11 = objc_claimAutoreleasedReturnValue();
      v7 = v15;
      if ((id)v11 == v15)
      {
        LODWORD(initialDisplayAmount) = 1;
        v4 = v15;
      }
      else
      {
        v4 = (void *)v11;
        initialDisplayAmount = self->_initialDisplayAmount;
        if (initialDisplayAmount)
          goto LABEL_8;
      }
LABEL_11:

      goto LABEL_12;
    }
    initialDisplayAmount = self->_initialDisplayAmount;
    if (initialDisplayAmount)
    {
LABEL_8:
      objc_msgSend(v7, "amount");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(initialDisplayAmount) = PKEqualObjects();

      if (pinnedAmountAngleIndex == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else
  {
    LODWORD(initialDisplayAmount) = 0;
  }
LABEL_12:
  if (!PKEqualObjects()
    || (!self->_needsInitialDisplay
      ? (v13 = initialDisplayAmount == self->_selectedSuggestedAmountIsTarget)
      : (v13 = 0),
        !v13))
  {
    self->_selectedSuggestedAmountIsTarget = (char)initialDisplayAmount;
    objc_storeStrong((id *)&self->_selectedSuggestedAmount, a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "billPaymentRingView:selectedSuggestedAmount:selectedSuggestedAmountIsTarget:userInitiatedChange:", self, self->_selectedSuggestedAmount, self->_selectedSuggestedAmountIsTarget, self->_userSelectedAngleChange);

  }
}

- (void)_setHighlightedSuggestedAmount:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_highlightedSuggestedAmount, a3);
    if (self->_enabled)
      -[PKBillPaymentRingView _updateCurvedText](self, "_updateCurvedText");
  }

}

- (id)_stickySuggestedAmountForCurrentAngle
{
  unint64_t pinnedAmountAngleIndex;
  double position;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  void *v10;

  if (!self->_pinnedAmount
    || (pinnedAmountAngleIndex = self->_pinnedAmountAngleIndex, pinnedAmountAngleIndex == 0x7FFFFFFFFFFFFFFFLL)
    || ((-[PKBillPaymentRingView _angleForAngleIndex:](self, "_angleForAngleIndex:", self->_pinnedAmountAngleIndex),
         position = self->_angleState.position,
         v6 = v5 + -0.172787596,
         v7 = v5 + 0.172787596,
         position >= v6)
      ? (v8 = position > v7)
      : (v8 = 1),
        v8))
  {
    v10 = 0;
  }
  else
  {
    -[PKBillPaymentRingView _suggestedAmountForAngleIndex:](self, "_suggestedAmountForAngleIndex:", pinnedAmountAngleIndex);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (void)_updateHandleImage
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  if (self->_isSmall)
  {
    -[PKBillPaymentRingView _suggestedAmountImageForSuggestedAmount:](self, "_suggestedAmountImageForSuggestedAmount:", self->_selectedSuggestedAmount);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKBillPaymentRingView _stickySuggestedAmountForCurrentAngle](self, "_stickySuggestedAmountForCurrentAngle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[PKBillPaymentRingView _suggestedAmountImageForSuggestedAmount:](self, "_suggestedAmountImageForSuggestedAmount:", v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

    v3 = (uint64_t)v5;
  }
  v6 = (id)v3;
  -[PKBillPaymentCircularView setImage:](self->_handleView, "setImage:", v3);

}

- (void)_updateInterestText
{
  PKBillPaymentRingViewDataSource **p_dataSource;
  id WeakRetained;
  void *v5;
  NSDecimalNumber *initialDisplayAmount;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  int v14;
  BOOL v15;
  void *v16;
  void *v17;
  UILabel *interestLabel;
  id v19;
  double v20;
  _QWORD v21[5];
  _QWORD v22[5];

  p_dataSource = &self->_dataSource;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v5 = WeakRetained;
  initialDisplayAmount = self->_initialDisplayAmount;
  if (!initialDisplayAmount)
    initialDisplayAmount = self->_effectiveDisplayAmount;
  objc_msgSend(WeakRetained, "billPaymentRingView:interestTextForAmount:", self, initialDisplayAmount);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel text](self->_interestLabel, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_loadWeakRetained((id *)p_dataSource);
  objc_msgSend(v9, "billPaymentRingViewZeroInterestText:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v11 = v7;
  else
    v11 = v10;
  v12 = v11;

  v13 = PKEqualObjects();
  v14 = PKEqualObjects();
  if (self->_needsInitialDisplay || (!self->_isSmall ? (v15 = (v13 | v14) == 0) : (v15 = 1), v15))
  {
    v16 = 0;
    if (v13)
    {
LABEL_16:
      interestLabel = self->_interestLabel;
      v19 = v10;
      goto LABEL_18;
    }
  }
  else
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6C038]), "initWithMass:stiffness:damping:", 3.0, 1000.0, 500.0);
    v16 = v17;
    if (v13)
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __44__PKBillPaymentRingView__updateInterestText__block_invoke;
      v22[3] = &unk_1E3E6AB68;
      v22[4] = self;
      objc_msgSend(v17, "setAnimationDelayHandler:", v22);
      goto LABEL_16;
    }
  }
  interestLabel = self->_interestLabel;
  v19 = v12;
LABEL_18:
  -[UILabel setText:](interestLabel, "setText:", v19);
  if (v16)
    -[PKBillPaymentRingView layoutIfNeeded](self, "layoutIfNeeded");
  v20 = 1.0;
  if (v13)
    v20 = 0.0;
  self->_interestLabelAlpha = v20;
  if ((v13 & 1) == 0)
    -[UILabel setText:](self->_interestLabel, "setText:", v12);
  -[PKBillPaymentRingView setNeedsLayout](self, "setNeedsLayout");
  if (v16)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __44__PKBillPaymentRingView__updateInterestText__block_invoke_2;
    v21[3] = &unk_1E3E612E8;
    v21[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "pkui_animateUsingFactory:withDelay:options:animations:completion:", v16, 4, v21, 0, 0.0);
  }

}

double __44__PKBillPaymentRingView__updateInterestText__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("opacity")) & 1) != 0
    || (v7 = 0.0, objc_msgSend(v6, "isEqualToString:", CFSTR("position"))))
  {
    if (*(id *)(*(_QWORD *)(a1 + 32) + 1024) == v5)
      v7 = 0.35;
    else
      v7 = 0.0;
  }

  return v7;
}

uint64_t __44__PKBillPaymentRingView__updateInterestText__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_pauseRenderLoop
{
  UISelectionFeedbackGenerator *feedbackGenerator;
  NSDecimalNumber *initialDisplayAmount;

  -[PKRenderLoop setPaused:](self->_renderLoop, "setPaused:", 1);
  if (!self->_dragging)
  {
    feedbackGenerator = self->_feedbackGenerator;
    self->_feedbackGenerator = 0;

  }
  initialDisplayAmount = self->_initialDisplayAmount;
  if (initialDisplayAmount)
  {
    if (!self->_needsInitialDisplay)
    {
      self->_initialDisplayAmount = 0;

    }
  }
}

- (double)_angleForAmount:(id)a3
{
  id v4;
  NSUInteger v5;
  double v6;
  double v7;
  double minimumPaymentAmount;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v4 = a3;
  v5 = -[NSArray count](self->_suggestedAmountAngles, "count");
  objc_msgSend(v4, "doubleValue");
  v7 = v6;
  minimumPaymentAmount = self->_minimumPaymentAmount;
  if (v6 >= minimumPaymentAmount)
  {
    if (v5)
    {
      v11 = 0;
      v12 = 0.523598776;
      while (1)
      {
        -[NSArray objectAtIndexedSubscript:](self->_suggestedAmountAngles, "objectAtIndexedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](self->_suggestedAmountsForAngle, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "amount");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "doubleValue");
        v17 = v16;

        objc_msgSend(v13, "doubleValue");
        v10 = v18;
        if (v7 < v17)
          break;

        ++v11;
        v12 = v10;
        minimumPaymentAmount = v17;
        if (v5 == v11)
          goto LABEL_14;
      }
      if (v17 != minimumPaymentAmount)
      {
        v19 = fmin(fmax((v7 - minimumPaymentAmount) / (v17 - minimumPaymentAmount), 0.0), 1.0);
        v12 = v10 * v19 + v12 * (1.0 - v19);
      }

      v10 = v12;
    }
    else
    {
      v10 = 6.28318531;
    }
  }
  else if (self->_isSmall)
  {
    v9 = fmin(fmax(v6 / minimumPaymentAmount, 0.0), 1.0);
    v10 = v9 * 0.523598776 + (1.0 - v9) * 0.226892803;
  }
  else
  {
    v10 = dbl_19DF15E60[v5 == 0];
  }
LABEL_14:

  return v10;
}

- (id)_roundedAmountForAngle:(double)a3
{
  NSUInteger v5;
  double maximumPaymentAmount;
  double minimumPaymentAmount;
  double v8;
  double v9;
  NSUInteger v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[2];
  int v28;

  v5 = -[NSArray count](self->_suggestedAmountAngles, "count");
  maximumPaymentAmount = self->_maximumPaymentAmount;
  minimumPaymentAmount = self->_minimumPaymentAmount;
  if (!v5)
  {
    v9 = self->_maximumPaymentAmount;
    if (a3 >= 0.523598776)
    {
      v9 = self->_maximumPaymentAmount;
      goto LABEL_14;
    }
    goto LABEL_8;
  }
  v8 = 0.523598776;
  v9 = self->_minimumPaymentAmount;
  if (a3 < 0.523598776)
  {
LABEL_8:
    if (self->_isSmall)
    {
      v18 = fmin(fmax((a3 + -0.226892803) / 0.296705973, 0.0), 1.0);
      v9 = v18 * minimumPaymentAmount + minimumPaymentAmount * (1.0 - v18);
    }
    goto LABEL_14;
  }
  v10 = v5;
  v11 = 0;
  while (1)
  {
    -[NSArray objectAtIndexedSubscript:](self->_suggestedAmountAngles, "objectAtIndexedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](self->_suggestedAmountsForAngle, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "amount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v9 = v15;

    objc_msgSend(v12, "doubleValue");
    v17 = v16;
    if (v16 > a3)
      break;

    ++v11;
    minimumPaymentAmount = v9;
    v8 = v17;
    if (v10 == v11)
    {
      minimumPaymentAmount = v9;
      goto LABEL_14;
    }
  }
  v19 = minimumPaymentAmount;
  if (v16 != v8)
  {
    v20 = fmin(fmax((a3 - v8) / (v16 - v8), 0.0), 1.0);
    v19 = v9 * v20 + minimumPaymentAmount * (1.0 - v20);
  }

  maximumPaymentAmount = v9;
  v9 = v19;
LABEL_14:
  v21 = fmin(fmax(self->_amountRoundingUnit * round(v9 / self->_amountRoundingUnit), minimumPaymentAmount), maximumPaymentAmount);
  v22 = (void *)MEMORY[0x1E0CB3598];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    objc_msgSend(v23, "decimalValue");
  }
  else
  {
    v27[0] = 0;
    v27[1] = 0;
    v28 = 0;
  }
  objc_msgSend(v22, "decimalNumberWithDecimal:", v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (BOOL)_isAmount:(id)a3 withinRoundingUnitOfAmount:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double amountRoundingUnit;

  v6 = a4;
  objc_msgSend(a3, "doubleValue");
  v8 = v7;
  objc_msgSend(v6, "doubleValue");
  v10 = v9;

  amountRoundingUnit = self->_amountRoundingUnit;
  return v8 <= v10 + amountRoundingUnit && v8 >= v10 - amountRoundingUnit;
}

- (CGPoint)_centerPointAtAngle:(double)a3 adjustToCover:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  float v15;
  __float2 v16;
  double v17;
  double v18;
  CGPoint result;
  CGRect v20;

  v4 = a4;
  -[PKBillPaymentRingView _center](self, "_center");
  v8 = v7;
  v10 = v9;
  -[PKRingGradientView frame](self->_ringView, "frame");
  v11 = CGRectGetWidth(v20) * 0.5;
  -[PKBillPaymentRingView _ringWidth](self, "_ringWidth");
  v13 = v11 - v12 * 0.5;
  if (v4)
  {
    v14 = PKUIPixelLength();
    a3 = a3 + asin(v14 / v13) * -5.0;
  }
  v15 = a3;
  v16 = __sincosf_stret(v15);
  v17 = v10 + v13 * v16.__sinval;
  v18 = v8 + v13 * v16.__cosval;
  result.y = v17;
  result.x = v18;
  return result;
}

- (double)_offsetAngle:(double)a3
{
  return a3 + 4.71238898;
}

- (double)_offsetCurrentAngle
{
  double result;

  -[PKBillPaymentRingView _offsetAngle:](self, "_offsetAngle:", self->_angleState.position);
  return result;
}

- (CGPoint)_center
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  double MidY;
  double v8;
  CGPoint result;
  CGRect v10;
  CGRect v11;

  -[PKRingGradientView frame](self->_ringView, "frame");
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  MidX = CGRectGetMidX(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  MidY = CGRectGetMidY(v11);
  v8 = MidX;
  result.y = MidY;
  result.x = v8;
  return result;
}

- (double)_ringWidth
{
  double result;

  -[PKRingGradientView totalWidth](self->_ringView, "totalWidth");
  return result;
}

- (double)_amountLabelMaximumFontSize
{
  uint64_t v2;
  double result;

  v2 = PKUIGetMinScreenWidthType();
  result = 57.0;
  if (!v2)
    return 42.0;
  return result;
}

- (unint64_t)_unnormalizedAngleIndexForAngle:(double)a3
{
  NSUInteger v5;
  NSUInteger v6;
  unint64_t v7;
  double v8;
  unint64_t v9;
  void *v10;
  double v11;

  v5 = -[NSArray count](self->_suggestedAmountAngles, "count");
  if (!v5)
    return 0x7FFFFFFFFFFFFFFFLL;
  v6 = v5;
  v7 = 0;
  v8 = fmax(a3, 0.523598776);
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    -[NSArray objectAtIndexedSubscript:](self->_suggestedAmountAngles, "objectAtIndexedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    if (v8 >= v11)
      v9 = v7;

    ++v7;
  }
  while (v6 != v7);
  return v9;
}

- (unint64_t)_segmentEndAngleIndexForAngle:(double)a3
{
  unint64_t result;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  result = -[NSArray count](self->_suggestedAmountAngles, "count");
  if (result)
  {
    v6 = result;
    v7 = -[PKBillPaymentRingView _unnormalizedAngleIndexForAngle:](self, "_unnormalizedAngleIndexForAngle:", a3);
    if (v7 + 1 < v6 - 1)
      v8 = v7 + 1;
    else
      v8 = v6 - 1;
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
    else
      return v8;
  }
  return result;
}

- (double)_angleForAngleIndex:(unint64_t)a3
{
  void *v5;
  double v6;
  double v7;

  if (-[NSArray count](self->_suggestedAmountAngles, "count") <= a3)
    return 0.0;
  -[NSArray objectAtIndexedSubscript:](self->_suggestedAmountAngles, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (id)_suggestedAmountForAngleIndex:(unint64_t)a3
{
  NSDictionary *suggestedAmountsForAngle;
  void *v6;
  void *v7;

  if (-[NSArray count](self->_suggestedAmountAngles, "count") <= a3)
  {
    v7 = 0;
  }
  else
  {
    suggestedAmountsForAngle = self->_suggestedAmountsForAngle;
    -[NSArray objectAtIndexedSubscript:](self->_suggestedAmountAngles, "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](suggestedAmountsForAngle, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)_suggestedAmountImageForSuggestedAmount:(id)a3
{
  id v4;
  void *v5;
  NSDictionary *suggestedAmoutImages;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_11;
  if (objc_msgSend(v4, "category") != 1)
  {
    if (objc_msgSend(v5, "category") == 19)
    {
      suggestedAmoutImages = self->_suggestedAmoutImages;
LABEL_6:
      v7 = &unk_1E3FAD1C8;
      goto LABEL_10;
    }
    if (objc_msgSend(v5, "category") == 18)
    {
      -[PKBillPaymentSuggestedAmountList suggestedAmountWithCategory:](self->_suggestedAmountList, "suggestedAmountWithCategory:", 19);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      suggestedAmoutImages = self->_suggestedAmoutImages;
      if (v8)
      {
        v7 = &unk_1E3FAD1E0;
        goto LABEL_10;
      }
      goto LABEL_6;
    }
LABEL_11:
    v9 = 0;
    goto LABEL_12;
  }
  suggestedAmoutImages = self->_suggestedAmoutImages;
  v7 = &unk_1E3FAD1B0;
LABEL_10:
  -[NSDictionary objectForKey:](suggestedAmoutImages, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v9;
}

- (id)_targetGradientStateForAngle:(double)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSDictionary *standardRingStates;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  id v22;
  void *v23;

  v5 = -[PKBillPaymentRingView _segmentEndAngleIndexForAngle:](self, "_segmentEndAngleIndexForAngle:");
  v6 = v5;
  if (v5)
    v7 = v5 - 1;
  else
    v7 = 0;
  -[PKBillPaymentRingView _angleForAngleIndex:](self, "_angleForAngleIndex:", v5);
  v9 = v8;
  -[PKBillPaymentRingView _suggestedAmountForAngleIndex:](self, "_suggestedAmountForAngleIndex:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKBillPaymentRingView _gradientStateForSuggestedAmount:](self, "_gradientStateForSuggestedAmount:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    -[PKBillPaymentSuggestedAmountList smalllestSuggestionAmountBelowRemainingStatementAmount](self->_suggestedAmountList, "smalllestSuggestionAmountBelowRemainingStatementAmount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "pk_isPositiveNumber");

    if (v13)
    {
      standardRingStates = self->_standardRingStates;
      v15 = &unk_1E3FAD1B0;
    }
    else
    {
      -[PKBillPaymentSuggestedAmountList remainingStatementAmount](self->_suggestedAmountList, "remainingStatementAmount");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      standardRingStates = self->_standardRingStates;
      if (v20)
        v15 = &unk_1E3FAD1E0;
      else
        v15 = &unk_1E3FAD1C8;
    }
    -[NSDictionary objectForKeyedSubscript:](standardRingStates, "objectForKeyedSubscript:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0.523598776;
  }
  else
  {
    -[PKBillPaymentRingView _angleForAngleIndex:](self, "_angleForAngleIndex:", v7);
    v17 = v16;
    -[PKBillPaymentRingView _suggestedAmountForAngleIndex:](self, "_suggestedAmountForAngleIndex:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKBillPaymentRingView _gradientStateForSuggestedAmount:](self, "_gradientStateForSuggestedAmount:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v21 = fmin(v9 - v17, 0.172787596);
  if (v9 - v21 >= a3)
  {
    v22 = v19;
  }
  else if (v9 <= a3)
  {
    v22 = v11;
  }
  else
  {
    -[PKBillPaymentRingView _blendFromGradientState:toState:withProgress:](self, "_blendFromGradientState:toState:withProgress:", v19, v11, (a3 - (v9 - v21)) / v21);
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  v23 = v22;

  return v23;
}

- (id)_gradientStateForSuggestedAmount:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  unsigned int v9;
  uint64_t v10;
  BOOL v11;
  int v12;
  uint64_t v13;
  BOOL v14;
  int v15;
  uint64_t v16;
  unsigned int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSDictionary *standardRingStates;
  void *v25;
  void *v26;

  objc_msgSend(a3, "amount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_colorStops, "objectForKeyedSubscript:", &unk_1E3FAD1B0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_colorStops, "objectForKeyedSubscript:", &unk_1E3FAD1C8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_colorStops, "objectForKeyedSubscript:", &unk_1E3FAD1F8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v8 = v4 == 0;
  else
    v8 = 1;
  v9 = !v8;
  if (v8)
    v10 = 1;
  else
    v10 = objc_msgSend(v4, "compare:", v5);
  if (v6)
    v11 = v4 == 0;
  else
    v11 = 1;
  v12 = !v11;
  if (v11)
    v13 = 1;
  else
    v13 = objc_msgSend(v4, "compare:", v6);
  if (v7)
    v14 = v4 == 0;
  else
    v14 = 1;
  v15 = !v14;
  if (v14)
    v16 = 1;
  else
    v16 = objc_msgSend(v4, "compare:", v7);
  if (v10 == 1)
    v17 = 0;
  else
    v17 = v9;
  v18 = v12 ^ 1;
  if (v13 == 1)
    v18 = 1;
  if ((v17 & 1) != 0)
    v18 = 0;
  if ((unint64_t)(v10 - 1) < 0xFFFFFFFFFFFFFFFELL)
    v19 = v9;
  else
    v19 = 0;
  if (v17)
    v20 = v19;
  else
    v20 = 1;
  if (v13 != -1)
    v20 = 2;
  if (v12)
    v19 = v20;
  if (v18)
    v21 = 2;
  else
    v21 = v19;
  if (v17)
    v22 = v19;
  else
    v22 = v21;
  if (v16 != -1)
    v22 = 3;
  if (v15)
    v23 = v22;
  else
    v23 = v19;
  standardRingStates = self->_standardRingStates;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](standardRingStates, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (void)_createSuggestedAmountsImageDictionary
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  NSDictionary *v15;
  NSDictionary *suggestedAmoutImages;
  id v17;

  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  PKPassKitUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("Bill_Payment_Exclamation"), CFSTR("pdf"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = PKUIScreenScale();
  PKUIImageFromPDF(v4, 18.0, 18.0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v6, &unk_1E3FAD1B0);
  PKPassKitUIBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLForResource:withExtension:", CFSTR("Bill_Payment_Checkmark"), CFSTR("pdf"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = PKUIScreenScale();
  PKUIImageFromPDF(v8, 18.0, 18.0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setObject:forKey:", v10, &unk_1E3FAD1E0);
  PKPassKitUIBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLForResource:withExtension:", CFSTR("Bill_Payment_Star"), CFSTR("pdf"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = PKUIScreenScale();
  PKUIImageFromPDF(v12, 18.0, 18.0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setObject:forKey:", v14, &unk_1E3FAD1C8);
  v15 = (NSDictionary *)objc_msgSend(v17, "copy");
  suggestedAmoutImages = self->_suggestedAmoutImages;
  self->_suggestedAmoutImages = v15;

}

- (void)_createSuggestedAmountAngles
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  char v30;
  char v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  NSArray *v49;
  NSArray *suggestedAmountAngles;
  NSDictionary *v51;
  NSDictionary *suggestedAmountsForAngle;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  char v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  -[PKBillPaymentSuggestedAmountList minimumAmount](self->_suggestedAmountList, "minimumAmount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKBillPaymentSuggestedAmountList maximumAmount](self->_suggestedAmountList, "maximumAmount");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "doubleValue");
  v5 = v4;
  if (v3)
    objc_msgSend(v3, "doubleValue");
  else
    v6 = 0.0;
  v7 = v5 - v6;
  v8 = 0.01;
  v55 = v3;
  if (v7 != 0.0)
  {
    v9 = 0;
    v10 = 1.79769313e308;
    v11 = fabs(v7) / 100.0;
    while (1)
    {
      v12 = v9 >= 0xA
          ? __exp10((double)((v9 - 10) / 3u + 2)) * RoundingUnit_map[(v9 - 10) % 3u]
          : dbl_19DF15F20[v9];
      if (v12 >= v11)
        break;
      v13 = v11 - v12;
      if (v13 < v10 && v13 > 0.0)
      {
        v10 = v13;
        if (v9++ != 99)
          continue;
      }
      goto LABEL_16;
    }
    v8 = v12;
  }
LABEL_16:
  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v16 = v15;
  }
  else
  {
    -[PKBillPaymentSuggestedAmountList remainingStatementAmount](self->_suggestedAmountList, "remainingStatementAmount");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v16 = v8;
    if (v17)
    {
      objc_msgSend(v17, "doubleValue");
      v16 = fmin(v19, v8);
    }
    -[PKBillPaymentSuggestedAmountList maximumAmount](self->_suggestedAmountList, "maximumAmount");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v20, "doubleValue");
      v16 = fmin(v21, v16);
    }
    v3 = v55;

  }
  self->_amountRoundingUnit = v8;
  self->_minimumPaymentAmount = v16;
  self->_maximumPaymentAmount = v5;
  v22 = vabdd_f64(v5, v16);
  -[PKBillPaymentSuggestedAmountList suggestedAmountWithCategory:](self->_suggestedAmountList, "suggestedAmountWithCategory:", 18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "amount");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "doubleValue");
  v26 = v25;
  v57 = 0;
  v56 = 0.0;
  if (v24)
  {
    v27 = 0.0;
    if (v5 - v16 == 0.0)
      goto LABEL_36;
    v28 = fmin(fmax((v25 - v16) / v22, 0.0), 1.0);
    v29 = v28 * 6.28318531 + (1.0 - v28) * 0.523598776;
    if (v3)
      v30 = objc_msgSend(v24, "isEqual:", v3);
    else
      v30 = 0;
    v31 = objc_msgSend(v24, "isEqual:", v54);
    v27 = 5.75958653;
    if (v29 > 5.75958653 && (v31 & 1) == 0)
      goto LABEL_30;
    v57 = 0;
    v56 = 0.0;
    if (v3)
    {
      v27 = 1.04719755;
      if (v29 < 1.04719755)
      {
        if ((v30 & 1) == 0)
        {
LABEL_30:
          v22 = fabs(v26 - v16);
          v56 = vabdd_f64(v5, v26);
          v57 = 1;
          goto LABEL_36;
        }
        v57 = 0;
      }
    }
  }
  v27 = 0.0;
LABEL_36:
  v53 = v24;
  v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v58 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  -[PKBillPaymentSuggestedAmountList sortedSuggestedAmounts](self->_suggestedAmountList, "sortedSuggestedAmounts");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v60 != v36)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        objc_msgSend(v38, "amount", v53);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "doubleValue");
        v41 = v40;

        if (v41 >= self->_minimumPaymentAmount && v41 <= self->_maximumPaymentAmount)
        {
          if ((v57 & 1) != 0)
          {
            if (v22 <= 0.0)
            {
              if (v41 <= v26)
                v42 = v27;
              else
                v42 = 6.28318531;
            }
            else
            {
              if (v41 > v26)
              {
                v42 = 6.28318531;
                if (v56 > 0.0)
                {
                  v43 = fmin(fmax((v41 - v26) / v56, 0.0), 1.0);
                  v42 = v43 * 6.28318531 + v27 * (1.0 - v43);
                }
                goto LABEL_55;
              }
              v47 = fmin(fmax((v41 - v16) / v22, 0.0), 1.0);
              v45 = 1.0 - v47;
              v46 = v27 * v47;
LABEL_54:
              v42 = v46 + v45 * 0.523598776;
            }
          }
          else
          {
            v42 = 6.28318531;
            if (v22 > 0.0)
            {
              v44 = fmin(fmax((v41 - v16) / v22, 0.0), 1.0);
              v45 = 1.0 - v44;
              v46 = v44 * 6.28318531;
              goto LABEL_54;
            }
          }
LABEL_55:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v42);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v48);
          objc_msgSend(v58, "setObject:forKeyedSubscript:", v38, v48);

          continue;
        }
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
    }
    while (v35);
  }

  objc_msgSend(v32, "sortUsingComparator:", &__block_literal_global_80);
  v49 = (NSArray *)objc_msgSend(v32, "copy");
  suggestedAmountAngles = self->_suggestedAmountAngles;
  self->_suggestedAmountAngles = v49;

  v51 = (NSDictionary *)objc_msgSend(v58, "copy");
  suggestedAmountsForAngle = self->_suggestedAmountsForAngle;
  self->_suggestedAmountsForAngle = v51;

}

uint64_t __53__PKBillPaymentRingView__createSuggestedAmountAngles__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "doubleValue");
  v6 = v5;
  objc_msgSend(v4, "doubleValue");
  v8 = v7;

  if (v6 < v8)
    return -1;
  else
    return v6 > v8;
}

- (void)_createStandardColors
{
  id v2;
  uint64_t v3;
  PKBillPaymentRingGradientState *v4;
  __int128 v5;
  CGColorSpace *v6;
  CGColor *v7;
  void *v8;
  void *v9;
  __int128 v10;
  CGColorSpace *v11;
  CGColor *v12;
  void *v13;
  void *v14;
  PKBillPaymentRingGradientState *v15;
  void *v16;
  NSDictionary *v17;
  NSDictionary *standardRingStates;
  int64x2_t v20;
  CGFloat components;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = 0;
  v20 = vdupq_n_s64(0x3FD7D7D7D7D5AFEEuLL);
  do
  {
    v4 = [PKBillPaymentRingGradientState alloc];
    switch(v3)
    {
      case 0:
        components = 1.0;
        v5 = (__int128)v20;
        goto LABEL_7;
      case 1:
        components = 0.992;
        v5 = xmmword_19DF15E90;
        goto LABEL_7;
      case 2:
        components = 0.105882353;
        v5 = xmmword_19DF15E80;
        goto LABEL_7;
      case 3:
        components = 0.0392156863;
        v5 = xmmword_19DF15E70;
LABEL_7:
        v22 = v5;
        v23 = 0x3FF0000000000000;
        break;
      default:
        break;
    }
    v6 = (CGColorSpace *)PKColorSpaceStandardRGB();
    v7 = CGColorCreate(v6, &components);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CGColorRelease(v7);
    objc_msgSend(v8, "pkui_extendedLinearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    switch(v3)
    {
      case 0:
        components = 0.960784314;
        v10 = xmmword_19DF15ED0;
        goto LABEL_13;
      case 1:
        components = 1.0;
        v10 = xmmword_19DF15EC0;
        goto LABEL_13;
      case 2:
        components = 0.71372549;
        v10 = xmmword_19DF15EB0;
        goto LABEL_13;
      case 3:
        components = 0.615686275;
        v10 = xmmword_19DF15EA0;
LABEL_13:
        v22 = v10;
        v23 = 0x3FF0000000000000;
        break;
      default:
        break;
    }
    v11 = (CGColorSpace *)PKColorSpaceStandardRGB();
    v12 = CGColorCreate(v11, &components);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CGColorRelease(v12);
    objc_msgSend(v13, "pkui_extendedLinearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = -[PKBillPaymentRingGradientState initWithStartColor:endColor:](v4, "initWithStartColor:endColor:", v9, v14);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v15, v16);

    ++v3;
  }
  while (v3 != 4);
  v17 = (NSDictionary *)objc_msgSend(v2, "copy");
  standardRingStates = self->_standardRingStates;
  self->_standardRingStates = v17;

}

- (void)_createSuggestedAmountRingColorStops
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSDictionary *v9;
  NSDictionary *colorStops;
  id v11;

  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PKBillPaymentSuggestedAmountList minimumAmount](self->_suggestedAmountList, "minimumAmount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKBillPaymentSuggestedAmountList remainingStatementAmount](self->_suggestedAmountList, "remainingStatementAmount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKBillPaymentSuggestedAmountList maximumAmount](self->_suggestedAmountList, "maximumAmount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKBillPaymentSuggestedAmountList suggestedAmountWithCategory:](self->_suggestedAmountList, "suggestedAmountWithCategory:", 30);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "amount");
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  if (PKEqualObjects())
  {

    v5 = 0;
  }
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v3, &unk_1E3FAD1B0);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v4, &unk_1E3FAD1C8);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v5, &unk_1E3FAD1F8);
  v9 = (NSDictionary *)objc_msgSend(v11, "copy");
  colorStops = self->_colorStops;
  self->_colorStops = v9;

}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (PKBillPaymentRingViewDelegate)delegate
{
  return (PKBillPaymentRingViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKBillPaymentRingViewDataSource)dataSource
{
  return (PKBillPaymentRingViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (BOOL)isSmall
{
  return self->_isSmall;
}

- (PKEnterCurrencyAmountView)enterCurrencyAmountView
{
  return self->_enterCurrencyAmountView;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bottomCurvedTextLabel, 0);
  objc_storeStrong((id *)&self->_topCurvedTextLabel, 0);
  objc_storeStrong((id *)&self->_interestLabel, 0);
  objc_storeStrong((id *)&self->_enterCurrencyAmountView, 0);
  objc_storeStrong((id *)&self->_handleView, 0);
  objc_storeStrong((id *)&self->_ringView, 0);
  objc_storeStrong((id *)&self->_overrideGradientState, 0);
  objc_storeStrong((id *)&self->_initialDisplayAmount, 0);
  objc_storeStrong((id *)&self->_dragRecognizer, 0);
  objc_storeStrong((id *)&self->_pressRecognizer, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_renderLoop, 0);
  objc_storeStrong((id *)&self->_pinnedAmount, 0);
  objc_storeStrong((id *)&self->_highlightedSuggestedAmount, 0);
  objc_storeStrong((id *)&self->_selectedSuggestedAmount, 0);
  objc_storeStrong((id *)&self->_effectiveDisplayAmount, 0);
  objc_storeStrong((id *)&self->_overrideDisplayAmount, 0);
  objc_storeStrong((id *)&self->_displayAmount, 0);
  objc_storeStrong((id *)&self->_colorStops, 0);
  objc_storeStrong((id *)&self->_standardRingStates, 0);
  objc_storeStrong((id *)&self->_suggestedAmountsForAngle, 0);
  objc_storeStrong((id *)&self->_suggestedAmountAngles, 0);
  objc_storeStrong((id *)&self->_suggestedAmoutImages, 0);
  objc_storeStrong((id *)&self->_suggestedAmountViews, 0);
  objc_storeStrong((id *)&self->_suggestedAmountList, 0);
}

@end
