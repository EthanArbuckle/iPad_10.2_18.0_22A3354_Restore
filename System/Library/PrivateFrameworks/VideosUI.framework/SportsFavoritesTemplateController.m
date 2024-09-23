@implementation SportsFavoritesTemplateController

- (_TtC8VideosUI33SportsFavoritesTemplateController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9E2BCB0();
}

- (void)vui_viewDidLoad
{
  _TtC8VideosUI33SportsFavoritesTemplateController *v2;

  v2 = self;
  sub_1D9E2BD60();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)vui_viewDidAppear:(BOOL)a3
{
  _TtC8VideosUI33SportsFavoritesTemplateController *v3;
  void *v4;

  v3 = self;
  OUTLINED_FUNCTION_36_5();
  sub_1D9E2BE94();
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  _TtC8VideosUI33SportsFavoritesTemplateController *v3;
  void *v4;

  v3 = self;
  OUTLINED_FUNCTION_36_5();
  sub_1D9E2C1E4();
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)vuiCollectionView:(id)a3 didSelectItemAt:(id)a4
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC8VideosUI33SportsFavoritesTemplateController *v10;

  v7 = OUTLINED_FUNCTION_29_8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_26();
  sub_1DA13F6BC();
  v9 = a3;
  v10 = self;
  sub_1D9E2C5F8();

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v4, v7);
  OUTLINED_FUNCTION_28_0();
}

- (void)vuiCollectionView:(id)a3 willDisplay:(id)a4 for:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  _TtC8VideosUI33SportsFavoritesTemplateController *v15;

  v8 = OUTLINED_FUNCTION_29_8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_61();
  v12 = (void *)(v11 - v10);
  sub_1DA13F6BC();
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_1D9E2C8AC(v13, (uint64_t)v14, v12);

  (*(void (**)(void *, uint64_t))(v9 + 8))(v12, v8);
}

- (void).cxx_destruct
{
  sub_1D97BDBFC((uint64_t)self + OBJC_IVAR____TtC8VideosUI33SportsFavoritesTemplateController_templateUpdateObserver);
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_19_5();
}

- (void)onAuthenticationDidChange:
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  OUTLINED_FUNCTION_94_5();
  v2 = sub_1DA13F0B0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_12();
  sub_1DA13F080();
  v4 = v0;
  sub_1D9E2D28C();

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  OUTLINED_FUNCTION_28_0();
}

@end
