@implementation NCSummaryServiceGateway

- (NCSummaryServiceGateway)init
{
  return (NCSummaryServiceGateway *)sub_1CFD71D0C();
}

- (void)donateStateDump:(id)a3
{
  uint64_t v4;
  NCSummaryServiceGateway *v5;

  v4 = sub_1CFD7C46C();
  v5 = self;
  sub_1CFD71E68(v4);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_release();
}

@end
