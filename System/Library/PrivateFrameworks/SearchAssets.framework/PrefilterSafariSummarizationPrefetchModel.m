@implementation PrefilterSafariSummarizationPrefetchModel

- (NSString)prefilterUrl
{
  uint64_t v2;
  void *v3;

  sub_2459B9A7C();
  if (v2)
  {
    v3 = (void *)sub_2459D971C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)hasMatchedPattern
{
  return sub_2459B9AD4() & 1;
}

- (_TtC12SearchAssets41PrefilterSafariSummarizationPrefetchModel)init
{
  sub_2459B9B30();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
