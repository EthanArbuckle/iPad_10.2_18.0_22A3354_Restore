@implementation TrafficIncidentsDescriptionView

- (TrafficIncidentsDescriptionView)init
{
  TrafficIncidentsDescriptionView *v2;
  _MKUILabel *v3;
  _MKUILabel *label;
  void *v5;
  id v6;
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
  objc_super v37;
  _QWORD v38[7];

  v37.receiver = self;
  v37.super_class = (Class)TrafficIncidentsDescriptionView;
  v2 = -[TrafficIncidentsDescriptionView init](&v37, "init");
  if (v2)
  {
    v3 = (_MKUILabel *)objc_alloc_init((Class)_MKUILabel);
    label = v2->_label;
    v2->_label = v3;

    -[_MKUILabel setNumberOfLines:](v2->_label, "setNumberOfLines:", 0);
    -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](v2->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[_MKUILabel setTextColor:](v2->_label, "setTextColor:", v5);

    v6 = objc_alloc_init((Class)_MKUILabel);
    -[TrafficIncidentsDescriptionView setHiddenCenteringLabel:](v2, "setHiddenCenteringLabel:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsDescriptionView hiddenCenteringLabel](v2, "hiddenCenteringLabel"));
    objc_msgSend(v7, "setNumberOfLines:", 2);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsDescriptionView hiddenCenteringLabel](v2, "hiddenCenteringLabel"));
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsDescriptionView hiddenCenteringLabel](v2, "hiddenCenteringLabel"));
    objc_msgSend(v9, "setAlpha:", 0.0);

    -[TrafficIncidentsDescriptionView addSubview:](v2, "addSubview:", v2->_label);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsDescriptionView hiddenCenteringLabel](v2, "hiddenCenteringLabel"));
    -[TrafficIncidentsDescriptionView addSubview:](v2, "addSubview:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsDescriptionView hiddenCenteringLabel](v2, "hiddenCenteringLabel"));
    +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v11, &stru_1011E7A38);

    +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v2->_label, &stru_1011E7A38);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel leadingAnchor](v2->_label, "leadingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsDescriptionView leadingAnchor](v2, "leadingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v35));
    v38[0] = v34;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel trailingAnchor](v2->_label, "trailingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsDescriptionView trailingAnchor](v2, "trailingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v32));
    v38[1] = v31;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel bottomAnchor](v2->_label, "bottomAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsDescriptionView bottomAnchor](v2, "bottomAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, -10.0));
    v38[2] = v28;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel leadingAnchor](v2->_hiddenCenteringLabel, "leadingAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsDescriptionView leadingAnchor](v2, "leadingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
    v38[3] = v25;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel trailingAnchor](v2->_hiddenCenteringLabel, "trailingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsDescriptionView trailingAnchor](v2, "trailingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v23));
    v38[4] = v22;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel firstBaselineAnchor](v2->_label, "firstBaselineAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsDescriptionView topAnchor](v2, "topAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v13, &stru_1011E7A38, 32.0));
    v38[5] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel firstBaselineAnchor](v2->_hiddenCenteringLabel, "firstBaselineAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsDescriptionView topAnchor](v2, "topAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v17, &stru_1011E7A38, 32.0));
    v38[6] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 7));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

  }
  return v2;
}

- (void)setIncidentString:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_incidentString, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_incidentString, a3);
    -[_MKUILabel setText:](self->_label, "setText:", v5);
    -[_MKUILabel setText:](self->_hiddenCenteringLabel, "setText:", v5);
  }

}

- (NSString)incidentString
{
  return self->_incidentString;
}

- (_MKUILabel)hiddenCenteringLabel
{
  return self->_hiddenCenteringLabel;
}

- (void)setHiddenCenteringLabel:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenCenteringLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenCenteringLabel, 0);
  objc_storeStrong((id *)&self->_incidentString, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
