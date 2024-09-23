@implementation DMDTestEventStream

- (NSString)eventType
{
  return (NSString *)CFSTR("com.apple.event.management.test");
}

- (void)startNotificationStreamWithEventsHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTestEventStream _testEvent](self, "_testEvent"));
  v8 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  (*((void (**)(id, void *))a3 + 2))(v5, v7);

}

- (id)_testEvent
{
  return -[DMDEventStreamEvent initWithEventType:details:]([DMDEventStreamEvent alloc], "initWithEventType:details:", CFSTR("com.apple.event.management.test"), 0);
}

@end
