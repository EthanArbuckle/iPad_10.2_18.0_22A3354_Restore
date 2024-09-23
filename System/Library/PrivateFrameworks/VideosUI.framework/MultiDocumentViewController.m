@implementation MultiDocumentViewController

- (_TtC8VideosUI27MultiDocumentViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9C150C4();
}

- (void)vui_viewWillAppear:(BOOL)a3
{
  void *v3;

  OUTLINED_FUNCTION_103_1(self);
  OUTLINED_FUNCTION_36_5();
  sub_1D9C15DCC();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)vui_viewDidAppear:(BOOL)a3
{
  void *v3;

  OUTLINED_FUNCTION_103_1(self);
  OUTLINED_FUNCTION_36_5();
  sub_1D9C16070();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)vui_viewWillDisappear:(BOOL)a3
{
  void *v3;

  OUTLINED_FUNCTION_103_1(self);
  OUTLINED_FUNCTION_36_5();
  sub_1D9C160E8();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9C16190(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)vui_viewDidLayoutSubviews
{
  _TtC8VideosUI27MultiDocumentViewController *v2;

  v2 = self;
  sub_1D9C168B0();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)viewSafeAreaInsetsDidChange
{
  _TtC8VideosUI27MultiDocumentViewController *v2;

  v2 = self;
  sub_1D9C16BE8();
  OUTLINED_FUNCTION_5_8(v2);
}

- (BOOL)handleDeeplink:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC8VideosUI27MultiDocumentViewController *v9;

  v4 = sub_1DA13F428();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_61();
  v8 = v7 - v6;
  sub_1DA13F3EC();
  v9 = self;
  sub_1D9C16E40(v8);

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v8, v4);
  return 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27MultiDocumentViewController_parentDocumentDataSource));
  OUTLINED_FUNCTION_79_9();
  OUTLINED_FUNCTION_79_9();
  OUTLINED_FUNCTION_79_9();
  OUTLINED_FUNCTION_79_9();
  sub_1D97C7954(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI27MultiDocumentViewController_placeholderInteractor));
  swift_release();
  OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_79_9();
  OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_72_2();
  swift_release();
  OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_72_2();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27MultiDocumentViewController____lazy_storage___pinningHeaderView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27MultiDocumentViewController____lazy_storage___statusBarView));
  OUTLINED_FUNCTION_36_3(*(id *)((char *)&self->super.super.super.super.super.isa
                               + OBJC_IVAR____TtC8VideosUI27MultiDocumentViewController_largeTitleAccessoryView));
}

@end
