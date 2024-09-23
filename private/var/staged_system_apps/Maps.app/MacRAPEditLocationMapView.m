@implementation MacRAPEditLocationMapView

- (MacRAPEditLocationMapView)initWithMapRect:(id)a3 viewMode:(int64_t)a4 markerViewAttributes:(id)a5
{
  MacRAPEditLocationMapView *v5;
  MacRAPEditLocationMapView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  MacRAPEditLocationMapView *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  objc_super v49;
  _QWORD v50[8];

  v49.receiver = self;
  v49.super_class = (Class)MacRAPEditLocationMapView;
  v5 = -[RAPEditLocationMapView initWithMapRect:viewMode:markerViewAttributes:](&v49, "initWithMapRect:viewMode:markerViewAttributes:", a4, a5, a3.var0.var0, a3.var0.var1, a3.var1.var0, a3.var1.var1);
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView floatingControlsView](v5, "floatingControlsView"));
    objc_msgSend(v7, "setHidden:", 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView descriptionView](v6, "descriptionView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));
    objc_msgSend(v9, "setCornerRadius:", 20.0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView descriptionView](v6, "descriptionView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
    objc_msgSend(v11, "setMasksToBounds:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MapsThemeButton buttonWithType:](MapsThemeButton, "buttonWithType:", 0));
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 20.0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v13, 2));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("map.fill"), v14));
    objc_msgSend(v12, "setImage:forState:", v15, 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
    objc_msgSend(v12, "setTintColor:", v16);

    objc_msgSend(v12, "setShowsMenuAsPrimaryAction:", 1);
    -[MacRAPEditLocationMapView setMapModeButton:](v6, "setMapModeButton:", v12);
    v17 = -[CardView initAllowingBlurredForButton:]([CardView alloc], "initAllowingBlurredForButton:", 1);
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v17, "setLayoutStyle:", 6);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "contentView"));
    objc_msgSend(v18, "addSubview:", v12);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](v6, "mapView"));
    objc_msgSend(v19, "addSubview:", v17);

    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "topAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v47));
    v50[0] = v46;
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bottomAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v43));
    v50[1] = v42;
    v45 = v12;
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "leadingAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
    v50[2] = v39;
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
    v50[3] = v36;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](v6, "mapView"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "bottomAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, -15.0));
    v50[4] = v32;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "widthAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToConstant:", 30.0));
    v50[5] = v30;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "widthAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "heightAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
    v50[6] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](v6, "mapView"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
    v26 = v6;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v25, -15.0));
    v50[7] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 8));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

    v6 = v26;
    -[MacRAPEditLocationMapView setupMenuActions](v26, "setupMenuActions");

  }
  return v6;
}

- (id)mapActionForViewMode:(int64_t)a3
{
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id result;
  _QWORD v11[4];
  id v12[2];
  id location;

  switch(a3)
  {
    case 0:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("Map [Standard Mode Title]");
      goto LABEL_6;
    case 2:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("Satellite");
      goto LABEL_6;
    case 3:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("View Mode Transit");
      goto LABEL_6;
    case 7:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("Driving");
LABEL_6:
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, CFSTR("localized string not found"), 0));

      if (!v8)
        goto LABEL_8;
      objc_initWeak(&location, self);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1006BFCCC;
      v11[3] = &unk_1011B8278;
      objc_copyWeak(v12, &location);
      v12[1] = (id)a3;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v8, 0, 0, v11));
      objc_msgSend(v9, "setState:", -[RAPEditLocationMapView viewMode](self, "viewMode") == a3);
      objc_destroyWeak(v12);
      objc_destroyWeak(&location);

      result = v9;
      break;
    default:
LABEL_8:
      result = 0;
      break;
  }
  return result;
}

- (void)setupMenuActions
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(&off_101273AB8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(&off_101273AB8);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPEditLocationMapView mapActionForViewMode:](self, "mapActionForViewMode:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v7), "unsignedIntValue")));
        objc_msgSend(v3, "addObject:", v8);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(&off_101273AB8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  v9 = objc_msgSend(v3, "copy");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", &stru_1011EB268, v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPEditLocationMapView mapModeButton](self, "mapModeButton"));
  objc_msgSend(v11, "setMenu:", v10);

}

- (void)setupDescriptionViewAndAdditionalConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[3];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView descriptionView](self, "descriptionView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](self, "mapView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v15, 30.0));
  v19[0] = v14;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView descriptionView](self, "descriptionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](self, "mapView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintLessThanOrEqualToAnchor:constant:", v5, -30.0));
  v19[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView descriptionView](self, "descriptionView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](self, "mapView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10, -15.0));
  v19[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (UIButton)mapModeButton
{
  return self->_mapModeButton;
}

- (void)setMapModeButton:(id)a3
{
  objc_storeStrong((id *)&self->_mapModeButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapModeButton, 0);
}

@end
