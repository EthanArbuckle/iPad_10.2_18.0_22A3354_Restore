@implementation JSPromiseOperation

- (void)dealloc
{
  _TtC8VideosUI18JSPromiseOperation *v2;

  v2 = self;
  sub_1D97F33BC();
}

- (_TtC8VideosUI18JSPromiseOperation)initWithPromiseFunction:(id)a3 cancelFunction:(id)a4
{
  _TtC8VideosUI18JSPromiseOperation *result;

  sub_1D97F3608(a3, a4);
  OUTLINED_FUNCTION_9();
  return result;
}

- (BOOL)loadImmediately
{
  return sub_1D9DEB76C() & 1;
}

- (void)setLoadImmediately:(BOOL)a3
{
  sub_1D9DEB7D4(a3);
}

- (_TtC8VideosUI18JSPromiseOperation)initWithAppContext:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9DEB900();
}

- (_TtC8VideosUI18JSPromiseOperation)init
{
  sub_1D9DEB93C();
}

@end
