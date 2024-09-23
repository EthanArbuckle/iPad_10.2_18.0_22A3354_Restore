@implementation MediaPlayerSyncCoordinator.AVCoordinatorDelegateBridge

- (id)localParticipantUUIDForPlaybackCoordinator:(id)a3
{
  return (id)sub_21A1A7F30();
}

- (void)playbackCoordinator:(id)a3 broadcastLocalParticipantStateDictionary:(id)a4
{
  uint64_t v6;
  id v7;
  _TtCC12SeymourMedia26MediaPlayerSyncCoordinatorP33_75A9D0B74F4CEE621C27366C52243E4627AVCoordinatorDelegateBridge *v8;

  type metadata accessor for AVPlaybackCoordinationParticipantStateKey(0);
  sub_21A0DF63C(&qword_2550C26C8, (uint64_t (*)(uint64_t))type metadata accessor for AVPlaybackCoordinationParticipantStateKey, (uint64_t)&unk_21A1AB82C);
  sub_21A1A9D0C();
  v6 = MEMORY[0x22073C5AC]((char *)self+ OBJC_IVAR____TtCC12SeymourMedia26MediaPlayerSyncCoordinatorP33_75A9D0B74F4CEE621C27366C52243E4627AVCoordinatorDelegateBridge_delegate);
  if (v6)
  {
    MEMORY[0x24BDAC7A8](v6);
    v7 = a3;
    v8 = self;
    sub_21A1A9388();

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (void)playbackCoordinator:(id)a3 broadcastTransportControlStateDictionary:(id)a4 forItemWithIdentifier:(id)a5
{
  uint64_t v7;
  id v8;
  _TtCC12SeymourMedia26MediaPlayerSyncCoordinatorP33_75A9D0B74F4CEE621C27366C52243E4627AVCoordinatorDelegateBridge *v9;

  type metadata accessor for AVPlaybackCoordinationTransportControlStateKey(0);
  sub_21A0DF63C(&qword_2550C26B8, (uint64_t (*)(uint64_t))type metadata accessor for AVPlaybackCoordinationTransportControlStateKey, (uint64_t)&unk_21A1AB96C);
  sub_21A1A9D0C();
  sub_21A1A9D84();
  v7 = MEMORY[0x22073C5AC]((char *)self+ OBJC_IVAR____TtCC12SeymourMedia26MediaPlayerSyncCoordinatorP33_75A9D0B74F4CEE621C27366C52243E4627AVCoordinatorDelegateBridge_delegate);
  if (v7)
  {
    MEMORY[0x24BDAC7A8](v7);
    v8 = a3;
    v9 = self;
    sub_21A1A9388();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

- (void)playbackCoordinator:(id)a3 reloadTransportControlStateForItemWithIdentifier:(id)a4 completionHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtCC12SeymourMedia26MediaPlayerSyncCoordinatorP33_75A9D0B74F4CEE621C27366C52243E4627AVCoordinatorDelegateBridge *v14;
  id v15;
  _TtCC12SeymourMedia26MediaPlayerSyncCoordinatorP33_75A9D0B74F4CEE621C27366C52243E4627AVCoordinatorDelegateBridge *v16;

  v7 = _Block_copy(a5);
  v8 = sub_21A1A9D84();
  v10 = v9;
  v11 = MEMORY[0x22073C5AC]((char *)self+ OBJC_IVAR____TtCC12SeymourMedia26MediaPlayerSyncCoordinatorP33_75A9D0B74F4CEE621C27366C52243E4627AVCoordinatorDelegateBridge_delegate);
  if (v11)
  {
    v12 = v11;
    _Block_copy(v7);
    v13 = a3;
    v14 = self;
    sub_21A1490D0(v8, v10, v12, (void (**)(_QWORD))v7);
    swift_unknownObjectRelease();
    _Block_release(v7);
  }
  else
  {
    v15 = a3;
    v16 = self;
  }
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (_TtCC12SeymourMedia26MediaPlayerSyncCoordinatorP33_75A9D0B74F4CEE621C27366C52243E4627AVCoordinatorDelegateBridge)init
{
  _TtCC12SeymourMedia26MediaPlayerSyncCoordinatorP33_75A9D0B74F4CEE621C27366C52243E4627AVCoordinatorDelegateBridge *result;

  result = (_TtCC12SeymourMedia26MediaPlayerSyncCoordinatorP33_75A9D0B74F4CEE621C27366C52243E4627AVCoordinatorDelegateBridge *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self
     + OBJC_IVAR____TtCC12SeymourMedia26MediaPlayerSyncCoordinatorP33_75A9D0B74F4CEE621C27366C52243E4627AVCoordinatorDelegateBridge_localParticipantID;
  v4 = sub_21A1A7F48();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_21A13E2C4((uint64_t)self+ OBJC_IVAR____TtCC12SeymourMedia26MediaPlayerSyncCoordinatorP33_75A9D0B74F4CEE621C27366C52243E4627AVCoordinatorDelegateBridge_delegate);
}

@end
