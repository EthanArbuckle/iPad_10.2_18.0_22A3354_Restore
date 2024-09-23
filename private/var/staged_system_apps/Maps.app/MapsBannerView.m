@implementation MapsBannerView

- (MapsBannerView)initWithTarget:(id)a3 item:(id)a4 aperturePresentation:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  double y;
  double width;
  double height;
  MapsBannerView *v13;
  MapsBannerView *v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  MapsBannerContentView *v18;
  MapsBannerContentView *contentView;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL4 v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  objc_super v40;
  void *v41;
  void *v42;
  _QWORD v43[3];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v40.receiver = self;
  v40.super_class = (Class)MapsBannerView;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v13 = -[MapsBannerView initWithFrame:](&v40, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v14 = v13;
  if (v13)
  {
    v38 = v9;
    v15 = (objc_class *)objc_opt_class(v13);
    v16 = NSStringFromClass(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[MapsBannerView setAccessibilityIdentifier:](v14, "setAccessibilityIdentifier:", v17);

    v39 = v8;
    objc_storeWeak((id *)&v14->_target, v8);
    objc_storeStrong((id *)&v14->_item, a4);
    v14->_aperturePresentation = v5;
    v18 = -[MapsBannerContentView initWithFrame:]([MapsBannerContentView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    contentView = v14->_contentView;
    v14->_contentView = v18;

    -[MapsBannerContentView setTranslatesAutoresizingMaskIntoConstraints:](v14->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MapsBannerView addSubview:](v14, "addSubview:", v14->_contentView);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerContentView leadingAnchor](v14->_contentView, "leadingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerView leadingAnchor](v14, "leadingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v20, 20.0));
    v43[0] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerView trailingAnchor](v14, "trailingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerContentView trailingAnchor](v14->_contentView, "trailingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, 20.0));
    v43[1] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerView bottomAnchor](v14, "bottomAnchor"));
    v35 = v5;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerContentView bottomAnchor](v14->_contentView, "bottomAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, 17.0));
    v43[2] = v27;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 3));

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerContentView topAnchor](v14->_contentView, "topAnchor"));
    if (v35)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerView SBUISA_systemApertureObstructedAreaLayoutGuide](v14, "SBUISA_systemApertureObstructedAreaLayoutGuide"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bottomAnchor"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v30));
      v42 = v31;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v42, 1));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "arrayByAddingObjectsFromArray:", v32));

    }
    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerView topAnchor](v14, "topAnchor"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, 22.0));
      v41 = v30;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v41, 1));
      v32 = v37;
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "arrayByAddingObjectsFromArray:", v31));
    }

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v33);
    v9 = v38;
    v8 = v39;
  }

  return v14;
}

- (double)bannerAccessoryViewLeadingInset
{
  if (qword_1014D3D00 != -1)
    dispatch_once(&qword_1014D3D00, &stru_1011E0900);
  return *(double *)&qword_1014D3CF8;
}

- (double)bannerAccessoryViewTrailingInset
{
  if (qword_1014D3D10 != -1)
    dispatch_once(&qword_1014D3D10, &stru_1011E0920);
  return *(double *)&qword_1014D3D08;
}

- (BNBannerSource)target
{
  return (BNBannerSource *)objc_loadWeakRetained((id *)&self->_target);
}

- (BannerItem)item
{
  return self->_item;
}

- (BOOL)aperturePresentation
{
  return self->_aperturePresentation;
}

- (MapsBannerContentView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_destroyWeak((id *)&self->_target);
}

@end
