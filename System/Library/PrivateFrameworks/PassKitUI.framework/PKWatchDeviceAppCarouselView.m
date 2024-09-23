@implementation PKWatchDeviceAppCarouselView

- (PKWatchDeviceAppCarouselView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PKWatchDeviceAppCarouselView *v7;
  PKWatchHeroImageView *v8;
  PKWatchHeroImageView *watchDeviceImageView;
  id v10;
  void *v11;
  uint64_t v12;
  UIImageView *carouselImageView;
  uint64_t v14;
  UIImageView *appIconImageView;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)PKWatchDeviceAppCarouselView;
  v7 = -[PKWatchDeviceAppCarouselView initWithFrame:](&v17, sel_initWithFrame_);
  if (v7)
  {
    v8 = -[PKWatchHeroImageView initWithFrame:]([PKWatchHeroImageView alloc], "initWithFrame:", x, y, width, height);
    watchDeviceImageView = v7->_watchDeviceImageView;
    v7->_watchDeviceImageView = v8;

    -[PKWatchHeroImageView setHideDoneLabel:](v7->_watchDeviceImageView, "setHideDoneLabel:", 1);
    -[PKWatchDeviceAppCarouselView addSubview:](v7, "addSubview:", v7->_watchDeviceImageView);
    v10 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[PKWatchDeviceAppCarouselView _carouselViewImage](v7, "_carouselViewImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithImage:", v11);
    carouselImageView = v7->_carouselImageView;
    v7->_carouselImageView = (UIImageView *)v12;

    -[UIImageView setContentMode:](v7->_carouselImageView, "setContentMode:", 1);
    -[PKWatchHeroImageView addSubview:](v7->_watchDeviceImageView, "addSubview:", v7->_carouselImageView);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", x, y, width, height);
    appIconImageView = v7->_appIconImageView;
    v7->_appIconImageView = (UIImageView *)v14;

    -[UIImageView setContentMode:](v7->_appIconImageView, "setContentMode:", 1);
    -[PKWatchHeroImageView addSubview:](v7->_watchDeviceImageView, "addSubview:", v7->_appIconImageView);
  }
  return v7;
}

- (void)setAppIconImage:(id)a3
{
  -[UIImageView setImage:](self->_appIconImageView, "setImage:", a3);
}

- (void)layoutSubviews
{
  UIImageView *carouselImageView;
  UIImageView *appIconImageView;
  UIImageView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKWatchDeviceAppCarouselView;
  -[PKWatchDeviceAppCarouselView layoutSubviews](&v10, sel_layoutSubviews);
  -[PKWatchDeviceAppCarouselView bounds](self, "bounds");
  -[PKWatchHeroImageView setFrame:](self->_watchDeviceImageView, "setFrame:");
  carouselImageView = self->_carouselImageView;
  -[PKWatchHeroImageView watchScreenFrame](self->_watchDeviceImageView, "watchScreenFrame");
  -[UIImageView setFrame:](carouselImageView, "setFrame:");
  appIconImageView = self->_appIconImageView;
  -[PKWatchHeroImageView watchScreenCenter](self->_watchDeviceImageView, "watchScreenCenter");
  -[UIImageView setCenter:](appIconImageView, "setCenter:");
  v5 = self->_appIconImageView;
  v6 = *MEMORY[0x1E0C9D538];
  v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PKWatchDeviceAppCarouselView _appIconSize](self, "_appIconSize");
  -[UIImageView setFrame:](v5, "setFrame:", v6, v7, v8, v9);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKWatchHeroImageView sizeThatFits:](self->_watchDeviceImageView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)_carouselViewImage
{
  unint64_t v2;
  void *v3;

  v2 = +[PKBridgeWatchAttributeController heroWatchSize](PKBridgeWatchAttributeController, "heroWatchSize");
  if (v2 > 4)
  {
    v3 = 0;
  }
  else
  {
    PKUIImageNamed(off_1E3E71B78[v2]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (CGSize)_appIconSize
{
  unint64_t v3;
  double v4;
  double v5;
  double *v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = +[PKBridgeWatchAttributeController heroWatchSize](PKBridgeWatchAttributeController, "heroWatchSize");
  PKScreenScale();
  v5 = 0.0;
  if (v3 <= 4)
  {
    v6 = (double *)&unk_19DF16DF0;
    if (v4 > 2.0)
      v6 = (double *)&unk_19DF16DC8;
    v5 = v6[v3];
  }
  -[PKWatchHeroImageView watchDeviceImageScaleFactor](self->_watchDeviceImageView, "watchDeviceImageScaleFactor");
  v8 = v5 * v7;
  v9 = v8;
  result.height = v9;
  result.width = v8;
  return result;
}

- (UIImage)appIconImage
{
  return self->_appIconImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIconImage, 0);
  objc_storeStrong((id *)&self->_appIconImageView, 0);
  objc_storeStrong((id *)&self->_carouselImageView, 0);
  objc_storeStrong((id *)&self->_watchDeviceImageView, 0);
}

@end
