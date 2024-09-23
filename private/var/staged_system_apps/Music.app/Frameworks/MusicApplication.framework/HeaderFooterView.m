@implementation HeaderFooterView

- (_TtC16MusicApplicationP33_7919D88BB8212442612DA538E61A458116HeaderFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplicationP33_7919D88BB8212442612DA538E61A458116HeaderFooterView *)sub_8DE430(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplicationP33_7919D88BB8212442612DA538E61A458116HeaderFooterView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_8E07A0();
}

- (void)layoutSubviews
{
  _TtC16MusicApplicationP33_7919D88BB8212442612DA538E61A458116HeaderFooterView *v2;

  v2 = self;
  sub_8DEE18();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplicationP33_7919D88BB8212442612DA538E61A458116HeaderFooterView_textView), "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  _TtC16MusicApplicationP33_7919D88BB8212442612DA538E61A458116HeaderFooterView *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_8E085C(v4);

  return v6;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  _TtC16MusicApplicationP33_7919D88BB8212442612DA538E61A458116HeaderFooterView *v17;
  uint64_t v19;

  length = a5.length;
  location = a5.location;
  v11 = type metadata accessor for URL(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = a3;
  v16 = a4;
  v17 = self;
  LOBYTE(length) = sub_8E095C((uint64_t)v14, location, length);

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return length & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->style[OBJC_IVAR____TtC16MusicApplicationP33_7919D88BB8212442612DA538E61A458116HeaderFooterView_text]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplicationP33_7919D88BB8212442612DA538E61A458116HeaderFooterView_urlRangeDictForTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_7919D88BB8212442612DA538E61A458116HeaderFooterView_textView));
}

@end
