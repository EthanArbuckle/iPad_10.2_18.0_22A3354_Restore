@implementation BridgedContext

- (void)useObject:(id)a3 forClass:(Class)a4
{
  _TtC13TeaFoundation14BridgedContext *v5;
  uint64_t ObjCClassMetadata;
  _QWORD v7[4];

  swift_unknownObjectRetain();
  v5 = self;
  sub_190BE5AF8();
  swift_unknownObjectRelease();
  ObjCClassMetadata = swift_getObjCClassMetadata();
  sub_190B3F884(v7, ObjCClassMetadata);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

- (void)useObject:(id)a3 forClass:(Class)a4 name:(id)a5
{
  id v7;
  _TtC13TeaFoundation14BridgedContext *v8;
  uint64_t ObjCClassMetadata;
  _QWORD v10[4];

  swift_unknownObjectRetain();
  v7 = a5;
  v8 = self;
  sub_190BE5AF8();
  swift_unknownObjectRelease();
  ObjCClassMetadata = swift_getObjCClassMetadata();
  sub_190BE5000();

  sub_190B3FA88(v10, ObjCClassMetadata);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
}

- (void)useObject:(id)a3 forProtocol:(id)a4
{
  id v6;
  _TtC13TeaFoundation14BridgedContext *v7;
  _QWORD v8[4];

  swift_unknownObjectRetain();
  v6 = a4;
  v7 = self;
  sub_190BE5AF8();
  swift_unknownObjectRelease();
  sub_190B3FBCC(v8, v6);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

- (void)useObject:(id)a3 forProtocol:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  _TtC13TeaFoundation14BridgedContext *v10;
  _QWORD v11[4];

  swift_unknownObjectRetain();
  v8 = a4;
  v9 = a5;
  v10 = self;
  sub_190BE5AF8();
  swift_unknownObjectRelease();
  sub_190BE5000();

  sub_190B3FCDC(v11, v8);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
}

- (_TtC13TeaFoundation14BridgedContext)init
{
  sub_190B3FE20();
}

- (void).cxx_destruct
{
  swift_release();
}

@end
