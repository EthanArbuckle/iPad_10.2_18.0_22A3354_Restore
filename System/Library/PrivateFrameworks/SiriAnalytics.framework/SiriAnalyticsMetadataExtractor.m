@implementation SiriAnalyticsMetadataExtractor

- (SiriAnalyticsMetadataExtractor)initWithMetastore:(id)a3 runtimeQueue:(id)a4 autoCommit:(BOOL)a5
{
  return (SiriAnalyticsMetadataExtractor *)MetadataExtractor.init(metastore:runtimeQueue:autoCommit:)((uint64_t)a3, (uint64_t)a4, a5);
}

- (void)debounceFired:(id)a3 maximumReached:(BOOL)a4
{
  id v5;
  SiriAnalyticsMetadataExtractor *v6;

  v5 = a3;
  v6 = self;
  sub_1A02C493C(v5);

}

- (void)pruneWithClockIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  SiriAnalyticsMetadataExtractor *v8;
  uint64_t v9;

  v4 = sub_1A0307334();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A030731C();
  v8 = self;
  sub_1A02C4A1C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (SiriAnalyticsMetadataExtractor)init
{
  MetadataExtractor.init()();
}

- (void).cxx_destruct
{

  OUTLINED_FUNCTION_25_9();
  OUTLINED_FUNCTION_25_9();
  OUTLINED_FUNCTION_25_9();
  sub_1A02C69E4(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR___SiriAnalyticsMetadataExtractor____lazy_storage___flushPulse));
}

@end
