@implementation CHFriendInboxBarButtonView

- (CHFriendInboxBarButtonView)init
{
  CHFriendInboxBarButtonView *v2;
  void *v3;
  UIImageView *v4;
  UIImageView *contactsImageView;
  CHFriendInboxBadgeView *v6;
  CHFriendInboxBadgeView *badgeView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CHFriendInboxBarButtonView;
  v2 = -[CHFriendInboxBarButtonView initWithFrame:](&v9, "initWithFrame:", 0.0, 0.0, 39.0, 27.0);
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("person.2.badge.gearshape.fill")));
    v4 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v3);
    contactsImageView = v2->_contactsImageView;
    v2->_contactsImageView = v4;

    -[UIImageView setBounds:](v2->_contactsImageView, "setBounds:", 0.0, 0.0, 39.0, 27.0);
    -[CHFriendInboxBarButtonView addSubview:](v2, "addSubview:", v2->_contactsImageView);
    v6 = -[CHFriendInboxBadgeView initWithFrame:]([CHFriendInboxBadgeView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    badgeView = v2->_badgeView;
    v2->_badgeView = v6;

    -[CHFriendInboxBadgeView setHidden:](v2->_badgeView, "setHidden:", 1);
    -[CHFriendInboxBarButtonView addSubview:](v2, "addSubview:", v2->_badgeView);
    -[CHFriendInboxBarButtonView setUserInteractionEnabled:](v2, "setUserInteractionEnabled:", 1);

  }
  return v2;
}

- (void)layoutSubviews
{
  double MidX;
  CGFloat v4;
  objc_super v5;
  CGRect v6;
  CGRect v7;
  CGRect v8;
  CGRect v9;

  v5.receiver = self;
  v5.super_class = (Class)CHFriendInboxBarButtonView;
  -[CHFriendInboxBarButtonView layoutSubviews](&v5, "layoutSubviews");
  -[CHFriendInboxBarButtonView bounds](self, "bounds");
  MidX = CGRectGetMidX(v6);
  -[CHFriendInboxBarButtonView bounds](self, "bounds");
  -[UIImageView setCenter:](self->_contactsImageView, "setCenter:", MidX, CGRectGetMidY(v7));
  -[CHFriendInboxBadgeView sizeToFit](self->_badgeView, "sizeToFit");
  -[UIImageView frame](self->_contactsImageView, "frame");
  v4 = CGRectGetMaxX(v8) + -1.0;
  -[CHFriendInboxBadgeView bounds](self->_badgeView, "bounds");
  -[CHFriendInboxBadgeView setCenter:](self->_badgeView, "setCenter:", v4, CGRectGetMidX(v9) + -5.0);
}

- (void)setTintColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CHFriendInboxBarButtonView;
  v4 = a3;
  -[CHFriendInboxBarButtonView setTintColor:](&v5, "setTintColor:", v4);
  -[CHFriendInboxBadgeView setTintColor:](self->_badgeView, "setTintColor:", v4, v5.receiver, v5.super_class);
  -[UIImageView setTintColor:](self->_contactsImageView, "setTintColor:", v4);

}

- (void)setBadgeText:(id)a3
{
  _BOOL8 v4;
  id v5;

  v5 = a3;
  -[CHFriendInboxBadgeView setBadgeText:](self->_badgeView, "setBadgeText:", v5);
  if (v5)
    v4 = objc_msgSend(v5, "length") == 0;
  else
    v4 = 1;
  -[CHFriendInboxBadgeView setHidden:](self->_badgeView, "setHidden:", v4);
  -[CHFriendInboxBarButtonView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_animateToTappedState:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10005B820;
  v3[3] = &unk_100777E48;
  v3[4] = self;
  v4 = a3;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v3, 0.2);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[CHFriendInboxBarButtonView _animateToTappedState:](self, "_animateToTappedState:", 1, a4);
}

- (BOOL)_touchesInside:(id)a3
{
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  CGPoint v10;
  CGRect v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "anyObject"));
  objc_msgSend(v4, "locationInView:", self);
  v6 = v5;
  v8 = v7;

  -[CHFriendInboxBarButtonView bounds](self, "bounds");
  v10.x = v6;
  v10.y = v8;
  return CGRectContainsPoint(v11, v10);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;
  unsigned int v6;
  id WeakRetained;

  v5 = a3;
  -[CHFriendInboxBarButtonView _animateToTappedState:](self, "_animateToTappedState:", 0);
  v6 = -[CHFriendInboxBarButtonView _touchesInside:](self, "_touchesInside:", v5);

  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "didTapInboxBarButtonView:", self);

  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  -[CHFriendInboxBarButtonView _animateToTappedState:](self, "_animateToTappedState:", -[CHFriendInboxBarButtonView _touchesInside:](self, "_touchesInside:", a3, a4));
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[CHFriendInboxBarButtonView _animateToTappedState:](self, "_animateToTappedState:", 0, a4);
}

- (CHFriendInboxBarButtonViewDelegate)delegate
{
  return (CHFriendInboxBarButtonViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)badgeText
{
  return self->_badgeText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeText, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_contactsImageView, 0);
}

@end
