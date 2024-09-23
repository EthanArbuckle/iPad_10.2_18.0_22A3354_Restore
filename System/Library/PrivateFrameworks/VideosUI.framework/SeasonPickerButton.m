@implementation SeasonPickerButton

- (_TtC8VideosUI18SeasonPickerButton)init
{
  _TtC8VideosUI18SeasonPickerButton *result;

  sub_1D9CEF708();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI18SeasonPickerButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9CEF938();
}

- (void)layoutSubviews
{
  _TtC8VideosUI18SeasonPickerButton *v2;

  v2 = self;
  sub_1D9CEF9F4();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  OUTLINED_FUNCTION_14_27(self);
  sub_1D9CEFDE8(v4, v3);
  OUTLINED_FUNCTION_28_2();
  OUTLINED_FUNCTION_59();
  result.height = v6;
  result.width = v5;
  return result;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  _TtC8VideosUI18SeasonPickerButton *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = sub_1D9CEFE28((uint64_t)v6);

  return v7;
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double v4;
  double v5;
  double v7;
  double v8;
  CGSize result;

  OUTLINED_FUNCTION_14_27(self);
  sub_1D9CEFA44(a4, v5, v4);
  OUTLINED_FUNCTION_28_2();
  OUTLINED_FUNCTION_59();
  result.height = v8;
  result.width = v7;
  return result;
}

- (VUILabel)accessibilityCurrentLabel
{
  id v2;

  sub_1D9CF00A4();
  return (VUILabel *)OUTLINED_FUNCTION_111(v2);
}

- (VUILabel)accessibilityAltLabel
{
  id v2;

  sub_1D9CF00E8();
  return (VUILabel *)OUTLINED_FUNCTION_111(v2);
}

- (NSArray)accessibilityHeaderTitles
{
  void *v2;

  sub_1D9CF014C();
  v2 = (void *)sub_1DA1440F0();
  swift_bridgeObjectRelease();
  return (NSArray *)OUTLINED_FUNCTION_111(v2);
}

- (_TtC8VideosUI18SeasonPickerButton)initWithFrame:(CGRect)a3
{
  sub_1D9CF015C();
}

- (void).cxx_destruct
{
  sub_1D97BDBFC((uint64_t)self + OBJC_IVAR____TtC8VideosUI18SeasonPickerButton_delegate);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI18SeasonPickerButton_chevronDownImageView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI18SeasonPickerButton_currentLabel);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI18SeasonPickerButton_altLabel);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI18SeasonPickerButton_textLayout);
  swift_bridgeObjectRelease();
}

@end
