@implementation SESKeyDesignationStorageCoordinator

+ (id)getAndReturnError:(id *)a3
{
  return sub_1000E7A80();
}

- (id)findKeyWithKeyIdentifier:(id)a3
{
  id v5;
  _TtC10seserviced35SESKeyDesignationStorageCoordinator *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BYTE v15[24];

  v5 = a3;
  v6 = self;
  v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;

  v10 = (uint64_t *)((char *)v6 + OBJC_IVAR____TtC10seserviced35SESKeyDesignationStorageCoordinator_keys);
  swift_beginAccess((char *)v6 + OBJC_IVAR____TtC10seserviced35SESKeyDesignationStorageCoordinator_keys, v15, 0, 0);
  v11 = *v10;
  sub_100063C8C(v7, v9);
  v12 = swift_bridgeObjectRetain(v11);
  v13 = (void *)sub_1000E74C4(v12, v7);
  sub_100063CD0(v7, v9);
  swift_bridgeObjectRelease(v11);
  sub_100063CD0(v7, v9);

  return v13;
}

- (void)designateKeyWithAid:(id)a3 slotNumber:(int64_t)a4 keyIdentifier:(id)a5 assetACL:(id)a6 assetACLAttestation:(id)a7 operationApprovalVersion:(int64_t)a8 designation:(int64_t)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  _TtC10seserviced35SESKeyDesignationStorageCoordinator *v32;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v32 = self;
  v18 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v20 = v19;

  v21 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v15);
  v23 = v22;

  v24 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v16);
  v26 = v25;

  v27 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v17);
  v29 = v28;

  sub_1000E53FC(v18, v20, a4, v21, v23, v24, v26, v27, v29, a8, (void *)a9);
  sub_100063CD0(v27, v29);
  sub_100063CD0(v24, v26);
  sub_100063CD0(v21, v23);
  sub_100063CD0(v18, v20);

}

- (void)removeDesignationWithKeyIdentifier:(id)a3
{
  id v5;
  _TtC10seserviced35SESKeyDesignationStorageCoordinator *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[24];

  v5 = a3;
  v6 = self;
  v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;

  v10 = (uint64_t *)((char *)v6 + OBJC_IVAR____TtC10seserviced35SESKeyDesignationStorageCoordinator_keys);
  swift_beginAccess((char *)v6 + OBJC_IVAR____TtC10seserviced35SESKeyDesignationStorageCoordinator_keys, v15, 33, 0);
  sub_100063C8C(v7, v9);
  v11 = sub_1000E811C(v10);
  sub_100063CD0(v7, v9);
  v12 = *v10;
  if ((unint64_t)*v10 >> 62)
  {
    if (v12 < 0)
      v14 = *v10;
    else
      v14 = v12 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(*v10);
    v13 = _CocoaArrayWrapper.endIndex.getter(v14);
    swift_bridgeObjectRelease(v12);
    if (v13 >= v11)
      goto LABEL_3;
  }
  else
  {
    v13 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v13 >= v11)
    {
LABEL_3:
      sub_1001F6C58(v11, v13);
      swift_endAccess(v15);
      *((_BYTE *)&v6->super.isa + OBJC_IVAR____TtC10seserviced35SESKeyDesignationStorageCoordinator_mutated) = 1;
      sub_100063CD0(v7, v9);

      return;
    }
  }
  __break(1u);
}

- (void)removeWithDesignation:(int64_t)a3
{
  _TtC10seserviced35SESKeyDesignationStorageCoordinator *v4;

  v4 = self;
  sub_1000E6E68((id)a3);

}

- (void)commit
{
  uint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  _TtC10seserviced35SESKeyDesignationStorageCoordinator *v6;
  Class isa;
  _BYTE v8[24];

  v2 = OBJC_IVAR____TtC10seserviced35SESKeyDesignationStorageCoordinator_mutated;
  if (*((_BYTE *)&self->super.isa + OBJC_IVAR____TtC10seserviced35SESKeyDesignationStorageCoordinator_mutated) == 1)
  {
    v4 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10seserviced35SESKeyDesignationStorageCoordinator_keys);
    swift_beginAccess((char *)self + OBJC_IVAR____TtC10seserviced35SESKeyDesignationStorageCoordinator_keys, v8, 0, 0);
    v5 = *v4;
    sub_1000E7B88();
    v6 = self;
    swift_bridgeObjectRetain(v5);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v5);
    SESDesignatedKeyCommit(isa);

    *((_BYTE *)&self->super.isa + v2) = 0;
  }
}

- (_TtC10seserviced35SESKeyDesignationStorageCoordinator)init
{
  _TtC10seserviced35SESKeyDesignationStorageCoordinator *result;

  result = (_TtC10seserviced35SESKeyDesignationStorageCoordinator *)_swift_stdlib_reportUnimplementedInitializer("seserviced.SESKeyDesignationStorageCoordinator", 46, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10seserviced35SESKeyDesignationStorageCoordinator_keys));
}

@end
