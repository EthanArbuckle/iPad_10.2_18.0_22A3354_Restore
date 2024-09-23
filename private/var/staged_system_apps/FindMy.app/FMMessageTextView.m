@implementation FMMessageTextView

- (_TtC6FindMy17FMMessageTextView)init
{
  return (_TtC6FindMy17FMMessageTextView *)sub_10011E5B8();
}

- (_TtC6FindMy17FMMessageTextView)initWithCoder:(id)a3
{
  return (_TtC6FindMy17FMMessageTextView *)sub_10011E7F0(a3);
}

- (void)layoutSubviews
{
  _TtC6FindMy17FMMessageTextView *v2;

  v2 = self;
  sub_10011EA30();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMMessageTextView();
  v4 = a3;
  v5 = v6.receiver;
  -[FMMessageTextView traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  sub_10011FA18();

}

- (void)textViewDidChange:(id)a3
{
  id v4;
  _TtC6FindMy17FMMessageTextView *v5;

  v4 = a3;
  v5 = self;
  sub_10011F48C(v4);

}

- (void)textViewDidEndEditing:(id)a3
{
  void *Strong;
  void *v6;
  id v7;
  _TtC6FindMy17FMMessageTextView *v8;

  Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC6FindMy17FMMessageTextView_textViewDelegate);
  if (Strong)
  {
    v6 = Strong;
    if ((objc_msgSend(Strong, "respondsToSelector:", "textViewDidChange:") & 1) != 0)
    {
      v7 = a3;
      v8 = self;
      objc_msgSend(v6, "textViewDidChange:", v7);

    }
    swift_unknownObjectRelease(v6);
  }
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  uint64_t v10;
  void *Strong;
  void *v12;
  id v13;
  _TtC6FindMy17FMMessageTextView *v14;
  NSString v15;
  unsigned __int8 v16;

  length = a4.length;
  location = a4.location;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v10 = v9;
  Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC6FindMy17FMMessageTextView_textViewDelegate);
  if (Strong)
  {
    v12 = Strong;
    if ((objc_msgSend(Strong, "respondsToSelector:", "textView:shouldChangeTextInRange:replacementText:") & 1) != 0)
    {
      v13 = a3;
      v14 = self;
      v15 = String._bridgeToObjectiveC()();
      v16 = objc_msgSend(v12, "textView:shouldChangeTextInRange:replacementText:", v13, location, length, v15);

      swift_bridgeObjectRelease(v10);
      swift_unknownObjectRelease(v12);

      return v16;
    }
    swift_bridgeObjectRelease(v10);
    swift_unknownObjectRelease(v12);
  }
  else
  {
    swift_bridgeObjectRelease(v10);
  }
  return 0;
}

- (BOOL)becomeFirstResponder
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC6FindMy17FMMessageTextView_textView), "becomeFirstResponder");
}

- (BOOL)resignFirstResponder
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC6FindMy17FMMessageTextView_textView), "resignFirstResponder");
}

- (_TtC6FindMy17FMMessageTextView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy17FMMessageTextView *result;

  result = (_TtC6FindMy17FMMessageTextView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMMessageTextView", 24, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy17FMMessageTextView_style);
  v4 = *(void **)&self->style[OBJC_IVAR____TtC6FindMy17FMMessageTextView_style];
  v5 = *(void **)&self->style[OBJC_IVAR____TtC6FindMy17FMMessageTextView_style + 8];
  v6 = *(void **)&self->style[OBJC_IVAR____TtC6FindMy17FMMessageTextView_style + 16];

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy17FMMessageTextView_remainingCharsLabel));
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy17FMMessageTextView_textViewDelegate);
  swift_bridgeObjectRelease(*(_QWORD *)&self->style[OBJC_IVAR____TtC6FindMy17FMMessageTextView_initialMessageText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->style[OBJC_IVAR____TtC6FindMy17FMMessageTextView_placeHolderText]);
}

@end
