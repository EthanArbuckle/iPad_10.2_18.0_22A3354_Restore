@implementation _STKMessagesObjCStoreFacade

- (_STKMessagesObjCStoreFacade)init
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _STKMessagesObjCStoreFacade *v8;
  uint64_t v9;
  uint64_t *v10;
  objc_class *v11;
  objc_super v13;

  v3 = type metadata accessor for StickerStore.PersistenceType();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_247A1AB9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 3, v6);
  v7 = type metadata accessor for StickerStore();
  swift_allocObject();
  v8 = self;
  v9 = StickerStore.init(persistence:)((uint64_t)v5);
  v10 = (uint64_t *)((char *)v8 + OBJC_IVAR____STKMessagesObjCStoreFacade_store);
  v10[3] = v7;
  v10[4] = (uint64_t)&protocol witness table for StickerStore;
  *v10 = v9;

  v11 = (objc_class *)type metadata accessor for _STKMessagesObjCStoreFacade();
  v13.receiver = v8;
  v13.super_class = v11;
  return -[_STKMessagesObjCStoreFacade init](&v13, sel_init);
}

- (BOOL)donateStickerToRecentsWithIdentifier:(id)a3 representations:(id)a4 stickerEffectEnum:(int64_t)a5 externalURI:(id)a6 name:(id)a7 accessibilityName:(id)a8 metadata:(id)a9 attributionInfo:(id)a10 error:(id *)a11
{
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  _STKMessagesObjCStoreFacade *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  void *v39;
  uint64_t v40;

  v35 = sub_247A1AEE4();
  v16 = v15;
  type metadata accessor for _STKStickerUIStickerRepresentation();
  v17 = sub_247A1B034();
  if (a6)
  {
    v18 = sub_247A1AEE4();
    v38 = v19;
  }
  else
  {
    v18 = 0;
    v38 = 0;
  }
  v40 = v16;
  v34 = v18;
  if (a7)
  {
    v20 = sub_247A1AEE4();
    v36 = v21;
    v22 = a9;
    v23 = a10;
    if (a8)
    {
LABEL_6:
      v24 = sub_247A1AEE4();
      a8 = v25;
      goto LABEL_9;
    }
  }
  else
  {
    v20 = 0;
    v36 = 0;
    v22 = a9;
    v23 = a10;
    if (a8)
      goto LABEL_6;
  }
  v24 = 0;
LABEL_9:
  v26 = v23;
  v27 = self;
  v39 = v26;
  if (v22)
  {
    v28 = v20;
    v29 = v22;
    v30 = sub_247A1ABCC();
    v32 = v31;

    v20 = v28;
  }
  else
  {
    v30 = 0;
    v32 = 0xF000000000000000;
  }
  sub_2479EC5C4(v35, v40, v17, a5, v34, v38, v20, v36, v24, (uint64_t)a8, v30, v32, (char *)v23);

  sub_2479D96E0(v30, v32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____STKMessagesObjCStoreFacade_store);
}

@end
