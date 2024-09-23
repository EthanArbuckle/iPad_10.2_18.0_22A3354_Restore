@implementation UniversalControlPreferencesImpl

- (BOOL)automation
{
  BOOL result;

  sub_24974B254((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_249749B68);
  return result;
}

- (void)setAutomation:(BOOL)a3
{
  sub_24974B2AC((uint64_t)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_249749BD0);
}

- (BOOL)enabled
{
  BOOL result;

  sub_24974B254((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_24974B214);
  return result;
}

- (void)setEnabled:(BOOL)a3
{
  sub_24974B2AC((uint64_t)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_24974B23C);
}

- (BOOL)magicEdgesEnabled
{
  BOOL result;

  sub_24974B254((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_24974B284);
  return result;
}

- (void)setMagicEdgesEnabled:(BOOL)a3
{
  sub_24974B2AC((uint64_t)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_24974B2EC);
}

- (BOOL)isSupported
{
  char v2;

  swift_retain();
  v2 = sub_24974B32C();
  swift_release();
  return v2 & 1;
}

@end
