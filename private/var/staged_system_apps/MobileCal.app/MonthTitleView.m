@implementation MonthTitleView

- (MonthTitleView)initWithFrame:(CGRect)a3
{
  double y;
  double x;
  MonthTitleView *v5;
  MonthTitleView *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  UILabel *v11;
  UILabel *titleLabel;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;
  uint64_t v21;

  y = a3.origin.y;
  x = a3.origin.x;
  v20.receiver = self;
  v20.super_class = (Class)MonthTitleView;
  v5 = -[MonthTitleView initWithFrame:](&v20, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MonthTitleView backgroundImage](v5, "backgroundImage"));
    objc_msgSend(v7, "size");
    -[MonthTitleView setFrame:](v6, "setFrame:", x, y, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithPatternImage:](UIColor, "colorWithPatternImage:", v7));
    -[MonthTitleView setBackgroundColor:](v6, "setBackgroundColor:", v10);

    -[MonthTitleView setAlpha:](v6, "setAlpha:", 0.0);
    v11 = objc_opt_new(UILabel);
    titleLabel = v6->_titleLabel;
    v6->_titleLabel = v11;

    -[UILabel setAutoresizingMask:](v6->_titleLabel, "setAutoresizingMask:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    -[UILabel setBackgroundColor:](v6->_titleLabel, "setBackgroundColor:", v13);

    -[UILabel setOpaque:](v6->_titleLabel, "setOpaque:", 1);
    -[UILabel setNumberOfLines:](v6->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v6->_titleLabel, "setTextAlignment:", 1);
    -[MonthTitleView addSubview:](v6, "addSubview:", v6->_titleLabel);
    objc_initWeak(&location, v6);
    v21 = objc_opt_class(UITraitUserInterfaceStyle);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10003C434;
    v17[3] = &unk_1001B2418;
    objc_copyWeak(&v18, &location);
    v15 = -[MonthTitleView registerForTraitChanges:withHandler:](v6, "registerForTraitChanges:withHandler:", v14, v17);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
  return v6;
}

- (void)setFont:(id)a3
{
  -[UILabel setFont:](self->_titleLabel, "setFont:", a3);
}

- (id)backgroundImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("monthScrollingHUDBackground")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_flatImageWithColor:", v3));

  return v4;
}

- (void)animateVisible:(BOOL)a3 duration:(double)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  double v9;
  _QWORD v10[5];
  BOOL v11;
  _QWORD v12[5];
  BOOL v13;

  v6 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003C67C;
  v12[3] = &unk_1001B2510;
  v12[4] = self;
  v13 = a3;
  v8 = a5;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 327684, v12, v8, a4, 0.0);
  v9 = a4 * 0.8;
  if (v6)
    v9 = a4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003C698;
  v10[3] = &unk_1001B2510;
  v10[4] = self;
  v11 = v6;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 327684, v10, v8, v9, 0.0);

}

- (void)setCalendarDate:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  EKCalendarDate *calendarDate;
  CGRect v15;

  v4 = a3;
  v5 = objc_msgSend(v4, "year");
  if (v5 != -[EKCalendarDate year](self->_calendarDate, "year")
    || (v6 = objc_msgSend(v4, "month"), v6 != -[EKCalendarDate month](self->_calendarDate, "month")))
  {
    if (v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));
      v8 = CUIKStringForMonthYear(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      -[UILabel setText:](self->_titleLabel, "setText:", v9);

    }
    else
    {
      -[UILabel setText:](self->_titleLabel, "setText:", &stru_1001B67C0);
    }
    -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
    -[UILabel frame](self->_titleLabel, "frame");
    v11 = v10;
    v13 = v12;
    -[MonthTitleView bounds](self, "bounds");
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v11, 14.0, CGRectGetWidth(v15), v13);
  }
  calendarDate = self->_calendarDate;
  self->_calendarDate = (EKCalendarDate *)v4;

}

- (EKCalendarDate)calendarDate
{
  return self->_calendarDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarDate, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
