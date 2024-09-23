@implementation UIStoryboardModalSegueTemplate

- (UIStoryboardModalSegueTemplate)initWithCoder:(id)a3
{
  id v4;
  UIStoryboardModalSegueTemplate *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIStoryboardModalSegueTemplate;
  v5 = -[UIStoryboardSegueTemplate initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIModalPresentationStyle")))
      v5->_modalPresentationStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIModalPresentationStyle"));
    else
      v5->_useDefaultModalPresentationStyle = 1;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIModalTransitionStyle")))
      v5->_modalTransitionStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIModalTransitionStyle"));
    else
      v5->_useDefaultModalTransitionStyle = 1;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIStoryboardModalSegueTemplate;
  -[UIStoryboardSegueTemplate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  if (!self->_useDefaultModalPresentationStyle)
    objc_msgSend(v4, "encodeInteger:forKey:", self->_modalPresentationStyle, CFSTR("UIModalPresentationStyle"));
  if (!self->_useDefaultModalTransitionStyle)
    objc_msgSend(v4, "encodeInteger:forKey:", self->_modalTransitionStyle, CFSTR("UIModalTransitionStyle"));

}

- (id)newDefaultPerformHandlerForSegue:(id)a3
{
  BOOL useDefaultModalPresentationStyle;
  void *modalPresentationStyle;
  BOOL useDefaultModalTransitionStyle;
  void *modalTransitionStyle;
  void *v7;
  _QWORD aBlock[4];
  id v10[3];
  BOOL v11;
  BOOL v12;
  id location;

  useDefaultModalPresentationStyle = self->_useDefaultModalPresentationStyle;
  modalPresentationStyle = (void *)self->_modalPresentationStyle;
  useDefaultModalTransitionStyle = self->_useDefaultModalTransitionStyle;
  modalTransitionStyle = (void *)self->_modalTransitionStyle;
  objc_initWeak(&location, a3);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__UIStoryboardModalSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke;
  aBlock[3] = &unk_1E16E3040;
  objc_copyWeak(v10, &location);
  v11 = useDefaultModalPresentationStyle;
  v12 = useDefaultModalTransitionStyle;
  v10[1] = modalPresentationStyle;
  v10[2] = modalTransitionStyle;
  v7 = _Block_copy(aBlock);
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
  return v7;
}

void __67__UIStoryboardModalSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (!*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(WeakRetained, "destinationViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setModalPresentationStyle:", *(_QWORD *)(a1 + 40));

    WeakRetained = v7;
  }
  if (!*(_BYTE *)(a1 + 57))
  {
    objc_msgSend(v7, "destinationViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setModalTransitionStyle:", *(_QWORD *)(a1 + 48));

    WeakRetained = v7;
  }
  objc_msgSend(WeakRetained, "sourceViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "destinationViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentModalViewController:animated:", v6, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));

}

- (BOOL)useDefaultModalPresentationStyle
{
  return self->_useDefaultModalPresentationStyle;
}

- (void)setUseDefaultModalPresentationStyle:(BOOL)a3
{
  self->_useDefaultModalPresentationStyle = a3;
}

- (BOOL)useDefaultModalTransitionStyle
{
  return self->_useDefaultModalTransitionStyle;
}

- (void)setUseDefaultModalTransitionStyle:(BOOL)a3
{
  self->_useDefaultModalTransitionStyle = a3;
}

- (int64_t)modalPresentationStyle
{
  return self->_modalPresentationStyle;
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  self->_modalPresentationStyle = a3;
}

- (int64_t)modalTransitionStyle
{
  return self->_modalTransitionStyle;
}

- (void)setModalTransitionStyle:(int64_t)a3
{
  self->_modalTransitionStyle = a3;
}

@end
