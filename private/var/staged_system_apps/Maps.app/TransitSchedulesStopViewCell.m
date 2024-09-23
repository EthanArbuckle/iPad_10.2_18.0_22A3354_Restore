@implementation TransitSchedulesStopViewCell

- (TransitSchedulesStopViewCell)initWithFrame:(CGRect)a3
{
  TransitSchedulesStopViewCell *v3;
  TransitSchedulesStopViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TransitSchedulesStopViewCell;
  v3 = -[TransitSchedulesStopViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[TransitSchedulesStopViewCell createSubviews](v3, "createSubviews");
  return v4;
}

- (void)createSubviews
{
  void *v3;
  void *v4;
  MapsThemeLabel *v5;
  MapsThemeLabel *v6;
  double v7;
  id v8;
  double v9;
  id v10;
  id v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSArray *v24;
  NSArray *connectingTransitShieldsConstraints;
  void *v26;
  void *v27;
  NSLayoutConstraint *v28;
  NSLayoutConstraint *stopTextToBottomConstraint;
  NSLayoutConstraint *v30;
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
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  MapsThemeLabel *v72;
  void *v73;
  void *v74;
  _QWORD v75[12];
  _QWORD v76[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell contentView](self, "contentView"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("TransitSchedulesStopViewCell"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[TransitSchedulesStopViewCell setBackgroundColor:](self, "setBackgroundColor:", v4);

  v73 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell createStationLinkSubview](self, "createStationLinkSubview"));
  -[TransitSchedulesStopViewCell setColoredTransitLineContainerView:](self, "setColoredTransitLineContainerView:", v73);
  objc_msgSend(v3, "addSubview:", v73);
  v5 = objc_alloc_init(MapsThemeLabel);
  -[TransitSchedulesStopViewCell setPrimaryTextLabel:](self, "setPrimaryTextLabel:", v5);
  -[MapsThemeLabel setNumberOfLines:](v5, "setNumberOfLines:", 2);
  -[MapsThemeLabel setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MapsThemeLabel setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", CFSTR("TransitSchedulesStopViewCellPrimaryTextLabel"));
  objc_msgSend(v3, "addSubview:", v5);
  v6 = v5;
  LODWORD(v7) = 1148846080;
  -[MapsThemeLabel setContentCompressionResistancePriority:forAxis:](v5, "setContentCompressionResistancePriority:forAxis:", 1, v7);
  v8 = objc_alloc_init((Class)UILabel);
  -[TransitSchedulesStopViewCell setTimeLabel:](self, "setTimeLabel:", v8);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("TransitSchedulesStopViewCellTimeLabel"));
  v71 = v3;
  objc_msgSend(v3, "addSubview:", v8);
  v74 = v8;
  LODWORD(v9) = 1148846080;
  objc_msgSend(v8, "setContentCompressionResistancePriority:forAxis:", 0, v9);
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v8, &stru_1011E7A98);
  v10 = objc_alloc((Class)MKTransitInfoLabelView);
  v11 = objc_msgSend(v10, "initWithLabelItems:iconSize:shieldSize:spaceBetweenShields:maxWidth:", 0, 3, 5, 3.0, MKTransitInfoLabelViewNoMaxWidth);
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("TransitSchedulesStopViewCellTransitInfoLabelView"));
  objc_msgSend(v3, "addSubview:", v11);
  LODWORD(v12) = 1148846080;
  objc_msgSend(v11, "setContentCompressionResistancePriority:forAxis:", 0, v12);
  LODWORD(v13) = 1148846080;
  objc_msgSend(v11, "setContentCompressionResistancePriority:forAxis:", 1, v13);
  -[TransitSchedulesStopViewCell setConnectingTransitShieldsLabelView:](self, "setConnectingTransitShieldsLabelView:", v11);
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
  v72 = v6;
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel bottomAnchor](v6, "bottomAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:constant:", v66, 2.0));
  v76[0] = v64;
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](v6, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v60));
  v76[1] = v14;
  v15 = v11;
  v70 = v11;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell contentView](self, "contentView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintLessThanOrEqualToAnchor:constant:", v18, -8.0));
  v76[2] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell contentView](self, "contentView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, -10.0));
  v76[3] = v23;
  v24 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v76, 4));
  connectingTransitShieldsConstraints = self->_connectingTransitShieldsConstraints;
  self->_connectingTransitShieldsConstraints = v24;

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel bottomAnchor](v72, "bottomAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "bottomAnchor"));
  v28 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintLessThanOrEqualToAnchor:constant:", v27, -28.0));
  stopTextToBottomConstraint = self->_stopTextToBottomConstraint;
  self->_stopTextToBottomConstraint = v28;

  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "topAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "topAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:", v67));
  v75[0] = v65;
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "bottomAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "bottomAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:", v61));
  v75[1] = v59;
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "leadingAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "leadingAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:constant:", v57, 16.0));
  v75[2] = v56;
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "widthAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToConstant:", 24.0));
  v75[3] = v54;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel topAnchor](v72, "topAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "topAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintGreaterThanOrEqualToAnchor:constant:", v52, 2.0));
  v75[4] = v51;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel centerYAnchor](v72, "centerYAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell transitLineStopIndicatorImageView](self, "transitLineStopIndicatorImageView"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "centerYAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v48));
  v75[5] = v47;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](v72, "leadingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "trailingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:constant:", v45, 8.0));
  v30 = self->_stopTextToBottomConstraint;
  v75[6] = v44;
  v75[7] = v30;
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "leadingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel trailingAnchor](v72, "trailingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintGreaterThanOrEqualToAnchor:constant:", v42, 8.0));
  v75[8] = v41;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, -16.0));
  v75[9] = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "firstBaselineAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel firstBaselineAnchor](v72, "firstBaselineAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v35));
  v75[10] = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "bottomAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "bottomAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintLessThanOrEqualToAnchor:", v38));
  v75[11] = v39;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v75, 12));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v40);

}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TransitSchedulesStopViewCell;
  -[TransitSchedulesStopViewCell prepareForReuse](&v4, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell vehicleImageView](self, "vehicleImageView"));
  objc_msgSend(v3, "removeFromSuperview");

  -[TransitSchedulesStopViewCell setVehicleImageView:](self, "setVehicleImageView:", 0);
}

- (id)createStationLinkSubview
{
  id v3;
  TransitDirectionsColoredLine *v4;
  TransitDirectionsColoredLine *v5;
  id v6;
  void *v7;
  void *v8;
  TransitDirectionsColoredLine *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  TransitDirectionsColoredLine *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  TransitDirectionsColoredLine *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[10];

  v3 = objc_alloc_init((Class)UIView);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = objc_alloc_init(TransitDirectionsColoredLine);
  -[TransitDirectionsColoredLine setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v4);
  -[TransitSchedulesStopViewCell setIncomingTransitLineSection:](self, "setIncomingTransitLineSection:", v4);
  v5 = objc_alloc_init(TransitDirectionsColoredLine);
  -[TransitDirectionsColoredLine setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v5);
  -[TransitSchedulesStopViewCell setOutgoingTransitLineSection:](self, "setOutgoingTransitLineSection:", v5);
  v6 = objc_alloc_init((Class)UIImageView);
  -[TransitSchedulesStopViewCell setTransitLineStopIndicatorImageView:](self, "setTransitLineStopIndicatorImageView:", v6);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "setContentMode:", 1);
  objc_msgSend(v3, "addSubview:", v6);
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsColoredLine topAnchor](v4, "topAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v36 = v4;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v38));
  v40[0] = v37;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsColoredLine centerXAnchor](v4, "centerXAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "centerXAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v34));
  v40[1] = v33;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsColoredLine widthAnchor](v4, "widthAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToConstant:", 4.0));
  v40[2] = v31;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsColoredLine bottomAnchor](v4, "bottomAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, 1.0));
  v40[3] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "centerXAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "centerXAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
  v40[4] = v25;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintGreaterThanOrEqualToAnchor:constant:", v22, 2.0));
  v40[5] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsColoredLine topAnchor](v5, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v19, -1.0));
  v40[6] = v18;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsColoredLine bottomAnchor](v5, "bottomAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v7));
  v40[7] = v8;
  v9 = v5;
  v24 = v5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsColoredLine centerXAnchor](v5, "centerXAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "centerXAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  v40[8] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsColoredLine widthAnchor](v9, "widthAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToConstant:", 4.0));
  v40[9] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 10));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

  return v3;
}

- (void)createVehicleImageView
{
  TransitVehicleLineAnnotation *v3;
  void *v4;
  TransitScheduleCardVehiclePositionAnnotationView *v5;
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
  void *v19;
  void *v20;
  void *v21;
  NSLayoutConstraint *v22;
  NSLayoutConstraint *vehicleImageAtStationConstraint;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSLayoutConstraint *v28;
  NSLayoutConstraint *vehicleImageLeavingStationConstraint;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  TransitVehicleLineAnnotation *v37;
  _QWORD v38[3];

  if (!self->_vehicleImageView)
  {
    v3 = [TransitVehicleLineAnnotation alloc];
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell transitLine](self, "transitLine"));
    v37 = -[TransitVehicleLineAnnotation initWithTransitLine:](v3, "initWithTransitLine:", v4);

    v5 = -[TransitVehiclePositionAnnotationView initWithAnnotation:reuseIdentifier:]([TransitScheduleCardVehiclePositionAnnotationView alloc], "initWithAnnotation:reuseIdentifier:", v37, CFSTR("TransitVehiclePositionAnnotationView"));
    -[TransitSchedulesStopViewCell setVehicleImageView:](self, "setVehicleImageView:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell vehicleImageView](self, "vehicleImageView"));
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell coloredTransitLineContainerView](self, "coloredTransitLineContainerView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell vehicleImageView](self, "vehicleImageView"));
    objc_msgSend(v7, "addSubview:", v8);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell vehicleImageView](self, "vehicleImageView"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "centerXAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell coloredTransitLineContainerView](self, "coloredTransitLineContainerView"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "centerXAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
    v38[0] = v32;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell vehicleImageView](self, "vehicleImageView"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "topAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell coloredTransitLineContainerView](self, "coloredTransitLineContainerView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintGreaterThanOrEqualToAnchor:constant:", v10, 0.0));
    v38[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell vehicleImageView](self, "vehicleImageView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bottomAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell coloredTransitLineContainerView](self, "coloredTransitLineContainerView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintLessThanOrEqualToAnchor:constant:", v15, 0.0));
    v38[2] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 3));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell vehicleImageView](self, "vehicleImageView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "centerYAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell transitLineStopIndicatorImageView](self, "transitLineStopIndicatorImageView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "centerYAnchor"));
    v22 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v21));
    vehicleImageAtStationConstraint = self->_vehicleImageAtStationConstraint;
    self->_vehicleImageAtStationConstraint = v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell vehicleImageView](self, "vehicleImageView"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bottomAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell outgoingTransitLineSection](self, "outgoingTransitLineSection"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bottomAnchor"));
    v28 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v27));
    vehicleImageLeavingStationConstraint = self->_vehicleImageLeavingStationConstraint;
    self->_vehicleImageLeavingStationConstraint = v28;

  }
}

- (void)setTransitLine:(id)a3 withTransitTripStop:(id)a4 stopType:(unint64_t)a5 colorStyleType:(unint64_t)a6 vehiclePosition:(unint64_t)a7 showTimeZone:(BOOL)a8
{
  _BOOL8 v8;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int *v39;
  int *v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id location;
  NSLayoutConstraint *stopTextToBottomConstraint;
  NSLayoutConstraint *v47;

  v8 = a8;
  v42 = a3;
  v41 = a4;
  if (self->_stopType == a5
    && self->_linkColorStyleType == a6
    && -[GEOTransitLine isEqual:](self->_transitLine, "isEqual:", v42)
    && (-[GEOTransitTripStop isEqual:](self->_transitTripStop, "isEqual:", v41) & 1) != 0)
  {
    goto LABEL_16;
  }
  objc_storeStrong((id *)&self->_transitLine, a3);
  self->_stopType = a5;
  objc_storeStrong((id *)&self->_transitTripStop, a4);
  self->_linkColorStyleType = a6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell transitTripStop](self, "transitTripStop"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "displayName"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell primaryTextLabel](self, "primaryTextLabel"));
  objc_msgSend(v17, "setText:", v16);

  -[TransitSchedulesStopViewCell updatePrimaryTextFont](self, "updatePrimaryTextFont");
  objc_initWeak(&location, self);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100C2CD8C;
  v43[3] = &unk_1011D9A90;
  objc_copyWeak(&v44, &location);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell primaryTextLabel](self, "primaryTextLabel"));
  objc_msgSend(v18, "setTextColorProvider:", v43);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell transitTripStop](self, "transitTripStop"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "departure"));

  if (objc_msgSend(v20, "isCanceled"))
  {
    v21 = -[TransitSchedulesStopViewCell isHighlightedStation](self, "isHighlightedStation");
    v22 = v21;
    if (v21)
    {
      a5 = objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)a5, "localizedStringForKey:value:table:", CFSTR("Schedules Stop Cell Canceled"), CFSTR("localized string not found"), 0));
    }
    else
    {
      v23 = 0;
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell timeLabel](self, "timeLabel"));
    objc_msgSend(v27, "setText:", v23);

    if ((v22 & 1) == 0)
      goto LABEL_12;
  }
  else
  {
    a5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "departureDate"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell transitTripStop](self, "transitTripStop"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "timeZone"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:showTimeZone:useShortFormat:](NSDateFormatter, "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:showTimeZone:useShortFormat:", a5, v24, 0, v8, 0));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell timeLabel](self, "timeLabel"));
    objc_msgSend(v26, "setText:", v25);

  }
LABEL_12:
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell departureTimeColor](self, "departureTimeColor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell timeLabel](self, "timeLabel"));
  objc_msgSend(v29, "setTextColor:", v28);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell transitTripStop](self, "transitTripStop"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "labelItems"));
  v32 = objc_msgSend(v31, "count") == 0;

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell connectingTransitShieldsLabelView](self, "connectingTransitShieldsLabelView"));
  if (v32)
  {
    objc_msgSend(v33, "setHidden:", 1);

    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", self->_connectingTransitShieldsConstraints);
    stopTextToBottomConstraint = self->_stopTextToBottomConstraint;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &stopTextToBottomConstraint, 1));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v38);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell connectingTransitShieldsLabelView](self, "connectingTransitShieldsLabelView"));
    objc_msgSend(v35, "setLabelItems:", 0);
  }
  else
  {
    objc_msgSend(v33, "setHidden:", 0);

    v47 = self->_stopTextToBottomConstraint;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v47, 1));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v34);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_connectingTransitShieldsConstraints);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell transitTripStop](self, "transitTripStop"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "labelItems"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell connectingTransitShieldsLabelView](self, "connectingTransitShieldsLabelView"));
    objc_msgSend(v37, "setLabelItems:", v36);

  }
  -[TransitSchedulesStopViewCell updateTransitLinks](self, "updateTransitLinks");

  objc_destroyWeak(&v44);
  objc_destroyWeak(&location);
LABEL_16:
  if (a7)
  {
    -[TransitSchedulesStopViewCell createVehicleImageView](self, "createVehicleImageView");
    v39 = &OBJC_IVAR___TransitSchedulesStopViewCell__vehicleImageAtStationConstraint;
    if (a7 == 1)
    {
      v40 = &OBJC_IVAR___TransitSchedulesStopViewCell__vehicleImageLeavingStationConstraint;
      goto LABEL_21;
    }
    if (a7 == 2)
    {
      v40 = &OBJC_IVAR___TransitSchedulesStopViewCell__vehicleImageAtStationConstraint;
      v39 = &OBJC_IVAR___TransitSchedulesStopViewCell__vehicleImageLeavingStationConstraint;
LABEL_21:
      objc_msgSend(*(id *)((char *)&self->super + *v40), "setActive:", 0);
      objc_msgSend(*(id *)((char *)&self->super + *v39), "setActive:", 1);
    }
  }
  -[TransitSchedulesStopViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

- (void)updateTransitLinks
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t linkColorStyleType;
  void *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  _BOOL8 v22;
  void *v23;
  id v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell transitLine](self, "transitLine"));

  if (v3)
  {
    if (self->_linkColorStyleType == 2)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell theme](self, "theme"));
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transitSchedulesPastStopLinkColor"));
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell transitLine](self, "transitLine"));
      v5 = objc_claimAutoreleasedReturnValue(+[UIColor _mapkit_colorForTransitLine:](UIColor, "_mapkit_colorForTransitLine:", v4));
    }
    v24 = (id)v5;

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "_maps_hexString"));
    if ((id)-[TransitSchedulesStopViewCell stopType](self, "stopType") == (id)1
      || (id)-[TransitSchedulesStopViewCell stopType](self, "stopType") == (id)3)
    {
      v7 = objc_claimAutoreleasedReturnValue(+[MKTransitArtwork stationNodeArtworkWithHexColor:](MKTransitArtwork, "stationNodeArtworkWithHexColor:", v6));
    }
    else
    {
      v7 = objc_claimAutoreleasedReturnValue(+[MKTransitArtwork stationNodeOutlinedArtworkWithHexColor:](MKTransitArtwork, "stationNodeOutlinedArtworkWithHexColor:", v6));
    }
    v8 = (void *)v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKArtworkDataSourceCache sharedInstance](MKArtworkDataSourceCache, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v10, "scale");
    v12 = v11;

    if (-[TransitSchedulesStopViewCell isHighlightedStation](self, "isHighlightedStation"))
      v13 = 5;
    else
      v13 = 3;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageForArtwork:size:featureType:scale:nightMode:", v8, v13, 2, -[TransitSchedulesStopViewCell _mapkit_isDarkModeEnabled](self, "_mapkit_isDarkModeEnabled"), v12));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell transitLineStopIndicatorImageView](self, "transitLineStopIndicatorImageView"));
    objc_msgSend(v15, "setImage:", v14);

    linkColorStyleType = self->_linkColorStyleType;
    v17 = v24;
    if (linkColorStyleType == 3)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell theme](self, "theme"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "transitSchedulesPastStopLinkColor"));
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell incomingTransitLineSection](self, "incomingTransitLineSection"));
    objc_msgSend(v18, "setLineColor:", v17);

    if (linkColorStyleType == 3)
    {

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell outgoingTransitLineSection](self, "outgoingTransitLineSection"));
    objc_msgSend(v19, "setLineColor:", v24);

    v20 = (id)-[TransitSchedulesStopViewCell stopType](self, "stopType") == (id)1;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell incomingTransitLineSection](self, "incomingTransitLineSection"));
    objc_msgSend(v21, "setHidden:", v20);

    v22 = (id)-[TransitSchedulesStopViewCell stopType](self, "stopType") == (id)3;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell outgoingTransitLineSection](self, "outgoingTransitLineSection"));
    objc_msgSend(v23, "setHidden:", v22);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TransitSchedulesStopViewCell;
  v4 = a3;
  -[MapsThemeCollectionViewListCell traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle", v8.receiver, v8.super_class);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
    -[TransitSchedulesStopViewCell updateTransitLinks](self, "updateTransitLinks");
}

- (void)updatePrimaryTextFont
{
  Block_layout *v3;
  void *v4;
  Block_layout *v5;

  if (-[TransitSchedulesStopViewCell isHighlightedStation](self, "isHighlightedStation"))
    v3 = &stru_1011E7BF8;
  else
    v3 = &stru_1011E7A38;
  v5 = objc_retainBlock(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell primaryTextLabel](self, "primaryTextLabel"));
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v4, v5);

}

- (void)setHighlightStation:(BOOL)a3
{
  void *v4;
  void *v5;

  if (self->_highlightStation != a3)
  {
    self->_highlightStation = a3;
    -[TransitSchedulesStopViewCell updatePrimaryTextFont](self, "updatePrimaryTextFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell departureTimeColor](self, "departureTimeColor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell timeLabel](self, "timeLabel"));
    objc_msgSend(v5, "setTextColor:", v4);

    -[TransitSchedulesStopViewCell layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (id)departureTimeColor
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  _BOOL4 v11;
  void *v12;

  if (self->_linkColorStyleType == 2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell theme](self, "theme"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transitSchedulesPastStopTextColor"));
LABEL_14:
    v12 = (void *)v4;

    return v12;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell transitLine](self, "transitLine"));
  v6 = objc_msgSend(v5, "departureTimeDisplayStyle");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell transitTripStop](self, "transitTripStop"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "departure"));
  v9 = (unint64_t)objc_msgSend(v8, "liveStatus");

  v11 = v6 != (id)1 || v9 != 3;
  if (!-[TransitSchedulesStopViewCell isHighlightedStation](self, "isHighlightedStation")
    || !v11
    || (v9 & 0xFFFFFFFFFFFFFFFELL) != 4)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell theme](self, "theme"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transitSchedulesOnTimeStopTimeTextColor"));
    goto LABEL_14;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  return v12;
}

- (id)primaryTextColor
{
  unint64_t linkColorStyleType;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  linkColorStyleType = self->_linkColorStyleType;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesStopViewCell theme](self, "theme"));
  v4 = v3;
  if (linkColorStyleType == 2)
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transitSchedulesPastStopTextColor"));
  else
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transitSchedulesOnTimeStopTimeTextColor"));
  v6 = (void *)v5;

  return v6;
}

- (BOOL)isHighlightedStation
{
  return self->_highlightStation;
}

- (MapsThemeLabel)primaryTextLabel
{
  return self->_primaryTextLabel;
}

- (void)setPrimaryTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_primaryTextLabel, a3);
}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_timeLabel, a3);
}

- (MKTransitInfoLabelView)connectingTransitShieldsLabelView
{
  return self->_connectingTransitShieldsLabelView;
}

- (void)setConnectingTransitShieldsLabelView:(id)a3
{
  objc_storeStrong((id *)&self->_connectingTransitShieldsLabelView, a3);
}

- (UIView)coloredTransitLineContainerView
{
  return self->_coloredTransitLineContainerView;
}

- (void)setColoredTransitLineContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_coloredTransitLineContainerView, a3);
}

- (UIImageView)transitLineStopIndicatorImageView
{
  return self->_transitLineStopIndicatorImageView;
}

- (void)setTransitLineStopIndicatorImageView:(id)a3
{
  objc_storeStrong((id *)&self->_transitLineStopIndicatorImageView, a3);
}

- (TransitDirectionsColoredLine)incomingTransitLineSection
{
  return self->_incomingTransitLineSection;
}

- (void)setIncomingTransitLineSection:(id)a3
{
  objc_storeStrong((id *)&self->_incomingTransitLineSection, a3);
}

- (TransitDirectionsColoredLine)outgoingTransitLineSection
{
  return self->_outgoingTransitLineSection;
}

- (void)setOutgoingTransitLineSection:(id)a3
{
  objc_storeStrong((id *)&self->_outgoingTransitLineSection, a3);
}

- (TransitVehiclePositionAnnotationView)vehicleImageView
{
  return self->_vehicleImageView;
}

- (void)setVehicleImageView:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleImageView, a3);
}

- (unint64_t)stopType
{
  return self->_stopType;
}

- (void)setStopType:(unint64_t)a3
{
  self->_stopType = a3;
}

- (GEOTransitLine)transitLine
{
  return self->_transitLine;
}

- (void)setTransitLine:(id)a3
{
  objc_storeStrong((id *)&self->_transitLine, a3);
}

- (GEOTransitTripStop)transitTripStop
{
  return self->_transitTripStop;
}

- (void)setTransitTripStop:(id)a3
{
  objc_storeStrong((id *)&self->_transitTripStop, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitTripStop, 0);
  objc_storeStrong((id *)&self->_transitLine, 0);
  objc_storeStrong((id *)&self->_vehicleImageView, 0);
  objc_storeStrong((id *)&self->_outgoingTransitLineSection, 0);
  objc_storeStrong((id *)&self->_incomingTransitLineSection, 0);
  objc_storeStrong((id *)&self->_transitLineStopIndicatorImageView, 0);
  objc_storeStrong((id *)&self->_coloredTransitLineContainerView, 0);
  objc_storeStrong((id *)&self->_connectingTransitShieldsLabelView, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_primaryTextLabel, 0);
  objc_storeStrong((id *)&self->_stopTextToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_connectingTransitShieldsConstraints, 0);
  objc_storeStrong((id *)&self->_placeholderString, 0);
  objc_storeStrong((id *)&self->_vehicleImageLeavingStationConstraint, 0);
  objc_storeStrong((id *)&self->_vehicleImageAtStationConstraint, 0);
}

@end
