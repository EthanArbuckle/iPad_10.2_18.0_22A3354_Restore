@implementation CRLCalculateDocumentProvider

- (NSSet)declaredVariables
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform28CRLCalculateDocumentProvider_declaredVariables);
  swift_bridgeObjectRetain(v2);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSSet *)isa;
}

- (void)setDeclaredVariables:(id)a3
{
  objc_class *v4;
  uint64_t v5;

  v4 = (objc_class *)static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, &protocol witness table for String);
  v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform28CRLCalculateDocumentProvider_declaredVariables);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform28CRLCalculateDocumentProvider_declaredVariables) = v4;
  swift_bridgeObjectRelease(v5);
}

- (NSArray)recognizedExpressions
{
  return (NSArray *)sub_1008041AC((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform28CRLCalculateDocumentProvider_expressions, (void (*)(__n128))sub_1005212D4, (uint64_t *)&unk_1013E1CB0);
}

- (NSArray)expressionEvaluationResults
{
  return (NSArray *)sub_1008041AC((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform28CRLCalculateDocumentProvider_evaluationResults, (void (*)(__n128))sub_1005212E0, (uint64_t *)&unk_1013F4A80);
}

- (BOOL)isEqual:(id)a3
{
  return sub_100610434(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_100804224);
}

- (_TtC8Freeform28CRLCalculateDocumentProvider)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform28CRLCalculateDocumentProvider_declaredVariables) = (Class)&_swiftEmptySetSingleton;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform28CRLCalculateDocumentProvider_expressions) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform28CRLCalculateDocumentProvider_evaluationResults) = (Class)_swiftEmptyArrayStorage;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[CRLCalculateDocumentProvider init](&v5, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform28CRLCalculateDocumentProvider_declaredVariables));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform28CRLCalculateDocumentProvider_expressions));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform28CRLCalculateDocumentProvider_evaluationResults));
}

@end
