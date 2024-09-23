@implementation SFShareAudioConnectingViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v7.receiver = self;
  v7.super_class = (Class)SFShareAudioConnectingViewController;
  -[SFShareAudioBaseViewController viewWillAppear:](&v7, sel_viewWillAppear_, v3);
  -[SFShareAudioConnectingViewController _updateForDeviceInfo](self, "_updateForDeviceInfo");
  -[SFShareAudioViewController mainBundle](self->super._mainController, "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView startAnimating](self->_progressView, "startAnimating");
  SFLocalizedStringEx();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityIndicatorView setText:](self->_progressActivity, "setText:", v6);

  -[UILabel setHidden:](self->_progressLabel, "setHidden:", 1);
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
  v5.super_class = (Class)SFShareAudioConnectingViewController;
  -[SFShareAudioBaseViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
  -[SFShareAudioViewController setVcConnecting:](self->super._mainController, "setVcConnecting:", 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFShareAudioConnectingViewController;
  -[SFShareAudioConnectingViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[UIImageView stop](self->_productImageView, "stop");
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

- (void)sessionProgressEvent:(int)a3 info:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  if (a3 == 300 || a3 == 220 || a3 == 200)
  {
    v9 = v6;
    -[SFShareAudioConnectingViewController _updateForDeviceInfo](self, "_updateForDeviceInfo");
    -[SFShareAudioViewController mainBundle](self->super._mainController, "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SFLocalizedStringEx();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView setText:](self->_progressActivity, "setText:", v8);

    v6 = v9;
  }

}

- (void)_updateForDeviceInfo
{
  void *v3;
  void *v4;
  unsigned int colorCode;
  id v6;
  id v7;
  _QWORD v8[6];

  -[SFShareAudioViewController mainBundle](self->super._mainController, "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_colorCode)
    SFLocalizedNameForBluetoothProductID();
  else
    SFLocalizedStringEx();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->super._titleLabel, "setText:", v4);

  colorCode = self->_colorCode;
  if (colorCode)
  {
    if (colorCode != *((_DWORD *)&self->super._viewActive + 1))
    {
      *((_DWORD *)&self->super._viewActive + 1) = colorCode;
      if (gLogCategory_SFShareAudioViewController <= 30
        && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v6 = objc_alloc_init(MEMORY[0x24BE900F0]);
      objc_msgSend(v6, "setBluetoothProductID:", LOWORD(self->_colorCode));
      objc_msgSend(v6, "setColorCode:", self->_productIDActive);
      objc_msgSend(v6, "setTimeoutSeconds:", 5.0);
      v7 = objc_alloc_init(MEMORY[0x24BE900E8]);
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __60__SFShareAudioConnectingViewController__updateForDeviceInfo__block_invoke;
      v8[3] = &unk_24CE0FEA0;
      v8[4] = v7;
      v8[5] = self;
      objc_msgSend(v7, "getDeviceAssets:completion:", v6, v8);

    }
  }
  else
  {
    -[SFShareAudioConnectingViewController _updateDeviceVisual:](self, "_updateDeviceVisual:", 0);
  }

}

void __60__SFShareAudioConnectingViewController__updateForDeviceInfo__block_invoke(uint64_t a1, void *a2)
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
    -[UIImageView startMovieLoopWithPath:assetType:adjustmentsURL:](self->_productImageView, "startMovieLoopWithPath:assetType:adjustmentsURL:", v6, 1, v7, v11, v12);
    -[UIImageView setHidden:](self->_productImageView, "setHidden:", 0);
    objc_msgSend(*(id *)&self->_productID, "setHidden:", 1);
    -[SFMediaPlayerView setHidden:](self->_productMovieView, "setHidden:", 1);

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
    -[SFMediaPlayerView setImage:](self->_productMovieView, "setImage:", v10);

    -[SFMediaPlayerView setHidden:](self->_productMovieView, "setHidden:", 0);
    objc_msgSend(*(id *)&self->_productID, "setHidden:", 1);
    -[UIImageView setHidden:](self->_productImageView, "setHidden:", 1);
  }

}

- (UIImageView)productImageView
{
  return *(UIImageView **)&self->_productID;
}

- (void)setProductImageView:(id)a3
{
  objc_storeStrong((id *)&self->_productID, a3);
}

- (SFMediaPlayerView)productMovieView
{
  return (SFMediaPlayerView *)self->_productImageView;
}

- (void)setProductMovieView:(id)a3
{
  objc_storeStrong((id *)&self->_productImageView, a3);
}

- (UIImageView)shareImageView
{
  return (UIImageView *)self->_productMovieView;
}

- (void)setShareImageView:(id)a3
{
  objc_storeStrong((id *)&self->_productMovieView, a3);
}

- (UIView)progressView
{
  return &self->_shareImageView->super;
}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_shareImageView, a3);
}

- (UIActivityIndicatorView)progressActivity
{
  return (UIActivityIndicatorView *)self->_progressView;
}

- (void)setProgressActivity:(id)a3
{
  objc_storeStrong((id *)&self->_progressView, a3);
}

- (UILabel)progressLabel
{
  return (UILabel *)self->_progressActivity;
}

- (void)setProgressLabel:(id)a3
{
  objc_storeStrong((id *)&self->_progressActivity, a3);
}

- (UIButton)cancelButton
{
  return (UIButton *)self->_progressLabel;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_progressLabel, a3);
}

- (unsigned)colorCode
{
  return self->_productIDActive;
}

- (void)setColorCode:(unsigned int)a3
{
  self->_productIDActive = a3;
}

- (unsigned)productID
{
  return self->_colorCode;
}

- (void)setProductID:(unsigned int)a3
{
  self->_colorCode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressLabel, 0);
  objc_storeStrong((id *)&self->_progressActivity, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_shareImageView, 0);
  objc_storeStrong((id *)&self->_productMovieView, 0);
  objc_storeStrong((id *)&self->_productImageView, 0);
  objc_storeStrong((id *)&self->_productID, 0);
}

@end
