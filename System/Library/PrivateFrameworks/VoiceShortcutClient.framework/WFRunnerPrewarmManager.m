@implementation WFRunnerPrewarmManager

+ (WFRunnerPrewarmManager)sharedManager
{
  return (WFRunnerPrewarmManager *)static RunnerPrewarmManager.shared.getter();
}

- (WFRunnerConnection)connection
{
  return (WFRunnerConnection *)RunnerPrewarmManager.connection.getter();
}

- (void)setConnection:(id)a3
{
  id v5;
  WFRunnerPrewarmManager *v6;

  v5 = a3;
  v6 = self;
  RunnerPrewarmManager.connection.setter(a3);

}

- (void)prewarmRunnerWithHostIfNecessary:(id)a3
{
  WFRunnerPrewarmManager *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1AF69B85C((uint64_t)a3);
  swift_unknownObjectRelease();

}

- (void)reset
{
  WFRunnerPrewarmManager *v2;

  v2 = self;
  sub_1AF69BEE0();

}

- (WFRunnerPrewarmManager)init
{
  return (WFRunnerPrewarmManager *)RunnerPrewarmManager.init()();
}

- (void).cxx_destruct
{

}

@end
