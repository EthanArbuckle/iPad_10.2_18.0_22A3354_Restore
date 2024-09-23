@implementation MTDownloadsCancelReusableView

- (MTDownloadsCancelReusableView)initWithFrame:(CGRect)a3
{
  MTDownloadsCancelReusableView *v3;
  MTDownloadsCancelReusableView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTDownloadsCancelReusableView;
  v3 = -[MTDownloadsCancelReusableView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCancelReusableView cancelAllButton](v3, "cancelAllButton"));
    -[MTDownloadsCancelReusableView addSubview:](v4, "addSubview:", v5);

  }
  return v4;
}

- (UIButton)cancelAllButton
{
  UIButton *cancelAllButton;
  UIButton *v4;
  UIButton *v5;
  void *v6;
  void *v7;
  UIButton *v8;
  void *v9;
  void *v10;

  cancelAllButton = self->_cancelAllButton;
  if (!cancelAllButton)
  {
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    v5 = self->_cancelAllButton;
    self->_cancelAllButton = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont buttonFont](UIFont, "buttonFont"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_cancelAllButton, "titleLabel"));
    objc_msgSend(v7, "setFont:", v6);

    -[UIButton setAutoresizingMask:](self->_cancelAllButton, "setAutoresizingMask:", 45);
    v8 = self->_cancelAllButton;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Cancel Downloads"), &stru_1004C6D40, 0));
    -[UIButton setTitle:forState:](v8, "setTitle:forState:", v10, 0);

    -[UIButton sizeToFit](self->_cancelAllButton, "sizeToFit");
    cancelAllButton = self->_cancelAllButton;
  }
  return cancelAllButton;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTDownloadsCancelReusableView;
  -[MTDownloadsCancelReusableView layoutSubviews](&v12, "layoutSubviews");
  -[MTDownloadsCancelReusableView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCancelReusableView cancelAllButton](self, "cancelAllButton"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)setCancelAllButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelAllButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelAllButton, 0);
}

@end
