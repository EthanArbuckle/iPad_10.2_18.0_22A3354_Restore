@implementation WiFiManagerAVSystemMonitor

- (void)dispatchAVSystemMonitorCallback:(id)a3
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD block[6];

  v5 = objc_autoreleasePoolPush();
  v6 = objc_msgSend(a3, "userInfo");
  v7 = objc_msgSend(v6, "objectForKey:", AVSystemController_VoicePromptStyleDidChangeNotificationParameter);
  v8 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Voice Prompt Style Changed = %@", "-[WiFiManagerAVSystemMonitor dispatchAVSystemMonitorCallback:]", v7);
  objc_autoreleasePoolPop(v8);
  if (-[WiFiManagerAVSystemMonitor AVSystemMonitorCb](self, "AVSystemMonitorCb"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D4858;
    block[3] = &unk_10022EB70;
    block[4] = self;
    block[5] = v7;
    dispatch_async((dispatch_queue_t)-[WiFiManagerAVSystemMonitor queue](self, "queue"), block);
  }
  else
  {
    v9 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "AVSystemMonitorCb is NULL!");
    objc_autoreleasePoolPop(v9);
  }
  objc_autoreleasePoolPop(v5);
}

- (void)dispatchAVSystemServerDiedCallback:(id)a3
{
  void *v5;
  void *v6;

  v5 = objc_autoreleasePoolPush();
  v6 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: AVSystemServerDied %@", "-[WiFiManagerAVSystemMonitor dispatchAVSystemServerDiedCallback:]", a3);
  objc_autoreleasePoolPop(v6);
  -[WiFiManagerAVSystemMonitor startMonitoringAVSystem](self, "startMonitoringAVSystem");
  objc_autoreleasePoolPop(v5);
}

- (void)startMonitoringAVSystem
{
  void *v3;
  void *v4;
  NSNotificationCenter *v5;
  id v6;
  void *v7;
  NSArray *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  unint64_t v14;
  _QWORD v15[2];

  v3 = objc_autoreleasePoolPush();
  v4 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s", "-[WiFiManagerAVSystemMonitor startMonitoringAVSystem]");
  objc_autoreleasePoolPop(v4);
  v5 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  v6 = +[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController");
  if (!v5)
  {
    v11 = objc_autoreleasePoolPush();
    v12 = (void *)qword_10026DD20;
    if (qword_10026DD20)
    {
      v13 = "nc is NULL!";
LABEL_16:
      objc_msgSend(v12, "WFLog:message:", 4, v13);
    }
LABEL_17:
    objc_autoreleasePoolPop(v11);
    goto LABEL_11;
  }
  v7 = v6;
  if (!v6)
  {
    v11 = objc_autoreleasePoolPush();
    v12 = (void *)qword_10026DD20;
    if (qword_10026DD20)
    {
      v13 = "sharedController is NULL!";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  v15[0] = AVSystemController_VoicePromptStyleDidChangeNotification;
  v15[1] = AVSystemController_ServerConnectionDiedNotification;
  v8 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2);
  v14 = 0xAAAAAAAAAAAAAAAALL;
  v9 = objc_msgSend(v7, "setAttribute:forKey:error:", v8, AVSystemController_SubscribeToNotificationsAttribute, &v14);
  v10 = objc_autoreleasePoolPush();
  if (v9)
  {
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Successfully subscribed to all necessary AVSystemController notifications: %@", "-[WiFiManagerAVSystemMonitor startMonitoringAVSystem]", v8);
  }
  else if (qword_10026DD20)
  {
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: Failed to subscribe to AVSystemController notifications due to error: %@", "-[WiFiManagerAVSystemMonitor startMonitoringAVSystem]", v14);
  }
  objc_autoreleasePoolPop(v10);
  -[NSNotificationCenter addObserver:selector:name:object:](v5, "addObserver:selector:name:object:", self, "dispatchAVSystemMonitorCallback:", AVSystemController_VoicePromptStyleDidChangeNotification, v7);
  -[NSNotificationCenter addObserver:selector:name:object:](v5, "addObserver:selector:name:object:", self, "dispatchAVSystemServerDiedCallback:", AVSystemController_ServerConnectionDiedNotification, v7);
LABEL_11:
  objc_autoreleasePoolPop(v3);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = objc_autoreleasePoolPush();

  v4.receiver = self;
  v4.super_class = (Class)WiFiManagerAVSystemMonitor;
  -[WiFiManagerAVSystemMonitor dealloc](&v4, "dealloc");
  objc_autoreleasePoolPop(v3);
}

- (void)stopMonitoringAVSystem
{
  objc_autoreleasePoolPop(objc_autoreleasePoolPush());
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (void)AVSystemMonitorCb
{
  return self->_AVSystemMonitorCb;
}

- (void)setAVSystemMonitorCb:(void *)a3
{
  self->_AVSystemMonitorCb = a3;
}

- (__WiFiManager)manager
{
  return self->_manager;
}

- (void)setManager:(__WiFiManager *)a3
{
  self->_manager = a3;
}

@end
