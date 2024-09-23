@implementation VUIJetPackControllerResponse

- (void).cxx_destruct
{
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_13_7();
  OUTLINED_FUNCTION_70_60(*(uint64_t (**)(uint64_t))(*(_QWORD *)(v2 - 8) + 8));
  swift_bridgeObjectRelease();
}

- (NSString)source
{
  void *v2;

  VUIJetPackControllerResponse.source.getter();
  v2 = (void *)sub_1DA143E50();
  swift_bridgeObjectRelease();
  return (NSString *)OUTLINED_FUNCTION_111(v2);
}

- (NSURL)url
{
  return (NSURL *)sub_1D97C4598((uint64_t)self, (uint64_t)a2, (void (*)(void))VUIJetPackControllerResponse.url.getter);
}

- (_TtC8VideosUI28VUIJetPackControllerResponse)init
{
  VUIJetPackControllerResponse.init()();
}

@end
