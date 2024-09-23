@implementation BackgroundMediaHostViewController

- (_TtC8VideosUI33BackgroundMediaHostViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9F0B318();
}

- (void)vui_viewDidLayoutSubviews
{
  _TtC8VideosUI33BackgroundMediaHostViewController *v2;

  v2 = self;
  sub_1D9F0B44C();

}

- (_TtC8VideosUI33BackgroundMediaHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  sub_1D9F0B7A4();
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_90_40();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI33BackgroundMediaHostViewController____lazy_storage___mediaController));
  swift_bridgeObjectRelease();
}

@end
