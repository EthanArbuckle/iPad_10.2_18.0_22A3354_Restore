@implementation BLTimeBox

- (BLTimeBox)init
{
  BLTimeBox *v2;
  BLTimeBox *v3;
  uint64_t v4;
  NSDate *systemStartDate;
  NSDate *idleStartDate;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BLTimeBox;
  v2 = -[BLTimeBox init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    -[BLTimeBox getSystemStartDate](v2, "getSystemStartDate");
    v4 = objc_claimAutoreleasedReturnValue();
    systemStartDate = v3->_systemStartDate;
    v3->_systemStartDate = (NSDate *)v4;

    v3->_clockChanged = 0;
    idleStartDate = v3->_idleStartDate;
    v3->_idleStartDate = 0;

    -[BLTimeBox synchronizeToClock](v3, "synchronizeToClock");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel_systemClockChanged_, *MEMORY[0x24BDBCBB8], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel_systemClockChanged_, *MEMORY[0x24BDBCBC0], 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDBCBB8], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDBCBC0], 0);

  v5.receiver = self;
  v5.super_class = (Class)BLTimeBox;
  -[BLTimeBox dealloc](&v5, sel_dealloc);
}

- (void)systemClockChanged:(id)a3
{
  self->_clockChanged = 1;
}

- (id)getSystemStartDate
{
  void *v2;
  timeval v4;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCE60];
  v7 = 0;
  *(_QWORD *)v8 = 0x1500000001;
  v6 = 0;
  v5 = 16;
  if (sysctl(v8, 2u, &v6, &v5, 0, 0) == -1 || !v6)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "sysctl(mib, sizeof(mib) / sizeof(mib[0]), &bootTime, &bootTimeSize, ((void *)0), 0) != -1 && bootTime.tv_sec != 0", ", "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/BioLog/BLTimeBox.m", 126, 0);
  v4.tv_sec = 0;
  *(_QWORD *)&v4.tv_usec = 0;
  gettimeofday(&v4, 0);
  objc_msgSend(v2, "dateWithTimeIntervalSinceNow:", (double)(unint64_t)(1000000 * (v4.tv_sec - v6) - (int)v7 + v4.tv_usec) / -1000000.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)idleTimeAtDate:(id)a3
{
  double v3;

  -[NSDate timeIntervalSinceDate:](self->_idleStartDate, "timeIntervalSinceDate:", a3);
  return -v3;
}

- (double)clockOffset
{
  void *v3;
  double v4;
  double v5;

  -[BLTimeBox getSystemStartDate](self, "getSystemStartDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", self->_systemStartDate);
  v5 = v4;

  return v5;
}

- (double)synchronizeToClock
{
  double v3;
  void *v4;
  NSDate *v5;
  NSDate *systemStartDate;
  double v7;
  double v8;
  void *v9;
  double v10;

  -[BLTimeBox clockOffset](self, "clockOffset");
  if (v3 == 0.0)
  {
    v8 = 0.0;
  }
  else
  {
    v4 = (void *)-[NSDate copy](self->_systemStartDate, "copy");
    self->_clockChanged = 0;
    -[BLTimeBox getSystemStartDate](self, "getSystemStartDate");
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    systemStartDate = self->_systemStartDate;
    self->_systemStartDate = v5;

    objc_msgSend(v4, "timeIntervalSinceDate:", self->_systemStartDate);
    v8 = -v7;
    -[NSDate dateByAddingTimeInterval:](self->_idleStartDate, "dateByAddingTimeInterval:", -v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTimeBox setIdleStartDate:](self, "setIdleStartDate:", v9);

  }
  v10 = checkMachCorrection(1);
  self->_lastMachCorrection = v10;
  return v8 + v10;
}

- (double)machCorrectionWithCheck
{
  double result;

  result = checkMachCorrection(self->_lastMachCorrection == 0.0);
  if (result == 0.0)
    return self->_lastMachCorrection;
  self->_lastMachCorrection = result;
  return result;
}

- (id)date
{
  return -[BLTimeBox dateFromAbsoluteTime:hasNanoseconds:](self, "dateFromAbsoluteTime:hasNanoseconds:", mach_absolute_time(), 0);
}

- (id)dateFromAbsoluteTime:(unint64_t)a3 hasNanoseconds:(unint64_t *)a4
{
  double v6;
  unint64_t v7;
  id result;

  v6 = checkMachCorrection(0);
  if (v6 != 0.0)
    self->_lastMachCorrection = v6;
  v7 = _nanosecsCorrection + absoluteToNanoseconds();
  result = (id)objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeInterval:sinceDate:", self->_systemStartDate, (double)(v7 / 0xF4240) / 1000.0);
  if (a4)
    *a4 = v7 % 0xF4240;
  return result;
}

- (NSDate)systemStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)clockChanged
{
  return self->_clockChanged;
}

- (double)lastMachCorrection
{
  return self->_lastMachCorrection;
}

- (void)setLastMachCorrection:(double)a3
{
  self->_lastMachCorrection = a3;
}

- (NSDate)idleStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIdleStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleStartDate, 0);
  objc_storeStrong((id *)&self->_systemStartDate, 0);
}

@end
