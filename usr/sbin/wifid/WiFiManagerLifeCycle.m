@implementation WiFiManagerLifeCycle

- (WiFiManagerLifeCycle)init
{
  WiFiManagerLifeCycle *v2;
  NSMutableArray *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WiFiManagerLifeCycle;
  v2 = -[WiFiManagerLifeCycle init](&v5, "init");
  if (!v2 || (v3 = objc_opt_new(NSMutableArray), (v2->_signals = v3) == 0))
  {

    return 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->_signals = 0;
  v3.receiver = self;
  v3.super_class = (Class)WiFiManagerLifeCycle;
  -[WiFiManagerLifeCycle dealloc](&v3, "dealloc");
}

- (void)startOnQueue:(id)a3
{
  void *v5;
  __WiFiManager *v6;
  void *v7;
  void *v8;
  const char *v9;
  const char *v10;

  if (!a3)
  {
LABEL_6:
    v7 = objc_autoreleasePoolPush();
    v8 = (void *)qword_10026DD20;
    if (qword_10026DD20)
    {
      v9 = "WiFiManager started";
LABEL_10:
      objc_msgSend(v8, "WFLog:message:", 4, v9, v10);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  NSLog(CFSTR("----- WiFiManager starting, version: %s -----"), a2, "WiFiManager-1753.111 Aug 13 2024 20:46:22");
  v5 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "----- WiFiManager starting, version: %s -----", "WiFiManager-1753.111 Aug 13 2024 20:46:22");
  objc_autoreleasePoolPop(v5);
  v6 = (__WiFiManager *)sub_10008324C((uint64_t)kCFAllocatorDefault, a3);
  self->_manager = v6;
  if (v6)
  {
    -[NSMutableArray addObject:](self->_signals, "addObject:", -[WiFiManagerLifeCycle handleSignal:onQueue:](self, "handleSignal:onQueue:", 2, a3));
    -[NSMutableArray addObject:](self->_signals, "addObject:", -[WiFiManagerLifeCycle handleSignal:onQueue:](self, "handleSignal:onQueue:", 15, a3));
    -[NSMutableArray addObject:](self->_signals, "addObject:", -[WiFiManagerLifeCycle handleSignal:onQueue:](self, "handleSignal:onQueue:", 3, a3));
    sub_10008A43C((uint64_t)self->_manager, 0);
    sub_1000907B8((uint64_t)self->_manager);
    sub_10008A540((uint64_t)self->_manager, (uint64_t)a3);
    notify_post("com.apple.wifivelocity.trigger");
    goto LABEL_6;
  }
  v7 = objc_autoreleasePoolPush();
  v8 = (void *)qword_10026DD20;
  if (qword_10026DD20)
  {
    v10 = "-[WiFiManagerLifeCycle startOnQueue:]";
    v9 = "%s: Error: WiFiManagerCreate failed";
    goto LABEL_10;
  }
LABEL_11:
  objc_autoreleasePoolPop(v7);
}

- (void)stopOnQueue:(id)a3
{
  void *v5;
  __WiFiManager *manager;

  v5 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "----- WiFiManager stopping, version: %s -----", "WiFiManager-1753.111 Aug 13 2024 20:46:22");
  objc_autoreleasePoolPop(v5);
  sub_10008B698((uint64_t)self->_manager, a3);
  sub_10008B628((uint64_t)self->_manager, 0);
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_signals, "enumerateObjectsUsingBlock:", &stru_100230FC8);
  manager = self->_manager;
  if (manager)
  {
    CFRelease(manager);
    self->_manager = 0;
  }
  NSLog(CFSTR("WiFiManager stopped"));
}

- (id)handleSignal:(int)a3 onQueue:(id)a4
{
  NSObject *v7;
  _QWORD handler[6];
  int v10;

  signal(a3, (void (__cdecl *)(int))1);
  v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, a3, 0, (dispatch_queue_t)a4);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000BFF08;
  handler[3] = &unk_100230FF0;
  v10 = a3;
  handler[4] = self;
  handler[5] = a4;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_activate(v7);
  return v7;
}

- (__WiFiManager)manager
{
  return self->_manager;
}

- (void)setManager:(__WiFiManager *)a3
{
  self->_manager = a3;
}

- (NSMutableArray)signals
{
  return self->_signals;
}

- (void)setSignals:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
