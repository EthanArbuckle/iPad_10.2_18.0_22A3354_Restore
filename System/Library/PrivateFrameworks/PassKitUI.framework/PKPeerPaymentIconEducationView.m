@implementation PKPeerPaymentIconEducationView

- (void)setShowWatchView:(BOOL)a3
{
  PKWatchDeviceImageOverlayView *watchDeviceImageView;
  PKWatchDeviceImageOverlayView *v5;
  PKWatchDeviceImageOverlayView *v6;
  PKWatchDeviceImageOverlayView *v7;
  void *v8;
  PKWatchDeviceImageOverlayView *v9;

  if (self->_showWatchView != a3)
  {
    self->_showWatchView = a3;
    watchDeviceImageView = self->_watchDeviceImageView;
    if (a3)
    {
      if (watchDeviceImageView)
        -[PKWatchDeviceImageOverlayView removeFromSuperview](watchDeviceImageView, "removeFromSuperview");
      v5 = objc_alloc_init(PKWatchDeviceImageOverlayView);
      v6 = self->_watchDeviceImageView;
      self->_watchDeviceImageView = v5;

      v7 = self->_watchDeviceImageView;
      -[PKPeerPaymentIconEducationView _imageForWatchView](self, "_imageForWatchView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKWatchDeviceImageOverlayView setOverlayImage:](v7, "setOverlayImage:", v8);

      -[PKPeerPaymentIconEducationView addSubview:](self, "addSubview:", self->_watchDeviceImageView);
    }
    else
    {
      -[PKWatchDeviceImageOverlayView removeFromSuperview](watchDeviceImageView, "removeFromSuperview");
      v9 = self->_watchDeviceImageView;
      self->_watchDeviceImageView = 0;

    }
    -[PKPeerPaymentIconEducationView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowIconsView:(BOOL)a3
{
  PKPaymentSetupInitialCardEducationIconsView *iconsView;
  PKPaymentSetupInitialCardEducationIconsView *v5;
  PKPaymentSetupInitialCardEducationIconsView *v6;
  PKPaymentSetupInitialCardEducationIconsView *v7;

  if (self->_showIconsView != a3)
  {
    self->_showIconsView = a3;
    iconsView = self->_iconsView;
    if (a3)
    {
      if (iconsView)
        -[PKPaymentSetupInitialCardEducationIconsView removeFromSuperview](iconsView, "removeFromSuperview");
      v5 = objc_alloc_init(PKPaymentSetupInitialCardEducationIconsView);
      v6 = self->_iconsView;
      self->_iconsView = v5;

      -[PKPaymentSetupInitialCardEducationIconsView sizeToFit](self->_iconsView, "sizeToFit");
      -[PKPeerPaymentIconEducationView addSubview:](self, "addSubview:", self->_iconsView);
    }
    else
    {
      -[PKPaymentSetupInitialCardEducationIconsView removeFromSuperview](iconsView, "removeFromSuperview");
      v7 = self->_iconsView;
      self->_iconsView = 0;

    }
    -[PKPeerPaymentIconEducationView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  objc_super v15;
  CGRect v16;

  v15.receiver = self;
  v15.super_class = (Class)PKPeerPaymentIconEducationView;
  -[PKPeerPaymentIconEducationView layoutSubviews](&v15, sel_layoutSubviews);
  -[PKPeerPaymentIconEducationView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[PKWatchDeviceImageOverlayView frame](self->_watchDeviceImageView, "frame");
  -[PKWatchDeviceImageOverlayView sizeThatFits:](self->_watchDeviceImageView, "sizeThatFits:", v4, v6);
  PKRectCenteredXInRect();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[PKWatchDeviceImageOverlayView setFrame:](self->_watchDeviceImageView, "setFrame:");
  -[PKPaymentSetupInitialCardEducationIconsView frame](self->_iconsView, "frame");
  v16.origin.x = v8;
  v16.origin.y = v10;
  v16.size.width = v12;
  v16.size.height = v14;
  CGRectGetMaxY(v16);
  PKRectCenteredXInRect();
  -[PKPaymentSetupInitialCardEducationIconsView setFrame:](self->_iconsView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PKPaymentSetupInitialCardEducationIconsView sizeThatFits:](self->_iconsView, "sizeThatFits:");
  v7 = v6;
  v9 = v8;
  -[PKWatchDeviceImageOverlayView sizeThatFits:](self->_watchDeviceImageView, "sizeThatFits:", width, height);
  v11 = fmax(v7, v10);
  v13 = fmax(v9, v12);
  result.height = v13;
  result.width = v11;
  return result;
}

- (id)_imageForWatchView
{
  unint64_t v2;
  void *v3;

  v2 = +[PKBridgeWatchAttributeController heroWatchSize](PKBridgeWatchAttributeController, "heroWatchSize");
  if (v2 <= 4)
  {
    PKUIImageNamed(off_1E3E755E0[v2]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)showWatchView
{
  return self->_showWatchView;
}

- (BOOL)showIconsView
{
  return self->_showIconsView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchDeviceImageView, 0);
  objc_storeStrong((id *)&self->_iconsView, 0);
}

@end
