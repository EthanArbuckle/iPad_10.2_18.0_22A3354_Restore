@implementation InlineMenuButtonTextAttachment

- (_TtC11MobileNotes30InlineMenuButtonTextAttachment)init
{
  return (_TtC11MobileNotes30InlineMenuButtonTextAttachment *)sub_10017BC08();
}

- (_TtC11MobileNotes30InlineMenuButtonTextAttachment)initWithCoder:(id)a3
{
  sub_10017BDD8(a3);
}

- (_TtC11MobileNotes30InlineMenuButtonTextAttachment)initWithData:(id)a3 ofType:(id)a4
{
  id v5;
  id v6;
  _TtC11MobileNotes30InlineMenuButtonTextAttachment *result;

  if (a3)
  {
    v5 = a4;
    v6 = a3;
    static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);

  }
  result = (_TtC11MobileNotes30InlineMenuButtonTextAttachment *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.InlineMenuButtonTextAttachment", 42, "init(data:ofType:)", 18, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes30InlineMenuButtonTextAttachment_menu));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes30InlineMenuButtonTextAttachment_traitCollection));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes30InlineMenuButtonTextAttachment_font));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes30InlineMenuButtonTextAttachment_foregroundColor));
}

@end
