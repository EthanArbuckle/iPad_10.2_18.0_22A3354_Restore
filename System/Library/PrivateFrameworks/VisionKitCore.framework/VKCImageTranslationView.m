@implementation VKCImageTranslationView

- (VKCImageTranslationView)init
{
  VKCImageTranslationView *v2;
  VKCImageTranslationView *v3;
  id v4;
  uint64_t v5;
  UIView *translationContainerView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VKCImageTranslationView;
  v2 = -[VKCImageTranslationView init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[VKCImageBaseOverlayView setNormalizedVisibleRect:](v2, "setNormalizedVisibleRect:", 0.0, 0.0, 1.0, 1.0);
    v3->_translationNeedsUpdate = 1;
    v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[VKCImageTranslationView bounds](v3, "bounds");
    v5 = objc_msgSend(v4, "initWithFrame:");
    translationContainerView = v3->_translationContainerView;
    v3->_translationContainerView = (UIView *)v5;

    -[VKCImageTranslationView addSubview:](v3, "addSubview:", v3->_translationContainerView);
  }
  return v3;
}

- (void)setFrame:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VKCImageTranslationView;
  -[VKCImageTranslationView setFrame:](&v13, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[VKCImageBaseOverlayView viewRectFromNormalizedRect:](self, "viewRectFromNormalizedRect:", 0.0, 0.0, 1.0, 1.0);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[VKCImageTranslationView translationContainerView](self, "translationContainerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void)setContentsRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VKCImageTranslationView;
  -[VKCImageBaseOverlayView setContentsRect:](&v13, sel_setContentsRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[VKCImageBaseOverlayView viewRectFromNormalizedRect:](self, "viewRectFromNormalizedRect:", 0.0, 0.0, 1.0, 1.0);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[VKCImageTranslationView translationContainerView](self, "translationContainerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void)checkForTranslationResultsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id LTUIVisualTranslationViewClass;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (vk_isSeedBuild()
    && (objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("DebugVisionKitCatalystTranslation")),
        v5,
        !v6))
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }
  else
  {
    LTUIVisualTranslationViewClass = getLTUIVisualTranslationViewClass();
    -[VKCImageTranslationView recognizedLines](self, "recognizedLines");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __68__VKCImageTranslationView_checkForTranslationResultsWithCompletion___block_invoke;
    v9[3] = &unk_1E9462DF8;
    v10 = v4;
    objc_msgSend(LTUIVisualTranslationViewClass, "isTranslatable:completion:", v8, v9);

  }
}

uint64_t __68__VKCImageTranslationView_checkForTranslationResultsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)showTranslationOverlay
{
  NSObject *v3;
  LTUIVisualTranslationView *v4;
  LTUIVisualTranslationView *visualTranslationView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[4];
  VKCImageTranslationView *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!self->_visualTranslationView)
  {
    v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = self;
      _os_log_impl(&dword_1D2E0D000, v3, OS_LOG_TYPE_DEFAULT, "Creating Translation overlay View: %@", buf, 0xCu);
    }

    getLTUIVisualTranslationViewClass();
    v4 = (LTUIVisualTranslationView *)objc_opt_new();
    visualTranslationView = self->_visualTranslationView;
    self->_visualTranslationView = v4;

    -[VKCImageTranslationView presentationAnchorView](self, "presentationAnchorView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageTranslationView visualTranslationView](self, "visualTranslationView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPresentationAnchorView:", v6);

    -[VKCImageTranslationView visualTranslationView](self, "visualTranslationView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[VKCImageTranslationView visualTranslationView](self, "visualTranslationView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  }
  v19 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = self;
    _os_log_impl(&dword_1D2E0D000, v19, OS_LOG_TYPE_DEFAULT, "Activating Translation overlay: %@", buf, 0xCu);
  }

  if (self->_translationNeedsUpdate)
  {
    objc_initWeak((id *)buf, self);
    -[VKCImageTranslationView visualTranslationView](self, "visualTranslationView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageTranslationView recognizedLines](self, "recognizedLines");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __49__VKCImageTranslationView_showTranslationOverlay__block_invoke;
    v24[3] = &unk_1E9462E20;
    objc_copyWeak(&v25, (id *)buf);
    v24[4] = self;
    objc_msgSend(v20, "translate:completion:", v21, v24);

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    -[VKCImageTranslationView translationContainerView](self, "translationContainerView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageTranslationView visualTranslationView](self, "visualTranslationView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v23);

  }
}

void __49__VKCImageTranslationView_showTranslationOverlay__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id *v4;
  id WeakRetained;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  if (!a3)
  {
    v4 = (id *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "setTranslationNeedsUpdate:", 0);

    objc_msgSend(*(id *)(a1 + 32), "viewRectFromNormalizedRect:", 0.0, 0.0, 1.0, 1.0);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(*(id *)(a1 + 32), "visualTranslationView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

    v18 = objc_loadWeakRetained(v4);
    objc_msgSend(v18, "translationContainerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_loadWeakRetained(v4);
    objc_msgSend(v16, "visualTranslationView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v17);

  }
}

- (id)recognizedLines
{
  void *v2;
  void *v3;
  void *v4;

  -[VKCImageBaseOverlayView recognitionResult](self, "recognitionResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourceVNDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "blocksWithTypes:inRegion:", 2, 0.0, 0.0, 1.0, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)hideTranslationOverlay
{
  NSObject *v3;
  void *v4;
  int v5;
  VKCImageTranslationView *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_1D2E0D000, v3, OS_LOG_TYPE_DEFAULT, "Hiding Translation overlay %@", (uint8_t *)&v5, 0xCu);
  }

  -[VKCImageTranslationView visualTranslationView](self, "visualTranslationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismiss");

}

- (void)setRecognitionResult:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VKCImageTranslationView;
  -[VKCImageBaseOverlayView setRecognitionResult:](&v4, sel_setRecognitionResult_, a3);
  -[VKCImageTranslationView setTranslationNeedsUpdate:](self, "setTranslationNeedsUpdate:", 1);
}

- (void)setPresentationAnchorView:(id)a3
{
  objc_storeWeak((id *)&self->_presentationAnchorView, a3);
}

- (VKCVisualSearchResult)visualSearchResult
{
  return self->_visualSearchResult;
}

- (void)setVisualSearchResult:(id)a3
{
  objc_storeStrong((id *)&self->_visualSearchResult, a3);
}

- (LTUIVisualTranslationView)visualTranslationView
{
  return self->_visualTranslationView;
}

- (void)setVisualTranslationView:(id)a3
{
  objc_storeStrong((id *)&self->_visualTranslationView, a3);
}

- (UIView)presentationAnchorView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_presentationAnchorView);
}

- (BOOL)translationNeedsUpdate
{
  return self->_translationNeedsUpdate;
}

- (void)setTranslationNeedsUpdate:(BOOL)a3
{
  self->_translationNeedsUpdate = a3;
}

- (UIView)translationContainerView
{
  return self->_translationContainerView;
}

- (void)setTranslationContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_translationContainerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translationContainerView, 0);
  objc_destroyWeak((id *)&self->_presentationAnchorView);
  objc_storeStrong((id *)&self->_visualTranslationView, 0);
  objc_storeStrong((id *)&self->_visualSearchResult, 0);
}

@end
