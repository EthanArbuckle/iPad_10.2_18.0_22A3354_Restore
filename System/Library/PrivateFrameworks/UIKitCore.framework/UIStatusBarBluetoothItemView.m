@implementation UIStatusBarBluetoothItemView

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  char v4;
  _BOOL4 v6;

  v4 = a4;
  v6 = *(_BYTE *)(objc_msgSend(a3, "rawData") + 2529) & 1;
  if (v6 != self->_connected)
  {
    self->_connected = v6;
    -[UIStatusBarBluetoothItemView setVisible:](self, "setVisible:", -[UIStatusBarItemView isVisible](self, "isVisible"));
  }
  if ((v4 & 2) != 0)
    self->_shouldAnimateConnection = 1;
  return 0;
}

- (void)performPendedActions
{
  _QWORD v3[5];
  _QWORD v4[5];

  if (self->_shouldAnimateConnection && self->_connected)
  {
    -[UIStatusBarBluetoothItemView alphaForConnected:](self, "alphaForConnected:", 0);
    -[UIView setAlpha:](self, "setAlpha:");
    -[UIStatusBarItemView beginDisablingRasterization](self, "beginDisablingRasterization");
    v3[4] = self;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __52__UIStatusBarBluetoothItemView_performPendedActions__block_invoke;
    v4[3] = &unk_1E16B1B28;
    v4[4] = self;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __52__UIStatusBarBluetoothItemView_performPendedActions__block_invoke_3;
    v3[3] = &unk_1E16B3FD8;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 16, v4, v3, 0.15, 0.0);
  }
  self->_shouldAnimateConnection = 0;
}

uint64_t __52__UIStatusBarBluetoothItemView_performPendedActions__block_invoke(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __52__UIStatusBarBluetoothItemView_performPendedActions__block_invoke_2;
  v2[3] = &unk_1E16B1B28;
  v2[4] = *(_QWORD *)(a1 + 32);
  return +[UIView modifyAnimationsWithRepeatCount:autoreverses:animations:](UIView, "modifyAnimationsWithRepeatCount:autoreverses:animations:", 0, v2, 4.5);
}

uint64_t __52__UIStatusBarBluetoothItemView_performPendedActions__block_invoke_2(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "alphaForConnected:", 1);
  return objc_msgSend(v1, "setAlpha:");
}

uint64_t __52__UIStatusBarBluetoothItemView_performPendedActions__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endDisablingRasterization");
}

- (id)contentsImage
{
  return -[UIStatusBarItemView imageWithShadowNamed:](self, "imageWithShadowNamed:", CFSTR("Bluetooth"));
}

- (void)setVisible:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIStatusBarBluetoothItemView;
  -[UIStatusBarItemView setVisible:](&v6, sel_setVisible_);
  v5 = 0.0;
  if (v3)
    -[UIStatusBarBluetoothItemView alphaForConnected:](self, "alphaForConnected:", self->_connected, 0.0);
  -[UIView setAlpha:](self, "setAlpha:", v5);
}

- (double)alphaForConnected:(BOOL)a3
{
  double result;

  result = 0.4;
  if (a3)
    return 1.0;
  return result;
}

- (id)accessibilityHUDRepresentation
{
  UIAccessibilityHUDItem *v3;
  void *v4;
  void *v5;
  UIAccessibilityHUDItem *v6;

  v3 = [UIAccessibilityHUDItem alloc];
  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityHUDImageNamed:", CFSTR("Bluetooth"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:scaleImage:](v3, "initWithTitle:image:imageInsets:scaleImage:", 0, v5, 1, 0.0, 0.0, 0.0, 0.0);

  -[UIAccessibilityHUDItem setDisabledAppearance:](v6, "setDisabledAppearance:", !self->_connected);
  return v6;
}

@end
