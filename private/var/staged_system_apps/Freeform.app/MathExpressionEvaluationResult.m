@implementation MathExpressionEvaluationResult

- (NSString)string
{
  return (NSString *)sub_10057F078((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform30MathExpressionEvaluationResult_string);
}

- (void)setString:(id)a3
{
  sub_1008048C8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC8Freeform30MathExpressionEvaluationResult_string);
}

- (NSArray)strokes
{
  _TtC8Freeform30MathExpressionEvaluationResult *v2;
  Class isa;

  v2 = self;
  sub_100804958();

  sub_1004B804C((uint64_t *)&unk_1013F4A70);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (BOOL)isEqual:(id)a3
{
  return sub_100610434(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_100804A98);
}

- (CGRect)bounds
{
  void *v2;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform30MathExpressionEvaluationResult_drawing);
  if (v2)
  {
    objc_msgSend(v2, "bounds");
  }
  else
  {
    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSNumber)strokeGroupIdentifier
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC8Freeform30MathExpressionEvaluationResult_strokeGroupIdentifier));
}

- (void)setStrokeGroupIdentifier:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform30MathExpressionEvaluationResult_strokeGroupIdentifier);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform30MathExpressionEvaluationResult_strokeGroupIdentifier) = (Class)a3;
  v3 = a3;

}

- (_TtC8Freeform30MathExpressionEvaluationResult)init
{
  objc_class *ObjectType;
  _QWORD *v4;
  uint64_t v5;
  id v6;
  _TtC8Freeform30MathExpressionEvaluationResult *v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform30MathExpressionEvaluationResult_string);
  *v4 = 0;
  v4[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform30MathExpressionEvaluationResult_drawing) = 0;
  v5 = OBJC_IVAR____TtC8Freeform30MathExpressionEvaluationResult_strokeGroupIdentifier;
  v6 = objc_allocWithZone((Class)NSNumber);
  v7 = self;
  *(Class *)((char *)&self->super.isa + v5) = (Class)objc_msgSend(v6, "initWithInteger:", 0);

  v9.receiver = v7;
  v9.super_class = ObjectType;
  return -[MathExpressionEvaluationResult init](&v9, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->string[OBJC_IVAR____TtC8Freeform30MathExpressionEvaluationResult_string]);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform30MathExpressionEvaluationResult_strokeGroupIdentifier));
}

@end
