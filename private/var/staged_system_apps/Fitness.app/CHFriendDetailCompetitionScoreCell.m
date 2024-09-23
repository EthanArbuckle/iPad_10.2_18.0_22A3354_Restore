@implementation CHFriendDetailCompetitionScoreCell

- (CHFriendDetailCompetitionScoreCell)initWithFrame:(CGRect)a3
{
  CHFriendDetailCompetitionScoreCell *v3;
  uint64_t v4;
  ASCompetitionScoreViewConfiguration *configuration;
  ASCompetitionScoreView *v6;
  ASCompetitionScoreView *scoreView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CHFriendDetailCompetitionScoreCell;
  v3 = -[CHFriendDetailCompetitionScoreCell initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[ASCompetitionScoreViewConfiguration companionTotalScoreFriendDetailConfiguration](ASCompetitionScoreViewConfiguration, "companionTotalScoreFriendDetailConfiguration"));
    configuration = v3->_configuration;
    v3->_configuration = (ASCompetitionScoreViewConfiguration *)v4;

    v6 = (ASCompetitionScoreView *)objc_msgSend(objc_alloc((Class)ASCompetitionScoreView), "initWithConfiguration:", v3->_configuration);
    scoreView = v3->_scoreView;
    v3->_scoreView = v6;

    -[CHFriendDetailCompetitionScoreCell addSubview:](v3, "addSubview:", v3->_scoreView);
  }
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHFriendDetailCompetitionScoreCell;
  -[CHFriendDetailCompetitionScoreCell layoutSubviews](&v3, "layoutSubviews");
  -[CHFriendDetailCompetitionScoreCell bounds](self, "bounds");
  -[ASCompetitionScoreView setFrame:](self->_scoreView, "setFrame:");
}

- (void)setFriend:(id)a3 competition:(id)a4
{
  -[ASCompetitionScoreView setFriend:competition:](self->_scoreView, "setFriend:competition:", a3, a4);
}

- (double)preferredHeightForFriend:(id)a3
{
  double result;

  +[ASCompetitionScoreView preferredHeightForConfiguration:friend:](ASCompetitionScoreView, "preferredHeightForConfiguration:friend:", self->_configuration, a3);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_friend, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_scoreView, 0);
}

@end
