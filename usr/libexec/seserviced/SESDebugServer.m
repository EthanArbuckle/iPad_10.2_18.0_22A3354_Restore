@implementation SESDebugServer

- (SESDebugServer)init
{
  SESDebugServer *v2;
  SESDebugServer *v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  NSUserDefaults *v10;
  NSUserDefaults *userDefaults;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SESDebugServer;
  v2 = -[SESDebugServer init](&v13, "init");
  v3 = v2;
  if (v2)
  {
    v2->_started = 0;
    v2->_isLPEMEnabled = 4279897;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_DEFAULT, 0);
    v7 = objc_claimAutoreleasedReturnValue(v6);

    v8 = dispatch_queue_create("com.apple.seserviced.sesdebugserver", v7);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v8;

    v10 = (NSUserDefaults *)objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.seserviced"));
    userDefaults = v3->_userDefaults;
    v3->_userDefaults = v10;

    v3->_haveAppletInstalled = -[NSUserDefaults BOOLForKey:](v3->_userDefaults, "BOOLForKey:", CFSTR("debug.have.logging.applet"));
    v3->_haveProfileInstalled = -[NSUserDefaults BOOLForKey:](v3->_userDefaults, "BOOLForKey:", CFSTR("debug.have.logging.profile"));

  }
  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005B920;
  block[3] = &unk_100302AA0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)onEvent:(id)a3 eventPayload:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  SESDebugServer *v14;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005C494;
  block[3] = &unk_100304490;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
