@implementation JSAHotReloadController

+ (JSAHotReloadController)sharedController
{
  if (qword_B8080 != -1)
    swift_once(&qword_B8080, sub_29A60);
  return (JSAHotReloadController *)(id)qword_B8088;
}

- (BOOL)isHotReloading
{
  uint64_t v2;
  _QWORD *v3;
  os_unfair_lock_s *v4;
  JSAHotReloadController *v5;
  BOOL v7;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___JSAHotReloadController_hotReloadCount);
  v3 = (_QWORD *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 24);
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_29BF0(v3, &v7);
  os_unfair_lock_unlock(v4);
  LOBYTE(v3) = v7;

  return (char)v3;
}

- (JSAHotReloadController)init
{
  return (JSAHotReloadController *)HotReloadController.init()();
}

- (void)startWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  JSAHotReloadController *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject(&unk_9F958, 24, 7);
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_2E8F8;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_29FB4((uint64_t)v7, v6);
  sub_2D4DC((uint64_t)v7, v6);

}

- (void)stopWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  JSAHotReloadController *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject(&unk_9F930, 24, 7);
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_2D510;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_2A314((uint64_t)v7, v6);
  sub_2D4DC((uint64_t)v7, v6);

}

- (void)subscribe:(id)a3
{
  sub_2AE88(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_2A914);
}

- (void)unsubscribe:(id)a3
{
  sub_2AE88(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_2AC60);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___JSAHotReloadController_notificationObserver));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___JSAHotReloadController_hotReloadCount));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___JSAHotReloadController_subscribers));
}

@end
