@implementation VUIDownloadButton

- (VUIDownloadButton)initWithPlayable:(id)a3 type:(unint64_t)a4 textLayout:(id)a5
{
  id v8;
  id v9;
  VUIDownloadButton *v10;
  VUIDownloadButton *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v8 = a3;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VUIDownloadButton;
  v10 = -[VUIButton initWithType:interfaceStyle:](&v17, sel_initWithType_interfaceStyle_, a4, 1);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_textLayout, a5);
    -[VUIDownloadButton _setupDownloadButton](v11, "_setupDownloadButton");
    +[VUIDownloadButtonViewModel viewModelWithVideosPlayable:](VUIDownloadButtonViewModel, "viewModelWithVideosPlayable:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIDownloadButton setViewModel:](v11, "setViewModel:", v12);
    objc_initWeak(&location, v11);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __54__VUIDownloadButton_initWithPlayable_type_textLayout___block_invoke;
    v14[3] = &unk_1E9F990E0;
    objc_copyWeak(&v15, &location);
    -[VUIButton setSelectActionHandler:](v11, "setSelectActionHandler:", v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

  }
  return v11;
}

void __54__VUIDownloadButton_initWithPlayable_type_textLayout___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "actionHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "performAction:confirmBeforeStopDownloading:", objc_msgSend(WeakRetained, "isForLibrary"), 0);

}

- (VUIDownloadButton)initWithDownloadButtonViewModel:(id)a3 type:(unint64_t)a4
{
  id v6;
  VUIDownloadButton *v7;
  VUIDownloadButton *v8;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VUIDownloadButton;
  v7 = -[VUIButton initWithType:interfaceStyle:](&v13, sel_initWithType_interfaceStyle_, a4, 1);
  v8 = v7;
  if (v7)
  {
    -[VUIDownloadButton _setupDownloadButton](v7, "_setupDownloadButton");
    -[VUIDownloadButton setIsForLibrary:](v8, "setIsForLibrary:", 1);
    -[VUIDownloadButton setViewModel:](v8, "setViewModel:", v6);
    objc_initWeak(&location, v8);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__VUIDownloadButton_initWithDownloadButtonViewModel_type___block_invoke;
    v10[3] = &unk_1E9F990E0;
    objc_copyWeak(&v11, &location);
    -[VUIButton setSelectActionHandler:](v8, "setSelectActionHandler:", v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __58__VUIDownloadButton_initWithDownloadButtonViewModel_type___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "actionHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "performAction:confirmBeforeStopDownloading:", objc_msgSend(WeakRetained, "isForLibrary"), 0);

}

- (VUIDownloadButton)initWithAssetController:(id)a3 type:(unint64_t)a4
{
  void *v6;
  VUIDownloadButton *v7;

  +[VUIDownloadButtonViewModel viewModelWithAssetController:](VUIDownloadButtonViewModel, "viewModelWithAssetController:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VUIDownloadButton initWithDownloadButtonViewModel:type:](self, "initWithDownloadButtonViewModel:type:", v6, a4);

  return v7;
}

- (VUIDownloadButton)initWithMediaEntity:(id)a3 type:(unint64_t)a4
{
  id v6;
  void *v7;
  VUIDownloadButton *v8;
  VUIDownloadButton *v9;
  void *v10;

  v6 = a3;
  objc_msgSend(v6, "assetController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VUIDownloadButton initWithAssetController:type:](self, "initWithAssetController:type:", v7, a4);
  v9 = v8;
  if (v8)
  {
    -[VUIDownloadButton viewModel](v8, "viewModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMediaEntity:", v6);

  }
  return v9;
}

- (VUIDownloadButton)initWithSeasonsMetadata:(id)a3 type:(unint64_t)a4 downloadType:(unint64_t)a5
{
  void *v7;
  VUIDownloadButton *v8;

  +[VUIDownloadButtonViewModel viewModelWithSeasonsMetadata:downloadType:](VUIDownloadButtonViewModel, "viewModelWithSeasonsMetadata:downloadType:", a3, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VUIDownloadButton initWithDownloadButtonViewModel:type:](self, "initWithDownloadButtonViewModel:type:", v7, a4);
  -[VUIDownloadButton setIsForLibrary:](v8, "setIsForLibrary:", 0);

  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[VUIDownloadButton setViewModel:](self, "setViewModel:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC6AB8], 0);

  v4.receiver = self;
  v4.super_class = (Class)VUIDownloadButton;
  -[VUIDownloadButton dealloc](&v4, sel_dealloc);
}

- (void)setUsesDefaultConfiguration:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  self->_usesDefaultConfiguration = a3;
  if (a3)
  {
    -[VUIButton setPadding:](self, "setPadding:", 0.0, 0.0, 0.0, 0.0);
    -[VUIButton setImageMaxHeight:](self, "setImageMaxHeight:", 28.0);
    -[VUIButton setImageMaxWidth:](self, "setImageMaxWidth:", 28.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIButton setImageTintColor:](self, "setImageTintColor:", v4);

    if (-[VUIButton buttonType](self, "buttonType") == 8)
    {
      -[VUIButton setHeight:](self, "setHeight:", 28.0);
      -[VUIButton setWidth:](self, "setWidth:", 28.0);
      -[VUIButton setCornerRadius:](self, "setCornerRadius:", 14.0);
      objc_msgSend(MEMORY[0x1E0DC3658], "vui_tertiaryFillColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIDownloadButton setKeyBackgroundColor:](self, "setKeyBackgroundColor:", v5);

      -[VUIDownloadButton backgroundView](self, "backgroundView");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[VUIDownloadButton keyBackgroundColor](self, "keyBackgroundColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setVuiBackgroundColor:", v6);

    }
  }
}

- (void)setPresentingViewController:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_presentingViewController, obj);
    -[VUIDownloadButton actionHandler](self, "actionHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPresentingViewController:", obj);

  }
}

- (void)configureActionHandler
{
  VUIDownloadButtonActionHandler *v3;
  void *v4;
  VUIDownloadButtonActionHandler *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = [VUIDownloadButtonActionHandler alloc];
  -[VUIDownloadButton viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[VUIDownloadButtonActionHandler initWithViewModel:](v3, "initWithViewModel:", v4);

  -[VUIDownloadButtonActionHandler setParentView:](v5, "setParentView:", self);
  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__VUIDownloadButton_configureActionHandler__block_invoke;
  v9[3] = &unk_1E9F99C98;
  objc_copyWeak(&v10, &location);
  -[VUIDownloadButtonActionHandler setAcknowledgementDownloadDeletedBlock:](v5, "setAcknowledgementDownloadDeletedBlock:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __43__VUIDownloadButton_configureActionHandler__block_invoke_2;
  v7[3] = &unk_1E9F99C98;
  objc_copyWeak(&v8, &location);
  -[VUIDownloadButtonActionHandler setAcknowledgementDownloadCancelledBlock:](v5, "setAcknowledgementDownloadCancelledBlock:", v7);
  -[VUIDownloadButton setActionHandler:](self, "setActionHandler:", v5);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __43__VUIDownloadButton_configureActionHandler__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setWasDeleted:", 1);

}

void __43__VUIDownloadButton_configureActionHandler__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setWasCanceled:", 1);
  objc_msgSend(WeakRetained, "setEnabled:", 0);

}

- (void)configureWithLayoutProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v13;

  if (-[VUIButton buttonType](self, "buttonType") && -[VUIButton buttonType](self, "buttonType") != 3
    || (objc_msgSend(MEMORY[0x1E0DC69D0], "isMac") & 1) == 0)
  {
    -[VUIButton buttonBackgroundColor](self, "buttonBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIDownloadButton setKeyBackgroundColor:](self, "setKeyBackgroundColor:", v3);

    -[VUIButton setButtonBackgroundColor:](self, "setButtonBackgroundColor:", 0);
    -[VUIDownloadButton backgroundView](self, "backgroundView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIDownloadButton keyBackgroundColor](self, "keyBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setVuiBackgroundColor:", v5);

  }
  v13.receiver = self;
  v13.super_class = (Class)VUIDownloadButton;
  -[VUIButton configureWithLayoutProperties](&v13, sel_configureWithLayoutProperties);
  -[VUIDownloadButton viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "downloadState");
  -[VUIDownloadButton viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isExpired");
  -[VUIDownloadButton viewModel](self, "viewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isExpiringSoon");
  -[VUIDownloadButton viewModel](self, "viewModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadButton _updateButtonToState:isExpired:isExpiringSoon:hasFailed:](self, "_updateButtonToState:isExpired:isExpiringSoon:hasFailed:", v7, v9, v11, objc_msgSend(v12, "downloadFailedDueToError"));

}

- (void)setTintColor:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)VUIDownloadButton;
  -[VUIButton setTintColor:](&v6, sel_setTintColor_, v4);
  if (-[VUIDownloadButton tintAdjustmentMode](self, "tintAdjustmentMode") != 2)
  {
    -[VUIDownloadButton progressIndicator](self, "progressIndicator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProgressFillColor:", v4);

  }
}

- (void)saturateTintColorAndBackgroundColor
{
  UIColor *v3;
  UIColor *saturatedTintColor;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemMidGrayColor");
  v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
  saturatedTintColor = self->_saturatedTintColor;
  self->_saturatedTintColor = v3;

  -[VUIDownloadButton progressIndicator](self, "progressIndicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProgressFillColor:", self->_saturatedTintColor);

  -[VUIButton imageView](self, "imageView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setTintColor:", self->_saturatedTintColor);

}

- (void)revertTintColor
{
  void *v3;
  void *v4;
  UIColor *saturatedTintColor;
  id v6;

  -[VUIButton imageTintColor](self, "imageTintColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadButton progressIndicator](self, "progressIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProgressFillColor:", v6);

  -[VUIButton imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setTintColor:", v6);

  saturatedTintColor = self->_saturatedTintColor;
  self->_saturatedTintColor = 0;

}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  objc_super v22;
  CGSize result;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  v22.receiver = self;
  v22.super_class = (Class)VUIDownloadButton;
  -[VUIButton vui_layoutSubviews:computationOnly:](&v22, sel_vui_layoutSubviews_computationOnly_);
  v10 = v8;
  v11 = v9;
  if (v4
    && v8 == *MEMORY[0x1E0C9D820]
    && v9 == *(double *)(MEMORY[0x1E0C9D820] + 8)
    && -[VUIButton buttonType](self, "buttonType") == 6)
  {
    -[VUIDownloadButton progressIndicator](self, "progressIndicator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[VUIDownloadButton progressIndicator](self, "progressIndicator");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "vui_sizeThatFits:", width, height);
      v10 = v15;
      v11 = v16;

    }
  }
  -[VUIDownloadButton progressIndicator](self, "progressIndicator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    -[VUIDownloadButton _layoutProgressIndicator](self, "_layoutProgressIndicator");
  -[VUIDownloadButton backgroundView](self, "backgroundView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", 0.0, 0.0, v10, v11);

  -[VUIDownloadButton backgroundView](self, "backgroundView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIButton cornerRadius](self, "cornerRadius");
  objc_msgSend(v19, "_setCornerRadius:");

  v20 = v10;
  v21 = v11;
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)vui_didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIDownloadButton;
  -[VUIDownloadButton vui_didMoveToWindow](&v6, sel_vui_didMoveToWindow);
  -[VUIDownloadButton window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIUnifiedMessagingRegistry sharedInstance](VUIUnifiedMessagingRegistry, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "registerDownloadButton:", self);
  else
    objc_msgSend(v4, "unRegisterDownloadButton:", self);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  objc_super v30;
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if ((void *)__ViewModelDownloadStateContext == a6)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v15)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            -[VUIDownloadButton _updateButtonToState:oldState:](self, "_updateButtonToState:oldState:", objc_msgSend(v15, "unsignedIntegerValue"), objc_msgSend(v14, "unsignedIntegerValue"));
        }
      }
    }

    goto LABEL_12;
  }
  if ((void *)__ViewModelDownloadExpirationDateContext == a6)
  {
    -[VUIDownloadButton viewModel](self, "viewModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v14, "downloadState");
    -[VUIDownloadButton viewModel](self, "viewModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v11;
    v18 = v10;
    v19 = objc_msgSend(v16, "isExpired");
    -[VUIDownloadButton viewModel](self, "viewModel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isExpiringSoon");
    -[VUIDownloadButton viewModel](self, "viewModel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "downloadFailedDueToError");
    v24 = v19;
    v10 = v18;
    v11 = v17;
    -[VUIDownloadButton _updateButtonToState:isExpired:isExpiringSoon:hasFailed:](self, "_updateButtonToState:isExpired:isExpiringSoon:hasFailed:", v29, v24, v21, v23);

LABEL_12:
    goto LABEL_13;
  }
  if ((void *)__ViewModelDownloadProgressContext == a6)
  {
    VUIDefaultLogObject();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      -[VUIDownloadButton viewModel](self, "viewModel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "downloadProgress");
      *(_DWORD *)buf = 134217984;
      v32 = v27;
      _os_log_impl(&dword_1D96EE000, v25, OS_LOG_TYPE_DEFAULT, "VUIDownloadButton:: update download progress %f", buf, 0xCu);

    }
    -[VUIDownloadButton viewModel](self, "viewModel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "downloadProgress");
    -[VUIDownloadButton _updateDownloadProgress:animated:](self, "_updateDownloadProgress:animated:", 1);

  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)VUIDownloadButton;
    -[VUIDownloadButton observeValueForKeyPath:ofObject:change:context:](&v30, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }
LABEL_13:

}

- (void)setViewModel:(id)a3
{
  VUIDownloadButtonViewModel *v5;
  VUIDownloadButtonViewModel *viewModel;
  VUIDownloadButtonViewModel *v7;

  v5 = (VUIDownloadButtonViewModel *)a3;
  viewModel = self->_viewModel;
  if (viewModel != v5)
  {
    v7 = v5;
    if (viewModel)
    {
      -[VUIDownloadButton _stopObservingViewModel:](self, "_stopObservingViewModel:");
      -[VUIDownloadButton _stopObservingDownloadProgress:](self, "_stopObservingDownloadProgress:", self->_viewModel);
    }
    objc_storeStrong((id *)&self->_viewModel, a3);
    v5 = v7;
    if (v7)
    {
      -[VUIDownloadButton configureActionHandler](self, "configureActionHandler");
      -[VUIDownloadButton _startObservingViewModel:](self, "_startObservingViewModel:", v7);
      -[VUIDownloadButton _updateButtonToState:isExpired:isExpiringSoon:hasFailed:](self, "_updateButtonToState:isExpired:isExpiringSoon:hasFailed:", -[VUIDownloadButtonViewModel downloadState](v7, "downloadState"), -[VUIDownloadButtonViewModel isExpired](v7, "isExpired"), -[VUIDownloadButtonViewModel isExpiringSoon](v7, "isExpiringSoon"), -[VUIDownloadButtonViewModel downloadFailedDueToError](v7, "downloadFailedDueToError"));
      v5 = v7;
    }
  }

}

- (void)setShowsTextInDownloadedState:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  self->_showsTextInDownloadedState = a3;
  if (a3)
  {
    -[VUIDownloadButton viewModel](self, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "downloadState");

    if (v5 == 4)
    {
      -[VUIDownloadButton _buttonPropertiesForState:isExpired:isExpiringSoon:hasFailed:](self, "_buttonPropertiesForState:isExpired:isExpiringSoon:hasFailed:", 4, 0, 0, 0);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[VUIDownloadButton _updateButtonToDownloadedWithProperties:](self, "_updateButtonToDownloadedWithProperties:", v6);

    }
  }
}

- (void)updateWithAssetController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VUIDownloadButton viewModel](self, "viewModel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAssetController:", v4);

}

- (void)updateWithPlayable:(id)a3 textLayout:(id)a4
{
  id v5;

  +[VUIDownloadButtonViewModel viewModelWithVideosPlayable:](VUIDownloadButtonViewModel, "viewModelWithVideosPlayable:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadButton setViewModel:](self, "setViewModel:", v5);

}

- (void)setScrolledNonUberPercentage:(double)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIDownloadButton;
  -[VUIButton setScrolledNonUberPercentage:](&v6, sel_setScrolledNonUberPercentage_);
  -[VUIDownloadButton backgroundView](self, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", a3 == 0.0);

}

- (CGSize)_imageSizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  BOOL v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[VUIDownloadButton viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[VUIDownloadButtonViewModel shouldShowExpiredImageWithDownloadState:isExpired:isExpiringSoon:hasFailed:](VUIDownloadButtonViewModel, "shouldShowExpiredImageWithDownloadState:isExpired:isExpiringSoon:hasFailed:", objc_msgSend(v6, "downloadState"), objc_msgSend(v6, "isExpired"), objc_msgSend(v6, "isExpiringSoon"), objc_msgSend(v6, "downloadFailedDueToError"));
  if (objc_msgSend(v6, "downloadState") != 4 || v7)
  {
    -[VUIButton imageView](self, "imageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "vui_sizeThatFits:", width, height);
    v9 = v13;
    v11 = v14;

  }
  else
  {
    -[VUIDownloadButton bounds](self, "bounds");
    v9 = v8 + 5.0;
    -[VUIDownloadButton bounds](self, "bounds");
    v11 = v10 + 5.0;
  }

  v15 = v9;
  v16 = v11;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)_setupDownloadButton
{
  UIImageSymbolConfiguration *v3;
  UIImageSymbolConfiguration *primarySymbolConfiguration;
  UIView *v5;
  UIView *backgroundView;
  void *v7;
  CAShapeLayer *v8;
  CAShapeLayer *backgroundMaskingLayer;
  CAShapeLayer *v10;
  CAShapeLayer *backdropMaskingLayer;
  uint64_t v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 7, 2, 16.0);
  v3 = (UIImageSymbolConfiguration *)objc_claimAutoreleasedReturnValue();
  primarySymbolConfiguration = self->_primarySymbolConfiguration;
  self->_primarySymbolConfiguration = v3;

  v5 = (UIView *)objc_opt_new();
  backgroundView = self->_backgroundView;
  self->_backgroundView = v5;

  -[VUIDownloadButton subviews](self, "subviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[VUIDownloadButton vui_insertSubview:belowSubview:oldView:](self, "vui_insertSubview:belowSubview:oldView:", self->_backgroundView, v13, 0);
  v8 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
  backgroundMaskingLayer = self->_backgroundMaskingLayer;
  self->_backgroundMaskingLayer = v8;

  v10 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
  backdropMaskingLayer = self->_backdropMaskingLayer;
  self->_backdropMaskingLayer = v10;

  v12 = *MEMORY[0x1E0CD2B70];
  -[CAShapeLayer setFillRule:](self->_backgroundMaskingLayer, "setFillRule:", *MEMORY[0x1E0CD2B70]);
  -[CAShapeLayer setFillRule:](self->_backdropMaskingLayer, "setFillRule:", v12);

}

- (void)_updateMaskForProgressLayer
{
  double v2;
  VUICircularProgress *progressIndicator;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  LODWORD(v2) = 1.0;
  -[CAShapeLayer setOpacity:](self->_backdropMaskingLayer, "setOpacity:", v2);
  progressIndicator = self->_progressIndicator;
  if (progressIndicator)
  {
    -[VUICircularProgress bounds](progressIndicator, "bounds");
    v6 = v5 * 0.5;
    -[VUICircularProgress vuiCenter](self->_progressIndicator, "vuiCenter");
    v8 = v7;
    v10 = v9;
    +[VUIBezierPath vui_bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](VUIBezierPath, "vui_bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (-[VUICircularProgress isIndeterminate](self->_progressIndicator, "isIndeterminate"))
    {
      +[VUIBezierPath vui_bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](VUIBezierPath, "vui_bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v8, v10, v6, -1.57079633, 4.71238898);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      VUIRoundValue();
      VUIRoundValue();
      +[VUIBezierPath vui_bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](VUIBezierPath, "vui_bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v8, v10, v12, -1.57079633, 4.71238898);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v13) = 0.75;
      -[CAShapeLayer setOpacity:](self->_backdropMaskingLayer, "setOpacity:", v13);
    }
    objc_msgSend(v18, "appendBezierPath:", v11);
    -[CAShapeLayer setPath:](self->_backgroundMaskingLayer, "setPath:", objc_msgSend(v18, "vuiCGPath"));
    -[CAShapeLayer setPath:](self->_backdropMaskingLayer, "setPath:", objc_msgSend(v18, "vuiCGPath"));
    -[VUIDownloadButton backgroundView](self, "backgroundView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMask:", self->_backgroundMaskingLayer);

    -[VUIButton backdropView](self, "backdropView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setMask:", self->_backdropMaskingLayer);

  }
}

- (void)_clearMasks
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[VUIDownloadButton backgroundView](self, "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMask:", 0);

  -[VUIButton backdropView](self, "backdropView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMask:", 0);

}

- (void)_layoutProgressIndicator
{
  void *v3;

  -[VUIDownloadButton progressIndicator](self, "progressIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadButton bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");

  -[VUIDownloadButton _updateMaskForProgressLayer](self, "_updateMaskForProgressLayer");
}

- (void)_setTitleWithProperties:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  if (objc_msgSend(v14, "hasTitle")
    && (objc_msgSend(v14, "title"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "length"),
        v4,
        v5))
  {
    -[VUIButton textContentView](self, "textContentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[VUIButton textContentView](self, "textContentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textLayout");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[VUIDownloadButton textLayout](self, "textLayout");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[VUIButton textContentView](self, "textContentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[VUIButton textContentView](self, "textContentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v11, v9, v12);
    }
    else
    {
      +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v11, v9, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIButton setTextContentView:](self, "setTextContentView:", v12);
    }

  }
  else
  {
    -[VUIButton setTextContentView:](self, "setTextContentView:", 0);
  }

}

- (void)_setImage:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    -[VUIButton setImageTrailsTextContent:](self, "setImageTrailsTextContent:", 0);
    -[VUIButton imageView](self, "imageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      objc_msgSend(v4, "setImage:", v6);
    }
    else
    {
      v5 = (void *)objc_opt_new();
      objc_msgSend(v5, "setImage:", v6);
      -[VUIButton setImageView:](self, "setImageView:", v5);
    }
    objc_msgSend(v5, "setVuiUserInteractionEnabled:", 0);
    -[VUIDownloadButton vui_setNeedsLayout](self, "vui_setNeedsLayout");

  }
  else
  {
    -[VUIButton setImageView:](self, "setImageView:", 0);
  }

}

- (id)_notDownloadedImage
{
  id v2;
  _QWORD v4[4];
  __CFString *v5;
  VUIDownloadButton *v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[2] = __40__VUIDownloadButton__notDownloadedImage__block_invoke;
  v4[3] = &unk_1E9F98FD8;
  v4[1] = 3221225472;
  v5 = CFSTR("arrow.down");
  v6 = self;
  if (_notDownloadedImage_onceToken != -1)
    dispatch_once(&_notDownloadedImage_onceToken, v4);
  v2 = (id)_notDownloadedImage_sNotDownloadedImage;

  return v2;
}

void __40__VUIDownloadButton__notDownloadedImage__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v1 = (void *)MEMORY[0x1E0DC3870];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 920);
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:", CFSTR("TV.Image.Not.Downloaded.VO"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vuiSystemImageNamed:withConfiguration:accessibilityDescription:", v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vuiTemplateImage");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)_notDownloadedImage_sNotDownloadedImage;
  _notDownloadedImage_sNotDownloadedImage = v6;

}

- (id)_connectingImage
{
  return 0;
}

- (id)_downloadingImage
{
  return 0;
}

- (id)_downloadedImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__VUIDownloadButton__downloadedImage__block_invoke;
  block[3] = &unk_1E9F98DF0;
  block[4] = self;
  if (_downloadedImage_onceToken != -1)
    dispatch_once(&_downloadedImage_onceToken, block);
  return (id)_downloadedImage_sDownloadedImage;
}

void __37__VUIDownloadButton__downloadedImage__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v1 = (void *)MEMORY[0x1E0DC3870];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 920);
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:", CFSTR("TV.Image.Downloaded.VO"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vuiSystemImageNamed:withConfiguration:accessibilityDescription:", CFSTR("arrow.down.circle.fill"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vuiTemplateImage");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_downloadedImage_sDownloadedImage;
  _downloadedImage_sDownloadedImage = v5;

}

- (id)_pausedImage
{
  return 0;
}

- (id)_expiredDownloadImage
{
  id v2;
  _QWORD v4[4];
  __CFString *v5;
  VUIDownloadButton *v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[2] = __42__VUIDownloadButton__expiredDownloadImage__block_invoke;
  v4[3] = &unk_1E9F98FD8;
  v4[1] = 3221225472;
  v5 = CFSTR("exclamationmark");
  v6 = self;
  if (_expiredDownloadImage_onceToken != -1)
    dispatch_once(&_expiredDownloadImage_onceToken, v4);
  v2 = (id)_expiredDownloadImage_sExpiredImage;

  return v2;
}

void __42__VUIDownloadButton__expiredDownloadImage__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v1 = (void *)MEMORY[0x1E0DC3870];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 920);
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:", CFSTR("TV.Image.Download.Expired.VO"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vuiSystemImageNamed:withConfiguration:accessibilityDescription:", v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vuiTemplateImage");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)_expiredDownloadImage_sExpiredImage;
  _expiredDownloadImage_sExpiredImage = v6;

}

- (id)_imageForDownloadState:(unint64_t)a3 isExpired:(BOOL)a4 isExpiringSoon:(BOOL)a5 hasFailed:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  switch(a3)
  {
    case 0uLL:
    case 3uLL:
      -[VUIDownloadButton _notDownloadedImage](self, "_notDownloadedImage");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1uLL:
      -[VUIDownloadButton _connectingImage](self, "_connectingImage");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2uLL:
      -[VUIDownloadButton _downloadingImage](self, "_downloadingImage");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 4uLL:
      -[VUIDownloadButton _downloadedImage](self, "_downloadedImage");
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v12 = (void *)v11;
      break;
    default:
      v12 = 0;
      break;
  }
  if (+[VUIDownloadButtonViewModel shouldShowExpiredImageWithDownloadState:isExpired:isExpiringSoon:hasFailed:](VUIDownloadButtonViewModel, "shouldShowExpiredImageWithDownloadState:isExpired:isExpiringSoon:hasFailed:", a3, v8, v7, v6))
  {
    -[VUIDownloadButton _expiredDownloadImage](self, "_expiredDownloadImage");
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }
  return v12;
}

- (void)_updateButtonToState:(unint64_t)a3 oldState:(unint64_t)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD);

  if (a3 == a4)
  {
    if (a3 - 1 < 2)
      goto LABEL_7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("VUIUnifiedMessagingRegistryActiveButtonsDidChange"), self);

    if (a3 - 1 <= 1)
    {
      -[VUIDownloadButton _updateButtonToState:isExpired:isExpiringSoon:hasFailed:](self, "_updateButtonToState:isExpired:isExpiringSoon:hasFailed:", a3, 0, 0, 0);
      goto LABEL_9;
    }
  }
  -[VUIDownloadButton viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isExpired");
  -[VUIDownloadButton viewModel](self, "viewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isExpiringSoon");
  -[VUIDownloadButton viewModel](self, "viewModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadButton _updateButtonToState:isExpired:isExpiringSoon:hasFailed:](self, "_updateButtonToState:isExpired:isExpiringSoon:hasFailed:", a3, v9, v11, objc_msgSend(v12, "downloadFailedDueToError"));

  if (a3 == a4)
  {
LABEL_7:
    if (!-[VUIDownloadButton wasDeleted](self, "wasDeleted") && !-[VUIDownloadButton wasCanceled](self, "wasCanceled"))
      return;
  }
LABEL_9:
  -[VUIDownloadButton downloadStateChangeHandler](self, "downloadStateChangeHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[VUIDownloadButton downloadStateChangeHandler](self, "downloadStateChangeHandler");
    v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, unint64_t, BOOL, BOOL))v14)[2](v14, a3, -[VUIDownloadButton wasDeleted](self, "wasDeleted"), -[VUIDownloadButton wasCanceled](self, "wasCanceled"));

  }
  -[VUIDownloadButton setWasDeleted:](self, "setWasDeleted:", 0);
  -[VUIDownloadButton setWasCanceled:](self, "setWasCanceled:", 0);
}

- (void)_updateButtonToState:(unint64_t)a3 isExpired:(BOOL)a4 isExpiringSoon:(BOOL)a5 hasFailed:(BOOL)a6
{
  id v8;

  -[VUIDownloadButton _buttonPropertiesForState:isExpired:isExpiringSoon:hasFailed:](self, "_buttonPropertiesForState:isExpired:isExpiringSoon:hasFailed:", a3, a4, a5, a6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIButton setEnabled:](self, "setEnabled:", objc_msgSend(v8, "isEnabled"));
  switch(a3)
  {
    case 0uLL:
    case 3uLL:
      -[VUIDownloadButton _updateButtonToNotDownloadedWithProperties:](self, "_updateButtonToNotDownloadedWithProperties:", v8);
      break;
    case 1uLL:
      -[VUIDownloadButton _updateButtonToConnectingWithProperties:](self, "_updateButtonToConnectingWithProperties:", v8);
      break;
    case 2uLL:
      -[VUIDownloadButton _updateButtonToDownloadingWithProperties:](self, "_updateButtonToDownloadingWithProperties:", v8);
      break;
    case 4uLL:
      -[VUIDownloadButton _updateButtonToDownloadedWithProperties:](self, "_updateButtonToDownloadedWithProperties:", v8);
      break;
    default:
      break;
  }
  -[VUIDownloadButton _updateImageViewTintColorWithDownloadState:](self, "_updateImageViewTintColorWithDownloadState:", a3);
  -[VUIDownloadButton vui_setNeedsLayout](self, "vui_setNeedsLayout");

}

- (void)_updateButtonToNotDownloadedWithProperties:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "hasImage"))
  {
    objc_msgSend(v7, "image");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIDownloadButton _setImage:](self, "_setImage:", v4);

  }
  -[VUIDownloadButton _clearMasks](self, "_clearMasks");
  -[VUIDownloadButton _setTitleWithProperties:](self, "_setTitleWithProperties:", v7);
  -[VUIDownloadButton progressIndicator](self, "progressIndicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vui_removeFromSuperView");

  -[VUIDownloadButton setProgressIndicator:](self, "setProgressIndicator:", 0);
  -[VUIDownloadButton viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadButton _stopObservingDownloadProgress:](self, "_stopObservingDownloadProgress:", v6);

}

- (void)_updateButtonToConnectingWithProperties:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  v16 = a3;
  -[VUIDownloadButton _setTitleWithProperties:](self, "_setTitleWithProperties:");
  -[VUIDownloadButton progressIndicator](self, "progressIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[VUIButton imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[VUIButton imageView](self, "imageView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "frame");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;

    }
    else
    {
      v12 = 28.0;
      v10 = 0.0;
      v14 = 28.0;
      v8 = 0.0;
    }
    -[VUIDownloadButton _insertProgressIndicatorWithFrame:](self, "_insertProgressIndicatorWithFrame:", v8, v10, v12, v14);
  }
  objc_msgSend(v16, "image");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadButton _setImage:](self, "_setImage:", v15);

  -[VUIDownloadButton _configureProgressIndicatorWithProperties:](self, "_configureProgressIndicatorWithProperties:", v16);
}

- (void)_updateButtonToDownloadingWithProperties:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  v16 = a3;
  -[VUIDownloadButton _setTitleWithProperties:](self, "_setTitleWithProperties:");
  -[VUIDownloadButton progressIndicator](self, "progressIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[VUIButton imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[VUIButton imageView](self, "imageView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "frame");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;

    }
    else
    {
      v12 = 28.0;
      v10 = 0.0;
      v14 = 28.0;
      v8 = 0.0;
    }
    -[VUIDownloadButton _insertProgressIndicatorWithFrame:](self, "_insertProgressIndicatorWithFrame:", v8, v10, v12, v14);
  }
  -[VUIDownloadButton _configureProgressIndicatorWithProperties:](self, "_configureProgressIndicatorWithProperties:", v16);
  -[VUIDownloadButton viewModel](self, "viewModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadButton _startObservingDownloadProgress:](self, "_startObservingDownloadProgress:", v15);

  -[VUIDownloadButton _setImage:](self, "_setImage:", 0);
}

- (void)_updateButtonToDownloadedWithProperties:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[VUIDownloadButton _setTitleWithProperties:](self, "_setTitleWithProperties:", v13);
  if ((objc_msgSend(v13, "hasTitle") & 1) == 0
    && -[VUIDownloadButton showsTextInDownloadedState](self, "showsTextInDownloadedState"))
  {
    -[VUIButton textContentView](self, "textContentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[VUIButton textContentView](self, "textContentView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "textLayout");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[VUIDownloadButton textLayout](self, "textLayout");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v13, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v8, v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIButton setTextContentView:](self, "setTextContentView:", v9);

  }
  if (objc_msgSend(v13, "hasImage"))
  {
    objc_msgSend(v13, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIDownloadButton _setImage:](self, "_setImage:", v10);

  }
  -[VUIDownloadButton progressIndicator](self, "progressIndicator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "vui_removeFromSuperView");

  -[VUIDownloadButton setProgressIndicator:](self, "setProgressIndicator:", 0);
  -[VUIDownloadButton viewModel](self, "viewModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadButton _stopObservingDownloadProgress:](self, "_stopObservingDownloadProgress:", v12);

}

- (void)_updateImageViewTintColorWithDownloadState:(unint64_t)a3
{
  void *v4;
  id v5;

  -[VUIButton imageView](self, "imageView", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIButton imageTintColor](self, "imageTintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setTintColor:", v4);

}

- (void)_updateDownloadProgress:(double)a3 animated:(BOOL)a4
{
  void *v6;
  id v7;

  -[VUIDownloadButton progressIndicator](self, "progressIndicator", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[VUIDownloadButton progressIndicator](self, "progressIndicator");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProgress:", a3);

  }
}

- (id)_buttonPropertiesForState:(unint64_t)a3 isExpired:(BOOL)a4 isExpiringSoon:(BOOL)a5 hasFailed:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  uint64_t v23;
  void *v24;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v11 = (void *)objc_opt_new();
  v12 = -[VUIButton buttonType](self, "buttonType") != 8 && -[VUIButton buttonType](self, "buttonType") != 6;
  objc_msgSend(v11, "setHasTitle:", v12);
  -[VUIDownloadButton _imageForDownloadState:isExpired:isExpiringSoon:hasFailed:](self, "_imageForDownloadState:isExpired:isExpiringSoon:hasFailed:", a3, v8, v7, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImage:", v13);

  objc_msgSend(v11, "setHasImage:", 1);
  objc_msgSend(v11, "setDownloadState:", a3);
  -[VUIDownloadButton viewModel](self, "viewModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "downloadProgress");
  objc_msgSend(v11, "setProgress:");

  objc_msgSend(v11, "setEnabled:", 1);
  switch(a3)
  {
    case 0uLL:
    case 3uLL:
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v8)
        v17 = CFSTR("RENEW");
      else
        v17 = CFSTR("BUTTON_DOWNLOAD");
      objc_msgSend(v15, "localizedStringForKey:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTitle:", v18);

      goto LABEL_14;
    case 1uLL:
      objc_msgSend(v11, "setHasBorder:", 0);
      objc_msgSend(v11, "setHasImage:", 0);
      objc_msgSend(v11, "setHasTitle:", 0);
      v22 = v11;
      v23 = 1;
      goto LABEL_15;
    case 2uLL:
      objc_msgSend(v11, "setHasBorder:", 1);
      objc_msgSend(v11, "setHasImage:", 0);
      objc_msgSend(v11, "setHasTitle:", 0);
LABEL_14:
      v22 = v11;
      v23 = 0;
LABEL_15:
      objc_msgSend(v22, "setIndeterminate:", v23);
      break;
    case 4uLL:
      objc_msgSend(v11, "setIndeterminate:", 0);
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v8)
        v21 = CFSTR("RENEW");
      else
        v21 = CFSTR("BUTTON_DOWNLOADED");
      objc_msgSend(v19, "localizedStringForKey:", v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTitle:", v24);

      break;
    default:
      objc_msgSend(v11, "setHasTitle:", 0);
      break;
  }
  return v11;
}

- (void)_insertProgressIndicatorWithFrame:(CGRect)a3
{
  void *v4;
  VUICircularProgress *v5;

  if (!self->_progressIndicator)
  {
    v5 = -[VUICircularProgress initWithFrame:]([VUICircularProgress alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUICircularProgress setVuiBackgroundColor:](v5, "setVuiBackgroundColor:", v4);

    -[VUICircularProgress setProgressBgHidden:](v5, "setProgressBgHidden:", 1);
    VUIRoundValue();
    -[VUICircularProgress setProgressWidth:](v5, "setProgressWidth:");
    VUIRoundValue();
    -[VUICircularProgress setIndeterminateWidth:](v5, "setIndeterminateWidth:");
    -[VUICircularProgress setCenterSquareWidth:](v5, "setCenterSquareWidth:", 7.0);
    -[VUICircularProgress setCenterSquareCornerRadius:](v5, "setCenterSquareCornerRadius:", 1.5);
    -[VUICircularProgress setVuiClipsToBounds:](v5, "setVuiClipsToBounds:", 0);
    -[VUIDownloadButton vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5, 0);
    -[VUIDownloadButton setProgressIndicator:](self, "setProgressIndicator:", v5);

  }
}

- (void)_configureProgressIndicatorWithProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;

  v4 = a3;
  -[VUIDownloadButton progressIndicator](self, "progressIndicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vuiLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllAnimations");

  -[VUIDownloadButton progressIndicator](self, "progressIndicator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setVuiUserInteractionEnabled:", 0);

  -[VUIButton imageTintColor](self, "imageTintColor");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyColor");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (id)v8;
  -[VUIDownloadButton saturatedTintColor](self, "saturatedTintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[VUIDownloadButton saturatedTintColor](self, "saturatedTintColor");
    v10 = objc_claimAutoreleasedReturnValue();

    v18 = (id)v10;
  }
  -[VUIDownloadButton progressIndicator](self, "progressIndicator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setVuiTintColor:", v18);

  -[VUIDownloadButton progressIndicator](self, "progressIndicator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setProgressFillColor:", v18);

  objc_msgSend(v18, "colorWithAlphaComponent:", 0.2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadButton progressIndicator](self, "progressIndicator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setProgressBgColor:", v13);

  -[VUIDownloadButton progressIndicator](self, "progressIndicator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "progress");
  objc_msgSend(v15, "setProgress:");

  -[VUIDownloadButton progressIndicator](self, "progressIndicator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v4, "isInderminate");

  objc_msgSend(v16, "setIndeterminate:", v17);
}

- (void)_startObservingViewModel:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = __ViewModelDownloadStateContext;
  v5 = a3;
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("downloadState"), 3, v4);
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("downloadExpirationDate"), 3, __ViewModelDownloadExpirationDateContext);

}

- (void)_stopObservingViewModel:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = __ViewModelDownloadStateContext;
  v5 = a3;
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("downloadState"), v4);
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("downloadExpirationDate"), __ViewModelDownloadExpirationDateContext);

}

- (void)_startObservingDownloadProgress:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[VUIDownloadButton observingDownloadProgress](self, "observingDownloadProgress"))
  {
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("downloadProgress"), 5, __ViewModelDownloadProgressContext);
    -[VUIDownloadButton setObservingDownloadProgress:](self, "setObservingDownloadProgress:", 1);
  }

}

- (void)_stopObservingDownloadProgress:(id)a3
{
  id v4;

  v4 = a3;
  if (-[VUIDownloadButton observingDownloadProgress](self, "observingDownloadProgress"))
  {
    -[VUIDownloadButton setObservingDownloadProgress:](self, "setObservingDownloadProgress:", 0);
    objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("downloadProgress"), __ViewModelDownloadProgressContext);
  }

}

- (BOOL)showsTextInDownloadedState
{
  return self->_showsTextInDownloadedState;
}

- (BOOL)usesDefaultConfiguration
{
  return self->_usesDefaultConfiguration;
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (id)downloadStateChangeHandler
{
  return self->_downloadStateChangeHandler;
}

- (void)setDownloadStateChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 848);
}

- (UIImage)notDownloadedImage
{
  return self->_notDownloadedImage;
}

- (void)setNotDownloadedImage:(id)a3
{
  objc_storeStrong((id *)&self->_notDownloadedImage, a3);
}

- (UIImage)connectingImage
{
  return self->_connectingImage;
}

- (void)setConnectingImage:(id)a3
{
  objc_storeStrong((id *)&self->_connectingImage, a3);
}

- (UIImage)downloadingImage
{
  return self->_downloadingImage;
}

- (void)setDownloadingImage:(id)a3
{
  objc_storeStrong((id *)&self->_downloadingImage, a3);
}

- (UIImage)downloadedImage
{
  return self->_downloadedImage;
}

- (void)setDownloadedImage:(id)a3
{
  objc_storeStrong((id *)&self->_downloadedImage, a3);
}

- (UIImage)expiredDownloadImage
{
  return self->_expiredDownloadImage;
}

- (void)setExpiredDownloadImage:(id)a3
{
  objc_storeStrong((id *)&self->_expiredDownloadImage, a3);
}

- (VUIDownloadButtonViewModel)viewModel
{
  return self->_viewModel;
}

- (VUICircularProgress)progressIndicator
{
  return self->_progressIndicator;
}

- (void)setProgressIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_progressIndicator, a3);
}

- (BOOL)observingDownloadProgress
{
  return self->_observingDownloadProgress;
}

- (void)setObservingDownloadProgress:(BOOL)a3
{
  self->_observingDownloadProgress = a3;
}

- (BOOL)wasDeleted
{
  return self->_wasDeleted;
}

- (void)setWasDeleted:(BOOL)a3
{
  self->_wasDeleted = a3;
}

- (BOOL)wasCanceled
{
  return self->_wasCanceled;
}

- (void)setWasCanceled:(BOOL)a3
{
  self->_wasCanceled = a3;
}

- (BOOL)isForLibrary
{
  return self->_isForLibrary;
}

- (void)setIsForLibrary:(BOOL)a3
{
  self->_isForLibrary = a3;
}

- (VUITextLayout)textLayout
{
  return self->_textLayout;
}

- (void)setTextLayout:(id)a3
{
  objc_storeStrong((id *)&self->_textLayout, a3);
}

- (UIImageSymbolConfiguration)primarySymbolConfiguration
{
  return self->_primarySymbolConfiguration;
}

- (void)setPrimarySymbolConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_primarySymbolConfiguration, a3);
}

- (VUIDownloadButtonActionHandler)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_storeStrong((id *)&self->_actionHandler, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIColor)keyBackgroundColor
{
  return self->_keyBackgroundColor;
}

- (void)setKeyBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_keyBackgroundColor, a3);
}

- (UIColor)saturatedTintColor
{
  return self->_saturatedTintColor;
}

- (void)setSaturatedTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_saturatedTintColor, a3);
}

- (CAShapeLayer)backgroundMaskingLayer
{
  return self->_backgroundMaskingLayer;
}

- (void)setBackgroundMaskingLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundMaskingLayer, a3);
}

- (CAShapeLayer)backdropMaskingLayer
{
  return self->_backdropMaskingLayer;
}

- (void)setBackdropMaskingLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backdropMaskingLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropMaskingLayer, 0);
  objc_storeStrong((id *)&self->_backgroundMaskingLayer, 0);
  objc_storeStrong((id *)&self->_saturatedTintColor, 0);
  objc_storeStrong((id *)&self->_keyBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_primarySymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_textLayout, 0);
  objc_storeStrong((id *)&self->_progressIndicator, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_expiredDownloadImage, 0);
  objc_storeStrong((id *)&self->_downloadedImage, 0);
  objc_storeStrong((id *)&self->_downloadingImage, 0);
  objc_storeStrong((id *)&self->_connectingImage, 0);
  objc_storeStrong((id *)&self->_notDownloadedImage, 0);
  objc_storeStrong(&self->_downloadStateChangeHandler, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
}

@end
