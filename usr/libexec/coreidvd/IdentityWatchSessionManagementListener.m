@implementation IdentityWatchSessionManagementListener

- (_TtC8coreidvd38IdentityWatchSessionManagementListener)init
{
  return (_TtC8coreidvd38IdentityWatchSessionManagementListener *)sub_1003A4D9C();
}

- (void)lockStateMonitor:(id)a3 deviceLockDidUpdate:(BOOL)a4 watchPairingID:(id)a5
{
  uint64_t v7;
  uint8_t *v8;
  uint8_t *v9;
  _TtC8coreidvd38IdentityWatchSessionManagementListener *v10;
  id v11;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v9 = v8;
  v11 = a3;
  v10 = self;
  sub_1003B4D74(v7, v9);
  swift_bridgeObjectRelease(v9);

}

- (void)manager:(id)a3 didStartAuthenticationForSessionWithID:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8coreidvd38IdentityWatchSessionManagementListener *v12;
  uint64_t v13;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1003B61A0(v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)manager:(id)a3 didCompleteAuthenticationForSessionWithID:(id)a4
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  _TtC8coreidvd38IdentityWatchSessionManagementListener *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;

  v7 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v7);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for UUID(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  v13 = __chkstk_darwin(v10);
  v14 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v16 = (char *)&v24 - v15;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v17 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v9, 1, 1, v17);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  v18 = *(unsigned __int8 *)(v11 + 80);
  v19 = (v18 + 40) & ~v18;
  v20 = (char *)swift_allocObject(&unk_100615AF0, v19 + v12, v18 | 7);
  *((_QWORD *)v20 + 2) = 0;
  *((_QWORD *)v20 + 3) = 0;
  *((_QWORD *)v20 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v20[v19], v14, v10);
  v21 = self;
  v22 = a3;
  v23 = sub_1001075D4((uint64_t)v9, (uint64_t)&unk_10063EDE0, (uint64_t)v20);
  swift_release(v23);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
}

- (void)manager:(id)a3 didFailAuthenticationForSessionWithID:(id)a4 error:(id)a5
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  id v23;
  _TtC8coreidvd38IdentityWatchSessionManagementListener *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;

  v29 = a3;
  v8 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v8);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for UUID(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  v14 = __chkstk_darwin(v11);
  v15 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v17 = (char *)&v28 - v16;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v18 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v10, 1, 1, v18);
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
  v19 = *(unsigned __int8 *)(v12 + 80);
  v20 = (v19 + 40) & ~v19;
  v21 = (v13 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  v22 = (char *)swift_allocObject(&unk_100615AC8, v21 + 8, v19 | 7);
  *((_QWORD *)v22 + 2) = 0;
  *((_QWORD *)v22 + 3) = 0;
  *((_QWORD *)v22 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v22[v20], v15, v11);
  *(_QWORD *)&v22[v21] = a5;
  v23 = a5;
  v24 = self;
  v25 = v23;
  v26 = v29;
  v27 = sub_1001075D4((uint64_t)v10, (uint64_t)&unk_10063EDD0, (uint64_t)v22);
  swift_release(v27);

  (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8coreidvd38IdentityWatchSessionManagementListener_remoteSessionService));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8coreidvd38IdentityWatchSessionManagementListener_deviceLockStateMonitor));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8coreidvd38IdentityWatchSessionManagementListener_biometricStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8coreidvd38IdentityWatchSessionManagementListener_rangingManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8coreidvd38IdentityWatchSessionManagementListener_rangingQueue));
  sub_1003B14E8((uint64_t)self + OBJC_IVAR____TtC8coreidvd38IdentityWatchSessionManagementListener_rangingSessionID);
}

@end
