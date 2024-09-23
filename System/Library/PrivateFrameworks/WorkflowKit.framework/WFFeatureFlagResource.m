@implementation WFFeatureFlagResource

- (_TtC11WorkflowKit21WFFeatureFlagResource)initWithDomain:(id)a3 feature:(id)a4 value:(BOOL)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC11WorkflowKit21WFFeatureFlagResource *result;

  v6 = sub_1C1B0F224();
  v8 = v7;
  v9 = sub_1C1B0F224();
  WFFeatureFlagResource.init(domain:feature:value:)(v6, v8, v9, v10, a5);
  return result;
}

+ (BOOL)mustBeAvailableForDisplay
{
  return 1;
}

- (void)refreshAvailability
{
  _TtC11WorkflowKit21WFFeatureFlagResource *v2;

  v2 = self;
  sub_1C1638150();

}

- (_TtC11WorkflowKit21WFFeatureFlagResource)initWithDefinition:(id)a3
{
  if (a3)
    sub_1C1B0F164();
  WFFeatureFlagResource.init(definition:)();
}

- (_TtC11WorkflowKit21WFFeatureFlagResource)init
{
  WFFeatureFlagResource.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
