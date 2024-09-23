@implementation SDAirDropMoveToAppShareSheet

- (void)showShareSheetWith:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _TtC16DaemoniOSLibrary28SDAirDropMoveToAppShareSheet *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100008384(&qword_1007B68A0);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = type metadata accessor for URL(0);
  v12 = (const char *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v11);
  v13 = swift_allocObject(&unk_10072E470, 24, 7);
  *(_QWORD *)(v13 + 16) = v10;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v9, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_10072E498, 64, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = v12;
  v15[6] = sub_100527F74;
  v15[7] = v13;
  v16 = self;
  swift_bridgeObjectRetain(v12);
  swift_retain();
  v17 = sub_100252EC0((uint64_t)v9, (uint64_t)&unk_1007C5438, (uint64_t)v15);

  swift_bridgeObjectRelease(v12);
  swift_release(v13);
  swift_release(v17);
}

- (_TtC16DaemoniOSLibrary28SDAirDropMoveToAppShareSheet)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[SDAirDropMoveToAppShareSheet init](&v3, "init");
}

@end
