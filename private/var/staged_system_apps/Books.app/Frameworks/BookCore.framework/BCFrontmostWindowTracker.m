@implementation BCFrontmostWindowTracker

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___BCFrontmostWindowTracker_window));
}

- (BOOL)isFrontmost
{
  return (*(Class *)((char *)&self->super.isa + OBJC_IVAR___BCFrontmostWindowTracker_state) == 0) & self->appKitBundle[OBJC_IVAR___BCFrontmostWindowTracker_state] & self->appKitBundle[OBJC_IVAR___BCFrontmostWindowTracker_state + 1];
}

- (id)onFrontmostChanged
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD aBlock[5];
  uint64_t v8;
  _BYTE v9[24];

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___BCFrontmostWindowTracker_onFrontmostChanged);
  swift_beginAccess((char *)self + OBJC_IVAR___BCFrontmostWindowTracker_onFrontmostChanged, v9, 0, 0);
  if (!*v2)
    return 0;
  v3 = v2[1];
  aBlock[4] = *v2;
  v8 = v3;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A971C;
  aBlock[3] = &unk_293AD8;
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
    v5 = swift_allocObject(&unk_293AC0, 24, 7);
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_178900;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___BCFrontmostWindowTracker_onFrontmostChanged);
  swift_beginAccess(v6, v9, 1, 0);
  v7 = *v6;
  v8 = v6[1];
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_178760(v7, v8);
}

- (void)dealloc
{
  BCFrontmostWindowTracker *v2;

  v2 = self;
  FrontmostWindowTracker.__deallocating_deinit();
}

- (void).cxx_destruct
{

  sub_178760(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BCFrontmostWindowTracker_onFrontmostChanged), *(_QWORD *)&self->appKitBundle[OBJC_IVAR___BCFrontmostWindowTracker_onFrontmostChanged]);
}

- (BCFrontmostWindowTracker)init
{
  BCFrontmostWindowTracker *result;

  result = (BCFrontmostWindowTracker *)_swift_stdlib_reportUnimplementedInitializer("BookCore.FrontmostWindowTracker", 31, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)handleSceneStateNotification:(id)a3
{
  sub_1786B0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_177A78);
}

- (void)handleMainWindowNotification:(id)a3
{
  sub_1786B0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_178368);
}

@end
