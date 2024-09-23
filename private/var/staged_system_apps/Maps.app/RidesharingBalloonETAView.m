@implementation RidesharingBalloonETAView

- (RidesharingBalloonETAView)initWithFrame:(CGRect)a3
{
  RidesharingBalloonETAView *v3;
  void *v4;
  UILabel *v5;
  UILabel *label;
  void *v7;
  void *v8;
  UILabel *v9;
  UILabel *subLabel;
  void *v11;
  void *v12;
  UIActivityIndicatorView *v13;
  UIActivityIndicatorView *spinner;
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
  objc_super v36;
  _QWORD v37[6];

  v36.receiver = self;
  v36.super_class = (Class)RidesharingBalloonETAView;
  v3 = -[RidesharingBalloonETAView initWithFrame:](&v36, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[RidesharingBalloonETAView balloonFillColor](RidesharingBalloonETAView, "balloonFillColor"));
    -[RidesharingBalloonETAView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = (UILabel *)objc_alloc_init((Class)UILabel);
    label = v3->_label;
    v3->_label = v5;

    -[UILabel setNumberOfLines:](v3->_label, "setNumberOfLines:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_boldSystemFontWithFixedSize:](UIFont, "_maps_boldSystemFontWithFixedSize:", 22.0));
    -[UILabel setFont:](v3->_label, "setFont:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UILabel setTextColor:](v3->_label, "setTextColor:", v8);

    -[UILabel setTextAlignment:](v3->_label, "setTextAlignment:", 1);
    -[RidesharingBalloonETAView addSubview:](v3, "addSubview:", v3->_label);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v9 = (UILabel *)objc_alloc_init((Class)UILabel);
    subLabel = v3->_subLabel;
    v3->_subLabel = v9;

    -[UILabel setNumberOfLines:](v3->_subLabel, "setNumberOfLines:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_systemFontWithFixedSize:](UIFont, "_maps_systemFontWithFixedSize:", 12.0));
    -[UILabel setFont:](v3->_subLabel, "setFont:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UILabel setTextColor:](v3->_subLabel, "setTextColor:", v12);

    -[UILabel setTextAlignment:](v3->_subLabel, "setTextAlignment:", 1);
    -[RidesharingBalloonETAView addSubview:](v3, "addSubview:", v3->_subLabel);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_subLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v13 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
    spinner = v3->_spinner;
    v3->_spinner = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UIActivityIndicatorView setColor:](v3->_spinner, "setColor:", v15);

    -[UIActivityIndicatorView setHidesWhenStopped:](v3->_spinner, "setHidesWhenStopped:", 1);
    -[RidesharingBalloonETAView addSubview:](v3, "addSubview:", v3->_spinner);
    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v3->_spinner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](v3->_label, "centerXAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingBalloonETAView centerXAnchor](v3, "centerXAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v34));
    v37[0] = v33;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v3->_label, "centerYAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingBalloonETAView centerYAnchor](v3, "centerYAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:", v31, -7.0));
    v37[1] = v30;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v3->_subLabel, "firstBaselineAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](v3->_label, "lastBaselineAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v28, 15.0));
    v37[2] = v27;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](v3->_subLabel, "centerXAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingBalloonETAView centerXAnchor](v3, "centerXAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v16));
    v37[3] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView centerXAnchor](v3->_spinner, "centerXAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingBalloonETAView centerXAnchor](v3, "centerXAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
    v37[4] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView centerYAnchor](v3->_spinner, "centerYAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingBalloonETAView centerYAnchor](v3, "centerYAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
    v37[5] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 6));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

  }
  return v3;
}

- (void)setMinutes:(id)a3 withState:(unint64_t)a4
{
  NSNumber *v6;
  NSNumber *minutes;
  UILabel *v8;
  UILabel *v9;
  _QWORD *v10;
  UILabel *label;
  UILabel *subLabel;
  UILabel *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];

  v6 = (NSNumber *)objc_msgSend(a3, "copy");
  minutes = self->_minutes;
  self->_minutes = v6;

  self->_balloonState = a4;
  if (a4 == 2)
  {
    label = self->_label;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100884794;
    v15[3] = &unk_1011AC860;
    v15[4] = self;
    -[RidesharingBalloonETAView crossfadeView:animations:](self, "crossfadeView:animations:", label, v15);
    subLabel = self->_subLabel;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100884800;
    v14[3] = &unk_1011AC860;
    v14[4] = self;
    -[RidesharingBalloonETAView crossfadeView:animations:](self, "crossfadeView:animations:", subLabel, v14);
    -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
  }
  else
  {
    if (a4 == 1)
    {
      v13 = self->_label;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10088470C;
      v17[3] = &unk_1011AC860;
      v17[4] = self;
      -[RidesharingBalloonETAView crossfadeView:animations:](self, "crossfadeView:animations:", v13, v17);
      v9 = self->_subLabel;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100884778;
      v16[3] = &unk_1011AC860;
      v16[4] = self;
      v10 = v16;
    }
    else
    {
      if (a4)
        return;
      v8 = self->_label;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1008845FC;
      v19[3] = &unk_1011AC860;
      v19[4] = self;
      -[RidesharingBalloonETAView crossfadeView:animations:](self, "crossfadeView:animations:", v8, v19);
      v9 = self->_subLabel;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100884694;
      v18[3] = &unk_1011AC860;
      v18[4] = self;
      v10 = v18;
    }
    -[RidesharingBalloonETAView crossfadeView:animations:](self, "crossfadeView:animations:", v9, v10);
    -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
  }
}

- (void)setScheduledPickupWindowStart:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  UILabel *label;
  id v17;
  UILabel *subLabel;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;

  v4 = a3;
  if (qword_1014D3750 != -1)
    dispatch_once(&qword_1014D3750, &stru_1011D9DA0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](NSLocale, "autoupdatingCurrentLocale"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter dateFormatFromTemplate:options:locale:](NSDateFormatter, "dateFormatFromTemplate:options:locale:", CFSTR("Jmm"), 0, v5));
  objc_msgSend((id)qword_1014D3748, "setDateFormat:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](NSLocale, "autoupdatingCurrentLocale"));
  objc_msgSend((id)qword_1014D3748, "setLocale:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timeZone"));
  objc_msgSend((id)qword_1014D3748, "setTimeZone:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar autoupdatingCurrentCalendar](NSCalendar, "autoupdatingCurrentCalendar"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateFromComponents:", v4));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D3748, "stringFromDate:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](NSLocale, "autoupdatingCurrentLocale"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter dateFormatFromTemplate:options:locale:](NSDateFormatter, "dateFormatFromTemplate:options:locale:", CFSTR("j"), 0, v12));
  v14 = objc_msgSend(v13, "containsString:", CFSTR("a"));

  v15 = 0;
  if (v14)
  {
    objc_msgSend((id)qword_1014D3748, "setDateFormat:", CFSTR("a"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D3748, "stringFromDate:", v10));
  }
  label = self->_label;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100884AD8;
  v24[3] = &unk_1011AC8B0;
  v24[4] = self;
  v25 = v11;
  v17 = v11;
  -[RidesharingBalloonETAView crossfadeView:animations:](self, "crossfadeView:animations:", label, v24);
  subLabel = self->_subLabel;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100884B3C;
  v21[3] = &unk_1011AD238;
  v21[4] = self;
  v22 = v15;
  v23 = v4;
  v19 = v4;
  v20 = v15;
  -[RidesharingBalloonETAView crossfadeView:animations:](self, "crossfadeView:animations:", subLabel, v21);
  -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");

}

- (void)crossfadeView:(id)a3 animations:(id)a4
{
  +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", a3, 5242884, a4, 0, 0.3);
}

- (id)_minutesText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingBalloonETAView minutes](self, "minutes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("%llu"), objc_msgSend(v2, "unsignedLongLongValue")));

  return v3;
}

+ (id)balloonFillColor
{
  return +[UIColor blackColor](UIColor, "blackColor");
}

+ (id)balloonStrokeColor
{
  return +[UIColor blackColor](UIColor, "blackColor");
}

- (NSNumber)minutes
{
  return self->_minutes;
}

- (void)setMinutes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)balloonState
{
  return self->_balloonState;
}

- (void)setBalloonState:(unint64_t)a3
{
  self->_balloonState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minutes, 0);
  objc_storeStrong((id *)&self->_subLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
