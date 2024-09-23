@implementation TUIPressAndHoldView

- (TUIPressAndHoldView)initWithFrame:(CGRect)a3 keyString:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  TUIPressAndHoldView *v11;
  TUIPressAndHoldView *v12;
  NSArray *v13;
  NSArray *accentVariants;
  NSArray *v15;
  TUIPressAndHoldGrid *v16;
  uint64_t v17;
  TUIPressAndHoldGrid *pressAndHoldGrid;
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)TUIPressAndHoldView;
  v11 = -[TUIPressAndHoldView initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_currentKeyString, a4);
    +[TUIPressAndHoldView accentedCharactersForKeyString:](TUIPressAndHoldView, "accentedCharactersForKeyString:", v10);
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    accentVariants = v12->_accentVariants;
    v12->_accentVariants = v13;
    v15 = v13;

    v16 = [TUIPressAndHoldGrid alloc];
    -[TUIPressAndHoldView bounds](v12, "bounds");
    v17 = -[TUIPressAndHoldGrid initWithFrame:accentVariants:](v16, "initWithFrame:accentVariants:", v15);
    pressAndHoldGrid = v12->_pressAndHoldGrid;
    v12->_pressAndHoldGrid = (TUIPressAndHoldGrid *)v17;

    -[TUIPressAndHoldGrid setDelegate:](v12->_pressAndHoldGrid, "setDelegate:", v12);
    -[TUIPressAndHoldView addSubview:](v12, "addSubview:", v12->_pressAndHoldGrid);

  }
  return v12;
}

- (BOOL)hasAccentVariantInForwardDirection:(BOOL)a3
{
  uint64_t v3;
  void *v4;

  v3 = a3;
  -[TUIPressAndHoldView pressAndHoldGrid](self, "pressAndHoldGrid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "hasAccentVariantInForwardDirection:", v3);

  return v3;
}

- (void)showAccentVariantInForwardDirection:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;

  v3 = a3;
  -[TUIPressAndHoldView pressAndHoldGrid](self, "pressAndHoldGrid");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "showAccentVariantInForwardDirection:", v3);

}

- (BOOL)handleNumberKey:(unint64_t)a3
{
  void *v4;

  -[TUIPressAndHoldView pressAndHoldGrid](self, "pressAndHoldGrid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "handleNumberKey:", a3);

  return a3;
}

- (void)setSelectedIndexPath:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUIPressAndHoldView pressAndHoldGrid](self, "pressAndHoldGrid");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedIndexPath:", v4);

}

- (BOOL)pressAndHoldGridHasSelectedIndexPath
{
  void *v2;
  void *v3;
  BOOL v4;

  -[TUIPressAndHoldView pressAndHoldGrid](self, "pressAndHoldGrid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)handleSelection
{
  void *v2;
  char v3;

  -[TUIPressAndHoldView pressAndHoldGrid](self, "pressAndHoldGrid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "handleSelection");

  return v3;
}

- (NSString)selectedAccentVariant
{
  void *v2;
  void *v3;

  -[TUIPressAndHoldView pressAndHoldGrid](self, "pressAndHoldGrid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedAccentVariant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)pressAndHoldGridDidAcceptAccentVariant:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[TUIPressAndHoldView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[TUIPressAndHoldView delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pressAndHoldViewDidAcceptAccentVariant:atIndexPath:", v10, v6);

  }
}

- (NSArray)accentVariants
{
  return self->_accentVariants;
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (TUIPressAndHoldViewDelegate)delegate
{
  return (TUIPressAndHoldViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)currentKeyString
{
  return self->_currentKeyString;
}

- (TUIPressAndHoldGrid)pressAndHoldGrid
{
  return self->_pressAndHoldGrid;
}

- (void)setPressAndHoldGrid:(id)a3
{
  objc_storeStrong((id *)&self->_pressAndHoldGrid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pressAndHoldGrid, 0);
  objc_storeStrong((id *)&self->_currentKeyString, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_accentVariants, 0);
}

+ (id)accentedCharactersForKeyString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  if (v3)
  {
    UIKeyboardGetCurrentInputMode();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("Roman-Accent-"), "stringByAppendingString:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    UIKeyboardLocalizedObject();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v7 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DC4FD0]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "componentsSeparatedByCharactersInSet:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = (void *)objc_msgSend(v10, "mutableCopy");
        objc_msgSend(v7, "removeObject:", v3);

      }
      else
      {
        v7 = 0;
      }

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (CGSize)requiredPopoverSizeForKeyString:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  objc_msgSend(a1, "accentedCharactersForKeyString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "count");
  v4 = (double)(unint64_t)objc_msgSend(v3, "count");
  v5 = (double)(unint64_t)(objc_msgSend(v3, "count") + 1) * 5.0 + v4 * 30.0 + 0.0;

  v6 = 56.0;
  v7 = v5;
  result.height = v6;
  result.width = v7;
  return result;
}

@end
