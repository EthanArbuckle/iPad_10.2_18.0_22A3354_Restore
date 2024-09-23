@implementation CRLiOSInsertPageViewControllerFadeView

- (CRLiOSInsertPageViewControllerFadeView)initWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 shouldAddDividerView:(BOOL)a5
{
  _BOOL4 v5;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double width;
  double height;
  CRLiOSInsertPageViewControllerFadeView *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  CRLiOSInspectorDividerView *v21;
  CRLiOSInspectorDividerView *line;
  objc_super v24;
  _QWORD v25[2];

  v5 = a5;
  y = a4.y;
  x = a4.x;
  v8 = a3.y;
  v9 = a3.x;
  v24.receiver = self;
  v24.super_class = (Class)CRLiOSInsertPageViewControllerFadeView;
  v10 = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v13 = -[CRLiOSInsertPageViewControllerFadeView initWithFrame:](&v24, "initWithFrame:", CGRectZero.origin.x, v10, width, height);
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CAGradientLayer layer](CAGradientLayer, "layer"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "colorWithAlphaComponent:", 0.0)));
    v25[0] = objc_msgSend(v16, "CGColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "colorWithAlphaComponent:", 1.0)));
    v25[1] = objc_msgSend(v18, "CGColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 2));
    objc_msgSend(v14, "setColors:", v19);

    objc_msgSend(v14, "setStartPoint:", v9, v8);
    objc_msgSend(v14, "setEndPoint:", x, y);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewControllerFadeView layer](v13, "layer"));
    objc_msgSend(v20, "setMask:", v14);

    if (v5)
    {
      v21 = -[CRLiOSInspectorDividerView initWithFrame:]([CRLiOSInspectorDividerView alloc], "initWithFrame:", CGRectZero.origin.x, v10, width, height);
      line = v13->_line;
      v13->_line = v21;

      -[CRLiOSInsertPageViewControllerFadeView addSubview:](v13, "addSubview:", v13->_line);
    }

  }
  return v13;
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
  void *v12;
  CGFloat v13;
  objc_super v14;
  CGRect v15;
  CGRect v16;

  v14.receiver = self;
  v14.super_class = (Class)CRLiOSInsertPageViewControllerFadeView;
  -[CRLiOSInsertPageViewControllerFadeView layoutSubviews](&v14, "layoutSubviews");
  -[CRLiOSInsertPageViewControllerFadeView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewControllerFadeView layer](self, "layer"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mask"));
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  if (self->_line)
  {
    v15.origin.x = v4;
    v15.origin.y = v6;
    v15.size.width = v8;
    v15.size.height = v10;
    v13 = CGRectGetHeight(v15) + -1.0;
    v16.origin.x = v4;
    v16.origin.y = v6;
    v16.size.width = v8;
    v16.size.height = v10;
    -[CRLiOSInspectorDividerView setFrame:](self->_line, "setFrame:", 0.0, v13, CGRectGetWidth(v16), 1.0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_line, 0);
}

@end
