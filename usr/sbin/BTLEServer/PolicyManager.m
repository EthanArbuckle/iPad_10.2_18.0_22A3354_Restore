@implementation PolicyManager

+ (id)instance
{
  if (qword_1000C9050 != -1)
    dispatch_once(&qword_1000C9050, &stru_1000AD628);
  return (id)qword_1000C9048;
}

- (PolicyManager)init
{
  PolicyManager *v2;
  _opaque_pthread_t *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PolicyManager;
  v2 = -[PolicyManager init](&v5, "init");
  if (v2)
  {
    v3 = pthread_self();
    pthread_getschedparam(v3, &v2->_defaultMainThreadSchedPolicy, &v2->_defaultMainThreadSchedParam);
    v2->_activeHIDDeviceCount = 0;
    -[PolicyManager addObserver:forKeyPath:options:context:](v2, "addObserver:forKeyPath:options:context:", v2, CFSTR("activeHIDDeviceCount"), 3, 0);
  }
  return v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;

  v8 = a5;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("activeHIDDeviceCount")))
    -[PolicyManager activeHIDDeviceCountDidChange:](self, "activeHIDDeviceCountDidChange:", v8);

}

- (void)activeHIDDeviceCountDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", NSKeyValueChangeOldKey));
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  v9 = qword_1000C9178;
  if (!os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
  {
    if (v6)
      goto LABEL_3;
LABEL_6:
    -[PolicyManager activateHIDPolicy](self, "activateHIDPolicy");
    return;
  }
  sub_10006B410((uint64_t)v6, (uint64_t)v8, v9);
  if (!v6)
    goto LABEL_6;
LABEL_3:
  if (!v8)
    -[PolicyManager deactivateHIDPolicy](self, "deactivateHIDPolicy");
}

- (void)activateHIDPolicy
{
  _opaque_pthread_t *v3;
  sched_param v4;

  *(_DWORD *)v4.__opaque = HIDWORD(*(_QWORD *)&self->_defaultMainThreadSchedParam);
  v4.sched_priority = 63;
  v3 = pthread_self();
  pthread_setschedparam(v3, self->_defaultMainThreadSchedPolicy, &v4);
}

- (void)deactivateHIDPolicy
{
  _opaque_pthread_t *v3;

  v3 = pthread_self();
  pthread_setschedparam(v3, self->_defaultMainThreadSchedPolicy, &self->_defaultMainThreadSchedParam);
}

- (unint64_t)activeHIDDeviceCount
{
  return self->_activeHIDDeviceCount;
}

- (void)setActiveHIDDeviceCount:(unint64_t)a3
{
  self->_activeHIDDeviceCount = a3;
}

@end
