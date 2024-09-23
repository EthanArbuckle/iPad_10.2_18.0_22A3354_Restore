@implementation CRLBoardLibrary.BoardInfo

- (void)activeParticipantListChangedNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __n128 v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  swift_retain(self);
  sub_100CC17D4();
  v9 = swift_release(self);
  (*(void (**)(char *, uint64_t, __n128))(v6 + 8))(v8, v5, v9);
}

- (void)shareStateUpdatedWithShare:(id)a3
{
  id v5;

  v5 = a3;
  swift_retain(self);
  sub_100CC9990(a3);

  swift_release(self);
}

@end
