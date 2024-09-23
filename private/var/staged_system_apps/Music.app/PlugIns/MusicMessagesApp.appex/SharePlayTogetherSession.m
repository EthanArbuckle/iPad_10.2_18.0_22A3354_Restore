@implementation SharePlayTogetherSession

- (_TtC9MusicCore24SharePlayTogetherSession)init
{
  _TtC9MusicCore24SharePlayTogetherSession *result;

  result = (_TtC9MusicCore24SharePlayTogetherSession *)_swift_stdlib_reportUnimplementedInitializer("MusicCore.SharePlayTogetherSession", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t);
  char *v10;
  uint64_t v11;

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC9MusicCore24SharePlayTogetherSession_session));

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC9MusicCore24SharePlayTogetherSession__routeSymbolName;
  v4 = sub_1000057B4(&qword_1004C1B68);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC9MusicCore24SharePlayTogetherSession__participants;
  v6 = sub_1000057B4(&qword_1004C1B88);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC9MusicCore24SharePlayTogetherSession__connectedParticipantsCount;
  v8 = sub_1000057B4((uint64_t *)&unk_1004C1BA0);
  v9 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8);
  v9(v7, v8);
  v9((char *)self + OBJC_IVAR____TtC9MusicCore24SharePlayTogetherSession__pendingParticipantsCount, v8);
  v10 = (char *)self + OBJC_IVAR____TtC9MusicCore24SharePlayTogetherSession__host;
  v11 = sub_1000057B4(&qword_1004C1BC8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  sub_1001D7E48(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9MusicCore24SharePlayTogetherSession__qrCode), *(_QWORD *)&self->session[OBJC_IVAR____TtC9MusicCore24SharePlayTogetherSession__qrCode], *(_QWORD *)&self->endpoint[OBJC_IVAR____TtC9MusicCore24SharePlayTogetherSession__qrCode], *(void **)&self->isHost[OBJC_IVAR____TtC9MusicCore24SharePlayTogetherSession__qrCode]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC9MusicCore24SharePlayTogetherSession_endpointNotificationObserver));
}

- (void)groupSessionDidConnect:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  __n128 v9;
  _TtC9MusicCore24SharePlayTogetherSession *v10;
  __n128 v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_1000057B4((uint64_t *)&unk_1004BFBC0);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  type metadata accessor for MainActor(0);
  swift_unknownObjectRetain_n(a3, 2, v9);
  v10 = self;
  v12 = static MainActor.shared.getter(v11);
  v13 = (_QWORD *)swift_allocObject(&unk_10047D260, 48, 7);
  v13[2] = v12;
  v13[3] = &protocol witness table for MainActor;
  v13[4] = a3;
  v13[5] = v10;
  v14 = sub_1000E6084((uint64_t)v7, (uint64_t)&unk_1004C1DB8, (uint64_t)v13);
  swift_unknownObjectRelease(a3);

  swift_release(v14);
}

- (void)groupSession:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  _TtC9MusicCore24SharePlayTogetherSession *v12;
  id v13;
  _TtC9MusicCore24SharePlayTogetherSession *v14;
  __n128 v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;

  v7 = sub_1000057B4((uint64_t *)&unk_1004BFBC0);
  __chkstk_darwin(v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  type metadata accessor for MainActor(0);
  v11 = a4;
  v12 = self;
  v13 = v11;
  v14 = v12;
  swift_unknownObjectRetain(a3);
  v16 = static MainActor.shared.getter(v15);
  v17 = (_QWORD *)swift_allocObject(&unk_10047D238, 48, 7);
  v17[2] = v16;
  v17[3] = &protocol witness table for MainActor;
  v17[4] = v13;
  v17[5] = v14;
  v18 = sub_1000E6084((uint64_t)v9, (uint64_t)&unk_1004C1DB0, (uint64_t)v17);
  swift_unknownObjectRelease(a3);

  swift_release(v18);
}

- (void)groupSession:(id)a3 didUpdateParticipants:(id)a4
{
  sub_1001D29C4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, "session:didUpdateParticipants", (uint64_t)&unk_10047D3A0, (uint64_t)&unk_1004C1E70);
}

- (void)groupSession:(id)a3 didUpdatePendingParticipants:(id)a4
{
  sub_1001D29C4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, "session:didUpdatePendingParticipants:", (uint64_t)&unk_10047D378, (uint64_t)&unk_1004C1E60);
}

- (void)groupSession:(id)a3 didUpdateMembers:(id)a4
{
  sub_1001D29C4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, "session:didUpdateMembers:", (uint64_t)&unk_10047D350, (uint64_t)&unk_1004C1E50);
}

@end
