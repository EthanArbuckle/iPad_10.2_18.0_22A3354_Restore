@implementation MTATimerRecentCollectionViewCell

- (void)updateWithDuration:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerBaseCollectionViewCell timerControlsView](self, "timerControlsView"));
  objc_msgSend(v10, "duration");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title"));
  if (v7)
  {
    objc_msgSend(v4, "setDurationTime:title:", v7, v6);
  }
  else
  {
    objc_msgSend(v10, "duration");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTAUtilities durationStringFromInterval:](MTAUtilities, "durationStringFromInterval:"));
    objc_msgSend(v4, "setDurationTime:title:", v8, v6);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerBaseCollectionViewCell timerControlsView](self, "timerControlsView"));
  objc_msgSend(v9, "setState:", 0);

}

- (unint64_t)defaultViewStyle
{
  return 7;
}

- (void)startTimer:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerBaseCollectionViewCell delegate](self, "delegate", a3));
  objc_msgSend(v4, "startRecentTimerForCell:", self);

}

- (void)deleteRecent:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerBaseCollectionViewCell delegate](self, "delegate", a3));
  objc_msgSend(v4, "deleteRecentTimerForCell:", self);

}

@end
