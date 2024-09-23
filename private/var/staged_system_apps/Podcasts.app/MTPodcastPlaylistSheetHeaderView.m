@implementation MTPodcastPlaylistSheetHeaderView

- (MTPodcastPlaylistSheetHeaderView)initWithFrame:(CGRect)a3
{
  MTPodcastPlaylistSheetHeaderView *v3;
  id v4;
  double y;
  double width;
  double height;
  UISwitch *v8;
  UISwitch *v9;
  UILabel *v10;
  UILabel *title;
  UILabel *v12;
  void *v13;
  void *v14;
  UILabel *v15;
  void *v16;
  UILabel *v17;
  void *v18;
  UILabel *v19;
  void *v20;
  MTPodcastPlaylistSheetHeaderView *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)MTPodcastPlaylistSheetHeaderView;
  v3 = -[MTPodcastPlaylistSheetHeaderView initWithFrame:](&v23, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc((Class)UISwitch);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v8 = (UISwitch *)objc_msgSend(v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    v9 = v3->_switch;
    v3->_switch = v8;

    -[UISwitch addTarget:action:forControlEvents:](v3->_switch, "addTarget:action:forControlEvents:", v3, "buttonTapped:", 4096);
    -[MTPodcastPlaylistSheetHeaderView addSubview:](v3, "addSubview:", v3->_switch);
    v10 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    title = v3->_title;
    v3->_title = v10;

    v12 = v3->_title;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("All Podcasts Button"), &stru_1004C6D40, 0));
    -[UILabel setText:](v12, "setText:", v14);

    v15 = v3->_title;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont headerTitleFont](UIFont, "headerTitleFont"));
    -[UILabel setFont:](v15, "setFont:", v16);

    v17 = v3->_title;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v17, "setBackgroundColor:", v18);

    v19 = v3->_title;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor cellTextColor](UIColor, "cellTextColor"));
    -[UILabel setTextColor:](v19, "setTextColor:", v20);

    -[MTPodcastPlaylistSheetHeaderView addSubview:](v3, "addSubview:", v3->_title);
    v21 = v3;
  }

  return v3;
}

- (void)layoutSubviews
{
  UIUserInterfaceLayoutDirection v3;
  UILabel *title;
  void *v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  UIView *separator;
  double MaxY;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double MaxX;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  objc_super v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v27.receiver = self;
  v27.super_class = (Class)MTPodcastPlaylistSheetHeaderView;
  -[MTPodcastPlaylistSheetHeaderView layoutSubviews](&v27, "layoutSubviews");
  v3 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[MTPodcastPlaylistSheetHeaderView semanticContentAttribute](self, "semanticContentAttribute"));
  title = self->_title;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont headerTitleFont](UIFont, "headerTitleFont"));
  -[UILabel setFont:](title, "setFont:", v5);

  -[MTPodcastPlaylistSheetHeaderView bounds](self, "bounds");
  x = v28.origin.x;
  y = v28.origin.y;
  width = v28.size.width;
  height = v28.size.height;
  separator = self->_separator;
  MaxY = CGRectGetMaxY(v28);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v12, "scale");
  v14 = v13;

  v15 = MaxY - 1.0 / v14;
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  v16 = CGRectGetWidth(v29);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v17, "scale");
  v19 = v18;

  -[UIView setFrame:](separator, "setFrame:", 0.0, v15, v16, 1.0 / v19);
  -[UISwitch sizeToFit](self->_switch, "sizeToFit");
  -[UILabel sizeToFit](self->_title, "sizeToFit");
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  MaxX = CGRectGetMaxX(v30);
  if (v3 == UIUserInterfaceLayoutDirectionRightToLeft)
  {
    -[UILabel bounds](self->_title, "bounds");
    v21 = MaxX - CGRectGetWidth(v31) + -20.0;
    v22 = 20.0;
  }
  else
  {
    -[UISwitch bounds](self->_switch, "bounds");
    v22 = MaxX - CGRectGetWidth(v32) + -20.0;
    v21 = 20.0;
  }
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  v23 = CGRectGetHeight(v33);
  -[UISwitch bounds](self->_switch, "bounds");
  v24 = ceil((v23 - CGRectGetHeight(v34)) * 0.5);
  -[UISwitch frame](self->_switch, "frame");
  -[UISwitch setFrame:](self->_switch, "setFrame:", v22, v24);
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  v25 = CGRectGetHeight(v35);
  -[UILabel bounds](self->_title, "bounds");
  v26 = ceil((v25 - CGRectGetHeight(v36)) * 0.5);
  -[UILabel frame](self->_title, "frame");
  -[UILabel setFrame:](self->_title, "setFrame:", v21, v26);
}

- (void)buttonTapped:(id)a3
{
  id v4;
  void (**action)(id, MTPodcastPlaylistSheetHeaderView *, id);

  v4 = objc_msgSend(a3, "isOn");
  self->_on = (char)v4;
  action = (void (**)(id, MTPodcastPlaylistSheetHeaderView *, id))self->_action;
  if (action)
    action[2](action, self, v4);
}

- (void)setOn:(BOOL)a3
{
  _BOOL8 v3;
  void (**action)(id, MTPodcastPlaylistSheetHeaderView *, _BOOL8);

  v3 = a3;
  self->_on = a3;
  -[UISwitch setOn:](self->_switch, "setOn:");
  action = (void (**)(id, MTPodcastPlaylistSheetHeaderView *, _BOOL8))self->_action;
  if (action)
    action[2](action, self, v3);
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)on
{
  return self->_on;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_switch, 0);
  objc_storeStrong((id *)&self->_separator, 0);
}

@end
