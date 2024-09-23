@implementation MediaShowcasingTemplateController

- (_TtC8VideosUI33MediaShowcasingTemplateController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9CB9B78();
}

- (void)vui_viewDidLayoutSubviews
{
  _TtC8VideosUI33MediaShowcasingTemplateController *v2;

  v2 = self;
  sub_1D9CB9C40();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)vuiScrollViewDidScroll:(id)a3
{
  id v4;
  _TtC8VideosUI33MediaShowcasingTemplateController *v5;

  v4 = a3;
  v5 = self;
  sub_1D9CBB1B0(v4);

  OUTLINED_FUNCTION_4_3(v5);
}

- (void)vui_viewWillAppear:(BOOL)a3
{
  void *v3;

  OUTLINED_FUNCTION_103_1(self);
  OUTLINED_FUNCTION_36_5();
  sub_1D9CBB238();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)vui_viewDidAppear:(BOOL)a3
{
  void *v3;

  OUTLINED_FUNCTION_103_1(self);
  OUTLINED_FUNCTION_36_5();
  sub_1D9CBB294();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9CBB394(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI33MediaShowcasingTemplateController_titleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI33MediaShowcasingTemplateController____lazy_storage___inlinePrototypeTitleView));
  swift_release();
  OUTLINED_FUNCTION_23_71();
}

@end
