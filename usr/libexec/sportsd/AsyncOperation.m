@implementation AsyncOperation

- (_TtC7sportsd14AsyncOperation)init
{
  return (_TtC7sportsd14AsyncOperation *)sub_100057264();
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  _TtC7sportsd14AsyncOperation *v2;
  char v3;

  v2 = self;
  v3 = sub_100057328();

  return v3 & 1;
}

- (BOOL)isFinished
{
  _TtC7sportsd14AsyncOperation *v2;
  char v3;
  char v4;

  v2 = self;
  sub_1000573BC();
  v4 = v3;

  return v4 & 1;
}

- (void)start
{
  _TtC7sportsd14AsyncOperation *v2;

  v2 = self;
  sub_1000574B8();

}

@end
