@implementation Relay.RelayProxy

- (void)setDisplayServiceSessionsChangedListener:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtCC12SidecarRelay5RelayP33_1C5D654CC83EDCEF3B22927C4D40C7FB10RelayProxy *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_100086FB8, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_10002B084((uint64_t)sub_100046D60, v5);

  swift_release(v5);
}

- (void)closeDisplayServiceSessionsWithPeerIdentifier:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtCC12SidecarRelay5RelayP33_1C5D654CC83EDCEF3B22927C4D40C7FB10RelayProxy *v9;
  uint64_t v10;

  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_10002B260((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtCC12SidecarRelay5RelayP33_1C5D654CC83EDCEF3B22927C4D40C7FB10RelayProxy)init
{
  sub_10002BEBC();
}

- (void).cxx_destruct
{
  swift_weakDestroy((char *)self + OBJC_IVAR____TtCC12SidecarRelay5RelayP33_1C5D654CC83EDCEF3B22927C4D40C7FB10RelayProxy_relay);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtCC12SidecarRelay5RelayP33_1C5D654CC83EDCEF3B22927C4D40C7FB10RelayProxy_cancellables));
  swift_release(*(_QWORD *)&self->relay[OBJC_IVAR____TtCC12SidecarRelay5RelayP33_1C5D654CC83EDCEF3B22927C4D40C7FB10RelayProxy_sessionsChangedListener]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->relay[OBJC_IVAR____TtCC12SidecarRelay5RelayP33_1C5D654CC83EDCEF3B22927C4D40C7FB10RelayProxy____lazy_storage___remoteDisplayServiceIdentifier]);
}

@end
