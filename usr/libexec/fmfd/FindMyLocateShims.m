@implementation FindMyLocateShims

+ (_TtC4fmfd17FindMyLocateShims)shared
{
  if (qword_1000B38B0 != -1)
    swift_once(&qword_1000B38B0, sub_100054638);
  return (_TtC4fmfd17FindMyLocateShims *)(id)qword_1000B3FE0;
}

- (_TtC4fmfd17FindMyLocateShims)init
{
  return (_TtC4fmfd17FindMyLocateShims *)sub_100054724();
}

- (void)addFence:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  _TtC4fmfd17FindMyLocateShims *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100056A5C(&qword_1000B3300);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject(&unk_10009B528, 24, 7);
  *(_QWORD *)(v11 + 16) = v10;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10009B550, 64, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = sub_100061D58;
  v13[7] = v11;
  v14 = a3;
  v15 = self;
  v16 = v14;
  swift_retain(v11);
  v17 = sub_100054D80((uint64_t)v9, (uint64_t)&unk_1000B33F0, (uint64_t)v13);
  swift_release(v17);
  swift_release(v11);

}

- (void)deleteFence:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  _TtC4fmfd17FindMyLocateShims *v15;
  id v16;
  _TtC4fmfd17FindMyLocateShims *v17;
  uint64_t v18;
  uint64_t v19;

  v7 = sub_100056A5C(&qword_1000B3300);
  __chkstk_darwin(v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject(&unk_10009B4D8, 24, 7);
  *(_QWORD *)(v11 + 16) = v10;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10009B500, 64, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = a3;
  v13[5] = sub_100063118;
  v13[6] = v11;
  v13[7] = self;
  v14 = a3;
  v15 = self;
  v16 = v14;
  v17 = v15;
  swift_retain(v11);
  v18 = sub_100054D80((uint64_t)v9, (uint64_t)&unk_1000B33E8, (uint64_t)v13);
  swift_release(v18);
  swift_release(v11);

}

- (void)getFences:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _TtC4fmfd17FindMyLocateShims *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = sub_100056A5C(&qword_1000B3300);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_10009B488, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_10009B4B0, 56, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = sub_1000630EC;
  v11[6] = v9;
  v12 = self;
  swift_retain(v9);
  v13 = sub_100054D80((uint64_t)v7, (uint64_t)&unk_1000B33E0, (uint64_t)v11);
  swift_release(v13);
  swift_release(v9);

}

- (void)fencesForHandles:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC4fmfd17FindMyLocateShims *v8;

  v6 = _Block_copy(a4);
  if (a3)
  {
    v7 = sub_100061BA4(0, &qword_1000B33C0, FMFHandle_ptr);
    a3 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  }
  _Block_copy(v6);
  v8 = self;
  sub_1000608B0((uint64_t)a3, v8, (void (**)(_QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease(a3);
}

- (void)triggerWithUUID:(id)a3 forFenceWithID:(id)a4 withStatus:(id)a5 forDate:(id)a6 completion:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t, id, char *, _QWORD, uint64_t (*)(), uint64_t);
  id v26;
  _TtC4fmfd17FindMyLocateShims *v27;
  uint64_t v28;
  uint64_t v29;

  v13 = type metadata accessor for Date(0, a2);
  v28 = *(_QWORD *)(v13 - 8);
  v29 = v13;
  __chkstk_darwin();
  v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for UUID(0);
  v17 = *(_QWORD *)(v16 - 8);
  __chkstk_darwin();
  v19 = (char *)&v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = _Block_copy(a7);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v23 = v22;
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v24 = swift_allocObject(&unk_10009B410, 24, 7);
  *(_QWORD *)(v24 + 16) = v20;
  v25 = *(void (**)(char *, uint64_t, uint64_t, id, char *, _QWORD, uint64_t (*)(), uint64_t))((swift_isaMask & (uint64_t)self->super.isa) + 0x88);
  v26 = a5;
  v27 = self;
  v25(v19, v21, v23, v26, v15, 0, sub_100063118, v24);

  swift_bridgeObjectRelease(v23);
  swift_release(v24);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v15, v29);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
}

- (void)triggerWithUUID:(id)a3 forFenceWithID:(id)a4 withStatus:(id)a5 forDate:(id)a6 triggerLocation:(id)a7 completion:(id)a8
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  _TtC4fmfd17FindMyLocateShims *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v15 = type metadata accessor for Date(0, a2);
  v30 = *(_QWORD *)(v15 - 8);
  v31 = v15;
  __chkstk_darwin(v15);
  v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = type metadata accessor for UUID(0);
  v18 = *(_QWORD *)(v29 - 8);
  __chkstk_darwin(v29);
  v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = _Block_copy(a8);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v22 = (char *)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v24 = v23;
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a6);
  _Block_copy(v21);
  v25 = a5;
  v26 = a7;
  v27 = self;
  sub_10006102C((uint64_t)v20, v22, v24, (uint64_t)v25, (uint64_t)v17, a7, v27, (void (**)(_QWORD, _QWORD))v21);
  _Block_release(v21);
  _Block_release(v21);
  swift_bridgeObjectRelease(v24);

  (*(void (**)(char *, uint64_t))(v30 + 8))(v17, v31);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v29);
}

- (void)muteFencesForHandle:(id)a3 untilDate:(id)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _TtC4fmfd17FindMyLocateShims *v18;
  uint64_t v19;

  v9 = sub_100056A5C(&qword_1000B3368);
  __chkstk_darwin(v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  if (a4)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v15 = type metadata accessor for Date(0, v14);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v11, 0, 1, v15);
  }
  else
  {
    v16 = type metadata accessor for Date(0, v12);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v11, 1, 1, v16);
  }
  _Block_copy(v13);
  v17 = a3;
  v18 = self;
  sub_1000616FC(a3, (uint64_t)v11, v18, (void (**)(_QWORD, _QWORD))v13);
  _Block_release(v13);
  _Block_release(v13);

  sub_100062278((uint64_t)v11, &qword_1000B3368);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4fmfd17FindMyLocateShims_sessionTask));
}

@end
