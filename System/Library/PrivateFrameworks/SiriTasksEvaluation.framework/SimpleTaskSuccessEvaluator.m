@implementation SimpleTaskSuccessEvaluator

- (id)evaluateWithPseEvents:(id)a3
{
  unint64_t v4;
  _TtC19SiriTasksEvaluation26SimpleTaskSuccessEvaluator *v5;
  id v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254B93350);
  v4 = sub_2132F2724();
  v5 = self;
  v6 = sub_2132EE468(v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (_TtC19SiriTasksEvaluation26SimpleTaskSuccessEvaluator)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC19SiriTasksEvaluation26SimpleTaskSuccessEvaluator_minStartCallDurationInMs) = (Class)5000;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SimpleTaskSuccessEvaluator();
  return -[SimpleTaskSuccessEvaluator init](&v3, sel_init);
}

@end
