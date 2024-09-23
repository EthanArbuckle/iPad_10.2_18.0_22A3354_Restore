@implementation HighlightColorChooserView

- (_TtC8BookCore25HighlightColorChooserView)initWithFrame:(CGRect)a3
{
  return (_TtC8BookCore25HighlightColorChooserView *)sub_1A32A4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8BookCore25HighlightColorChooserView)initWithCoder:(id)a3
{
  id v5;
  _TtC8BookCore25HighlightColorChooserView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8BookCore25HighlightColorChooserView_pageTheme) = (Class)&dword_4;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC8BookCore25HighlightColorChooserView_annotationUUID, 0);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC8BookCore25HighlightColorChooserView_delegate, 0);
  v5 = a3;

  result = (_TtC8BookCore25HighlightColorChooserView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000002175B0, "BookCore/HighlightMenuElement.swift", 35, 2, 336, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8BookCore25HighlightColorChooserView_annotationUUID);
  sub_175F14((uint64_t)self + OBJC_IVAR____TtC8BookCore25HighlightColorChooserView_delegate);
}

@end
