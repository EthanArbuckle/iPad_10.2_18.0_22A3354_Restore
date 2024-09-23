@implementation MFProgressToolbar

- (void)showProgress:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  id v8;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFProgressToolbar progressView](self, "progressView"));
  v8 = v5;
  if (v3)
  {
    objc_msgSend(v5, "setAlpha:", 1.0);
  }
  else
  {
    objc_msgSend(v5, "setAlpha:", 0.0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFProgressToolbar progressView](self, "progressView"));
    LODWORD(v7) = 0;
    v8 = v6;
    objc_msgSend(v6, "setProgress:", v7);
  }

}

- (UIProgressView)progressView
{
  return self->_progressView;
}

- (void)setItems:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  uint64_t v13;
  char isKindOfClass;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];

  v4 = a4;
  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MFProgressToolbar;
  -[MFProgressToolbar setItems:animated:](&v20, "setItems:animated:", v6, v4);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view", (_QWORD)v16));
        v13 = objc_opt_class(MailStatusBarView);
        isKindOfClass = objc_opt_isKindOfClass(v12, v13);

        if ((isKindOfClass & 1) != 0)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
          objc_msgSend(v15, "setToolbarView:", self);

        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v8);
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MFProgressToolbar;
  -[MFProgressToolbar layoutSubviews](&v12, "layoutSubviews");
  -[MFProgressToolbar bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFProgressToolbar progressView](self, "progressView"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (MFProgressToolbar)initWithFrame:(CGRect)a3
{
  MFProgressToolbar *v3;
  UIProgressView *v4;
  UIProgressView *progressView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFProgressToolbar;
  v3 = -[MFProgressToolbar initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIProgressView *)objc_msgSend(objc_alloc((Class)UIProgressView), "initWithProgressViewStyle:", 1);
    progressView = v3->_progressView;
    v3->_progressView = v4;

    -[UIProgressView setAutoresizingMask:](v3->_progressView, "setAutoresizingMask:", 2);
    -[MFProgressToolbar addSubview:](v3, "addSubview:", v3->_progressView);
  }
  return v3;
}

- (void)updateProgress:(float)a3
{
  double v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MFProgressToolbar progressView](self, "progressView"));
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setProgress:", v4);

}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_progressView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressView, 0);
}

@end
