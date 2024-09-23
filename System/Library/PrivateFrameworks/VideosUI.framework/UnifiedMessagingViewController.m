@implementation UnifiedMessagingViewController

- (_TtC8VideosUI30UnifiedMessagingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC8VideosUI30UnifiedMessagingViewController *result;

  if (a3)
  {
    v5 = sub_1DA143E80();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  sub_1D9C530A4(v5, v7, a4);
  OUTLINED_FUNCTION_9();
  return result;
}

- (_TtC8VideosUI30UnifiedMessagingViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = OUTLINED_FUNCTION_34_5((uint64_t)self, (uint64_t)a2, a3);
  return (_TtC8VideosUI30UnifiedMessagingViewController *)sub_1D9C531A8(v3);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI30UnifiedMessagingViewController_messageViewController));
}

- (void)messageViewController:(id)a3 didUpdateSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  _TtC8VideosUI30UnifiedMessagingViewController *v8;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = self;
  sub_1D9C53294(width, height);

  OUTLINED_FUNCTION_12_4(v8);
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  void *v4;
  id v6;
  id v7;
  id v8;

  v6 = OUTLINED_FUNCTION_34_5((uint64_t)self, (uint64_t)a2, a3);
  v7 = a4;
  v8 = v4;
  sub_1D9C53450((uint64_t)v6, v7);

  OUTLINED_FUNCTION_12_4(v8);
}

- (void)messageViewController:(id)a3 didFailWithError:(id)a4
{
  void *v4;
  id v6;
  id v7;
  id v8;

  v6 = OUTLINED_FUNCTION_34_5((uint64_t)self, (uint64_t)a2, a3);
  v7 = v4;
  v8 = a4;
  sub_1D9C53DE0((uint64_t)v8, (uint64_t)a4);

  OUTLINED_FUNCTION_12_4(v8);
}

- (void)messageViewController:(id)a3 enqueueEventWithFields:(id)a4 inTopic:(id)a5
{
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _TtC8VideosUI30UnifiedMessagingViewController *v12;

  v8 = sub_1DA143C7C();
  if (a5)
  {
    v9 = sub_1DA143E80();
    a5 = v10;
  }
  else
  {
    v9 = 0;
  }
  v11 = a3;
  v12 = self;
  sub_1D9C53F98((uint64_t)v12, v8, v9, (uint64_t)a5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (BOOL)messageViewController:(id)a3 shouldEnqueueMetricsForDialogResult:(id)a4
{
  return 1;
}

@end
