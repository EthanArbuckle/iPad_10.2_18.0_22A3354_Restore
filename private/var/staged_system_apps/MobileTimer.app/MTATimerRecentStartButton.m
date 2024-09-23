@implementation MTATimerRecentStartButton

- (MTATimerRecentStartButton)initWithFrame:(CGRect)a3
{
  MTATimerRecentStartButton *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTATimerRecentStartButton;
  v3 = -[MTATimerRecentStartButton initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_startResumeButtonTintColor](UIColor, "mtui_startResumeButtonTintColor"));
    -[MTATimerRecentStartButton setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_startResumeButtonTextColor](UIColor, "mtui_startResumeButtonTextColor"));
    -[MTATimerRecentStartButton setTitleColor:forState:](v3, "setTitleColor:forState:", v5, 0);

  }
  return v3;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MTATimerRecentStartButton;
  -[MTATimerRecentStartButton setHighlighted:](&v7, "setHighlighted:");
  if (v3)
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor mtui_disabledStartButtonTintColor](UIColor, "mtui_disabledStartButtonTintColor"));
  else
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor mtui_startResumeButtonTintColor](UIColor, "mtui_startResumeButtonTintColor"));
  v6 = (void *)v5;
  -[MTATimerRecentStartButton setBackgroundColor:](self, "setBackgroundColor:", v5);

}

@end
