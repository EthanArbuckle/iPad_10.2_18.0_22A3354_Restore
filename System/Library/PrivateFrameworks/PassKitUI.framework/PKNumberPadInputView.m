@implementation PKNumberPadInputView

+ (CGSize)defaultSizeForInterfaceOrientation:(int64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0DC3938], "defaultSizeForInterfaceOrientation:", a3);
  result.height = v4;
  result.width = v3;
  return result;
}

- (PKNumberPadInputView)initWithFrame:(CGRect)a3 delegate:(id)a4 configurator:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  PKNumberPadInputView *v13;
  PKNumberPadInputView *v14;
  NSNumberFormatter *v15;
  void *v16;
  NSNumberFormatter *formatter;
  NSMutableArray *v18;
  NSMutableArray *buttons;
  _QWORD v21[4];
  PKNumberPadInputView *v22;
  id v23;
  objc_super v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v12 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PKNumberPadInputView;
  v13 = -[UIInputView initWithFrame:inputViewStyle:](&v24, sel_initWithFrame_inputViewStyle_, 1, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, v11);
    v15 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter setLocale:](v15, "setLocale:", v16);

    formatter = v14->_formatter;
    v14->_formatter = v15;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    buttons = v14->_buttons;
    v14->_buttons = v18;

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __60__PKNumberPadInputView_initWithFrame_delegate_configurator___block_invoke;
    v21[3] = &unk_1E3E6B980;
    v22 = v14;
    v23 = v12;
    -[PKNumberPadInputView performBatchUpdates:](v22, "performBatchUpdates:", v21);

  }
  return v14;
}

void __60__PKNumberPadInputView_initWithFrame_delegate_configurator___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 633) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 672) = 0;
  v5 = v3;
  objc_msgSend(v3, "setNumberPadColor:", 0);
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

}

- (void)performBatchUpdates:(id)a3
{
  id v4;
  unsigned __int8 v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    ++self->_batchedUpdateCount;
    v6 = v4;
    (*((void (**)(id, PKNumberPadInputView *))v4 + 2))(v4, self);
    v5 = self->_batchedUpdateCount - 1;
    self->_batchedUpdateCount = v5;
    if (!v5)
    {
      if (self->_needsReload)
        -[PKNumberPadInputView _reloadSubviews](self, "_reloadSubviews");
      if (self->_needsUpdate)
        -[PKNumberPadInputView _updateButtons](self, "_updateButtons");
    }

  }
  else
  {
    __break(1u);
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
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKNumberPadInputView;
  -[PKNumberPadInputView layoutSubviews](&v12, sel_layoutSubviews);
  -[PKNumberPadInputView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if ((PKHomeButtonIsAvailable() & 1) == 0)
  {
    -[PKNumberPadInputView safeAreaInsets](self, "safeAreaInsets");
    v10 = v10 - v11;
  }
  -[UIStackView setFrame:](self->_verticalStackView, "setFrame:", v4, v6, v8, v10);
}

- (void)setShowsDecimalPointButton:(BOOL)a3
{
  if (((!self->_showsDecimalPointButton ^ a3) & 1) == 0)
  {
    self->_showsDecimalPointButton = a3;
    -[PKNumberPadInputView _reloadSubviews](self, "_reloadSubviews");
  }
}

- (void)setNumberPadColor:(id)a3
{
  id v4;
  id obj;

  v4 = a3;
  if (!v4)
  {
    PKProvisioningBackgroundColor();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  obj = v4;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_numberPadColor, obj);
    -[PKNumberPadInputView setBackgroundColor:](self, "setBackgroundColor:", self->_numberPadColor);
    -[PKNumberPadInputView _updateButtons](self, "_updateButtons");
  }

}

- (void)setTextColor:(id)a3
{
  id v4;
  id obj;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  obj = v4;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_textColor, obj);
    -[PKNumberPadInputView _updateButtons](self, "_updateButtons");
  }

}

- (void)_numericKeyPressed:(unint64_t)a3
{
  id WeakRetained;
  id v5;

  if (a3 < 0xA || a3 == 11)
  {
    v5 = (id)PKNumberPadKeyButtonValueToString(self->_formatter, a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "numberPadInputView:requestReplaceSelectedTextFieldRangeWithText:", self, v5);

LABEL_3:
    return;
  }
  if (a3 == 10)
  {
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "numberPadInputViewRequestDeleteText:", self);
    goto LABEL_3;
  }
}

- (void)_updateButtons
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_batchedUpdateCount)
  {
    self->_needsUpdate = 1;
  }
  else
  {
    v3 = (void *)MEMORY[0x1A1AE621C]();
    self->_needsUpdate = 0;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = self->_buttons;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "setNeedsUpdateConfiguration", (_QWORD)v9);
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

    objc_autoreleasePoolPop(v3);
  }
}

- (void)_reloadSubviews
{
  UIStackView *verticalStackView;
  UIStackView *v4;
  UIStackView *v5;
  UIStackView *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unsigned __int8 IsAvailable;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *context;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  PKNumberPadInputView *val;
  _QWORD v30[4];
  id v31[2];
  _QWORD v32[4];
  id v33[2];
  id location;
  _QWORD v35[3];
  _QWORD v36[6];

  v36[4] = *MEMORY[0x1E0C80C00];
  if (self->_batchedUpdateCount)
  {
    self->_needsReload = 1;
  }
  else
  {
    context = (void *)MEMORY[0x1A1AE621C]();
    self->_needsReload = 0;
    self->_needsUpdate = 0;
    verticalStackView = self->_verticalStackView;
    if (verticalStackView)
    {
      -[UIStackView removeFromSuperview](verticalStackView, "removeFromSuperview");
      v4 = self->_verticalStackView;
      self->_verticalStackView = 0;

    }
    -[NSMutableArray removeAllObjects](self->_buttons, "removeAllObjects");
    v5 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    v6 = self->_verticalStackView;
    self->_verticalStackView = v5;

    -[UIStackView setAxis:](self->_verticalStackView, "setAxis:", 1);
    -[UIStackView setDistribution:](self->_verticalStackView, "setDistribution:", 1);
    -[UIStackView setAlignment:](self->_verticalStackView, "setAlignment:", 0);
    -[UIStackView setSpacing:](self->_verticalStackView, "setSpacing:", 0.0);
    -[PKNumberPadInputView addSubview:](self, "addSubview:", self->_verticalStackView);
    val = self;
    if (self->_showsDecimalPointButton)
      v7 = 11;
    else
      v7 = 12;
    v36[0] = &unk_1E3FAE710;
    v36[1] = &unk_1E3FAE728;
    v36[2] = &unk_1E3FAE740;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v8;
    v35[1] = &unk_1E3FAD300;
    v35[2] = &unk_1E3FAD318;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v36[3] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v27 = objc_msgSend(v25, "count");
    if (v27)
    {
      v10 = 0;
      do
      {
        v26 = v10;
        objc_msgSend(v25, "objectAtIndexedSubscript:");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
        objc_msgSend(v11, "setAxis:", 0);
        objc_msgSend(v11, "setDistribution:", 1);
        objc_msgSend(v11, "setAlignment:", 0);
        objc_msgSend(v11, "setSemanticContentAttribute:", 3);
        objc_msgSend(v11, "setSpacing:", 0.0);
        v12 = objc_msgSend(v28, "count");
        v13 = v12;
        if (v12)
        {
          v14 = 0;
          v15 = v12 - 1;
          do
          {
            objc_msgSend(v28, "objectAtIndexedSubscript:", v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            IsAvailable = PKHomeButtonIsAvailable();
            v18 = 5;
            if (v15 == v14)
              v18 = 1;
            if ((IsAvailable & (v26 + 1 >= v27)) != 0)
              v19 = v18 | 2;
            else
              v19 = v18;
            v20 = (void *)objc_msgSend(v16, "unsignedIntegerValue");
            v21 = (void *)MEMORY[0x1E0DC3428];
            v32[0] = MEMORY[0x1E0C809B0];
            v32[1] = 3221225472;
            v32[2] = __39__PKNumberPadInputView__reloadSubviews__block_invoke;
            v32[3] = &unk_1E3E6B9A8;
            objc_copyWeak(v33, &location);
            v33[1] = v20;
            objc_msgSend(v21, "actionWithHandler:", v32);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = -[PKNumberPadInputView _createBorderedButtonForButtonValue:withBorder:primaryAction:](val, "_createBorderedButtonForButtonValue:withBorder:primaryAction:", v20, v19, v22);

            v30[0] = MEMORY[0x1E0C809B0];
            v30[1] = 3221225472;
            v30[2] = __39__PKNumberPadInputView__reloadSubviews__block_invoke_2;
            v30[3] = &unk_1E3E6B9D0;
            objc_copyWeak(v31, &location);
            v31[1] = v20;
            objc_msgSend(v23, "setConfigurationUpdateHandler:", v30);
            objc_msgSend(v11, "addArrangedSubview:", v23);
            -[NSMutableArray addObject:](val->_buttons, "addObject:", v23);
            objc_destroyWeak(v31);

            objc_destroyWeak(v33);
            ++v14;
          }
          while (v13 != v14);
        }
        -[UIStackView addArrangedSubview:](val->_verticalStackView, "addArrangedSubview:", v11);

        v10 = v26 + 1;
      }
      while (v26 + 1 != v27);
    }
    objc_destroyWeak(&location);

    objc_autoreleasePoolPop(context);
  }
}

void __39__PKNumberPadInputView__reloadSubviews__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_numericKeyPressed:", *(_QWORD *)(a1 + 40));

}

void __39__PKNumberPadInputView__reloadSubviews__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD *WeakRetained;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v3 = (void *)MEMORY[0x1A1AE621C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = objc_msgSend(v12, "isHighlighted");
    objc_msgSend(v12, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 40) == 10)
    {
      if ((v5 & 1) != 0)
        UIKeyboardGetDeleteOnKeyImage();
      else
        UIKeyboardGetDeleteKeyImage();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "imageWithRenderingMode:", 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setImage:", v8);

    }
    objc_msgSend(v6, "setBaseForegroundColor:", WeakRetained[86]);
    objc_msgSend(v6, "background");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "tableCellDefaultSelectionTintColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBackgroundColor:", v11);

    }
    else
    {
      objc_msgSend(v9, "setBackgroundColor:", WeakRetained[85]);
    }
    objc_msgSend(v12, "setConfiguration:", v6);

  }
  objc_autoreleasePoolPop(v3);

}

- (id)_createBorderedButtonForButtonValue:(unint64_t)a3 withBorder:(unint64_t)a4 primaryAction:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;

  v8 = a5;
  +[PKBorderedButtonConfiguration plainButtonConfiguration](PKBorderedButtonConfiguration, "plainButtonConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBorder:", a4);
  objc_msgSend(v9, "background");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCornerRadius:", 0.0);
  objc_msgSend(v9, "setTitleAlignment:", 2);
  objc_msgSend(v9, "setTitleTextAttributesTransformer:", &__block_literal_global_90);
  if (a3 != 10 && a3 != 12)
  {
    v11 = (__CFString *)PKNumberPadKeyButtonValueToString(self->_formatter, a3);
    objc_msgSend(v9, "setTitle:", v11);

  }
  +[PKBorderedButton borderedButtonWithConfiguration:primaryAction:](PKBorderedButton, "borderedButtonWithConfiguration:primaryAction:", v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (a3 == 12)
    objc_msgSend(v12, "setUserInteractionEnabled:", 0);

  return v13;
}

id __85__PKNumberPadInputView__createBorderedButtonForButtonValue_withBorder_primaryAction___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 31.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, *MEMORY[0x1E0DC1138]);

  return v2;
}

- (BOOL)showsDecimalPointButton
{
  return self->_showsDecimalPointButton;
}

- (UIColor)numberPadColor
{
  return self->_numberPadColor;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_numberPadColor, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_verticalStackView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_formatter, 0);
}

@end
