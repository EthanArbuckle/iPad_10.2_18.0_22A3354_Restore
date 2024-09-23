@implementation _STKTextInputObjCStoreFacade

- (_STKTextInputObjCStoreFacade)init
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _STKTextInputObjCStoreFacade *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  objc_class *v11;
  objc_super v13;

  v3 = type metadata accessor for StickerStore.PersistenceType();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_247A1ADAC();
  v7 = sub_247A1AB9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5, 1, 3, v7);
  v8 = type metadata accessor for StickerStore();
  swift_allocObject();
  v9 = StickerStore.init(persistence:)((uint64_t)v5);
  v10 = (uint64_t *)((char *)v6 + OBJC_IVAR____STKTextInputObjCStoreFacade_store);
  v10[3] = v8;
  v10[4] = (uint64_t)&protocol witness table for StickerStore;
  *v10 = v9;

  v11 = (objc_class *)type metadata accessor for _STKTextInputObjCStoreFacade(0);
  v13.receiver = v6;
  v13.super_class = v11;
  return -[_STKTextInputObjCStoreFacade init](&v13, sel_init);
}

- (id)stickersWithIdentifiers:(id)a3 roles:(id)a4 error:(id *)a5
{
  return sub_2479D2C0C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t))sub_2479D1D14, (void (*)(_QWORD))type metadata accessor for _STKSticker);
}

- (id)representationsForStickersWithIdentifiers:(id)a3 roles:(id)a4 error:(id *)a5
{
  return sub_2479D2C0C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t))sub_2479D29FC, (void (*)(_QWORD))type metadata accessor for _STKStickerRepresentation);
}

- (BOOL)touchStickerWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  _STKTextInputObjCStoreFacade *v12;
  uint64_t v14;

  v5 = sub_247A1AC8C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247A1AC68();
  v9 = *(_QWORD *)&self->store[OBJC_IVAR____STKTextInputObjCStoreFacade_store + 16];
  v10 = *(_QWORD *)&self->store[OBJC_IVAR____STKTextInputObjCStoreFacade_store + 24];
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR____STKTextInputObjCStoreFacade_store), v9);
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 72);
  v12 = self;
  v11(v8, v9, v10);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return 1;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____STKTextInputObjCStoreFacade_store);
  v3 = (char *)self + OBJC_IVAR____STKTextInputObjCStoreFacade_logger;
  v4 = sub_247A1ADB8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
