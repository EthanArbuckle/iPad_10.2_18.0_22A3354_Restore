@implementation _APRSBiomeAppKillEventWriter

+ (id)sharedInstance
{
  if (qword_1001AB970 != -1)
    dispatch_once(&qword_1001AB970, &stru_10015E7A0);
  return (id)qword_1001AB978;
}

- (_APRSBiomeAppKillEventWriter)init
{
  _APRSBiomeAppKillEventWriter *v2;
  NSObject *v3;
  uint64_t v4;
  RBSProcessMonitor *appKillMonitor;
  _QWORD v7[4];
  os_log_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_APRSBiomeAppKillEventWriter;
  v2 = -[_APRSBiomeAppKillEventWriter init](&v9, "init");
  if (v2)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100064DD0;
    v7[3] = &unk_10015E7F0;
    v8 = os_log_create("com.apple.aprs", "appResume.AppKillWriter");
    v3 = v8;
    v4 = objc_claimAutoreleasedReturnValue(+[RBSProcessMonitor monitorWithConfiguration:](RBSProcessMonitor, "monitorWithConfiguration:", v7));
    appKillMonitor = v2->_appKillMonitor;
    v2->_appKillMonitor = (RBSProcessMonitor *)v4;

  }
  return v2;
}

- (RBSProcessMonitor)appKillMonitor
{
  return self->_appKillMonitor;
}

- (void)setAppKillMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_appKillMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appKillMonitor, 0);
}

@end
