@implementation LanguageAwareEditor.Coordinator

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  void (*v15)(uint64_t);
  uint64_t v16;
  id v17;
  _TtCV17SequoiaTranslator19LanguageAwareEditor11Coordinator *v18;
  id v19;
  BOOL v20;
  id v21;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v9 = v8;
  if (v7 == 10 && v8 == 0xE100000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)(v7, v8, 10, 0xE100000000000000, 0) & 1) != 0)
  {
    v10 = type metadata accessor for LanguageAwareTextView(0);
    v11 = swift_dynamicCastClass(a3, v10);
    if (v11
      && (v12 = v11,
          v13 = (char *)self
              + OBJC_IVAR____TtCV17SequoiaTranslator19LanguageAwareEditor11Coordinator_languageAwareEditor,
          v14 = &v13[*(int *)(type metadata accessor for LanguageAwareEditor(0) + 60)],
          (v15 = *(void (**)(uint64_t))v14) != 0))
    {
      v16 = *((_QWORD *)v14 + 1);
      v17 = a3;
      v18 = self;
      sub_100016244((uint64_t)v15, v16);
      v15(v12);
      sub_10002BA44((uint64_t)v15, v16);

    }
    else
    {
      v19 = a3;
    }
    v20 = 0;
  }
  else
  {
    v21 = a3;
    v20 = 1;
  }
  swift_bridgeObjectRelease(v9);

  return v20;
}

- (void)textViewDidChange:(id)a3
{
  id v4;
  _TtCV17SequoiaTranslator19LanguageAwareEditor11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_1000F58C0(v4);

}

- (void)textDroppableView:(id)a3 dropSessionDidEnter:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _TtCV17SequoiaTranslator19LanguageAwareEditor11Coordinator *v10;
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

- (void)textViewDidBeginEditing:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  void (*v10)(uint64_t);
  uint64_t v11;
  id v12;
  _TtCV17SequoiaTranslator19LanguageAwareEditor11Coordinator *v13;

  v5 = type metadata accessor for LanguageAwareTextView(0);
  v6 = swift_dynamicCastClass(a3, v5);
  if (v6)
  {
    v7 = v6;
    v8 = (char *)self + OBJC_IVAR____TtCV17SequoiaTranslator19LanguageAwareEditor11Coordinator_languageAwareEditor;
    v9 = &v8[*(int *)(type metadata accessor for LanguageAwareEditor(0) + 64)];
    v10 = *(void (**)(uint64_t))v9;
    if (*(_QWORD *)v9)
    {
      v11 = *((_QWORD *)v9 + 1);
      v12 = a3;
      v13 = self;
      sub_100016244((uint64_t)v10, v11);
      v10(v7);
      sub_10002BA44((uint64_t)v10, v11);

    }
  }
}

- (_TtCV17SequoiaTranslator19LanguageAwareEditor11Coordinator)init
{
  _TtCV17SequoiaTranslator19LanguageAwareEditor11Coordinator *result;

  result = (_TtCV17SequoiaTranslator19LanguageAwareEditor11Coordinator *)_swift_stdlib_reportUnimplementedInitializer("SequoiaTranslator.Coordinator", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000F6CFC((uint64_t)self + OBJC_IVAR____TtCV17SequoiaTranslator19LanguageAwareEditor11Coordinator_languageAwareEditor);
}

@end
