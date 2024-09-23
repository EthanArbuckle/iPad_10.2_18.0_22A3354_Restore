@implementation PXSurveyQuestionPlaceholderGadgetView

- (PXSurveyQuestionPlaceholderGadgetView)initWithFrame:(CGRect)a3
{
  PXSurveyQuestionPlaceholderGadgetView *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  UIContentUnavailableView *contentUnavailableView;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXSurveyQuestionPlaceholderGadgetView;
  v3 = -[PXSurveyQuestionPlaceholderGadgetView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSurveyQuestionPlaceholderGadgetView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[PXSurveyQuestionPlaceholderGadgetView _setCornerRadius:](v3, "_setCornerRadius:", 10.0);
    objc_msgSend(MEMORY[0x1E0DC3698], "px_containerized_defaultConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC36B0]), "initWithConfiguration:", v5);
    contentUnavailableView = v3->_contentUnavailableView;
    v3->_contentUnavailableView = (UIContentUnavailableView *)v6;

    -[PXSurveyQuestionPlaceholderGadgetView contentView](v3, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    -[UIContentUnavailableView setFrame:](v3->_contentUnavailableView, "setFrame:");
    -[UIContentUnavailableView setAutoresizingMask:](v3->_contentUnavailableView, "setAutoresizingMask:", 18);
    objc_msgSend(v8, "addSubview:", v3->_contentUnavailableView);

  }
  return v3;
}

- (void)setPlaceholderContentUnavailableConfiguration:(id)a3
{
  UIContentUnavailableConfiguration *v5;
  UIContentUnavailableConfiguration *v6;
  UIContentUnavailableConfiguration *v7;
  char v8;
  UIContentUnavailableConfiguration *v9;
  UIContentUnavailableConfiguration *placeholderContentUnavailableConfiguration;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id location;

  v5 = (UIContentUnavailableConfiguration *)a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionPlaceholderGadgetView.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("placeholderContentUnavailableConfiguration"));

  }
  v6 = self->_placeholderContentUnavailableConfiguration;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[UIContentUnavailableConfiguration isEqual:](v6, "isEqual:", v5);

    if ((v8 & 1) == 0)
    {
      v9 = (UIContentUnavailableConfiguration *)-[UIContentUnavailableConfiguration copy](v5, "copy");
      placeholderContentUnavailableConfiguration = self->_placeholderContentUnavailableConfiguration;
      self->_placeholderContentUnavailableConfiguration = v9;

      -[UIContentUnavailableConfiguration buttonProperties](self->_placeholderContentUnavailableConfiguration, "buttonProperties");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "configuration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_initWeak(&location, self);
        v14 = (void *)MEMORY[0x1E0DC3428];
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __87__PXSurveyQuestionPlaceholderGadgetView_setPlaceholderContentUnavailableConfiguration___block_invoke;
        v17[3] = &unk_1E5147F40;
        objc_copyWeak(&v18, &location);
        objc_msgSend(v14, "actionWithHandler:", v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setPrimaryAction:", v15);

        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
      }
      -[UIContentUnavailableView setConfiguration:](self->_contentUnavailableView, "setConfiguration:", self->_placeholderContentUnavailableConfiguration);

    }
  }

}

- (void)_performContentUnavailableButtonAction
{
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  NSObject *v7;
  id v8;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  -[PXSurveyQuestionPlaceholderGadgetView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXSurveyQuestionPlaceholderGadgetView loadingContentUnavailableConfiguration](self, "loadingContentUnavailableConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      -[UIContentUnavailableView setConfiguration:](self->_contentUnavailableView, "setConfiguration:", v4);
    objc_initWeak(location, self);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __79__PXSurveyQuestionPlaceholderGadgetView__performContentUnavailableButtonAction__block_invoke;
    v6[3] = &unk_1E51472F8;
    v5 = v4;
    v7 = v5;
    objc_copyWeak(&v8, location);
    objc_msgSend(v3, "placeholderGadgetView:invokeActionWithCompletionHandler:", self, v6);
    objc_destroyWeak(&v8);

    objc_destroyWeak(location);
  }
  else
  {
    PXAssertGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 136315138;
      *(id *)((char *)location + 4) = "-[PXSurveyQuestionPlaceholderGadgetView _performContentUnavailableButtonAction]";
      _os_log_error_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Missing delegate: %s", (uint8_t *)location, 0xCu);
    }
  }

}

- (void)_restorePlaceholderContentUnavailableConfiguration
{
  id v3;

  -[PXSurveyQuestionPlaceholderGadgetView placeholderContentUnavailableConfiguration](self, "placeholderContentUnavailableConfiguration");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableView setConfiguration:](self->_contentUnavailableView, "setConfiguration:", v3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)PXSurveyQuestionPlaceholderGadgetView;
  v4 = a3;
  -[PXSurveyQuestionPlaceholderGadgetView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[PXSurveyQuestionPlaceholderGadgetView traitCollection](self, "traitCollection", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    -[PXSurveyQuestionPlaceholderGadgetView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      PXAssertGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v12 = "-[PXSurveyQuestionPlaceholderGadgetView traitCollectionDidChange:]";
        _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Missing delegate: %s", buf, 0xCu);
      }

    }
    objc_msgSend(v8, "placeholderGadgetViewSizeThatFitsDidChange:", self);

  }
}

- (PXSurveyQuestionPlaceholderGadgetViewDelegate)delegate
{
  return (PXSurveyQuestionPlaceholderGadgetViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIContentUnavailableConfiguration)placeholderContentUnavailableConfiguration
{
  return self->_placeholderContentUnavailableConfiguration;
}

- (UIContentUnavailableConfiguration)loadingContentUnavailableConfiguration
{
  return self->_loadingContentUnavailableConfiguration;
}

- (void)setLoadingContentUnavailableConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 672);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingContentUnavailableConfiguration, 0);
  objc_storeStrong((id *)&self->_placeholderContentUnavailableConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentUnavailableView, 0);
}

void __79__PXSurveyQuestionPlaceholderGadgetView__performContentUnavailableButtonAction__block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__PXSurveyQuestionPlaceholderGadgetView__performContentUnavailableButtonAction__block_invoke_2;
    block[3] = &unk_1E5148D30;
    objc_copyWeak(&v4, (id *)(a1 + 40));
    dispatch_after(v2, MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v4);
  }
}

void __79__PXSurveyQuestionPlaceholderGadgetView__performContentUnavailableButtonAction__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_restorePlaceholderContentUnavailableConfiguration");

}

void __87__PXSurveyQuestionPlaceholderGadgetView_setPlaceholderContentUnavailableConfiguration___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_performContentUnavailableButtonAction");

}

@end
