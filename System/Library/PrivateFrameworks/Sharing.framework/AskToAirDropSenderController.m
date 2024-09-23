@implementation AskToAirDropSenderController

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC7Sharing28AskToAirDropSenderController_queue));
}

- (int64_t)nearbyDeviceCount
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC7Sharing28AskToAirDropSenderController_nearbyDeviceCount);
  swift_beginAccess();
  return *v2;
}

- (void)setNearbyDeviceCount:(int64_t)a3
{
  int64_t *v5;
  _TtC7Sharing28AskToAirDropSenderController *v6;

  v5 = (int64_t *)((char *)self + OBJC_IVAR____TtC7Sharing28AskToAirDropSenderController_nearbyDeviceCount);
  swift_beginAccess();
  *v5 = a3;
  v6 = self;
  sub_1A2A3D49C();

}

- (BOOL)hasSeenPrivacyPrompt
{
  return sub_1A2A4159C(self);
}

- (void)setHasSeenPrivacyPrompt:(BOOL)a3
{
  sub_1A2A41758(self, (uint64_t)a2, a3);
}

- (id)nearbyDeviceCountChangedHandler
{
  return sub_1A2A3DB30((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC7Sharing28AskToAirDropSenderController_nearbyDeviceCountChangedHandler, (uint64_t)sub_1A29FD800, (uint64_t)&block_descriptor_139);
}

- (void)setNearbyDeviceCountChangedHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1A2A1BF0C;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC7Sharing28AskToAirDropSenderController_nearbyDeviceCountChangedHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1A297CC78(v7);
}

- (id)didStopHandler
{
  return sub_1A2A3DB30((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC7Sharing28AskToAirDropSenderController_didStopHandler, (uint64_t)sub_1A2A3DBE8, (uint64_t)&block_descriptor_132);
}

- (void)setDidStopHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1A2A45118;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC7Sharing28AskToAirDropSenderController_didStopHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1A297CC78(v7);
}

- (_TtC7Sharing28AskToAirDropSenderController)init
{
  _QWORD *v2;
  _QWORD *v3;
  _TtC7Sharing28AskToAirDropSenderController *result;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Sharing28AskToAirDropSenderController_nearbyDeviceCount) = 0;
  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC7Sharing28AskToAirDropSenderController_nearbyDeviceCountChangedHandler);
  *v2 = 0;
  v2[1] = 0;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Sharing28AskToAirDropSenderController_didStopHandler);
  *v3 = 0;
  v3[1] = 0;

  result = (_TtC7Sharing28AskToAirDropSenderController *)sub_1A2AE3C58();
  __break(1u);
  return result;
}

- (_TtC7Sharing28AskToAirDropSenderController)initWithQueue:(id)a3
{
  id v3;
  _TtC7Sharing28AskToAirDropSenderController *v4;

  v3 = a3;
  v4 = (_TtC7Sharing28AskToAirDropSenderController *)sub_1A2A445A8(v3);

  return v4;
}

- (void)startAs:(id)a3
{
  _TtC7Sharing28AskToAirDropSenderController *v3;

  v3 = self;
  sub_1A2A448A8();

}

- (void)start
{
  _TtC7Sharing28AskToAirDropSenderController *v2;

  v2 = self;
  sub_1A2A448A8();

}

- (void)stop
{
  _TtC7Sharing28AskToAirDropSenderController *v2;

  v2 = self;
  AskToAirDropSenderController.stop()();

}

- (void)fetchPrivacyPromptInformationWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _TtC7Sharing28AskToAirDropSenderController *v12;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECEFB6D0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = sub_1A2AE36E8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = sub_1A2A453A0;
  v11[6] = v9;
  v12 = self;
  swift_retain();
  sub_1A2974504((uint64_t)v7, (uint64_t)&unk_1EE67D6E8, (uint64_t)v11);
  swift_release();
  swift_release();

}

- (void)fetchSharingNameWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC7Sharing28AskToAirDropSenderController *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECEFB6D0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1A2AE36E8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EE67D6B0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EE67D6C0;
  v12[5] = v11;
  v13 = self;
  sub_1A2A443B4((uint64_t)v7, (uint64_t)&unk_1EE67D6D0, (uint64_t)v12);
  swift_release();
}

- (void).cxx_destruct
{

  sub_1A297CC78(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC7Sharing28AskToAirDropSenderController_nearbyDeviceCountChangedHandler));
  sub_1A297CC78(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC7Sharing28AskToAirDropSenderController_didStopHandler));
  swift_release();
}

@end
