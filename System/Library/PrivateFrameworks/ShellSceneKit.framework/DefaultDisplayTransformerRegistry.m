@implementation DefaultDisplayTransformerRegistry

- (id)addTransformer:(id)a3 withIdentifier:(id)a4
{
  _TtC13ShellSceneKitP33_EE17DF9A05593657B985954F049B576633DefaultDisplayTransformerRegistry *v6;
  id v7;

  sub_246017D04();
  swift_unknownObjectRetain();
  v6 = self;
  v7 = sub_246002984((uint64_t)a3);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return v7;
}

- (id)transformDisplayConfiguration:(id)a3
{
  id v4;
  _TtC13ShellSceneKitP33_EE17DF9A05593657B985954F049B576633DefaultDisplayTransformerRegistry *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_246002734(v4);

  sub_245FFC180(0, (unint64_t *)&unk_25441BE90);
  sub_2460035BC();
  v6 = (void *)sub_246017E60();
  swift_bridgeObjectRelease();
  return v6;
}

- (_TtC13ShellSceneKitP33_EE17DF9A05593657B985954F049B576633DefaultDisplayTransformerRegistry)init
{
  objc_class *ObjectType;
  uint64_t v4;
  void *v5;
  _TtC13ShellSceneKitP33_EE17DF9A05593657B985954F049B576633DefaultDisplayTransformerRegistry *v6;
  id v7;
  uint64_t v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR____TtC13ShellSceneKitP33_EE17DF9A05593657B985954F049B576633DefaultDisplayTransformerRegistry_lockState;
  v5 = (void *)objc_opt_self();
  v6 = self;
  v7 = objc_msgSend(v5, sel_hashTableWithOptions_, 512);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25441BEB0);
  v8 = swift_allocObject();
  *(_DWORD *)(v8 + 24) = 0;
  *(_QWORD *)(v8 + 16) = v7;
  *(Class *)((char *)&self->super.isa + v4) = (Class)v8;

  v10.receiver = v6;
  v10.super_class = ObjectType;
  return -[DefaultDisplayTransformerRegistry init](&v10, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
