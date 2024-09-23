@implementation SmartFolderComposerTextFieldCell

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC11MobileNotes32SmartFolderComposerTextFieldCell *v9;
  uint64_t v10;

  v5 = type metadata accessor for UICellConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100376C38();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)textFieldDidChange:(id)a3
{
  id v4;
  _TtC11MobileNotes32SmartFolderComposerTextFieldCell *v5;

  v4 = a3;
  v5 = self;
  sub_100376988(v4);

}

- (_TtC11MobileNotes32SmartFolderComposerTextFieldCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC11MobileNotes32SmartFolderComposerTextFieldCell_textDidChange);
  *v7 = 0;
  v7[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes32SmartFolderComposerTextFieldCell____lazy_storage___textField) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SmartFolderComposerTextFieldCell();
  return -[SmartFolderComposerTextFieldCell initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC11MobileNotes32SmartFolderComposerTextFieldCell)initWithCoder:(id)a3
{
  _QWORD *v4;
  objc_super v6;

  v4 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC11MobileNotes32SmartFolderComposerTextFieldCell_textDidChange);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes32SmartFolderComposerTextFieldCell____lazy_storage___textField) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SmartFolderComposerTextFieldCell();
  return -[SmartFolderComposerTextFieldCell initWithCoder:](&v6, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_100012C50(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC11MobileNotes32SmartFolderComposerTextFieldCell_textDidChange), *(_QWORD *)&self->textDidChange[OBJC_IVAR____TtC11MobileNotes32SmartFolderComposerTextFieldCell_textDidChange]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes32SmartFolderComposerTextFieldCell____lazy_storage___textField));
}

@end
