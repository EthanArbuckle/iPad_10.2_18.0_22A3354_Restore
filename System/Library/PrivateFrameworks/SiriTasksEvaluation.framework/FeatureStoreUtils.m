@implementation FeatureStoreUtils

+ (id)retrieveFeatureWithStreamId:(id)a3 interactionId:(id)a4 dataVersion:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;

  v5 = *(_QWORD *)&a5;
  v6 = sub_2132F26A0();
  v8 = v7;
  v9 = sub_2132F26A0();
  v11 = _s19SiriTasksEvaluation17FeatureStoreUtilsC08retrieveD08streamId011interactionI011dataVersionSo20FSFCurareInteraction_pSgSS_SSs6UInt32VtFZ_0(v6, v8, v9, v10, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11;
}

+ (id)retrieveFeatureDataWithStreamId:(id)a3 interactionId:(id)a4
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;

  v4 = sub_2132F26A0();
  v6 = v5;
  v7 = sub_2132F26A0();
  _s19SiriTasksEvaluation17FeatureStoreUtilsC08retrieveD4Data8streamId011interactionJ0Say10Foundation0H0VGSS_SStFZ_0(v4, v6, v7, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v9 = (void *)sub_2132F2718();
  swift_bridgeObjectRelease();
  return v9;
}

- (_TtC19SiriTasksEvaluation17FeatureStoreUtils)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FeatureStoreUtils();
  return -[FeatureStoreUtils init](&v3, sel_init);
}

@end
