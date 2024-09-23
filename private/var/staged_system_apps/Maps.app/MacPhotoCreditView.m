@implementation MacPhotoCreditView

- (void)didMoveToWindow
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MacPhotoCreditView;
  -[MacPhotoCreditView didMoveToWindow](&v14, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MacPhotoCreditView window](self, "window"));
  objc_msgSend(v3, "setCanResizeToFitContent:", 1);

  -[MacPhotoCreditView systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  v5 = v4;
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MacPhotoCreditView window](self, "window"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "windowScene"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sizeRestrictions"));
  objc_msgSend(v10, "setMinimumSize:", v5, v7);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MacPhotoCreditView window](self, "window"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "windowScene"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sizeRestrictions"));
  objc_msgSend(v13, "setMaximumSize:", v5, v7);

}

@end
