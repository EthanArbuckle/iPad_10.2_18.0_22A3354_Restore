@implementation DirectionsStepView

+ ($8452678F12DBC466148836A9D382CAFC)cellMetricsForIdiom:(SEL)a3
{
  double v5;
  double v6;
  double v7;

  if (a4 == 5)
  {
    _Q1 = xmmword_100E35010;
    v5 = 22.0;
    v6 = 5.0;
    v7 = 40.0;
  }
  else
  {
    __asm { FMOV            V1.2D, #15.0 }
    v5 = 30.0;
    v6 = 15.0;
    v7 = 60.0;
  }
  retstr->var0 = v6;
  retstr->var1 = v6;
  retstr->var2 = 17.0;
  retstr->var3 = v7;
  *(_QWORD *)&retstr->var4 = _Q1;
  *(_OWORD *)&retstr->var5 = _Q1;
  retstr->var7 = v5;
  retstr->var8 = v5;
  return result;
}

+ (double)_heightForRoadDescriptionViewWithStep:(id)a3 forWidth:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geoStep"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "roadDescriptions"));
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = objc_msgSend((id)objc_opt_class(a1), "_roadDescriptionsLabelForStep:width:", v6, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v11, "sizeThatFits:", a4, 1.79769313e308);
    v13 = v12;

  }
  else
  {
    v13 = 0.0;
  }

  return v13;
}

+ (double)_textWidthForWidth:(double)a3 withManeuver:(BOOL)a4 metrics:(id *)a5
{
  double result;

  result = a3 - a5->var4 - a5->var5;
  if (a4)
    return result - a5->var6 - a5->var7;
  return result;
}

+ (Class)_labelListViewClassForRoute:(id)a3 step:(id)a4
{
  return (Class)objc_opt_class(RouteMiddleStepLabelListView, a2);
}

+ (double)heightForWidth:(double)a3 route:(id)a4 step:(id)a5 idiom:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  _BOOL8 v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double result;
  _OWORD v22[4];
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v10 = a5;
  v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "geoStep"));
  v13 = objc_msgSend(v12, "maneuverType") != 0;

  v14 = objc_msgSend(a1, "_labelListViewClassForRoute:step:", v11, v10);
  v28 = 0;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(a1, "cellMetricsForIdiom:", a6);
  v22[2] = v26;
  v22[3] = v27;
  v23 = v28;
  v22[0] = v24;
  v22[1] = v25;
  objc_msgSend(a1, "_textWidthForWidth:withManeuver:metrics:", v13, v22, a3);
  v16 = v15;
  objc_msgSend(v14, "heightForWidth:route:step:idiom:", v11, v10, a6);
  v18 = v17;

  objc_msgSend(a1, "_heightForRoadDescriptionViewWithStep:forWidth:", v10, v16);
  v20 = v19;

  result = v20 + v18 + *(double *)&v24 + *((double *)&v24 + 1);
  if (result <= *((double *)&v25 + 1))
    return *((double *)&v25 + 1);
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  void *v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double Height;
  void *v50;
  id v51;
  MKMultiPartLabel *roadDescriptionLabel;
  _QWORD *v53;
  uint64_t v54;
  SimpleSignView *signView;
  void *v56;
  double MaxX;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  void *i;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _OWORD v77[4];
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;
  objc_super v84;
  _BYTE v85[128];
  _QWORD v86[2];
  _QWORD v87[3];
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;

  v84.receiver = self;
  v84.super_class = (Class)DirectionsStepView;
  -[DirectionsStepView layoutSubviews](&v84, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleSignView maneuverView](self->_signView, "maneuverView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "maneuverArtwork"));
  if (objc_msgSend(v4, "maneuver"))
  {

LABEL_4:
    v6 = 0;
    v7 = 1;
    goto LABEL_5;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleSignView shieldImage](self->_signView, "shieldImage"));

  if (v5)
    goto LABEL_4;
  v7 = !self->_alignLeftIfNoManeuverSign;
  v6 = 1;
LABEL_5:
  v83 = 0;
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v8 = (void *)objc_opt_class(self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepView traitCollection](self, "traitCollection"));
  v10 = objc_msgSend(v9, "userInterfaceIdiom");
  if (v8)
  {
    objc_msgSend(v8, "cellMetricsForIdiom:", v10);
  }
  else
  {
    v83 = 0;
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
  }

  -[DirectionsStepView bounds](self, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[NSLayoutConstraint constant](self->_trailingGuideWidth, "constant");
  v20 = v16 - v19;
  v21 = (void *)objc_opt_class(self);
  v77[2] = v81;
  v77[3] = v82;
  v78 = v83;
  v77[0] = v79;
  v77[1] = v80;
  objc_msgSend(v21, "_textWidthForWidth:withManeuver:metrics:", v7, v77, v20);
  v23 = v22;
  v88.origin.x = v12;
  v88.origin.y = v14;
  v88.size.width = v20;
  v88.size.height = v18;
  -[RouteStepLabelListView layoutToFitSize:](self->_labelListView, "layoutToFitSize:", v23, CGRectGetHeight(v88));
  -[RouteStepLabelListView frame](self->_labelListView, "frame");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v30 = *((double *)&v82 + 1) + *(double *)&v82;
  if (!v7)
    v30 = -0.0;
  v31 = *(double *)&v81 + v30;
  -[MKMultiPartLabel frame](self->_roadDescriptionLabel, "frame");
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MKMultiPartLabel superview](self->_roadDescriptionLabel, "superview"));
  v33 = 0.0;
  if (v32)
  {
    -[MKMultiPartLabel sizeThatFits:](self->_roadDescriptionLabel, "sizeThatFits:", v23, 1.79769313e308);
    v33 = v34;
  }

  -[DirectionsStepView bounds](self, "bounds");
  v68 = v35;
  v70 = v36;
  v67 = v37;
  v38 = *(double *)&v82 + *(double *)&v81 + *((double *)&v82 + 1);
  -[SimpleSignView setHidden:](self->_signView, "setHidden:", v6);
  v89.origin.x = v31;
  v89.origin.y = v25;
  v89.size.width = v27;
  v89.size.height = v29;
  v39 = CGRectGetHeight(v89) + 0.0;
  v90.origin.y = 0.0;
  v90.origin.x = v31;
  v90.size.width = v23;
  v90.size.height = v33;
  v72 = v23;
  v71 = v33;
  if (CGRectGetHeight(v90) > 0.00000011920929)
  {
    v91.origin.x = v31;
    v91.origin.y = v25;
    v91.size.width = v27;
    v91.size.height = v29;
    if (CGRectGetHeight(v91) > 0.00000011920929)
      v39 = v39 + 4.0;
    v92.origin.y = 0.0;
    v92.origin.x = v31;
    v92.size.width = v23;
    v92.size.height = v33;
    v39 = CGRectGetHeight(v92) + v39;
  }
  -[DirectionsStepView bounds](self, "bounds");
  v40 = (CGRectGetHeight(v93) - v39) * 0.5;
  v94.origin.x = v31;
  v94.origin.y = v40;
  v94.size.width = v27;
  v94.size.height = v29;
  v66 = CGRectGetMaxY(v94) + 4.0;
  -[SimpleSignView frame](self->_signView, "frame");
  v41 = v29;
  v42 = v27;
  v44 = v43;
  v46 = v45;
  v69 = round(v68 + (v38 - v43) * 0.5);
  v47 = round(v70 + (v67 - v45) * 0.5);
  if (sub_1002A8AA0(self) == 5)
  {
    v95.origin.x = v31;
    v95.origin.y = v40;
    v48 = v42;
    v95.size.width = v42;
    v95.size.height = v41;
    Height = CGRectGetHeight(v95);
    -[SimpleSignView frame](self->_signView, "frame");
    if (Height > CGRectGetHeight(v96))
      v47 = 10.0;
  }
  else
  {
    v48 = v42;
  }
  -[SimpleSignView setFrame:](self->_signView, "setFrame:", v69, v47, v44, v46);
  -[RouteStepLabelListView setFrame:](self->_labelListView, "setFrame:", v31, v40, v48, v41);
  -[MKMultiPartLabel setFrame:](self->_roadDescriptionLabel, "setFrame:", v31, v66, v72, v71);
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v51 = objc_msgSend(v50, "userInterfaceLayoutDirection");

  if (v51 == (id)1)
  {
    roadDescriptionLabel = self->_roadDescriptionLabel;
    if (roadDescriptionLabel)
    {
      v87[0] = self->_labelListView;
      v87[1] = roadDescriptionLabel;
      v87[2] = self->_signView;
      v53 = v87;
      v54 = 3;
    }
    else
    {
      signView = self->_signView;
      v86[0] = self->_labelListView;
      v86[1] = signView;
      v53 = v86;
      v54 = 2;
    }
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v53, v54));
    -[DirectionsStepView bounds](self, "bounds");
    MaxX = CGRectGetMaxX(v97);
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v58 = v56;
    v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v60; i = (char *)i + 1)
        {
          if (*(_QWORD *)v74 != v61)
            objc_enumerationMutation(v58);
          v63 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v63, "frame");
          objc_msgSend(v63, "setFrame:", MaxX - v64 - v65);
        }
        v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
      }
      while (v60);
    }

  }
}

- (void)setRoute:(id)a3 step:(id)a4 stepIndex:(unint64_t)a5 alignToLeftEdgeIfNoManeuverSign:(BOOL)a6 size:(int64_t)a7
{
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  id v15;
  objc_class *v16;
  uint64_t v17;
  RouteStepLabelListView *labelListView;
  RouteStepLabelListView *v19;
  RouteStepLabelListView *v20;
  void *v21;
  void *v22;
  id v23;
  SimpleSignView *v24;
  SimpleSignView *signView;
  void *v26;
  void *v27;
  id v28;
  id v29;
  MKMultiPartLabel *roadDescriptionLabel;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  MKMultiPartLabel *v37;
  UILayoutGuide *v38;
  UILayoutGuide *trailingViewGuide;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  NSLayoutConstraint *v44;
  NSLayoutConstraint *trailingGuideWidth;
  void *v46;
  void *v47;
  NSLayoutConstraint *v48;
  NSLayoutConstraint *trailingGuideToContentViewConstraint;
  NSMutableArray *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSLayoutConstraint *v56;
  NSMutableArray *v57;
  void *v58;
  DirectionsWaypoint *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  float v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  __int128 v74;
  _QWORD v75[4];
  CGRect v76;

  v11 = (unint64_t)a3;
  v12 = (unint64_t)a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v13, "userInterfaceIdiom") == (id)1)
  {

    goto LABEL_4;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v15 = objc_msgSend(v14, "userInterfaceIdiom");

  if (v15 == (id)5)
  {
LABEL_4:
    if (!(v11 | v12))
      goto LABEL_24;
  }
  self->_alignLeftIfNoManeuverSign = a6;
  v16 = (objc_class *)objc_msgSend((id)objc_opt_class(self), "_labelListViewClassForRoute:step:", v11, v12);
  v17 = objc_opt_class(self->_labelListView);
  labelListView = self->_labelListView;
  if (v16 == (objc_class *)v17)
  {
    -[RouteStepLabelListView setRoute:step:tableMode:](labelListView, "setRoute:step:tableMode:", v11, v12, 0);
  }
  else
  {
    -[RouteStepLabelListView removeFromSuperview](labelListView, "removeFromSuperview");
    v19 = (RouteStepLabelListView *)objc_msgSend([v16 alloc], "initWithRoute:step:tableMode:", v11, v12, 0);
    v20 = self->_labelListView;
    self->_labelListView = v19;

    -[LabelListView setTextAlignment:](self->_labelListView, "setTextAlignment:", +[NSLocale currentTextAlignment](NSLocale, "currentTextAlignment"));
    -[DirectionsStepView addSubview:](self, "addSubview:", self->_labelListView);
  }
  if (!self->_signView)
  {
    v74 = 0u;
    v21 = (void *)objc_opt_class(self);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepView traitCollection](self, "traitCollection"));
    v23 = objc_msgSend(v22, "userInterfaceIdiom");
    if (v21)
      objc_msgSend(v21, "cellMetricsForIdiom:", v23);
    else
      v74 = 0u;

    v24 = -[SimpleSignView initWithFrame:]([SimpleSignView alloc], "initWithFrame:", 0.0, 0.0, *((double *)&v74 + 1), 0.0);
    signView = self->_signView;
    self->_signView = v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepView signView](self, "signView"));
    -[DirectionsStepView addSubview:](self, "addSubview:", v26);

  }
  -[MKMultiPartLabel removeFromSuperview](self->_roadDescriptionLabel, "removeFromSuperview", a7);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v12, "geoStep"));
  v28 = objc_msgSend(v27, "roadDescriptionsCount");

  if (v28)
  {
    if (self->_roadDescriptionLabel)
    {
      v29 = objc_msgSend((id)objc_opt_class(self), "_multiPartAttributedStringForRoadDescriptionsInStep:", v12);
      roadDescriptionLabel = (MKMultiPartLabel *)objc_claimAutoreleasedReturnValue(v29);
      -[MKMultiPartLabel setMultiPartString:](self->_roadDescriptionLabel, "setMultiPartString:", roadDescriptionLabel);
    }
    else
    {
      -[DirectionsStepView bounds](self, "bounds");
      v32 = v31;
      -[NSLayoutConstraint constant](self->_trailingGuideWidth, "constant");
      v34 = v32 - v33;
      -[RouteStepLabelListView frame](self->_labelListView, "frame");
      v35 = v34 - CGRectGetMinX(v76);
      v36 = objc_msgSend((id)objc_opt_class(self), "_roadDescriptionsLabelForStep:width:", v12, v35);
      v37 = (MKMultiPartLabel *)objc_claimAutoreleasedReturnValue(v36);
      roadDescriptionLabel = self->_roadDescriptionLabel;
      self->_roadDescriptionLabel = v37;
    }

    -[DirectionsStepView addSubview:](self, "addSubview:", self->_roadDescriptionLabel);
  }
  v38 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  trailingViewGuide = self->_trailingViewGuide;
  self->_trailingViewGuide = v38;

  -[DirectionsStepView addLayoutGuide:](self, "addLayoutGuide:", self->_trailingViewGuide);
  v40 = (void *)objc_opt_class(self);
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepView traitCollection](self, "traitCollection"));
  v42 = objc_msgSend(v41, "userInterfaceIdiom");
  v72 = (void *)v12;
  v73 = (void *)v11;
  if (v40)
    objc_msgSend(v40, "cellMetricsForIdiom:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](self->_trailingViewGuide, "widthAnchor"));
  v44 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToConstant:", 0.0));
  trailingGuideWidth = self->_trailingGuideWidth;
  self->_trailingGuideWidth = v44;

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepView trailingAnchor](self, "trailingAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_trailingViewGuide, "trailingAnchor"));
  v48 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:constant:", v47, 0.0));
  trailingGuideToContentViewConstraint = self->_trailingGuideToContentViewConstraint;
  self->_trailingGuideToContentViewConstraint = v48;

  v50 = objc_opt_new(NSMutableArray);
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_trailingViewGuide, "topAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepView topAnchor](self, "topAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:", v51));
  v75[0] = v52;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_trailingViewGuide, "bottomAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepView bottomAnchor](self, "bottomAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v54));
  v56 = self->_trailingGuideToContentViewConstraint;
  v75[1] = v55;
  v75[2] = v56;
  v57 = v50;
  v75[3] = self->_trailingGuideWidth;
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v75, 4));
  -[NSMutableArray addObjectsFromArray:](v50, "addObjectsFromArray:", v58);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v50);
  v12 = (unint64_t)v72;
  v11 = (unint64_t)v73;
  v59 = sub_100BCA378(v72, v73);
  v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
  v61 = v60;
  if (v60)
  {
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "mapItemIfLoaded"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepView traitCollection](self, "traitCollection"));
    objc_msgSend(v63, "displayScale");
    v65 = +[MKMapItem _maps_markerImageForMapItem:scale:size:useMarkerFallback:](MKMapItem, "_maps_markerImageForMapItem:scale:size:useMarkerFallback:", v62, objc_msgSend((id)objc_opt_class(self), "signViewIconSize"), 1, v64);
    v66 = (void *)objc_claimAutoreleasedReturnValue(v65);

    -[DirectionsStepView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("DirectionsStepCell.Waypoint"));
  }
  else
  {
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepView _shieldImageFromStep:route:shieldSize:](self, "_shieldImageFromStep:route:shieldSize:", v72, v73, v70));
    v68 = objc_msgSend(v67, "image");
    objc_msgSend(v67, "contentScale");
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v68, 0, v69));
    -[DirectionsStepView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("DirectionsStepCell.Maneuver"));

  }
  -[DirectionsStepView _updateSignViewForStep:maneuverImage:route:](self, "_updateSignViewForStep:maneuverImage:route:", v72, v66, v73);
  -[DirectionsStepView setNeedsLayout](self, "setNeedsLayout");

LABEL_24:
}

- (void)_updateTrailingGuideToContentViewConstraintWithConstant:(double)a3
{
  -[NSLayoutConstraint setConstant:](self->_trailingGuideToContentViewConstraint, "setConstant:", a3);
}

- (void)setTrailingView:(id)a3
{
  UIView *v5;
  UIView **p_trailingView;
  UIView *trailingView;
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
  void *v19;
  void *v20;
  _QWORD v21[4];

  v5 = (UIView *)a3;
  p_trailingView = &self->_trailingView;
  trailingView = self->_trailingView;
  if (trailingView != v5)
  {
    -[UIView removeFromSuperview](trailingView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_trailingView, a3);
    -[UIView _mapkit_fittingSize](*p_trailingView, "_mapkit_fittingSize");
    -[NSLayoutConstraint setConstant:](self->_trailingGuideWidth, "setConstant:");
    if (*p_trailingView)
    {
      -[DirectionsStepView addSubview:](self, "addSubview:");
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](*p_trailingView, "topAnchor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_trailingViewGuide, "topAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintGreaterThanOrEqualToAnchor:", v19));
      v21[0] = v18;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](*p_trailingView, "bottomAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_trailingViewGuide, "bottomAnchor"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintLessThanOrEqualToAnchor:", v16));
      v21[1] = v8;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](*p_trailingView, "leadingAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_trailingViewGuide, "leadingAnchor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
      v21[2] = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](*p_trailingView, "trailingAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_trailingViewGuide, "trailingAnchor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
      v21[3] = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

    }
    -[DirectionsStepView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (id)_shieldImageFromStep:(id)a3 route:(id)a4 shieldSize:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  void *v17;
  int v18;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;

  v7 = a3;
  v8 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_1002FFF9C;
  v25 = sub_1002FFFAC;
  v26 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geoStep"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1002FFFB4;
  v20[3] = &unk_1011B10F8;
  v20[4] = &v27;
  v20[5] = &v21;
  objc_msgSend(v9, "shieldInfo:", v20);

  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geoStep"));
  if (objc_msgSend(v10, "maneuverType") == 12)
  {
    v11 = *((_DWORD *)v28 + 6);

    if (v11)
      goto LABEL_3;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geoStep"));
    if (!objc_msgSend(v12, "maneuverIsHighwayExit"))
    {
      v17 = 0;
      goto LABEL_8;
    }
    v18 = *((_DWORD *)v28 + 6);

    if (v18)
    {
LABEL_3:
      v10 = objc_alloc_init((Class)VKIconModifiers);
      objc_msgSend(v10, "setText:", v22[5]);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[VKIconManager sharedManager](VKIconManager, "sharedManager"));
      v13 = *((unsigned int *)v28 + 6);
      v14 = v22[5];
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v15, "scale");
      *(float *)&v16 = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageForDataID:text:contentScale:sizeGroup:modifiers:", v13, v14, a5, v10, v16));

LABEL_8:
      goto LABEL_9;
    }
  }
  v17 = 0;
LABEL_9:
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v17;
}

+ (id)_roadDescriptionsLabelForStep:(id)a3 width:(double)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)MKMultiPartLabel), "initWithFrame:", 0.0, 0.0, a4, 0.0);
  objc_msgSend(v7, "setNumberOfLines:", 0);
  objc_msgSend(v7, "setTextInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(objc_msgSend(a1, "_labelListViewClassForRoute:step:", 0, v6), "fontsForStrings:route:step:tableMode:", &off_101273068, 0, v6, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
  objc_msgSend(v7, "setFont:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_multiPartAttributedStringForRoadDescriptionsInStep:", v6));
  objc_msgSend(v7, "setMultiPartString:", v10);

  return v7;
}

+ (id)_multiPartAttributedStringForRoadDescriptionsInStep:(id)a3
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  NSAttributedStringKey v27;
  void *v28;
  _BYTE v29[128];

  v4 = a3;
  if (qword_1014D20B0 != -1)
    dispatch_once(&qword_1014D20B0, &stru_1011B1118);
  v5 = objc_alloc((Class)NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "geoStep"));
  v7 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "roadDescriptionsCount"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "geoStep"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "roadDescriptions"));

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "formattedDescription"));
        v27 = NSForegroundColorAttributeName;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "accentColor"));
        v17 = v16;
        if (!v16)
        {
          v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
          v17 = v3;
        }
        v28 = v17;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString _mapkit_attributedTransitStringForServerFormattedString:defaultAttributes:](NSAttributedString, "_mapkit_attributedTransitStringForServerFormattedString:defaultAttributes:", v15, v18));

        if (!v16)
        objc_msgSend(v7, "addObject:", v19);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v11);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MKMultiPartAttributedString multiPartAttributedStringWithComponents:repeatedSeparator:](MKMultiPartAttributedString, "multiPartAttributedStringWithComponents:repeatedSeparator:", v7, qword_1014D20B8));
  return v20;
}

- (void)_updateSignViewForStep:(id)a3 maneuverImage:(id)a4 route:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  GuidanceManeuverArtwork *v14;
  id v15;
  void *v16;
  GuidanceManeuverArtwork *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  _BYTE v28[496];
  _OWORD v29[31];
  _BYTE __dst[496];
  _OWORD __src[31];

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "drivingSide");
  -[DirectionsStepView _updateStyleValuesFromTheme](self, "_updateStyleValuesFromTheme");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "junction"));
  if (v10)
  {
    v11 = objc_alloc((Class)MKJunction);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "junction"));
    v13 = objc_msgSend(v11, "initWithJunction:", v12);

  }
  else
  {
    v13 = 0;
  }

  v14 = [GuidanceManeuverArtwork alloc];
  v15 = objc_msgSend(v7, "maneuverType");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "artworkOverride"));
  v17 = -[GuidanceManeuverArtwork initWithManeuver:junction:drivingSide:artworkDataSource:](v14, "initWithManeuver:junction:drivingSide:artworkDataSource:", v15, v13, v9, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleSignView maneuverView](self->_signView, "maneuverView"));
  objc_msgSend(v18, "setManeuverArtwork:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleSignView maneuverView](self->_signView, "maneuverView"));
  objc_msgSend(v19, "setFraming:", 1);

  v20 = (void *)objc_opt_class(self);
  if (v20)
    objc_msgSend(v20, "arrowMetrics");
  else
    memset(__src, 0, sizeof(__src));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleSignView maneuverView](self->_signView, "maneuverView"));
  memcpy(__dst, __src, sizeof(__dst));
  objc_msgSend(v21, "setArrowMetrics:", __dst);

  v22 = (void *)objc_opt_class(self);
  if (v22)
    objc_msgSend(v22, "junctionArrowMetrics");
  else
    memset(v29, 0, sizeof(v29));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleSignView maneuverView](self->_signView, "maneuverView"));
  memcpy(v28, v29, sizeof(v28));
  objc_msgSend(v23, "setJunctionArrowMetrics:", v28);

  if (objc_msgSend(v7, "isEVChargerStep"))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes evChargerStyleAttributes](GEOFeatureStyleAttributes, "evChargerStyleAttributes"));
    v25 = objc_msgSend((id)objc_opt_class(self), "signViewIconSize");
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v26, "scale");
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v24, v25, 0));
    -[SimpleSignView setShieldImage:](self->_signView, "setShieldImage:", v27);

  }
  else
  {
    -[SimpleSignView setShieldImage:](self->_signView, "setShieldImage:", v8);
  }

}

- (id)signView
{
  SimpleSignView *signView;
  void *v4;
  void *v5;
  id v6;
  SimpleSignView *v7;
  SimpleSignView *v8;
  __int128 v10;

  signView = self->_signView;
  if (!signView)
  {
    v10 = 0u;
    v4 = (void *)objc_opt_class(self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepView traitCollection](self, "traitCollection", (unsigned __int128)0, (unsigned __int128)0));
    v6 = objc_msgSend(v5, "userInterfaceIdiom");
    if (v4)
      objc_msgSend(v4, "cellMetricsForIdiom:", v6);
    else
      v10 = 0u;

    v7 = -[SimpleSignView initWithFrame:]([SimpleSignView alloc], "initWithFrame:", 0.0, 0.0, *((double *)&v10 + 1), 0.0);
    v8 = self->_signView;
    self->_signView = v7;

    -[SimpleSignView setManeuverViewEdgeInsets:](self->_signView, "setManeuverViewEdgeInsets:", 5.0, 5.0, 5.0, 5.0);
    signView = self->_signView;
  }
  return signView;
}

- (void)setIsSelectedRow:(BOOL)a3
{
  if (self->_isSelectedRow != a3)
  {
    self->_isSelectedRow = a3;
    -[DirectionsStepView _updateStyleValuesFromTheme](self, "_updateStyleValuesFromTheme");
  }
}

- (void)setIsDimmedStep:(BOOL)a3
{
  if (self->_isDimmedStep != a3)
  {
    self->_isDimmedStep = a3;
    -[DirectionsStepView _updateStyleValuesFromTheme](self, "_updateStyleValuesFromTheme");
  }
}

- (double)_dimAlpha
{
  void *v2;
  double v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepView traitCollection](self, "traitCollection"));
  v3 = dbl_100E35020[objc_msgSend(v2, "userInterfaceStyle") == (id)2];

  return v3;
}

- (void)_updateStyleValuesFromTheme
{
  double v3;
  id v4;
  _QWORD v5[5];

  if (self->_isDimmedStep)
    -[DirectionsStepView _dimAlpha](self, "_dimAlpha");
  else
    v3 = 1.0;
  -[SimpleSignView setAlpha:](self->_signView, "setAlpha:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[LabelListView labels](self->_labelListView, "labels"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003009CC;
  v5[3] = &unk_1011B1140;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);
  -[SimpleSignView updateStyleForTheme](self->_signView, "updateStyleForTheme");

}

- (id)_majorLabelColor
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  if (self->_isDimmedStep)
  {
    -[DirectionsStepView _dimAlpha](self, "_dimAlpha");
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorWithAlphaComponent:"));

    v3 = (void *)v4;
  }
  return v3;
}

- (id)_minorLabelColor
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  if (self->_isDimmedStep)
  {
    -[DirectionsStepView _dimAlpha](self, "_dimAlpha");
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorWithAlphaComponent:"));

    v3 = (void *)v4;
  }
  return v3;
}

+ ($84D9B426F26CE1F36C5948DD9DEACC84)arrowMetrics
{
  return +[SignStyle arrowMetricsForStyle:](SignStyle, "arrowMetricsForStyle:", 1);
}

+ ($84D9B426F26CE1F36C5948DD9DEACC84)junctionArrowMetrics
{
  return +[SignStyle junctionArrowMetricsForStyle:](SignStyle, "junctionArrowMetricsForStyle:", 1);
}

+ (unint64_t)signViewIconSize
{
  return 2;
}

+ (id)backgroundColorForIndex:(int64_t)a3
{
  return 0;
}

- (BOOL)isSelectedRow
{
  return self->_isSelectedRow;
}

- (UIView)trailingView
{
  return self->_trailingView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_roadDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_trailingViewGuide, 0);
  objc_storeStrong((id *)&self->_trailingGuideToContentViewConstraint, 0);
  objc_storeStrong((id *)&self->_trailingGuideWidth, 0);
  objc_storeStrong((id *)&self->_labelListView, 0);
  objc_storeStrong((id *)&self->_signView, 0);
}

@end
