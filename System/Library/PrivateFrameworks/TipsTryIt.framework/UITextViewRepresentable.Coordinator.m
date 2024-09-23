@implementation UITextViewRepresentable.Coordinator

- (void)handleTapWithSender:(id)a3
{
  id v4;
  _TtCV9TipsTryIt23UITextViewRepresentable11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_248ABE2A0();

}

- (void)textViewDidChange:(id)a3
{
  id v4;
  _TtCV9TipsTryIt23UITextViewRepresentable11Coordinator *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;

  v4 = a3;
  v5 = self;
  v6 = objc_msgSend(v4, sel_text);
  if (v6)
  {
    v7 = v6;
    v8 = sub_248AF5A5C();
    v10 = v9;

    v11 = (uint64_t *)((char *)v5 + OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_text);
    *v11 = v8;
    v11[1] = v10;

    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

- (void)textViewDidChangeSelection:(id)a3
{
  id v4;
  _TtCV9TipsTryIt23UITextViewRepresentable11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_248ABBA78(v4);

}

- (_TtCV9TipsTryIt23UITextViewRepresentable11Coordinator)init
{
  _TtCV9TipsTryIt23UITextViewRepresentable11Coordinator *result;

  result = (_TtCV9TipsTryIt23UITextViewRepresentable11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_textView));
  swift_release();
  swift_bridgeObjectRelease();
}

@end
