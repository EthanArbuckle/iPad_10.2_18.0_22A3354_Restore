@implementation FindMyLocateSession

- (id)fencesUpdateCallback
{
  return sub_10002C0EC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC11fmflocatord19FindMyLocateSession_fencesUpdateCallback, (uint64_t)sub_10002BF20, (uint64_t)&unk_100056898);
}

- (void)setFencesUpdateCallback:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[24];

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject(&unk_100056880, 24, 7);
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_10002F340;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC11fmflocatord19FindMyLocateSession_fencesUpdateCallback);
  swift_beginAccess(v6, v9, 1, 0);
  v7 = *v6;
  v8 = v6[1];
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_10002C078(v7, v8);
}

- (id)networkReachabilityUpdateCallback
{
  return sub_10002C0EC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC11fmflocatord19FindMyLocateSession_networkReachabilityUpdateCallback, (uint64_t)sub_10002C204, (uint64_t)&unk_100056848);
}

- (void)setNetworkReachabilityUpdateCallback:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[24];

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject(&unk_100056830, 24, 7);
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_10002F314;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC11fmflocatord19FindMyLocateSession_networkReachabilityUpdateCallback);
  swift_beginAccess(v6, v9, 1, 0);
  v7 = *v6;
  v8 = v6[1];
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_10002C078(v7, v8);
}

- (_TtC11fmflocatord19FindMyLocateSession)init
{
  return (_TtC11fmflocatord19FindMyLocateSession *)sub_10002C3A8();
}

- (void)triggerFenceWithID:(NSString *)a3 trigger:(int64_t)a4 location:(CLLocation *)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  NSString *v19;
  CLLocation *v20;
  _TtC11fmflocatord19FindMyLocateSession *v21;
  uint64_t v22;
  uint64_t v23;

  v11 = sub_10002C518(&qword_100069120);
  __chkstk_darwin(v11);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (_QWORD *)swift_allocObject(&unk_100056790, 56, 7);
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  v16 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject(&unk_1000567B8, 48, 7);
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1000692C0;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject(&unk_1000567E0, 48, 7);
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1000692D0;
  v18[5] = v17;
  v19 = a3;
  v20 = a5;
  v21 = self;
  v22 = sub_10002F0D0((uint64_t)v13, (uint64_t)&unk_1000692E0, (uint64_t)v18);
  swift_release(v22);
}

+ (NSString)scheduleTimerIdentifier
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)scheduleAlarmStream
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (void).cxx_destruct
{
  sub_10002C078(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11fmflocatord19FindMyLocateSession_fencesUpdateCallback), *(_QWORD *)&self->fencesUpdateCallback[OBJC_IVAR____TtC11fmflocatord19FindMyLocateSession_fencesUpdateCallback]);
  sub_10002C078(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC11fmflocatord19FindMyLocateSession_networkReachabilityUpdateCallback), *(_QWORD *)&self->fencesUpdateCallback[OBJC_IVAR____TtC11fmflocatord19FindMyLocateSession_networkReachabilityUpdateCallback]);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11fmflocatord19FindMyLocateSession_sessionHolder));
}

- (void)getFences:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _TtC11fmflocatord19FindMyLocateSession *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = sub_10002C518(&qword_100069120);
  __chkstk_darwin(v5);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_100056740, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  type metadata accessor for MainActor(0);
  v11 = self;
  v12 = swift_retain(v9);
  v13 = static MainActor.shared.getter(v12);
  v14 = (_QWORD *)swift_allocObject(&unk_100056768, 56, 7);
  v14[2] = v13;
  v14[3] = &protocol witness table for MainActor;
  v14[4] = v11;
  v14[5] = sub_10002ED4C;
  v14[6] = v9;
  v15 = sub_10002CE78((uint64_t)v7, (uint64_t)&unk_1000692B0, (uint64_t)v14);

  swift_release(v9);
  swift_release(v15);
}

@end
