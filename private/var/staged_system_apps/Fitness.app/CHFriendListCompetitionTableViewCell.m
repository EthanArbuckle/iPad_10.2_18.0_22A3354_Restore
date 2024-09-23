@implementation CHFriendListCompetitionTableViewCell

- (CHFriendListCompetitionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CHFriendListCompetitionTableViewCell *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  ASCompetitionScoreViewConfiguration *configuration;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  ASCompetitionScoreView *v18;
  ASCompetitionScoreView *scoreView;
  void *v20;
  UILabel *v21;
  UILabel *daysRemainingLabel;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)CHFriendListCompetitionTableViewCell;
  v4 = -[CHFriendListCompetitionTableViewCell initWithStyle:reuseIdentifier:](&v27, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    -[CHFriendListCompetitionTableViewCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = sub_100032490();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListCompetitionTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v8, "setBackgroundColor:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListCompetitionTableViewCell contentView](v4, "contentView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layer"));
    objc_msgSend(v10, "setCornerRadius:", 12.0);

    v11 = objc_claimAutoreleasedReturnValue(+[ASCompetitionScoreViewConfiguration companionFriendListConfiguration](ASCompetitionScoreViewConfiguration, "companionFriendListConfiguration"));
    configuration = v4->_configuration;
    v4->_configuration = (ASCompetitionScoreViewConfiguration *)v11;

    -[ASCompetitionScoreViewConfiguration setSideMargin:](v4->_configuration, "setSideMargin:", 16.0);
    -[ASCompetitionScoreViewConfiguration setMinimumMiddleMargin:](v4->_configuration, "setMinimumMiddleMargin:", 0.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
    -[ASCompetitionScoreViewConfiguration setNameFont:](v4->_configuration, "setNameFont:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle2));
    -[ASCompetitionScoreViewConfiguration setPrimaryScoreFont:](v4->_configuration, "setPrimaryScoreFont:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle2));
    -[ASCompetitionScoreViewConfiguration setPrimaryScoreUnitFont:](v4->_configuration, "setPrimaryScoreUnitFont:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption1));
    -[ASCompetitionScoreViewConfiguration setSecondaryScoreFont:](v4->_configuration, "setSecondaryScoreFont:", v16);

    -[CHFriendListCompetitionTableViewCell _sectionWidth](v4, "_sectionWidth");
    -[ASCompetitionScoreViewConfiguration setOpponentScoreViewWidth:](v4->_configuration, "setOpponentScoreViewWidth:", v17 + 10.0);
    v18 = (ASCompetitionScoreView *)objc_msgSend(objc_alloc((Class)ASCompetitionScoreView), "initWithConfiguration:", v4->_configuration);
    scoreView = v4->_scoreView;
    v4->_scoreView = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListCompetitionTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v20, "addSubview:", v4->_scoreView);

    v21 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    daysRemainingLabel = v4->_daysRemainingLabel;
    v4->_daysRemainingLabel = v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor as_lightCompetitionGold](UIColor, "as_lightCompetitionGold"));
    -[UILabel setTextColor:](v4->_daysRemainingLabel, "setTextColor:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption1));
    -[UILabel setFont:](v4->_daysRemainingLabel, "setFont:", v24);

    -[UILabel setNumberOfLines:](v4->_daysRemainingLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v4->_daysRemainingLabel, "setLineBreakMode:", 0);
    -[UILabel setTextAlignment:](v4->_daysRemainingLabel, "setTextAlignment:", 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListCompetitionTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v25, "addSubview:", v4->_daysRemainingLabel);

  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double Width;
  void *v22;
  double Height;
  double v24;
  double v25;
  void *v26;
  objc_super v27;
  UILabel *daysRemainingLabel;
  CGRect v29;
  CGRect v30;

  v27.receiver = self;
  v27.super_class = (Class)CHFriendListCompetitionTableViewCell;
  -[CHFriendListCompetitionTableViewCell layoutSubviews](&v27, "layoutSubviews");
  v3 = sub_100032C10();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListCompetitionTableViewCell contentView](self, "contentView"));
  objc_msgSend(v10, "frame");
  v12 = v5 + v11;
  v14 = v3 + v13;
  v16 = v15 - (v5 + v9);
  v18 = v17 - (v3 + v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListCompetitionTableViewCell contentView](self, "contentView"));
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListCompetitionTableViewCell contentView](self, "contentView"));
  objc_msgSend(v20, "bounds");
  Width = CGRectGetWidth(v29);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListCompetitionTableViewCell contentView](self, "contentView"));
  objc_msgSend(v22, "bounds");
  Height = CGRectGetHeight(v30);

  -[ASCompetitionScoreView setFrame:](self->_scoreView, "setFrame:", 0.0, 0.0, Width, Height);
  -[CHFriendListCompetitionTableViewCell _sectionWidth](self, "_sectionWidth");
  -[UILabel sizeThatFits:](self->_daysRemainingLabel, "sizeThatFits:");
  -[UILabel setFrame:](self->_daysRemainingLabel, "setFrame:", Width + -16.0 - v24, (Height - v25) * 0.5, v24, v25);
  if ((id)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", 0) == (id)1)
  {
    daysRemainingLabel = self->_daysRemainingLabel;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &daysRemainingLabel, 1));
    -[CHFriendListCompetitionTableViewCell ch_transformViewsForRightToLeftLanguages:](self, "ch_transformViewsForRightToLeftLanguages:", v26);

  }
}

- (double)_sectionWidth
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v2, "bounds");
  v4 = v3;

  sub_100032C10();
  return (v4 - v5 + -32.0 - v6) / 3.0;
}

- (void)setFriend:(id)a3
{
  ASCompetitionScoreView *scoreView;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  scoreView = self->_scoreView;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentCompetition"));
  -[ASCompetitionScoreView setFriend:competition:](scoreView, "setFriend:competition:", v5, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "as_competitionStageString"));
  -[UILabel setText:](self->_daysRemainingLabel, "setText:", v7);

  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("friend_competition_row_%@"), v8));
  -[CHFriendListCompetitionTableViewCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v9);

}

+ (double)preferredHeightForConfiguration:(id)a3 friend:(id)a4
{
  double result;

  +[ASCompetitionScoreView preferredHeightForConfiguration:friend:](ASCompetitionScoreView, "preferredHeightForConfiguration:friend:", a3, a4);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daysRemainingLabel, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_scoreView, 0);
}

@end
