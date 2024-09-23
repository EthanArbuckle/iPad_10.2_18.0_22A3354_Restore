@implementation VUIViewControllerContentPresenter

- (void)setLogName:(id)a3
{
  objc_storeStrong((id *)&self->_logName, a3);
}

void __63__VUIViewControllerContentPresenter_setCurrentContentViewType___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  VUILoadingView *v22;
  VUILoadingView *v23;
  uint64_t v24;
  _BOOL8 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_msgSend(WeakRetained, "currentContentViewType");
    v5 = *(_QWORD *)(a1 + 40);
    VUIDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v4 == v5)
    {
      if (v7)
      {
        objc_msgSend(v3, "logName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_logNameForContentViewType:", *(_QWORD *)(a1 + 40));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "currentView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v32 = v8;
        v33 = 2112;
        v34 = v9;
        v35 = 2112;
        v36 = v10;
        _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "[%@] - Content view type is not changed. Current type: %@. Current view: %@", buf, 0x20u);

      }
    }
    else
    {
      if (v7)
      {
        objc_msgSend(v3, "logName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_logNameForContentViewType:", *(_QWORD *)(a1 + 40));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v32 = v11;
        v33 = 2112;
        v34 = v12;
        _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "[%@] - Setting content view type:%@", buf, 0x16u);

      }
      objc_msgSend(v3, "rootView");
      v6 = objc_claimAutoreleasedReturnValue();
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      objc_msgSend(v3, "rootView", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "subviews");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v28 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "removeFromSuperview");
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
        }
        while (v16);
      }

      v19 = objc_msgSend(v3, "currentContentViewType");
      v3[2] = *(_QWORD *)(a1 + 40);
      switch(objc_msgSend(v3, "currentContentViewType"))
      {
        case 1:
          objc_msgSend(v3, "loadingMessage");
          v20 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "loadingTitle");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = [VUILoadingView alloc];
          v23 = -[VUILoadingView initWithFrame:loadingTitle:loadingMessage:](v22, "initWithFrame:loadingTitle:loadingMessage:", v21, v20, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
          -[VUILoadingView startTimer](v23, "startTimer");
          goto LABEL_22;
        case 2:
          objc_msgSend(v3, "noContentErrorTitle");
          v20 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "noContentErrorMessage");
          v24 = objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        case 3:
          objc_msgSend(v3, "contentView");
          v23 = (VUILoadingView *)objc_claimAutoreleasedReturnValue();
          break;
        case 4:
          objc_msgSend(v3, "cloudUpdateFailedTitle");
          v20 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "cloudUpdateFailedMessage");
          v24 = objc_claimAutoreleasedReturnValue();
LABEL_19:
          v21 = (void *)v24;
          if (v20 | v24)
          {
            objc_msgSend(v3, "_createAlertViewWithTitle:description:", v20, v24);
            v23 = (VUILoadingView *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v23 = 0;
          }
LABEL_22:

          break;
        default:
          v23 = 0;
          break;
      }
      v26 = objc_msgSend(v3, "currentContentViewType") == 2 && v19 == 3;
      objc_msgSend(v3, "setContentHasBeenDeleted:", v26);
      if (v23)
        -[NSObject addSubview:](v6, "addSubview:", v23);
      objc_msgSend(v3, "setCurrentView:", v23);

    }
  }

}

- (void)setRootViewForViewController:(id)a3
{
  objc_class *v4;
  UIView *v5;
  UIView *rootView;
  UIView *v7;
  void *v8;
  id v9;

  v4 = (objc_class *)MEMORY[0x1E0DC3F10];
  v9 = a3;
  v5 = (UIView *)objc_alloc_init(v4);
  rootView = self->_rootView;
  self->_rootView = v5;

  v7 = self->_rootView;
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryDynamicBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v8);

  objc_msgSend(v9, "setView:", self->_rootView);
}

- (void)setNoContentErrorTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setNoContentErrorMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setLoadingTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setLoadingMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setCurrentView:(id)a3
{
  objc_storeStrong((id *)&self->_currentView, a3);
}

- (void)setCurrentContentViewType:(unint64_t)a3
{
  _QWORD *v4;
  _QWORD v5[2];
  void (*v6)(uint64_t);
  void *v7;
  id v8[2];
  id location;

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v6 = __63__VUIViewControllerContentPresenter_setCurrentContentViewType___block_invoke;
  v7 = &unk_1E9F9C210;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  v4 = v5;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v6((uint64_t)v4);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v4);

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (void)setContentHasBeenDeleted:(BOOL)a3
{
  self->_contentHasBeenDeleted = a3;
}

- (void)setCloudUpdateFailedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setCloudUpdateFailedMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (UIView)rootView
{
  return self->_rootView;
}

- (void)refreshNoContentViewIfNeeded
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;
  id v14;
  id location;

  v3 = -[VUIViewControllerContentPresenter currentContentViewType](self, "currentContentViewType");
  -[VUIViewControllerContentPresenter currentView](self, "currentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIViewControllerContentPresenter noContentErrorTitle](self, "noContentErrorTitle");
  v5 = objc_claimAutoreleasedReturnValue();
  -[VUIViewControllerContentPresenter noContentErrorMessage](self, "noContentErrorMessage");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v3 == 2 && !v4 && v5 | v6)
  {
    objc_initWeak(&location, self);
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __65__VUIViewControllerContentPresenter_refreshNoContentViewIfNeeded__block_invoke;
    v11 = &unk_1E9F99000;
    objc_copyWeak(&v14, &location);
    v12 = (id)v5;
    v13 = (id)v6;
    v7 = &v8;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v8, v9))
      v10((uint64_t)v7);
    else
      dispatch_async(MEMORY[0x1E0C80D38], v7);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

- (NSString)noContentErrorTitle
{
  return self->_noContentErrorTitle;
}

- (NSString)noContentErrorMessage
{
  return self->_noContentErrorMessage;
}

- (NSString)logName
{
  return self->_logName;
}

- (NSString)loadingTitle
{
  return self->_loadingTitle;
}

- (NSString)loadingMessage
{
  return self->_loadingMessage;
}

- (UIView)currentView
{
  return self->_currentView;
}

- (unint64_t)currentContentViewType
{
  return self->_currentContentViewType;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)configureCurrentViewFrameForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[VUIViewControllerContentPresenter currentView](self, "currentView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", x, y, width, height);

}

- (id)_logNameForContentViewType:(unint64_t)a3
{
  if (a3 > 4)
    return &stru_1E9FF3598;
  else
    return off_1E9F9C230[a3];
}

- (void)setRootView:(id)a3
{
  id v5;
  UIView *rootView;
  id v7;

  objc_storeStrong((id *)&self->_rootView, a3);
  v5 = a3;
  rootView = self->_rootView;
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryDynamicBackgroundColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](rootView, "setBackgroundColor:", v7);

}

void __65__VUIViewControllerContentPresenter_refreshNoContentViewIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "_createAlertViewWithTitle:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rootView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
      objc_msgSend(v4, "addSubview:", v3);
    objc_msgSend(v6, "setCurrentView:", v3);

    WeakRetained = v6;
  }

}

- (id)_createAlertViewWithTitle:(id)a3 description:(id)a4
{
  id v5;
  id v6;
  VUILibraryAlertView *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(VUILibraryAlertView);
  -[VUILibraryAlertView titleLabel](v7, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryAlertView titleLabel](v7, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v5, v9, v10);

  -[VUILibraryAlertView subtitleLabel](v7, "subtitleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryAlertView subtitleLabel](v7, "subtitleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v6, v13, v14);

  return v7;
}

- (NSString)cloudUpdateFailedTitle
{
  return self->_cloudUpdateFailedTitle;
}

- (NSString)cloudUpdateFailedMessage
{
  return self->_cloudUpdateFailedMessage;
}

- (BOOL)contentHasBeenDeleted
{
  return self->_contentHasBeenDeleted;
}

- (BOOL)contentHasBeenManuallyDeleted
{
  return self->_contentHasBeenManuallyDeleted;
}

- (void)setContentHasBeenManuallyDeleted:(BOOL)a3
{
  self->_contentHasBeenManuallyDeleted = a3;
}

- (NSString)deletedContentErrorMessage
{
  return self->_deletedContentErrorMessage;
}

- (void)setDeletedContentErrorMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootView, 0);
  objc_storeStrong((id *)&self->_logName, 0);
  objc_storeStrong((id *)&self->_deletedContentErrorMessage, 0);
  objc_storeStrong((id *)&self->_cloudUpdateFailedMessage, 0);
  objc_storeStrong((id *)&self->_cloudUpdateFailedTitle, 0);
  objc_storeStrong((id *)&self->_loadingTitle, 0);
  objc_storeStrong((id *)&self->_loadingMessage, 0);
  objc_storeStrong((id *)&self->_noContentErrorMessage, 0);
  objc_storeStrong((id *)&self->_noContentErrorTitle, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_currentView, 0);
}

@end
