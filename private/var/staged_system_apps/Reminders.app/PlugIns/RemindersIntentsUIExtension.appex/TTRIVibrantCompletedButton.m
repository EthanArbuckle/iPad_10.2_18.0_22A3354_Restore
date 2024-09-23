@implementation TTRIVibrantCompletedButton

- (_TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton)init
{
  return (_TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton *)sub_10001524C();
}

- (_TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton)initWithCoder:(id)a3
{
  return (_TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton *)sub_100015354(a3);
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TTRIVibrantCompletedButton();
  v2 = (char *)v4.receiver;
  -[TTRIVibrantCompletedButton layoutSubviews](&v4, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton_vibrantImage];
  objc_msgSend(v2, "intrinsicContentSize", v4.receiver, v4.super_class);
  objc_msgSend(v3, "frame");
  objc_msgSend(v3, "setFrame:");

}

- (_TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton)initWithFrame:(CGRect)a3
{
  _TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton *result;

  result = (_TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton *)_swift_stdlib_reportUnimplementedInitializer("RemindersIntentsUIExtension.TTRIVibrantCompletedButton", 54, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
