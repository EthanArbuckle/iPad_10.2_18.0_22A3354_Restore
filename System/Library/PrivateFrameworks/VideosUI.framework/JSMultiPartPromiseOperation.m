@implementation JSMultiPartPromiseOperation

- (BOOL)loadImmediately
{
  return sub_1D9B8511C() & 1;
}

- (void)setLoadImmediately:(BOOL)a3
{
  sub_1D9B85184(a3);
}

- (_TtC8VideosUI27JSMultiPartPromiseOperation)initWithStart:(id)a3 hasFragment:(id)a4 getFragment:(id)a5 cancel:(id)a6
{
  _TtC8VideosUI27JSMultiPartPromiseOperation *result;

  sub_1D9B85214(a3, a4, a5, a6);
  OUTLINED_FUNCTION_28_0();
  return result;
}

- (void)dealloc
{
  _TtC8VideosUI27JSMultiPartPromiseOperation *v2;

  v2 = self;
  sub_1D9B85404();
}

- (_TtC8VideosUI27JSMultiPartPromiseOperation)initWithAppContext:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9B8573C();
}

- (_TtC8VideosUI27JSMultiPartPromiseOperation)init
{
  sub_1D9B85778();
}

@end
