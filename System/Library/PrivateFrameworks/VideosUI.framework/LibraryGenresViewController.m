@implementation LibraryGenresViewController

- (UINavigationItem)navigationItem
{
  _TtC8VideosUI27LibraryGenresViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_1D9E4ED0C();

  return (UINavigationItem *)v3;
}

- (_TtC8VideosUI27LibraryGenresViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9E4F0E0();
}

- (void)vui_viewDidLoad
{
  _TtC8VideosUI27LibraryGenresViewController *v2;

  v2 = self;
  sub_1D9E4F180();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)vui_viewDidLayoutSubviews
{
  _TtC8VideosUI27LibraryGenresViewController *v2;

  v2 = self;
  sub_1D9E4F278();
  OUTLINED_FUNCTION_5_8(v2);
}

- (_TtC8VideosUI27LibraryGenresViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  sub_1D9E4F4A8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27LibraryGenresViewController_mediaLibrary));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27LibraryGenresViewController_menuController));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)didSelectMenuItemAtIndexPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC8VideosUI27LibraryGenresViewController *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = sub_1DA13F710();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DA13F6BC();
  v8 = self;
  v9 = OUTLINED_FUNCTION_7_126();
  sub_1D9E4F584(v9);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end
