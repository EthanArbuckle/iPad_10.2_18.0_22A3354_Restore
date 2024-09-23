@implementation AskToAirDropReceiverController

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_queue));
}

- (BOOL)isNearbyDeviceClose
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_isNearbyDeviceClose;
  swift_beginAccess();
  return *v2;
}

- (void)setIsNearbyDeviceClose:(BOOL)a3
{
  sub_1A2A4049C((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_isNearbyDeviceClose, &OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_nearbyDeviceCloseChangedHandler);
}

- (BOOL)hasPendingOrActiveConnections
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_hasPendingOrActiveConnections;
  swift_beginAccess();
  return *v2;
}

- (void)setHasPendingOrActiveConnections:(BOOL)a3
{
  sub_1A2A4049C((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_hasPendingOrActiveConnections, &OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_pendingOrActiveConnectionsChangedHandler);
}

- (BOOL)isLegacyMode
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_isLegacyMode;
  swift_beginAccess();
  return *v2;
}

- (void)setIsLegacyMode:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_isLegacyMode;
  swift_beginAccess();
  *v4 = a3;
}

- (NSString)nearbyDevicesDisplayName
{
  return (NSString *)sub_1A2A41D98();
}

- (void)setNearbyDevicesDisplayName:(id)a3
{
  sub_1A2A41E64((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_nearbyDevicesDisplayName);
}

- (int64_t)connectionState
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_connectionState);
  swift_beginAccess();
  return *v2;
}

- (void)setConnectionState:(int64_t)a3
{
  _TtC7Sharing30AskToAirDropReceiverController *v4;

  v4 = self;
  sub_1A2A40790(a3);

}

- (id)stateChangedHandler
{
  return sub_1A2A3DB30((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_stateChangedHandler, (uint64_t)sub_1A29FD800, (uint64_t)&block_descriptor_99);
}

- (void)setStateChangedHandler:(id)a3
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
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_stateChangedHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1A297CC78(v7);
}

- (id)connectionStateChangedHandler
{
  return sub_1A2A3DB30((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_connectionStateChangedHandler, (uint64_t)sub_1A29FD800, (uint64_t)&block_descriptor_92);
}

- (void)setConnectionStateChangedHandler:(id)a3
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
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_connectionStateChangedHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1A297CC78(v7);
}

- (id)pendingOrActiveConnectionsChangedHandler
{
  return sub_1A2A3DB30((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_pendingOrActiveConnectionsChangedHandler, (uint64_t)sub_1A29FD800, (uint64_t)&block_descriptor_85);
}

- (void)setPendingOrActiveConnectionsChangedHandler:(id)a3
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
  v6 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_pendingOrActiveConnectionsChangedHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1A297CC78(v7);
}

- (id)nearbyDeviceCloseChangedHandler
{
  return sub_1A2A3DB30((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_nearbyDeviceCloseChangedHandler, (uint64_t)sub_1A29FD800, (uint64_t)&block_descriptor_78);
}

- (void)setNearbyDeviceCloseChangedHandler:(id)a3
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
    v4 = sub_1A2A1B708;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_nearbyDeviceCloseChangedHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1A297CC78(v7);
}

- (id)errorHandler
{
  return sub_1A2A3DB30((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_errorHandler, (uint64_t)sub_1A2A3D2FC, (uint64_t)&block_descriptor_72);
}

- (void)setErrorHandler:(id)a3
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
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_errorHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1A297CC78(v7);
}

- (BOOL)hasSeenPrivacyPrompt
{
  return sub_1A2A4159C(self);
}

- (void)setHasSeenPrivacyPrompt:(BOOL)a3
{
  sub_1A2A41758(self, (uint64_t)a2, a3);
}

- (NSArray)connectedNearbyDeviceNames
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A2AE3610();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setConnectedNearbyDeviceNames:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  v4 = sub_1A2AE361C();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_connectedNearbyDeviceNames);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSString)sharingName
{
  return (NSString *)sub_1A2A41D98();
}

- (void)setSharingName:(id)a3
{
  sub_1A2A41E64((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_sharingName);
}

- (_TtC7Sharing30AskToAirDropReceiverController)init
{
  AskToAirDropReceiverController.init()();
}

- (_TtC7Sharing30AskToAirDropReceiverController)initWithQueue:(id)a3
{
  return (_TtC7Sharing30AskToAirDropReceiverController *)AskToAirDropReceiverController.init(queue:)(a3);
}

- (void)connectToAllNearbyDevices
{
  _TtC7Sharing30AskToAirDropReceiverController *v2;

  v2 = self;
  AskToAirDropReceiverController.connectToAllNearbyDevices()();

}

- (void)disconnectFromAllNearbyDevices
{
  _TtC7Sharing30AskToAirDropReceiverController *v2;

  v2 = self;
  AskToAirDropReceiverController.disconnectFromAllNearbyDevices()();

}

- (void)fetchPrivacyPromptInformationWithCompletion:(id)a3
{
  sub_1A2A43904(self, (int)a2, a3, (uint64_t)&unk_1E48377D8, (uint64_t)sub_1A2A450D4, (void (*)(uint64_t, uint64_t))AskToAirDropReceiverController.fetchPrivacyPromptInformation(completion:));
}

- (void)fetchSharingNameWithCompletion:(id)a3
{
  sub_1A2A43904(self, (int)a2, a3, (uint64_t)&unk_1E48377B0, (uint64_t)sub_1A2A450D4, (void (*)(uint64_t, uint64_t))AskToAirDropReceiverController.fetchSharingName(completion:));
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  sub_1A297CC78(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_stateChangedHandler));
  sub_1A297CC78(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_connectionStateChangedHandler));
  sub_1A297CC78(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_pendingOrActiveConnectionsChangedHandler));
  sub_1A297CC78(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_nearbyDeviceCloseChangedHandler));
  sub_1A297CC78(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_errorHandler));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

@end
