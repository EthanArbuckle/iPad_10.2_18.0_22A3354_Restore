@implementation MapsBannerContent

- (MapsBannerContent)initWithHeaderView:(id)a3 iconView:(id)a4 leadingTopView:(id)a5 trailingTopView:(id)a6 bottomView:(id)a7 footerView:(id)a8
{
  id v15;
  id v16;
  id v17;
  MapsBannerContent *v18;
  MapsBannerContent *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)MapsBannerContent;
  v18 = -[MapsBannerContent init](&v24, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_headerView, a3);
    objc_storeStrong((id *)&v19->_iconView, a4);
    objc_storeStrong((id *)&v19->_leadingTopView, a5);
    objc_storeStrong((id *)&v19->_trailingTopView, a6);
    objc_storeStrong((id *)&v19->_bottomView, a7);
    objc_storeStrong((id *)&v19->_footerView, a8);
  }

  return v19;
}

- (NSArray)allViews
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = v3;
  if (self->_headerView)
    objc_msgSend(v3, "addObject:");
  if (self->_iconView)
    objc_msgSend(v4, "addObject:");
  objc_msgSend(v4, "addObject:", self->_leadingTopView);
  if (self->_trailingTopView)
    objc_msgSend(v4, "addObject:");
  if (self->_bottomView)
    objc_msgSend(v4, "addObject:");
  if (self->_footerView)
    objc_msgSend(v4, "addObject:");
  v5 = objc_msgSend(v4, "copy");

  return (NSArray *)v5;
}

- (NSObject)visibilityFingerprint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[6];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[UIView isHidden](self->_headerView, "isHidden")));
  v11[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[UIView isHidden](self->_iconView, "isHidden")));
  v11[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[UIView isHidden](self->_leadingTopView, "isHidden")));
  v11[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[UIView isHidden](self->_trailingTopView, "isHidden")));
  v11[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[UIView isHidden](self->_bottomView, "isHidden")));
  v11[4] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[UIView isHidden](self->_footerView, "isHidden")));
  v11[5] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 6));

  return v9;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (UIView)iconView
{
  return self->_iconView;
}

- (UIView)leadingTopView
{
  return self->_leadingTopView;
}

- (UIView)trailingTopView
{
  return self->_trailingTopView;
}

- (UIView)bottomView
{
  return self->_bottomView;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_bottomView, 0);
  objc_storeStrong((id *)&self->_trailingTopView, 0);
  objc_storeStrong((id *)&self->_leadingTopView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
