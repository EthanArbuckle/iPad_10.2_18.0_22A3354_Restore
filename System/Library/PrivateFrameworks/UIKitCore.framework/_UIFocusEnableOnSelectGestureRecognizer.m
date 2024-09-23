@implementation _UIFocusEnableOnSelectGestureRecognizer

- (_UIFocusEnableOnSelectGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _UIFocusEnableOnSelectGestureRecognizer *v4;
  _UIFocusEnableOnSelectGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIFocusEnableOnSelectGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[UIGestureRecognizer setAllowedPressTypes:](v4, "setAllowedPressTypes:", &unk_1E1A954B0);
    -[UIGestureRecognizer setAllowedTouchTypes:](v5, "setAllowedTouchTypes:", MEMORY[0x1E0C9AA60]);
  }
  return v5;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t IntegerValue;
  id v11;

  v11 = a4;
  -[UIGestureRecognizer view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_focusSystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "focusedItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    goto LABEL_4;
  objc_msgSend(v11, "_screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_capabilityForKey:", CFSTR("UIScreenCapabilityPrimaryInteractionModelKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "integerValue") & 1) == 0)
  {

LABEL_4:
    goto LABEL_5;
  }
  objc_msgSend(v11, "_hidEvent");
  IntegerValue = IOHIDEventGetIntegerValue();

  if (!IntegerValue)
  {
    v9 = 3;
    goto LABEL_6;
  }
LABEL_5:
  v9 = 5;
LABEL_6:
  -[UIGestureRecognizer setState:](self, "setState:", v9);

}

@end
