@implementation BeaconSharingTrampoline

- (void)allSharesWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _TtC12searchpartyd23BeaconSharingTrampoline *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = sub_10001A9A8(&qword_1010F46C0);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_101055AA8, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_101055AD0, 56, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = sub_1000DB630;
  v11[5] = v9;
  v11[6] = self;
  v12 = self;
  swift_retain();
  v13 = sub_100691AC0((uint64_t)v7, (uint64_t)&unk_1010EE570, (uint64_t)v11);
  swift_release(v13);
  swift_release(v9);

}

- (void)sharingLimitsWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12searchpartyd23BeaconSharingTrampoline *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1010556C0, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_100009804((uint64_t)sub_10001D390, v5);

  swift_release(v5);
}

- (void)startRefreshingSharesWithCompletion:(id)a3
{
  sub_10000897C(self, (int)a2, a3, (void (*)(void))sub_100008E14);
}

- (void)share:(id)a3 recipients:(id)a4 shareType:(unint64_t)a5 completion:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  _TtC12searchpartyd23BeaconSharingTrampoline *v30;
  uint64_t v31;
  void (**v32)(char, uint64_t);
  _TtC12searchpartyd23BeaconSharingTrampoline *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  _TtC12searchpartyd23BeaconSharingTrampoline *v38;
  unint64_t v39;

  v38 = self;
  v39 = a5;
  v9 = sub_10001A9A8(&qword_1010F46C0);
  __chkstk_darwin(v9);
  v35 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = type metadata accessor for UUID(0);
  v11 = *(_QWORD *)(v36 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  v13 = __chkstk_darwin(v36);
  v14 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v16 = (char *)&v34 - v15;
  v17 = _Block_copy(a6);
  v37 = v16;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v18 = sub_10000F4A0(0, (unint64_t *)&qword_1011100A0, SPHandle_ptr);
  v19 = sub_1000170AC(&qword_1010EE6B0, (unint64_t *)&qword_1011100A0, SPHandle_ptr);
  v34 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v18, v19);
  v20 = swift_allocObject(&unk_101055FA8, 24, 7);
  *(_QWORD *)(v20 + 16) = v17;
  v21 = type metadata accessor for TaskPriority(0);
  v22 = (uint64_t)v35;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v35, 1, 1, v21);
  v23 = v16;
  v24 = v36;
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v23, v36);
  v25 = *(unsigned __int8 *)(v11 + 80);
  v26 = (v25 + 48) & ~v25;
  v27 = (v12 + v26 + 7) & 0xFFFFFFFFFFFFFFF8;
  v28 = (v27 + 15) & 0xFFFFFFFFFFFFFFF8;
  v29 = (char *)swift_allocObject(&unk_101055FD0, v28 + 16, v25 | 7);
  *((_QWORD *)v29 + 2) = 0;
  *((_QWORD *)v29 + 3) = 0;
  v30 = v38;
  *((_QWORD *)v29 + 4) = v39;
  *((_QWORD *)v29 + 5) = v30;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v29[v26], v14, v24);
  v31 = v34;
  *(_QWORD *)&v29[v27] = v34;
  v32 = (void (**)(char, uint64_t))&v29[v28];
  *v32 = sub_1000DB0F0;
  v32[1] = (void (*)(char, uint64_t))v20;
  v33 = v30;
  swift_bridgeObjectRetain(v31);
  swift_retain();
  sub_100691AC0(v22, (uint64_t)&unk_1010EE6C0, (uint64_t)v29);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t))(v11 + 8))(v37, v24);
}

- (void)removeShare:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  void (**v24)(char, uint64_t);
  _TtC12searchpartyd23BeaconSharingTrampoline *v25;
  uint64_t v26;

  v7 = sub_10001A9A8(&qword_1010F46C0);
  __chkstk_darwin(v7);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for UUID(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  v13 = __chkstk_darwin(v10);
  v14 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v16 = (char *)&v26 - v15;
  v17 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v18 = swift_allocObject(&unk_101055F58, 24, 7);
  *(_QWORD *)(v18 + 16) = v17;
  v19 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v9, 1, 1, v19);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  v20 = *(unsigned __int8 *)(v11 + 80);
  v21 = (v20 + 40) & ~v20;
  v22 = (v12 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  v23 = (char *)swift_allocObject(&unk_101055F80, v22 + 16, v20 | 7);
  *((_QWORD *)v23 + 2) = 0;
  *((_QWORD *)v23 + 3) = 0;
  *((_QWORD *)v23 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v23[v21], v14, v10);
  v24 = (void (**)(char, uint64_t))&v23[v22];
  *v24 = sub_1000DB5D4;
  v24[1] = (void (*)(char, uint64_t))v18;
  v25 = self;
  swift_retain();
  sub_100691AC0((uint64_t)v9, (uint64_t)&unk_1010EE6A8, (uint64_t)v23);
  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
}

- (void)revokeShare:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  void (**v24)(char, uint64_t);
  _TtC12searchpartyd23BeaconSharingTrampoline *v25;
  uint64_t v26;

  v7 = sub_10001A9A8(&qword_1010F46C0);
  __chkstk_darwin(v7);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for UUID(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  v13 = __chkstk_darwin(v10);
  v14 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v16 = (char *)&v26 - v15;
  v17 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v18 = swift_allocObject(&unk_101055EE0, 24, 7);
  *(_QWORD *)(v18 + 16) = v17;
  v19 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v9, 1, 1, v19);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  v20 = *(unsigned __int8 *)(v11 + 80);
  v21 = (v20 + 40) & ~v20;
  v22 = (v12 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  v23 = (char *)swift_allocObject(&unk_101055F08, v22 + 16, v20 | 7);
  *((_QWORD *)v23 + 2) = 0;
  *((_QWORD *)v23 + 3) = 0;
  *((_QWORD *)v23 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v23[v21], v14, v10);
  v24 = (void (**)(char, uint64_t))&v23[v22];
  *v24 = sub_1000DB5D4;
  v24[1] = (void (*)(char, uint64_t))v18;
  v25 = self;
  swift_retain();
  sub_100691AC0((uint64_t)v9, (uint64_t)&unk_1010EE688, (uint64_t)v23);
  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
}

- (void)acceptShare:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  void (**v24)(char, uint64_t);
  _TtC12searchpartyd23BeaconSharingTrampoline *v25;
  uint64_t v26;

  v7 = sub_10001A9A8(&qword_1010F46C0);
  __chkstk_darwin(v7);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for UUID(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  v13 = __chkstk_darwin(v10);
  v14 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v16 = (char *)&v26 - v15;
  v17 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v18 = swift_allocObject(&unk_101055E90, 24, 7);
  *(_QWORD *)(v18 + 16) = v17;
  v19 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v9, 1, 1, v19);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  v20 = *(unsigned __int8 *)(v11 + 80);
  v21 = (v20 + 40) & ~v20;
  v22 = (v12 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  v23 = (char *)swift_allocObject(&unk_101055EB8, v22 + 16, v20 | 7);
  *((_QWORD *)v23 + 2) = 0;
  *((_QWORD *)v23 + 3) = 0;
  *((_QWORD *)v23 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v23[v21], v14, v10);
  v24 = (void (**)(char, uint64_t))&v23[v22];
  *v24 = sub_1000DB5D4;
  v24[1] = (void (*)(char, uint64_t))v18;
  v25 = self;
  swift_retain();
  sub_100691AC0((uint64_t)v9, (uint64_t)&unk_1010EE668, (uint64_t)v23);
  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
}

- (void)declineShare:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  void (**v24)(char, uint64_t);
  _TtC12searchpartyd23BeaconSharingTrampoline *v25;
  uint64_t v26;

  v7 = sub_10001A9A8(&qword_1010F46C0);
  __chkstk_darwin(v7);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for UUID(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  v13 = __chkstk_darwin(v10);
  v14 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v16 = (char *)&v26 - v15;
  v17 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v18 = swift_allocObject(&unk_101055E40, 24, 7);
  *(_QWORD *)(v18 + 16) = v17;
  v19 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v9, 1, 1, v19);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  v20 = *(unsigned __int8 *)(v11 + 80);
  v21 = (v20 + 40) & ~v20;
  v22 = (v12 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  v23 = (char *)swift_allocObject(&unk_101055E68, v22 + 16, v20 | 7);
  *((_QWORD *)v23 + 2) = 0;
  *((_QWORD *)v23 + 3) = 0;
  *((_QWORD *)v23 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v23[v21], v14, v10);
  v24 = (void (**)(char, uint64_t))&v23[v22];
  *v24 = sub_1000DB5D4;
  v24[1] = (void (*)(char, uint64_t))v18;
  v25 = self;
  swift_retain();
  sub_100691AC0((uint64_t)v9, (uint64_t)&unk_1010EE650, (uint64_t)v23);
  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
}

- (void)stopSharing:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  void (**v24)(char, uint64_t);
  _TtC12searchpartyd23BeaconSharingTrampoline *v25;
  uint64_t v26;

  v7 = sub_10001A9A8(&qword_1010F46C0);
  __chkstk_darwin(v7);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for UUID(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  v13 = __chkstk_darwin(v10);
  v14 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v16 = (char *)&v26 - v15;
  v17 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v18 = swift_allocObject(&unk_101055D78, 24, 7);
  *(_QWORD *)(v18 + 16) = v17;
  v19 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v9, 1, 1, v19);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  v20 = *(unsigned __int8 *)(v11 + 80);
  v21 = (v20 + 40) & ~v20;
  v22 = (v12 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  v23 = (char *)swift_allocObject(&unk_101055DA0, v22 + 16, v20 | 7);
  *((_QWORD *)v23 + 2) = 0;
  *((_QWORD *)v23 + 3) = 0;
  *((_QWORD *)v23 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v23[v21], v14, v10);
  v24 = (void (**)(char, uint64_t))&v23[v22];
  *v24 = sub_1000DB5D4;
  v24[1] = (void (*)(char, uint64_t))v18;
  v25 = self;
  swift_retain();
  sub_100691AC0((uint64_t)v9, (uint64_t)&unk_1010EE628, (uint64_t)v23);
  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
}

- (void)forceBreakAllSharesOfType:(unint64_t)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _TtC12searchpartyd23BeaconSharingTrampoline *v14;
  uint64_t v15;

  v7 = sub_10001A9A8(&qword_1010F46C0);
  __chkstk_darwin(v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject(&unk_101055CB0, 24, 7);
  *(_QWORD *)(v11 + 16) = v10;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_101055CD8, 64, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = sub_1000DB5D4;
  v13[7] = v11;
  v14 = self;
  swift_retain();
  sub_100691AC0((uint64_t)v9, (uint64_t)&unk_1010EE600, (uint64_t)v13);
  swift_release();
  swift_release();

}

- (void)forceBreakAllSharesWithUser:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  _TtC12searchpartyd23BeaconSharingTrampoline *v15;
  id v16;
  uint64_t v17;

  v7 = sub_10001A9A8(&qword_1010F46C0);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject(&unk_101055C60, 24, 7);
  *(_QWORD *)(v11 + 16) = v10;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_101055C88, 64, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = sub_1000DB5D4;
  v13[7] = v11;
  v14 = a3;
  v15 = self;
  v16 = v14;
  swift_retain();
  sub_100691AC0((uint64_t)v9, (uint64_t)&unk_1010EE5D8, (uint64_t)v13);
  swift_release();
  swift_release();

}

- (void)forceDeclineShare:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  void (**v24)(char, uint64_t);
  _TtC12searchpartyd23BeaconSharingTrampoline *v25;
  uint64_t v26;

  v7 = sub_10001A9A8(&qword_1010F46C0);
  __chkstk_darwin(v7);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for UUID(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  v13 = __chkstk_darwin(v10);
  v14 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v16 = (char *)&v26 - v15;
  v17 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v18 = swift_allocObject(&unk_101055C10, 24, 7);
  *(_QWORD *)(v18 + 16) = v17;
  v19 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v9, 1, 1, v19);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  v20 = *(unsigned __int8 *)(v11 + 80);
  v21 = (v20 + 40) & ~v20;
  v22 = (v12 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  v23 = (char *)swift_allocObject(&unk_101055C38, v22 + 16, v20 | 7);
  *((_QWORD *)v23 + 2) = 0;
  *((_QWORD *)v23 + 3) = 0;
  *((_QWORD *)v23 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v23[v21], v14, v10);
  v24 = (void (**)(char, uint64_t))&v23[v22];
  *v24 = sub_1000DB5D4;
  v24[1] = (void (*)(char, uint64_t))v18;
  v25 = self;
  swift_retain();
  sub_100691AC0((uint64_t)v9, (uint64_t)&unk_1010EE5B8, (uint64_t)v23);
  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
}

- (void)cleanupAllRecordsOfType:(unint64_t)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _TtC12searchpartyd23BeaconSharingTrampoline *v14;
  uint64_t v15;

  v7 = sub_10001A9A8(&qword_1010F46C0);
  __chkstk_darwin(v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject(&unk_101055BC0, 24, 7);
  *(_QWORD *)(v11 + 16) = v10;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_101055BE8, 64, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = sub_1000DB5D4;
  v13[7] = v11;
  v14 = self;
  swift_retain();
  sub_100691AC0((uint64_t)v9, (uint64_t)&unk_1010EE5A8, (uint64_t)v13);
  swift_release();
  swift_release();

}

- (void)forceStopSharing:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  void (**v24)(char, uint64_t);
  _TtC12searchpartyd23BeaconSharingTrampoline *v25;
  uint64_t v26;

  v7 = sub_10001A9A8(&qword_1010F46C0);
  __chkstk_darwin(v7);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for UUID(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  v13 = __chkstk_darwin(v10);
  v14 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v16 = (char *)&v26 - v15;
  v17 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v18 = swift_allocObject(&unk_101055AF8, 24, 7);
  *(_QWORD *)(v18 + 16) = v17;
  v19 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v9, 1, 1, v19);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  v20 = *(unsigned __int8 *)(v11 + 80);
  v21 = (v20 + 40) & ~v20;
  v22 = (v12 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  v23 = (char *)swift_allocObject(&unk_101055B20, v22 + 16, v20 | 7);
  *((_QWORD *)v23 + 2) = 0;
  *((_QWORD *)v23 + 3) = 0;
  *((_QWORD *)v23 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v23[v21], v14, v10);
  v24 = (void (**)(char, uint64_t))&v23[v22];
  *v24 = sub_1000DB5D4;
  v24[1] = (void (*)(char, uint64_t))v18;
  v25 = self;
  swift_retain();
  sub_100691AC0((uint64_t)v9, (uint64_t)&unk_1010EE580, (uint64_t)v23);
  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
}

- (void)allSharesIncludingHiddenWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _TtC12searchpartyd23BeaconSharingTrampoline *v12;
  uint64_t v13;

  v5 = sub_10001A9A8(&qword_1010F46C0);
  __chkstk_darwin(v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_101055A58, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_101055A80, 56, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = sub_10001D2C8;
  v11[5] = v9;
  v11[6] = self;
  v12 = self;
  swift_retain();
  sub_100691AC0((uint64_t)v7, (uint64_t)&unk_1010EE560, (uint64_t)v11);
  swift_release();
  swift_release();

}

- (void)stopRefreshingSharesWithCompletion:(id)a3
{
  sub_10000897C(self, (int)a2, a3, (void (*)(void))sub_1000D850C);
}

- (void)requestShare:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  void (**v24)(char, uint64_t);
  _TtC12searchpartyd23BeaconSharingTrampoline *v25;
  uint64_t v26;

  v7 = sub_10001A9A8(&qword_1010F46C0);
  __chkstk_darwin(v7);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for UUID(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  v13 = __chkstk_darwin(v10);
  v14 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v16 = (char *)&v26 - v15;
  v17 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v18 = swift_allocObject(&unk_101055940, 24, 7);
  *(_QWORD *)(v18 + 16) = v17;
  v19 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v9, 1, 1, v19);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  v20 = *(unsigned __int8 *)(v11 + 80);
  v21 = (v20 + 40) & ~v20;
  v22 = (v12 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  v23 = (char *)swift_allocObject(&unk_101055968, v22 + 16, v20 | 7);
  *((_QWORD *)v23 + 2) = 0;
  *((_QWORD *)v23 + 3) = 0;
  *((_QWORD *)v23 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v23[v21], v14, v10);
  v24 = (void (**)(char, uint64_t))&v23[v22];
  *v24 = sub_1000DB5D4;
  v24[1] = (void (*)(char, uint64_t))v18;
  v25 = self;
  swift_retain();
  sub_100691AC0((uint64_t)v9, (uint64_t)&unk_1010EE530, (uint64_t)v23);
  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
}

- (void)updatedCircleIdentifiers:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _TtC12searchpartyd23BeaconSharingTrampoline *v16;
  uint64_t v17;

  v7 = sub_10001A9A8(&qword_1010F46C0);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = type metadata accessor for UUID(0);
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v11);
  v13 = swift_allocObject(&unk_1010558F0, 24, 7);
  *(_QWORD *)(v13 + 16) = v10;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v9, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_101055918, 64, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = v12;
  v15[6] = sub_1000DB5D4;
  v15[7] = v13;
  v16 = self;
  swift_bridgeObjectRetain(v12);
  swift_retain();
  sub_100691AC0((uint64_t)v9, (uint64_t)&unk_1010EE508, (uint64_t)v15);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

}

- (void)uploadKeysWithCircleIdentifier:(id)a3 isInitialUpload:(BOOL)a4 completion:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  char *v26;
  _TtC12searchpartyd23BeaconSharingTrampoline *v27;
  char *v28;
  _BOOL4 v29;

  v29 = a4;
  v8 = sub_10001A9A8(&qword_1010F46C0);
  __chkstk_darwin(v8);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = v10;
  v11 = type metadata accessor for UUID(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  v14 = __chkstk_darwin(v11);
  v15 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v17 = (char *)&v28 - v16;
  v18 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v19 = swift_allocObject(&unk_101055878, 24, 7);
  *(_QWORD *)(v19 + 16) = v18;
  v20 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v10, 1, 1, v20);
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
  v21 = *(unsigned __int8 *)(v12 + 80);
  v22 = (v21 + 40) & ~v21;
  v23 = v22 + v13;
  v24 = (v22 + v13) & 0xFFFFFFFFFFFFFFF8;
  v25 = (char *)swift_allocObject(&unk_1010558A0, v24 + 24, v21 | 7);
  v26 = &v25[v24];
  *((_QWORD *)v25 + 2) = 0;
  *((_QWORD *)v25 + 3) = 0;
  *((_QWORD *)v25 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v25[v22], v15, v11);
  v25[v23] = v29;
  *((_QWORD *)v26 + 1) = sub_1000DB5D4;
  *((_QWORD *)v26 + 2) = v19;
  v27 = self;
  swift_retain();
  sub_100691AC0((uint64_t)v28, (uint64_t)&unk_1010EE4F0, (uint64_t)v25);
  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
}

- (void)downloadKeysWithCircleIdentifier:(id)a3 fromBookmark:(BOOL)a4 completion:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  char *v26;
  _TtC12searchpartyd23BeaconSharingTrampoline *v27;
  char *v28;
  _BOOL4 v29;

  v29 = a4;
  v8 = sub_10001A9A8(&qword_1010F46C0);
  __chkstk_darwin(v8);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = v10;
  v11 = type metadata accessor for UUID(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  v14 = __chkstk_darwin(v11);
  v15 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v17 = (char *)&v28 - v16;
  v18 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v19 = swift_allocObject(&unk_101055828, 24, 7);
  *(_QWORD *)(v19 + 16) = v18;
  v20 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v10, 1, 1, v20);
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
  v21 = *(unsigned __int8 *)(v12 + 80);
  v22 = (v21 + 40) & ~v21;
  v23 = v22 + v13;
  v24 = (v22 + v13) & 0xFFFFFFFFFFFFFFF8;
  v25 = (char *)swift_allocObject(&unk_101055850, v24 + 24, v21 | 7);
  v26 = &v25[v24];
  *((_QWORD *)v25 + 2) = 0;
  *((_QWORD *)v25 + 3) = 0;
  *((_QWORD *)v25 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v25[v22], v15, v11);
  v25[v23] = v29;
  *((_QWORD *)v26 + 1) = sub_1000DB5D4;
  *((_QWORD *)v26 + 2) = v19;
  v27 = self;
  swift_retain();
  sub_100691AC0((uint64_t)v28, (uint64_t)&unk_1010EE4E0, (uint64_t)v25);
  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
}

- (void)checkDataIntegrityWithShareIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  void (**v26)(char, uint64_t, uint64_t);
  _TtC12searchpartyd23BeaconSharingTrampoline *v27;
  uint64_t v28;

  v7 = sub_10001A9A8(&qword_1010F46C0);
  __chkstk_darwin(v7);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_10001A9A8(&qword_1010ED860);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  v13 = __chkstk_darwin(v10);
  v14 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v16 = (char *)&v28 - v15;
  v17 = _Block_copy(a4);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v18 = type metadata accessor for UUID(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v16, 0, 1, v18);
  }
  else
  {
    v19 = type metadata accessor for UUID(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v16, 1, 1, v19);
  }
  v20 = swift_allocObject(&unk_1010557D8, 24, 7);
  *(_QWORD *)(v20 + 16) = v17;
  v21 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v9, 1, 1, v21);
  sub_10000F9B8((uint64_t)v16, (uint64_t)v14, &qword_1010ED860);
  v22 = *(unsigned __int8 *)(v11 + 80);
  v23 = (v22 + 40) & ~v22;
  v24 = (v12 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
  v25 = (_QWORD *)swift_allocObject(&unk_101055800, v24 + 16, v22 | 7);
  v25[2] = 0;
  v25[3] = 0;
  v25[4] = self;
  sub_100005CF0((uint64_t)v14, (uint64_t)v25 + v23, &qword_1010ED860);
  v26 = (void (**)(char, uint64_t, uint64_t))((char *)v25 + v24);
  *v26 = sub_1000D9E98;
  v26[1] = (void (*)(char, uint64_t, uint64_t))v20;
  v27 = self;
  swift_retain();
  sub_100691AC0((uint64_t)v9, (uint64_t)&unk_1010EE4D0, (uint64_t)v25);
  swift_release();
  swift_release();

  sub_100004048((uint64_t)v16, &qword_1010ED860);
}

- (void)lookForOrphanedRecordsWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _TtC12searchpartyd23BeaconSharingTrampoline *v12;
  uint64_t v13;

  v5 = sub_10001A9A8(&qword_1010F46C0);
  __chkstk_darwin(v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_101055788, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_1010557B0, 56, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = sub_1000D9E98;
  v11[6] = v9;
  v12 = self;
  swift_retain();
  sub_100691AC0((uint64_t)v7, (uint64_t)&unk_1010EE4C0, (uint64_t)v11);
  swift_release();
  swift_release();

}

- (void)removeExpiredSharesWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _TtC12searchpartyd23BeaconSharingTrampoline *v12;
  uint64_t v13;

  v5 = sub_10001A9A8(&qword_1010F46C0);
  __chkstk_darwin(v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_101055738, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_101055760, 56, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = sub_10001EEDC;
  v11[6] = v9;
  v12 = self;
  swift_retain();
  sub_100691AC0((uint64_t)v7, (uint64_t)&unk_1010EE4B0, (uint64_t)v11);
  swift_release();
  swift_release();

}

- (_TtC12searchpartyd23BeaconSharingTrampoline)init
{
  _TtC12searchpartyd23BeaconSharingTrampoline *result;

  result = (_TtC12searchpartyd23BeaconSharingTrampoline *)_swift_stdlib_reportUnimplementedInitializer("searchpartyd.BeaconSharingTrampoline", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s12searchpartyd26ManagedCBPeripheralManagerVwxx_0((Class *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC12searchpartyd23BeaconSharingTrampoline_implementation));
}

@end
