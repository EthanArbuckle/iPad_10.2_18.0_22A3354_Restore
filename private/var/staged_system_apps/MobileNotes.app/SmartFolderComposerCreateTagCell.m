@implementation SmartFolderComposerCreateTagCell

- (_TtC11MobileNotes32SmartFolderComposerCreateTagCell)initWithFrame:(CGRect)a3
{
  return (_TtC11MobileNotes32SmartFolderComposerCreateTagCell *)sub_1002CEF94(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11MobileNotes32SmartFolderComposerCreateTagCell)initWithCoder:(id)a3
{
  return (_TtC11MobileNotes32SmartFolderComposerCreateTagCell *)sub_1002CF0B4(a3);
}

- (void).cxx_destruct
{
  sub_100012C50(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa+ OBJC_IVAR____TtC11MobileNotes32SmartFolderComposerCreateTagCell_tagDidChange), *(_QWORD *)&self->super.textDidChange[OBJC_IVAR____TtC11MobileNotes32SmartFolderComposerCreateTagCell_tagDidChange]);
  sub_100012C50(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa+ OBJC_IVAR____TtC11MobileNotes32SmartFolderComposerCreateTagCell_tagDidEnter), *(_QWORD *)&self->super.textDidChange[OBJC_IVAR____TtC11MobileNotes32SmartFolderComposerCreateTagCell_tagDidEnter]);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  _TtC11MobileNotes32SmartFolderComposerCreateTagCell *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1002CF5B4();

  return self & 1;
}

@end
