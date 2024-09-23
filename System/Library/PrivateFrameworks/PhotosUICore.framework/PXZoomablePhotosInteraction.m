@implementation PXZoomablePhotosInteraction

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXZoomablePhotosInteraction)initWithZoomablePhotosViewModel:(id)a3
{
  id v5;
  PXZoomablePhotosInteraction *v6;
  PXZoomablePhotosInteraction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXZoomablePhotosInteraction;
  v6 = -[PXZoomablePhotosInteraction init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_viewModel, a3);

  return v7;
}

- (PXZoomablePhotosInteraction)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXZoomablePhotosInteraction.m"), 32, CFSTR("%s is not available as initializer"), "-[PXZoomablePhotosInteraction init]");

  abort();
}

- (BOOL)handleTapOnAssetReference:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[PXZoomablePhotosInteraction viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDisplayingIndividualItems");

  if ((v6 & 1) == 0)
  {
    -[PXZoomablePhotosInteraction viewModel](self, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__PXZoomablePhotosInteraction_handleTapOnAssetReference___block_invoke;
    v9[3] = &unk_1E512BDB8;
    v10 = v4;
    objc_msgSend(v7, "performChanges:", v9);

  }
  return v6 ^ 1;
}

- (BOOL)_pinchInteractionShouldBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "enablePinch"))
  {
    -[PXZoomablePhotosInteraction viewModel](self, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetsDataSourceManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "containsAnyItems"))
    {
      -[PXZoomablePhotosInteraction delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "zoomablePhotosInteractionShouldBegin:", self);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)handlePinch:(id)a3
{
  id v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  id v16;
  _BOOL4 v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  _QWORD v35[4];
  id v36;
  id v37;
  PXZoomablePhotosInteraction *v38;
  id v39;
  uint64_t v40;
  SEL v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  double v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v7 = v6;
  -[PXZoomablePhotosInteraction viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXZoomablePhotosInteraction view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v47 = 0u;
  if (v8)
  {
    objc_msgSend(v8, "pinchState");
    v10 = *((double *)&v51 + 1);
    v11 = v51;
    v12 = *((_QWORD *)&v47 + 1);
    v13 = v47;
    v14 = *((_QWORD *)&v49 + 1);
    v15 = *(double *)&v48;
  }
  else
  {
    v11 = 0;
    v15 = 0.0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v10 = 0.0;
  }
  objc_msgSend(v8, "anchorAssetReference");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "state") == 1)
  {
    v17 = -[PXZoomablePhotosInteraction _pinchInteractionShouldBegin](self, "_pinchInteractionShouldBegin");
    objc_msgSend(v5, "locationInView:", v9);
    v19 = v18;
    v21 = v20;
    -[PXZoomablePhotosInteraction delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "zoomablePhotosInteraction:assetReferenceAtLocation:", self, v19, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "bounds");
    PXPointNormalize();
    v13 = v24;
    v12 = v25;
    objc_msgSend(v5, "scale");
    v14 = v26;
    if (objc_msgSend(v5, "numberOfTouches") == 2)
    {
      objc_msgSend(v5, "locationOfTouch:inView:", 0, v9);
      objc_msgSend(v5, "locationOfTouch:inView:", 1, v9);
      PXDistanceBetweenPoints();
      v28 = v27;
      objc_msgSend(v9, "bounds");
      v15 = v28 / v29;
    }
    if (v17)
    {
      -[PXZoomablePhotosInteraction delegate](self, "delegate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "zoomablePhotosInteractionWillBegin:", self);

      v31 = 0;
LABEL_15:
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __43__PXZoomablePhotosInteraction_handlePinch___block_invoke;
      v35[3] = &unk_1E512BDE0;
      v36 = v5;
      v40 = v14;
      v41 = a2;
      v37 = v9;
      v38 = self;
      v42 = v13;
      v43 = v12;
      v44 = v15;
      v45 = v31;
      v46 = v7;
      v16 = v23;
      v39 = v16;
      objc_msgSend(v8, "performChanges:", v35);

      goto LABEL_19;
    }
    v16 = v23;
  }
  else if (objc_msgSend(v5, "state") == 2)
  {
    if (v11 <= 2 && fmax(v7 - v10, 0.0) > 0.016)
    {
      objc_msgSend(v5, "scale");
      PXFloatByLinearlyInterpolatingFloats();
      v14 = v32;
    }
    if (objc_msgSend(v8, "isPinching"))
    {
      v31 = v11 + 1;
      v23 = v16;
      goto LABEL_15;
    }
  }
  if (!objc_msgSend(v8, "isPinching"))
  {
    v33 = 0;
    goto LABEL_21;
  }
  objc_msgSend(v8, "performChanges:", &__block_literal_global_134365);
LABEL_19:
  v33 = 1;
LABEL_21:

  return v33;
}

- (PXZoomablePhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (PXAnonymousView)view
{
  return (PXAnonymousView *)objc_loadWeakRetained((id *)&self->_view);
}

- (PXZoomablePhotosInteractionDelegate)delegate
{
  return (PXZoomablePhotosInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong(&self->_eventMonitor, 0);
}

void __43__PXZoomablePhotosInteraction_handlePinch___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  char v10;
  double v11;
  double v12;
  NSObject *v13;
  double v14;
  uint64_t v15;
  BOOL v16;
  BOOL v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[24];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "setIsPinching:", 1);
  objc_msgSend(*(id *)(a1 + 32), "locationInView:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  PXPointNormalize();
  v5 = v4;
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "velocity");
  v9 = v8;
  v10 = PXFloatApproximatelyEqualToFloat();
  objc_msgSend(*(id *)(a1 + 32), "scale");
  v12 = v11;
  if ((v10 & 1) == 0)
    v12 = v11 / *(double *)(a1 + 64);
  if (PXFloatApproximatelyEqualToFloat())
  {
    PXAssertGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v23 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v24 = 134218242;
      *(double *)&v24[4] = v12;
      *(_WORD *)&v24[12] = 2112;
      *(_QWORD *)&v24[14] = v23;
      _os_log_error_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "Adjusted scale invalid:%.3f pinchGesture:%@", v24, 0x16u);
    }

    v12 = 1.0;
  }
  v14 = fabs(v9);
  v15 = *(_QWORD *)(a1 + 96);
  v16 = v14 < INFINITY;
  v17 = v14 <= INFINITY;
  v18 = *(_QWORD *)(a1 + 64);
  if (v16)
    v19 = v9;
  else
    v19 = 0.0;
  v20 = *(_QWORD *)(a1 + 104);
  if (!v17)
    v19 = v9;
  v21 = *(_QWORD *)(a1 + 112);
  v22 = *(_QWORD *)(a1 + 56);
  *(_OWORD *)v24 = *(_OWORD *)(a1 + 80);
  *(_QWORD *)&v24[16] = v15;
  v25 = v5;
  v26 = v7;
  v27 = v18;
  v28 = v12;
  v29 = v19;
  v30 = v20;
  v31 = v21;
  objc_msgSend(v3, "setPinchState:withAnchorAssetReference:", v24, v22);

}

uint64_t __43__PXZoomablePhotosInteraction_handlePinch___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsPinching:", 0);
}

uint64_t __57__PXZoomablePhotosInteraction_handleTapOnAssetReference___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "zoomInToLastRememberedWithAnchorAssetReference:animated:", *(_QWORD *)(a1 + 32), 1);
}

@end
