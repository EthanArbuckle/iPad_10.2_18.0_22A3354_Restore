@implementation PMSecureWindowLockPolicyEnforcer

- (void)appDidBecomeActive:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v3 = sub_24384D45C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24384D450();
  swift_retain();
  sub_2437AA808();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)appDidEnterBackground:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v7[16];

  v3 = sub_24384D45C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v7[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_24384D450();
  swift_getKeyPath();
  swift_getKeyPath();
  v7[15] = 0;
  swift_retain();
  sub_24384DEDC();
  (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

@end
