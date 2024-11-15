@implementation FRGizmoPreferencesNotifier

- (FRGizmoPreferencesNotifier)init
{
  FRGizmoPreferencesNotifier *v2;
  FRGizmoPreferencesNotifier *v3;
  id v4;
  _QWORD v6[4];
  id v7;
  id location;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FRGizmoPreferencesNotifier;
  v2 = -[FRGizmoPreferencesNotifier init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    v2->_notifyToken = -1;
    objc_initWeak(&location, v2);
    v4 = &_dispatch_main_q;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100049A70;
    v6[3] = &unk_1000DC2B8;
    objc_copyWeak(&v7, &location);
    notify_register_dispatch("NanoNewsGizmoPrefsChanged", &v3->_notifyToken, (dispatch_queue_t)&_dispatch_main_q, v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_notifyToken);
  self->_notifyToken = -1;
  v3.receiver = self;
  v3.super_class = (Class)FRGizmoPreferencesNotifier;
  -[FRGizmoPreferencesNotifier dealloc](&v3, "dealloc");
}

- (FRGizmoPreferencesNotifierDelegate)delegate
{
  return (FRGizmoPreferencesNotifierDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
