@implementation RootSideBarController

- (_TtC8VideosUI21RootSideBarController)init
{
  _TtC8VideosUI21RootSideBarController *result;

  sub_1D9B8B4F8();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)viewDidLoad
{
  _TtC8VideosUI21RootSideBarController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9B8B584();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC8VideosUI21RootSideBarController *v3;

  v3 = self;
  OUTLINED_FUNCTION_100_11((uint64_t)v3, (SEL *)&selRef_viewWillAppear_);
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC8VideosUI21RootSideBarController *v3;

  v3 = self;
  OUTLINED_FUNCTION_100_11((uint64_t)v3, (SEL *)&selRef_viewDidAppear_);
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)viewDidLayoutSubviews
{
  _TtC8VideosUI21RootSideBarController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9B8BD58();
  OUTLINED_FUNCTION_5_8(v3);
}

- (_TtC8VideosUI21RootSideBarController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9B8E384();
}

- (_TtC8VideosUI21RootSideBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  sub_1D9B8E418();
}

- (void).cxx_destruct
{
  sub_1D97BDBFC((uint64_t)self + OBJC_IVAR____TtC8VideosUI21RootSideBarController_delegate);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI21RootSideBarController____lazy_storage___collectionView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI21RootSideBarController____lazy_storage___dataSource);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI21RootSideBarController____lazy_storage___profileView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21RootSideBarController____lazy_storage___toolbar));
}

- (void)accountStoreDidChange:(id)a3
{
  id v4;
  _TtC8VideosUI21RootSideBarController *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9B8E4EC();

  OUTLINED_FUNCTION_4_3(v6);
}

- (void)isLibraryOnlyCountryChanged:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  OUTLINED_FUNCTION_94_5();
  v5 = sub_1DA13F0B0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_12();
  sub_1DA13F080();
  v7 = v3;
  sub_1D9B8E4EC();

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  OUTLINED_FUNCTION_28_0();
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC8VideosUI21RootSideBarController *v10;

  v7 = OUTLINED_FUNCTION_29_8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_26();
  sub_1DA13F6BC();
  v9 = a3;
  v10 = self;
  sub_1D9B8EAD0();

  OUTLINED_FUNCTION_197(v4, *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
  OUTLINED_FUNCTION_28_0();
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_1D9B8EF94(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(void))sub_1D9B8EC84);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_1D9B8EF94(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(void))sub_1D9B8EEAC);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC8VideosUI21RootSideBarController *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9B8F044();

  OUTLINED_FUNCTION_4_3(v6);
}

@end
