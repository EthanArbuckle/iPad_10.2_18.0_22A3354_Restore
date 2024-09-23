@implementation ComplicationsSnapshotSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC11PosterBoard34ComplicationsSnapshotSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC11PosterBoard34ComplicationsSnapshotSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11PosterBoard34ComplicationsSnapshotSceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC11PosterBoard34ComplicationsSnapshotSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1CBB372F4(v8);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC11PosterBoard34ComplicationsSnapshotSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1CBB374B8();

}

- (_TtC11PosterBoard34ComplicationsSnapshotSceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11PosterBoard34ComplicationsSnapshotSceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ComplicationsSnapshotSceneDelegate();
  return -[ComplicationsSnapshotSceneDelegate init](&v3, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34ComplicationsSnapshotSceneDelegate_window));
}

@end
