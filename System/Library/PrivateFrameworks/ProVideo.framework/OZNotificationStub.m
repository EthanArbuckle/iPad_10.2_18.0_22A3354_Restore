@implementation OZNotificationStub

- (OZNotificationStub)initWithOZDocument:(void *)a3 useTimer:(BOOL)a4
{
  _BOOL4 v4;
  OZNotificationStub *v6;
  OZNotificationStub *v7;
  objc_super v9;

  v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)OZNotificationStub;
  v6 = -[OZNotificationStub init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_pDocument = a3;
    if (v4)
      -[OZNotificationStub createTimer](v6, "createTimer");
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[OZNotificationStub releaseTimer](self, "releaseTimer");
  v3.receiver = self;
  v3.super_class = (Class)OZNotificationStub;
  -[OZNotificationStub dealloc](&v3, sel_dealloc);
}

- (void)releaseTimer
{
  NSTimer *pTimer;

  pTimer = self->_pTimer;
  if (pTimer)
  {
    -[NSTimer invalidate](pTimer, "invalidate");

  }
  self->_pTimer = 0;
}

- (void)processNotifications:(id)a3
{
  OZNotificationManager *v3;

  v3 = (OZNotificationManager *)*((_QWORD *)self->_pDocument + 21);
  if (v3)
    OZNotificationManager::processNotifications(v3);
}

- (void)fire
{
  -[NSTimer setFireDate:](self->_pTimer, "setFireDate:", objc_msgSend(MEMORY[0x1E0C99D68], "date"));
}

@end
