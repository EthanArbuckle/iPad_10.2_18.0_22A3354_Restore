@implementation BKMainDisplayObserver

- (BKMainDisplayObserver)init
{
  BKMainDisplayObserver *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKMainDisplayObserver;
  v2 = -[BKMainDisplayObserver init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](CADisplay, "mainDisplay"));
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("uniqueId"), 0, CFSTR("BKHIDKVOWindowServerDisplayUUID"));

  }
  return v2;
}

- (BKSHIDEventDisplay)display
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BKSHIDEventDisplay builtinDisplay](BKSHIDEventDisplay, "builtinDisplay"));
  v3 = sub_10000F6DC();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueId"));
    if (v6)
    {
      v7 = objc_claimAutoreleasedReturnValue(+[BKSHIDEventDisplay displayWithHardwareIdentifier:](BKSHIDEventDisplay, "displayWithHardwareIdentifier:", v6));

      v2 = (void *)v7;
    }

  }
  return (BKSHIDEventDisplay *)v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  void *v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6 == CFSTR("BKHIDKVOWindowServerDisplayUUID") && self->_displayChangedHandler)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainDisplayObserver display](self, "display"));
    v14 = (*((uint64_t (**)(void))self->_displayChangedHandler + 2))();
    v15 = BKLogEventDelivery(v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138543362;
      v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "_mainDisplay changed:%{public}@", (uint8_t *)&v17, 0xCu);
    }

  }
}

- (id)displayChangedHandler
{
  return self->_displayChangedHandler;
}

- (void)setDisplayChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_displayChangedHandler, 0);
}

@end
