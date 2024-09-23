@implementation DocumentRequestViewController

- (void)vui_viewDidAppear:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  DocumentRequestViewController.vuiViewDidAppear(_:)(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)vui_viewWillDisappear:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  DocumentRequestViewController.vuiViewWillDisappear(_:)(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  DocumentRequestViewController.vuiViewDidDisappear(_:)(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)vui_viewWillAppear:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  DocumentRequestViewController.vuiViewWillAppear(_:)(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (_TtC8VideosUI29DocumentRequestViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  DocumentRequestViewController.init(coder:)();
}

- (void)dealloc
{
  _TtC8VideosUI29DocumentRequestViewController *v2;

  v2 = self;
  DocumentRequestViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_79_9();
  OUTLINED_FUNCTION_79_9();
  OUTLINED_FUNCTION_79_9();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_10_3();
}

- (BOOL)handleDeeplink:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _TtC8VideosUI29DocumentRequestViewController *v7;

  v5 = sub_1DA13F428();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_12();
  sub_1DA13F3EC();
  v7 = self;
  DocumentRequestViewController.handleDeeplink(_:)(v3);

  OUTLINED_FUNCTION_5_0(v3, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  return 1;
}

@end
