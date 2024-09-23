@implementation CHFriendDetailThreeRingCell

- (void)_setupCell
{
  id v3;
  void *v4;
  void *v5;
  ARUIRingsView *v6;
  ARUIRingsView *ringsView;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;

  v3 = objc_alloc((Class)ARUIRingsView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIRingGroup activityRingGroupForRingType:](ARUIRingGroup, "activityRingGroupForRingType:", 3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "forCompanion"));
  v6 = (ARUIRingsView *)objc_msgSend(v3, "initWithRingGroup:", v5);
  ringsView = self->_ringsView;
  self->_ringsView = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ARUIRingsView ringGroup](self->_ringsView, "ringGroup"));
  objc_msgSend(v8, "setGroupDiameter:", 5.62950094e14);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ARUIRingsView ringGroup](self->_ringsView, "ringGroup"));
  LODWORD(v10) = 13.0;
  objc_msgSend(v9, "setThickness:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ARUIRingsView ringGroup](self->_ringsView, "ringGroup"));
  LODWORD(v12) = 1071225242;
  objc_msgSend(v11, "setInterspacing:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[ARUIRingsView setBackgroundColor:](self->_ringsView, "setBackgroundColor:", v13);

  -[CHFriendDetailThreeRingCell addSubview:](self, "addSubview:", self->_ringsView);
}

- (CHFriendDetailThreeRingCell)initWithFrame:(CGRect)a3
{
  CHFriendDetailThreeRingCell *v3;
  CHFriendDetailThreeRingCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CHFriendDetailThreeRingCell;
  v3 = -[CHFriendDetailThreeRingCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CHFriendDetailThreeRingCell _setupCell](v3, "_setupCell");
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  void *v4;
  objc_super v5;
  ARUIRingsView *ringsView;

  v5.receiver = self;
  v5.super_class = (Class)CHFriendDetailThreeRingCell;
  -[CHFriendDetailThreeRingCell layoutSubviews](&v5, "layoutSubviews");
  if (self->_isFriendHidingDataFromMe)
    v3 = 48.0;
  else
    v3 = 128.0;
  -[ARUIRingsView setFrame:](self->_ringsView, "setFrame:", 17.0, 21.0, v3, v3);
  if ((id)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", 0) == (id)1)
  {
    ringsView = self->_ringsView;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &ringsView, 1));
    -[CHFriendDetailThreeRingCell ch_transformViewsForRightToLeftLanguages:](self, "ch_transformViewsForRightToLeftLanguages:", v4);

  }
}

- (double)preferredHeight
{
  return dbl_100620900[!self->_isFriendHidingDataFromMe];
}

- (double)preferredWidth
{
  return dbl_100620910[!self->_isFriendHidingDataFromMe];
}

- (void)setActivitySummary:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;

  v4 = a4;
  self->_isFriendHidingDataFromMe = 0;
  objc_storeStrong((id *)&self->_activitySummary, a3);
  v7 = a3;
  -[ARUIRingsView hk_configureWithActivitySummary:animated:](self->_ringsView, "hk_configureWithActivitySummary:animated:", v7, v4);

}

- (void)setHidden:(BOOL)a3
{
  HKActivitySummary *activitySummary;

  self->_isFriendHidingDataFromMe = a3;
  if (a3)
  {
    activitySummary = self->_activitySummary;
    self->_activitySummary = 0;

    -[ARUIRingsView hk_configureWithActivitySummary:animated:](self->_ringsView, "hk_configureWithActivitySummary:animated:", 0, 0);
  }
}

- (void)setIsStandalonePhoneFitnessMode:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ARUIRingsView ringGroup](self->_ringsView, "ringGroup"));
  objc_msgSend(v4, "setIsStandalonePhoneFitnessMode:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activitySummary, 0);
  objc_storeStrong((id *)&self->_ringsView, 0);
}

@end
