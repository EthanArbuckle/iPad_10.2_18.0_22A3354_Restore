@implementation KeyboardUpdatingTextView.Coordinator

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  _TtCV17SequoiaTranslator24KeyboardUpdatingTextView11Coordinator *v13;

  length = a4.length;
  location = a4.location;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v11 = v10;
  v12 = a3;
  v13 = self;
  LOBYTE(length) = sub_1000F0010(v12, location, length, v9, v11);

  swift_bridgeObjectRelease(v11);
  return length & 1;
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4;
  _TtCV17SequoiaTranslator24KeyboardUpdatingTextView11Coordinator *v5;
  NSString v6;

  v4 = a3;
  v5 = self;
  v6 = String._bridgeToObjectiveC()();
  objc_msgSend(v4, "setText:", v6);

}

- (void)textViewDidChange:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void (*v9)(uint64_t);
  id v10;
  _TtCV17SequoiaTranslator24KeyboardUpdatingTextView11Coordinator *v11;

  v5 = type metadata accessor for KeyboardUpdatingTextViewUIKit();
  v6 = swift_dynamicCastClass(a3, v5);
  if (v6)
  {
    v7 = v6;
    v8 = (char *)self
       + OBJC_IVAR____TtCV17SequoiaTranslator24KeyboardUpdatingTextView11Coordinator_keyboardUpdatingTextView;
    v9 = *(void (**)(uint64_t))&v8[*(int *)(type metadata accessor for KeyboardUpdatingTextView(0) + 32)];
    v10 = a3;
    v11 = self;
    v9(v7);

  }
}

- (void)textDroppableView:(id)a3 dropSessionDidEnter:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _TtCV17SequoiaTranslator24KeyboardUpdatingTextView11Coordinator *v10;
  id v11;
  void *v12;
  id v13;

  v7 = objc_opt_self(UITextView);
  v8 = swift_dynamicCastObjCClass(a3, v7);
  if (v8)
  {
    v9 = (void *)v8;
    v13 = a3;
    swift_unknownObjectRetain(a4);
    v10 = self;
    v11 = objc_msgSend(v9, "delegate");
    if (v11)
    {
      v12 = v11;
      if ((objc_msgSend(v11, "respondsToSelector:", "textViewDidChange:") & 1) != 0)
        objc_msgSend(v12, "textViewDidChange:", v9);
      swift_unknownObjectRelease(a4);

      swift_unknownObjectRelease(v12);
    }
    else
    {
      swift_unknownObjectRelease(a4);

    }
  }
}

- (void)preferredContentSizeChanged:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtCV17SequoiaTranslator24KeyboardUpdatingTextView11Coordinator *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1000F0848();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtCV17SequoiaTranslator24KeyboardUpdatingTextView11Coordinator)init
{
  _TtCV17SequoiaTranslator24KeyboardUpdatingTextView11Coordinator *result;

  result = (_TtCV17SequoiaTranslator24KeyboardUpdatingTextView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer("SequoiaTranslator.Coordinator", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000F1A44((uint64_t)self + OBJC_IVAR____TtCV17SequoiaTranslator24KeyboardUpdatingTextView11Coordinator_keyboardUpdatingTextView);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV17SequoiaTranslator24KeyboardUpdatingTextView11Coordinator_keyboardUpdatingTextViewUIKit));
  sub_10000A020((uint64_t)self + OBJC_IVAR____TtCV17SequoiaTranslator24KeyboardUpdatingTextView11Coordinator__horizontalSizeClass, &qword_10028CE50);
}

@end
