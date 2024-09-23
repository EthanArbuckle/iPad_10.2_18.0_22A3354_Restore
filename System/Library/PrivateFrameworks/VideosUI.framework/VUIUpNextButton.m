@implementation VUIUpNextButton

- (void)updateAccessibilityIdentifierAfterStateChanged
{
  void *v3;
  void *v4;
  int v5;
  const __CFString *v6;
  const __CFString *v7;
  id v8;

  -[VUIUpNextButton vuiAccessibilityIdentifier](self, "vuiAccessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIUpNextButton properties](self, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isWatchListed");

  if (v5)
  {
    v6 = CFSTR("removed");
    v7 = CFSTR("added");
  }
  else
  {
    v6 = CFSTR("added");
    v7 = CFSTR("removed");
  }
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", v6, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[VUIUpNextButton setVuiAccessibilityIdentifier:](self, "setVuiAccessibilityIdentifier:", v8);
}

- (void)upNextStateChangedToRemoved
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD);
  char v16;
  void *v17;
  void *v18;
  id v19;

  -[VUIUpNextButton properties](self, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removedStateView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIButton setTextContentView:](self, "setTextContentView:", v5);

  -[VUIUpNextButton properties](self, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentImageView");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[VUIButton imageView](self, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      -[VUIButton setImageView:](self, "setImageView:", v19);
    -[VUIUpNextButton properties](self, "properties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removedStateView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "image");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_msgSend(MEMORY[0x1E0DC69D0], "isMac") & 1) == 0)
    {
      v16 = objc_msgSend(MEMORY[0x1E0DC69D0], "isTV");

      if ((v16 & 1) == 0)
      {
        objc_msgSend(v19, "image");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17 != v10)
        {
          objc_msgSend(MEMORY[0x1E0CE86F8], "transition");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setSymbolImage:withSymbolTransition:", v10, v18);

        }
        goto LABEL_8;
      }
    }
    else
    {

    }
    objc_msgSend(v19, "setImage:", v10);
LABEL_8:
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:", CFSTR("TV.Button.UpNext.Add"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAccessibilityLabel:", v13);

  }
  -[VUIUpNextButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[VUIUpNextButton updateAccessibilityIdentifierAfterStateChanged](self, "updateAccessibilityIdentifierAfterStateChanged");
  -[VUIUpNextButton stateDidChangeHandler](self, "stateDidChangeHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[VUIUpNextButton stateDidChangeHandler](self, "stateDidChangeHandler");
    v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, VUIUpNextButton *))v15)[2](v15, self);

  }
}

- (id)stateDidChangeHandler
{
  return self->_stateDidChangeHandler;
}

- (void)setTintColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)VUIUpNextButton;
  -[VUIButton setTintColor:](&v7, sel_setTintColor_, v4);
  if (-[VUIUpNextButton tintAdjustmentMode](self, "tintAdjustmentMode") != 2)
  {
    -[VUIUpNextButton properties](self, "properties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "_setTintColor:", v4);
    -[VUIButton setImageTintColor:](self, "setImageTintColor:", v4);

  }
}

- (void)setStateDidChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 840);
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (VUIUpNextButtonProperties)properties
{
  return self->_properties;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UIView vui_sizeThatFits:](self, "vui_sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (VUIUpNextButton)initWithType:(unint64_t)a3 interfaceStyle:(unint64_t)a4
{
  VUIUpNextButton *v4;
  VUIUpNextButtonProperties *v5;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VUIUpNextButton;
  v4 = -[VUIButton initWithType:interfaceStyle:](&v10, sel_initWithType_interfaceStyle_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(VUIUpNextButtonProperties);
    -[VUIUpNextButton setProperties:](v4, "setProperties:", v5);

    objc_initWeak(&location, v4);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__VUIUpNextButton_initWithType_interfaceStyle___block_invoke;
    v7[3] = &unk_1E9F990E0;
    objc_copyWeak(&v8, &location);
    -[VUIButton setSelectActionHandler:](v4, "setSelectActionHandler:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __47__VUIUpNextButton_initWithType_interfaceStyle___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "selectButtonAction:", CFSTR("select"));

}

- (void)selectButtonAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("VUIDidSelectUpNextButtonNotification"), self, 0);

  -[VUIUpNextButton properties](self, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "callAPIAndToggleUpNextState");

  -[VUIUpNextButton properties](self, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v6, "dismissOnSelect");

  if ((_DWORD)v5)
    +[VUIApplicationRouter dismissPresentedViewController](VUIApplicationRouter, "dismissPresentedViewController");
}

- (void)upNextStateChangedToAdded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD);
  char v16;
  void *v17;
  void *v18;
  id v19;

  -[VUIUpNextButton properties](self, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedStateView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIButton setTextContentView:](self, "setTextContentView:", v5);

  -[VUIUpNextButton properties](self, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentImageView");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[VUIButton imageView](self, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      -[VUIButton setImageView:](self, "setImageView:", v19);
    -[VUIUpNextButton properties](self, "properties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addedStateView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "image");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_msgSend(MEMORY[0x1E0DC69D0], "isMac") & 1) == 0)
    {
      v16 = objc_msgSend(MEMORY[0x1E0DC69D0], "isTV");

      if ((v16 & 1) == 0)
      {
        objc_msgSend(v19, "image");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17 != v10)
        {
          objc_msgSend(MEMORY[0x1E0CE86F8], "transition");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setSymbolImage:withSymbolTransition:", v10, v18);

        }
        goto LABEL_8;
      }
    }
    else
    {

    }
    objc_msgSend(v19, "setImage:", v10);
LABEL_8:
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:", CFSTR("TV.Button.UpNext.Remove"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAccessibilityLabel:", v13);

  }
  -[VUIUpNextButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[VUIUpNextButton updateAccessibilityIdentifierAfterStateChanged](self, "updateAccessibilityIdentifierAfterStateChanged");
  -[VUIUpNextButton stateDidChangeHandler](self, "stateDidChangeHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[VUIUpNextButton stateDidChangeHandler](self, "stateDidChangeHandler");
    v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, VUIUpNextButton *))v15)[2](v15, self);

  }
}

- (id)largeContentTitle
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  -[VUIUpNextButton properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWatchListed");

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("TV.Button.UpNext.Remove");
  else
    v6 = CFSTR("TV.Button.UpNext.Add");
  objc_msgSend(v4, "localizedStringForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateDidChangeHandler, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
