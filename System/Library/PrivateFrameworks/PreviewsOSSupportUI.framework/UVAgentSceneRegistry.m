@implementation UVAgentSceneRegistry

+ (void)deliverScene:(id)a3 forIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjCClassMetadata;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C14908);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_22C6835E0();
  v10 = v9;
  ObjCClassMetadata = swift_getObjCClassMetadata();
  v12 = sub_22C683694();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v7, 1, 1, v12);
  sub_22C68367C();
  v13 = a3;
  swift_bridgeObjectRetain();
  v14 = sub_22C683670();
  v15 = (_QWORD *)swift_allocObject();
  v16 = MEMORY[0x24BEE6930];
  v15[2] = v14;
  v15[3] = v16;
  v15[4] = ObjCClassMetadata;
  v15[5] = v13;
  v15[6] = v8;
  v15[7] = v10;
  sub_22C680654((uint64_t)v7, (uint64_t)&unk_255C152F8, (uint64_t)v15);
  swift_release();
  swift_bridgeObjectRelease();

}

- (_TtC19PreviewsOSSupportUI20UVAgentSceneRegistry)init
{
  objc_class *ObjectType;
  objc_class *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (objc_class *)MEMORY[0x24BEE4B00];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19PreviewsOSSupportUI20UVAgentSceneRegistry_scenes) = (Class)MEMORY[0x24BEE4B00];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19PreviewsOSSupportUI20UVAgentSceneRegistry_sceneHandlers) = v4;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[UVAgentSceneRegistry init](&v6, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
