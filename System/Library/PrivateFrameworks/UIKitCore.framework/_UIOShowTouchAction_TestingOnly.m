@implementation _UIOShowTouchAction_TestingOnly

- (BOOL)isPermitted
{
  return os_variant_has_internal_diagnostics();
}

- (_UIOShowTouchAction_TestingOnly)initWithPoint:(CGPoint)a3 inView:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _UIOShowTouchAction_TestingOnly *v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  +[_UIOServerActionOriginContext defaultOriginContext](_UIOServerActionOriginContext, "defaultOriginContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "setLayerReferencePoint:", x, y);
  objc_msgSend(v7, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setLayerId:", CALayerGetRenderId());
  v11 = -[_UIOServerAction initWithOriginContext:info:responder:](self, "initWithOriginContext:info:responder:", v9, 0, 0);

  return v11;
}

- (void)_removeIndicatorView
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55___UIOShowTouchAction_TestingOnly__removeIndicatorView__block_invoke;
  v3[3] = &unk_1E16B1B28;
  v3[4] = self;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __55___UIOShowTouchAction_TestingOnly__removeIndicatorView__block_invoke_2;
  v2[3] = &unk_1E16B3FD8;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v3, v2, 0.3, 1.0);
}

- (void)performActionFromConnection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIView *v13;
  UIView *indicatorView;
  void *v15;
  void *v16;
  UIView *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  CGAffineTransform v20;
  CGAffineTransform v21;

  objc_msgSend(a3, "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayDelegateForAction:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "rootViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIOServerAction originContext](self, "originContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "translatedReferencePointForDestinationView:", v7);
  v10 = v9;
  v12 = v11;

  v13 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
  indicatorView = self->_indicatorView;
  self->_indicatorView = v13;

  -[UIView layer](self->_indicatorView, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCornerRadius:", 50.0);

  -[UIView setCenter:](self->_indicatorView, "setCenter:", v10, v12);
  +[UIColor redColor](UIColor, "redColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_indicatorView, "setBackgroundColor:", v16);

  objc_msgSend(v7, "addSubview:", self->_indicatorView);
  CGAffineTransformMakeScale(&v21, 4.0, 4.0);
  v17 = self->_indicatorView;
  v20 = v21;
  -[UIView setTransform:](v17, "setTransform:", &v20);
  -[UIView setAlpha:](self->_indicatorView, "setAlpha:", 0.0);
  v18[4] = self;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __63___UIOShowTouchAction_TestingOnly_performActionFromConnection___block_invoke;
  v19[3] = &unk_1E16B1B28;
  v19[4] = self;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __63___UIOShowTouchAction_TestingOnly_performActionFromConnection___block_invoke_2;
  v18[3] = &unk_1E16B3FD8;
  +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v19, v18, 0.6, 0.0, 1.0, 100.0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicatorView, 0);
}

@end
