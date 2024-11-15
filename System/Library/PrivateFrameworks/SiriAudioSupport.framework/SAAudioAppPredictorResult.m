@implementation SAAudioAppPredictorResult

- (NSString)requestId
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_2297DCE48();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)selectedBundleIdentifier
{
  void *v2;

  if (*(_QWORD *)&self->requestId[OBJC_IVAR___SAAudioAppPredictorResult_selectedBundleIdentifier])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_2297DCE48();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (NSArray)disambiguateBundleIdentifiers
{
  void *v2;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___SAAudioAppPredictorResult_disambiguateBundleIdentifiers))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_2297DCFBC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (SAAudioAppPredictorResult)init
{
  SAAudioAppPredictorResult *result;

  result = (SAAudioAppPredictorResult *)sub_2297DD55C();
  __break(1u);
  return result;
}

- (SAAudioAppPredictorResult)initWithRequestId:(id)a3 selectedBundleIdentifier:(id)a4 disambiguateBundleIdentifiers:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_class *v13;
  uint64_t *v14;
  id *v15;
  objc_super v17;

  v8 = sub_2297DCE60();
  v10 = v9;
  if (!a4)
  {
    v12 = 0;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  a4 = (id)sub_2297DCE60();
  v12 = v11;
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v13 = (objc_class *)sub_2297DCFD4();
LABEL_6:
  v14 = (uint64_t *)((char *)self + OBJC_IVAR___SAAudioAppPredictorResult_requestId);
  *v14 = v8;
  v14[1] = v10;
  v15 = (id *)((char *)&self->super.isa + OBJC_IVAR___SAAudioAppPredictorResult_selectedBundleIdentifier);
  *v15 = a4;
  v15[1] = v12;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SAAudioAppPredictorResult_disambiguateBundleIdentifiers) = v13;
  v17.receiver = self;
  v17.super_class = (Class)type metadata accessor for SiriAudioAppPredictorResult();
  return -[SAAudioAppPredictorResult init](&v17, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
