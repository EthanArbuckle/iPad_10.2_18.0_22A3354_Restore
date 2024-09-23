@implementation SKUIToggleButton

- (SKUIToggleButton)init
{
  SKUIToggleButton *v3;
  void *v4;
  objc_super v6;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIToggleButton init].cold.1();
  }
  v6.receiver = self;
  v6.super_class = (Class)SKUIToggleButton;
  v3 = -[SKUIToggleButton init](&v6, sel_init);
  if (v3)
  {
    +[SKUIToggleStateCenter defaultCenter](SKUIToggleStateCenter, "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:", v3);

    v3->_toggled = 0;
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[SKUIToggleStateCenter defaultCenter](SKUIToggleStateCenter, "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SKUIToggleButton;
  -[SKUIStyledButton dealloc](&v4, sel_dealloc);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  CGSize result;

  if (self->_toggleButtonType)
  {
    v22.receiver = self;
    v22.super_class = (Class)SKUIToggleButton;
    -[SKUIStyledButton sizeThatFits:](&v22, sel_sizeThatFits_, a3.width, a3.height);
    v5 = v4;
    v7 = v6;
  }
  else
  {
    if (self->_toggled)
      -[SKUIToggleButton _toggledLayout](self, "_toggledLayout", a3.width, a3.height);
    else
      -[SKUIToggleButton _nonToggledLayout](self, "_nonToggledLayout", a3.width, a3.height);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attributedString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "size");
    v5 = v10;
    v7 = v11;

    -[SKUIStyledButton borderStyle](self, "borderStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "borderWidth");
      *(float *)&v14 = v14 + v14;
      v15 = floorf(*(float *)&v14);
      objc_msgSend(v13, "contentInset");
      v7 = v7 + v17 + v16 + v15;
      v5 = v5 + v18 + v19 + v15;
    }

  }
  v20 = v5;
  v21 = v7;
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)setToggled:(BOOL)a3
{
  self->_toggled = a3;
  -[SKUIToggleButton setToggled:animated:](self, "setToggled:animated:");
}

- (void)setToggled:(BOOL)a3 animated:(BOOL)a4
{
  self->_toggled = a3;
  -[SKUIToggleButton _showToggleState:](self, "_showToggleState:", a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t autoIncrementCount;
  uint64_t v12;
  void *v13;
  void *v14;
  __CFString *v15;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  if (-[SKUIToggleButton isTouchInside](self, "isTouchInside"))
  {
    if (self->_toggleItemIdentifier)
    {
      +[SKUIToggleStateCenter defaultCenter](SKUIToggleStateCenter, "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "itemForIdentifier:", self->_toggleItemIdentifier);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (self->_autoIncrement)
      {
        autoIncrementCount = objc_msgSend(v9, "count");
        self->_count = autoIncrementCount;
        if (autoIncrementCount == -1)
          autoIncrementCount = self->_autoIncrementCount;
        if (self->_toggled)
          v12 = autoIncrementCount - 1;
        else
          v12 = autoIncrementCount + 1;
        self->_count = v12 & ~(v12 >> 63);
        if (v12 < 1)
        {
          v15 = CFSTR(" ");
        }
        else
        {
          if (touchesEnded_withEvent__sOnceToken != -1)
            dispatch_once(&touchesEnded_withEvent__sOnceToken, &__block_literal_global_35);
          v13 = (void *)touchesEnded_withEvent__sNumberFormatter;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_count);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringFromNumber:", v14);
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v10, "setToggledString:", v15);
        objc_msgSend(v10, "setCount:", self->_count);

      }
      objc_msgSend(v10, "setToggled:", !self->_toggled);
      objc_msgSend(v8, "updateItem:", v10);

    }
    else
    {
      -[SKUIToggleButton setToggled:](self, "setToggled:", !self->_toggled);
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIToggleButton;
  -[SKUIStyledButton touchesEnded:withEvent:](&v16, sel_touchesEnded_withEvent_, v6, v7);

}

uint64_t __43__SKUIToggleButton_touchesEnded_withEvent___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)touchesEnded_withEvent__sNumberFormatter;
  touchesEnded_withEvent__sNumberFormatter = (uint64_t)v0;

  return objc_msgSend((id)touchesEnded_withEvent__sNumberFormatter, "setNumberStyle:", 1);
}

- (void)setButtonTitleText:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    objc_storeStrong((id *)&self->_titleToggleString, a3);
    -[SKUIToggleButton _layoutForString:](self, "_layoutForString:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIStyledButton setTitleLayout:](self, "setTitleLayout:", v5);

    -[SKUIToggleButton setNeedsLayout](self, "setNeedsLayout");
    -[SKUIToggleButton setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (id)_layoutForString:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  SKUIAttributedStringLayoutRequest *v9;
  SKUIAttributedStringLayout *v10;

  v4 = (objc_class *)MEMORY[0x1E0CB3498];
  v5 = a3;
  v6 = [v4 alloc];
  -[SKUIToggleButton _titleAttributes](self, "_titleAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithString:attributes:", v5, v7);

  v9 = -[SKUIAttributedStringLayoutRequest initWithAttributedString:]([SKUIAttributedStringLayoutRequest alloc], "initWithAttributedString:", v8);
  -[SKUIAttributedStringLayoutRequest setNumberOfLines:](v9, "setNumberOfLines:", 1);
  -[SKUIAttributedStringLayoutRequest setWantsBaselineOffset:](v9, "setWantsBaselineOffset:", 1);
  objc_msgSend(v8, "size");
  -[SKUIAttributedStringLayoutRequest setWidth:](v9, "setWidth:");
  v10 = -[SKUIAttributedStringLayout initWithLayoutRequest:]([SKUIAttributedStringLayout alloc], "initWithLayoutRequest:", v9);

  return v10;
}

- (id)_nonToggledLayout
{
  SKUIAttributedStringLayout *nonToggledLayout;
  void *v4;
  SKUIAttributedStringLayout *v5;
  SKUIAttributedStringLayout *v6;

  nonToggledLayout = self->_nonToggledLayout;
  if (!nonToggledLayout)
  {
    -[SKUIToggleButton nonToggledTitle](self, "nonToggledTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIToggleButton _layoutForString:](self, "_layoutForString:", v4);
    v5 = (SKUIAttributedStringLayout *)objc_claimAutoreleasedReturnValue();
    v6 = self->_nonToggledLayout;
    self->_nonToggledLayout = v5;

    nonToggledLayout = self->_nonToggledLayout;
  }
  return nonToggledLayout;
}

- (void)_sendDidAnimate
{
  SKUIToggleButtonDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "toggleButtonDidAnimateTransition:", self);

  }
}

- (void)_sendWillAnimate
{
  SKUIToggleButtonDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "toggleButtonWillAnimateTransition:", self);

  }
}

- (void)_showToggleState:(BOOL)a3
{
  int64_t toggleButtonType;
  _BOOL4 v5;
  void *v6;
  _BOOL4 toggled;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  _QWORD v12[5];

  toggleButtonType = self->_toggleButtonType;
  if (toggleButtonType == 1)
  {
    toggled = self->_toggled;
    -[SKUIStyledButton imageView](self, "imageView", a3);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (toggled)
      -[SKUIToggleButton toggledContents](self, "toggledContents");
    else
      -[SKUIToggleButton nonToggledContents](self, "nonToggledContents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setContents:", v8);

  }
  else if (!toggleButtonType)
  {
    v5 = a3;
    -[SKUIToggleButton window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[SKUIToggleButton _sendWillAnimate](self, "_sendWillAnimate");
    if (v6 && v5)
    {
      v11[4] = self;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __37__SKUIToggleButton__showToggleState___block_invoke;
      v12[3] = &unk_1E739FD38;
      v12[4] = self;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __37__SKUIToggleButton__showToggleState___block_invoke_2;
      v11[3] = &unk_1E73A0108;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v12, v11, 0.4);
    }
    else
    {
      if (self->_toggled)
        -[SKUIToggleButton _toggledLayout](self, "_toggledLayout");
      else
        -[SKUIToggleButton _nonToggledLayout](self, "_nonToggledLayout");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIStyledButton setTitleLayout:](self, "setTitleLayout:", v9);

      -[SKUIToggleButton _sendDidAnimate](self, "_sendDidAnimate");
    }
  }
}

void __37__SKUIToggleButton__showToggleState___block_invoke(uint64_t a1)
{
  _BYTE *v1;
  id v2;

  v1 = *(_BYTE **)(a1 + 32);
  if (v1[696])
    objc_msgSend(*(id *)(a1 + 32), "_toggledLayout");
  else
    objc_msgSend(*(id *)(a1 + 32), "_nonToggledLayout");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setTitleLayout:", v2);

}

uint64_t __37__SKUIToggleButton__showToggleState___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendDidAnimate");
}

- (id)_titleAttributes
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[SKUIStyledButton titleLayout](self, "titleLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[SKUIStyledButton titleLayout](self, "titleLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributesAtIndex:effectiveRange:", 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_element);
    objc_msgSend(WeakRetained, "style");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    SKUIViewElementFontWithStyle(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 10.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "ikColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "color");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v13, "setLineBreakMode:", 4);
    v14 = objc_alloc(MEMORY[0x1E0C99D80]);
    v8 = (void *)objc_msgSend(v14, "initWithObjectsAndKeys:", v7, *MEMORY[0x1E0DC1138], v13, *MEMORY[0x1E0DC1178], v11, *MEMORY[0x1E0DC1140], 0);

  }
  return v8;
}

- (id)_toggledLayout
{
  SKUIAttributedStringLayout *toggledLayout;
  void *v4;
  SKUIAttributedStringLayout *v5;
  SKUIAttributedStringLayout *v6;

  toggledLayout = self->_toggledLayout;
  if (!toggledLayout)
  {
    -[SKUIToggleButton toggledTitle](self, "toggledTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIToggleButton _layoutForString:](self, "_layoutForString:", v4);
    v5 = (SKUIAttributedStringLayout *)objc_claimAutoreleasedReturnValue();
    v6 = self->_toggledLayout;
    self->_toggledLayout = v5;

    toggledLayout = self->_toggledLayout;
  }
  return toggledLayout;
}

- (void)itemStateCenter:(id)a3 itemStateChanged:(id)a4
{
  id v5;
  void *v6;
  int v7;
  _QWORD v8[4];
  id v9;
  SKUIToggleButton *v10;

  v5 = a4;
  objc_msgSend(v5, "itemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", self->_toggleItemIdentifier);

  if (v7)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __53__SKUIToggleButton_itemStateCenter_itemStateChanged___block_invoke;
    v8[3] = &unk_1E739FD10;
    v9 = v5;
    v10 = self;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
}

void __53__SKUIToggleButton_itemStateCenter_itemStateChanged___block_invoke(uint64_t a1)
{
  unsigned __int8 v2;
  unsigned __int8 *v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  if ((objc_msgSend(*(id *)(a1 + 32), "toggled") & 0x80000000) == 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "toggled");
    v3 = *(unsigned __int8 **)(a1 + 40);
    if (v3[696] != v2)
      objc_msgSend(v3, "setToggled:", objc_msgSend(*(id *)(a1 + 32), "toggled") == 1);
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v4 + 744) == 1 && *(_BYTE *)(v4 + 624))
  {
    objc_msgSend(*(id *)(a1 + 32), "toggledString");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "toggledString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 680));

      if ((v6 & 1) != 0)
        return;
      v7 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "toggledString");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setButtonTitleText:");
    }

  }
}

- (BOOL)autoIncrement
{
  return self->_autoIncrement;
}

- (void)setAutoIncrement:(BOOL)a3
{
  self->_autoIncrement = a3;
}

- (int64_t)autoIncrementCount
{
  return self->_autoIncrementCount;
}

- (void)setAutoIncrementCount:(int64_t)a3
{
  self->_autoIncrementCount = a3;
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (SKUIButtonViewElement)element
{
  return (SKUIButtonViewElement *)objc_loadWeakRetained((id *)&self->_element);
}

- (void)setElement:(id)a3
{
  objc_storeWeak((id *)&self->_element, a3);
}

- (NSString)toggleItemIdentifier
{
  return self->_toggleItemIdentifier;
}

- (void)setToggleItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_toggleItemIdentifier, a3);
}

- (BOOL)isToggled
{
  return self->_toggled;
}

- (SKUIToggleButtonDelegate)delegate
{
  return (SKUIToggleButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)nonToggledTitle
{
  return self->_nonToggledTitle;
}

- (void)setNonToggledTitle:(id)a3
{
  objc_storeStrong((id *)&self->_nonToggledTitle, a3);
}

- (NSString)toggledTitle
{
  return self->_toggledTitle;
}

- (void)setToggledTitle:(id)a3
{
  objc_storeStrong((id *)&self->_toggledTitle, a3);
}

- (id)nonToggledContents
{
  return self->_nonToggledContents;
}

- (void)setNonToggledContents:(id)a3
{
  objc_storeStrong(&self->_nonToggledContents, a3);
}

- (id)toggledContents
{
  return self->_toggledContents;
}

- (void)setToggledContents:(id)a3
{
  objc_storeStrong(&self->_toggledContents, a3);
}

- (int64_t)toggleButtonType
{
  return self->_toggleButtonType;
}

- (void)setToggleButtonType:(int64_t)a3
{
  self->_toggleButtonType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_toggledContents, 0);
  objc_storeStrong(&self->_nonToggledContents, 0);
  objc_storeStrong((id *)&self->_toggledTitle, 0);
  objc_storeStrong((id *)&self->_nonToggledTitle, 0);
  objc_storeStrong((id *)&self->_toggleItemIdentifier, 0);
  objc_storeStrong((id *)&self->_toggledLayout, 0);
  objc_storeStrong((id *)&self->_titleToggleString, 0);
  objc_storeStrong((id *)&self->_nonToggledLayout, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_element);
}

- (void)init
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIToggleButton init]";
}

@end
