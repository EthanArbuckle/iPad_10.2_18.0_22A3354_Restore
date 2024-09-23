@implementation DeferredNetwork

- (DeferredNetwork)init
{
  void *v3;
  DeferredNetwork *v4;
  DeferredNetwork *v5;
  objc_super v7;

  v3 = objc_autoreleasePoolPush();
  v7.receiver = self;
  v7.super_class = (Class)DeferredNetwork;
  v4 = -[DeferredNetwork init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    v4->_firstSeen = 0.0;
    v4->_history = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (void)dealloc
{
  void *v3;
  NSMutableArray *history;
  objc_super v5;

  v3 = objc_autoreleasePoolPush();
  history = self->_history;
  if (history)

  v5.receiver = self;
  v5.super_class = (Class)DeferredNetwork;
  -[DeferredNetwork dealloc](&v5, "dealloc");
  objc_autoreleasePoolPop(v3);
}

- (BOOL)doesContain:(__WiFiNetwork *)a3
{
  void *v5;
  NSMutableArray *history;
  unsigned __int8 v7;

  v5 = objc_autoreleasePoolPush();
  history = self->_history;
  if (history)
    v7 = -[NSMutableArray containsObject:](history, "containsObject:", a3);
  else
    v7 = 0;
  objc_autoreleasePoolPop(v5);
  return v7;
}

- (BOOL)setDeferredNetwork:(__WiFiNetwork *)a3
{
  void *v5;
  NSMutableArray *history;
  double v7;

  v5 = objc_autoreleasePoolPush();
  history = self->_history;
  if (history)
  {
    if (!-[NSMutableArray count](self->_history, "count"))
    {
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      self->_firstSeen = v7;
      self->_ssid = (NSString *)objc_msgSend((id)sub_10002B088(a3), "copy");
    }
    if ((unint64_t)-[NSMutableArray count](self->_history, "count") >= 0xA)
      -[NSMutableArray removeObjectAtIndex:](self->_history, "removeObjectAtIndex:", 0);
    -[NSMutableArray addObject:](self->_history, "addObject:", a3);
  }
  objc_autoreleasePoolPop(v5);
  return history != 0;
}

- (double)timeSinceFirstDeferral:(__WiFiNetwork *)a3
{
  void *v5;
  NSMutableArray *history;
  double v7;
  double v8;
  void *v9;

  v5 = objc_autoreleasePoolPush();
  history = self->_history;
  if (history && -[NSMutableArray count](history, "count") && self->_firstSeen != 0.0)
  {
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v8 = v7 - self->_firstSeen;
  }
  else
  {
    v9 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: %@ not previously time-deferred", "-[DeferredNetwork timeSinceFirstDeferral:]", sub_10002B088(a3));
    objc_autoreleasePoolPop(v9);
    v8 = 0.0;
  }
  objc_autoreleasePoolPop(v5);
  return v8;
}

- (void)reset
{
  void *v3;

  v3 = objc_autoreleasePoolPush();
  self->_firstSeen = 0.0;
  -[NSMutableArray removeAllObjects](self->_history, "removeAllObjects");
  objc_autoreleasePoolPop(v3);
}

- (NSString)ssid
{
  return self->_ssid;
}

@end
