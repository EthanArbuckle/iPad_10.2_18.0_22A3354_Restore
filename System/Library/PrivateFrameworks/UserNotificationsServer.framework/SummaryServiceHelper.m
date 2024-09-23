@implementation SummaryServiceHelper

- (void)summaryServiceDidReceiveGroupSummaries:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  sub_216DFB2A0(0, &qword_254E53590);
  v4 = sub_216E02FDC();
  v5 = MEMORY[0x219A0356C](self->adapter);
  if (v5)
  {
    v6 = (id)v5;
    swift_retain();
    sub_216DFA018(v4);
    swift_release();
    swift_bridgeObjectRelease();

  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

@end
