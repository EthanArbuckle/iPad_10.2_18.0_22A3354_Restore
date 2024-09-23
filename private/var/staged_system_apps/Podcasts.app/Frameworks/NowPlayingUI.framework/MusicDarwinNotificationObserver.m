@implementation MusicDarwinNotificationObserver

- (MusicDarwinNotificationObserver)initWithNotificationName:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MusicDarwinNotificationObserver;
  v8 = -[MusicDarwinNotificationObserver init](&v15, "init");
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    v10 = (void *)*((_QWORD *)v8 + 1);
    *((_QWORD *)v8 + 1) = v9;

    v11 = objc_retainBlock(v7);
    v12 = (void *)*((_QWORD *)v8 + 2);
    *((_QWORD *)v8 + 2) = v11;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v8, (CFNotificationCallback)__Music_darwinNotificationReceived, *((CFStringRef *)v8 + 1), v8, CFNotificationSuspensionBehaviorDrop);
  }

  return (MusicDarwinNotificationObserver *)v8;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)self->_notificationName, 0);
  v4.receiver = self;
  v4.super_class = (Class)MusicDarwinNotificationObserver;
  -[MusicDarwinNotificationObserver dealloc](&v4, "dealloc");
}

- (void)darwinNotificationReceived
{
  (*((void (**)(void))self->_handler + 2))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_notificationName, 0);
}

@end
