@implementation VUINowPlayingTimerFeatureInfo

- (NSTimer)repeatingTimer
{
  return (NSTimer *)objc_loadWeakRetained((id *)&self->_repeatingTimer);
}

- (void)setRepeatingTimer:(id)a3
{
  objc_storeWeak((id *)&self->_repeatingTimer, a3);
}

- (NSTimer)oneTimeTimer
{
  return (NSTimer *)objc_loadWeakRetained((id *)&self->_oneTimeTimer);
}

- (void)setOneTimeTimer:(id)a3
{
  objc_storeWeak((id *)&self->_oneTimeTimer, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)backgroundedDate
{
  return self->_backgroundedDate;
}

- (void)setBackgroundedDate:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundedDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundedDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_destroyWeak((id *)&self->_oneTimeTimer);
  objc_destroyWeak((id *)&self->_repeatingTimer);
}

@end
