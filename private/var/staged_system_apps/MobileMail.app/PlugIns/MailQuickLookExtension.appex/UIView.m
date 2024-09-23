@implementation UIView

- (BOOL)mf_prefersRightToLeftInterfaceLayout
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B6E0;
  block[3] = &unk_1000349C8;
  block[4] = self;
  if (qword_10003FBC0 != -1)
    dispatch_once(&qword_10003FBC0, block);
  return byte_10003FBB8;
}

- (void)mf_applyingConversationMessageShadow:(BOOL)a3 shouldRoundCorners:(BOOL)a4 cornerRadius:(double)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v5 = a4;
  v6 = a3;
  v17 = (id)objc_claimAutoreleasedReturnValue(-[UIView traitCollection](self, "traitCollection"));
  v8 = objc_msgSend(v17, "userInterfaceStyle");

  if (v6 && v8 == (id)1)
  {
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemBlackColor](UIColor, "systemBlackColor")));
    v9 = objc_msgSend(v18, "CGColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
    objc_msgSend(v10, "setShadowColor:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
    LODWORD(v12) = 1036831949;
    v19 = v11;
    objc_msgSend(v11, "setShadowOpacity:", v12);

    v20 = (id)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
    objc_msgSend(v20, "setShadowOffset:", 0.0, 2.0);

    v21 = (id)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
    objc_msgSend(v21, "setShadowRadius:", 8.0);

    v22 = (id)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
    objc_msgSend(v22, "setMasksToBounds:", 0);

    -[UIView bounds](self, "bounds");
    if (v5)
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:")));
    else
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:")));
    v13 = objc_msgSend(v23, "CGPath");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
    objc_msgSend(v14, "setShadowPath:", v13);

  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
    LODWORD(v16) = 0;
    v23 = v15;
    objc_msgSend(v15, "setShadowOpacity:", v16);
  }

}

- (void)mf_setAlpha:(double)a3
{
  double v5;
  double v6;

  -[UIView alpha](self, "alpha");
  v6 = v5 - a3;
  if (v6 < 0.0)
    v6 = -v6;
  if (v6 >= 2.22044605e-16)
    -[UIView setAlpha:](self, "setAlpha:", a3);
}

@end
