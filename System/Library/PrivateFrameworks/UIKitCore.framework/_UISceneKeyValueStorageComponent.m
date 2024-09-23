@implementation _UISceneKeyValueStorageComponent

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _TtC5UIKit32_UISceneKeyValueStorageComponent *v9;
  id v10;
  _QWORD v11[6];

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = self;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_1857121F4;
  *(_QWORD *)(v7 + 24) = v6;
  v11[4] = sub_185281934;
  v11[5] = v7;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = sub_1857116D8;
  v11[3] = &block_descriptor_50;
  v8 = _Block_copy(v11);
  v9 = self;
  swift_unknownObjectRetain();
  v10 = a4;
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_inspectStorage_, v8);
  _Block_release(v8);
  LOBYTE(v8) = swift_isEscapingClosureAtFileLocation();
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  if ((v8 & 1) != 0)
    __break(1u);
}

- (void)scene:(id)a3 didUpdateClientSettings:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _TtC5UIKit32_UISceneKeyValueStorageComponent *v9;
  id v10;
  _QWORD v11[6];

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = self;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_18571219C;
  *(_QWORD *)(v7 + 24) = v6;
  v11[4] = sub_185228348;
  v11[5] = v7;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = sub_1857116D8;
  v11[3] = &block_descriptor_34_2;
  v8 = _Block_copy(v11);
  v9 = self;
  swift_unknownObjectRetain();
  v10 = a4;
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_inspectStorage_, v8);
  _Block_release(v8);
  LOBYTE(v8) = swift_isEscapingClosureAtFileLocation();
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  if ((v8 & 1) != 0)
    __break(1u);
}

- (_TtC5UIKit32_UISceneKeyValueStorageComponent)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC5UIKit32_UISceneKeyValueStorageComponent____lazy_storage___controller) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC5UIKit32_UISceneKeyValueStorageComponent____lazy_storage___hostInterface) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC5UIKit32_UISceneKeyValueStorageComponent____lazy_storage___clientInterface) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _UISceneKeyValueStorageComponent();
  return -[_UISceneKeyValueStorageComponent init](&v3, sel_init);
}

- (_TtC5UIKit32_UISceneKeyValueStorageComponent)initWithScene:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC5UIKit32_UISceneKeyValueStorageComponent____lazy_storage___controller) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC5UIKit32_UISceneKeyValueStorageComponent____lazy_storage___hostInterface) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC5UIKit32_UISceneKeyValueStorageComponent____lazy_storage___clientInterface) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for _UISceneKeyValueStorageComponent();
  return -[FBSSceneComponent initWithScene:](&v5, sel_initWithScene_, a3);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
}

@end
