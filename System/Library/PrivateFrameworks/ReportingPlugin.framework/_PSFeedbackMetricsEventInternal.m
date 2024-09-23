@implementation _PSFeedbackMetricsEventInternal

- (NSString)id
{
  return (NSString *)sub_245482500();
}

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____PSFeedbackMetricsEventInternal_type);
}

- (NSString)engagedSuggestionId
{
  void *v2;

  if (*(_QWORD *)&self->id[OBJC_IVAR____PSFeedbackMetricsEventInternal_engagedSuggestionId])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_24549A0A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)airdropOptionPresent
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____PSFeedbackMetricsEventInternal_airdropOptionPresent);
}

- (unsigned)visiblePeopleSuggestionCount
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____PSFeedbackMetricsEventInternal_visiblePeopleSuggestionCount);
}

- (unsigned)visibleAppSuggestionCount
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____PSFeedbackMetricsEventInternal_visibleAppSuggestionCount);
}

- (NSString)trialExperimentId
{
  return (NSString *)sub_245482500();
}

- (NSString)trialTreatmentId
{
  return (NSString *)sub_245482500();
}

- (NSString)trialDeploymentId
{
  return (NSString *)sub_245482500();
}

- (_PSFeedbackMetricsEventInternal)initWithId:(id)a3 type:(int64_t)a4 engagedSuggestionId:(id)a5 airdropOptionPresent:(BOOL)a6 visiblePeopleSuggestionCount:(unsigned __int8)a7 visibleAppSuggestionCount:(unsigned __int8)a8 trialExperimentId:(id)a9 trialTreatmentId:(id)a10 trialDeploymentId:(id)a11 peopleSuggestionsTimeoutOccurred:(BOOL)a12
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  _PSFeedbackMetricsEventInternal *v28;
  uint64_t v30;
  uint64_t v31;

  v13 = sub_24549A0B4();
  v30 = v14;
  v31 = v13;
  if (a5)
  {
    a5 = (id)sub_24549A0B4();
    v16 = v15;
  }
  else
  {
    v16 = 0;
  }
  v17 = sub_24549A0B4();
  v19 = v18;
  v20 = sub_24549A0B4();
  v22 = v21;
  v23 = sub_24549A0B4();
  v25 = v24;
  if (a12)
    v26 = &unk_25165B2F0;
  else
    v26 = (void *)MEMORY[0x24BEE4AF8];
  v27 = objc_allocWithZone((Class)type metadata accessor for PeopleSuggesterFeedbackEvent());
  v28 = (_PSFeedbackMetricsEventInternal *)sub_24548273C(v31, v30, a4, (uint64_t)a5, v16, a6, a7, a8, v17, v19, v20, v22, v23, v25, (uint64_t)v26);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v28;
}

- (_PSFeedbackMetricsEventInternal)init
{
  _PSFeedbackMetricsEventInternal *result;

  result = (_PSFeedbackMetricsEventInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (NSString)description
{
  return (NSString *)sub_245484BD8(self, (uint64_t)a2, (void (*)(void))PeopleSuggesterFeedbackEvent.description.getter);
}

@end
