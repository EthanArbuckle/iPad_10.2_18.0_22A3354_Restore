@implementation CADisplayQueue

+ (OS_dispatch_queue_serial)queue
{
  if (qword_257537BD0 != -1)
    swift_once();
  return (OS_dispatch_queue_serial *)(id)qword_257538048;
}

- (_TtC13ShellSceneKit14CADisplayQueue)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[CADisplayQueue init](&v3, sel_init);
}

@end
