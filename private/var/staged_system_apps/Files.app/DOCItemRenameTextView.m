@implementation DOCItemRenameTextView

- (_TtC5Files21DOCItemRenameTextView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100255FF0();
}

- (UIColor)backgroundColor
{
  return (UIColor *)sub_100255938(self, (uint64_t)a2, (SEL *)&selRef_backgroundColor);
}

- (void)setBackgroundColor:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self, a2);
  -[DOCItemRenameTextView setBackgroundColor:](&v4, "setBackgroundColor:", a3);
}

- (void)layoutSubviews
{
  _TtC5Files21DOCItemRenameTextView *v2;

  v2 = self;
  DOCItemRenameTextView.layoutSubviews()();

}

- (void)willMoveToSuperview:(id)a3
{
  id v5;
  _TtC5Files21DOCItemRenameTextView *v6;
  _TtC5Files21DOCItemRenameTextView *v7;
  UIView_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.super.isa = (Class)a3;
  DOCItemRenameTextView.willMove(toSuperview:)(v8);

}

- (void)editExtension:(id)a3
{
  _TtC5Files21DOCItemRenameTextView *v5;
  uint64_t v6;
  _TtC5Files21DOCItemRenameTextView *v7;
  uint64_t v8;
  _OWORD v9[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v9, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v7 = self;
  }
  sub_100253DA0((uint64_t)v7, v8);

  sub_10007EB54((uint64_t)v9);
}

- (void)didMoveToSuperview
{
  _BYTE *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  v2 = v3.receiver;
  -[DOCItemRenameTextView didMoveToSuperview](&v3, "didMoveToSuperview");
  if (v2[OBJC_IVAR____TtC5Files21DOCItemRenameTextView_backgroundStyle] == 1)
    sub_10025341C();
  if (v2[OBJC_IVAR____TtC5Files21DOCItemRenameTextView_showsClearButton] == 1)
    sub_100254078();

}

- (BOOL)supportsImagePaste
{
  return 0;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _TtC5Files21DOCItemRenameTextView *v7;
  uint64_t v8;
  _TtC5Files21DOCItemRenameTextView *v9;
  char v10;
  _OWORD v12[2];

  if (a4)
  {
    v7 = self;
    v8 = swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v12, v8);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v9 = self;
  }
  v10 = DOCItemRenameTextView.canPerformAction(_:withSender:)((uint64_t)a3, (uint64_t)v12);

  sub_10007EB54((uint64_t)v12);
  return v10 & 1;
}

- (void)installClearButton
{
  _TtC5Files21DOCItemRenameTextView *v2;

  v2 = self;
  sub_100254078();

}

- (void)endEdtingCell
{
  _TtC5Files21DOCItemRenameTextView *v2;

  v2 = self;
  sub_100252C70(1, (uint64_t)v2);

}

- (NSArray)keyCommands
{
  _TtC5Files21DOCItemRenameTextView *v2;
  unint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = DOCItemRenameTextView.keyCommands.getter();

  if (v3)
  {
    sub_10004F2F0(0, &qword_1006445C0, UIKeyCommand_ptr);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC5Files21DOCItemRenameTextView *v11;
  id v12;
  uint64_t v13;
  BOOL v14;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v9 = v8;
  v10 = a3;
  v11 = self;
  v12 = objc_msgSend(v10, "markedTextRange");

  if (!v12
    && (v7 == 10 && v9 == 0xE100000000000000
     || (_stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, 10, 0xE100000000000000, 0) & 1) != 0))
  {
    sub_100252C70(1, v13);
    v14 = 0;
  }
  else
  {
    v14 = 1;
  }

  swift_bridgeObjectRelease(v9);
  return v14;
}

- (void)textViewDidChange:(id)a3
{
  id v4;
  _TtC5Files21DOCItemRenameTextView *v5;

  v4 = a3;
  v5 = self;
  DOCItemRenameTextView.textViewDidChange(_:)((UITextView)v4);

}

- (id)textView:(id)a3 editMenuForTextInRange:(_NSRange)a4 suggestedActions:(id)a5
{
  uint64_t v8;
  UIMenuElementSize v9;
  id v10;
  _TtC5Files21DOCItemRenameTextView *v11;
  Class v12;

  v8 = sub_10004F2F0(0, (unint64_t *)&qword_100644320, UIMenuElement_ptr);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, v8);
  v10 = a3;
  v11 = self;
  v12 = sub_1002560C4(v9);

  swift_bridgeObjectRelease(v9);
  return v12;
}

- (void)clearText
{
  _TtC5Files21DOCItemRenameTextView *v2;

  v2 = self;
  sub_100254BB8();

}

- (void)undoClearTextWithPreviousText:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  _TtC5Files21DOCItemRenameTextView *v8;
  id v9;
  void *v10;
  NSString v11;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v8 = self;
  v9 = -[DOCItemRenameTextView undoManager](v8, "undoManager");
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, "registerUndoWithTarget:selector:object:", v8, "clearText", 0);

  }
  swift_bridgeObjectRetain(v7);
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  v12.receiver = v8;
  v12.super_class = ObjectType;
  -[DOCItemRenameTextView setText:](&v12, "setText:", v11);

  swift_bridgeObjectRelease(v7);
}

- (UIButton)accessibilityClearButton
{
  _TtC5Files21DOCItemRenameTextView *v2;
  uint64_t v3;
  id v4;

  v2 = self;
  v4 = sub_100253CE8((uint64_t)v2, v3);

  return (UIButton *)v4;
}

- (_TtC5Files21DOCItemRenameTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  id v4;
  _TtC5Files21DOCItemRenameTextView *result;

  v4 = a4;
  result = (_TtC5Files21DOCItemRenameTextView *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCItemRenameTextView", 27, "init(frame:textContainer:)", 26, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files21DOCItemRenameTextView_itemRenameDelegate);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files21DOCItemRenameTextView____lazy_storage___notificationsController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCItemRenameTextView____lazy_storage___backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCItemRenameTextView_contentSizeObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCItemRenameTextView____lazy_storage___clearButton));
}

- (UITextViewDelegate)delegate
{
  return (UITextViewDelegate *)sub_100255938(self, (uint64_t)a2, (SEL *)&selRef_delegate);
}

- (NSString)text
{
  id v2;
  NSString *v3;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v9.receiver;
  v3 = -[DOCItemRenameTextView text](&v9, "text");
  if (v3)
  {
    v4 = v3;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
    v6 = v5;

    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v6);
    return (NSString *)v7;
  }
  else
  {

    return (NSString *)0;
  }
}

- (void)setText:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  _TtC5Files21DOCItemRenameTextView *v8;
  _TtC5Files21DOCItemRenameTextView *v9;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    v8 = self;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v9 = self;
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  -[DOCItemRenameTextView setText:](&v10, "setText:", a3);

}

@end
