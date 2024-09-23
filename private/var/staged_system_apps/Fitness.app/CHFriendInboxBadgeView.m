@implementation CHFriendInboxBadgeView

- (CHFriendInboxBadgeView)initWithFrame:(CGRect)a3
{
  CHFriendInboxBadgeView *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  UIImageView *v8;
  UIImageView *backgroundImageView;
  UILabel *v10;
  UILabel *badgeTextLabel;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CHFriendInboxBadgeView;
  v3 = -[CHFriendInboxBadgeView initWithFrame:](&v15, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("ContactsBadgeBackground")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageWithRenderingMode:", 2));

    objc_msgSend(v5, "size");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resizableImageWithCapInsets:", 0.0, v6 * 0.5 + -0.5, 0.0, v6 * 0.5 + -0.5));
    v8 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v7);
    backgroundImageView = v3->_backgroundImageView;
    v3->_backgroundImageView = v8;

    -[CHFriendInboxBadgeView addSubview:](v3, "addSubview:", v3->_backgroundImageView);
    v10 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    badgeTextLabel = v3->_badgeTextLabel;
    v3->_badgeTextLabel = v10;

    -[UILabel setTextAlignment:](v3->_badgeTextLabel, "setTextAlignment:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 13.0));
    -[UILabel setFont:](v3->_badgeTextLabel, "setFont:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[UILabel setTextColor:](v3->_badgeTextLabel, "setTextColor:", v13);

    -[CHFriendInboxBadgeView addSubview:](v3, "addSubview:", v3->_badgeTextLabel);
  }
  return v3;
}

- (void)layoutSubviews
{
  double MidX;
  CGRect v4;
  CGRect v5;

  -[CHFriendInboxBadgeView bounds](self, "bounds");
  -[UIImageView setFrame:](self->_backgroundImageView, "setFrame:");
  -[CHFriendInboxBadgeView bounds](self, "bounds");
  -[UILabel setFrame:](self->_badgeTextLabel, "setFrame:");
  -[CHFriendInboxBadgeView bounds](self, "bounds");
  MidX = CGRectGetMidX(v4);
  -[CHFriendInboxBadgeView bounds](self, "bounds");
  -[UILabel setCenter:](self->_badgeTextLabel, "setCenter:", MidX, CGRectGetMidY(v5));
}

- (void)sizeToFit
{
  void *v3;
  double v4;
  double v5;
  float v6;
  float v7;
  CGRect v8;

  -[UILabel sizeToFit](self->_badgeTextLabel, "sizeToFit");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_backgroundImageView, "image"));
  objc_msgSend(v3, "size");
  v5 = v4;

  -[UILabel bounds](self->_badgeTextLabel, "bounds");
  v6 = CGRectGetWidth(v8) + 4.0;
  v7 = v5;
  -[CHFriendInboxBadgeView setBounds:](self, "setBounds:", 0.0, 0.0, fmaxf(v6, v7), v5);
}

- (void)setTintColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CHFriendInboxBadgeView;
  v4 = a3;
  -[CHFriendInboxBadgeView setTintColor:](&v5, "setTintColor:", v4);
  -[UIImageView setTintColor:](self->_backgroundImageView, "setTintColor:", v4, v5.receiver, v5.super_class);

}

- (void)setBadgeText:(id)a3
{
  -[UILabel setText:](self->_badgeTextLabel, "setText:", a3);
  -[CHFriendInboxBadgeView setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)badgeText
{
  return -[UILabel text](self->_badgeTextLabel, "text");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeTextLabel, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
}

@end
