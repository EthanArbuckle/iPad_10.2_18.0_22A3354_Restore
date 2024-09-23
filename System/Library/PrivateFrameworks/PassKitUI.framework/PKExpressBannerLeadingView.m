@implementation PKExpressBannerLeadingView

- (PKExpressBannerLeadingView)init
{

  return 0;
}

- (PKExpressBannerLeadingView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (PKExpressBannerLeadingView)initWithCoder:(id)a3
{

  return 0;
}

- (void)_updateSizeWithAnimationFactory:(uint64_t)a1
{
  id v3;
  __int128 v4;
  BOOL v5;
  BOOL v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  __int128 v11;
  double v12;
  double v13;
  CATransform3D v14;
  CATransform3D a;
  CATransform3D v16;
  CATransform3D v17;
  __int128 v18;
  __int128 v19;
  CGFloat v20;

  v3 = a2;
  v20 = 0.0;
  v18 = 0u;
  v19 = 0u;
  -[PKExpressBannerLeadingView _metricsForSizeClass:]((uint64_t)&v18, (double *)a1, *(_DWORD *)(a1 + 468));
  v4 = v18;
  v5 = *(double *)(a1 + 520) == *(double *)&v18 && *(double *)(a1 + 528) == *((double *)&v18 + 1);
  if (!v5
    || (*(double *)(a1 + 536) == *(double *)&v19 ? (v6 = *(double *)(a1 + 544) == *((double *)&v19 + 1)) : (v6 = 0), !v6))
  {
    memset(&v17, 0, sizeof(v17));
    CATransform3DMakeScale(&v17, v20, v20, 1.0);
    memset(&v16, 0, sizeof(v16));
    v7 = *(void **)(a1 + 440);
    if (v7)
      objc_msgSend(v7, "transform");
    a = v17;
    v14 = v16;
    if (!CATransform3DEqualToTransform(&a, &v14))
    {
      if (v3)
      {
        objc_msgSend(v3, "springAnimationWithKeyPath:", CFSTR("transform"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        a = v16;
        v14 = v17;
        objc_msgSend(v8, "pkui_updateForAdditiveAnimationFromTransform:toTransform:", &a, &v14);
        v9 = (id)objc_msgSend(*(id *)(a1 + 440), "pkui_addAdditiveAnimation:", v8);

      }
      v10 = *(void **)(a1 + 440);
      a = v17;
      objc_msgSend(v10, "setTransform:", &a);
    }
    v11 = v19;
    *(_OWORD *)(a1 + 520) = v18;
    *(_OWORD *)(a1 + 536) = v11;
    PKFloatRoundToPixel();
    *(double *)(a1 + 560) = v12;
    *(double *)(a1 + 576) = *(double *)&v4 - (v12 + *(double *)&v19);
    PKFloatRoundToPixel();
    *(double *)(a1 + 552) = v13;
    *(double *)(a1 + 568) = *((double *)&v4 + 1) - (v13 + *((double *)&v19 + 1));
    objc_msgSend((id)a1, "setNeedsLayout");
  }

}

- (void)dealloc
{
  NSObject *transitionTimer;
  OS_dispatch_source *v4;
  NSMutableArray *completions;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  transitionTimer = self->_transitionTimer;
  if (transitionTimer)
  {
    dispatch_source_cancel(transitionTimer);
    v4 = self->_transitionTimer;
    self->_transitionTimer = 0;

  }
  completions = self->_completions;
  if (completions)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = completions;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++) + 16))();
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
  v11.receiver = self;
  v11.super_class = (Class)PKExpressBannerLeadingView;
  -[PKExpressBannerLeadingView dealloc](&v11, sel_dealloc);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double height;
  CGSize result;

  width = self->_targetAlignmentSize.width;
  height = self->_targetAlignmentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double width;
  double height;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKExpressBannerLeadingView;
  -[PKExpressBannerLeadingView layoutSubviews](&v11, sel_layoutSubviews);
  -[PKExpressBannerLeadingView bounds](self, "bounds");
  PKSizeAlignedInRect();
  v4 = v3 - self->_targetAlignmentInsets.left;
  v6 = v5 - self->_targetAlignmentInsets.top;
  width = self->_targetSize.width;
  height = self->_targetSize.height;
  -[CALayer anchorPoint](self->_contentLayer, "anchorPoint");
  -[CALayer setPosition:](self->_contentLayer, "setPosition:", v4 + v9 * width, v6 + v10 * height);
}

- (uint64_t)_metricsForSizeClass:(unsigned int)a3
{
  uint64_t v3;
  double *v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = result;
  v4 = (double *)MEMORY[0x1E0C9D820];
  v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (a3 < 3)
  {
    v5 = 1.79769313e308;
    v4 = (double *)((char *)&unk_19DF182A8 + 8 * (int)a3);
  }
  if (*v4 <= 0.0 || v5 <= 0.0)
  {
    v8 = *((_QWORD *)a2 + 61);
    v10 = *((_QWORD *)a2 + 62);
    v11 = *((_QWORD *)a2 + 63);
    v12 = *((_QWORD *)a2 + 64);
    v6 = 1.0;
  }
  else
  {
    v6 = fmin(*v4 / a2[63], v5 / a2[64]);
    PKSizeRoundToPixel();
    v8 = v7;
    v10 = v9;
    result = PKSizeRoundToPixel();
  }
  *(_QWORD *)v3 = v8;
  *(_QWORD *)(v3 + 8) = v10;
  *(_QWORD *)(v3 + 16) = v11;
  *(_QWORD *)(v3 + 24) = v12;
  *(double *)(v3 + 32) = v6;
  return result;
}

- (void)_updateLayerState
{
  unsigned int v3;
  __CFString *v4;
  uint64_t v5;
  double v6;
  NSObject *v7;
  void *v8;
  uint8_t buf[4];
  __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_DWORD *)(a1 + 464) - 1;
  if (v3 <= 3)
  {
    v4 = off_1E3E792C0[v3];
    objc_msgSend(*(id *)(a1 + 440), "stateWithName:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      LODWORD(v6) = 1.0;
      v8 = (void *)v5;
      objc_msgSend(*(id *)(a1 + 456), "setState:ofLayer:transitionSpeed:", v5, *(_QWORD *)(a1 + 440), v6);

      return;
    }
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "PKExpressBannerLeadingView: could not find state with name %@.", buf, 0xCu);
    }

  }
  LODWORD(a2) = 1.0;
  objc_msgSend(*(id *)(a1 + 456), "setInitialStatesOfLayer:transitionSpeed:", *(_QWORD *)(a1 + 440), a2);

}

- (void)_setState:(void *)a3 withCompletion:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  double v20;
  int v21;
  int64_t v22;
  dispatch_source_t v23;
  void *v24;
  NSObject *v25;
  dispatch_time_t v26;
  NSObject *v27;
  _QWORD v28[4];
  id v29;
  id location;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a1)
  {
    if (*(_DWORD *)(a1 + 464) == a2)
    {
      if (v5)
      {
        v7 = *(void **)(a1 + 480);
        if (v7)
        {
          v8 = _Block_copy(v5);
          objc_msgSend(v7, "addObject:", v8);

        }
        else
        {
          (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
        }
      }
    }
    else
    {
      *(_DWORD *)(a1 + 464) = a2;
      v9 = *(NSObject **)(a1 + 472);
      if (v9)
      {
        dispatch_source_cancel(v9);
        v10 = *(void **)(a1 + 472);
        *(_QWORD *)(a1 + 472) = 0;

      }
      v11 = *(id *)(a1 + 480);
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
      if (v6)
      {
        v13 = _Block_copy(v6);
        objc_msgSend(v12, "addObject:", v13);

      }
      objc_storeStrong((id *)(a1 + 480), v12);
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v14 = v11;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v32;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v32 != v17)
              objc_enumerationMutation(v14);
            (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v18++) + 16))();
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        }
        while (v16);
      }

      v19 = *(void **)(a1 + 480);
      if (v12 == v19)
      {
        v21 = *(_DWORD *)(a1 + 464) - 1;
        if (v21 > 3)
        {
          -[PKExpressBannerLeadingView _updateLayerState](a1, v20);
          -[PKExpressBannerLeadingView _finishTransition](a1);
        }
        else
        {
          v22 = qword_19DF182C0[v21];
          -[PKExpressBannerLeadingView _updateLayerState](a1, v20);
          v23 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
          v24 = *(void **)(a1 + 472);
          *(_QWORD *)(a1 + 472) = v23;

          v25 = *(NSObject **)(a1 + 472);
          v26 = dispatch_time(0, v22);
          dispatch_source_set_timer(v25, v26, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
          objc_initWeak(&location, (id)a1);
          v27 = *(NSObject **)(a1 + 472);
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __55__PKExpressBannerLeadingView__setState_withCompletion___block_invoke;
          v28[3] = &unk_1E3E61310;
          objc_copyWeak(&v29, &location);
          dispatch_source_set_event_handler(v27, v28);
          dispatch_activate(*(dispatch_object_t *)(a1 + 472));
          objc_destroyWeak(&v29);
          objc_destroyWeak(&location);
        }
      }
    }
  }

}

void __55__PKExpressBannerLeadingView__setState_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    -[PKExpressBannerLeadingView _finishTransition]((uint64_t)WeakRetained);
    WeakRetained = v2;
  }

}

- (void)_finishTransition
{
  NSObject *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(NSObject **)(a1 + 472);
  if (v2)
  {
    dispatch_source_cancel(v2);
    v3 = *(void **)(a1 + 472);
    *(_QWORD *)(a1 + 472) = 0;

  }
  v4 = *(id *)(a1 + 480);
  v5 = *(void **)(a1 + 480);
  *(_QWORD *)(a1 + 480) = 0;

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_transitionTimer, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_frontLayer, 0);
  objc_storeStrong((id *)&self->_contentLayer, 0);
  objc_storeStrong((id *)&self->_passPortal, 0);
  objc_storeStrong((id *)&self->_passView, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
