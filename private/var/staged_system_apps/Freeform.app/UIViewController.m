@implementation UIViewController

- (CRLiOSWindowWrapper)crl_windowWrapper
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crl_windowWrapper"));

  return (CRLiOSWindowWrapper *)v3;
}

- (BOOL)crl_preserveEditorSelection
{
  return 0;
}

- (void)crl_adjustScrollIndicatorInsetsForTableView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  id v24;

  v24 = a3;
  if (+[UIDevice crl_phoneUI](UIDevice, "crl_phoneUI"))
  {
    objc_msgSend(v24, "horizontalScrollIndicatorInsets");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    objc_msgSend(v24, "verticalScrollIndicatorInsets");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v15 = !+[UIScreen crl_screenClassPhoneUIRegularOrLarge](UIScreen, "crl_screenClassPhoneUIRegularOrLarge")&& (id)+[UIScreen crl_screenClass](UIScreen, "crl_screenClass") != (id)2;
    if (!+[UIScreen crl_deviceIsLandscape](UIScreen, "crl_deviceIsLandscape") || v15)
    {
      v14 = UITableViewAutomaticDimension;
      v23 = UITableViewAutomaticDimension;
      v12 = UITableViewAutomaticDimension;
      v8 = UITableViewAutomaticDimension;
      v20 = UITableViewAutomaticDimension;
      v6 = UITableViewAutomaticDimension;
      v21 = v24;
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "superview"));
      objc_msgSend(v16, "safeAreaInsets");
      v18 = v17;

      +[UIScreen crl_screenZoomScale](UIScreen, "crl_screenZoomScale");
      v20 = floor(v18 / v19);
      +[UIScreen crl_screenZoomScale](UIScreen, "crl_screenZoomScale");
      v21 = v24;
      v23 = floor(v18 / v22);
    }
    objc_msgSend(v21, "setHorizontalScrollIndicatorInsets:", v4, v6, v20, v8);
    objc_msgSend(v24, "setVerticalScrollIndicatorInsets:", v10, v12, v23, v14);
  }

}

- (BOOL)crl_shouldUpdateNavigationContentSizeWithPreferredContentSize
{
  uint64_t v3;
  void *v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  UIViewController *v11;
  BOOL v12;
  BOOL v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController navigationController](self, "navigationController"));
  if (v4)
  {
    *(_QWORD *)&v5 = objc_opt_class(UINavigationController, v3).n128_u64[0];
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](self, "parentViewController", v5));
    v9 = sub_100221D0C(v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    v11 = (UIViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topViewController"));
    if (v10)
      v12 = v11 == self;
    else
      v12 = 0;
    v13 = v12;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)crl_updateContentSizePreservingPreviousWidthWithSize:(CGSize)a3
{
  return -[UIViewController crl_updateContentSizePreservingPreviousWidthWithSize:validateSize:](self, "crl_updateContentSizePreservingPreviousWidthWithSize:validateSize:", 0, a3.width, a3.height);
}

- (BOOL)crl_updateContentSizePreservingPreviousWidthWithSize:(CGSize)a3 validateSize:(id)a4
{
  double height;
  double width;
  double (**v7)(_QWORD, double, double);
  double v8;
  double v9;
  _BOOL4 v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  _BOOL4 v16;
  int v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  _QWORD *v22;
  _QWORD v24[7];

  height = a3.height;
  width = a3.width;
  v7 = (double (**)(_QWORD, double, double))a4;
  -[UIViewController preferredContentSize](self, "preferredContentSize");
  v10 = height != CGSizeZero.height || width != CGSizeZero.width;
  v11 = height != v9 || width != v8;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController navigationController](self, "navigationController"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController navigationController](self, "navigationController"));
    objc_msgSend(v13, "preferredContentSize");
    v16 = height != v15 || width != v14;

  }
  else
  {
    v16 = 0;
  }

  v17 = v10 && (v11 || v16);
  if (v17 == 1)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController navigationController](self, "navigationController"));
    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController navigationController](self, "navigationController"));
      objc_msgSend(v19, "preferredContentSize");
      width = v20;

    }
    if (v7)
    {
      width = v7[2](v7, width, height);
      height = v21;
    }
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100284330;
    v24[3] = &unk_10122EDB8;
    v24[4] = self;
    *(double *)&v24[5] = width;
    *(double *)&v24[6] = height;
    v22 = objc_retainBlock(v24);
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v22);

  }
  return v17;
}

- (BOOL)crl_canBeDismissed
{
  return 1;
}

@end
