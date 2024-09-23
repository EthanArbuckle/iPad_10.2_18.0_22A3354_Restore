@implementation UIPressAndHoldPopoverController

- (UIPressAndHoldPopoverController)initWithKeyString:(id)a3
{
  id v4;
  UIPressAndHoldPopoverController *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  TUIPressAndHoldView *pressAndHoldView;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UIPressAndHoldPopoverController;
  v5 = -[UIKeyboardPopoverController init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(getTUIPressAndHoldViewClass(), "requiredPopoverSizeForKeyString:", v4);
    v7 = v6;
    v9 = v8;
    v10 = objc_msgSend(objc_alloc((Class)getTUIPressAndHoldViewClass()), "initWithFrame:keyString:", v4, 0.0, 0.0, v6, v8);
    pressAndHoldView = v5->_pressAndHoldView;
    v5->_pressAndHoldView = (TUIPressAndHoldView *)v10;

    -[TUIPressAndHoldView setDelegate:](v5->_pressAndHoldView, "setDelegate:", v5);
    -[UIKeyboardPopoverController setContentView:](v5, "setContentView:", v5->_pressAndHoldView);
    -[UIViewController setPreferredContentSize:](v5, "setPreferredContentSize:", v7, v9);
  }

  return v5;
}

- (BOOL)handleHardwareKeyboardEvent:(id)a3
{
  id v4;
  UIKey *v5;

  v4 = a3;
  v5 = -[UIKey initWithKeyboardEvent:]([UIKey alloc], "initWithKeyboardEvent:", v4);
  LOBYTE(self) = -[UIPressAndHoldPopoverController handleKeyInputForPressAndHoldSelector:](self, "handleKeyInputForPressAndHoldSelector:", v4);

  return (char)self;
}

+ (BOOL)canPresentPressAndHoldPopoverForEvent:(id)a3
{
  id v3;
  id TUIPressAndHoldViewClass;
  void *v5;
  void *v6;

  v3 = a3;
  TUIPressAndHoldViewClass = getTUIPressAndHoldViewClass();
  objc_msgSend(v3, "_modifiedInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(TUIPressAndHoldViewClass, "accentedCharactersForKeyString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(TUIPressAndHoldViewClass) = objc_msgSend(v6, "count") != 0;

  return (char)TUIPressAndHoldViewClass;
}

+ (BOOL)canPresentPressAndHoldPopoverForKeyString:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(getTUIPressAndHoldViewClass(), "accentedCharactersForKeyString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "count") != 0;
  return (char)v3;
}

- (BOOL)isSamePressAndHoldPopoverForKeyString:(id)a3
{
  TUIPressAndHoldView *pressAndHoldView;
  id v4;
  void *v5;
  char v6;

  pressAndHoldView = self->_pressAndHoldView;
  if (!pressAndHoldView)
    return 0;
  v4 = a3;
  -[TUIPressAndHoldView currentKeyString](pressAndHoldView, "currentKeyString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (BOOL)handleKeyInputForPressAndHoldSelector:(id)a3
{
  id v4;
  uint64_t IntegerValue;
  BOOL v6;
  TUIPressAndHoldView *pressAndHoldView;
  void *v8;

  v4 = a3;
  if (!objc_msgSend(v4, "_keyCode"))
  {
    v6 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v4, "_hidEvent");
  IntegerValue = IOHIDEventGetIntegerValue();
  if (objc_msgSend(v4, "_keyCode") != 40)
  {
    if (IntegerValue == 7
      && (objc_msgSend(v4, "_keyCode") >= 30 && objc_msgSend(v4, "_keyCode") < 39
       || objc_msgSend(v4, "_keyCode") >= 89 && objc_msgSend(v4, "_keyCode") <= 97))
    {
      pressAndHoldView = self->_pressAndHoldView;
      objc_msgSend(v4, "_modifiedInput");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(pressAndHoldView) = -[TUIPressAndHoldView handleNumberKey:](pressAndHoldView, "handleNumberKey:", (int)objc_msgSend(v8, "intValue"));

      if ((pressAndHoldView & 1) != 0)
        goto LABEL_4;
    }
LABEL_12:
    v6 = -[UIPressAndHoldPopoverController handleKeyInputForAccentSelector:](self, "handleKeyInputForAccentSelector:", v4);
    goto LABEL_13;
  }
  if (!-[UIPressAndHoldPopoverController handleSelectionEvent:](self, "handleSelectionEvent:", v4))
    goto LABEL_12;
LABEL_4:
  v6 = 1;
LABEL_13:

  return v6;
}

- (BOOL)handleSelectionEvent:(id)a3
{
  void *v4;

  if ((-[TUIPressAndHoldView pressAndHoldGridHasSelectedIndexPath](self->_pressAndHoldView, "pressAndHoldGridHasSelectedIndexPath", a3) & 1) != 0)
  {
    -[TUIPressAndHoldView handleSelection](self->_pressAndHoldView, "handleSelection");
  }
  else
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissPressAndHoldPopover");

  }
  return 1;
}

- (BOOL)handleKeyInputForAccentSelector:(id)a3
{
  uint64_t v4;
  BOOL v5;
  void *v6;

  v4 = objc_msgSend(a3, "_keyCode");
  v5 = 0;
  if (v4 > 223)
  {
    if ((unint64_t)(v4 - 224) < 8)
      return v5;
    goto LABEL_15;
  }
  if (v4 <= 79)
  {
    switch(v4)
    {
      case '+':
        goto LABEL_6;
      case '9':
        return v5;
      case 'O':
LABEL_6:
        v5 = 1;
        if (-[UIPressAndHoldPopoverController hasAccentVariantInForwardDirection:](self, "hasAccentVariantInForwardDirection:", 1))
        {
          -[UIPressAndHoldPopoverController showAccentVariantInForwardDirection:](self, "showAccentVariantInForwardDirection:", 1);
        }
        return v5;
    }
LABEL_15:
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissPressAndHoldPopover");

    return 0;
  }
  if ((unint64_t)(v4 - 127) < 4)
    return v5;
  if (v4 != 80)
    goto LABEL_15;
  if (-[UIPressAndHoldPopoverController hasAccentVariantInForwardDirection:](self, "hasAccentVariantInForwardDirection:", 0))
  {
    -[UIPressAndHoldPopoverController showAccentVariantInForwardDirection:](self, "showAccentVariantInForwardDirection:", 0);
  }
  return 1;
}

- (BOOL)hasAccentVariantInForwardDirection:(BOOL)a3
{
  return -[TUIPressAndHoldView hasAccentVariantInForwardDirection:](self->_pressAndHoldView, "hasAccentVariantInForwardDirection:", a3);
}

- (void)showAccentVariantInForwardDirection:(BOOL)a3
{
  id v4;

  -[TUIPressAndHoldView showAccentVariantInForwardDirection:](self->_pressAndHoldView, "showAccentVariantInForwardDirection:", a3);
  -[TUIPressAndHoldView selectedAccentVariant](self->_pressAndHoldView, "selectedAccentVariant");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIPressAndHoldPopoverController insertSelectedAccentVariant:shouldDismissPopover:](self, "insertSelectedAccentVariant:shouldDismissPopover:", v4, 0);

}

- (void)pressAndHoldViewDidAcceptAccentVariant:(id)a3 atIndexPath:(id)a4
{
  -[UIPressAndHoldPopoverController insertSelectedAccentVariant:shouldDismissPopover:](self, "insertSelectedAccentVariant:shouldDismissPopover:", a3, 1);
}

- (void)insertSelectedAccentVariant:(id)a3 shouldDismissPopover:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;

  v4 = a4;
  v5 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertedAccentVariantFromPopover:", v5);

  if (v4)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dismissPressAndHoldPopover");

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pressAndHoldView, 0);
}

@end
