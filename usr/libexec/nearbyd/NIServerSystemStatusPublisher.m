@implementation NIServerSystemStatusPublisher

- (NIServerSystemStatusPublisher)initWithSystemStatus:(int)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NIServerSystemStatusPublisher;
  return -[NIServerSystemStatusPublisher init](&v4, "init", *(_QWORD *)&a3);
}

@end
