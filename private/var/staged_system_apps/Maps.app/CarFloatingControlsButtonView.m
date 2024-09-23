@implementation CarFloatingControlsButtonView

- (CarFloatingControlsButtonView)initWithFrame:(CGRect)a3
{
  CarFloatingControlsButtonView *v3;
  uint64_t v4;
  CarUserTrackingButton *userTrackingButton;
  Car3DButton *v6;
  Car3DButton *mode3DButton;
  void *v8;
  objc_super v10;
  _QWORD v11[2];

  v10.receiver = self;
  v10.super_class = (Class)CarFloatingControlsButtonView;
  v3 = -[CarMultiButtonView initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[CarUserTrackingButton buttonWithUserTrackingView:](CarUserTrackingButton, "buttonWithUserTrackingView:", 0));
    userTrackingButton = v3->_userTrackingButton;
    v3->_userTrackingButton = (CarUserTrackingButton *)v4;

    v6 = -[Car3DButton initWithFrame:]([Car3DButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    mode3DButton = v3->_mode3DButton;
    v3->_mode3DButton = v6;

    -[Car3DButton addTarget:action:forControlEvents:](v3->_mode3DButton, "addTarget:action:forControlEvents:", v3, "_pressed3DButton:", 64);
    -[CarFloatingControlsButtonView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("CarFloatingControlsButtonView"));
    v11[0] = v3->_userTrackingButton;
    v11[1] = v3->_mode3DButton;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
    -[CarMultiButtonView setButtons:](v3, "setButtons:", v8);

  }
  return v3;
}

- (void)setTrackingController:(id)a3
{
  -[CarUserTrackingButton setUserTrackingView:](self->_userTrackingButton, "setUserTrackingView:", a3);
}

- (void)_pressed3DButton:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarFloatingControlsButtonView delegate](self, "delegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "mode3DButtonPressed");

  if ((v5 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CarFloatingControlsButtonView delegate](self, "delegate"));
    objc_msgSend(v6, "mode3DButtonPressed");

  }
}

- (void)setEnableTrackingButton:(BOOL)a3
{
  if (self->_enableTrackingButton != a3)
  {
    self->_enableTrackingButton = a3;
    -[CarFloatingControlsButtonView _rebuild](self, "_rebuild");
  }
}

- (void)setEnable3DButton:(BOOL)a3
{
  if (self->_enable3DButton != a3)
  {
    self->_enable3DButton = a3;
    -[CarFloatingControlsButtonView _rebuild](self, "_rebuild");
  }
}

- (void)set3DButtonState:(unint64_t)a3
{
  -[Car3DButton setButtonState:](self->_mode3DButton, "setButtonState:", a3);
}

- (void)_rebuild
{
  id v3;
  id v4;

  v4 = objc_alloc_init((Class)NSMutableArray);
  if (-[CarFloatingControlsButtonView isTrackingButtonEnabled](self, "isTrackingButtonEnabled"))
    objc_msgSend(v4, "addObject:", self->_userTrackingButton);
  if (-[CarFloatingControlsButtonView is3DButtonEnabled](self, "is3DButtonEnabled"))
    objc_msgSend(v4, "addObject:", self->_mode3DButton);
  v3 = objc_msgSend(v4, "copy");
  -[CarMultiButtonView setButtons:](self, "setButtons:", v3);

}

- (NSArray)focusOrderSubItems
{
  NSMutableArray *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = objc_opt_new(NSMutableArray);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarMultiButtonView buttons](self, "buttons", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "canBecomeFocused"))
          -[NSMutableArray addObject:](v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (CarFloatingControlsButtonViewDelegate)delegate
{
  return (CarFloatingControlsButtonViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isTrackingButtonEnabled
{
  return self->_enableTrackingButton;
}

- (BOOL)is3DButtonEnabled
{
  return self->_enable3DButton;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mode3DButton, 0);
  objc_storeStrong((id *)&self->_userTrackingButton, 0);
}

@end
