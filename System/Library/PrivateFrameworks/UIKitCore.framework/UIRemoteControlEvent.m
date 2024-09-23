@implementation UIRemoteControlEvent

- (id)_init
{
  id v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIRemoteControlEvent;
  v2 = -[UIEvent _init](&v5, sel__init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__simpleRemoteActionNotification_, CFSTR("UIApplicationSimpleRemoteActionNotification"), UIApp);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIApplicationSimpleRemoteActionNotification"), UIApp);

  v4.receiver = self;
  v4.super_class = (Class)UIRemoteControlEvent;
  -[UIEvent dealloc](&v4, sel_dealloc);
}

- (int64_t)type
{
  return 2;
}

- (int64_t)subtype
{
  return self->_subtype;
}

- (void)_setSubtype:(int64_t)a3
{
  self->_subtype = a3;
}

- (id)_allWindows
{
  void *v2;
  void *v3;

  objc_msgSend((id)UIApp, "keyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_sendEventToResponder:(id)a3
{
  objc_msgSend(a3, "remoteControlReceivedWithEvent:", self);
}

- (void)_simpleRemoteActionNotification:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  id WeakRetained;
  id v9;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("UIApplicationSimpleRemoteActionType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (v6 <= 0x15 && ((0x3BC0E7u >> v6) & 1) != 0)
  {
    v7 = qword_1866828C8[v6];
    if (self)
      WeakRetained = objc_loadWeakRetained((id *)&self->super._eventEnvironment);
    else
      WeakRetained = 0;
    v9 = WeakRetained;
    -[UIEventEnvironment _sendRemoteControlEvent:]((uint64_t)WeakRetained, v7);

  }
}

@end
