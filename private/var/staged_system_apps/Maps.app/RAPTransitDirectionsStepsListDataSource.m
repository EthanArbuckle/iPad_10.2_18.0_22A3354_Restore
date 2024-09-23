@implementation RAPTransitDirectionsStepsListDataSource

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RAPTransitDirectionsStepsListDataSource;
  v5 = -[TransitDirectionsStepsListDataSource tableView:cellForRowAtIndexPath:](&v14, "tableView:cellForRowAtIndexPath:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v6, "setAccessoryType:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor"));
  objc_msgSend(v6, "setBackgroundColor:", v7);

  v8 = objc_opt_class(TransitDirectionsInstructionsCell);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stepView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "detailButton"));
    objc_msgSend(v10, "setHidden:", 1);

  }
  v11 = objc_opt_class(TransitDirectionsOperatorInfoCell);
  if ((objc_opt_isKindOfClass(v6, v11) & 1) != 0)
    objc_msgSend(v6, "setUserInteractionEnabled:", 0);
  v12 = objc_opt_class(TransitDirectionsClusteredVehiclesCell);
  if ((objc_opt_isKindOfClass(v6, v12) & 1) != 0)
    objc_msgSend(v6, "setUserInteractionEnabled:", 0);
  -[RAPTransitDirectionsStepsListDataSource _attachDisclosureViewToCell:](self, "_attachDisclosureViewToCell:", v6);
  return v6;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)RAPTransitDirectionsStepsListDataSource;
  -[TransitDirectionsStepsListDataSource tableView:willDisplayCell:forRowAtIndexPath:](&v15, "tableView:willDisplayCell:forRowAtIndexPath:", v8, v9, v10);
  v11 = v9;
  v12 = objc_opt_class(TransitDirectionsPassItemCell);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    v13 = v11;
  else
    v13 = 0;
  v14 = v13;

  if (v14)
  {
    objc_msgSend(v14, "set_mapkit_forceSeparatorFrameToCGRectZero:", (char *)-[TransitDirectionsStepsListDataSource tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v8, objc_msgSend(v10, "section"))- 2 == objc_msgSend(v10, "row"));
    objc_msgSend(v14, "setUseLeadingInstructionMarginAsLeadingSeparatorInset:", 1);
  }

}

- (void)_attachDisclosureViewToCell:(id)a3
{
  id v4;
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
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTransitDirectionsStepsListDataSource _rapDisclosureViewForCell:](self, "_rapDisclosureViewForCell:", v4));
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "addSubview:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));
    v25[0] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
    v25[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v4, "setTrailingView:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingView"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingView"));
    v16 = objc_opt_class(TransitDirectionsIconCell);
    if ((objc_opt_isKindOfClass(v4, v16) & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stepView"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "iconImageView"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "imageSource"));
      if (v19)
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "iconImageView"));
      else
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingView"));
      v21 = (void *)v20;

      v15 = v21;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "centerYAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "centerYAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
    objc_msgSend(v24, "setActive:", 1);

  }
}

- (id)_rapDisclosureViewForCell:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  RAPInstructionIncorrectView *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  RAPTransitDirectionsStepsListDataSource *v19;

  v4 = a3;
  v5 = objc_opt_class(TransitDirectionsOperatorInfoCell);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0
    || (v6 = objc_opt_class(TransitDirectionsClusteredVehiclesCell),
        (objc_opt_isKindOfClass(v4, v6) & 1) != 0))
  {
    v7 = 0;
  }
  else
  {
    v7 = -[RAPInstructionIncorrectView initWithFrame:]([RAPInstructionIncorrectView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[RAPInstructionIncorrectView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v8) = 1148846080;
    -[RAPInstructionIncorrectView setContentCompressionResistancePriority:forAxis:](v7, "setContentCompressionResistancePriority:forAxis:", 0, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTransitDirectionsStepsListDataSource rapDelegate](self, "rapDelegate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transitListItem"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "matchingRouteStep"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transitListItem"));
    v13 = objc_msgSend(v9, "RAPTransitDirectionsStepsList:shouldShowFlagForStep:listItem:", self, v11, v12) ^ 1;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPInstructionIncorrectView flagView](v7, "flagView"));
    objc_msgSend(v14, "setHidden:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transitListItem"));
    -[RAPInstructionIncorrectView setDisplayMode:](v7, "setDisplayMode:", -[RAPTransitDirectionsStepsListDataSource _displayModeForItem:](self, "_displayModeForItem:", v15));

    if (-[RAPInstructionIncorrectView displayMode](v7, "displayMode") == 1
      || -[RAPInstructionIncorrectView displayMode](v7, "displayMode") == 2)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10042EC5C;
      v17[3] = &unk_1011AC8B0;
      v18 = v4;
      v19 = self;
      -[RAPInstructionIncorrectView setTapblock:](v7, "setTapblock:", v17);

    }
  }

  return v7;
}

- (int)_displayModeForItem:(id)a3
{
  id v3;
  id v4;
  int v5;

  v3 = a3;
  if (!objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___TransitDirectionsListExpandableItem))
    goto LABEL_9;
  v4 = v3;
  if ((objc_msgSend(v4, "shouldDisplayExpandButton") & 1) == 0 && objc_msgSend(v4, "type") != (id)3)
  {

LABEL_9:
    if (((unint64_t)objc_msgSend(v3, "type") & 0xFFFFFFFFFFFFFFFELL) == 6)
      v5 = 3;
    else
      v5 = 0;
    goto LABEL_12;
  }
  if (objc_msgSend(v4, "expanded"))
    v5 = 2;
  else
    v5 = 1;

LABEL_12:
  return v5;
}

- (RAPTransitDirectionsStepsListDelegate)rapDelegate
{
  return (RAPTransitDirectionsStepsListDelegate *)objc_loadWeakRetained((id *)&self->_rapDelegate);
}

- (void)setRapDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_rapDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rapDelegate);
}

@end
