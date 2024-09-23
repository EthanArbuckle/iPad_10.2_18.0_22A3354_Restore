@implementation SMMusicTrack

- (NSString)identifier
{
  return (NSString *)sub_24A6906A8(self, (uint64_t)a2, (void (*)(void))MEMORY[0x24BE886E0]);
}

- (NSString)title
{
  return (NSString *)sub_24A6906A8(self, (uint64_t)a2, (void (*)(void))MEMORY[0x24BE886F8]);
}

- (NSString)artist
{
  return (NSString *)sub_24A6906A8(self, (uint64_t)a2, (void (*)(void))MEMORY[0x24BE88700]);
}

- (NSString)album
{
  return (NSString *)sub_24A6906A8(self, (uint64_t)a2, (void (*)(void))MEMORY[0x24BE886F0]);
}

- (double)startTime
{
  SMMusicTrack *v2;
  double v3;
  double v4;

  v2 = self;
  sub_24A778A4C();
  v4 = v3;

  return v4;
}

- (double)duration
{
  SMMusicTrack *v2;
  double v3;
  double v4;

  v2 = self;
  sub_24A778A40();
  v4 = v3;

  return v4;
}

- (SMMusicTrack)init
{
  SMMusicTrack *result;

  result = (SMMusicTrack *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___SMMusicTrack_musicTrack;
  v3 = sub_24A778A58();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
