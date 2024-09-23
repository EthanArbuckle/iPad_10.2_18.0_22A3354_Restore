@implementation CarArrivedGuidanceSign

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (CarArrivedGuidanceSign)initWithDestination:(unint64_t)a3
{
  double y;
  double width;
  double height;
  CarArrivedGuidanceSign *v7;
  CarArrivedGuidanceSign *v8;
  NavSignLabel *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  MapsAutolayoutLabel *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CarArrivedGuidanceSign;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = -[CarArrivedGuidanceSign initWithFrame:](&v22, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v8 = v7;
  if (v7)
  {
    -[CarArrivedGuidanceSign setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", CFSTR("CarArrivedGuidanceSign"));
    v8->_destination = a3;
    v9 = -[NavSignLabel initWithFrame:]([NavSignLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[CarArrivedGuidanceSign setDestinationLabel:](v8, "setDestinationLabel:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign destinationLabel](v8, "destinationLabel"));
    objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("DestinationLabel"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign destinationLabel](v8, "destinationLabel"));
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign destinationLabel](v8, "destinationLabel"));
    LODWORD(v13) = 1148813312;
    objc_msgSend(v12, "setContentCompressionResistancePriority:forAxis:", 1, v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign destinationLabel](v8, "destinationLabel"));
    -[CarArrivedGuidanceSign addSubview:](v8, "addSubview:", v14);

    v15 = -[MapsAutolayoutLabel initWithFrame:]([MapsAutolayoutLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[CarArrivedGuidanceSign setArrivedLabel:](v8, "setArrivedLabel:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign arrivedLabel](v8, "arrivedLabel"));
    objc_msgSend(v16, "setAccessibilityIdentifier:", CFSTR("ArrivedLabel"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign arrivedLabel](v8, "arrivedLabel"));
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign arrivedLabel](v8, "arrivedLabel"));
    LODWORD(v19) = 1148829696;
    objc_msgSend(v18, "setContentCompressionResistancePriority:forAxis:", 1, v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign arrivedLabel](v8, "arrivedLabel"));
    -[CarArrivedGuidanceSign addSubview:](v8, "addSubview:", v20);

    -[CarArrivedGuidanceSign _updateStyling](v8, "_updateStyling");
    -[CarArrivedGuidanceSign _setupConstraints](v8, "_setupConstraints");
  }
  return v8;
}

- (void)_updateStyling
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 16.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign destinationLabel](self, "destinationLabel"));
  objc_msgSend(v4, "setPreferredFont:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign destinationLabel](self, "destinationLabel"));
  objc_msgSend(v5, "setMaxNumberOfLinesWithPreferredFont:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign destinationLabel](self, "destinationLabel"));
  objc_msgSend(v6, "setMaxNumberOfTotalLines:", 0);

  v7 = sub_100C556C4(self->_destination == 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign destinationLabel](self, "destinationLabel"));
  objc_msgSend(v9, "setTextColor:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign destinationLabel](self, "destinationLabel"));
  objc_msgSend(v10, "setParagraphLineBreakMode:", 4);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign destinationLabel](self, "destinationLabel"));
  objc_msgSend(v11, "updateLabelIfNeeded");

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 12.0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign arrivedLabel](self, "arrivedLabel"));
  objc_msgSend(v13, "setFont:", v12);

  v14 = sub_100C556C4(self->_destination == 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign arrivedLabel](self, "arrivedLabel"));
  objc_msgSend(v16, "setTextColor:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign arrivedLabel](self, "arrivedLabel"));
  objc_msgSend(v17, "setShouldInsetAlignmentToAscender:", 1);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign arrivedLabel](self, "arrivedLabel"));
  objc_msgSend(v18, "setNumberOfLines:", 0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Arrived [CarPlay]"), CFSTR("localized string not found"), 0));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign arrivedLabel](self, "arrivedLabel"));
  objc_msgSend(v20, "setText:", v21);

}

- (void)setFormattedDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  }
  else
  {
    v6 = 0;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign destinationLabel](self, "destinationLabel"));
  objc_msgSend(v7, "setTextAlternatives:", v6);

  if (v5)
}

- (void)_setupConstraints
{
  double v3;
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
  void *v19;
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
  _QWORD v46[9];

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign arrivedLabel](self, "arrivedLabel"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "topAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign topAnchor](self, "topAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:constant:", v43, 10.0));
  v46[0] = v42;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign arrivedLabel](self, "arrivedLabel"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "leadingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign leadingAnchor](self, "leadingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, 10.0));
  v46[1] = v38;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign trailingAnchor](self, "trailingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign arrivedLabel](self, "arrivedLabel"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "trailingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, 10.0));
  v46[2] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign destinationLabel](self, "destinationLabel"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "topAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign arrivedLabel](self, "arrivedLabel"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "bottomAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintGreaterThanOrEqualToAnchor:constant:", v30, 2.0));
  v46[3] = v29;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign destinationLabel](self, "destinationLabel"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign arrivedLabel](self, "arrivedLabel"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bottomAnchor"));
  LODWORD(v3) = 1144750080;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:priority:", v25, 10.0, v3));
  v46[4] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign destinationLabel](self, "destinationLabel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign arrivedLabel](self, "arrivedLabel"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v19));
  v46[5] = v18;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign destinationLabel](self, "destinationLabel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "heightAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign destinationLabel](self, "destinationLabel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "preferredFont"));
  objc_msgSend(v14, "lineHeight");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintGreaterThanOrEqualToConstant:"));
  v46[6] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign arrivedLabel](self, "arrivedLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign destinationLabel](self, "destinationLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v8));
  v46[7] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign bottomAnchor](self, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarArrivedGuidanceSign destinationLabel](self, "destinationLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, 10.0));
  v46[8] = v13;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 9));

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v20);
}

- (CarGuidanceCardSizeProviding)sizeProvider
{
  return (CarGuidanceCardSizeProviding *)objc_loadWeakRetained((id *)&self->_sizeProvider);
}

- (void)setSizeProvider:(id)a3
{
  objc_storeWeak((id *)&self->_sizeProvider, a3);
}

- (NavSignLabel)destinationLabel
{
  return self->_destinationLabel;
}

- (void)setDestinationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_destinationLabel, a3);
}

- (MapsAutolayoutLabel)arrivedLabel
{
  return self->_arrivedLabel;
}

- (void)setArrivedLabel:(id)a3
{
  objc_storeStrong((id *)&self->_arrivedLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivedLabel, 0);
  objc_storeStrong((id *)&self->_destinationLabel, 0);
  objc_destroyWeak((id *)&self->_sizeProvider);
}

@end
