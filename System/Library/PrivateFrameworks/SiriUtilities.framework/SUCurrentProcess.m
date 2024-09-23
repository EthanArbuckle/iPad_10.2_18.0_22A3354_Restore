@implementation SUCurrentProcess

- (SUIdleTracker)idleTracker
{
  SUCurrentProcess *v2;
  void *v3;
  void *v4;

  v2 = self;
  CurrentProcess.idleTracker.getter();
  v4 = v3;

  return (SUIdleTracker *)v4;
}

- (void)setIdleTracker:(id)a3
{
  id v5;
  SUCurrentProcess *v6;

  v5 = a3;
  v6 = self;
  CurrentProcess.idleTracker.setter(a3);

}

+ (SUCurrentProcess)default
{
  id v2;

  static CurrentProcess.default.getter();
  return (SUCurrentProcess *)v2;
}

- (SUCurrentProcess)init
{
  CurrentProcess.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end
