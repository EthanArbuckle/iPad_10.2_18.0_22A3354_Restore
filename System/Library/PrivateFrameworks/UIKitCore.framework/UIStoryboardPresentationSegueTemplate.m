@implementation UIStoryboardPresentationSegueTemplate

- (UIStoryboardPresentationSegueTemplate)initWithCoder:(id)a3
{
  id v4;
  UIStoryboardPresentationSegueTemplate *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIStoryboardPresentationSegueTemplate;
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
  v5.super_class = (Class)UIStoryboardPresentationSegueTemplate;
  -[UIStoryboardSegueTemplate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  if (!self->_useDefaultModalPresentationStyle)
    objc_msgSend(v4, "encodeInteger:forKey:", self->_modalPresentationStyle, CFSTR("UIModalPresentationStyle"));
  if (!self->_useDefaultModalTransitionStyle)
    objc_msgSend(v4, "encodeInteger:forKey:", self->_modalTransitionStyle, CFSTR("UIModalTransitionStyle"));

}

- (id)newDefaultPrepareHandlerForSegue:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  _QWORD aBlock[4];
  id v12[3];
  BOOL v13;
  BOOL v14;
  id location;

  v4 = a3;
  v5 = -[UIStoryboardPresentationSegueTemplate useDefaultModalPresentationStyle](self, "useDefaultModalPresentationStyle");
  v6 = -[UIStoryboardPresentationSegueTemplate modalPresentationStyle](self, "modalPresentationStyle");
  v7 = -[UIStoryboardPresentationSegueTemplate useDefaultModalTransitionStyle](self, "useDefaultModalTransitionStyle");
  v8 = -[UIStoryboardPresentationSegueTemplate modalTransitionStyle](self, "modalTransitionStyle");
  objc_initWeak(&location, v4);

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__UIStoryboardPresentationSegueTemplate_newDefaultPrepareHandlerForSegue___block_invoke;
  aBlock[3] = &unk_1E16E3040;
  objc_copyWeak(v12, &location);
  v13 = v5;
  v14 = v7;
  v12[1] = v6;
  v12[2] = v8;
  v9 = _Block_copy(aBlock);
  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
  return v9;
}

void __74__UIStoryboardPresentationSegueTemplate_newDefaultPrepareHandlerForSegue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!*(_BYTE *)(a1 + 56))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "destinationViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setModalPresentationStyle:", v3);

    WeakRetained = v7;
  }
  if (!*(_BYTE *)(a1 + 57))
  {
    v5 = *(_QWORD *)(a1 + 48);
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "destinationViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setModalTransitionStyle:", v5);

    WeakRetained = v8;
  }

}

- (id)newDefaultPerformHandlerForSegue:(id)a3
{
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, a3);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__UIStoryboardPresentationSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke;
  v5[3] = &unk_1E16B3F40;
  objc_copyWeak(&v6, &location);
  v3 = _Block_copy(v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __74__UIStoryboardPresentationSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "destinationViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_setSegueResponsibleForModalPresentation:", WeakRetained);
  objc_msgSend(WeakRetained, "sourceViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:animated:completion:", v1, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"), 0);

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
