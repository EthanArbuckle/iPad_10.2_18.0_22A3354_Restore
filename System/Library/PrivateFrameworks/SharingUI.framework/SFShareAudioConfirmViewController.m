@implementation SFShareAudioConfirmViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  MTMaterialView *v7;
  MTMaterialView *confirmButtonMaterialView;
  void *v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[6];
  objc_super v16;

  v3 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v16.receiver = self;
  v16.super_class = (Class)SFShareAudioConfirmViewController;
  -[SFShareAudioBaseViewController viewWillAppear:](&v16, sel_viewWillAppear_, v3);
  if (self->_productID)
  {
    SFLocalizedNameForBluetoothProductID();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->super._titleLabel, "setText:", v5);
  }
  else
  {
    -[SFShareAudioViewController mainBundle](self->super._mainController, "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    SFLocalizedStringEx();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->super._titleLabel, "setText:", v6);

  }
  if (!self->_confirmButtonMaterialView)
  {
    -[objc_class materialViewWithRecipe:configuration:](getMTMaterialViewClass(), "materialViewWithRecipe:configuration:", 4, 4);
    v7 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
    confirmButtonMaterialView = self->_confirmButtonMaterialView;
    self->_confirmButtonMaterialView = v7;

    -[UIButton bounds](self->_confirmButton, "bounds");
    -[MTMaterialView setFrame:](self->_confirmButtonMaterialView, "setFrame:");
    -[MTMaterialView setAutoresizingMask:](self->_confirmButtonMaterialView, "setAutoresizingMask:", 18);
    -[UIButton layer](self->_confirmButton, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cornerRadius");
    v11 = v10;
    -[MTMaterialView layer](self->_confirmButtonMaterialView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCornerRadius:", v11);

    -[UIButton addSubview:](self->_confirmButton, "addSubview:", self->_confirmButtonMaterialView);
  }
  if (self->_productID)
  {
    if (gLogCategory_SFShareAudioViewController <= 30
      && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v13 = objc_alloc_init(MEMORY[0x24BE900F0]);
    objc_msgSend(v13, "setBluetoothProductID:", LOWORD(self->_productID));
    objc_msgSend(v13, "setColorCode:", self->_colorCode);
    objc_msgSend(v13, "setTimeoutSeconds:", 5.0);
    v14 = objc_alloc_init(MEMORY[0x24BE900E8]);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __52__SFShareAudioConfirmViewController_viewWillAppear___block_invoke;
    v15[3] = &unk_24CE0FEA0;
    v15[4] = v14;
    v15[5] = self;
    objc_msgSend(v14, "getDeviceAssets:completion:", v13, v15);

  }
  else
  {
    -[SFShareAudioConfirmViewController _updateDeviceVisual:](self, "_updateDeviceVisual:", 0);
  }
}

void __52__SFShareAudioConfirmViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  _BYTE *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v3 = *(_BYTE **)(a1 + 40);
  if (v3[992])
  {
    objc_msgSend(v5, "assetBundlePath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_updateDeviceVisual:", v4);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)SFShareAudioConfirmViewController;
  -[SFShareAudioBaseViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFShareAudioConfirmViewController;
  -[SFShareAudioConfirmViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[SFMediaPlayerView stop](self->_productMovieView, "stop");
}

- (void)eventConfirm:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[SFShareAudioViewController shareAudioSession](self->super._mainController, "shareAudioSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userConfirmed");

}

- (void)eventCancel:(id)a3
{
  id v4;

  v4 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[SFShareAudioViewController reportUserCancelled](self->super._mainController, "reportUserCancelled");

}

- (void)_updateDeviceVisual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v12 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v5, "pathForResource:ofType:", *MEMORY[0x24BE90258], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    || (objc_msgSend(v5, "pathForResource:ofType:", *MEMORY[0x24BE90268], 0),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (objc_msgSend(v5, "pathForResource:ofType:", *MEMORY[0x24BE90270], 0),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v5, "URLForResource:withExtension:", *MEMORY[0x24BE90240], 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_SFShareAudioViewController <= 30
      && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
    {
      v11 = v6;
      LogPrintF();
    }
    -[SFMediaPlayerView startMovieLoopWithPath:assetType:adjustmentsURL:](self->_productMovieView, "startMovieLoopWithPath:assetType:adjustmentsURL:", v6, 1, v7, v11, v12);
    -[SFMediaPlayerView setHidden:](self->_productMovieView, "setHidden:", 0);

  }
  else
  {
    if (gLogCategory_SFShareAudioViewController <= 30
      && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v8 = (void *)MEMORY[0x24BEBD640];
    -[SFShareAudioViewController mainBundle](self->super._mainController, "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("ShareAudioAirPods"), v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_shareImageView, "setImage:", v10);

    -[UIImageView setHidden:](self->_shareImageView, "setHidden:", 0);
  }

}

- (UIImageView)productImageView
{
  return self->_productImageView;
}

- (void)setProductImageView:(id)a3
{
  objc_storeStrong((id *)&self->_productImageView, a3);
}

- (SFMediaPlayerView)productMovieView
{
  return self->_productMovieView;
}

- (void)setProductMovieView:(id)a3
{
  objc_storeStrong((id *)&self->_productMovieView, a3);
}

- (UIButton)confirmButton
{
  return self->_confirmButton;
}

- (void)setConfirmButton:(id)a3
{
  objc_storeStrong((id *)&self->_confirmButton, a3);
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (UIImageView)shareImageView
{
  return self->_shareImageView;
}

- (void)setShareImageView:(id)a3
{
  objc_storeStrong((id *)&self->_shareImageView, a3);
}

- (unsigned)colorCode
{
  return self->_colorCode;
}

- (void)setColorCode:(unsigned int)a3
{
  self->_colorCode = a3;
}

- (unsigned)productID
{
  return self->_productID;
}

- (void)setProductID:(unsigned int)a3
{
  self->_productID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareImageView, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);
  objc_storeStrong((id *)&self->_productMovieView, 0);
  objc_storeStrong((id *)&self->_productImageView, 0);
  objc_storeStrong((id *)&self->_confirmButtonMaterialView, 0);
}

@end
