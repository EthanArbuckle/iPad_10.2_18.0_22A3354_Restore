@implementation DownloadButton

- (_TtC5TeaUI14DownloadButton)init
{
  return (_TtC5TeaUI14DownloadButton *)DownloadButton.init()();
}

- (_TtC5TeaUI14DownloadButton)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI14DownloadButton *)DownloadButton.init(frame:)();
}

- (_TtC5TeaUI14DownloadButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B1648284();
}

- (BOOL)accessibilityActivate
{
  _TtC5TeaUI14DownloadButton *v2;

  v2 = self;
  DownloadButton.accessibilityActivate()();

  return 1;
}

- (void)layoutSubviews
{
  _TtC5TeaUI14DownloadButton *v2;

  v2 = self;
  DownloadButton.layoutSubviews()();

}

- (void)tintColorDidChange
{
  _TtC5TeaUI14DownloadButton *v2;

  v2 = self;
  DownloadButton.tintColorDidChange()();

}

- (void)startingButtonTappedWithSender:(id)a3
{
  id v4;
  _TtC5TeaUI14DownloadButton *v5;

  v4 = a3;
  v5 = self;
  sub_1B16484D4();

}

- (void).cxx_destruct
{
  sub_1B13C076C((uint64_t)self + OBJC_IVAR____TtC5TeaUI14DownloadButton_handler);
  sub_1B13C076C((uint64_t)self + OBJC_IVAR____TtC5TeaUI14DownloadButton_delegate);
  sub_1B13C076C((uint64_t)self + OBJC_IVAR____TtC5TeaUI14DownloadButton_dataProvider);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI14DownloadButton_imageTintColor);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI14DownloadButton_progressTintColor);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI14DownloadButton_trackTintColor);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI14DownloadButton_downloadingImage);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI14DownloadButton_notDownloadingImage);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI14DownloadButton_progressBackgroundLayer);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI14DownloadButton_progressLayer);
  sub_1B1649178((uint64_t)self + OBJC_IVAR____TtC5TeaUI14DownloadButton_downloadProgressDisposable);
  sub_1B1649178((uint64_t)self + OBJC_IVAR____TtC5TeaUI14DownloadButton_downloadStateDisposable);
}

@end
