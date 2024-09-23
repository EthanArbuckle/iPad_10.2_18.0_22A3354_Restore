@implementation TrafficIncidentsOverviewCell

+ (id)reuseIdentifier
{
  return CFSTR("TrafficIncidentsOverviewCellIdentifier");
}

- (TrafficIncidentsOverviewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  TrafficIncidentsOverviewCell *v4;
  TrafficIncidentsDateFormatter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TrafficIncidentsOverviewCell;
  v4 = -[TrafficIncidentsOverviewCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(TrafficIncidentsDateFormatter);
    -[TrafficIncidentsOverviewCell setFormatter:](v4, "setFormatter:", v5);

    -[TrafficIncidentsOverviewCell _setupViews](v4, "_setupViews");
    -[TrafficIncidentsOverviewCell _setupConstraints](v4, "_setupConstraints");
  }
  return v4;
}

- (void)setIncident:(id)a3
{
  TrafficIncidentReport *incidentReport;
  uint64_t v6;
  void *v7;
  VKTrafficIncidentFeature *v8;

  v8 = (VKTrafficIncidentFeature *)a3;
  if (self->_incident != v8)
  {
    incidentReport = self->_incidentReport;
    self->_incidentReport = 0;

    objc_storeStrong((id *)&self->_incident, a3);
    -[TrafficIncidentsOverviewCell _detailsUpdateLabels](self, "_detailsUpdateLabels");
  }
  v6 = -[TrafficIncidentsOverviewCell showVotingButtons](self, "showVotingButtons") ^ 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell reportingButtonsView](self, "reportingButtonsView"));
  objc_msgSend(v7, "setHidden:", v6);

}

- (void)setIncidentReport:(id)a3
{
  VKTrafficIncidentFeature *incident;
  uint64_t v6;
  void *v7;
  TrafficIncidentReport *v8;

  v8 = (TrafficIncidentReport *)a3;
  if (self->_incidentReport != v8)
  {
    incident = self->_incident;
    self->_incident = 0;

    objc_storeStrong((id *)&self->_incidentReport, a3);
    -[TrafficIncidentsOverviewCell _detailsUpdateLabels](self, "_detailsUpdateLabels");
  }
  v6 = -[TrafficIncidentsOverviewCell showVotingButtons](self, "showVotingButtons") ^ 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell reportingButtonsView](self, "reportingButtonsView"));
  objc_msgSend(v7, "setHidden:", v6);

}

- (void)_setupViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  DeclineAcceptButtonsView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  DeclineAcceptButtonsView *v12;
  void *v13;
  MKIncidentDetailContentView *v14;
  MKIncidentDetailContentView *incidentDetailContentView;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[TrafficIncidentsOverviewCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[TrafficIncidentsOverviewCell setOpaque:](self, "setOpaque:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell contentView](self, "contentView"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell contentView](self, "contentView"));
  objc_msgSend(v6, "setOpaque:", 0);

  v7 = [DeclineAcceptButtonsView alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Cleared"), CFSTR("localized string not found"), 0));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100B45B44;
  v18[3] = &unk_1011AC860;
  v18[4] = self;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Still Here"), CFSTR("localized string not found"), 0));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100B45B88;
  v17[3] = &unk_1011AC860;
  v17[4] = self;
  v12 = -[DeclineAcceptButtonsView initWithDeclineTitle:declineAction:acceptTitle:acceptAction:](v7, "initWithDeclineTitle:declineAction:acceptTitle:acceptAction:", v9, v18, v11, v17);
  -[TrafficIncidentsOverviewCell setReportingButtonsView:](self, "setReportingButtonsView:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell reportingButtonsView](self, "reportingButtonsView"));
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v14 = (MKIncidentDetailContentView *)objc_msgSend(objc_alloc((Class)MKIncidentDetailContentView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  incidentDetailContentView = self->_incidentDetailContentView;
  self->_incidentDetailContentView = v14;

  -[MKIncidentDetailContentView setTranslatesAutoresizingMaskIntoConstraints:](self->_incidentDetailContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKIncidentDetailContentView setDelegate:](self->_incidentDetailContentView, "setDelegate:", self);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell contentView](self, "contentView"));
  objc_msgSend(v16, "addSubview:", self->_incidentDetailContentView);

}

- (void)_setupConstraints
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
  void *v19;
  _QWORD v20[4];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MKIncidentDetailContentView leadingAnchor](self->_incidentDetailContentView, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell contentView](self, "contentView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v17));
  v20[0] = v16;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MKIncidentDetailContentView trailingAnchor](self->_incidentDetailContentView, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell contentView](self, "contentView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v13));
  v20[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MKIncidentDetailContentView topAnchor](self->_incidentDetailContentView, "topAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));
  v20[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MKIncidentDetailContentView bottomAnchor](self->_incidentDetailContentView, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v20[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)_detailsUpdateLabels
{
  void *v3;
  void *v4;
  unint64_t v5;
  TrafficIncidentsOverviewCell *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  TrafficIncidentsOverviewCell *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  id v28;
  void *v29;
  void *v30;
  unsigned int v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  void *v40;
  uint64_t v41;
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
  id v59;
  id v60;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell incidentReport](self, "incidentReport"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell incidentReport](self, "incidentReport"));
    v5 = +[TrafficIncidentLayoutItem vkTrafficIncidentTypeForGEOType:](TrafficIncidentLayoutItem, "vkTrafficIncidentTypeForGEOType:", objc_msgSend(v4, "incidentType"));

    v6 = self;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell window](v6, "window"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "screen"));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell window](v6, "window"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "screen"));
      objc_msgSend(v10, "nativeScale");

    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v9, "nativeScale");
    }

    v20 = sub_1005E0F68(v5, 4);
    v59 = (id)objc_claimAutoreleasedReturnValue(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell incidentReport](v6, "incidentReport"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "incidentUpdateTime"));

    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell formatter](v6, "formatter"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell incidentReport](v6, "incidentReport"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "incidentUpdateTime"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lastUpdatedUIStringForDate:", v25));

    }
    else
    {
      v26 = 0;
    }
    -[MKIncidentDetailContentView configureWithTitle:subtitle:body:image:](v6->_incidentDetailContentView, "configureWithTitle:subtitle:body:image:", 0, v26, 0, v59);
    goto LABEL_29;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell incident](self, "incident"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell incident](self, "incident"));
    v13 = self;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell window](v13, "window"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "screen"));
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell window](v13, "window"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "screen"));
      objc_msgSend(v17, "nativeScale");
      v19 = v18;

    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v16, "nativeScale");
      v19 = v27;
    }

    v28 = sub_1005E0E80(v12, 4, v19);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell incident](v13, "incident"));
    v31 = objc_msgSend(v30, "isRestrictionIncident");

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell incident](v13, "incident"));
    v33 = v32;
    if (v31)
    {
      v34 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "restrictionCombinedDetails"));
    }
    else
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "info"));
      v36 = v35;
      if (v35)
      {
        v34 = v35;
      }
      else
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell incident](v13, "incident"));
        v34 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "subtitle"));

      }
    }

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell incident](v13, "incident"));
    v39 = objc_msgSend(v38, "isRestrictionIncident");

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell incident](v13, "incident"));
    v26 = v40;
    if (v39)
    {
      v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "restrictionEffectiveTimeRange"));
    }
    else
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "endDate"));

      if (v42)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("TrafficIncidentEndDate"), CFSTR("localized string not found"), 0));

        v58 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell formatter](v13, "formatter"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell incident](v13, "incident"));
        v60 = v29;
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "endDate"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "dateStringForDate:", v45));
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell formatter](v13, "formatter"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell incident](v13, "incident"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "endDate"));
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "timeStringForDate:", v49));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v57, v46, v50));

        v29 = v60;
      }
      else
      {
        v26 = 0;
      }
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell incident](v13, "incident"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "lastUpdatedDate"));

      if (!v52)
        goto LABEL_28;
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell formatter](v13, "formatter"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell incident](v13, "incident"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "lastUpdatedDate"));
      v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "lastUpdatedUIStringForDate:", v55));

    }
    v26 = (void *)v41;
LABEL_28:
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsOverviewCell incident](v13, "incident"));
    v59 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "title"));

    -[MKIncidentDetailContentView configureWithTitle:subtitle:body:image:](v13->_incidentDetailContentView, "configureWithTitle:subtitle:body:image:", v59, v26, v34, v29);
LABEL_29:

  }
}

- (VKTrafficIncidentFeature)incident
{
  return self->_incident;
}

- (TrafficIncidentReport)incidentReport
{
  return self->_incidentReport;
}

- (BOOL)showVotingButtons
{
  return self->_showVotingButtons;
}

- (void)setShowVotingButtons:(BOOL)a3
{
  self->_showVotingButtons = a3;
}

- (TrafficIncidentsOverviewCellDelegate)delegate
{
  return (TrafficIncidentsOverviewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TrafficIncidentsDateFormatter)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_formatter, a3);
}

- (DeclineAcceptButtonsView)reportingButtonsView
{
  return self->_reportingButtonsView;
}

- (void)setReportingButtonsView:(id)a3
{
  objc_storeStrong((id *)&self->_reportingButtonsView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportingButtonsView, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_incidentReport, 0);
  objc_storeStrong((id *)&self->_incident, 0);
  objc_storeStrong((id *)&self->_incidentDetailContentView, 0);
}

@end
