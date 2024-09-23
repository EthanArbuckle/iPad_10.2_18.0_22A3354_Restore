@implementation _OSLowSOCEventPredictor

- (_OSLowSOCEventPredictor)init
{
  _OSLowSOCEventPredictor *v2;
  os_log_t v3;
  OS_os_log *log;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_OSLowSOCEventPredictor;
  v2 = -[_OSLowSOCEventPredictor init](&v6, "init");
  if (v2)
  {
    v3 = os_log_create("com.apple.osintelligence", "highDrainPredictor");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

  }
  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003540;
  block[3] = &unk_100060720;
  block[4] = a1;
  if (qword_1000767F0 != -1)
    dispatch_once(&qword_1000767F0, block);
  return (id)qword_1000767E8;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
}

@end
