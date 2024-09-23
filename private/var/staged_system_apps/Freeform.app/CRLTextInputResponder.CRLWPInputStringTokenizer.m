@implementation CRLTextInputResponder.CRLWPInputStringTokenizer

- (_TtCC8Freeform21CRLTextInputResponder25CRLWPInputStringTokenizer)initWithTextInput:(id)a3
{
  char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  _TtCC8Freeform21CRLTextInputResponder25CRLWPInputStringTokenizer *v10;
  objc_super v12;

  v5 = (char *)self + OBJC_IVAR____TtCC8Freeform21CRLTextInputResponder25CRLWPInputStringTokenizer_textInput;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtCC8Freeform21CRLTextInputResponder25CRLWPInputStringTokenizer_textInput);
  v6 = type metadata accessor for CRLTextInputResponder();
  v7 = (void *)swift_dynamicCastClass(a3, v6);
  if (v7)
    v8 = a3;
  swift_unknownObjectWeakAssign(v5, v7);
  v9 = a3;

  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for CRLTextInputResponder.CRLWPInputStringTokenizer();
  v10 = -[CRLTextInputResponder.CRLWPInputStringTokenizer initWithTextInput:](&v12, "initWithTextInput:", v9);

  return v10;
}

- (BOOL)isPosition:(id)a3 atBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  id v8;
  _TtCC8Freeform21CRLTextInputResponder25CRLWPInputStringTokenizer *v9;

  v8 = a3;
  v9 = self;
  LOBYTE(a5) = sub_100650208(v8, a4, a5);

  return a5 & 1;
}

- (id)positionFromPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  id v8;
  _TtCC8Freeform21CRLTextInputResponder25CRLWPInputStringTokenizer *v9;
  id v10;

  v8 = a3;
  v9 = self;
  v10 = sub_100650394(v8, a4, a5);

  return v10;
}

- (_TtCC8Freeform21CRLTextInputResponder25CRLWPInputStringTokenizer)init
{
  _TtCC8Freeform21CRLTextInputResponder25CRLWPInputStringTokenizer *result;

  result = (_TtCC8Freeform21CRLTextInputResponder25CRLWPInputStringTokenizer *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLWPInputStringTokenizer", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtCC8Freeform21CRLTextInputResponder25CRLWPInputStringTokenizer_textInput);
}

@end
