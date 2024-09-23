@implementation UILayoutGuide

- (id)_maps_layoutGuideInsideEdgesWithPriority:(float)a3
{
  void *v5;
  id v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide owningView](self, "owningView"));
  if (v5)
  {
    v6 = objc_alloc_init((Class)UILayoutGuide);
    objc_msgSend(v5, "addLayoutGuide:", v6);
    if (a3 > 0.0)
    {
      *(float *)&v7 = a3;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide _maps_constraintsEqualToEdgesOfLayoutGuide:priority:](self, "_maps_constraintsEqualToEdgesOfLayoutGuide:priority:", v6, v7));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allConstraints"));
      objc_msgSend(v5, "addConstraints:", v9);

    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self, "topAnchor"));
    LODWORD(v10) = 1148846080;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintGreaterThanOrEqualToAnchor:constant:priority:", v26, 0.0, v10));
    v28[0] = v25;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self, "leadingAnchor"));
    LODWORD(v11) = 1148846080;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintGreaterThanOrEqualToAnchor:constant:priority:", v23, 0.0, v11));
    v28[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self, "bottomAnchor"));
    LODWORD(v15) = 1148846080;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintLessThanOrEqualToAnchor:constant:priority:", v14, 0.0, v15));
    v28[2] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self, "trailingAnchor"));
    LODWORD(v19) = 1148846080;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintLessThanOrEqualToAnchor:constant:priority:", v18, 0.0, v19));
    v28[3] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 4));
    objc_msgSend(v5, "addConstraints:", v21);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_maps_layoutGuidePinnedToEdgesWithRelation:(int64_t)a3 withPriority:(float)a4
{
  void *v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide owningView](self, "owningView", a3));
  if (v6)
  {
    v7 = objc_alloc_init((Class)UILayoutGuide);
    objc_msgSend(v6, "addLayoutGuide:", v7);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self, "topAnchor"));
    *(float *)&v8 = a4;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:priority:", v24, 0.0, v8));
    v26[0] = v23;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self, "leadingAnchor"));
    *(float *)&v9 = a4;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:priority:", v21, 0.0, v9));
    v26[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self, "bottomAnchor"));
    *(float *)&v13 = a4;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:priority:", v12, 0.0, v13));
    v26[2] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self, "trailingAnchor"));
    *(float *)&v17 = a4;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:priority:", v16, 0.0, v17));
    v26[3] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 4));
    objc_msgSend(v6, "addConstraints:", v19);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_maps_constraintsEqualToEdgesOfView:(id)a3 priority:(float)a4
{
  id v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;

  if (a3)
  {
    v6 = a3;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self, "topAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
    *(float *)&v7 = a4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:priority:", v23, 0.0, v7));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self, "leadingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
    *(float *)&v10 = a4;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:priority:", v9, 0.0, v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self, "bottomAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
    *(float *)&v14 = a4;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:constant:priority:", v13, 0.0, v14));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self, "trailingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));

    *(float *)&v18 = a4;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:priority:", v17, 0.0, v18));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MapsEdgeConstraints edgeConstraintsWithTop:leading:bottom:trailing:](MapsEdgeConstraints, "edgeConstraintsWithTop:leading:bottom:trailing:", v8, v11, v15, v19));

  }
  else
  {
    v20 = 0;
  }
  return v20;
}

- (id)_maps_constraintsEqualToEdgesOfLayoutGuide:(id)a3 priority:(float)a4
{
  id v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;

  if (a3)
  {
    v6 = a3;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self, "topAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
    *(float *)&v7 = a4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:priority:", v23, 0.0, v7));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self, "leadingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
    *(float *)&v10 = a4;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:priority:", v9, 0.0, v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self, "bottomAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
    *(float *)&v14 = a4;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:constant:priority:", v13, 0.0, v14));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self, "trailingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));

    *(float *)&v18 = a4;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:priority:", v17, 0.0, v18));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MapsEdgeConstraints edgeConstraintsWithTop:leading:bottom:trailing:](MapsEdgeConstraints, "edgeConstraintsWithTop:leading:bottom:trailing:", v8, v11, v15, v19));

  }
  else
  {
    v20 = 0;
  }
  return v20;
}

- (NSLayoutXAxisAnchor)_maps_leftRHDAnchor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide owningView](self, "owningView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  if (objc_msgSend(v4, "_car_isHybridInstrumentCluster"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide owningView](self, "owningView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
    v7 = objc_msgSend(v6, "_car_hybridInstrumentClusterAlignment") == (id)2;

  }
  else
  {
    v7 = 0;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
  v9 = objc_msgSend(v8, "rightHandDrive");

  if ((v9 & 1) != 0 || v7)
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide rightAnchor](self, "rightAnchor"));
  else
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leftAnchor](self, "leftAnchor"));
  return (NSLayoutXAxisAnchor *)v10;
}

- (NSLayoutXAxisAnchor)_maps_rightRHDAnchor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide owningView](self, "owningView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  if (objc_msgSend(v4, "_car_isHybridInstrumentCluster"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide owningView](self, "owningView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
    v7 = objc_msgSend(v6, "_car_hybridInstrumentClusterAlignment") == (id)2;

  }
  else
  {
    v7 = 0;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
  v9 = objc_msgSend(v8, "rightHandDrive");

  if ((v9 & 1) != 0 || v7)
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leftAnchor](self, "leftAnchor"));
  else
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide rightAnchor](self, "rightAnchor"));
  return (NSLayoutXAxisAnchor *)v10;
}

@end
