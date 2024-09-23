@implementation SiriAnalyticsMessageProcessingStrategy

- (SiriAnalyticsMessageProcessingStrategy)initWithMessageStaging:(id)a3 metadataExtractor:(id)a4
{
  return (SiriAnalyticsMessageProcessingStrategy *)MessageProcessingStrategy.init(messageStaging:metadataExtractor:)((char *)a3, (uint64_t)a4);
}

- (void)processWithMessages:(id)a3
{
  uint64_t v4;
  SiriAnalyticsMessageProcessingStrategy *v5;

  sub_1A02AD090();
  v4 = sub_1A03078BC();
  v5 = self;
  sub_1A02AC7B8(v4);

  swift_bridgeObjectRelease();
}

- (SiriAnalyticsMessageProcessingStrategy)init
{
  MessageProcessingStrategy.init()();
}

- (void).cxx_destruct
{

  swift_release();
}

@end
