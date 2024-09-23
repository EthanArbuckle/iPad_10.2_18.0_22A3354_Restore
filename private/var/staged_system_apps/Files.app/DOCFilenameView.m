@implementation DOCFilenameView

- (UITextField)textField
{
  return (UITextField *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                + OBJC_IVAR____TtC5Files15DOCFilenameView_textField));
}

- (_TtC5Files15DOCFilenameView)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  _TtC5Files15DOCFilenameView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files15DOCFilenameView_textFieldTextStyle) = (Class)UIFontTextStyleTitle2;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files15DOCFilenameView_postLayoutTextFieldUpdates) = (Class)&_swiftEmptySetSingleton;
  v4 = a3;
  v5 = UIFontTextStyleTitle2;

  result = (_TtC5Files15DOCFilenameView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010050DA60, "Files/DOCFilenameViewController.swift", 37, 2, 547, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  v2 = v3.receiver;
  -[DOCFilenameView layoutSubviews](&v3, "layoutSubviews");
  sub_100283F08();
  sub_10028402C();

}

- (void)didMoveToWindow
{
  sub_100284428(self, (uint64_t)a2, (const char **)&selRef_didMoveToWindow, (void (*)(id))sub_10028402C);
}

- (_TtC5Files15DOCFilenameView)initWithFrame:(CGRect)a3
{
  sub_100226BB0((uint64_t)self, (uint64_t)a2, (uint64_t)"Files.DOCFilenameView", 21);
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files15DOCFilenameView_maxTextFieldWidthLandscapeConstraint));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Files15DOCFilenameView_postLayoutTextFieldUpdates));
}

@end
