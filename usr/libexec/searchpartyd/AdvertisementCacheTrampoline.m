@implementation AdvertisementCacheTrampoline

- (void)saveBeaconPayloads:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  _TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline *v16;
  _BYTE v17[24];

  v6 = _Block_copy(a4);
  v7 = sub_10000F4A0(0, &qword_1010F0E90, SPBeaconPayload_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v9 = swift_allocObject(&unk_10105A828, 24, 7);
  *(_QWORD *)(v9 + 16) = v6;
  v10 = (char *)self
      + OBJC_IVAR____TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline_implementation;
  swift_beginAccess((char *)self+ OBJC_IVAR____TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline_implementation, v17, 0, 0);
  v11 = *((_QWORD *)v10 + 4);
  type metadata accessor for Transaction(0);
  v12 = swift_allocObject(&unk_10105A850, 80, 7);
  *(_QWORD *)(v12 + 16) = v8;
  v13 = *(_OWORD *)v10;
  v14 = *((_OWORD *)v10 + 1);
  *(_OWORD *)(v12 + 24) = *(_OWORD *)v10;
  *(_OWORD *)(v12 + 40) = v14;
  *(_QWORD *)(v12 + 56) = v11;
  *(_QWORD *)(v12 + 64) = sub_10001D1EC;
  *(_QWORD *)(v12 + 72) = v9;
  v15 = v13;
  swift_unknownObjectRetain_n(v13, 2);
  v16 = self;
  swift_bridgeObjectRetain(v8);
  swift_retain();
  static Transaction.asyncTask(name:block:)("SaveObservedAdvertisment", 24, 2, &unk_1010F0EF8, v12);

  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease(v15);
  swift_release();
}

- (void)markFilesProcessed:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t ObjectType;
  void (*v14)(uint64_t, uint64_t (*)(), uint64_t, uint64_t, uint64_t);
  _TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline *v15;
  _BYTE v16[24];

  v6 = _Block_copy(a4);
  v7 = type metadata accessor for URL(0);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v9 = swift_allocObject(&unk_10105A800, 24, 7);
  *(_QWORD *)(v9 + 16) = v6;
  v10 = (uint64_t *)((char *)self
                  + OBJC_IVAR____TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline_implementation);
  swift_beginAccess((char *)self+ OBJC_IVAR____TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline_implementation, v16, 0, 0);
  v11 = *v10;
  v12 = v10[3];
  ObjectType = swift_getObjectType(v11);
  v14 = *(void (**)(uint64_t, uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v12 + 32);
  v15 = self;
  swift_unknownObjectRetain(v11);
  v14(v8, sub_10001D1EC, v9, ObjectType, v12);

  swift_bridgeObjectRelease(v8);
  swift_release(v9);
  swift_unknownObjectRelease(v11);
}

- (void)beaconPayloadsForSearchCriteria:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t, void (*)(uint64_t, char), uint64_t, uint64_t, uint64_t);
  _TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline *v20;
  _BYTE v21[24];

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_10105A7B0, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline_implementation);
  swift_beginAccess((char *)self+ OBJC_IVAR____TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline_implementation, v21, 0, 0);
  v9 = *v8;
  v10 = v8[3];
  ObjectType = swift_getObjectType(*v8);
  v12 = a3;
  v20 = self;
  swift_unknownObjectRetain(v9);
  v13 = sub_100262110();
  v15 = v14;
  v17 = v16;
  v18 = swift_allocObject(&unk_10105A7D8, 32, 7);
  *(_QWORD *)(v18 + 16) = sub_10015AAF4;
  *(_QWORD *)(v18 + 24) = v7;
  v19 = *(void (**)(uint64_t, uint64_t, uint64_t, void (*)(uint64_t, char), uint64_t, uint64_t, uint64_t))(v10 + 24);
  swift_bridgeObjectRetain(v15);
  swift_retain();
  v19(v13, v15, v17, sub_10015A754, v18, ObjectType, v10);

  swift_release();
  swift_unknownObjectRelease(v9);
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)beaconAdvertisementAtFileURL:(id)a3 beaconIdentifier:(id)a4 scanDate:(id)a5 completion:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  void *v25;
  char *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  void (*v43)(char *, char *, uint64_t);
  uint64_t v44;
  uint64_t v45;
  _TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  id v51;
  uint64_t v52;
  _QWORD *v53;
  _TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline *v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  char v65[32];

  v53 = a5;
  v54 = self;
  v51 = a4;
  v9 = sub_10001A9A8(&qword_1010F46C0);
  __chkstk_darwin(v9);
  v62 = (uint64_t)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = type metadata accessor for Date(0);
  v11 = *(_QWORD *)(*(_QWORD *)(v64 - 8) + 64);
  v58 = *(_QWORD *)(v64 - 8);
  v59 = v11;
  v12 = __chkstk_darwin(v64);
  v63 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v15 = (char *)&v47 - v14;
  v55 = type metadata accessor for UUID(0);
  v52 = *(_QWORD *)(v55 - 8);
  v16 = *(_QWORD *)(v52 + 64);
  v17 = __chkstk_darwin(v55);
  v61 = (char *)&v47 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v19 = (char *)&v47 - v18;
  v20 = type metadata accessor for URL(0);
  v60 = *(_QWORD *)(v20 - 8);
  v48 = v20;
  v21 = *(_QWORD *)(v60 + 64);
  v22 = __chkstk_darwin(v20);
  v49 = (char *)&v47 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  v24 = (char *)&v47 - v23;
  v25 = _Block_copy(a6);
  v57 = v24;
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v56 = v19;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(v51);
  v26 = v15;
  v50 = v15;
  static Date._unconditionallyBridgeFromObjectiveC(_:)(v53);
  v53 = (_QWORD *)swift_allocObject(&unk_10105A760, 24, 7);
  v53[2] = v25;
  v27 = (uint64_t *)((char *)self
                  + OBJC_IVAR____TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline_implementation);
  swift_beginAccess((char *)self+ OBJC_IVAR____TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline_implementation, v65, 0, 0);
  v28 = *v27;
  v29 = type metadata accessor for TaskPriority(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v62, 1, 1, v29);
  v30 = v60;
  (*(void (**)(char *, char *, uint64_t))(v60 + 16))((char *)&v47 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0), v24, v20);
  v31 = v52;
  v32 = v19;
  v33 = v55;
  (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v61, v32, v55);
  v34 = v58;
  (*(void (**)(char *, char *, uint64_t))(v58 + 16))(v63, v26, v64);
  v35 = *(unsigned __int8 *)(v30 + 80);
  v36 = v30;
  v37 = (v35 + 56) & ~v35;
  v38 = *(unsigned __int8 *)(v31 + 80);
  v39 = (v21 + v38 + v37) & ~v38;
  v40 = *(unsigned __int8 *)(v34 + 80);
  v41 = (v16 + v40 + v39) & ~v40;
  v42 = (char *)swift_allocObject(&unk_10105A788, v41 + v59, v35 | v38 | v40 | 7);
  *((_QWORD *)v42 + 2) = 0;
  *((_QWORD *)v42 + 3) = 0;
  *((_QWORD *)v42 + 4) = v28;
  *((_QWORD *)v42 + 5) = sub_10015A53C;
  *((_QWORD *)v42 + 6) = v53;
  v43 = *(void (**)(char *, char *, uint64_t))(v36 + 32);
  v44 = v48;
  v43(&v42[v37], v49, v48);
  (*(void (**)(char *, char *, uint64_t))(v31 + 32))(&v42[v39], v61, v33);
  v45 = v64;
  (*(void (**)(char *, char *, uint64_t))(v34 + 32))(&v42[v41], v63, v64);
  swift_unknownObjectRetain_n(v28, 2);
  v46 = v54;
  swift_retain();
  sub_100691AC0(v62, (uint64_t)&unk_1010F0ED0, (uint64_t)v42);
  swift_release();
  swift_unknownObjectRelease(v28);
  swift_release();

  (*(void (**)(char *, uint64_t))(v34 + 8))(v50, v45);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v56, v33);
  (*(void (**)(char *, uint64_t))(v60 + 8))(v57, v44);
}

- (void)saveAdvertisements:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline *v9;

  v6 = _Block_copy(a4);
  v7 = sub_10000F4A0(0, &qword_1010F0E78, SPAdvertisement_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  _Block_copy(v6);
  v9 = self;
  sub_100159654(v8, (uint64_t)v9, v6);
  _Block_release(v6);
  _Block_release(v6);
  swift_bridgeObjectRelease();

}

- (void)markAdvertisementsProcessed:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline *v9;

  v6 = _Block_copy(a4);
  v7 = type metadata accessor for UUID(0);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  _Block_copy(v6);
  v9 = self;
  sub_100159B58(v8, (uint64_t)v9, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
  swift_bridgeObjectRelease();

}

- (void)advertisementsForSearchCriteria:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_10105A710, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_10015A16C((uint64_t)sub_10001D390, v7);

  swift_release();
}

- (void)advertisementCacheSimulation:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(void *, _QWORD);
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  _TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline *v12;
  uint64_t v13;
  __int128 v14;
  _BYTE v15[24];

  v4 = a3;
  v6 = (void (**)(void *, _QWORD))_Block_copy(a4);
  v7 = (char *)self
     + OBJC_IVAR____TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline_implementation;
  swift_beginAccess((char *)self+ OBJC_IVAR____TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline_implementation, v15, 33, 0);
  v8 = *(_QWORD *)v7;
  v9 = *((_QWORD *)v7 + 1);
  v10 = *((_QWORD *)v7 + 4);
  ObjectType = swift_getObjectType(*(_QWORD *)v7);
  v12 = self;
  swift_unknownObjectRetain(v8);
  v14 = *((_OWORD *)v7 + 1);
  (*(void (**)(_BOOL8, uint64_t))(v14 + 16))(v4, ObjectType);
  v13 = *(_QWORD *)v7;
  *(_QWORD *)v7 = v8;
  *((_QWORD *)v7 + 1) = v9;
  *((_OWORD *)v7 + 1) = v14;
  *((_QWORD *)v7 + 4) = v10;
  swift_endAccess(v15);
  swift_unknownObjectRelease(v13);
  v6[2](v6, 0);
  _Block_release(v6);

}

- (void)clearCacheWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_10105A698, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_10015A2F4((uint64_t)sub_10001D1F0, v5);

  swift_release();
}

- (_TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline)init
{
  _TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline *result;

  result = (_TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline *)_swift_stdlib_reportUnimplementedInitializer("searchpartyd.AdvertisementCacheTrampoline", 41, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline_implementation));
}

@end
