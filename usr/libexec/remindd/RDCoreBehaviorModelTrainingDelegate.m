@implementation RDCoreBehaviorModelTrainingDelegate

- (id)miningTask:(id)a3 filteredRulesForExtractedRules:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  _TtC7remindd35RDCoreBehaviorModelTrainingDelegate *v11;
  Class isa;

  v7 = sub_1000151B0(0, &qword_10083FEB0, BMRule_ptr);
  v8 = sub_100435490();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  v10 = a3;
  v11 = self;
  sub_100433FA8(v9);

  swift_bridgeObjectRelease();
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (void)miningTaskDidFinish:(id)a3
{
  id v4;
  _TtC7remindd35RDCoreBehaviorModelTrainingDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10042FCC0(v4);

}

- (void)miningTask:(id)a3 didExtractRules:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC7remindd35RDCoreBehaviorModelTrainingDelegate *v12;
  uint64_t v13;
  id v14;
  _TtC7remindd35RDCoreBehaviorModelTrainingDelegate *v15;
  uint64_t v16;
  BOOL v17;
  objc_class *v18;

  v7 = sub_1000151B0(0, &qword_10083FEB0, BMRule_ptr);
  v8 = sub_100435490();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  if ((v9 & 0xC000000000000001) != 0)
  {
    if (v9 < 0)
      v10 = v9;
    else
      v10 = v9 & 0xFFFFFFFFFFFFFF8;
    v11 = a3;
    v12 = self;
    v13 = __CocoaSet.count.getter(v10);
  }
  else
  {
    v13 = *(_QWORD *)(v9 + 16);
    v14 = a3;
    v15 = self;
  }
  v16 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd35RDCoreBehaviorModelTrainingDelegate_metrics);
  v17 = __OFADD__(v16, v13);
  v18 = (objc_class *)(v16 + v13);
  if (v17)
  {
    __break(1u);
  }
  else
  {
    *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd35RDCoreBehaviorModelTrainingDelegate_metrics) = v18;

    swift_bridgeObjectRelease();
  }
}

- (id)taskSpecificEventProvidersForMiningTask:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _TtC7remindd35RDCoreBehaviorModelTrainingDelegate *v6;
  Class isa;

  v4 = sub_10001A630((uint64_t *)&unk_10083AD90);
  v5 = swift_allocObject(v4, 40, 7);
  *(_OWORD *)(v5 + 16) = xmmword_1006A7330;
  *(_QWORD *)(v5 + 32) = self;
  specialized Array._endMutation()(v5);
  v6 = self;
  sub_10001A630(&qword_10084A858);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)eventsForTypes:(id)a3 error:(id *)a4
{
  _TtC7remindd35RDCoreBehaviorModelTrainingDelegate *v4;
  Class isa;

  v4 = self;
  sub_1004341E8();

  sub_1000151B0(0, &qword_10084A850, BMEvent_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (_TtC7remindd35RDCoreBehaviorModelTrainingDelegate)init
{
  _TtC7remindd35RDCoreBehaviorModelTrainingDelegate *result;

  result = (_TtC7remindd35RDCoreBehaviorModelTrainingDelegate *)_swift_stdlib_reportUnimplementedInitializer("remindd.RDCoreBehaviorModelTrainingDelegate", 43, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC7remindd35RDCoreBehaviorModelTrainingDelegate_trainingDataFrame;
  v4 = type metadata accessor for REMSuggestedAttributeInputDataFrame(0, a2);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC7remindd35RDCoreBehaviorModelTrainingDelegate_intentWords));

}

@end
