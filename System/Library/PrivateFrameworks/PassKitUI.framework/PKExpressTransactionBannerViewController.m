@implementation PKExpressTransactionBannerViewController

- (PKExpressTransactionBannerViewController)init
{

  return 0;
}

- (PKExpressTransactionBannerViewController)initWithNibName:(id)a3 bundle:(id)a4
{

  return 0;
}

- (PKExpressTransactionBannerViewController)initWithCoder:(id)a3
{

  return 0;
}

void __58__PKExpressTransactionBannerViewController__initWithPass___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    objc_msgSend(a2, "transitPassPropertiesWithPaymentApplication:pass:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __58__PKExpressTransactionBannerViewController__initWithPass___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __58__PKExpressTransactionBannerViewController__initWithPass___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[122], "setTransitProperties:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    objc_msgSend(v3[122], "setDynamicBalances:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    -[PKExpressTransactionBannerViewController _updateBalanceContent](v3);
    WeakRetained = v3;
  }

}

- (void)_updateBalanceContent
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  id v14;

  if (a1 && objc_msgSend(a1, "isViewLoaded"))
  {
    v2 = a1[126];
    v3 = (void *)a1[122];
    if (v3)
    {
      objc_msgSend(v3, "displayableBalances");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4 && objc_msgSend(v4, "count"))
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "formattedValue");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
    v14 = v7;
    if (!v2)
      goto LABEL_20;
    v8 = *(id *)(v2 + 424);
    v9 = v14;
    v10 = v9;
    if (v8 == v9)
    {

    }
    else
    {
      if (v9 && v8)
      {
        v11 = objc_msgSend(v8, "isEqualToString:", v9);

        if ((v11 & 1) != 0)
          goto LABEL_20;
      }
      else
      {

      }
      v12 = objc_msgSend(v10, "copy");
      v13 = *(void **)(v2 + 424);
      *(_QWORD *)(v2 + 424) = v12;

      -[PKExpressBannerLabelView _updateLabelAnimated:](v2);
    }
LABEL_20:

  }
}

- (void)dealloc
{
  NSObject *transitionTimer;
  NSObject *revokeTimer;
  objc_super v5;

  transitionTimer = self->_transitionTimer;
  if (transitionTimer)
    dispatch_source_cancel(transitionTimer);
  revokeTimer = self->_revokeTimer;
  if (revokeTimer)
    dispatch_source_cancel(revokeTimer);
  -[PKPaymentService setDelegate:](self->_paymentService, "setDelegate:", 0);
  v5.receiver = self;
  v5.super_class = (Class)PKExpressTransactionBannerViewController;
  -[PKExpressTransactionBannerViewController dealloc](&v5, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  void *v4;
  UIView *v5;
  uint64_t v6;
  UIView *containerView;
  UIView *v8;
  void *v9;
  PKExpressBannerLeadingView *v10;
  PKPass *pass;
  PKPass *v12;
  PKPass *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  PKExpressBannerLeadingView *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  NSObject *v46;
  NSObject *p_super;
  PKExpressBannerLeadingView *leadingView;
  PKExpressBannerTrailingView *v49;
  double *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  PKExpressTransactionBannerViewController *v55;
  PKExpressBannerTrailingView *v56;
  PKExpressGlyphView *v57;
  PKExpressTransactionBannerViewController *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  PKExpressGlyphView *glyphView;
  PKExpressGlyphView *v63;
  void *v64;
  __int128 v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  PKExpressBannerTrailingView *trailingView;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  PKExpressBannerLabelView *v74;
  PKExpressTransactionBannerViewController *v75;
  PKExpressBannerLabelView *v76;
  uint64_t traitChangeRegistry_low;
  PKExpressBannerLabelView *trailingLabel;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  PKExpressBannerLeadingView *v83;
  PKExpressBannerTrailingView *v84;
  PKExpressBannerLabelView *v85;
  void *v86;
  void *v87;
  NSObject *v88;
  PKExpressBannerLeadingView *obj;
  uint64_t v90;
  void *v91;
  objc_super v92;
  objc_super v93;
  void *v94;
  void *v95;
  objc_super v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  uint64_t v101;
  unint64_t v102;
  __int128 v103;
  __int128 v104;
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v92.receiver = self;
  v92.super_class = (Class)PKExpressTransactionBannerViewController;
  -[PKExpressTransactionBannerViewController loadView](&v92, sel_loadView);
  -[PKExpressTransactionBannerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizingMask:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  v6 = 992;
  containerView = self->_containerView;
  self->_containerView = v5;

  -[UIView setOpaque:](self->_containerView, "setOpaque:", 0);
  v8 = self->_containerView;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v9);

  v10 = [PKExpressBannerLeadingView alloc];
  pass = self->_pass;
  v12 = pass;
  v13 = v12;
  v91 = v3;
  if (!v10)
    goto LABEL_46;
  if (!v12)
    goto LABEL_45;
  PKPassKitUIBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URLForResource:withExtension:", CFSTR("aperture_express_leading-D73"), CFSTR("ca"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    PKLogFacilityTypeGetObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v96.receiver) = 0;
      _os_log_impl(&dword_19D178000, v18, OS_LOG_TYPE_DEFAULT, "PKExpressBannerLeadingView: could not find archive.", (uint8_t *)&v96, 2u);
    }
    v19 = 0;
    goto LABEL_25;
  }
  v16 = *MEMORY[0x1E0CD3078];
  v93.receiver = 0;
  objc_msgSend(MEMORY[0x1E0CD27F8], "packageWithContentsOfURL:type:options:error:", v15, v16, 0, &v93);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v93.receiver;
  if (!v17)
  {
    PKLogFacilityTypeGetObject();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v96.receiver) = 138412290;
      *(id *)((char *)&v96.receiver + 4) = v18;
      _os_log_impl(&dword_19D178000, p_super, OS_LOG_TYPE_DEFAULT, "PKExpressBannerLeadingView: could not load archive - %@.", (uint8_t *)&v96, 0xCu);
    }
    v19 = 0;
    goto LABEL_24;
  }
  objc_msgSend(v17, "rootLayer");
  v19 = (PKExpressBannerLeadingView *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    p_super = 0;
    PKLogFacilityTypeGetObject();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v96.receiver) = 0;
      _os_log_impl(&dword_19D178000, v46, OS_LOG_TYPE_DEFAULT, "PKExpressBannerLeadingView: archive has no content.", (uint8_t *)&v96, 2u);
      v19 = 0;
    }
    goto LABEL_23;
  }
  v20 = objc_msgSend(v17, "isGeometryFlipped");
  obj = v19;
  -[PKExpressBannerLeadingView setGeometryFlipped:](v19, "setGeometryFlipped:", v20);
  objc_msgSend(v17, "publishedObjectWithName:", CFSTR("cardfront"));
  v21 = objc_claimAutoreleasedReturnValue();
  if (!v21)
    goto LABEL_20;
  v22 = v21;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_20:
    PKLogFacilityTypeGetObject();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v96.receiver) = 0;
      _os_log_impl(&dword_19D178000, v46, OS_LOG_TYPE_DEFAULT, "PKExpressBannerLeadingView: missing card front.", (uint8_t *)&v96, 2u);
    }
    v19 = 0;
    p_super = &obj->super.super.super;
    goto LABEL_23;
  }
  v88 = v22;
  v96.receiver = v10;
  v96.super_class = (Class)PKExpressBannerLeadingView;
  v23 = -[PKExpressTransactionBannerViewController initWithFrame:](&v96, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v24 = (uint64_t)v23;
  if (v23)
  {
    objc_storeStrong((id *)v23 + 55, obj);
    v86 = *(void **)(v24 + 440);
    PKLayerNullActions();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setActions:", v25);

    objc_storeStrong((id *)(v24 + 448), v88);
    objc_storeStrong((id *)(v24 + 416), pass);
    v26 = -[PKPassThumbnailView initWithPass:suppressedContent:rendererState:options:]([PKPassThumbnailView alloc], *(void **)(v24 + 416), 0, 0, 2);
    v27 = *(void **)(v24 + 424);
    *(_QWORD *)(v24 + 424) = v26;

    -[PKPassThumbnailView setModallyPresented:](*(_QWORD *)(v24 + 424), 1);
    -[PKPassThumbnailView setBrighten:](*(_QWORD *)(v24 + 424), 1);
    -[PKPassThumbnailView setShadowVisibility:](*(_QWORD *)(v24 + 424), 0.0);
    objc_msgSend((id)v24, "addSubview:", *(_QWORD *)(v24 + 424));
    objc_msgSend((id)v24, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSublayer:", *(_QWORD *)(v24 + 440));
    objc_msgSend(*(id *)(v24 + 424), "layer");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2800], "layer");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = *(void **)(v24 + 432);
    *(_QWORD *)(v24 + 432) = v29;

    objc_msgSend(*(id *)(v24 + 432), "setSourceLayer:", v87);
    objc_msgSend(*(id *)(v24 + 432), "setHidesSourceLayer:", 1);
    objc_msgSend(*(id *)(v24 + 432), "setGeometryFlipped:", v20);
    objc_msgSend(*(id *)(v24 + 448), "addSublayer:", *(_QWORD *)(v24 + 432));
    objc_msgSend(*(id *)(v24 + 448), "bounds");
    objc_msgSend(*(id *)(v24 + 424), "sizeThatFits:", v31, 1.79769313e308);
    PKSizeAlignedInRect();
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v39 = v38;
    objc_msgSend(*(id *)(v24 + 424), "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    objc_msgSend(*(id *)(v24 + 432), "setFrame:", v33, v35, v37, v39);
    v40 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD2868]), "initWithLayer:", *(_QWORD *)(v24 + 440));
    v41 = *(void **)(v24 + 456);
    *(_QWORD *)(v24 + 456) = v40;

    objc_msgSend(*(id *)(v24 + 456), "setInitialStatesOfLayer:", *(_QWORD *)(v24 + 440));
    *(_DWORD *)(v24 + 464) = 0;
    *(_DWORD *)(v24 + 468) = 0;
    objc_msgSend(*(id *)(v24 + 440), "bounds");
    *(_QWORD *)(v24 + 488) = v42;
    *(_QWORD *)(v24 + 496) = v43;
    *(float64x2_t *)(v24 + 504) = vaddq_f64(*(float64x2_t *)(v24 + 488), (float64x2_t)vdupq_n_s64(0xC051000000000000));
    *(_OWORD *)(v24 + 520) = *(_OWORD *)(v24 + 488);
    *(_OWORD *)(v24 + 536) = *(_OWORD *)(v24 + 504);
    *(_OWORD *)(v24 + 552) = ArchiveAlignmentInsets;
    *(_OWORD *)(v24 + 568) = unk_19DF18298;
    objc_msgSend(v28, "anchorPoint");
    objc_msgSend(*(id *)(v24 + 440), "setAnchorPoint:", (v44 * *(double *)(v24 + 504) + 35.0) / *(double *)(v24 + 488), (v45 * *(double *)(v24 + 512) + 17.0) / *(double *)(v24 + 496));
    -[PKExpressBannerLeadingView _updateSizeWithAnimationFactory:](v24, 0);

  }
  v10 = (PKExpressBannerLeadingView *)(id)v24;
  v19 = v10;
  v46 = v88;
  p_super = &obj->super.super.super;
LABEL_23:

LABEL_24:
LABEL_25:

  while (1)
  {

    leadingView = self->_leadingView;
    self->_leadingView = v19;

    v49 = [PKExpressBannerTrailingView alloc];
    v50 = (double *)MEMORY[0x1E0C9D648];
    v90 = v6;
    if (v49)
    {
      v93.receiver = v49;
      v93.super_class = (Class)PKExpressBannerTrailingView;
      v51 = *MEMORY[0x1E0C9D648];
      v52 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v53 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v54 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v55 = -[PKExpressTransactionBannerViewController initWithFrame:](&v93, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v52, v53, v54);
      v56 = (PKExpressBannerTrailingView *)v55;
      if (v55)
      {
        LODWORD(v55->super._traitChangeRegistry) = 0;
        v57 = [PKExpressGlyphView alloc];
        if (v57)
        {
          v96.receiver = v57;
          v96.super_class = (Class)PKExpressGlyphView;
          v58 = -[PKExpressTransactionBannerViewController initWithFrame:](&v96, sel_initWithFrame_, v51, v52, v53, v54);
          v59 = (uint64_t)v58;
          if (v58)
          {
            v58->super._lastForwardedTransitionSize.width = 46.0;
            v60 = objc_msgSend(objc_alloc(MEMORY[0x1E0D6BFF0]), "initWithStyle:", 7);
            v61 = *(void **)(v59 + 440);
            *(_QWORD *)(v59 + 440) = v60;

            objc_msgSend(*(id *)(v59 + 440), "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), *(double *)(v59 + 432), *(double *)(v59 + 432));
            objc_msgSend(*(id *)(v59 + 440), "setDelegate:", v59);
            objc_msgSend((id)v59, "addSubview:", *(_QWORD *)(v59 + 440));
            *(_DWORD *)(v59 + 416) = 0;
            -[PKExpressGlyphView _updateGlyphViewAnimated:](v59, 0);
          }
        }
        else
        {
          v59 = 0;
        }
        glyphView = v56->_glyphView;
        v56->_glyphView = (PKExpressGlyphView *)v59;

        -[PKExpressBannerTrailingView addSubview:](v56, "addSubview:", v56->_glyphView);
        v63 = v56->_glyphView;
        if (v63)
          objc_storeWeak((id *)&v63->_delegate, v56);
        -[PKExpressBannerTrailingView _updateStateAnimated:withDelay:]((uint64_t)v56, 0, 0.0);
        -[PKExpressBannerTrailingView layer](v56, "layer");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
        v98 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
        v99 = v65;
        v100 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
        v66 = *(_QWORD *)(MEMORY[0x1E0CD2610] + 80);
        v67 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
        v96 = (objc_super)*MEMORY[0x1E0CD2610];
        v97 = v67;
        v101 = v66;
        v102 = 0xBF739354D8AD2CBELL;
        v68 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
        v103 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
        v104 = v68;
        objc_msgSend(v64, "setSublayerTransform:", &v96);

      }
    }
    else
    {
      v56 = 0;
    }
    v6 = (uint64_t)&OBJC_IVAR___PKExpressTransactionBannerViewController__trailingView;
    trailingView = self->_trailingView;
    self->_trailingView = v56;

    -[PKExpressBannerTrailingView layer](self->_trailingView, "layer");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_alloc(MEMORY[0x1E0CD2780]);
    v13 = (PKPass *)*MEMORY[0x1E0CD2C88];
    v72 = (void *)objc_msgSend(v71, "initWithType:", *MEMORY[0x1E0CD2C88]);
    objc_msgSend(v72, "setName:", CFSTR("blur"));
    v95 = v72;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v95, 1);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setFilters:", v73);

    self->_trailingBlur = 0.0;
    v74 = [PKExpressBannerLabelView alloc];
    if (!v74)
      break;
    v96.receiver = v74;
    v96.super_class = (Class)PKExpressBannerLabelView;
    v75 = -[PKExpressTransactionBannerViewController initWithFrame:](&v96, sel_initWithFrame_, *v50, v50[1], v50[2], v50[3]);
    v76 = (PKExpressBannerLabelView *)v75;
    if (!v75)
      goto LABEL_38;
    LODWORD(v75->super._traitChangeRegistry) = 0;
    traitChangeRegistry_low = SLODWORD(v75->super._traitChangeRegistry);
    if (traitChangeRegistry_low < 4)
    {
      -[PKExpressTransactionBannerViewController setAnchorPoint:](v75, "setAnchorPoint:", dbl_19DF18350[traitChangeRegistry_low], dbl_19DF18330[traitChangeRegistry_low]);
      goto LABEL_38;
    }
LABEL_45:
    __break(1u);
LABEL_46:
    v19 = 0;
  }
  v76 = 0;
LABEL_38:
  trailingLabel = self->_trailingLabel;
  self->_trailingLabel = v76;

  -[PKExpressBannerLabelView layer](self->_trailingLabel, "layer");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD2780]), "initWithType:", v13);
  objc_msgSend(v80, "setName:", CFSTR("blur"));
  v94 = v80;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v94, 1);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setFilters:", v81);

  self->_trailingLabelBlur = 0.0;
  -[PKExpressBannerLabelView setHidden:](self->_trailingLabel, "setHidden:", 1);
  -[PKExpressBannerLabelView setAlpha:](self->_trailingLabel, "setAlpha:", 0.0);
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v90), "layer");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setAllowsHitTesting:", 0);

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v90), "setUserInteractionEnabled:", 0);
  v83 = self->_leadingView;
  if (v83)
    objc_storeWeak((id *)&v83->_delegate, self);
  v84 = self->_trailingView;
  if (v84)
    objc_storeWeak((id *)&v84->_delegate, self);
  v85 = self->_trailingLabel;
  if (v85)
    objc_storeWeak((id *)&v85->_delegate, self);
  objc_msgSend(v91, "addSubview:", *(Class *)((char *)&self->super.super.super.isa + v90));
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v90), "addSubview:", self->_trailingLabel);
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v90), "addSubview:", self->_trailingView);
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v90), "addSubview:", self->_leadingView);
  -[PKExpressTransactionBannerViewController _updateBalanceContent](self);

}

- (void)viewWillLayoutSubviews
{
  int64_t activeLayoutMode;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  UIView *containerView;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  unsigned int state;
  double v53;
  double v54;
  double v55;
  double v56;
  int v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  PKExpressBannerLeadingView *leadingView;
  int v63;
  void *v64;
  id v65;
  PKExpressBannerLabelView *trailingLabel;
  int v67;
  uint64_t alignmentEdge;
  double v69;
  double v70;
  NSMutableArray *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t i;
  PKExpressBannerTrailingView *trailingView;
  double v76;
  unsigned int v77;
  uint64_t v78;
  void *v79;
  __int128 v80;
  id v81;
  id v82;
  id v83;
  id v84;
  void (**v85)(void *, _QWORD);
  uint64_t v86;
  BOOL v87;
  char v88;
  uint64_t v89;
  double v90;
  double v91;
  double v92;
  double v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  int v97;
  _QWORD v98[4];
  id v99;
  id v100;
  PKExpressTransactionBannerViewController *v101;
  id v102;
  id v103;
  uint64_t *v104;
  double v105;
  uint64_t v106;
  double v107;
  uint64_t v108;
  double v109;
  uint64_t v110;
  double v111;
  uint64_t v112;
  double v113;
  uint64_t v114;
  double v115;
  uint64_t v116;
  double v117;
  uint64_t v118;
  double v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char v123;
  char v124;
  BOOL v125;
  char v126;
  char v127;
  char v128;
  _QWORD aBlock[5];
  objc_super v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  uint64_t v135;
  CGRect *v136;
  uint64_t v137;
  void *v138;
  __int128 v139;
  __int128 v140;
  uint64_t v141;

  v141 = *MEMORY[0x1E0C80C00];
  v130.receiver = self;
  v130.super_class = (Class)PKExpressTransactionBannerViewController;
  -[PKExpressTransactionBannerViewController viewWillLayoutSubviews](&v130, sel_viewWillLayoutSubviews);
  activeLayoutMode = self->_activeLayoutMode;
  if (activeLayoutMode == 4 || activeLayoutMode == 1)
  {
    -[PKExpressTransactionBannerViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v5, "_shouldReverseLayoutDirection");
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v5, "SBUISA_systemApertureObstructedAreaLayoutGuide");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layoutFrame");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    containerView = self->_containerView;
    PKSizeAlignedInRect();
    -[UIView setFrame:](containerView, "setFrame:");
    -[UIView convertRect:fromView:](self->_containerView, "convertRect:fromView:", v5, v7, v9, v11, v13);
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
    -[UIView convertRect:fromView:](self->_containerView, "convertRect:fromView:", v5, v16, v18, v20, v22);
    v94 = v33;
    v95 = v32;
    v35 = v34;
    v37 = v36;

    if ((self->_state - 3) <= 2)
    {
      PKSizeAlignedInRect();
      v25 = v38;
      v27 = v39;
      v29 = v40;
      v31 = v41;
    }
    if (self->_transitioning)
      v42 = 1;
    else
      v42 = objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlockWithAnimationsEnabled");
    v43 = 0x200000000;
    if (v97)
      v43 = 2;
    v44 = fmax(v35, v25);
    v45 = v44 - v25;
    v46 = fmax(v35 + v37, v44);
    v47 = fmax(v25 + v29, v46) - v46;
    if (v97)
      v48 = v46;
    else
      v48 = v25;
    if (v97)
      v49 = v47;
    else
      v49 = v45;
    v90 = v48;
    v91 = v49;
    if (v97)
      v50 = v25;
    else
      v50 = v46;
    if (v97)
      v51 = v45;
    else
      v51 = v47;
    v92 = v50;
    v93 = v51;
    state = self->_state;
    if (state < 0xA)
    {
      v89 = v43;
      v87 = self->_activeLayoutMode > 1uLL;
      v88 = v42;
      LODWORD(v86) = (self->_state & 0x3FF) == 9;
      HIDWORD(v86) = state != 0;
      if (v42)
      {
        v96 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6C038]), "initWithMass:stiffness:damping:", 2.0, 300.0, 50.0);
        v57 = self->_state;
        if ((v57 - 3) >= 4)
        {
          if (v57 == 9)
            objc_msgSend(v96, "setSpeed:", 0.85);
        }
        else
        {
          LODWORD(v53) = 1049830265;
          LODWORD(v55) = *(_DWORD *)"ŏ)?-&v?";
          LODWORD(v56) = *(_DWORD *)"-&v?";
          LODWORD(v54) = 0;
          objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v53, v54, v55, v56);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "setTiming:withDynamicDurationProvider:", v58, &__block_literal_global_208);

        }
        v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6C038]), "initWithMass:stiffness:damping:", 2.0, 300.0, 50.0);
        v61 = self->_state;
        if ((v61 - 3) > 3)
        {
          v60 = 0;
        }
        else
        {
          v60 = (void *)objc_msgSend(v96, "copy");
          objc_msgSend(v60, "setSpeed:", 1.176);
          v61 = self->_state;
        }
      }
      else
      {
        v96 = 0;
        v59 = 0;
        v60 = 0;
        v61 = self->_state;
      }
      leadingView = self->_leadingView;
      if (v61 > 2)
        v63 = 2;
      else
        v63 = dword_19DF18320[v61];
      if (v60)
        v64 = v60;
      else
        v64 = v59;
      v65 = v64;
      if (leadingView && leadingView->_sizeClass != v63)
      {
        leadingView->_sizeClass = v63;
        -[PKExpressBannerLeadingView _updateSizeWithAnimationFactory:]((uint64_t)leadingView, v65);
      }

      trailingLabel = self->_trailingLabel;
      if (v97)
        v67 = 0;
      else
        v67 = 2;
      if (trailingLabel && trailingLabel->_alignmentEdge != v67)
      {
        trailingLabel->_alignmentEdge = v67;
        alignmentEdge = (int)trailingLabel->_alignmentEdge;
        if (alignmentEdge >= 4)
          goto LABEL_68;
        v69 = dbl_19DF18330[alignmentEdge];
        v70 = dbl_19DF18350[alignmentEdge];
        -[UILabel setAnchorPoint:](trailingLabel->_label, "setAnchorPoint:", v70, v69);
        v133 = 0u;
        v134 = 0u;
        v131 = 0u;
        v132 = 0u;
        v71 = trailingLabel->_obsoleteLabels;
        v72 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v71, "countByEnumeratingWithState:objects:count:", &v131, &v135, 16);
        if (v72)
        {
          v73 = *(_QWORD *)v132;
          do
          {
            for (i = 0; i != v72; ++i)
            {
              if (*(_QWORD *)v132 != v73)
                objc_enumerationMutation(v71);
              objc_msgSend(*(id *)(*((_QWORD *)&v131 + 1) + 8 * i), "setAnchorPoint:", v70, v69, v86);
            }
            v72 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v71, "countByEnumeratingWithState:objects:count:", &v131, &v135, 16);
          }
          while (v72);
        }

        -[PKExpressBannerLabelView setAnchorPoint:](trailingLabel, "setAnchorPoint:", v70, v69);
        -[PKExpressBannerLabelView setNeedsLayout](trailingLabel, "setNeedsLayout");
      }
      trailingView = self->_trailingView;
      if (self->_transitioning)
      {
        v76 = 0.28;
        if (self->_state != 3)
          v76 = 0.0;
      }
      else
      {
        v76 = 0.0;
      }
      v77 = (0x3F8u >> state) & 1;
      if (trailingView)
      {
        if (trailingView->_state != v77)
        {
          trailingView->_state = v77;
          -[PKExpressBannerTrailingView _updateStateAnimated:withDelay:]((uint64_t)trailingView, v77, v76);
        }
      }
      v78 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_4;
      aBlock[3] = &unk_1E3E790D0;
      aBlock[4] = self;
      v79 = _Block_copy(aBlock);
      v135 = 0;
      v136 = (CGRect *)&v135;
      v137 = 0x4010000000;
      v138 = &unk_19E0C78CE;
      v80 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
      v139 = *MEMORY[0x1E0C9D628];
      v140 = v80;
      v98[0] = v78;
      v98[1] = 3221225472;
      v98[2] = __66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_5;
      v98[3] = &unk_1E3E79198;
      v81 = v79;
      v103 = v81;
      v82 = v60;
      v99 = v82;
      v83 = v59;
      v123 = v88;
      v124 = BYTE4(v86);
      v125 = v87;
      v126 = (0x3F8u >> state) & 1;
      v100 = v83;
      v101 = self;
      v127 = v86;
      v105 = v35;
      v106 = v95;
      v107 = v37;
      v108 = v94;
      v109 = v25;
      v110 = v27;
      v111 = v29;
      v112 = v31;
      v128 = v97;
      v113 = v90;
      v114 = v27;
      v115 = v91;
      v116 = v31;
      v117 = v92;
      v118 = v27;
      v119 = v93;
      v120 = v31;
      v121 = v89;
      v122 = v89;
      v104 = &v135;
      v84 = v96;
      v102 = v84;
      v85 = (void (**)(void *, _QWORD))_Block_copy(v98);
      v85[2](v85, 0);
      v85[2](v85, 1);
      if (!CGRectIsNull(v136[1]))
      {
        v85[2](v85, 2);

        _Block_object_dispose(&v135, 8);
        return;
      }
    }
LABEL_68:
    __break(1u);
  }
}

double __66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_3(double a1, double a2, double a3, double a4, double a5)
{
  return a5 * 2.5;
}

_QWORD *__66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_4(_QWORD *result, unsigned int a2)
{
  if (a2 < 3)
    return *(id *)(result[4] + *off_1E3E792E0[a2]);
  __break(1u);
  return result;
}

void __66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_5(uint64_t a1, unsigned int a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void (**v15)(_QWORD, __n128, double, double);
  id v16;
  void (**v17)(_QWORD, double, double);
  void (**v18)(_QWORD, double, double);
  int v19;
  CGRect *v20;
  CGFloat *v21;
  double *v22;
  double *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGSize v28;
  double *v29;
  int v30;
  CGFloat y;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  CGFloat x;
  double width;
  double height;
  _BOOL4 IsNull;
  __n128 v56;
  __n128 v57;
  double v58;
  double v59;
  double v60;
  CGFloat v61;
  uint64_t v62;
  CGFloat v63;
  double v64;
  double v65;
  double *v66;
  CGSize v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  __n128 v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  uint64_t v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  uint64_t v89;
  void *v90;
  id v91;
  double v92;
  CGFloat rect;
  _QWORD v94[7];
  CGRect slice;
  CGRect remainder;
  _QWORD v97[5];
  id v98;
  void *v99;
  void *v100;
  id v101;
  id v102;
  unsigned int v103;
  char v104;
  __int16 v105;
  char v106;
  _QWORD v107[4];
  id v108;
  uint64_t *v109;
  _QWORD aBlock[4];
  id v111;
  uint64_t *v112;
  uint64_t v113;
  double *v114;
  uint64_t v115;
  uint64_t v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2 || (v6 = *(void **)(a1 + 32)) == 0)
    v6 = *(void **)(a1 + 40);
  v7 = v6;
  if (*(_BYTE *)(a1 + 224))
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 8);
  else
    v8 = 0;
  v113 = 0;
  v114 = (double *)&v113;
  v115 = 0x2020000000;
  v9 = MEMORY[0x1E0C809B0];
  v116 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_6;
  aBlock[3] = &unk_1E3E790F8;
  v112 = &v113;
  v10 = v8;
  v111 = v10;
  v11 = _Block_copy(aBlock);
  v107[0] = v9;
  v107[1] = 3221225472;
  v107[2] = __66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_7;
  v107[3] = &unk_1E3E79120;
  v109 = &v113;
  v12 = v10;
  v108 = v12;
  v13 = _Block_copy(v107);
  v97[0] = v9;
  v97[1] = 3221225472;
  v97[2] = __66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_8;
  v97[3] = &unk_1E3E79170;
  v103 = a2;
  v104 = *(_BYTE *)(a1 + 225);
  v105 = *(_WORD *)(a1 + 226);
  v97[4] = *(_QWORD *)(a1 + 48);
  v14 = v7;
  v98 = v14;
  v15 = v11;
  v100 = v4;
  v101 = v15;
  v106 = *(_BYTE *)(a1 + 228);
  v99 = v5;
  v16 = v13;
  v102 = v16;
  v17 = (void (**)(_QWORD, double, double))_Block_copy(v97);
  v18 = v17;
  if (a2 < 2)
  {
    v19 = *(_DWORD *)(*(_QWORD *)(a1 + 48) + 1048);
    if ((v19 - 3) >= 7)
    {
      if ((v19 - 1) >= 2)
      {
        v24 = 0.0;
        v25 = 0.0;
        v26 = 0.0;
        v27 = 0.0;
        if (!v19)
        {
          v17[2](v17, *(double *)(a1 + 96), *(double *)(a1 + 104));
          PKSizeAlignedInRect();
          v26 = v84;
          v25 = v85;
          v24 = v86;
          v27 = v87 + 22.0;
        }
        goto LABEL_28;
      }
      v121.origin.x = *(CGFloat *)(a1 + 112);
      v121.origin.y = *(double *)(a1 + 88) + *(double *)(a1 + 104);
      v121.size.width = *(CGFloat *)(a1 + 128);
      v121.size.height = *(double *)(a1 + 120) + *(double *)(a1 + 136) - v121.origin.y;
      memset(&remainder, 0, sizeof(remainder));
      slice = v121;
      CGRectDivide(v121, &remainder, &slice, 6.0, CGRectMinYEdge);
      v18[2](v18, slice.size.width, slice.size.height);
      PKSizeAlignedInRect();
    }
    else
    {
      PKFloatRoundToPixel();
      if (a2)
      {
        v20 = (CGRect *)(a1 + 176);
        v21 = (CGFloat *)(a1 + 184);
        v22 = (double *)(a1 + 192);
        v23 = (double *)(a1 + 200);
      }
      else
      {
        v20 = (CGRect *)(a1 + 144);
        v21 = (CGFloat *)(a1 + 152);
        v22 = (double *)(a1 + 160);
        v23 = (double *)(a1 + 168);
      }
      v50 = *v23;
      v51 = *v22;
      x = v20->origin.x;
      rect = *v21;
      v117.origin.x = *(double *)(a1 + 112) + 10.0;
      v117.origin.y = *(double *)(a1 + 120) + 10.0;
      v117.size.width = *(double *)(a1 + 128) + -20.0;
      v117.size.height = *(double *)(a1 + 136) + -20.0;
      v122 = CGRectIntersection(v117, *v20);
      width = v122.size.width;
      height = v122.size.height;
      IsNull = CGRectIsNull(v122);
      if (IsNull)
        v57.n128_f64[0] = v50;
      else
        v57.n128_f64[0] = height;
      if (IsNull)
        v56.n128_f64[0] = v51;
      else
        v56.n128_f64[0] = width;
      ((void (*)(void (**)(_QWORD, double, double), __n128, __n128))v18[2])(v18, v56, v57);
      PKFloatRoundToPixel();
      v59 = v58;
      PKFloatRoundToPixel();
      v60 = fmax(v59, 10.0);
      memset(&remainder, 0, sizeof(remainder));
      v61 = rect;
      slice.origin.x = x;
      slice.origin.y = rect;
      slice.size.width = v51;
      slice.size.height = v50;
      v62 = 212;
      if (!a2)
        v62 = 208;
      v63 = x;
      v64 = v51;
      v65 = v50;
      CGRectDivide(*(CGRect *)(&v61 - 1), &remainder, &slice, v60, *(CGRectEdge *)(a1 + v62));
      PKSizeAlignedInRect();
    }
    v27 = v46;
    v26 = v47;
    v25 = v48;
    v24 = v49;
LABEL_28:
    if (a2)
    {
      v66 = *(double **)(*(_QWORD *)(a1 + 72) + 8);
      v66[4] = v27;
      v66[5] = v26;
      v66[6] = v25;
      v66[7] = v24;
    }
    goto LABEL_32;
  }
  v24 = 0.0;
  v25 = 0.0;
  v26 = 0.0;
  v27 = 0.0;
  if (a2 != 2)
  {
LABEL_32:
    objc_msgSend(v5, "anchorPoint");
    v73 = v72;
    v75 = v74;
    objc_msgSend(v5, "position");
    v78 = v76.n128_f64[0];
    v79 = v77;
    v80 = v27 + v73 * v25;
    v81 = v26 + v75 * v24;
    if (v80 != v76.n128_f64[0] || v81 != v77)
    {
      if (*(_QWORD *)(a1 + 56))
      {
        if (v76.n128_f64[0] != v80)
        {
          v83 = *(_QWORD *)(a1 + 48);
          if (*(_BYTE *)(v83 + 984))
          {
            v76.n128_u64[0] = 0x3F8EB851EB851EB8;
            if (*(_DWORD *)(v83 + 1048) != 1)
              v76.n128_f64[0] = 0.0;
          }
          else
          {
            v76.n128_u64[0] = 0;
          }
          v15[2](v15, v76, v78, v80);
        }
        if (v79 != v81)
        {
          v89 = *(_QWORD *)(a1 + 48);
          if (*(_BYTE *)(v89 + 984))
          {
            v76.n128_u64[0] = 0x3FB3333333333333;
            if (*(_DWORD *)(v89 + 1048) != 3)
              v76.n128_f64[0] = 0.0;
          }
          else
          {
            v76.n128_u64[0] = 0;
          }
          ((void (*)(void (**)(_QWORD, __n128, double, double), _QWORD, const __CFString *, __n128, double, double))v15[2])(v15, *(_QWORD *)(a1 + 56), CFSTR("position.y"), v76, v79, v81);
        }
      }
      v94[0] = v9;
      v94[1] = 3221225472;
      v94[2] = __66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_11;
      v94[3] = &unk_1E3E62928;
      v94[4] = v4;
      *(double *)&v94[5] = v80;
      *(double *)&v94[6] = v81;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v94);
    }
    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CD2700], "animation");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "setBeginTimeMode:", *MEMORY[0x1E0CD2950]);
      objc_msgSend(v90, "setAnimations:", v12);
      objc_msgSend(v90, "setDuration:", v114[3]);
      v91 = (id)objc_msgSend(v5, "pkui_addAdditiveAnimation:", v90);

    }
    _Block_object_dispose(&v113, 8);

    return;
  }
  if (!*(_BYTE *)(a1 + 228))
  {
    v67 = *(CGSize *)(a1 + 96);
    remainder.origin = *(CGPoint *)(a1 + 80);
    remainder.size = v67;
    goto LABEL_31;
  }
  v28 = *(CGSize *)(a1 + 192);
  remainder.origin = *(CGPoint *)(a1 + 176);
  remainder.size = v28;
  v29 = *(double **)(*(_QWORD *)(a1 + 72) + 8);
  v30 = *(_DWORD *)(a1 + 212);
  v28.width = remainder.origin.x;
  y = remainder.origin.y;
  v32 = remainder.size.width;
  v33 = remainder.size.height;
  v34 = v29[4];
  v35 = v29[5];
  v36 = v29[6];
  v37 = v29[7];
  v118 = CGRectStandardize(*(CGRect *)&v28.width);
  v38 = v118.origin.x;
  v39 = v118.origin.y;
  v40 = v118.size.width;
  v41 = v118.size.height;
  v123.origin.x = v34;
  v123.origin.y = v35;
  v123.size.width = v36;
  v123.size.height = v37;
  v119 = CGRectIntersection(v118, v123);
  v42 = v119.origin.x;
  v43 = v119.origin.y;
  v44 = v119.size.width;
  v45 = v119.size.height;
  if (CGRectIsNull(v119))
  {
LABEL_14:
    remainder.origin.x = v38;
    remainder.origin.y = v39;
    remainder.size.width = v40;
    remainder.size.height = v41;
    memset(&slice, 0, sizeof(slice));
    v120.origin.x = v38;
    v120.origin.y = v39;
    v120.size.width = v40;
    v120.size.height = v41;
    CGRectDivide(v120, &slice, &remainder, 5.0, *(CGRectEdge *)(a1 + 212));
LABEL_31:
    v18[2](v18, remainder.size.width, remainder.size.height);
    PKSizeAlignedInRect();
    v27 = v68;
    v26 = v69;
    v25 = v70;
    v24 = v71;
    goto LABEL_32;
  }
  switch(v30)
  {
    case 0:
      v88 = v38 + v40;
      v38 = fmin(v42 + v44, v38 + v40);
      v40 = v88 - v38;
      goto LABEL_14;
    case 1:
      v92 = v39 + v41;
      v39 = fmin(v43 + v45, v39 + v41);
      v41 = v92 - v39;
      goto LABEL_14;
    case 2:
      v40 = fmax(v42 - v38, 0.0);
      goto LABEL_14;
    case 3:
      v41 = fmax(v43 - v39, 0.0);
      goto LABEL_14;
    default:
      __break(1u);
      break;
  }
}

void __66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_6(uint64_t a1, void *a2, double a3, double a4, double a5)
{
  double v9;
  id v10;

  if (a2 && a4 != a5)
  {
    objc_msgSend(a2, "springAnimationWithKeyPath:");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", a4, a5);
    if (a3 != 0.0)
      objc_msgSend(v10, "setBeginTime:", a3);
    objc_msgSend(v10, "duration");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = fmax(v9 + a3, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 24));
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);

  }
}

void __66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_7(uint64_t a1, void *a2, void *a3, _OWORD *a4, _OWORD *a5, double a6)
{
  id v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  double v30;
  CATransform3D v31;
  CATransform3D a;

  v11 = a2;
  v12 = a3;
  if (v11)
  {
    v13 = a4[5];
    *(_OWORD *)&a.m31 = a4[4];
    *(_OWORD *)&a.m33 = v13;
    v14 = a4[7];
    *(_OWORD *)&a.m41 = a4[6];
    *(_OWORD *)&a.m43 = v14;
    v15 = a4[1];
    *(_OWORD *)&a.m11 = *a4;
    *(_OWORD *)&a.m13 = v15;
    v16 = a4[3];
    *(_OWORD *)&a.m21 = a4[2];
    *(_OWORD *)&a.m23 = v16;
    v17 = a5[5];
    *(_OWORD *)&v31.m31 = a5[4];
    *(_OWORD *)&v31.m33 = v17;
    v18 = a5[7];
    *(_OWORD *)&v31.m41 = a5[6];
    *(_OWORD *)&v31.m43 = v18;
    v19 = a5[1];
    *(_OWORD *)&v31.m11 = *a5;
    *(_OWORD *)&v31.m13 = v19;
    v20 = a5[3];
    *(_OWORD *)&v31.m21 = a5[2];
    *(_OWORD *)&v31.m23 = v20;
    if (!CATransform3DEqualToTransform(&a, &v31))
    {
      objc_msgSend(v11, "springAnimationWithKeyPath:", v12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = a4[5];
      *(_OWORD *)&a.m31 = a4[4];
      *(_OWORD *)&a.m33 = v22;
      v23 = a4[7];
      *(_OWORD *)&a.m41 = a4[6];
      *(_OWORD *)&a.m43 = v23;
      v24 = a4[1];
      *(_OWORD *)&a.m11 = *a4;
      *(_OWORD *)&a.m13 = v24;
      v25 = a4[3];
      *(_OWORD *)&a.m21 = a4[2];
      *(_OWORD *)&a.m23 = v25;
      v26 = a5[5];
      *(_OWORD *)&v31.m31 = a5[4];
      *(_OWORD *)&v31.m33 = v26;
      v27 = a5[7];
      *(_OWORD *)&v31.m41 = a5[6];
      *(_OWORD *)&v31.m43 = v27;
      v28 = a5[1];
      *(_OWORD *)&v31.m11 = *a5;
      *(_OWORD *)&v31.m13 = v28;
      v29 = a5[3];
      *(_OWORD *)&v31.m21 = a5[2];
      *(_OWORD *)&v31.m23 = v29;
      objc_msgSend(v21, "pkui_updateForAdditiveAnimationFromTransform:toTransform:", &a, &v31);
      if (a6 != 0.0)
        objc_msgSend(v21, "setBeginTime:", a6);
      objc_msgSend(v21, "duration");
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = fmax(v30 + a6, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 24));
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v21);

    }
  }

}

double __66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_8(uint64_t a1, __n128 a2, double a3)
{
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  char v18;
  float v19;
  double v20;
  BOOL v21;
  void *v22;
  _BOOL4 v23;
  double v24;
  double v25;
  double x;
  double y;
  double width;
  double height;
  _BOOL4 v30;
  __n128 v31;
  BOOL v32;
  int v33;
  unsigned __int8 v34;
  uint64_t v35;
  int v36;
  void (*v37)(double);
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  double v42;
  double rect2;
  double v44;
  _QWORD v45[5];
  _QWORD v46[6];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  double v55;
  double v56;
  double v57;
  double v58;
  char v59;
  BOOL v60;
  BOOL v61;
  BOOL v62;
  unsigned __int8 v63;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v66;
  CATransform3D v67;
  CGRect v68;
  CGRect v69;

  v4 = *(_DWORD *)(a1 + 80);
  if (v4 == 2)
  {
    v5 = a3;
    v6 = a2.n128_f64[0];
    if (*(_BYTE *)(a1 + 85))
    {
      v44 = (double)*(unsigned __int8 *)(a1 + 87);
      v8 = 0.0;
      if (*(_BYTE *)(a1 + 87))
        goto LABEL_17;
    }
    else
    {
      v44 = 0.0;
    }
    v8 = 8.33333333;
LABEL_17:
    v9 = *(_QWORD *)(a1 + 32);
    v7 = 1.0;
    if (*(double *)(v9 + 1016) == v8)
      goto LABEL_38;
    *(double *)(v9 + 1016) = v8;
    if (!*(_QWORD *)(a1 + 40))
      goto LABEL_37;
    v10 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v10 + 984))
    {
      a2.n128_u64[0] = 0;
      if (*(_DWORD *)(v10 + 1048) == 9)
        a2.n128_f64[0] = 0.125;
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  v6 = *MEMORY[0x1E0C9D820];
  v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v4 == 1)
  {
    if (*(_BYTE *)(a1 + 85))
    {
      v44 = (double)*(unsigned __int8 *)(a1 + 86);
      if (*(_BYTE *)(a1 + 86))
      {
        v8 = 0.0;
        v7 = 1.0;
        goto LABEL_29;
      }
      v7 = 1.5;
    }
    else
    {
      if (*(_BYTE *)(a1 + 86))
        v7 = 1.0;
      else
        v7 = 1.5;
      v44 = 0.0;
    }
    v8 = 10.0;
LABEL_29:
    v11 = *(_QWORD *)(a1 + 32);
    if (*(double *)(v11 + 1032) == v8)
      goto LABEL_38;
    *(double *)(v11 + 1032) = v8;
    if (!*(_QWORD *)(a1 + 40))
      goto LABEL_37;
    v12 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v12 + 984))
    {
      a2.n128_u64[0] = 0x3FD23D70A3D70A3DLL;
      if (*(_DWORD *)(v12 + 1048) != 3)
        a2.n128_f64[0] = 0.0;
      goto LABEL_36;
    }
LABEL_35:
    a2.n128_u64[0] = 0;
LABEL_36:
    (*(void (**)(__n128))(*(_QWORD *)(a1 + 64) + 16))(a2);
LABEL_37:
    v13 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKeyPath:", v14, CFSTR("filters.blur.inputRadius"));

    goto LABEL_38;
  }
  v7 = 0.0;
  if (v4)
  {
    a2.n128_u64[0] = 0;
  }
  else
  {
    v7 = 1.0;
    if (*(_BYTE *)(a1 + 84))
    {
      a2.n128_u8[0] = *(_BYTE *)(a1 + 85);
      a2.n128_f64[0] = (double)a2.n128_u64[0];
    }
    else
    {
      a2.n128_u64[0] = 1.0;
    }
  }
  v44 = a2.n128_f64[0];
LABEL_38:
  objc_msgSend(*(id *)(a1 + 56), "sizeThatFits:", v6, v5);
  v17 = v16;
  rect2 = v15;
  if (v7 != 1.0)
    PKSizeRoundToPixel();
  v18 = objc_msgSend(*(id *)(a1 + 56), "isHidden", *(_QWORD *)&v15);
  objc_msgSend(*(id *)(a1 + 48), "opacity");
  v20 = v19;
  v21 = v44 != v19;
  memset(&v67, 0, sizeof(v67));
  CATransform3DMakeScale(&v67, v7, v7, 1.0);
  memset(&v66, 0, sizeof(v66));
  v22 = *(void **)(a1 + 48);
  if (v22)
    objc_msgSend(v22, "transform");
  a = v66;
  b = v67;
  v23 = CATransform3DEqualToTransform(&a, &b);
  v24 = *MEMORY[0x1E0C9D538];
  v25 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(*(id *)(a1 + 48), "bounds");
  x = v68.origin.x;
  y = v68.origin.y;
  width = v68.size.width;
  height = v68.size.height;
  v69.origin.x = v24;
  v69.origin.y = v25;
  v69.size.width = rect2;
  v69.size.height = v17;
  v30 = CGRectEqualToRect(v68, v69);
  v32 = v30;
  if (v44 == v20)
  {
    v36 = !v23 || !v30;
    if (*(_DWORD *)(a1 + 80))
      v34 = v18 ^ 1;
    else
      v34 = 0;
  }
  else
  {
    v33 = *(_DWORD *)(a1 + 80);
    if (v33)
      v34 = v18 ^ 1;
    else
      v34 = 0;
    if (*(_QWORD *)(a1 + 40))
    {
      v31.n128_u64[0] = 0;
      if (v33 == 2)
      {
        v35 = *(_QWORD *)(a1 + 32);
        if (*(_BYTE *)(v35 + 984))
        {
          if (*(_DWORD *)(v35 + 1048) == 9)
            v31.n128_f64[0] = 0.125;
        }
      }
      (*(void (**)(__n128, double, double))(*(_QWORD *)(a1 + 64) + 16))(v31, v20, v44);
    }
    v36 = 1;
  }
  if (!v23 && *(_QWORD *)(a1 + 40))
  {
    v37 = *(void (**)(double))(*(_QWORD *)(a1 + 72) + 16);
    a = v66;
    b = v67;
    v37(0.0);
  }
  if (((v32 | v34 ^ 1) & 1) == 0 && *(_QWORD *)(a1 + 40))
  {
    (*(void (**)(double, double, double))(*(_QWORD *)(a1 + 64) + 16))(0.0, x, v24);
    (*(void (**)(double, double, double))(*(_QWORD *)(a1 + 64) + 16))(0.0, y, v25);
    (*(void (**)(double, double, double))(*(_QWORD *)(a1 + 64) + 16))(0.0, width, rect2);
    (*(void (**)(double, double, double))(*(_QWORD *)(a1 + 64) + 16))(0.0, height, v17);
  }
  if (v36)
  {
    v38 = !v23;
    v39 = MEMORY[0x1E0C809B0];
    v46[0] = MEMORY[0x1E0C809B0];
    *(double *)&v46[5] = v44;
    v52 = *(_OWORD *)&v67.m33;
    v53 = *(_OWORD *)&v67.m41;
    v54 = *(_OWORD *)&v67.m43;
    v47 = *(_OWORD *)&v67.m11;
    v48 = *(_OWORD *)&v67.m13;
    v49 = *(_OWORD *)&v67.m21;
    v46[1] = 3221225472;
    v46[2] = __66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_9;
    v46[3] = &unk_1E3E79148;
    v59 = v18;
    v46[4] = *(_QWORD *)(a1 + 56);
    v60 = v21;
    v61 = v38;
    v50 = *(_OWORD *)&v67.m23;
    v51 = *(_OWORD *)&v67.m31;
    v62 = !v32;
    v55 = v24;
    v56 = v25;
    v57 = rect2;
    v58 = v17;
    v63 = v34;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v46);
    if (((v32 | v34 ^ 1) & 1) == 0)
    {
      v40 = *(_QWORD *)(a1 + 40);
      if (v40)
      {
        v45[0] = v39;
        v45[1] = 3221225472;
        v45[2] = __66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_10;
        v45[3] = &unk_1E3E612E8;
        v45[4] = *(_QWORD *)(a1 + 56);
        objc_msgSend(MEMORY[0x1E0DC3F10], "pkui_animateUsingFactory:withDelay:options:animations:completion:", v40, 6, v45, 0, 0.0);
      }
    }
  }
  return v42;
}

uint64_t __66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_9(uint64_t result)
{
  uint64_t v1;
  void *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v7[8];

  v1 = result;
  if (*(double *)(result + 40) > 0.0 && *(_BYTE *)(result + 208))
    result = objc_msgSend(*(id *)(result + 32), "setHidden:", 0);
  if (*(_BYTE *)(v1 + 209))
    result = objc_msgSend(*(id *)(v1 + 32), "setAlpha:", *(double *)(v1 + 40));
  if (*(_BYTE *)(v1 + 210))
  {
    v2 = *(void **)(v1 + 32);
    v3 = *(_OWORD *)(v1 + 128);
    v7[4] = *(_OWORD *)(v1 + 112);
    v7[5] = v3;
    v4 = *(_OWORD *)(v1 + 160);
    v7[6] = *(_OWORD *)(v1 + 144);
    v7[7] = v4;
    v5 = *(_OWORD *)(v1 + 64);
    v7[0] = *(_OWORD *)(v1 + 48);
    v7[1] = v5;
    v6 = *(_OWORD *)(v1 + 96);
    v7[2] = *(_OWORD *)(v1 + 80);
    v7[3] = v6;
    result = objc_msgSend(v2, "setTransform3D:", v7);
  }
  if (*(_BYTE *)(v1 + 211))
  {
    result = objc_msgSend(*(id *)(v1 + 32), "setBounds:", *(double *)(v1 + 176), *(double *)(v1 + 184), *(double *)(v1 + 192), *(double *)(v1 + 200));
    if (!*(_BYTE *)(v1 + 212))
      return objc_msgSend(*(id *)(v1 + 32), "layoutIfNeeded");
  }
  return result;
}

uint64_t __66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __66__PKExpressTransactionBannerViewController_viewWillLayoutSubviews__block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __77__PKExpressTransactionBannerViewController__appearWithTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  _DWORD *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  _DWORD *val;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v4 + 24))
  {
    if (!*((_BYTE *)v3 + 1064) && v3[262] == 1)
    {
      val = v3;
      objc_msgSend(v3, "viewIfLoaded");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        objc_msgSend(v5, "bounds");
        objc_msgSend(val, "setPreferredContentSize:", v7, v8);
      }
      val[262] = 2;
      -[PKExpressTransactionBannerViewController _updatePreferredContentSize](val);

      v3 = val;
    }
  }
  else
  {
    *(_BYTE *)(v4 + 24) = 1;
  }

}

- (void)_updatePreferredContentSize
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  if (val)
  {
    if ((*((_DWORD *)val + 262) - 2) >= 8)
    {
      __break(1u);
    }
    else if (!val[1152])
    {
      val[1152] = 1;
      objc_initWeak(&location, val);
      objc_msgSend(val, "systemApertureElementContext");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __71__PKExpressTransactionBannerViewController__updatePreferredContentSize__block_invoke;
      v3[3] = &unk_1E3E61310;
      objc_copyWeak(&v4, &location);
      objc_msgSend(v2, "setElementNeedsUpdateWithCoordinatedAnimations:", v3);

      objc_destroyWeak(&v4);
      objc_destroyWeak(&location);
    }
  }
}

void __77__PKExpressTransactionBannerViewController__appearWithTransitionCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v5 = (void *)MEMORY[0x1E0DC3F10];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__PKExpressTransactionBannerViewController__appearWithTransitionCoordinator___block_invoke_3;
  v13[3] = &unk_1E3E612E8;
  v14 = *(id *)(a1 + 32);
  objc_msgSend(v5, "performWithoutAnimation:", v13);
  *(_DWORD *)(*(_QWORD *)(a1 + 40) + 1048) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 984) = 1;
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 984) = 0;
  v6 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v6 + 1128))
  {
    if (!objc_msgSend(*(id *)(v6 + 1128), "status"))
      goto LABEL_5;
    v6 = *(_QWORD *)(a1 + 40);
  }
  -[PKExpressTransactionBannerViewController _displayResolution](v6);
LABEL_5:
  v7 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v7 + 1112))
  {
    if (*(_BYTE *)(v7 + 1113))
      v8 = 2;
    else
      v8 = 3;
  }
  else
  {
    v8 = 1;
  }
  v9 = *(_QWORD *)(v7 + 1000);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __77__PKExpressTransactionBannerViewController__appearWithTransitionCoordinator___block_invoke_4;
  v10[3] = &unk_1E3E61C30;
  objc_copyWeak(&v12, (id *)(a1 + 56));
  v11 = *(id *)(a1 + 48);
  -[PKExpressBannerLeadingView _setState:withCompletion:](v9, v8, v10);

  objc_destroyWeak(&v12);
}

uint64_t __77__PKExpressTransactionBannerViewController__appearWithTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_displayResolution
{
  void *v2;
  uint64_t v3;
  BOOL v4;
  NSObject *v5;
  const char *v6;
  const char *v7;
  char v8;
  int v9;
  int v10;
  double v11;
  uint64_t v12;
  int v13;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  id *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t);
  void *v36;
  id v37;
  id v38;
  char v39;
  _QWORD v40[4];
  id v41;
  id location;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (a1 && !*(_BYTE *)(a1 + 1064) && *(_DWORD *)(a1 + 1048))
  {
    v2 = *(void **)(a1 + 1128);
    if (v2)
    {
      v3 = objc_msgSend(v2, "status");
      v4 = v3 == 1;
      if (*(_BYTE *)(a1 + 1112))
      {
        if (v3 == 1 && !*(_BYTE *)(a1 + 1113))
        {
          *(_BYTE *)(a1 + 1113) = v4;
          if (!*(_BYTE *)(a1 + 1112))
          {
            *(_BYTE *)(a1 + 1112) = 1;
            goto LABEL_21;
          }
LABEL_15:
          PKLogFacilityTypeGetObject();
          v5 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v48 = a1;
            v6 = "PKExpressTransactionBVC (%p): displaying override success resolution.";
LABEL_23:
            _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
          }
LABEL_24:
          v8 = 1;
          v9 = 2;
          v10 = 1;
LABEL_30:

          v12 = *(_QWORD *)(a1 + 1000);
          if (v12)
          {
            v13 = *(_DWORD *)(v12 + 464);
            if ((v13 | 4) != 4 && v13 != v9)
            {
              if (*(_QWORD *)(v12 + 480))
              {
                *(_DWORD *)(v12 + 464) = v9;
                -[PKExpressBannerLeadingView _updateLayerState](v12, v11);
              }
              else
              {
                -[PKExpressBannerLeadingView _setState:withCompletion:](v12, v9, 0);
              }
            }
          }
          objc_initWeak(&location, (id)a1);
          *(_BYTE *)(a1 + 1114) = 1;
          -[PKExpressTransactionBannerViewController _cancelRevokeTimer](a1);
          v15 = objc_alloc(MEMORY[0x1E0D66CA8]);
          v16 = MEMORY[0x1E0C809B0];
          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __62__PKExpressTransactionBannerViewController__displayResolution__block_invoke;
          v40[3] = &unk_1E3E61310;
          v32 = &v41;
          objc_copyWeak(&v41, &location);
          v17 = (void *)objc_msgSend(v15, "initWithBlock:", v40);
          v18 = *(_QWORD *)(a1 + 1024);
          v33 = v16;
          v34 = 3221225472;
          v35 = __62__PKExpressTransactionBannerViewController__displayResolution__block_invoke_2;
          v36 = &unk_1E3E79238;
          v19 = v17;
          v37 = v19;
          objc_copyWeak(&v38, &location);
          v39 = v8;
          if (!v18)
            goto LABEL_53;
          v20 = *(_QWORD *)(v18 + 424);
          v21 = &v33;
          v22 = v21;
          if (v20)
          {
            if (*(_DWORD *)(v20 + 416) == v10)
            {
              v23 = *(void **)(v20 + 424);
              if (!v23)
              {
                ((void (*)(uint64_t *, _QWORD))v35)(v21, 0);
                goto LABEL_52;
              }
              v24 = _Block_copy(v21);
              objc_msgSend(v23, "addObject:", v24, &v41, v33, v34);
            }
            else
            {
              *(_DWORD *)(v20 + 416) = v10;
              v25 = *(id *)(v20 + 424);
              v26 = objc_alloc(MEMORY[0x1E0C99DE8]);
              v27 = (void *)objc_msgSend(v26, "initWithCapacity:", 1, &v41, v33, v34);
              v28 = _Block_copy(v22);
              objc_msgSend(v27, "addObject:", v28);

              objc_storeStrong((id *)(v20 + 424), v27);
              v45 = 0u;
              v46 = 0u;
              v43 = 0u;
              v44 = 0u;
              v24 = v25;
              v29 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, buf, 16);
              if (v29)
              {
                v30 = *(_QWORD *)v44;
                do
                {
                  for (i = 0; i != v29; ++i)
                  {
                    if (*(_QWORD *)v44 != v30)
                      objc_enumerationMutation(v24);
                    (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i) + 16))();
                  }
                  v29 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, buf, 16);
                }
                while (v29);
              }

              if (v27 == *(void **)(v20 + 424))
                -[PKExpressGlyphView _updateGlyphViewAnimated:](v20, 1);

            }
          }
LABEL_52:

LABEL_53:
          objc_destroyWeak(&v38);

          objc_destroyWeak(v32);
          objc_destroyWeak(&location);
          return;
        }
LABEL_12:
        -[PKExpressTransactionBannerViewController _startRevokeTimer](a1);
        return;
      }
      *(_BYTE *)(a1 + 1113) = v4;
      if (*(_BYTE *)(a1 + 1112))
      {
        if (v3 == 1)
          goto LABEL_15;
        goto LABEL_18;
      }
      *(_BYTE *)(a1 + 1112) = 1;
      if (v3 == 1)
      {
LABEL_21:
        PKLogFacilityTypeGetObject();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v48 = a1;
          v6 = "PKExpressTransactionBVC (%p): displaying success resolution.";
          goto LABEL_23;
        }
        goto LABEL_24;
      }
    }
    else
    {
      if (*(_BYTE *)(a1 + 1112))
        goto LABEL_12;
      *(_BYTE *)(a1 + 1113) = 0;
      if (*(_BYTE *)(a1 + 1112))
      {
LABEL_18:
        PKLogFacilityTypeGetObject();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v48 = a1;
          v7 = "PKExpressTransactionBVC (%p): displaying override failure resolution.";
LABEL_28:
          _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);
          goto LABEL_29;
        }
        goto LABEL_29;
      }
      *(_BYTE *)(a1 + 1112) = 1;
    }
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v48 = a1;
      v7 = "PKExpressTransactionBVC (%p): displaying failure resolution.";
      goto LABEL_28;
    }
LABEL_29:
    v8 = 0;
    v10 = 2;
    v9 = 3;
    goto LABEL_30;
  }
}

void __77__PKExpressTransactionBannerViewController__appearWithTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

void __77__PKExpressTransactionBannerViewController__appearWithTransitionCoordinator___block_invoke_5(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __77__PKExpressTransactionBannerViewController__appearWithTransitionCoordinator___block_invoke_6;
  v2[3] = &unk_1E3E61C80;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

  objc_destroyWeak(&v4);
}

void __77__PKExpressTransactionBannerViewController__appearWithTransitionCoordinator___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 134217984;
      v5 = WeakRetained;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKExpressTransactionBVC (%p): appeared.", (uint8_t *)&v4, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __77__PKExpressTransactionBannerViewController__shrinkWithTransitionCoordinator___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  *(CFAbsoluteTime *)(*(_QWORD *)(a1 + 32) + 1104) = CFAbsoluteTimeGetCurrent();
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1048) = 6;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 984) = 1;
  objc_msgSend(*(id *)(a1 + 40), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 984) = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__PKExpressTransactionBannerViewController__shrinkWithTransitionCoordinator___block_invoke_2;
  block[3] = &unk_1E3E612E8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __77__PKExpressTransactionBannerViewController__shrinkWithTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  BOOL v7;
  double v8;
  double v9;
  dispatch_source_t v10;
  void *v11;
  NSObject *v12;
  dispatch_time_t v13;
  NSObject *v14;
  _QWORD handler[4];
  id v16;
  id v17;
  id location;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1 && !*(_BYTE *)(v1 + 1064) && *(_DWORD *)(v1 + 1048) == 6)
  {
    v2 = *(NSObject **)(v1 + 1040);
    if (v2)
    {
      dispatch_source_cancel(v2);
      v3 = *(void **)(v1 + 1040);
      *(_QWORD *)(v1 + 1040) = 0;

    }
    v4 = *(double *)(v1 + 1096);
    v5 = 0.0;
    if (v4 > 0.0)
    {
      v6 = *(double *)(v1 + 1104);
      v7 = v4 >= v6 || v6 <= 0.0;
      v8 = v6 - v4;
      if (v7)
        v5 = 0.0;
      else
        v5 = v8;
    }
    v9 = 0.45 - v5;
    if (0.45 - v5 <= 0.0)
    {
      __61__PKExpressTransactionBannerViewController__startExpandTimer__block_invoke((uint64_t)v2, v1);
    }
    else
    {
      v10 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
      v11 = *(void **)(v1 + 1040);
      *(_QWORD *)(v1 + 1040) = v10;

      v12 = *(NSObject **)(v1 + 1040);
      v13 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
      dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
      objc_initWeak(&location, (id)v1);
      v14 = *(NSObject **)(v1 + 1040);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __61__PKExpressTransactionBannerViewController__startExpandTimer__block_invoke_2;
      handler[3] = &unk_1E3E61C80;
      objc_copyWeak(&v17, &location);
      v16 = &__block_literal_global_235_0;
      dispatch_source_set_event_handler(v14, handler);
      dispatch_resume(*(dispatch_object_t *)(v1 + 1040));

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
}

void __77__PKExpressTransactionBannerViewController__shrinkWithTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__PKExpressTransactionBannerViewController__shrinkWithTransitionCoordinator___block_invoke_4;
  block[3] = &unk_1E3E61310;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __77__PKExpressTransactionBannerViewController__shrinkWithTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PKLogFacilityTypeGetObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 134217984;
      v4 = WeakRetained;
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "PKExpressTransactionBVC (%p): shrunk.", (uint8_t *)&v3, 0xCu);
    }

  }
}

- (void)_cancelRevokeTimer
{
  NSObject *v2;
  void *v3;

  v2 = *(NSObject **)(a1 + 1120);
  if (v2)
  {
    dispatch_source_cancel(v2);
    v3 = *(void **)(a1 + 1120);
    *(_QWORD *)(a1 + 1120) = 0;

  }
}

uint64_t __77__PKExpressTransactionBannerViewController__expandWithTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1048) = 9;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 984) = 1;
  objc_msgSend(*(id *)(a1 + 40), "setNeedsLayout");
  result = objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 984) = 0;
  return result;
}

void __77__PKExpressTransactionBannerViewController__expandWithTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__PKExpressTransactionBannerViewController__expandWithTransitionCoordinator___block_invoke_3;
  block[3] = &unk_1E3E61310;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __77__PKExpressTransactionBannerViewController__expandWithTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  _BYTE *WeakRetained;
  NSObject *v2;
  int v3;
  _BYTE *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PKLogFacilityTypeGetObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 134217984;
      v4 = WeakRetained;
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "PKExpressTransactionBVC (%p): expanded.", (uint8_t *)&v3, 0xCu);
    }

    WeakRetained[1068] = 0;
    -[PKExpressTransactionBannerViewController _startRevokeTimer]((uint64_t)WeakRetained);
  }

}

- (void)_startRevokeTimer
{
  NSObject *v2;
  const char *v3;
  void *v4;
  int v5;
  dispatch_source_t v6;
  void *v7;
  NSObject *v8;
  int64_t v9;
  dispatch_time_t v10;
  NSObject *v11;
  _QWORD handler[4];
  id v13;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  if (a1 && !*(_BYTE *)(a1 + 1064))
  {
    -[PKExpressTransactionBannerViewController _cancelRevokeTimer](a1);
    if (*(_BYTE *)(a1 + 1114))
    {
      PKLogFacilityTypeGetObject();
      v2 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
LABEL_5:

        return;
      }
      LODWORD(location[0]) = 134217984;
      *(id *)((char *)location + 4) = (id)a1;
      v3 = "PKExpressTransactionBVC (%p): preventing revoke timer - glyph state animating.";
LABEL_25:
      _os_log_debug_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEBUG, v3, (uint8_t *)location, 0xCu);
      goto LABEL_5;
    }
    if (!*(_BYTE *)(a1 + 1066))
    {
      PKLogFacilityTypeGetObject();
      v2 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
        goto LABEL_5;
      LODWORD(location[0]) = 134217984;
      *(id *)((char *)location + 4) = (id)a1;
      v3 = "PKExpressTransactionBVC (%p): preventing revoke timer - leading view shrinking.";
      goto LABEL_25;
    }
    if (!*(_BYTE *)(a1 + 1067))
    {
      PKLogFacilityTypeGetObject();
      v2 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
        goto LABEL_5;
      LODWORD(location[0]) = 134217984;
      *(id *)((char *)location + 4) = (id)a1;
      v3 = "PKExpressTransactionBVC (%p): preventing revoke timer - waiting for shrink.";
      goto LABEL_25;
    }
    if (*(_BYTE *)(a1 + 1068))
    {
      PKLogFacilityTypeGetObject();
      v2 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
        goto LABEL_5;
      LODWORD(location[0]) = 134217984;
      *(id *)((char *)location + 4) = (id)a1;
      v3 = "PKExpressTransactionBVC (%p): preventing revoke timer - expanding.";
      goto LABEL_25;
    }
    v4 = *(void **)(a1 + 1128);
    if (v4 && objc_msgSend(v4, "isProcessing"))
    {
      PKLogFacilityTypeGetObject();
      v2 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
        goto LABEL_5;
      LODWORD(location[0]) = 134217984;
      *(id *)((char *)location + 4) = (id)a1;
      v3 = "PKExpressTransactionBVC (%p): preventing revoke timer - express transaction ongoing.";
      goto LABEL_25;
    }
    v5 = *(unsigned __int8 *)(a1 + 1136);
    v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    v7 = *(void **)(a1 + 1120);
    *(_QWORD *)(a1 + 1120) = v6;

    v8 = *(NSObject **)(a1 + 1120);
    if (v5)
      v9 = 1000000000;
    else
      v9 = 500000000;
    v10 = dispatch_time(0, v9);
    dispatch_source_set_timer(v8, v10, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    objc_initWeak(location, (id)a1);
    v11 = *(NSObject **)(a1 + 1120);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __61__PKExpressTransactionBannerViewController__startRevokeTimer__block_invoke;
    handler[3] = &unk_1E3E61310;
    objc_copyWeak(&v13, location);
    dispatch_source_set_event_handler(v11, handler);
    dispatch_resume(*(dispatch_object_t *)(a1 + 1120));
    objc_destroyWeak(&v13);
    objc_destroyWeak(location);
  }
}

void __71__PKExpressTransactionBannerViewController__updatePreferredContentSize__block_invoke(uint64_t a1)
{
  id *v1;
  _DWORD *WeakRetained;
  id v3;
  int v4;
  _BOOL4 v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double *v14;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  NSObject *v32;
  id v33;
  void *v34;
  uint64_t v35;
  id v36;
  NSObject *v37;
  void *v38;
  dispatch_source_t v39;
  void *v40;
  NSObject *v41;
  dispatch_time_t v42;
  NSObject *v43;
  _QWORD *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  _QWORD v50[4];
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id location;
  __int128 buf;
  void (*v57)(uint64_t);
  void *v58;
  id v59[4];

  v59[2] = *(id *)MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained && !*((_BYTE *)WeakRetained + 1064))
  {
    v4 = WeakRetained[262];
    v5 = 0;
    v6 = 3;
    v7 = 3;
    switch(v4)
    {
      case 2:
        goto LABEL_7;
      case 3:
      case 6:
      case 9:
        goto LABEL_9;
      case 4:
        v7 = 5;
        v6 = 6;
        goto LABEL_7;
      case 5:
        v5 = 0;
        v4 = 6;
        goto LABEL_9;
      case 7:
        v7 = 8;
        v6 = 9;
LABEL_7:
        v5 = v4 != v7;
        WeakRetained[262] = v7;
        v4 = v6;
        goto LABEL_9;
      case 8:
        v5 = 0;
        v4 = 9;
LABEL_9:
        objc_msgSend(WeakRetained, "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        PKFloatRoundToPixel();
        objc_msgSend(v8, "SBUISA_systemApertureObstructedAreaLayoutGuide");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "layoutFrame");
        v11 = v10;
        v13 = v12;

        PKFloatRoundToPixel();
        v14 = (double *)*((_QWORD *)v3 + 125);
        v48 = v11;
        v49 = v13;
        v47 = v15;
        if (v14)
        {
          -[PKExpressBannerLeadingView _metricsForSizeClass:]((uint64_t)&buf, v14, 2u);
          v16 = *(double *)&v57;
        }
        else
        {
          v16 = 0.0;
        }
        PKFloatRoundToPixel();
        v18 = v17;
        PKFloatRoundToPixel();
        objc_msgSend(*((id *)v3 + 128), "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
        v20 = v19;
        PKFloatRoundToPixel();
        v22 = v21;
        PKFloatRoundToPixel();
        v23 = v20 + fmax(v22, 10.0);
        if ((v4 - 3) < 6)
          goto LABEL_12;
        if (v4 != 9)
        {
LABEL_35:
          __break(1u);
          return;
        }
        v44 = (_QWORD *)*((_QWORD *)v3 + 126);
        if (v44 && v44[56])
        {
          v45 = v23 + 5.0;
          objc_msgSend(v44, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
          v23 = v45 + v46;
        }
LABEL_12:
        v24 = fmax(v47 + v16 + fmax(v18, 10.0), v23);
        v25 = v11 + v24 * 2.0;
        if (*((_DWORD *)v3 + 262) == 3)
        {
          objc_msgSend(v3, "viewIfLoaded");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          if (v26
            && (objc_msgSend(v26, "window"), v28 = (void *)objc_claimAutoreleasedReturnValue(), (v29 = v28) != 0))
          {
            objc_msgSend(v28, "bounds");
            v31 = v30;

          }
          else
          {
            v31 = 1.79769313e308;
          }

          *((double *)v3 + 135) = fmin(v25, v31);
          *((double *)v3 + 136) = v49;
          if (v5)
          {
            PKLogFacilityTypeGetObject();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(buf) = 134217984;
              *(_QWORD *)((char *)&buf + 4) = v3;
              _os_log_impl(&dword_19D178000, v32, OS_LOG_TYPE_DEFAULT, "PKExpressTransactionBVC (%p): psuedo shrinking...", (uint8_t *)&buf, 0xCu);
            }

            *((_BYTE *)v3 + 984) = v5;
            objc_msgSend(v8, "setNeedsLayout");
            objc_msgSend(v8, "layoutIfNeeded");
            *((_BYTE *)v3 + 984) = 0;
            v33 = objc_alloc(MEMORY[0x1E0D66CA8]);
            v53[0] = MEMORY[0x1E0C809B0];
            v53[1] = 3221225472;
            v53[2] = __71__PKExpressTransactionBannerViewController__updatePreferredContentSize__block_invoke_234;
            v53[3] = &unk_1E3E61310;
            objc_copyWeak(&v54, v1);
            v34 = (void *)objc_msgSend(v33, "initWithBlock:", v53);
            v35 = *((_QWORD *)v3 + 125);
            v50[0] = MEMORY[0x1E0C809B0];
            v50[1] = 3221225472;
            v50[2] = __71__PKExpressTransactionBannerViewController__updatePreferredContentSize__block_invoke_2;
            v50[3] = &unk_1E3E62FA0;
            objc_copyWeak(&v52, v1);
            v36 = v34;
            v51 = v36;
            -[PKExpressBannerLeadingView _setState:withCompletion:](v35, 4, v50);
            if (!*((_BYTE *)v3 + 1064) && *((_DWORD *)v3 + 262) == 3)
            {
              v37 = *((_QWORD *)v3 + 130);
              if (v37)
              {
                dispatch_source_cancel(v37);
                v38 = (void *)*((_QWORD *)v3 + 130);
                *((_QWORD *)v3 + 130) = 0;

              }
              v39 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
              v40 = (void *)*((_QWORD *)v3 + 130);
              *((_QWORD *)v3 + 130) = v39;

              v41 = *((_QWORD *)v3 + 130);
              v42 = dispatch_time(0, 110000000);
              dispatch_source_set_timer(v41, v42, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
              objc_initWeak(&location, v3);
              v43 = *((_QWORD *)v3 + 130);
              *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
              *((_QWORD *)&buf + 1) = 3221225472;
              *(double *)&v57 = COERCE_DOUBLE(__61__PKExpressTransactionBannerViewController__startShrinkTimer__block_invoke);
              v58 = &unk_1E3E61310;
              objc_copyWeak(v59, &location);
              dispatch_source_set_event_handler(v43, &buf);
              dispatch_resume(*((dispatch_object_t *)v3 + 130));
              objc_destroyWeak(v59);
              objc_destroyWeak(&location);
            }

            objc_destroyWeak(&v52);
            objc_destroyWeak(&v54);
          }
          else
          {
            *((_BYTE *)v3 + 984) = 0;
            objc_msgSend(v8, "setNeedsLayout");
            objc_msgSend(v8, "layoutIfNeeded");
            *((_BYTE *)v3 + 984) = 0;
          }
        }
        else
        {
          objc_msgSend(v3, "setPreferredContentSize:", v48 + v24 * 2.0, v49);
        }
        *((_BYTE *)v3 + 1152) = 0;

        break;
      default:
        goto LABEL_35;
    }
  }

}

id __71__PKExpressTransactionBannerViewController__updatePreferredContentSize__block_invoke_234(uint64_t a1)
{
  id result;

  result = objc_loadWeakRetained((id *)(a1 + 32));
  if (result)
    __break(1u);
  return result;
}

void __71__PKExpressTransactionBannerViewController__updatePreferredContentSize__block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
    goto LABEL_4;
  v3 = WeakRetained;
  if (!objc_msgSend(*(id *)(a1 + 32), "invalidate"))
  {
    v3[1066] = 1;
    -[PKExpressTransactionBannerViewController _startRevokeTimer]((uint64_t)v3);
    WeakRetained = v3;
LABEL_4:

    return;
  }
  __break(1u);
}

id __62__PKExpressTransactionBannerViewController__displayResolution__block_invoke(uint64_t a1)
{
  id result;

  result = objc_loadWeakRetained((id *)(a1 + 32));
  if (result)
    __break(1u);
  return result;
}

void __62__PKExpressTransactionBannerViewController__displayResolution__block_invoke_2(uint64_t a1)
{
  unsigned __int8 *WeakRetained;
  unsigned __int8 *v3;

  if (objc_msgSend(*(id *)(a1 + 32), "invalidate"))
  {
    __break(1u);
  }
  else
  {
    WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      if (WeakRetained[1113] == *(unsigned __int8 *)(a1 + 48))
      {
        WeakRetained[1114] = 0;
        v3 = WeakRetained;
        -[PKExpressTransactionBannerViewController _startRevokeTimer]((uint64_t)WeakRetained);
        WeakRetained = v3;
      }
    }

  }
}

void __61__PKExpressTransactionBannerViewController__startShrinkTimer__block_invoke(uint64_t a1)
{
  CFAbsoluteTime *WeakRetained;
  NSObject *v2;
  void *v3;
  CFAbsoluteTime *val;

  WeakRetained = (CFAbsoluteTime *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    val = WeakRetained;
    v2 = *((_QWORD *)WeakRetained + 130);
    if (v2)
    {
      dispatch_source_cancel(v2);
      v3 = (void *)*((_QWORD *)val + 130);
      val[130] = 0.0;

    }
    val[137] = CFAbsoluteTimeGetCurrent();
    *((_DWORD *)val + 262) = 4;
    -[PKExpressTransactionBannerViewController _updatePreferredContentSize](val);
    WeakRetained = val;
  }

}

void __61__PKExpressTransactionBannerViewController__startExpandTimer__block_invoke(uint64_t a1, uint64_t a2)
{
  _BYTE *val;

  *(_BYTE *)(a2 + 1067) = 1;
  *(_DWORD *)(a2 + 1048) = 7;
  val = (id)a2;
  -[PKExpressTransactionBannerViewController _startRevokeTimer]((uint64_t)val);
  -[PKExpressTransactionBannerViewController _updatePreferredContentSize](val);

}

void __61__PKExpressTransactionBannerViewController__startExpandTimer__block_invoke_2(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  NSObject *v5;
  NSObject **v6;

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[130];
    v6 = v3;
    if (v4)
    {
      dispatch_source_cancel(v4);
      v5 = v6[130];
      v6[130] = 0;

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v3 = v6;
  }

}

void __61__PKExpressTransactionBannerViewController__startRevokeTimer__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !*((_BYTE *)WeakRetained + 1064))
  {
    v3 = WeakRetained;
    -[PKExpressTransactionBannerViewController _revoked]((uint64_t)WeakRetained);
    v2 = objc_loadWeakRetained(v3 + 145);
    objc_msgSend(v2, "revoke");

    WeakRetained = v3;
  }

}

- (void)_revoked
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  dispatch_time_t v11;
  _QWORD aBlock[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  if (a1 && !*(_BYTE *)(a1 + 1064))
  {
    *(_BYTE *)(a1 + 1064) = 1;
    v2 = *(NSObject **)(a1 + 1120);
    if (v2)
    {
      dispatch_source_cancel(v2);
      v3 = *(void **)(a1 + 1120);
      *(_QWORD *)(a1 + 1120) = 0;

    }
    v4 = *(void **)(a1 + 1072);
    if (v4)
    {
      v5 = v4;
      v6 = *(void **)(a1 + 1072);
      *(_QWORD *)(a1 + 1072) = 0;

      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v16 = 0;
        v17 = &v16;
        v18 = 0x2020000000;
        v19 = *MEMORY[0x1E0DC4878];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __52__PKExpressTransactionBannerViewController__revoked__block_invoke;
        aBlock[3] = &unk_1E3E792A0;
        v13 = v5;
        v15 = &v16;
        v8 = v7;
        v14 = v8;
        v9 = _Block_copy(aBlock);
        v10 = objc_msgSend(v8, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("Wallet Banner - CL In Use Grace Period"), v9);
        v17[3] = v10;
        v11 = dispatch_time(0, (uint64_t)(*MEMORY[0x1E0D6A4D0] * 1000000000.0));
        dispatch_after(v11, MEMORY[0x1E0C80D38], v9);

        _Block_object_dispose(&v16, 8);
      }
      else
      {
        objc_msgSend(v5, "invalidate");
      }

    }
  }
}

uint64_t __52__PKExpressTransactionBannerViewController__revoked__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_QWORD *)(v3 + 24) != *MEMORY[0x1E0DC4878])
  {
    *(_QWORD *)(v3 + 24) = *MEMORY[0x1E0DC4878];
    return objc_msgSend(*(id *)(a1 + 40), "endBackgroundTask:");
  }
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setPresentable:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_storeWeak((id *)&self->_presentable, v5);
  v4 = v5;
  if (v5 && self->_revoked)
  {
    objc_msgSend(v5, "revoke");
    v4 = v5;
  }

}

- (void)setBannerDetached:(BOOL)a3
{
  if (self->_bannerDetached != a3)
  {
    self->_bannerDetached = a3;
    if (a3)
    {
      if (-[PKExpressTransactionState isProcessing](self->_expressState, "isProcessing"))
      {
        -[PKExpressTransactionState resolve](self->_expressState, "resolve");
        -[PKExpressTransactionBannerViewController _displayResolution]((uint64_t)self);
      }
    }
  }
}

- (PKBannerHandleState)bannerState
{
  return self->_bannerState;
}

- (void)setBannerState:(id)a3
{
  PKExpressTransactionBannerHandleState *v5;
  id *p_bannerState;
  void *v7;
  void *v8;
  char v9;
  PKExpressTransactionState *expressState;
  PKExpressTransactionBannerHandleState *v11;

  v5 = (PKExpressTransactionBannerHandleState *)a3;
  if (!v5)
    goto LABEL_10;
  v11 = v5;
  if (-[PKExpressTransactionBannerHandleState type](v5, "type"))
    goto LABEL_11;
  p_bannerState = (id *)&self->_bannerState;
  v5 = v11;
  if (self->_bannerState == v11)
  {
LABEL_10:

    return;
  }
  -[PKExpressTransactionBannerHandleState transactionState](v11, "transactionState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*p_bannerState
    || (objc_msgSend(*p_bannerState, "transactionState"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v7, "isRelatedToState:", v8),
        v8,
        (v9 & 1) != 0))
  {
    objc_storeStrong((id *)&self->_bannerState, a3);
    objc_storeStrong((id *)&self->_expressState, v7);
    expressState = self->_expressState;
    if (!expressState || -[PKExpressTransactionState status](expressState, "status"))
      -[PKExpressTransactionBannerViewController _displayResolution]((uint64_t)self);

    v5 = v11;
    goto LABEL_10;
  }
LABEL_11:
  __break(1u);
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  void *v4;
  CLInUseAssertion *v5;
  CLInUseAssertion *inUseAssertion;
  id v7;

  if (!self->_revoked)
  {
    v4 = (void *)MEMORY[0x1E0C9E3A8];
    PKPassKitCoreBundle();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (CLInUseAssertion *)objc_msgSend(v4, "newAssertionForBundle:withReason:", v7, CFSTR("Wallet Express Banner is Active"));
    inUseAssertion = self->_inUseAssertion;
    self->_inUseAssertion = v5;

  }
}

- (int64_t)contentRole
{
  return 1;
}

- (int64_t)preferredLayoutMode
{
  return 4;
}

- (int64_t)maximumLayoutMode
{
  return 4;
}

- (int64_t)preferredCustomLayout
{
  if (self->_state >= 4u)
    return 0;
  else
    return 3;
}

- (NSString)associatedAppBundleIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E0D6B590];
}

- (NSURL)launchURL
{
  return -[PKPass passURL](self->_pass, "passURL");
}

- (unint64_t)presentationBehaviors
{
  return 74;
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (self->_activeLayoutMode != a3)
  {
    -[PKExpressTransactionBannerViewController viewIfLoaded](self, "viewIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v5;
    if (v5)
    {
      objc_msgSend(v5, "layoutIfNeeded");
      self->_activeLayoutMode = a3;
      -[PKExpressTransactionBannerViewController systemApertureElementContext](self, "systemApertureElementContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "requestAlertingAssertion");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAutomaticallyInvalidatable:", 0);

      objc_msgSend(v10, "setNeedsLayout");
    }
    else
    {
      self->_activeLayoutMode = a3;
      -[PKExpressTransactionBannerViewController systemApertureElementContext](self, "systemApertureElementContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "requestAlertingAssertion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAutomaticallyInvalidatable:", 0);

    }
  }
}

- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3
{
  int state;
  id v5;
  void *v6;
  int64_t activeLayoutMode;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  PKExpressTransactionBannerViewController *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  PKExpressTransactionBannerViewController *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  id v32;
  id v33;
  id aBlock[5];
  _QWORD v35[3];
  char v36;
  id location;
  _BYTE buf[24];
  void *v39;
  PKExpressTransactionBannerViewController *v40;
  PKExpressTransactionBannerViewController *v41;
  id v42;
  id v43[3];

  v43[2] = *(id *)MEMORY[0x1E0C80C00];
  v27 = a3;
  if (self->_revoked)
    goto LABEL_2;
  state = self->_state;
  if (state == 8)
  {
    v15 = v27;
    if (self->_state != 8)
      goto LABEL_25;
    v16 = v15;
    if (!v15)
      goto LABEL_25;
    PKLogFacilityTypeGetObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_19D178000, v17, OS_LOG_TYPE_DEFAULT, "PKExpressTransactionBVC (%p): expanding...", buf, 0xCu);
    }

    self->_expanding = 1;
    -[PKExpressTransactionBannerViewController _cancelRevokeTimer]((uint64_t)self);
    objc_initWeak(aBlock, self);
    -[PKExpressTransactionBannerViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __77__PKExpressTransactionBannerViewController__expandWithTransitionCoordinator___block_invoke;
    v39 = &unk_1E3E75B28;
    v40 = self;
    v20 = v18;
    v41 = v20;
    v28 = v19;
    v29 = 3221225472;
    v30 = __77__PKExpressTransactionBannerViewController__expandWithTransitionCoordinator___block_invoke_2;
    v31 = &unk_1E3E6E980;
    objc_copyWeak(&v32, aBlock);
    objc_msgSend(v16, "animateAlongsideTransition:completion:", buf, &v28);
    objc_destroyWeak(&v32);

    objc_destroyWeak(aBlock);
  }
  else
  {
    if (state != 5)
    {
      if (state)
        goto LABEL_2;
      v5 = v27;
      if (!self->_state)
      {
        v6 = v5;
        if (v5)
        {
          activeLayoutMode = self->_activeLayoutMode;
          PKLogFacilityTypeGetObject();
          v8 = objc_claimAutoreleasedReturnValue();
          v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
          if (activeLayoutMode == 4)
          {
            if (v9)
            {
              *(_DWORD *)buf = 134217984;
              *(_QWORD *)&buf[4] = self;
              _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "PKExpressTransactionBVC (%p): appearing...", buf, 0xCu);
            }

            -[PKExpressTransactionBannerViewController view](self, "view");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_initWeak(&location, self);
            v35[0] = 0;
            v35[1] = v35;
            v35[2] = 0x2020000000;
            v11 = MEMORY[0x1E0C809B0];
            v36 = 0;
            aBlock[0] = (id)MEMORY[0x1E0C809B0];
            aBlock[1] = (id)3221225472;
            aBlock[2] = __77__PKExpressTransactionBannerViewController__appearWithTransitionCoordinator___block_invoke;
            aBlock[3] = &unk_1E3E791C0;
            aBlock[4] = v35;
            v12 = _Block_copy(aBlock);
            *(_QWORD *)buf = v11;
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __77__PKExpressTransactionBannerViewController__appearWithTransitionCoordinator___block_invoke_2;
            v39 = &unk_1E3E791E8;
            v8 = v10;
            v40 = (PKExpressTransactionBannerViewController *)v8;
            v41 = self;
            objc_copyWeak(v43, &location);
            v13 = v12;
            v42 = v13;
            v28 = v11;
            v29 = 3221225472;
            v30 = __77__PKExpressTransactionBannerViewController__appearWithTransitionCoordinator___block_invoke_5;
            v31 = &unk_1E3E79210;
            objc_copyWeak(&v33, &location);
            v14 = v13;
            v32 = v14;
            objc_msgSend(v6, "animateAlongsideTransition:completion:", buf, &v28);

            objc_destroyWeak(&v33);
            objc_destroyWeak(v43);

            _Block_object_dispose(v35, 8);
            objc_destroyWeak(&location);
          }
          else if (v9)
          {
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = activeLayoutMode;
            _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "PKExpressTransactionBVC (%p): deferring apperance while in mode %ld.", buf, 0x16u);
          }

          goto LABEL_2;
        }
      }
LABEL_25:
      __break(1u);
    }
    v21 = v27;
    if (self->_state != 5)
      goto LABEL_25;
    v22 = v21;
    if (!v21)
      goto LABEL_25;
    PKLogFacilityTypeGetObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_19D178000, v23, OS_LOG_TYPE_DEFAULT, "PKExpressTransactionBVC (%p): shrinking...", buf, 0xCu);
    }

    -[PKExpressTransactionBannerViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(aBlock, self);
    v25 = MEMORY[0x1E0C809B0];
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __77__PKExpressTransactionBannerViewController__shrinkWithTransitionCoordinator___block_invoke;
    v39 = &unk_1E3E75B28;
    v40 = self;
    v26 = v24;
    v41 = v26;
    v28 = v25;
    v29 = 3221225472;
    v30 = __77__PKExpressTransactionBannerViewController__shrinkWithTransitionCoordinator___block_invoke_3;
    v31 = &unk_1E3E6E980;
    objc_copyWeak(&v32, aBlock);
    objc_msgSend(v22, "animateAlongsideTransition:completion:", buf, &v28);
    objc_destroyWeak(&v32);

    objc_destroyWeak(aBlock);
  }
LABEL_2:

}

- (SBUISystemApertureAccessoryView)leadingView
{
  return 0;
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return 0;
}

- (SBUISystemApertureAccessoryView)minimalView
{
  return 0;
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v6 = a3;
  v7 = a4;
  if (self->_transitBalanceModel)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __111__PKExpressTransactionBannerViewController_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke;
    block[3] = &unk_1E3E61400;
    block[4] = self;
    v9 = v6;
    v10 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __111__PKExpressTransactionBannerViewController_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "uniqueID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PKEqualObjects();

  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setTransitProperties:", *(_QWORD *)(a1 + 48));
    -[PKExpressTransactionBannerViewController _updateBalanceContent](*(_QWORD **)(a1 + 32));
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v6 = a3;
  v7 = a4;
  if (self->_transitBalanceModel)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __100__PKExpressTransactionBannerViewController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke;
    block[3] = &unk_1E3E61400;
    block[4] = self;
    v9 = v6;
    v10 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __100__PKExpressTransactionBannerViewController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "uniqueID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PKEqualObjects();

  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setDynamicBalances:", *(_QWORD *)(a1 + 48));
    -[PKExpressTransactionBannerViewController _updateBalanceContent](*(_QWORD **)(a1 + 32));
  }
}

- (void)expressTrailingView:(id)a3 revealingCheckmarkAnimated:(BOOL)a4
{
  PKExpressBannerLeadingView *leadingView;
  PKPassThumbnailView *passView;
  PKPass *pass;
  SystemSoundID v8;

  if (self && !self->_revoked && !self->_successPlayed)
  {
    self->_successPlayed = 1;
    kdebug_trace();
    leadingView = self->_leadingView;
    if (leadingView)
    {
      passView = leadingView->_passView;
      if (passView)
      {
        if ((passView->_options & 2) == 0)
        {
          __break(1u);
          return;
        }
        -[PKPassView didTransact](passView->_passView, "didTransact");
      }
    }
    pass = self->_pass;
    if (pass)
    {
      v8 = 1394;
      if (-[PKPass passType](pass, "passType") == PKPassTypeSecureElement)
      {
        if (-[PKPass isAccessPass](self->_pass, "isAccessPass"))
          v8 = 1163;
        else
          v8 = 1394;
      }
    }
    else
    {
      v8 = 1394;
    }
    AudioServicesPlaySystemSound(v8);
  }
}

- (void)expressLabelViewDidChangeSize:(id)a3
{
  id v4;
  unsigned int state;
  BOOL v6;
  unsigned int v7;
  id v8;

  v4 = a3;
  state = self->_state;
  v6 = state >= 8;
  v7 = state - 8;
  if (!v6)
    goto LABEL_5;
  v8 = v4;
  if (v7 <= 1)
  {
    -[PKExpressTransactionBannerViewController _updatePreferredContentSize](self);
    v4 = v8;
LABEL_5:

    return;
  }
  __break(1u);
}

- (PKBannerViewControllerPresentable)presentable
{
  return (PKBannerViewControllerPresentable *)objc_loadWeakRetained((id *)&self->_presentable);
}

- (int64_t)activeLayoutMode
{
  return self->_activeLayoutMode;
}

- (BOOL)isBannerDetached
{
  return self->_bannerDetached;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentable);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_expressState, 0);
  objc_storeStrong((id *)&self->_revokeTimer, 0);
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_storeStrong((id *)&self->_bannerState, 0);
  objc_storeStrong((id *)&self->_transitionTimer, 0);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_trailingLabel, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_transitBalanceModel, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
