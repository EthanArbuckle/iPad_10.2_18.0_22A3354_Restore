@implementation PPTHostedPageDependentTest

- (int)timeBeforeTest
{
  return 5;
}

- (int)handlerTimeout
{
  return 3;
}

- (BOOL)hasHandler
{
  _TtC5Books26PPTHostedPageDependentTest *v2;

  v2 = self;
  sub_100238E0C();

  return 0;
}

- (_TtC5Books26PPTHostedPageDependentTest)initWithName:(id)a3 options:(id)a4 testDefinition:(id)a5 isMainTest:(BOOL)a6
{
  return (_TtC5Books26PPTHostedPageDependentTest *)sub_1002393DC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, (uint64_t (*)(uint64_t))type metadata accessor for PPTHostedPageDependentTest);
}

- (_TtC5Books26PPTHostedPageDependentTest)init
{
  return (_TtC5Books26PPTHostedPageDependentTest *)sub_1002394C0(self, (uint64_t)a2, type metadata accessor for PPTHostedPageDependentTest);
}

@end
