@implementation UIView(UIKitExtras)

- (id)_maps_constraintsEqualToEdgesOfView:()UIKitExtras insets:priority:
{
  id v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;

  if (a8)
  {
    v14 = a8;
    objc_msgSend(a1, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v15 = a6;
    objc_msgSend(v32, "constraintEqualToAnchor:constant:priority:", v31, a2, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v18 = a6;
    objc_msgSend(v30, "constraintEqualToAnchor:constant:priority:", v17, a3, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v22 = a6;
    objc_msgSend(v20, "constraintEqualToAnchor:constant:priority:", v21, a4, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v26 = a6;
    objc_msgSend(v24, "constraintEqualToAnchor:constant:priority:", v25, a5, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[MapsEdgeConstraints edgeConstraintsWithTop:leading:bottom:trailing:](MapsEdgeConstraints, "edgeConstraintsWithTop:leading:bottom:trailing:", v16, v19, v23, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v28 = 0;
  }
  return v28;
}

@end
