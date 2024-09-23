@implementation HighlightTextView

- (_TtC17SequoiaTranslator17HighlightTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  return (_TtC17SequoiaTranslator17HighlightTextView *)sub_1000D22E0(a4, x, y, width, height);
}

- (_TtC17SequoiaTranslator17HighlightTextView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s17SequoiaTranslator17HighlightTextViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void).cxx_destruct
{
  sub_100011194((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator17HighlightTextView_highlightDelegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC17SequoiaTranslator17HighlightTextView_highlights));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC17SequoiaTranslator17HighlightTextView_highlightRanges));
  swift_bridgeObjectRelease(*(_QWORD *)&self->highlightDelegate[OBJC_IVAR____TtC17SequoiaTranslator17HighlightTextView_highlightedWord]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator17HighlightTextView_highlightColor));
}

@end
