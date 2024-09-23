@implementation SceneDelegate

- (_TtC7Weather13SceneDelegate)init
{
  return (_TtC7Weather13SceneDelegate *)sub_100148004();
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC7Weather13SceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_100034288(v8, (uint64_t)v11, v10);

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  _TtC7Weather13SceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100148320((uint64_t)v5, "Scene will enter foreground");

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  _TtC7Weather13SceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100148464();

}

- (void)sceneWillResignActive:(id)a3
{
  id v4;
  _TtC7Weather13SceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100148464();

}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6;
  id v7;
  _TtC7Weather13SceneDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1002CA0FC((uint64_t)v8, v7);

}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  objc_class *v10;
  UIApplicationShortcutItem v11;
  _TtC7Weather13SceneDelegate *v12;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = (objc_class *)a4;
  v12 = self;
  v11.super.isa = v10;
  sub_1002CA278((uint64_t)v9, v11, (uint64_t)v12, (void (**)(_QWORD, _QWORD, __n128))v8);
  _Block_release(v8);

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  _TtC7Weather13SceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100148320((uint64_t)v5, "Scene did enter background");

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC7Weather13SceneDelegate____lazy_storage___sessionObserver));
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC7Weather13SceneDelegate____lazy_storage___shortcutItemHandlerManager));
  sub_100021AA4((uint64_t)self + OBJC_IVAR____TtC7Weather13SceneDelegate____lazy_storage___continueUserActivityHandlerManager, &qword_100BD44E8);
  sub_100021AA4((uint64_t)self + OBJC_IVAR____TtC7Weather13SceneDelegate____lazy_storage___stateManager, &qword_100BD44D0);
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC7Weather13SceneDelegate____lazy_storage___windowFrameMonitor));
}

@end
