@implementation CalculateDocumentProvider

- (NSSet)declaredVariables
{
  Class isa;

  swift_bridgeObjectRetain();
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSSet *)isa;
}

- (void)setDeclaredVariables:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit25CalculateDocumentProvider_declaredVariables) = (Class)static Set._unconditionallyBridgeFromObjectiveC(_:)();
  swift_bridgeObjectRelease();
}

- (NSArray)recognizedExpressions
{
  return (NSArray *)@objc CalculateDocumentProvider.recognizedExpressions.getter(self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC8PaperKit25CalculateDocumentProvider_expressions, (void (*)(uint64_t))specialized _arrayForceCast<A, B>(_:), &demangling cache variable for type metadata for CHMathExpression);
}

- (NSArray)expressionEvaluationResults
{
  return (NSArray *)@objc CalculateDocumentProvider.recognizedExpressions.getter(self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC8PaperKit25CalculateDocumentProvider_evaluationResults, (void (*)(uint64_t))specialized _arrayForceCast<A, B>(_:), &demangling cache variable for type metadata for CHMathExpressionEvaluationResult);
}

- (BOOL)isEqual:(id)a3
{
  return @objc CalculateDocumentProvider.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))CalculateDocumentProvider.isEqual(_:));
}

- (_TtC8PaperKit25CalculateDocumentProvider)init
{
  objc_class *ObjectType;
  objc_class *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit25CalculateDocumentProvider_declaredVariables) = (Class)MEMORY[0x1E0DEE9E8];
  v4 = (objc_class *)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit25CalculateDocumentProvider_expressions) = (Class)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit25CalculateDocumentProvider_evaluationResults) = v4;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[CalculateDocumentProvider init](&v6, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
