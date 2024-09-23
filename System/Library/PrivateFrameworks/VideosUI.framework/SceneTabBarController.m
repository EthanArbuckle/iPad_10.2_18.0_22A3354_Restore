@implementation SceneTabBarController

- (NSArray)tabBarItems
{
  _TtC8VideosUI21SceneTabBarController *v2;
  void *v3;

  v2 = self;
  sub_1D9AD81F4();
  OUTLINED_FUNCTION_214();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA92080);
  v3 = (void *)sub_1DA1440F0();
  OUTLINED_FUNCTION_79();
  return (NSArray *)v3;
}

- (unint64_t)selectedIndex
{
  _TtC8VideosUI21SceneTabBarController *v2;
  unint64_t result;

  v2 = self;
  sub_1D9AD845C();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)setSelectedIndex:(unint64_t)a3
{
  _TtC8VideosUI21SceneTabBarController *v4;

  v4 = self;
  sub_1D9AD84C8(a3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (BOOL)isTabBarHidden
{
  _TtC8VideosUI21SceneTabBarController *v2;
  char v3;

  v2 = self;
  v3 = sub_1D9AD855C();

  return v3 & 1;
}

- (void)setTabBarHidden:(BOOL)a3
{
  _BOOL8 v3;
  _TtC8VideosUI21SceneTabBarController *v4;

  v3 = a3;
  v4 = self;
  sub_1D9AD85D0(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (_TtC8VideosUI21SceneTabBarController)init
{
  _TtC8VideosUI21SceneTabBarController *result;

  sub_1D9AD8634();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)setSelectedIndexForTabBarItemIdentifier:(id)a3 clearStack:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC8VideosUI21SceneTabBarController *v9;

  if (a3)
  {
    v6 = sub_1DA143E80();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = self;
  sub_1D9AD8864(v6, v8, a4);

  OUTLINED_FUNCTION_1_19();
}

- (void)setSelectedIndexForTabBarItemIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC8VideosUI21SceneTabBarController *v7;

  if (a3)
  {
    v4 = sub_1DA143E80();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_1D9AD8B74(v4, v6);

  OUTLINED_FUNCTION_1_19();
}

- (void)updateWithTabBarItems:(id)a3 setSelectedIdentifierFromDefaults:(BOOL)a4 appContext:(id)a5
{
  unint64_t v6;
  id v9;
  _TtC8VideosUI21SceneTabBarController *v10;

  v6 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA92080);
  sub_1DA1440FC();
  v9 = OUTLINED_FUNCTION_4_11();
  v10 = self;
  sub_1D9AD8BD4((uint64_t)a3, v6, (uint64_t *)a5);

  swift_bridgeObjectRelease();
}

- (void)didEnterBackground:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v4 = a3;
  v5 = OUTLINED_FUNCTION_4_11();
  sub_1D9AD9D94(0);

  OUTLINED_FUNCTION_4_3(v5);
}

- (void)willTerminate:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v4 = a3;
  v5 = OUTLINED_FUNCTION_4_11();
  sub_1D9AD9D94(1);

  OUTLINED_FUNCTION_4_3(v5);
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC8VideosUI21SceneTabBarController__tabBarInfo;
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F0206D20);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_release();
}

@end
