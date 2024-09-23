@implementation MathExpression

- (NSString)expression
{
  return (NSString *)sub_10057F078((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform14MathExpression_expression);
}

- (void)setExpression:(id)a3
{
  sub_1008048C8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC8Freeform14MathExpression_expression);
}

- (int64_t)expressionType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform14MathExpression_expressionType);
}

- (void)setExpressionType:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform14MathExpression_expressionType) = (Class)a3;
}

- (NSNumber)strokeGroupIdentifier
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC8Freeform14MathExpression_strokeGroupIdentifier));
}

- (void)setStrokeGroupIdentifier:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform14MathExpression_strokeGroupIdentifier);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform14MathExpression_strokeGroupIdentifier) = (Class)a3;
  v3 = a3;

}

- (BOOL)isEqual:(id)a3
{
  return sub_100610434(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_100804704);
}

- (_TtC8Freeform14MathExpression)init
{
  objc_class *ObjectType;
  _QWORD *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform14MathExpression_expression);
  *v4 = 0;
  v4[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform14MathExpression_expressionType) = (Class)1;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform14MathExpression_strokeGroupIdentifier) = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[MathExpression init](&v6, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->expression[OBJC_IVAR____TtC8Freeform14MathExpression_expression]);

}

@end
