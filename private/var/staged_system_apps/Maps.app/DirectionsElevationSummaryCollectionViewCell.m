@implementation DirectionsElevationSummaryCollectionViewCell

- (DirectionsElevationSummaryCollectionViewCell)initWithFrame:(CGRect)a3
{
  DirectionsElevationSummaryCollectionViewCell *v3;
  void *v4;
  void *v5;
  void *v6;
  DirectionsElevationLabelSummaryView *v7;
  double y;
  double width;
  double height;
  DirectionsElevationLabelSummaryView *v11;
  DirectionsElevationLabelSummaryView *labelSummaryView;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  DirectionsElevationLabelSummaryView *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  objc_super v61;
  _QWORD v62[7];

  v61.receiver = self;
  v61.super_class = (Class)DirectionsElevationSummaryCollectionViewCell;
  v3 = -[DirectionsElevationSummaryCollectionViewCell initWithFrame:](&v61, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[DirectionsElevationSummaryCollectionViewCell setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationSummaryCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v6, "setBackgroundColor:", v5);

    v60 = objc_alloc_init((Class)NSMutableArray);
    v7 = [DirectionsElevationLabelSummaryView alloc];
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v11 = -[DirectionsElevationLabelSummaryView initWithFrame:](v7, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    labelSummaryView = v3->_labelSummaryView;
    v3->_labelSummaryView = v11;

    -[DirectionsElevationLabelSummaryView setTranslatesAutoresizingMaskIntoConstraints:](v3->_labelSummaryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationSummaryCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v13, "addSubview:", v3->_labelSummaryView);

    v14 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    objc_msgSend(v14, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (sub_1002A8AA0(v3) == 5)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
      objc_msgSend(v14, "setFont:", v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleBody));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fontDescriptorWithSymbolicTraits:", 2));

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v17, 0.0));
      v19 = v3->_labelSummaryView;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
      -[DirectionsElevationLabelSummaryView setFont:color:](v19, "setFont:color:", v18, v20);

    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
      objc_msgSend(v14, "setFont:", v17);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Total Elevation [Chart Header]"), CFSTR("localized string not found"), 0));
    objc_msgSend(v14, "setText:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    objc_msgSend(v14, "setTextColor:", v23);

    LODWORD(v24) = 1148846080;
    objc_msgSend(v14, "setContentCompressionResistancePriority:forAxis:", 1, v24);
    LODWORD(v25) = 1148829696;
    objc_msgSend(v14, "setContentCompressionResistancePriority:forAxis:", 0, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationSummaryCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v26, "addSubview:", v14);

    v27 = sub_1002A8AA0(v3);
    if (v27 == 5)
      v28 = 14.0;
    else
      v28 = 12.0;
    if (v27 == 5)
      v29 = 10.0;
    else
      v29 = 12.0;
    if (v27 == 5)
      v30 = 16.0;
    else
      v30 = 12.0;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationLabelSummaryView topAnchor](v3->_labelSummaryView, "topAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationSummaryCollectionViewCell contentView](v3, "contentView"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "topAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:constant:", v57, v28));
    v62[0] = v56;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationLabelSummaryView leadingAnchor](v3->_labelSummaryView, "leadingAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationSummaryCollectionViewCell contentView](v3, "contentView"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "leadingAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:constant:", v53, v30));
    v62[1] = v52;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationSummaryCollectionViewCell contentView](v3, "contentView"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "trailingAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationLabelSummaryView trailingAnchor](v3->_labelSummaryView, "trailingAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintGreaterThanOrEqualToAnchor:constant:", v49, v30));
    v62[2] = v48;
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationLabelSummaryView bottomAnchor](v3->_labelSummaryView, "bottomAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:constant:", v46, 5.0));
    v62[3] = v45;
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationSummaryCollectionViewCell contentView](v3, "contentView"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "leadingAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, v30));
    v62[4] = v41;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationSummaryCollectionViewCell contentView](v3, "contentView"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "trailingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, v30));
    v62[5] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationSummaryCollectionViewCell contentView](v3, "contentView"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "bottomAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, v29));
    v62[6] = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v62, 7));
    objc_msgSend(v60, "addObjectsFromArray:", v38);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v60);
    +[RoutingAppearanceManager configureBackgroundViewForStepCell:](RoutingAppearanceManager, "configureBackgroundViewForStepCell:", v3);

  }
  return v3;
}

- (void)setRoute:(id)a3
{
  GEOComposedRoute *v5;
  GEOComposedRoute *v6;

  v5 = (GEOComposedRoute *)a3;
  if (self->_route != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_route, a3);
    -[DirectionsElevationSummaryCollectionViewCell _updateLabels](self, "_updateLabels");
    v5 = v6;
  }

}

- (void)_updateLabels
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  id v8;
  NSObject *v9;
  DirectionsElevationSummaryCollectionViewCell *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  DirectionsElevationLabelSummaryView *labelSummaryView;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute elevationProfile](self->_route, "elevationProfile"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute elevationProfile](self->_route, "elevationProfile"));
    v5 = (double)objc_msgSend(v4, "sumElevationGainCm") / 100.0;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute elevationProfile](self->_route, "elevationProfile"));
    v7 = (double)objc_msgSend(v6, "sumElevationLossCm") / 100.0;

  }
  else
  {
    v7 = 0.0;
    v5 = 0.0;
  }
  v8 = sub_100432CAC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = self;
    v11 = (objc_class *)objc_opt_class(v10);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if ((objc_opt_respondsToSelector(v10, "accessibilityIdentifier") & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationSummaryCollectionViewCell performSelector:](v10, "performSelector:", "accessibilityIdentifier"));
      v15 = v14;
      if (v14 && !objc_msgSend(v14, "isEqualToString:", v13))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v13, v10, v15));

        goto LABEL_10;
      }

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v13, v10));
LABEL_10:

    *(_DWORD *)buf = 138412290;
    v25 = v16;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@ | Will update labels for gain/loss", buf, 0xCu);

  }
  labelSummaryView = self->_labelSummaryView;
  v18 = objc_alloc((Class)NSMeasurement);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUnitLength meters](NSUnitLength, "meters"));
  v20 = objc_msgSend(v18, "initWithDoubleValue:unit:", v19, v5);
  v21 = objc_alloc((Class)NSMeasurement);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSUnitLength meters](NSUnitLength, "meters"));
  v23 = objc_msgSend(v21, "initWithDoubleValue:unit:", v22, v7);
  -[DirectionsElevationLabelSummaryView setAscent:descent:](labelSummaryView, "setAscent:descent:", v20, v23);

}

- (id)accessibilityIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v2);
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_labelSummaryView, 0);
}

@end
