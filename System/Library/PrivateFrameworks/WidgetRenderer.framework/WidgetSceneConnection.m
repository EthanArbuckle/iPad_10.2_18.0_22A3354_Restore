@implementation WidgetSceneConnection

- (NSString)description
{
  _TtC14WidgetRenderer21WidgetSceneConnection *v2;
  void *v3;

  v2 = self;
  sub_24A51EE34();

  v3 = (void *)sub_24A559310();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)dealloc
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[WidgetSceneConnection dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14WidgetRenderer21WidgetSceneConnection_sceneSettingsDiffInspector));

  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14WidgetRenderer21WidgetSceneConnection_rootViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14WidgetRenderer21WidgetSceneConnection_debugOverlayViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14WidgetRenderer21WidgetSceneConnection_contentViewController));
  sub_24A5234E8((uint64_t)self + OBJC_IVAR____TtC14WidgetRenderer21WidgetSceneConnection_delegate);
  swift_release();
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _TtC14WidgetRenderer21WidgetSceneConnection *v18;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = self;
  sub_24A523158(a4, a5, a6, a7);

}

- (_TtC14WidgetRenderer21WidgetSceneConnection)init
{
  _TtC14WidgetRenderer21WidgetSceneConnection *result;

  result = (_TtC14WidgetRenderer21WidgetSceneConnection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
