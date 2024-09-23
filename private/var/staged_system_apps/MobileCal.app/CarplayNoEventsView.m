@implementation CarplayNoEventsView

- (CarplayNoEventsView)init
{
  CarplayNoEventsView *v2;
  void *v3;
  UILabel *v4;
  UILabel *label;
  NSBundle *v6;
  void *v7;
  void *v8;
  void *v9;
  CarplayTableViewHeaderContentView *v10;
  CarplayTableViewHeaderContentView *header;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  NSLayoutConstraint *labelBaselineConstraint;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_super v42;
  _QWORD v43[5];
  CGRect v44;

  v42.receiver = self;
  v42.super_class = (Class)CarplayNoEventsView;
  v2 = -[CarplayNoEventsView init](&v42, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableBackgroundColor](UIColor, "tableBackgroundColor"));
    -[CarplayNoEventsView setBackgroundColor:](v2, "setBackgroundColor:", v3);

    -[CarplayNoEventsView setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    label = v2->_label;
    v2->_label = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v2->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v2));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("No Events Today"), &stru_1001B67C0, 0));

    -[UILabel setText:](v2->_label, "setText:", v41);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v2->_label, "setTextColor:", v8);

    -[UILabel setTextAlignment:](v2->_label, "setTextAlignment:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCallout));
    -[UILabel setFont:](v2->_label, "setFont:", v9);

    -[CarplayNoEventsView addSubview:](v2, "addSubview:", v2->_label);
    v10 = objc_opt_new(CarplayTableViewHeaderContentView);
    header = v2->_header;
    v2->_header = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayTableViewHeaderContentView separator](v2->_header, "separator"));
    objc_msgSend(v12, "setHidden:", 1);

    v13 = -[CarplayTableViewHeaderContentView setTranslatesAutoresizingMaskIntoConstraints:](v2->_header, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v16 = CUIKNowDate(v13, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = CUIKStringForDateAndDayOfWeekInCalendarTimezoneWithFormattingContext(v17, 0, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayTableViewHeaderContentView label](v2->_header, "label"));
    objc_msgSend(v20, "setText:", v19);

    -[CarplayNoEventsView addSubview:](v2, "addSubview:", v2->_header);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v2->_label, "firstBaselineAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayNoEventsView topAnchor](v2, "topAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayNoEventsView window](v2, "window"));
    objc_msgSend(v23, "bounds");
    v24 = objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, CGRectGetHeight(v44) * 0.56);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    labelBaselineConstraint = v2->_labelBaselineConstraint;
    v2->_labelBaselineConstraint = (NSLayoutConstraint *)v25;

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayTableViewHeaderContentView leadingAnchor](v2->_header, "leadingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayNoEventsView leadingAnchor](v2, "leadingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, 12.0));
    v43[0] = v38;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayTableViewHeaderContentView topAnchor](v2->_header, "topAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayNoEventsView topAnchor](v2, "topAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v27));
    v43[1] = v28;
    v43[2] = v2->_labelBaselineConstraint;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayTableViewHeaderContentView trailingAnchor](v2->_header, "trailingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayNoEventsView trailingAnchor](v2, "trailingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, -12.0));
    v43[3] = v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](v2->_label, "centerXAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayNoEventsView centerXAnchor](v2, "centerXAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v33));
    v43[4] = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 5));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v35);

  }
  return v2;
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)CarplayNoEventsView;
  -[CarplayNoEventsView didMoveToWindow](&v4, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayNoEventsView window](self, "window"));
  objc_msgSend(v3, "bounds");
  -[NSLayoutConstraint setConstant:](self->_labelBaselineConstraint, "setConstant:", CGRectGetHeight(v5) * 0.56);

}

- (void)updateHeaderText:(id)a3
{
  CarplayTableViewHeaderContentView *header;
  id v4;
  id v5;

  header = self->_header;
  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CarplayTableViewHeaderContentView label](header, "label"));
  objc_msgSend(v5, "setText:", v4);

}

- (void)setAnyCalendarsHiddenByFocus:(BOOL)a3
{
  self->_anyCalendarsHiddenByFocus = a3;
  -[CarplayTableViewHeaderContentView setAnyCalendarsHiddenByFocus:](self->_header, "setAnyCalendarsHiddenByFocus:");
}

- (BOOL)anyCalendarsHiddenByFocus
{
  return self->_anyCalendarsHiddenByFocus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_labelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
