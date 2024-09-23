@implementation CLDaemonSettingsManager

- (CLDaemonSettingsManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLDaemonSettingsManager;
  return -[CLDaemonSettingsManager initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLSettingsManagerProtocol, &OBJC_PROTOCOL___CLSettingsManagerClientProtocol);
}

- (void)beginService
{
  _QWORD v3[5];
  _QWORD handler[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLDaemonSettingsManager;
  -[CLDaemonSettingsManager beginService](&v5, "beginService");
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100617D44;
  handler[3] = &unk_10213F4C0;
  handler[4] = self;
  notify_register_dispatch((const char *)objc_msgSend(CFSTR("com.apple.locationd/Prefs"), "UTF8String"), &self->_fDaemonPreferencesChangedNotificationToken, (dispatch_queue_t)objc_msgSend(objc_msgSend(-[CLDaemonSettingsManager universe](self, "universe"), "silo"), "queue"), handler);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100617D4C;
  v3[3] = &unk_10213F4C0;
  v3[4] = self;
  notify_register_dispatch((const char *)objc_msgSend(CFSTR("com.apple.ManagedConfiguration.profileListChanged"), "UTF8String"), &self->_fMCProfileListChangedForDaemonSettingsNotificationToken, (dispatch_queue_t)objc_msgSend(objc_msgSend(-[CLDaemonSettingsManager universe](self, "universe"), "silo"), "queue"), v3);
  -[CLDaemonSettingsManager refresh](self, "refresh");
}

- (void)endService
{
  objc_super v3;

  notify_cancel(self->_fDaemonPreferencesChangedNotificationToken);
  self->_fDaemonPreferencesChangedNotificationToken = -1;
  notify_cancel(self->_fMCProfileListChangedForDaemonSettingsNotificationToken);
  self->_fMCProfileListChangedForDaemonSettingsNotificationToken = -1;
  v3.receiver = self;
  v3.super_class = (Class)CLDaemonSettingsManager;
  -[CLDaemonSettingsManager endService](&v3, "endService");
}

- (void)refresh
{
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  std::__shared_weak_count *v7;

  sub_1001E4804(&v6);
  -[CLDaemonSettingsManager setSettingsDictionary:](self, "setSettingsDictionary:", sub_10056A79C(v6));
  v3 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  -[CLDaemonSettingsManager updateClientsWithDictionary:](self, "updateClientsWithDictionary:", +[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", -[CLDaemonSettingsManager settingsDictionary](self, "settingsDictionary")));
}

- (id)syncgetSetValue:(id)a3 forKey:(id)a4 withoutNotifying:(id)a5
{
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  objc_super v13;
  uint64_t v14;
  std::__shared_weak_count *v15;

  sub_1001E4804(&v14);
  sub_10011B54C(v14, (const char *)objc_msgSend(a4, "UTF8String"), (uint64_t)a3);
  v9 = v15;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)CLDaemonSettingsManager;
  return -[CLDaemonSettingsManager syncgetSetValue:forKey:withoutNotifying:](&v13, "syncgetSetValue:forKey:withoutNotifying:", a3, a4, a5);
}

- (void)flush
{
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  std::__shared_weak_count *v7;

  sub_1001E4804(&v6);
  sub_100569514(v6);
  v3 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  -[CLDaemonSettingsManager refresh](self, "refresh");
}

@end
