@implementation _APRSFreezerInterface

- (_APRSFreezerInterface)init
{
  _APRSFreezerInterface *v2;
  os_log_t v3;
  OS_os_log *log;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_APRSFreezerInterface;
  v2 = -[_APRSFreezerInterface init](&v6, "init");
  if (v2)
  {
    v3 = os_log_create("com.apple.aprs", "appResume.freezerInterface");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1001AB730 != -1)
    dispatch_once(&qword_1001AB730, &stru_10015E230);
  return (id)qword_1001AB728;
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
