@implementation PKFaceIDBannerViewController

- (PKFaceIDBannerViewController)init
{

  return 0;
}

- (PKFaceIDBannerViewController)initWithNibName:(id)a3 bundle:(id)a4
{

  return 0;
}

- (PKFaceIDBannerViewController)initWithCoder:(id)a3
{

  return 0;
}

- (void)dealloc
{
  NSObject *revokeTimer;
  void *v4;
  NSObject *glyphLegibilityTimer;
  objc_super v6;

  -[LAUIPearlGlyphView invalidate](self->_glyphView, "invalidate");
  revokeTimer = self->_revokeTimer;
  if (revokeTimer)
    dispatch_source_cancel(revokeTimer);
  if (self->_revokeBackgroundTask != *MEMORY[0x1E0DC4878])
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endBackgroundTask:", self->_revokeBackgroundTask);

  }
  glyphLegibilityTimer = self->_glyphLegibilityTimer;
  if (glyphLegibilityTimer)
    dispatch_source_cancel(glyphLegibilityTimer);
  v6.receiver = self;
  v6.super_class = (Class)PKFaceIDBannerViewController;
  -[PKFaceIDBannerViewController dealloc](&v6, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  LAUIPearlGlyphView *v6;
  LAUIPearlGlyphView *glyphView;
  LAUIPearlGlyphView *v8;
  UIView *v9;
  UIView *containerView;
  UIView *v11;
  void *v12;
  PKBlurView *v13;
  PKBlurView *glyphContainerView;
  PKBlurView *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PKFaceIDBannerViewController;
  -[PKFaceIDBannerViewController loadView](&v18, sel_loadView);
  -[PKFaceIDBannerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizingMask:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = (void *)objc_msgSend(MEMORY[0x1E0D44450], "createSystemApertureConfiguration");
  objc_msgSend(v5, "setInitialStyle:", 4);
  v6 = (LAUIPearlGlyphView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D44458]), "initWithConfiguration:", v5);
  glyphView = self->_glyphView;
  self->_glyphView = v6;

  v8 = self->_glyphView;
  if (v8
    && (-[LAUIPearlGlyphView setFaceVisibility:animated:](v8, "setFaceVisibility:animated:", 7, 0),
        -[LAUIPearlGlyphView setShakeEnabled:](self->_glyphView, "setShakeEnabled:", 0),
        -[LAUIPearlGlyphView setInApplicationContext:](self->_glyphView, "setInApplicationContext:", 1),
        self->_glyphState < 5uLL))
  {
    -[LAUIPearlGlyphView setState:animated:](self->_glyphView, "setState:animated:");
    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    containerView = self->_containerView;
    self->_containerView = v9;

    -[UIView setOpaque:](self->_containerView, "setOpaque:", 0);
    v11 = self->_containerView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v11, "setBackgroundColor:", v12);

    objc_msgSend(v3, "addSubview:", self->_containerView);
    v13 = objc_alloc_init(PKBlurView);
    glyphContainerView = self->_glyphContainerView;
    self->_glyphContainerView = v13;

    -[PKBlurView setAnchorPoint:](self->_glyphContainerView, "setAnchorPoint:", 0.5, 0.0);
    -[PKBlurView setOpaque:](self->_glyphContainerView, "setOpaque:", 0);
    v15 = self->_glyphContainerView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKBlurView setBackgroundColor:](v15, "setBackgroundColor:", v16);

    -[PKBlurView addSubview:](self->_glyphContainerView, "addSubview:", self->_glyphView);
    -[UIView addSubview:](self->_containerView, "addSubview:", self->_glyphContainerView);
    -[UIView layer](self->_containerView, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAllowsHitTesting:", 0);

    -[UIView setUserInteractionEnabled:](self->_containerView, "setUserInteractionEnabled:", 0);
  }
  else
  {
    __break(1u);
  }
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
  double v26;
  double v27;
  double v28;
  double v29;
  unsigned int state;
  unint64_t v31;
  double v32;
  double v33;
  double v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  PKBlurView *glyphContainerView;
  double v45;
  double v46;
  PKBlurView *v47;
  double v48;
  double v49;
  CATransform3D v50;
  CATransform3D v51;
  objc_super v52;

  v52.receiver = self;
  v52.super_class = (Class)PKFaceIDBannerViewController;
  -[PKFaceIDBannerViewController viewWillLayoutSubviews](&v52, sel_viewWillLayoutSubviews);
  activeLayoutMode = self->_activeLayoutMode;
  if (activeLayoutMode == 4 || activeLayoutMode == 1)
  {
    -[PKFaceIDBannerViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
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
    -[UIView convertRect:fromView:](self->_containerView, "convertRect:fromView:", v5, v16, v18, v20, v22);
    v27 = v26;
    v29 = v28;

    state = self->_state;
    if (state >= 7)
    {
      __break(1u);
    }
    else
    {
      v31 = self->_activeLayoutMode;
      v32 = *MEMORY[0x1E0C9D538];
      v33 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      v34 = 69.0;
      -[PKBlurView setBounds:](self->_glyphContainerView, "setBounds:", *MEMORY[0x1E0C9D538], v33, 69.0, 69.0);
      -[LAUIPearlGlyphView setFrame:](self->_glyphView, "setFrame:", v32, v33, 69.0, 69.0);
      memset(&v51, 0, sizeof(v51));
      if (v31 < 2 || ((0x47u >> state) & 1) != 0)
      {
        PKSizeRoundToPixel();
        v34 = v42;
        v41 = v43;
        CATransform3DMakeScale(&v51, 0.131579, 0.131579, 1.0);
        v40 = 0.0;
        v39 = 66.6666667;
      }
      else
      {
        v35 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
        *(_OWORD *)&v51.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
        *(_OWORD *)&v51.m33 = v35;
        v36 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
        *(_OWORD *)&v51.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
        *(_OWORD *)&v51.m43 = v36;
        v37 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
        *(_OWORD *)&v51.m11 = *MEMORY[0x1E0CD2610];
        *(_OWORD *)&v51.m13 = v37;
        v38 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
        *(_OWORD *)&v51.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
        *(_OWORD *)&v51.m23 = v38;
        v39 = 0.0;
        v40 = 1.0;
        v41 = 69.0;
      }
      -[PKBlurView setAlpha:](self->_glyphContainerView, "setAlpha:", v40);
      glyphContainerView = self->_glyphContainerView;
      v50 = v51;
      -[PKBlurView setTransform3D:](glyphContainerView, "setTransform3D:", &v50);
      -[PKBlurView setBlurRadius:](self->_glyphContainerView, "setBlurRadius:", v39);
      PKFloatRoundToPixel();
      v46 = v25 + v45;
      v47 = self->_glyphContainerView;
      -[PKBlurView anchorPoint](v47, "anchorPoint");
      -[PKBlurView setCenter:](v47, "setCenter:", v46 + v48 * v34, v27 + v29 + v49 * v41);
    }
  }
}

- (void)_cancelRevokeTimer
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 1000);
    if (v2)
    {
      dispatch_source_cancel(v2);
      v3 = *(void **)(a1 + 1000);
      *(_QWORD *)(a1 + 1000) = 0;

    }
    v4 = *MEMORY[0x1E0DC4878];
    if (*(_QWORD *)(a1 + 992) != *MEMORY[0x1E0DC4878])
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endBackgroundTask:", *(_QWORD *)(a1 + 992));

      *(_QWORD *)(a1 + 992) = v4;
    }
  }
}

void __49__PKFaceIDBannerViewController__startRevokeTimer__block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PKFaceIDBannerViewController__startRevokeTimer__block_invoke_2;
  block[3] = &unk_1E3E61310;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __49__PKFaceIDBannerViewController__startRevokeTimer__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    -[PKFaceIDBannerViewController _revoke]((uint64_t)WeakRetained);
    WeakRetained = v2;
  }

}

- (void)_revoke
{
  uint64_t v2;
  uint64_t v3;
  id WeakRetained;
  id v5;

  if (!*(_BYTE *)(a1 + 984))
  {
    v2 = *(_QWORD *)(a1 + 992);
    v3 = *MEMORY[0x1E0DC4878];
    *(_QWORD *)(a1 + 992) = *MEMORY[0x1E0DC4878];
    -[PKFaceIDBannerViewController _revoked](a1);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 1088));
    objc_msgSend(WeakRetained, "revoke");

    if (v2 != v3)
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endBackgroundTask:", v2);

    }
  }
}

void __49__PKFaceIDBannerViewController__startRevokeTimer__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    -[PKFaceIDBannerViewController _revoke]((uint64_t)WeakRetained);
    WeakRetained = v2;
  }

}

- (void)_revoked
{
  if (a1)
  {
    if (!*(_BYTE *)(a1 + 984))
    {
      *(_BYTE *)(a1 + 984) = 1;
      objc_msgSend(*(id *)(a1 + 1072), "invalidate");
      -[PKFaceIDBannerViewController _cancelRevokeTimer](a1);
    }
  }
}

- (void)_updateState
{
  int v2;
  BOOL v3;
  _BOOL4 v5;
  double v6;
  double v7;
  id v9;

  if (val && !*((_BYTE *)val + 984))
  {
    v2 = val[242];
    v3 = v2 == 3 || v2 == 6;
    if (v3 || v2 == 0)
    {
      v5 = !*((_BYTE *)val + 1080) || *((_BYTE *)val + 1012) || val[259] != 0;
      if (v2 == 3)
      {
        if (!v5 && !val[258])
        {
          objc_msgSend(val, "viewIfLoaded");
          v9 = (id)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            objc_msgSend(v9, "bounds");
            objc_msgSend(val, "setPreferredContentSize:", v6, v7);
          }
          val[242] = 4;
          -[PKFaceIDBannerViewController _updatePreferredContentSize](val);

        }
      }
      else if (v2 == 6 || v2 == 0)
      {
        if (v5)
        {
          if (v2 == 6)
          {
            val[242] = 1;
            -[PKFaceIDBannerViewController _updatePreferredContentSize](val);
          }
        }
        else if (!val[258])
        {
          -[PKFaceIDBannerViewController _revoke]((uint64_t)val);
        }
      }
      else
      {
        __break(1u);
      }
    }
  }
}

- (void)_updatePreferredContentSize
{
  unsigned int v1;
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  v1 = val[242];
  if (v1 <= 6 && ((1 << v1) & 0x36) != 0)
  {
    if (!*((_BYTE *)val + 1010))
    {
      *((_BYTE *)val + 1010) = 1;
      *((_BYTE *)val + 1011) = 0;
      objc_initWeak(&location, val);
      objc_msgSend(val, "systemApertureElementContext");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __59__PKFaceIDBannerViewController__updatePreferredContentSize__block_invoke;
      v4[3] = &unk_1E3E61310;
      objc_copyWeak(&v5, &location);
      objc_msgSend(v3, "setElementNeedsUpdateWithCoordinatedAnimations:", v4);

      objc_destroyWeak(&v5);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    __break(1u);
  }
}

void __65__PKFaceIDBannerViewController__appearWithTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *WeakRetained;
  NSObject *v4;
  int v5;
  _DWORD *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v1 + 24))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      PKLogFacilityTypeGetObject();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = 134217984;
        v6 = WeakRetained;
        _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "PKFaceIDBVC (%p): appeared.", (uint8_t *)&v5, 0xCu);
      }

      --WeakRetained[258];
      if (*(_BYTE *)(a1 + 48))
        *((_BYTE *)WeakRetained + 1009) = 1;
      -[PKFaceIDBannerViewController _updateGlyphState]((uint64_t)WeakRetained);
      -[PKFaceIDBannerViewController _updateState](WeakRetained);
    }

  }
  else
  {
    *(_BYTE *)(v1 + 24) = 1;
  }
}

- (void)_updateGlyphState
{
  uint64_t v2;
  int v3;
  BOOL v4;
  uint64_t v5;
  unint64_t v6;
  double v7;
  uint64_t v8;
  NSObject *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  id v17[2];
  _QWORD handler[4];
  id v19;
  id v20;
  id location;

  if (a1 && !*(_QWORD *)(a1 + 1024))
  {
    v2 = objc_msgSend(*(id *)(a1 + 976), "glyphState");
    if (*(_DWORD *)(a1 + 968) && *(_QWORD *)(a1 + 1016) == 2 && *(_BYTE *)(a1 + 1009))
    {
      v3 = *(char *)(a1 + 1012);
      if (v3 == 2)
      {
        v5 = 4;
      }
      else
      {
        v4 = v3 == 1;
        v5 = 3;
        if (!v4)
          v5 = v2;
      }
      *(_BYTE *)(a1 + 1012) = 0;
    }
    else
    {
      v5 = 2;
      if (!*(_BYTE *)(a1 + 1012))
        v5 = v2;
    }
    if (*(_QWORD *)(a1 + 1016) != v5)
    {
      *(_QWORD *)(a1 + 1016) = v5;
      -[PKFaceIDBannerViewController _updateKeyColor](a1);
      if (objc_msgSend((id)a1, "isViewLoaded"))
      {
        v6 = *(_QWORD *)(a1 + 1016);
        if (*(_DWORD *)(a1 + 968))
        {
          if (v6 - 3 >= 2)
          {
            v7 = 0.0;
            if (v6 == 2)
              v7 = dbl_19DF188F0[*(_DWORD *)(a1 + 1032) == 0];
          }
          else
          {
            v7 = 0.45;
          }
          ++*(_DWORD *)(a1 + 1036);
          -[PKFaceIDBannerViewController _updateState]((_DWORD *)a1);
          objc_initWeak(&location, (id)a1);
          v8 = MEMORY[0x1E0C809B0];
          if (v7 <= 0.0)
          {
            v9 = 0;
          }
          else
          {
            v9 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
            handler[0] = v8;
            handler[1] = 3221225472;
            handler[2] = __47__PKFaceIDBannerViewController__pushGlyphState__block_invoke_2;
            handler[3] = &unk_1E3E61C80;
            objc_copyWeak(&v20, &location);
            v19 = &__block_literal_global_245;
            dispatch_source_set_event_handler(v9, handler);
            objc_storeStrong((id *)(a1 + 1024), v9);

            objc_destroyWeak(&v20);
          }
          v10 = *(_QWORD *)(a1 + 1016);
          if (v10 == 4)
          {
            objc_msgSend((id)a1, "systemApertureElementContext");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "requestNegativeResponseAnimation");

            v10 = *(_QWORD *)(a1 + 1016);
          }
          if (v10 < 5)
          {
            v12 = *(void **)(a1 + 1072);
            v14[0] = v8;
            v14[1] = 3221225472;
            v14[2] = __47__PKFaceIDBannerViewController__pushGlyphState__block_invoke_3;
            v14[3] = &unk_1E3E7B3E8;
            objc_copyWeak(v17, &location);
            v13 = v9;
            v17[1] = *(id *)&v7;
            v15 = v13;
            v16 = &__block_literal_global_245;
            objc_msgSend(v12, "setState:animated:withCompletion:", v10, 1, v14);

            objc_destroyWeak(v17);
            objc_destroyWeak(&location);
            return;
          }
        }
        else if (v6 < 5)
        {
          objc_msgSend(*(id *)(a1 + 1072), "setState:animated:");
          return;
        }
        __break(1u);
      }
    }
  }
}

void __65__PKFaceIDBannerViewController__appearWithTransitionCoordinator___block_invoke_14(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  dispatch_time_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*(_BYTE *)(a1 + 48))
  {
    v4 = (void *)MEMORY[0x1E0DC3F10];
    v5 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __65__PKFaceIDBannerViewController__appearWithTransitionCoordinator___block_invoke_2;
    v12[3] = &unk_1E3E612E8;
    v13 = v2;
    objc_msgSend(v4, "performWithoutAnimation:", v12);
    v6 = dispatch_time(0, 500000000);
    v7 = v5;
    v8 = 3221225472;
    v9 = __65__PKFaceIDBannerViewController__appearWithTransitionCoordinator___block_invoke_3;
    v10 = &unk_1E3E61590;
    v11 = *(id *)(a1 + 40);
    dispatch_after(v6, MEMORY[0x1E0C80D38], &v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 968) = 3;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1008) = 1;
  objc_msgSend(v3, "setNeedsLayout", v7, v8, v9, v10);
  objc_msgSend(v3, "layoutIfNeeded");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1008) = 0;
  if (*(_BYTE *)(a1 + 48))
    -[PKFaceIDBannerViewController _updateGlyphState](*(_QWORD *)(a1 + 32));

}

uint64_t __65__PKFaceIDBannerViewController__appearWithTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __65__PKFaceIDBannerViewController__appearWithTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__PKFaceIDBannerViewController__appearWithTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 32));
}

uint64_t __65__PKFaceIDBannerViewController__shrinkWithTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 968) = 6;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1008) = 1;
  objc_msgSend(*(id *)(a1 + 40), "setNeedsLayout");
  result = objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1008) = 0;
  return result;
}

void __65__PKFaceIDBannerViewController__shrinkWithTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PKFaceIDBannerViewController__shrinkWithTransitionCoordinator___block_invoke_3;
  block[3] = &unk_1E3E61310;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __65__PKFaceIDBannerViewController__shrinkWithTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  _DWORD *WeakRetained;
  NSObject *v2;
  int v3;
  _DWORD *v4;
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
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "PKFaceIDBVC (%p): shrunk.", (uint8_t *)&v3, 0xCu);
    }

    --WeakRetained[258];
    -[PKFaceIDBannerViewController _updateState](WeakRetained);
  }

}

- (void)_updateKeyColor
{
  uint64_t v2;
  int v3;
  id v4;
  void *v5;
  id v6;

  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 1016);
    if (v2 == 3 || v2 != 4 && ((v3 = *(unsigned __int8 *)(a1 + 1012), v3 == 1) || v3 != 2 && v2))
      v4 = *(id *)(a1 + 1048);
    else
      v4 = 0;
    if (*(id *)(a1 + 1040) != v4)
    {
      v6 = v4;
      objc_storeStrong((id *)(a1 + 1040), v4);
      if (*(_BYTE *)(a1 + 1010))
      {
        *(_BYTE *)(a1 + 1011) = 1;
      }
      else
      {
        objc_msgSend((id)a1, "systemApertureElementContext");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setElementNeedsUpdate");

      }
      v4 = v6;
    }

  }
}

void __59__PKFaceIDBannerViewController__updatePreferredContentSize__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;
  int v3;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && !WeakRetained[984])
  {
    v3 = 5;
    switch(*((_DWORD *)WeakRetained + 242))
    {
      case 1:
        v3 = 2;
        goto LABEL_5;
      case 2:
      case 5:
        goto LABEL_6;
      case 4:
LABEL_5:
        *((_DWORD *)WeakRetained + 242) = v3;
LABEL_6:
        objc_msgSend(WeakRetained, "setPreferredContentSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
        v2[1010] = 0;
        if (v2[1011])
        {
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __59__PKFaceIDBannerViewController__updatePreferredContentSize__block_invoke_2;
          block[3] = &unk_1E3E612E8;
          block[4] = v2;
          dispatch_async(MEMORY[0x1E0C80D38], block);
        }
        break;
      default:
        __break(1u);
        return;
    }
  }

}

void __59__PKFaceIDBannerViewController__updatePreferredContentSize__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 1010))
  {
    if (*(_BYTE *)(v1 + 1011))
    {
      *(_BYTE *)(v1 + 1011) = 0;
      objc_msgSend(*(id *)(a1 + 32), "systemApertureElementContext");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setElementNeedsUpdate");

    }
  }
}

void __47__PKFaceIDBannerViewController__pushGlyphState__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _DWORD *val;

  val = a2;
  --val[259];
  -[PKFaceIDBannerViewController _updateGlyphState]((uint64_t)val);
  v2 = val;
  if (!val[259])
  {
    -[PKFaceIDBannerViewController _updateState](val);
    v2 = val;
  }

}

void __47__PKFaceIDBannerViewController__pushGlyphState__block_invoke_2(uint64_t a1)
{
  dispatch_source_t *WeakRetained;
  dispatch_source_t v3;
  dispatch_source_t *v4;

  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    dispatch_source_cancel(WeakRetained[128]);
    v3 = v4[128];
    v4[128] = 0;

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v4;
  }

}

void __47__PKFaceIDBannerViewController__pushGlyphState__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  dispatch_time_t v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(NSObject **)(a1 + 32);
    v6 = WeakRetained;
    if (v4)
    {
      v5 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 56) * 1000000000.0));
      dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
      dispatch_activate(*(dispatch_object_t *)(a1 + 32));
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    v3 = v6;
  }

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
  void *v4;
  uint64_t v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *revokeTimer;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  _QWORD handler[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  if (self->_bannerDetached != a3)
  {
    self->_bannerDetached = a3;
    if (a3)
    {
      if (!self->_revoked)
      {
        -[PKFaceIDBannerViewController _cancelRevokeTimer]((uint64_t)self);
        objc_initWeak(&location, self);
        objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = MEMORY[0x1E0C809B0];
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __49__PKFaceIDBannerViewController__startRevokeTimer__block_invoke;
        v13[3] = &unk_1E3E61310;
        objc_copyWeak(&v14, &location);
        self->_revokeBackgroundTask = objc_msgSend(v4, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("face_id.revoke"), v13);

        v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
        revokeTimer = self->_revokeTimer;
        self->_revokeTimer = v6;

        v8 = self->_revokeTimer;
        v9 = dispatch_time(0, 10000000000);
        dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
        v10 = self->_revokeTimer;
        handler[0] = v5;
        handler[1] = 3221225472;
        handler[2] = __49__PKFaceIDBannerViewController__startRevokeTimer__block_invoke_3;
        handler[3] = &unk_1E3E61310;
        objc_copyWeak(&v12, &location);
        dispatch_source_set_event_handler(v10, handler);
        dispatch_resume((dispatch_object_t)self->_revokeTimer);
        objc_destroyWeak(&v12);
        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      -[PKFaceIDBannerViewController _cancelRevokeTimer]((uint64_t)self);
    }
    -[PKFaceIDBannerViewController _updateState](self);
  }
}

- (PKBannerHandleState)bannerState
{
  return self->_bannerState;
}

- (void)setBannerState:(id)a3
{
  PKFaceIDBannerHandleState *v5;
  uint64_t v6;
  char v7;
  PKFaceIDBannerHandleState *v8;

  v5 = (PKFaceIDBannerHandleState *)a3;
  if (!v5)
    goto LABEL_10;
  v8 = v5;
  if (-[PKFaceIDBannerHandleState type](v5, "type") == 1)
  {
    v5 = v8;
    if (self->_bannerState == v8)
    {
LABEL_10:

      return;
    }
    objc_storeStrong((id *)&self->_bannerState, a3);
    v6 = -[PKFaceIDBannerHandleState glyphState](self->_bannerState, "glyphState");
    if (v6 == 3)
    {
      v7 = 1;
    }
    else
    {
      if (v6 != 4)
      {
LABEL_9:
        -[PKFaceIDBannerViewController _updateGlyphState]((uint64_t)self);
        v5 = v8;
        goto LABEL_10;
      }
      v7 = 2;
    }
    self->_deferredGlyphState = v7;
    -[PKFaceIDBannerViewController _updateKeyColor]((uint64_t)self);
    goto LABEL_9;
  }
  __break(1u);
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
  return self->_state < 4u;
}

- (NSString)associatedAppBundleIdentifier
{
  return 0;
}

- (NSURL)launchURL
{
  return 0;
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
    -[PKFaceIDBannerViewController viewIfLoaded](self, "viewIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v5;
    if (v5)
    {
      objc_msgSend(v5, "layoutIfNeeded");
      self->_activeLayoutMode = a3;
      -[PKFaceIDBannerViewController systemApertureElementContext](self, "systemApertureElementContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "requestAlertingAssertion");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAutomaticallyInvalidatable:", 0);

      objc_msgSend(v10, "setNeedsLayout");
    }
    else
    {
      self->_activeLayoutMode = a3;
      -[PKFaceIDBannerViewController systemApertureElementContext](self, "systemApertureElementContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "requestAlertingAssertion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAutomaticallyInvalidatable:", 0);

    }
  }
}

- (UIColor)keyColor
{
  return self->_keyColor;
}

- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3
{
  int state;
  id v5;
  void *v6;
  int64_t activeLayoutMode;
  NSObject *v8;
  _BOOL4 v9;
  BOOL v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id from[4];
  id v21;
  void *v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  PKFaceIDBannerViewController *v26;
  id v27;
  BOOL v28;
  _QWORD v29[3];
  char v30;
  id location;
  _BYTE buf[24];
  void *v33;
  PKFaceIDBannerViewController *v34;
  id v35;
  BOOL v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  if (self->_revoked)
    goto LABEL_20;
  state = self->_state;
  if (!state)
  {
LABEL_5:
    v5 = v19;
    if ((self->_state & 0xFFFFFFFD) == 0)
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
            _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "PKFaceIDBVC (%p): appearing.", buf, 0xCu);
          }

          ++self->_transitionAnimationCounter;
          v10 = self->_state == 0;
          objc_initWeak(&location, self);
          v29[0] = 0;
          v29[1] = v29;
          v29[2] = 0x2020000000;
          v30 = 0;
          v11 = (void *)MEMORY[0x1E0C809B0];
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __65__PKFaceIDBannerViewController__appearWithTransitionCoordinator___block_invoke;
          v33 = &unk_1E3E672F8;
          v34 = (PKFaceIDBannerViewController *)v29;
          objc_copyWeak(&v35, &location);
          v36 = v10;
          v22 = v11;
          v23 = 3221225472;
          v24 = __65__PKFaceIDBannerViewController__appearWithTransitionCoordinator___block_invoke_14;
          v25 = &unk_1E3E7B380;
          v26 = self;
          v28 = v10;
          v27 = _Block_copy(buf);
          from[0] = v11;
          from[1] = (id)3221225472;
          from[2] = __65__PKFaceIDBannerViewController__appearWithTransitionCoordinator___block_invoke_4;
          from[3] = &unk_1E3E67BD0;
          v12 = v27;
          v21 = v12;
          objc_msgSend(v6, "animateAlongsideTransition:completion:", &v22, from);

          objc_destroyWeak(&v35);
          _Block_object_dispose(v29, 8);
          objc_destroyWeak(&location);
        }
        else
        {
          if (v9)
          {
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = activeLayoutMode;
            _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "PKFaceIDBVC (%p): deferring apperance while in mode %ld.", buf, 0x16u);
          }

        }
        goto LABEL_20;
      }
    }
LABEL_21:
    __break(1u);
  }
  if (state != 5)
  {
    if (state != 2)
      goto LABEL_20;
    goto LABEL_5;
  }
  v13 = v19;
  if (self->_state != 5)
    goto LABEL_21;
  v14 = v13;
  if (!v13)
    goto LABEL_21;
  PKLogFacilityTypeGetObject();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = self;
    _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "PKFaceIDBVC (%p): shrinking.", buf, 0xCu);
  }

  ++self->_transitionAnimationCounter;
  -[PKFaceIDBannerViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(from, self);
  v17 = (void *)MEMORY[0x1E0C809B0];
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __65__PKFaceIDBannerViewController__shrinkWithTransitionCoordinator___block_invoke;
  v33 = &unk_1E3E75B28;
  v34 = self;
  v18 = v16;
  v35 = v18;
  v22 = v17;
  v23 = 3221225472;
  v24 = __65__PKFaceIDBannerViewController__shrinkWithTransitionCoordinator___block_invoke_2;
  v25 = &unk_1E3E6E980;
  objc_copyWeak((id *)&v26, from);
  objc_msgSend(v14, "animateAlongsideTransition:completion:", buf, &v22);
  objc_destroyWeak((id *)&v26);

  objc_destroyWeak(from);
LABEL_20:

}

- (BOOL)preventsInteractiveDismissal
{
  return 1;
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
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_glyphContainerView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_successKeyColor, 0);
  objc_storeStrong((id *)&self->_keyColor, 0);
  objc_storeStrong((id *)&self->_glyphLegibilityTimer, 0);
  objc_storeStrong((id *)&self->_revokeTimer, 0);
  objc_storeStrong((id *)&self->_bannerState, 0);
}

@end
