@implementation TimedMetadataDebuggerViewController

- (_TtC8VideosUI35TimedMetadataDebuggerViewController)init
{
  _TtC8VideosUI35TimedMetadataDebuggerViewController *result;

  sub_1D9CF7410();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI35TimedMetadataDebuggerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9CF7944();
}

- (void)dealloc
{
  _TtC8VideosUI35TimedMetadataDebuggerViewController *v2;

  v2 = self;
  sub_1D9CF7A88();
  OUTLINED_FUNCTION_2_1();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI35TimedMetadataDebuggerViewController_musicText);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI35TimedMetadataDebuggerViewController_actorsText);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI35TimedMetadataDebuggerViewController____lazy_storage___timeRangeLabel);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI35TimedMetadataDebuggerViewController____lazy_storage___musicLabel);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI35TimedMetadataDebuggerViewController____lazy_storage___actorsLabel);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI35TimedMetadataDebuggerViewController____lazy_storage___stackView));
}

- (_TtC8VideosUI35TimedMetadataDebuggerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  sub_1D9CF9800();
}

- (void)observeCurrentVendor
{
  _TtC8VideosUI35TimedMetadataDebuggerViewController *v2;

  v2 = self;
  sub_1D9CF9850();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)stopObserving
{
  _TtC8VideosUI35TimedMetadataDebuggerViewController *v2;

  v2 = self;
  sub_1D9CF9880();
  OUTLINED_FUNCTION_5_8(v2);
}

@end
