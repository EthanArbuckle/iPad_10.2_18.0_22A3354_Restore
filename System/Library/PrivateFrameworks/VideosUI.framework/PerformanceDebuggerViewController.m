@implementation PerformanceDebuggerViewController

- (_TtC8VideosUI33PerformanceDebuggerViewController)init
{
  return (_TtC8VideosUI33PerformanceDebuggerViewController *)sub_1DA091D40();
}

- (_TtC8VideosUI33PerformanceDebuggerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DA092174();
}

- (_TtC8VideosUI33PerformanceDebuggerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  sub_1DA09225C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI33PerformanceDebuggerViewController_text));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI33PerformanceDebuggerViewController____lazy_storage___textLabel));
}

- (void)setupWithPlaybackEventsDictionary:(id)a3
{
  _TtC8VideosUI33PerformanceDebuggerViewController *v4;

  sub_1D972BC38(0, &qword_1F0238BB8);
  sub_1DA143C7C();
  v4 = self;
  sub_1DA092314();

  swift_bridgeObjectRelease();
}

- (void)clear
{
  _TtC8VideosUI33PerformanceDebuggerViewController *v2;

  v2 = self;
  sub_1DA0923EC();

}

@end
