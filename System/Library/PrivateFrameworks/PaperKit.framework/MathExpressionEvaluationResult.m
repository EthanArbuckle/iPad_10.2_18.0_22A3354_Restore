@implementation MathExpressionEvaluationResult

- (NSString)string
{
  return (NSString *)@objc MathExpression.expression.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8PaperKit30MathExpressionEvaluationResult_string);
}

- (void)setString:(id)a3
{
  @objc MathExpression.expression.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC8PaperKit30MathExpressionEvaluationResult_string);
}

- (NSArray)strokes
{
  _TtC8PaperKit30MathExpressionEvaluationResult *v2;
  Class isa;

  v2 = self;
  MathExpressionEvaluationResult.strokes.getter();

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CHStroke);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (BOOL)isEqual:(id)a3
{
  return @objc CalculateDocumentProvider.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))MathExpressionEvaluationResult.isEqual(_:));
}

- (CGRect)bounds
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit30MathExpressionEvaluationResult_drawing);
  if (v2)
  {
    objc_msgSend(v2, sel_bounds);
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D628];
    v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (NSNumber)strokeGroupIdentifier
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC8PaperKit30MathExpressionEvaluationResult_strokeGroupIdentifier));
}

- (void)setStrokeGroupIdentifier:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8PaperKit30MathExpressionEvaluationResult_strokeGroupIdentifier);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit30MathExpressionEvaluationResult_strokeGroupIdentifier) = (Class)a3;
  v3 = a3;

}

- (_TtC8PaperKit30MathExpressionEvaluationResult)init
{
  objc_class *ObjectType;
  _QWORD *v4;
  uint64_t v5;
  id v6;
  _TtC8PaperKit30MathExpressionEvaluationResult *v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit30MathExpressionEvaluationResult_string);
  *v4 = 0;
  v4[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit30MathExpressionEvaluationResult_drawing) = 0;
  v5 = OBJC_IVAR____TtC8PaperKit30MathExpressionEvaluationResult_strokeGroupIdentifier;
  v6 = objc_allocWithZone(MEMORY[0x1E0CB37E8]);
  v7 = self;
  *(Class *)((char *)&self->super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithInteger_, 0);

  v9.receiver = v7;
  v9.super_class = ObjectType;
  return -[MathExpressionEvaluationResult init](&v9, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8PaperKit30MathExpressionEvaluationResult_strokeGroupIdentifier));
}

@end
