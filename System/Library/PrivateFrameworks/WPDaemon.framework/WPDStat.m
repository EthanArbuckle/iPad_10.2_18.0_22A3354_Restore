@implementation WPDStat

- (void)startTime
{
  void *v3;
  id v4;

  -[WPDStat lastTime](self, "lastTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[WPDStat setLastTime:](self, "setLastTime:", v4);

  }
}

- (void)setLastTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)stopTime
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  id v8;

  -[WPDStat lastTime](self, "lastTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[WPDStat lastTime](self, "lastTime");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", v4);
    v6 = v5;
    -[WPDStat currentTime](self, "currentTime");
    -[WPDStat setCurrentTime:](self, "setCurrentTime:", v6 + v7);

    -[WPDStat setLastTime:](self, "setLastTime:", 0);
  }
}

- (NSDate)lastTime
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (WPDStat)init
{
  WPDStat *v2;
  WPDStat *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WPDStat;
  v2 = -[WPDStat init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WPDStat setCurrentTime:](v2, "setCurrentTime:", 0.0);
    -[WPDStat setLastTime:](v3, "setLastTime:", 0);
  }
  return v3;
}

- (void)calculateTimeUpdate
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  -[WPDStat lastTime](self, "lastTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[WPDStat lastTime](self, "lastTime");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v4);
    v6 = v5;
    -[WPDStat currentTime](self, "currentTime");
    -[WPDStat setCurrentTime:](self, "setCurrentTime:", v6 + v7);

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDStat setLastTime:](self, "setLastTime:", v8);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTime, 0);
}

@end
