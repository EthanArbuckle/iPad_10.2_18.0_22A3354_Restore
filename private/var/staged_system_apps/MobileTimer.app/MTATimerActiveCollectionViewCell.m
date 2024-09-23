@implementation MTATimerActiveCollectionViewCell

- (MTATimerActiveCollectionViewCell)initWithFrame:(CGRect)a3
{
  MTATimerActiveCollectionViewCell *v3;
  MTATimerActiveCollectionViewCell *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTATimerActiveCollectionViewCell;
  v3 = -[MTATimerBaseCollectionViewCell initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerBaseCollectionViewCell timerControlsView](v3, "timerControlsView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v5, "applyBackgroundColor:", v6);

  }
  return v4;
}

- (void)refreshUI:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerBaseCollectionViewCell timerControlsView](self, "timerControlsView"));
  objc_msgSend(v5, "remainingTime");
  v8 = v7;
  objc_msgSend(v5, "duration");
  v10 = v9;
  v11 = objc_msgSend(v5, "state");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerActiveCollectionViewCell titleForTimer:](self, "titleForTimer:", v5));
  objc_msgSend(v6, "setRemainingTime:duration:state:title:forceRefresh:", v11, v12, 1, v8, v10);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerBaseCollectionViewCell timerControlsView](self, "timerControlsView"));
  objc_msgSend(v5, "remainingTime");
  v15 = v14;

  objc_msgSend(v13, "setTime:", v15);
  -[MTATimerActiveCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (id)titleForTimer:(id)a3
{
  id v3;
  double v4;
  double v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "hasDefaultTitle"))
  {
    objc_msgSend(v3, "duration");
    v5 = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTAUtilities durationStringFromInterval:](MTAUtilities, "durationStringFromInterval:", v5));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));

  }
  return v6;
}

- (void)setHighlighted:(BOOL)a3
{
  void *v5;
  int v6;
  int v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTATimerActiveCollectionViewCell;
  -[MTATimerActiveCollectionViewCell setHighlighted:](&v9, "setHighlighted:");
  if (a3 || -[MTATimerActiveCollectionViewCell isSelected](self, "isSelected"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_cellHighlightColor](UIColor, "mtui_cellHighlightColor"));
    v6 = 0;
    v7 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_foregroundColor](UIColor, "mtui_foregroundColor"));
    v7 = 0;
    v6 = 1;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerActiveCollectionViewCell contentView](self, "contentView"));
  objc_msgSend(v8, "setBackgroundColor:", v5);

  if (v6)
  if (v7)

}

- (void)setSelected:(BOOL)a3
{
  void *v5;
  int v6;
  int v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTATimerActiveCollectionViewCell;
  -[MTATimerActiveCollectionViewCell setSelected:](&v9, "setSelected:");
  if (a3 || -[MTATimerActiveCollectionViewCell isHighlighted](self, "isHighlighted"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_cellHighlightColor](UIColor, "mtui_cellHighlightColor"));
    v6 = 0;
    v7 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_foregroundColor](UIColor, "mtui_foregroundColor"));
    v7 = 0;
    v6 = 1;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerActiveCollectionViewCell contentView](self, "contentView"));
  objc_msgSend(v8, "setBackgroundColor:", v5);

  if (v6)
  if (v7)

}

- (void)startTimer:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerBaseCollectionViewCell delegate](self, "delegate", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerBaseCollectionViewCell timerControlsView](self, "timerControlsView"));
  objc_msgSend(v4, "countDownDuration");
  objc_msgSend(v5, "startTimerForCell:withDuration:", self);

}

- (void)cancelTimer:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerBaseCollectionViewCell delegate](self, "delegate", a3));
  objc_msgSend(v4, "cancelTimerForCell:", self);

}

- (void)pauseResumeTimer:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerBaseCollectionViewCell delegate](self, "delegate", a3));
  objc_msgSend(v4, "pauseResumeTimerForCell:", self);

}

- (void)didSelectPresetWithDuration:(double)a3
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerBaseCollectionViewCell delegate](self, "delegate"));
  objc_msgSend(v5, "startTimerForCell:withDuration:", self, a3);

}

- (MTTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (UIButton)deleteButton
{
  return self->_deleteButton;
}

- (void)setDeleteButton:(id)a3
{
  objc_storeStrong((id *)&self->_deleteButton, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
