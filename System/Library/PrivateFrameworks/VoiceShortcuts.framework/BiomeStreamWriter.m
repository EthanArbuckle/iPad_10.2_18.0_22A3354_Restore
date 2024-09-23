@implementation BiomeStreamWriter

- (void)handleNotification:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v3 = sub_1C1545FA0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1545F70();
  swift_retain();
  sub_1C14BE17C((uint64_t)v6);
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)debouncerFired:(id)a3
{
  id v3;

  v3 = a3;
  swift_retain();
  sub_1C14BE4B0(v3);

  swift_release();
}

@end
