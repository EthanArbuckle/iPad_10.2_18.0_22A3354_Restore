@implementation PLEntryInfo

- (PLEntryInfo)initWithNotificationComposition:(id)a3 minRequestInterval:(double)a4
{
  id v7;
  PLEntryInfo *v8;
  PLEntryInfo *v9;
  uint64_t v10;
  NSDate *lastQueryDate;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLEntryInfo;
  v8 = -[PLEntryInfo init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_notificationComposition, a3);
    v9->_minRequestInterval = a4;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v10 = objc_claimAutoreleasedReturnValue();
    lastQueryDate = v9->_lastQueryDate;
    v9->_lastQueryDate = (NSDate *)v10;

  }
  return v9;
}

- (PLEntryNotificationOperatorComposition)notificationComposition
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 8, 1);
}

- (void)setNotificationComposition:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (double)minRequestInterval
{
  return self->_minRequestInterval;
}

- (void)setMinRequestInterval:(double)a3
{
  self->_minRequestInterval = a3;
}

- (NSDate)lastQueryDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLastQueryDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastQueryDate, 0);
  objc_storeStrong((id *)&self->_notificationComposition, 0);
}

@end
