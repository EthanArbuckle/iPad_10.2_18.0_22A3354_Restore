@implementation APECBackoffTimer

- (void)setCurrentTimer:(id)a3
{
  objc_storeStrong((id *)&self->_currentTimer, a3);
}

- (void)setCurrentIndex:(int64_t)a3
{
  self->_currentIndex = a3;
}

- (void)resetTimer
{
  -[APECBackoffTimer setCurrentIndex:](self, "setCurrentIndex:", 0x7FFFFFFFFFFFFFFFLL);
  -[APECBackoffTimer setCurrentTimer:](self, "setCurrentTimer:", 0);
}

- (BOOL)isWaitingForBackoff
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APECBackoffTimer currentTimer](self, "currentTimer"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[APECBackoffTimer currentTimer](self, "currentTimer"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APECBackoffTimer clock](self, "clock"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "now"));
    v7 = objc_msgSend(v4, "containsDate:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (APECBackoffTimer)initWithClock:(id)a3
{
  id v5;
  APECBackoffTimer *v6;
  APECBackoffTimer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APECBackoffTimer;
  v6 = -[APECBackoffTimer init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clock, a3);
    v7->_currentIndex = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (NSDateInterval)currentTimer
{
  return self->_currentTimer;
}

- (NSDate)scheduledDate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APECBackoffTimer currentTimer](self, "currentTimer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "endDate"));

  return (NSDate *)v3;
}

- (void)startMinimumTimer:(double)a3
{
  -[APECBackoffTimer startTimerAt:](self, "startTimerAt:", -[APECBackoffTimer indexContainingDuration:](self, "indexContainingDuration:", a3));
}

- (void)startNextTimer
{
  -[APECBackoffTimer startTimerAt:](self, "startTimerAt:", -[APECBackoffTimer nextIndex](self, "nextIndex"));
}

- (int64_t)indexContainingDuration:(double)a3
{
  unint64_t i;

  for (i = 0; i != 9; ++i)
  {
    if (dbl_1001B8678[i] >= a3)
      break;
  }
  if (i >= 8)
    return 8;
  else
    return i;
}

- (int64_t)nextIndex
{
  int64_t result;
  uint64_t v4;

  if (-[APECBackoffTimer currentIndex](self, "currentIndex") == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v4 = -[APECBackoffTimer currentIndex](self, "currentIndex");
  result = -[APECBackoffTimer currentIndex](self, "currentIndex");
  if (v4 < 8)
    ++result;
  return result;
}

- (void)startTimerAt:(int64_t)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  -[APECBackoffTimer setCurrentIndex:](self, "setCurrentIndex:", a3);
  v4 = objc_alloc((Class)NSDateInterval);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[APECBackoffTimer clock](self, "clock"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "now"));
  v6 = objc_msgSend(v4, "initWithStartDate:duration:", v5, dbl_1001B8678[-[APECBackoffTimer currentIndex](self, "currentIndex")]);
  -[APECBackoffTimer setCurrentTimer:](self, "setCurrentTimer:", v6);

}

- (APClock)clock
{
  return self->_clock;
}

- (void)setClock:(id)a3
{
  objc_storeStrong((id *)&self->_clock, a3);
}

- (int64_t)currentIndex
{
  return self->_currentIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTimer, 0);
  objc_storeStrong((id *)&self->_clock, 0);
}

@end
