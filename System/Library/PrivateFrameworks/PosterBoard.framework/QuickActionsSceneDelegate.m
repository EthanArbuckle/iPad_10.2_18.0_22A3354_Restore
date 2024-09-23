@implementation QuickActionsSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC11PosterBoard25QuickActionsSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11PosterBoard25QuickActionsSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11PosterBoard25QuickActionsSceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC11PosterBoard25QuickActionsSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1CBB17374(v8);

}

- (void)sceneDidDisconnect:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  _TtC11PosterBoard25QuickActionsSceneDelegate *v9;

  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11PosterBoard25QuickActionsSceneDelegate_window);
  if (v3)
  {
    v5 = a3;
    v9 = self;
    v6 = objc_msgSend(v3, sel_rootViewController);
    if (v6)
    {
      v7 = v6;
      v8 = (void *)swift_dynamicCastObjCProtocolConditional();
      if (v8)
        objc_msgSend(v8, sel_invalidate);

    }
    else
    {

    }
  }
}

- (_TtC11PosterBoard25QuickActionsSceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11PosterBoard25QuickActionsSceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for QuickActionsSceneDelegate();
  return -[QuickActionsSceneDelegate init](&v3, sel_init);
}

- (void).cxx_destruct
{

}

@end
