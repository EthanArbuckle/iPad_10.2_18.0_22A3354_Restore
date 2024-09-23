@implementation SidebarTextFieldContentView

- (_TtC5Books27SidebarTextFieldContentView)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  _TtC5Books27SidebarTextFieldContentView *result;

  v5 = OBJC_IVAR____TtC5Books27SidebarTextFieldContentView_textField;
  v6 = type metadata accessor for SidebarTextField();
  v7 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v6));
  v8 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v7, "init");

  result = (_TtC5Books27SidebarTextFieldContentView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001007B93A0, "Books/SidebarTextFieldContentView.swift", 39, 2, 41, 0);
  __break(1u);
  return result;
}

- (void)_editingDidEndOnExit
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books27SidebarTextFieldContentView_textField), "setUserInteractionEnabled:", 0);
}

- (_TtC5Books27SidebarTextFieldContentView)initWithFrame:(CGRect)a3
{
  _TtC5Books27SidebarTextFieldContentView *result;

  result = (_TtC5Books27SidebarTextFieldContentView *)_swift_stdlib_reportUnimplementedInitializer("Books.SidebarTextFieldContentView", 33, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books27SidebarTextFieldContentView_listContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books27SidebarTextFieldContentView_textField));
  _s5Books15CurrentPageViewVwxx_0((Class *)((char *)&self->super.super.super.isa
                                          + OBJC_IVAR____TtC5Books27SidebarTextFieldContentView_configuration));
}

@end
