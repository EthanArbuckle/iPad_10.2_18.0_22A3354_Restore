@implementation CHFriendDetailCompetitionTotalWinsCell

- (CHFriendDetailCompetitionTotalWinsCell)initWithFrame:(CGRect)a3
{
  CHFriendDetailCompetitionTotalWinsCell *v3;
  CHFriendDetailCompetitionTotalWinsCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CHFriendDetailCompetitionTotalWinsCell;
  v3 = -[CHFriendDetailCompetitionTotalWinsCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CHFriendDetailCompetitionTotalWinsCell _updateConfigurationForStandalone:](v3, "_updateConfigurationForStandalone:", 0);
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHFriendDetailCompetitionTotalWinsCell;
  -[CHFriendDetailCompetitionTotalWinsCell layoutSubviews](&v3, "layoutSubviews");
  -[CHFriendDetailCompetitionTotalWinsCell bounds](self, "bounds");
  -[ASCompetitionScoreView setFrame:](self->_scoreView, "setFrame:");
}

- (void)setFriend:(id)a3 competition:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (self->_standalone != (objc_msgSend(v7, "isCompetitionActive") ^ 1))
    -[CHFriendDetailCompetitionTotalWinsCell _updateConfigurationForStandalone:](self, "_updateConfigurationForStandalone:");
  -[ASCompetitionScoreView setFriend:competition:](self->_scoreView, "setFriend:competition:", v7, v6);

}

- (double)preferredHeightForFriend:(id)a3
{
  double result;

  +[ASCompetitionScoreView preferredHeightForConfiguration:friend:](ASCompetitionScoreView, "preferredHeightForConfiguration:friend:", self->_configuration, a3);
  return result;
}

- (void)_updateConfigurationForStandalone:(BOOL)a3
{
  _BOOL4 v3;
  ASCompetitionScoreViewConfiguration *v5;
  ASCompetitionScoreViewConfiguration *configuration;
  ASCompetitionScoreView *v7;
  ASCompetitionScoreView *scoreView;

  v3 = a3;
  self->_standalone = a3;
  -[ASCompetitionScoreView removeFromSuperview](self->_scoreView, "removeFromSuperview");
  if (v3)
    v5 = (ASCompetitionScoreViewConfiguration *)objc_claimAutoreleasedReturnValue(+[ASCompetitionScoreViewConfiguration companionTotalWinsStandaloneFriendDetailConfiguration](ASCompetitionScoreViewConfiguration, "companionTotalWinsStandaloneFriendDetailConfiguration"));
  else
    v5 = (ASCompetitionScoreViewConfiguration *)objc_claimAutoreleasedReturnValue(+[ASCompetitionScoreViewConfiguration companionTotalWinsFriendDetailConfiguration](ASCompetitionScoreViewConfiguration, "companionTotalWinsFriendDetailConfiguration"));
  configuration = self->_configuration;
  self->_configuration = v5;

  v7 = (ASCompetitionScoreView *)objc_msgSend(objc_alloc((Class)ASCompetitionScoreView), "initWithConfiguration:", self->_configuration);
  scoreView = self->_scoreView;
  self->_scoreView = v7;

  -[CHFriendDetailCompetitionTotalWinsCell addSubview:](self, "addSubview:", self->_scoreView);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_friend, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_scoreView, 0);
}

@end
