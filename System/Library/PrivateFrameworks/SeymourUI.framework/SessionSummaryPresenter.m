@implementation SessionSummaryPresenter

- (void)textSizeChanged:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v3 = sub_22BA79344();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BA79320();
  swift_retain();
  sub_22B5978D4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end
