@implementation CHFriendDetailCompetitionGraphCell

- (CHFriendDetailCompetitionGraphCell)initWithFrame:(CGRect)a3
{
  CHFriendDetailCompetitionGraphCell *v3;
  uint64_t v4;
  ASCompetitionGraphView *graphView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CHFriendDetailCompetitionGraphCell;
  v3 = -[CHFriendDetailCompetitionGraphCell initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[ASCompetitionGraphView companionGraph](ASCompetitionGraphView, "companionGraph"));
    graphView = v3->_graphView;
    v3->_graphView = (ASCompetitionGraphView *)v4;

    -[CHFriendDetailCompetitionGraphCell addSubview:](v3, "addSubview:", v3->_graphView);
  }
  return v3;
}

- (void)layoutSubviews
{
  double Width;
  double v4;
  CGRect v5;

  -[CHFriendDetailCompetitionGraphCell bounds](self, "bounds");
  Width = CGRectGetWidth(v5);
  -[ASCompetitionGraphView preferredHeight](self->_graphView, "preferredHeight");
  -[ASCompetitionGraphView setFrame:](self->_graphView, "setFrame:", 0.0, 0.0, Width, v4);
  -[ASCompetitionGraphView setNeedsLayout](self->_graphView, "setNeedsLayout");
}

- (void)setCompetition:(id)a3
{
  -[ASCompetitionGraphView setCompetition:](self->_graphView, "setCompetition:", a3);
  -[CHFriendDetailCompetitionGraphCell setNeedsLayout](self, "setNeedsLayout");
}

- (double)preferredHeight
{
  double result;

  -[ASCompetitionGraphView preferredHeight](self->_graphView, "preferredHeight");
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphView, 0);
}

@end
