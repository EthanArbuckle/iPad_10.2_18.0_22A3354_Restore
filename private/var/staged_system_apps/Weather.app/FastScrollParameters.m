@implementation FastScrollParameters

- (id)completionHandler
{
  return sub_1006E3D04((uint64_t)self, (uint64_t)a2, sub_1006E3D64);
}

- (void)setCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC7WeatherP33_4025464B1BDEC98D863ED8B5370ABB4920FastScrollParameters *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject(&unk_100B8A5C0, 24, 7);
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1006E44D0;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_1006E3E30((uint64_t)v4, v5, &OBJC_IVAR____TtC7WeatherP33_4025464B1BDEC98D863ED8B5370ABB4920FastScrollParameters_completionHandler);

}

- (NSString)testName
{
  return (NSString *)sub_1006E3E58((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC7WeatherP33_4025464B1BDEC98D863ED8B5370ABB4920FastScrollParameters_testName);
}

- (void)setTestName:(id)a3
{
  sub_1006E3EE0(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC7WeatherP33_4025464B1BDEC98D863ED8B5370ABB4920FastScrollParameters_testName);
}

- (void)prepareWithComposer:(id)a3
{
  LocationSearchEntityFromStringResolver.init()();
}

- (id)composerBlock
{
  return sub_1006E4170((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))sub_1006E3F84);
}

- (_TtC7WeatherP33_4025464B1BDEC98D863ED8B5370ABB4920FastScrollParameters)init
{
  sub_1006E41C4();
}

- (void).cxx_destruct
{
  sub_1006E4224((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC7WeatherP33_4025464B1BDEC98D863ED8B5370ABB4920FastScrollParameters_completionHandler);
}

@end
