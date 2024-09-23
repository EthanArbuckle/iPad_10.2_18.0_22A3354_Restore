@implementation RootSplitTabBarController

- (_TtC8VideosUI25RootSplitTabBarController)init
{
  _TtC8VideosUI25RootSplitTabBarController *result;

  sub_1DA04C21C();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI25RootSplitTabBarController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DA04C328();
}

- (void)didMoveToParentViewController:(id)a3
{
  id v5;
  _TtC8VideosUI25RootSplitTabBarController *v6;

  v5 = a3;
  v6 = self;
  sub_1DA04C3CC(a3);

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC8VideosUI25RootSplitTabBarController *v4;

  v4 = self;
  sub_1DA04C864(a3, (SEL *)&selRef_viewWillAppear_, &OBJC_IVAR____TtC8VideosUI25RootSplitTabBarController_listenForAppear, 1);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC8VideosUI25RootSplitTabBarController *v4;

  v4 = self;
  sub_1DA04C864(a3, (SEL *)&selRef_viewWillDisappear_, &OBJC_IVAR____TtC8VideosUI25RootSplitTabBarController_listenForDissapear, 0);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  unint64_t v5;
  _TtC8VideosUI25RootSplitTabBarController *v7;

  v5 = (unint64_t)a3;
  if (a3)
  {
    OUTLINED_FUNCTION_6_10((uint64_t)self, (unint64_t *)&qword_1EDA92190);
    v5 = sub_1DA1440FC();
  }
  v7 = self;
  sub_1DA04C984(v5, a4);

  swift_bridgeObjectRelease();
}

- (_TtC8VideosUI25RootSplitTabBarController)initWithTabs:(id)a3
{
  OUTLINED_FUNCTION_6_10((uint64_t)self, (unint64_t *)&unk_1F02255A0);
  OUTLINED_FUNCTION_72_3();
  sub_1DA04D000();
}

- (_TtC8VideosUI25RootSplitTabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  sub_1DA04D058();
}

- (void).cxx_destruct
{
  sub_1D97BDBFC((uint64_t)self + OBJC_IVAR____TtC8VideosUI25RootSplitTabBarController_splitDelegate);
}

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v6;
  id v7;
  _TtC8VideosUI25RootSplitTabBarController *v8;
  BOOL result;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1DA04D0E8(v6, v7);

  OUTLINED_FUNCTION_9();
  return result;
}

@end
