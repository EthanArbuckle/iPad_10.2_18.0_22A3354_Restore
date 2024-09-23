@implementation ToastWindow

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return sub_1D9F70680((uint64_t)self, (uint64_t)a2, a4);
}

- (_TtC8VideosUIP33_CEC0FAA63D95F28694C5A7BD137F0AC111ToastWindow)initWithWindowScene:(id)a3
{
  _TtC8VideosUIP33_CEC0FAA63D95F28694C5A7BD137F0AC111ToastWindow *result;

  OUTLINED_FUNCTION_34_5((uint64_t)self, (uint64_t)a2, a3);
  sub_1D9F706F0();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUIP33_CEC0FAA63D95F28694C5A7BD137F0AC111ToastWindow)initWithFrame:(CGRect)a3
{
  _TtC8VideosUIP33_CEC0FAA63D95F28694C5A7BD137F0AC111ToastWindow *result;

  sub_1D9F7074C();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUIP33_CEC0FAA63D95F28694C5A7BD137F0AC111ToastWindow)initWithCoder:(id)a3
{
  _TtC8VideosUIP33_CEC0FAA63D95F28694C5A7BD137F0AC111ToastWindow *result;

  OUTLINED_FUNCTION_34_5((uint64_t)self, (uint64_t)a2, a3);
  sub_1D9F707A4();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (BOOL)overridesOrientationLock
{
  return sub_1D9F70830() & 1;
}

@end
