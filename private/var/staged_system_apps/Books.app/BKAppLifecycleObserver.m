@implementation BKAppLifecycleObserver

- (BKAppLifecycleObserver)initWithCoordinator:(id)a3 uiApplication:(id)a4 appKitBundle:(Class)a5
{
  if (a5)
    swift_getObjCClassMetadata(a5);
  swift_unknownObjectRetain(a3);
  return (BKAppLifecycleObserver *)sub_10001E9F8((uint64_t)a3, a4);
}

- (void)setOnDidBecomeFrontmost:(id)a3
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
    v5 = swift_allocObject(&unk_100914318, 24, 7);
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1005BB4F8;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___BKAppLifecycleObserver_onDidBecomeFrontmost);
  swift_beginAccess(v6, v9, 1, 0);
  v7 = *v6;
  v8 = v6[1];
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_10002AD00(v7, v8);
}

- (void)setOnWillEnterForeground:(id)a3
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
    v5 = swift_allocObject(&unk_100914458, 24, 7);
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1005BB4F8;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___BKAppLifecycleObserver_onWillEnterForeground);
  swift_beginAccess(v6, v9, 1, 0);
  v7 = *v6;
  v8 = v6[1];
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_10002AD00(v7, v8);
}

- (void)setOnDidBecomeActive:(id)a3
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
    v5 = swift_allocObject(&unk_100914368, 24, 7);
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1005BB4F8;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___BKAppLifecycleObserver_onDidBecomeActive);
  swift_beginAccess(v6, v9, 1, 0);
  v7 = *v6;
  v8 = v6[1];
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_10002AD00(v7, v8);
}

- (void)setOnWillResignFrontmost:(id)a3
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
    v5 = swift_allocObject(&unk_1009142C8, 24, 7);
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_10004DE2C;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___BKAppLifecycleObserver_onWillResignFrontmost);
  swift_beginAccess(v6, v9, 1, 0);
  v7 = *v6;
  v8 = v6[1];
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_10002AD00(v7, v8);
}

- (void)setOnWillResignActive:(id)a3
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
    v5 = swift_allocObject(&unk_1009143B8, 24, 7);
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1005BB4F8;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___BKAppLifecycleObserver_onWillResignActive);
  swift_beginAccess(v6, v9, 1, 0);
  v7 = *v6;
  v8 = v6[1];
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_10002AD00(v7, v8);
}

- (void)setOnDidEnterBackground:(id)a3
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
    v5 = swift_allocObject(&unk_100914408, 24, 7);
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1005BB4F8;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___BKAppLifecycleObserver_onDidEnterBackground);
  swift_beginAccess(v6, v9, 1, 0);
  v7 = *v6;
  v8 = v6[1];
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_10002AD00(v7, v8);
}

- (void)applicationWillEnterForeground:(id)a3
{
  sub_10002A93C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_100069C3C);
}

- (void)applicationDidBecomeActive:(id)a3
{
  sub_10002A93C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_100069C74);
}

- (BKAppLifecycleObserver)initWithCoordinator:(id)a3
{
  swift_unknownObjectRetain(a3);
  return (BKAppLifecycleObserver *)AppLifecycleObserver.init(coordinator:)((uint64_t)a3);
}

- (id)onWillEnterForeground
{
  return sub_1005BAF78((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKAppLifecycleObserver_onWillEnterForeground, (uint64_t)&unk_100914470);
}

- (id)onDidEnterBackground
{
  return sub_1005BAF78((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKAppLifecycleObserver_onDidEnterBackground, (uint64_t)&unk_100914420);
}

- (id)onWillResignActive
{
  return sub_1005BAF78((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKAppLifecycleObserver_onWillResignActive, (uint64_t)&unk_1009143D0);
}

- (id)onDidBecomeActive
{
  return sub_1005BAF78((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKAppLifecycleObserver_onDidBecomeActive, (uint64_t)&unk_100914380);
}

- (id)onDidBecomeFrontmost
{
  return sub_1005BAF78((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKAppLifecycleObserver_onDidBecomeFrontmost, (uint64_t)&unk_100914330);
}

- (id)onWillResignFrontmost
{
  return sub_1005BAF78((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKAppLifecycleObserver_onWillResignFrontmost, (uint64_t)&unk_1009142E0);
}

- (void)dealloc
{
  void *v3;
  BKAppLifecycleObserver *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self(NSNotificationCenter);
  v4 = self;
  v5 = objc_msgSend(v3, "defaultCenter");
  objc_msgSend(v5, "removeObserver:", v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for AppLifecycleObserver();
  -[BKAppLifecycleObserver dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKAppLifecycleObserver_coordinator));

  sub_10002AD00(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKAppLifecycleObserver_onWillEnterForeground), *(_QWORD *)&self->coordinator[OBJC_IVAR___BKAppLifecycleObserver_onWillEnterForeground]);
  sub_10002AD00(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKAppLifecycleObserver_onDidEnterBackground), *(_QWORD *)&self->coordinator[OBJC_IVAR___BKAppLifecycleObserver_onDidEnterBackground]);
  sub_10002AD00(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKAppLifecycleObserver_onWillResignActive), *(_QWORD *)&self->coordinator[OBJC_IVAR___BKAppLifecycleObserver_onWillResignActive]);
  sub_10002AD00(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKAppLifecycleObserver_onDidBecomeActive), *(_QWORD *)&self->coordinator[OBJC_IVAR___BKAppLifecycleObserver_onDidBecomeActive]);
  sub_10002AD00(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKAppLifecycleObserver_onDidBecomeFrontmost), *(_QWORD *)&self->coordinator[OBJC_IVAR___BKAppLifecycleObserver_onDidBecomeFrontmost]);
  sub_10002AD00(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKAppLifecycleObserver_onWillResignFrontmost), *(_QWORD *)&self->coordinator[OBJC_IVAR___BKAppLifecycleObserver_onWillResignFrontmost]);
}

- (void)applicationDidEnterBackground:(id)a3
{
  sub_10002A93C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_1005BB3C4);
}

- (void)applicationWillResignActive:(id)a3
{
  sub_10002A93C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_1005BB3FC);
}

- (BKAppLifecycleObserver)init
{
  BKAppLifecycleObserver *result;

  result = (BKAppLifecycleObserver *)_swift_stdlib_reportUnimplementedInitializer("Books.AppLifecycleObserver", 26, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
