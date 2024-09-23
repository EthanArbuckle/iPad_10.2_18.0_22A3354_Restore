@implementation ReservationRefinementPartySizeTableViewCell

- (ReservationRefinementPartySizeTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ReservationRefinementPartySizeTableViewCell *v4;
  UIStepper *v5;
  UIStepper *stepperControl;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ReservationRefinementPartySizeTableViewCell;
  v4 = -[ReservationTableViewCell initWithStyle:reuseIdentifier:](&v12, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_opt_new(UIStepper);
    stepperControl = v4->_stepperControl;
    v4->_stepperControl = v5;

    -[UIStepper addTarget:action:forControlEvents:](v4->_stepperControl, "addTarget:action:forControlEvents:", v4, "valueChanged:", 4096);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationRefinementPartySizeTableViewCell contentView](v4, "contentView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationRefinementPartySizeTableViewCell stepperControl](v4, "stepperControl"));
    objc_msgSend(v7, "addSubview:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTableViewCell titleLabel](v4, "titleLabel"));
    objc_msgSend(v10, "setTextColor:", v9);

    -[ReservationRefinementPartySizeTableViewCell setupConstraints](v4, "setupConstraints");
  }
  return v4;
}

- (void)setupConstraints
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
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationRefinementPartySizeTableViewCell stepperControl](self, "stepperControl"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationRefinementPartySizeTableViewCell stepperControl](self, "stepperControl"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationRefinementPartySizeTableViewCell contentView](self, "contentView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layoutMarginsGuide"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v8));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationRefinementPartySizeTableViewCell contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "centerYAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationRefinementPartySizeTableViewCell stepperControl](self, "stepperControl"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "centerYAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));

  objc_msgSend(v14, "setActive:", 1);
  objc_msgSend(v13, "setActive:", 1);

}

- (void)updateLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  uint64_t v8;
  id v9;
  id v10;

  v3 = objc_alloc((Class)NSString);
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("number_of_people_reservation_request"), CFSTR("localized string not found"), 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](NSLocale, "autoupdatingCurrentLocale"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationRefinementPartySizeTableViewCell stepperControl](self, "stepperControl"));
  objc_msgSend(v6, "value");
  LODWORD(v8) = llround(v7);
  v9 = objc_msgSend(v3, "initWithFormat:locale:", v4, v5, v8);
  -[ReservationTableViewCell setTitleText:](self, "setTitleText:", v9);

}

- (void)updateStepperValueToValue:(unint64_t)a3
{
  double v4;
  void *v5;

  v4 = (double)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationRefinementPartySizeTableViewCell stepperControl](self, "stepperControl"));
  objc_msgSend(v5, "setValue:", v4);

  -[ReservationRefinementPartySizeTableViewCell updateLabel](self, "updateLabel");
}

- (UIStepper)stepperControl
{
  return self->_stepperControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepperControl, 0);
}

@end
