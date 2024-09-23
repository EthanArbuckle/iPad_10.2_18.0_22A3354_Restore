@implementation CLHidEventMonitorManager

- (CLHidEventMonitorManager)initWithDelegate:(id)a3 queue:(id)a4 matching:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLHidEventMonitorManager;
  return -[CLHidEventManager initWithDelegate:queue:matching:type:](&v6, "initWithDelegate:queue:matching:type:", a3, a4, a5, 1);
}

- (void)addSystemClientMatching:(id)a3
{
  -[NSMutableArray addObject:](-[CLHidEventManager matching](self, "matching"), "addObject:", a3);
  -[HIDEventSystemClient setMatching:](-[CLHidEventManager manager](self, "manager"), "setMatching:", -[CLHidEventManager matching](self, "matching"));
}

- (void)removeSystemClientmatching:(id)a3
{
  -[NSMutableArray removeObject:](-[CLHidEventManager matching](self, "matching"), "removeObject:", a3);
  -[HIDEventSystemClient setMatching:](-[CLHidEventManager manager](self, "manager"), "setMatching:", -[CLHidEventManager matching](self, "matching"));
}

@end
