@implementation ADJourneyMetricsHelperInternal

- (ADJourneyMetricsHelperInternal)initWithPromotedContentIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_22828A2A4();
  return (ADJourneyMetricsHelperInternal *)ADJourneyMetricsHelper.init(promotedContentIdentifier:)(v3, v4);
}

- (void)placed
{
  ADJourneyMetricsHelperInternal *v2;

  v2 = self;
  sub_22828A238();

}

- (void)onScreen
{
  ADJourneyMetricsHelperInternal *v2;

  v2 = self;
  sub_22828A250();

}

- (void)offScreen
{
  ADJourneyMetricsHelperInternal *v2;

  v2 = self;
  sub_22828A280();

}

- (void)visibleWithStarting:(id)a3 duration:(double)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  ADJourneyMetricsHelperInternal *v9;
  uint64_t v10;

  v5 = sub_22828A1D8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22828A1CC();
  v9 = self;
  sub_22828A244();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)adMarkerInteracted
{
  ADJourneyMetricsHelperInternal *v2;

  v2 = self;
  sub_22828A220();

}

- (void)getAppWithButtonState:(int64_t)a3
{
  ADJourneyMetricsHelperInternal *v3;

  v3 = self;
  sub_22828A22C();

}

- (void)interacted
{
  ADJourneyMetricsHelperInternal *v2;

  v2 = self;
  sub_22828A214();

}

- (void)delivered
{
  ADJourneyMetricsHelperInternal *v2;

  v2 = self;
  sub_22828A274();

}

- (void)completed
{
  ADJourneyMetricsHelperInternal *v2;

  v2 = self;
  sub_22828A268();

}

- (void)receivedWithAdamId:(id)a3 impressionId:(id)a4 adMetadata:(id)a5
{
  ADJourneyMetricsHelperInternal *v8;

  sub_22828A2A4();
  if (!a4)
  {
    if (!a5)
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_22828A2A4();
  if (a5)
LABEL_3:
    sub_22828A2A4();
LABEL_5:
  v8 = self;
  sub_22828A25C();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)discarded
{
  ADJourneyMetricsHelperInternal *v2;
  id v3;

  v2 = self;
  sub_22828A2BC();
  sub_228289EB4();
  v3 = (id)sub_22828A2C8();
  sub_22828A298();

}

- (ADJourneyMetricsHelperInternal)init
{
  ADJourneyMetricsHelperInternal *result;

  result = (ADJourneyMetricsHelperInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
