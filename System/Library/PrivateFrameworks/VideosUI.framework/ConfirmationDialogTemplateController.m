@implementation ConfirmationDialogTemplateController

- (void)vui_viewWillAppear:(BOOL)a3
{
  void *v3;

  OUTLINED_FUNCTION_103_1(self);
  OUTLINED_FUNCTION_36_5();
  sub_1D9CC08C8();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)vui_viewDidAppear:(BOOL)a3
{
  void *v3;

  OUTLINED_FUNCTION_103_1(self);
  OUTLINED_FUNCTION_36_5();
  sub_1D9CC096C();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)vui_viewWillDisappear:(BOOL)a3
{
  void *v3;

  OUTLINED_FUNCTION_103_1(self);
  OUTLINED_FUNCTION_36_5();
  sub_1D9CC0A14();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  void *v3;

  OUTLINED_FUNCTION_103_1(self);
  OUTLINED_FUNCTION_36_5();
  sub_1D9CC0A80();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)vui_viewDidLayoutSubviews
{
  _TtC8VideosUI36ConfirmationDialogTemplateController *v2;

  v2 = self;
  sub_1D9CC0B30();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)dealloc
{
  _TtC8VideosUI36ConfirmationDialogTemplateController *v2;

  v2 = self;
  sub_1D9CC0F04();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI36ConfirmationDialogTemplateController_dismissTimer));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI36ConfirmationDialogTemplateController_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI36ConfirmationDialogTemplateController_badgeView));
  OUTLINED_FUNCTION_36_3(*(id *)((char *)&self->super.super.super.super.isa
                               + OBJC_IVAR____TtC8VideosUI36ConfirmationDialogTemplateController____lazy_storage___backdropView));
}

- (_TtC8VideosUI36ConfirmationDialogTemplateController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC8VideosUI36ConfirmationDialogTemplateController *result;

  if (a3)
  {
    v5 = sub_1DA143E80();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  sub_1D9CC1004(v5, v7, a4);
  OUTLINED_FUNCTION_9();
  return result;
}

- (_TtC8VideosUI36ConfirmationDialogTemplateController)initWithCoder:(id)a3
{
  return (_TtC8VideosUI36ConfirmationDialogTemplateController *)sub_1D9CC10E0(a3);
}

- (void)onApplicationDidEnterBackground:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC8VideosUI36ConfirmationDialogTemplateController *v8;
  uint64_t v9;

  v4 = sub_1DA13F0B0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DA13F080();
  v8 = self;
  sub_1D9CC115C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)dismissConfirmation
{
  _TtC8VideosUI36ConfirmationDialogTemplateController *v2;

  v2 = self;
  sub_1D9CC123C();
  OUTLINED_FUNCTION_5_8(v2);
}

@end
