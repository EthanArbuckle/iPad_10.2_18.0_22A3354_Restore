@implementation AmbientPhotoFramePlayergroundViewController.PlaygroundPosterMutablePreferences

- (BOOL)userTapEventsRequested
{
  return sub_1AAC930A4() & 1;
}

- (void)setUserTapEventsRequested:(BOOL)a3
{
  sub_1AAC930D8(a3);
}

- (BOOL)hideChrome
{
  return sub_1AAC9310C() & 1;
}

- (void)setHideChrome:(BOOL)a3
{
  sub_1AAC93140(a3);
}

- (UIFont)timeFont
{
  return (UIFont *)sub_1AAC93170();
}

- (void)setTimeFont:(id)a3
{
  id v5;
  _TtCC15PhotosUIPrivate43AmbientPhotoFramePlayergroundViewControllerP33_AA406F95772BEA5A2E5AABA48A24960034PlaygroundPosterMutablePreferences *v6;

  v5 = a3;
  v6 = self;
  sub_1AAC931E4((uint64_t)a3);

}

- (UIColor)timeColor
{
  return (UIColor *)sub_1AAC93218();
}

- (void)setTimeColor:(id)a3
{
  id v5;
  _TtCC15PhotosUIPrivate43AmbientPhotoFramePlayergroundViewControllerP33_AA406F95772BEA5A2E5AABA48A24960034PlaygroundPosterMutablePreferences *v6;

  v5 = a3;
  v6 = self;
  sub_1AAC9328C((uint64_t)a3);

}

- (UIColor)statusBarTintColor
{
  return (UIColor *)sub_1AAC932C0();
}

- (void)setStatusBarTintColor:(id)a3
{
  id v5;
  _TtCC15PhotosUIPrivate43AmbientPhotoFramePlayergroundViewControllerP33_AA406F95772BEA5A2E5AABA48A24960034PlaygroundPosterMutablePreferences *v6;

  v5 = a3;
  v6 = self;
  sub_1AAC93334((uint64_t)a3);

}

- (unint64_t)significantEventTime
{
  return sub_1AAC93368();
}

- (void)setSignificantEventTime:(unint64_t)a3
{
  sub_1AAC9339C(a3);
}

- (unint64_t)significantEventOptions
{
  return sub_1AAC933CC();
}

- (void)setSignificantEventOptions:(unint64_t)a3
{
  sub_1AAC93400(a3);
}

- (_TtCC15PhotosUIPrivate43AmbientPhotoFramePlayergroundViewControllerP33_AA406F95772BEA5A2E5AABA48A24960034PlaygroundPosterMutablePreferences)init
{
  return (_TtCC15PhotosUIPrivate43AmbientPhotoFramePlayergroundViewControllerP33_AA406F95772BEA5A2E5AABA48A24960034PlaygroundPosterMutablePreferences *)sub_1AAC93410();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC15PhotosUIPrivate43AmbientPhotoFramePlayergroundViewControllerP33_AA406F95772BEA5A2E5AABA48A24960034PlaygroundPosterMutablePreferences_timeFont));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC15PhotosUIPrivate43AmbientPhotoFramePlayergroundViewControllerP33_AA406F95772BEA5A2E5AABA48A24960034PlaygroundPosterMutablePreferences_timeColor));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC15PhotosUIPrivate43AmbientPhotoFramePlayergroundViewControllerP33_AA406F95772BEA5A2E5AABA48A24960034PlaygroundPosterMutablePreferences_statusBarTintColor));
}

@end
