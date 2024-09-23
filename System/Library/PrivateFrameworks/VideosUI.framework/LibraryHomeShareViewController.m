@implementation LibraryHomeShareViewController

- (UINavigationItem)navigationItem
{
  _TtC8VideosUI30LibraryHomeShareViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_1D9B4C7A0();

  return (UINavigationItem *)v3;
}

- (_TtC8VideosUI30LibraryHomeShareViewController)init
{
  return (_TtC8VideosUI30LibraryHomeShareViewController *)sub_1D9B4C7CC();
}

- (_TtC8VideosUI30LibraryHomeShareViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9B4C8B4();
}

- (void)vui_viewDidLoad
{
  _TtC8VideosUI30LibraryHomeShareViewController *v2;

  v2 = self;
  sub_1D9B4C934();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)vui_viewDidLayoutSubviews
{
  _TtC8VideosUI30LibraryHomeShareViewController *v2;

  v2 = self;
  sub_1D9B4CA28();
  OUTLINED_FUNCTION_5_8(v2);
}

- (_TtC8VideosUI30LibraryHomeShareViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  sub_1D9B4CB2C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI30LibraryHomeShareViewController_homeController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI30LibraryHomeShareViewController_lastSelectedMediaLibrary));
}

- (void)homeShareViewController:(id)a3 didSelectHomeShare:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  v7 = OUTLINED_FUNCTION_132_4();
  sub_1D9B4CBE0((uint64_t)v7, a4);

  OUTLINED_FUNCTION_4_3(v7);
}

- (void)homeShareViewController:(id)a3 didUpdateWith:(id)a4
{
  id v6;
  _TtC8VideosUI30LibraryHomeShareViewController *v7;

  sub_1D9B4CF1C();
  sub_1DA1440FC();
  v6 = OUTLINED_FUNCTION_132_4();
  v7 = self;
  sub_1D9B4CCE0((uint64_t)v7, (unint64_t)a4);

  swift_bridgeObjectRelease();
}

@end
