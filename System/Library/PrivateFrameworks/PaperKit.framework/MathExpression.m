@implementation MathExpression

- (NSString)expression
{
  return (NSString *)@objc MathExpression.expression.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8PaperKit14MathExpression_expression);
}

- (void)setExpression:(id)a3
{
  @objc MathExpression.expression.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC8PaperKit14MathExpression_expression);
}

- (int64_t)expressionType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit14MathExpression_expressionType);
}

- (void)setExpressionType:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit14MathExpression_expressionType) = (Class)a3;
}

- (NSNumber)strokeGroupIdentifier
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC8PaperKit14MathExpression_strokeGroupIdentifier));
}

- (void)setStrokeGroupIdentifier:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit14MathExpression_strokeGroupIdentifier);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit14MathExpression_strokeGroupIdentifier) = (Class)a3;
  v3 = a3;

}

- (BOOL)isEqual:(id)a3
{
  return @objc CalculateDocumentProvider.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))MathExpression.isEqual(_:));
}

- (_TtC8PaperKit14MathExpression)init
{
  objc_class *ObjectType;
  _QWORD *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit14MathExpression_expression);
  *v4 = 0;
  v4[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit14MathExpression_expressionType) = (Class)1;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit14MathExpression_strokeGroupIdentifier) = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[MathExpression init](&v6, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

@end
