@implementation _UIContextMenuActionsOnlyViewController

- (_UIContextMenuActionsOnlyViewController)initWithTargetedPreview:(id)a3
{
  id v4;
  _UIContextMenuActionsOnlyViewController *v5;
  _UIContextMenuActionsOnlyViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIContextMenuActionsOnlyViewController;
  v5 = -[UIViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
    -[_UIContextMenuActionsOnlyViewController setSourcePreview:](v5, "setSourcePreview:", v4);

  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIContextMenuActionsOnlyViewController;
  -[UIViewController viewDidLoad](&v5, sel_viewDidLoad);
  +[UIColor clearColor](UIColor, "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (CGSize)preferredContentSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float64x2_t v13;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v16;
  CGAffineTransform v17[2];
  CGSize result;

  -[_UIContextMenuActionsOnlyViewController sourcePreview](self, "sourcePreview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "target");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  memset(&v17[1], 0, sizeof(CGAffineTransform));
  if (v4)
    objc_msgSend(v4, "transform");
  memset(v17, 0, 48);
  objc_msgSend(v4, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "container");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _UIGetTransformBetweenViews(v5, v7, 1, (uint64_t)v17);

  t1 = v17[1];
  memset(&v16, 0, sizeof(v16));
  t2 = v17[0];
  CGAffineTransformConcat(&v16, &t1, &t2);
  t2 = v16;
  memset(&t1, 0, sizeof(t1));
  CGAffineTransformDecompose((CGAffineTransformComponents *)&t1, &t2);
  CGAffineTransformMakeScale(&t2, t1.a, t1.b);
  v16 = t2;
  -[_UIContextMenuActionsOnlyViewController sourcePreview](self, "sourcePreview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  v13 = vaddq_f64(vmulq_n_f64(*(float64x2_t *)&v16.a, v9), vmulq_n_f64(*(float64x2_t *)&v16.c, v10));

  v12 = v13.f64[1];
  v11 = v13.f64[0];
  result.height = v12;
  result.width = v11;
  return result;
}

- (BOOL)_defersToPresentingViewControllerForSupportedInterfaceOrientations
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UITargetedPreview)sourcePreview
{
  return self->_sourcePreview;
}

- (void)setSourcePreview:(id)a3
{
  objc_storeStrong((id *)&self->_sourcePreview, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourcePreview, 0);
}

@end
