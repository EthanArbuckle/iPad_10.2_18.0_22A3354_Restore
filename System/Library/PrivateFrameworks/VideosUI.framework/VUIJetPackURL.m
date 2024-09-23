@implementation VUIJetPackURL

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC8VideosUI13VUIJetPackURL_url;
  v3 = OUTLINED_FUNCTION_13_7();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

- (NSURL)url
{
  return (NSURL *)sub_1D97C4598((uint64_t)self, (uint64_t)a2, (void (*)(void))VUIJetPackURL.url.getter);
}

- (_TtC8VideosUI13VUIJetPackURL)init
{
  VUIJetPackURL.init()();
}

@end
