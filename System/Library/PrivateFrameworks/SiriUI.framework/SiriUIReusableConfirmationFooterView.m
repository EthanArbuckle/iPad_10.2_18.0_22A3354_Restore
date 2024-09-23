@implementation SiriUIReusableConfirmationFooterView

- (SiriUIReusableConfirmationFooterView)initWithFrame:(CGRect)a3
{
  SiriUIReusableConfirmationFooterView *v3;
  uint64_t v4;
  SiriUIContentButton *cancelButton;
  uint64_t v6;
  SiriUIContentButton *confirmButton;
  SiriUIProgressBarView *v8;
  uint64_t v9;
  SiriUIProgressBarView *progressBarView;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SiriUIReusableConfirmationFooterView;
  v3 = -[SiriUIReusableConfirmationFooterView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[SiriUIContentButton buttonWithRole:](SiriUIContentButton, "buttonWithRole:", 0);
    v4 = objc_claimAutoreleasedReturnValue();
    cancelButton = v3->_cancelButton;
    v3->_cancelButton = (SiriUIContentButton *)v4;

    -[SiriUIContentButton _setContinuousCornerRadius:](v3->_cancelButton, "_setContinuousCornerRadius:", 9.0);
    -[SiriUIReusableConfirmationFooterView addSubview:](v3, "addSubview:", v3->_cancelButton);
    +[SiriUIContentButton buttonWithRole:](SiriUIContentButton, "buttonWithRole:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    confirmButton = v3->_confirmButton;
    v3->_confirmButton = (SiriUIContentButton *)v6;

    -[SiriUIContentButton _setContinuousCornerRadius:](v3->_confirmButton, "_setContinuousCornerRadius:", 9.0);
    -[SiriUIReusableConfirmationFooterView addSubview:](v3, "addSubview:", v3->_confirmButton);
    v8 = [SiriUIProgressBarView alloc];
    v9 = -[SiriUIProgressBarView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    progressBarView = v3->_progressBarView;
    v3->_progressBarView = (SiriUIProgressBarView *)v9;

    -[SiriUIProgressBarView setUserInteractionEnabled:](v3->_progressBarView, "setUserInteractionEnabled:", 0);
    -[SiriUIReusableConfirmationFooterView addSubview:](v3, "addSubview:", v3->_progressBarView);
    v3->_automaticConfirmationThreshold = 0.0;
    -[SiriUIReusableConfirmationFooterView setClipsToBounds:](v3, "setClipsToBounds:", 1);
  }
  return v3;
}

+ (double)defaultHeight
{
  float v2;
  float v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(MEMORY[0x24BDF6A70], "siriui_preferredDynamicBodySize");
  v3 = v2 + -18.0;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v5 = ceil(v3 + 76.0);
  if (v6 >= 2.0)
    v7 = v3 + 76.0;
  else
    v7 = v5;

  return v7;
}

- (double)defaultAmbientHeight
{
  float v2;
  float v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(MEMORY[0x24BDF6A70], "siriui_preferredDynamicBodySize");
  v3 = v2 + -18.0;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v5 = ceil(v3 + 66.0);
  if (v6 >= 2.0)
    v7 = v3 + 66.0;
  else
    v7 = v5;

  return v7;
}

- (void)setSnippetViewController:(id)a3
{
  id WeakRetained;
  void *v5;
  SiriUIContentButton *cancelButton;
  void *v7;
  SiriUIContentButton *confirmButton;
  void *v9;
  SiriUIKeyline *verticalKeyline;
  void *v11;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_snippetViewController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_snippetViewController, obj);
    cancelButton = self->_cancelButton;
    -[SiriUIReusableConfirmationFooterView snippetViewController](self, "snippetViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUIContentButton setUsePlatterStyle:](cancelButton, "setUsePlatterStyle:", objc_msgSend(v7, "usePlatterStyle"));

    confirmButton = self->_confirmButton;
    -[SiriUIReusableConfirmationFooterView snippetViewController](self, "snippetViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUIContentButton setUsePlatterStyle:](confirmButton, "setUsePlatterStyle:", objc_msgSend(v9, "usePlatterStyle"));

    verticalKeyline = self->_verticalKeyline;
    objc_msgSend(MEMORY[0x24BDF6950], "siriui_platterKeylineColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUIKeyline setCustomBackgroundColor:](verticalKeyline, "setCustomBackgroundColor:", v11);

    v5 = obj;
  }

}

- (void)setConfirmationOptions:(id)a3
{
  id v5;
  SiriUIContentButton *confirmButton;
  void *v7;
  SiriUIContentButton *cancelButton;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  id v22;
  void *v23;
  char v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  uint64_t v32;
  SiriUIReusableConfirmationFooterView *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_confirmationOptions, a3);
  confirmButton = self->_confirmButton;
  objc_msgSend(v5, "confirmText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUIContentButton setTitle:forState:](confirmButton, "setTitle:forState:", v7, 0);

  cancelButton = self->_cancelButton;
  objc_msgSend(v5, "denyText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUIContentButton setTitle:forState:](cancelButton, "setTitle:forState:", v9, 0);

  v33 = self;
  -[SiriUIContentButton setRole:](self->_cancelButton, "setRole:", 2);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v31 = v5;
  objc_msgSend(v5, "allConfirmationOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (!v11)
  {
    v13 = 0;
    goto LABEL_20;
  }
  v12 = v11;
  v13 = 0;
  v14 = *(_QWORD *)v35;
  v15 = *MEMORY[0x24BE826D0];
  v16 = *MEMORY[0x24BE826C8];
  v32 = *MEMORY[0x24BE826C0];
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v35 != v14)
        objc_enumerationMutation(v10);
      v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
      objc_msgSend(v18, "type");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", v15);

      if (v20)
      {
        if (v13)
        {
          v21 = *MEMORY[0x24BE08FB0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v39 = "-[SiriUIReusableConfirmationFooterView setConfirmationOptions:]";
            v40 = 2112;
            v41 = v18;
            _os_log_error_impl(&dword_21764F000, v21, OS_LOG_TYPE_ERROR, "%s Warning: Duplicated confirm confirmationOption included in SAUIConfirmationOptions : %@", buf, 0x16u);
          }
        }
        v22 = v18;

        objc_msgSend(v22, "buttonRole");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqualToString:", v16);

        if ((v24 & 1) != 0)
        {
          v25 = 1;
          goto LABEL_14;
        }
        objc_msgSend(v22, "buttonRole");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "isEqualToString:", v32);

        if (v27)
        {
          v25 = 3;
LABEL_14:
          -[SiriUIContentButton setRole:](v33->_confirmButton, "setRole:", v25);
        }
        v13 = v22;
        continue;
      }
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  }
  while (v12);
LABEL_20:

  objc_msgSend(v13, "automaticConfirmationThreshold");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v13, "automaticConfirmationThreshold");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "doubleValue");
    v33->_automaticConfirmationThreshold = v30;

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  -[SiriUIReusableConfirmationFooterView traitCollection](self, "traitCollection", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isAmbientPresented"))
    -[SiriUIReusableConfirmationFooterView defaultAmbientHeight](self, "defaultAmbientHeight");
  else
    objc_msgSend((id)objc_opt_class(), "defaultHeight");
  v7 = v6;

  v8 = width;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
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
  double v26;
  double v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)SiriUIReusableConfirmationFooterView;
  -[SiriUIReusableConfirmationFooterView layoutSubviews](&v28, sel_layoutSubviews);
  v3 = -[SiriUIReusableConfirmationFooterView semanticContentAttribute](self, "semanticContentAttribute");
  -[SiriUIReusableConfirmationFooterView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isAmbientPresented"))
    -[SiriUIReusableConfirmationFooterView defaultAmbientHeight](self, "defaultAmbientHeight");
  else
    objc_msgSend((id)objc_opt_class(), "defaultHeight");
  v6 = v5;

  -[SiriUIReusableConfirmationFooterView bounds](self, "bounds");
  v8 = v7;
  -[SiriUIReusableConfirmationFooterView edgeInsets](self, "edgeInsets");
  v10 = v6 - v9;
  -[SiriUIReusableConfirmationFooterView edgeInsets](self, "edgeInsets");
  v12 = v10 - v11;
  -[SiriUIReusableConfirmationFooterView edgeInsets](self, "edgeInsets");
  v14 = v8 - v13;
  -[SiriUIReusableConfirmationFooterView edgeInsets](self, "edgeInsets");
  v16 = v14 - v15;
  -[SiriUIReusableConfirmationFooterView edgeInsets](self, "edgeInsets");
  v18 = (v16 - v17) * 0.5;
  -[SiriUIReusableConfirmationFooterView edgeInsets](self, "edgeInsets");
  v20 = v19;
  -[SiriUIReusableConfirmationFooterView edgeInsets](self, "edgeInsets");
  v22 = v21 + v18;
  -[SiriUIReusableConfirmationFooterView edgeInsets](self, "edgeInsets");
  v24 = v22 + v23;
  -[SiriUIReusableConfirmationFooterView edgeInsets](self, "edgeInsets");
  v26 = v25;
  if (v3 == 4)
    v27 = v24;
  else
    v27 = v20;
  if (v3 != 4)
    v20 = v24;
  -[SiriUIContentButton setFrame:](self->_cancelButton, "setFrame:", v27, v26, v18, v12);
  -[SiriUIContentButton setFrame:](self->_confirmButton, "setFrame:", v20, v26, v18, v12);
  -[SiriUIProgressBarView setFrame:](self->_progressBarView, "setFrame:", v20, v26, v18, v12);
}

- (void)beginProgressAnimation
{
  if (self->_automaticConfirmationThreshold > 0.0)
    -[SiriUIProgressBarView beginProgressAnimationWithDuration:](self->_progressBarView, "beginProgressAnimationWithDuration:");
}

- (UIEdgeInsets)edgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 16.0;
  v3 = 16.0;
  v4 = 16.0;
  v5 = 16.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIButton)cancelButton
{
  return &self->_cancelButton->super;
}

- (UIButton)confirmButton
{
  return &self->_confirmButton->super;
}

- (id)snippetViewController
{
  return objc_loadWeakRetained((id *)&self->_snippetViewController);
}

- (SAUIConfirmationOptions)confirmationOptions
{
  return self->_confirmationOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmationOptions, 0);
  objc_destroyWeak((id *)&self->_snippetViewController);
  objc_storeStrong((id *)&self->_progressBarView, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_verticalKeyline, 0);
}

@end
