@implementation BCFrontmostApplicationTracker

- (id)onFrontmostChanged
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD aBlock[5];
  uint64_t v8;
  _BYTE v9[24];

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___BCFrontmostApplicationTracker_onFrontmostChanged);
  swift_beginAccess((char *)self + OBJC_IVAR___BCFrontmostApplicationTracker_onFrontmostChanged, v9, 0, 0);
  if (!*v2)
    return 0;
  v3 = v2[1];
  aBlock[4] = *v2;
  v8 = v3;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A971C;
  aBlock[3] = &unk_295A48;
  v4 = _Block_copy(aBlock);
  v5 = v8;
  swift_retain(v3);
  swift_release(v5);
  return v4;
}

- (void)setOnFrontmostChanged:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[24];

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject(&unk_295A30, 24, 7);
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1ABB14;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___BCFrontmostApplicationTracker_onFrontmostChanged);
  swift_beginAccess(v6, v9, 1, 0);
  v7 = *v6;
  v8 = v6[1];
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_178760(v7, v8);
}

- (void)dealloc
{
  BCFrontmostApplicationTracker *v2;

  v2 = self;
  FrontmostApplicationTracker.__deallocating_deinit();
}

- (void).cxx_destruct
{

  sub_178760(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BCFrontmostApplicationTracker_onFrontmostChanged), *(_QWORD *)&self->appKitBundle[OBJC_IVAR___BCFrontmostApplicationTracker_onFrontmostChanged]);
}

- (BCFrontmostApplicationTracker)init
{
  BCFrontmostApplicationTracker *result;

  result = (BCFrontmostApplicationTracker *)_swift_stdlib_reportUnimplementedInitializer("BookCore.FrontmostApplicationTracker", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)uiKitWillEnterForeground:(id)a3
{
  sub_1AA4BC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)"%@: UIApplication will enter foreground", (void (*)(char *, uint64_t))sub_1AA56C);
}

- (void)uiKitDidEnterBackground:(id)a3
{
  sub_1AA4BC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)"%@: UIApplication did enter background", (void (*)(char *, uint64_t))sub_1AA780);
}

- (void)uiKitWillResignActive:(id)a3
{
  sub_1AA4BC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)"%@: UIApplication will resign active", (void (*)(char *, uint64_t))sub_1AA56C);
}

- (void)uiKitDidBecomeActive:(id)a3
{
  sub_1AA4BC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)"%@: UIApplication did become active", (void (*)(char *, uint64_t))sub_1AA780);
}

- (void)appKitDidBecomeActive:(id)a3
{
  sub_1786B0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1AA9AC);
}

- (void)appKitWillResignActive:(id)a3
{
  sub_1786B0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1AABD8);
}

- (void)screenDidLock:(id)a3
{
  sub_1786B0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1AADDC);
}

- (void)screenDidUnlock:(id)a3
{
  sub_1786B0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1AAFE4);
}

- (void)screenSaverDidStart:(id)a3
{
  sub_1786B0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1AB1E8);
}

- (void)screenSaverDidStop:(id)a3
{
  sub_1786B0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1AB3F0);
}

- (void)workspaceWillSleep:(id)a3
{
  sub_1786B0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1AB5F4);
}

- (void)workspaceDidWake:(id)a3
{
  sub_1786B0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1AB7FC);
}

@end
