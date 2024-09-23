@implementation AudioRouteMonitor

- (void)initializeWithHandler:(__WiFiAudioRoute *)a3
{
  void *v5;

  v5 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: starting", "-[AudioRouteMonitor initializeWithHandler:]");
  objc_autoreleasePoolPop(v5);
  -[AudioRouteMonitor setAudioRouteHandler:](self, "setAudioRouteHandler:", a3);
  -[AudioRouteMonitor setMonitoring:](self, "setMonitoring:", 0);
}

- (void)dealloc
{
  objc_super v3;

  if (-[AudioRouteMonitor monitoring](self, "monitoring"))
    -[AudioRouteMonitor stopMonitoring](self, "stopMonitoring");
  v3.receiver = self;
  v3.super_class = (Class)AudioRouteMonitor;
  -[AudioRouteMonitor dealloc](&v3, "dealloc");
}

- (void)audioRouteChange:(id)a3
{
  sub_1001670B0((uint64_t)-[AudioRouteMonitor audioRouteHandler](self, "audioRouteHandler", a3));
}

- (void)startMonitoring
{
  void *v3;

  v3 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: adding observer", "-[AudioRouteMonitor startMonitoring]");
  objc_autoreleasePoolPop(v3);
  -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, "audioRouteChange:", AVAudioSessionRouteChangeNotification, +[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
  -[AudioRouteMonitor setMonitoring:](self, "setMonitoring:", 1);
}

- (void)stopMonitoring
{
  void *v3;

  v3 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: removing observer", "-[AudioRouteMonitor stopMonitoring]");
  objc_autoreleasePoolPop(v3);
  -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, AVAudioSessionRouteChangeNotification, +[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
  -[AudioRouteMonitor setMonitoring:](self, "setMonitoring:", 0);
}

- (__WiFiAudioRoute)audioRouteHandler
{
  return self->_audioRouteHandler;
}

- (void)setAudioRouteHandler:(__WiFiAudioRoute *)a3
{
  self->_audioRouteHandler = a3;
}

- (BOOL)monitoring
{
  return self->_monitoring;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

@end
