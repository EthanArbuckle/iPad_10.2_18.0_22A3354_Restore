@implementation GameDaemonTTR

- (_TtC14GameDaemonCore13GameDaemonTTR)initWithClientProxyBundleIdentifier:(id)a3 localPlayer:(id)a4
{
  uint64_t v5;
  void *v6;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  return (_TtC14GameDaemonCore13GameDaemonTTR *)GameDaemonTTR.init(clientProxyBundleIdentifier:localPlayer:)(v5, v6, a4);
}

- (id)getURLForNewMultiplayerRadarWithCallbackIdentifier:(id)a3 descriptionAddition:(id)a4
{
  id v4;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _TtC14GameDaemonCore13GameDaemonTTR *v11;
  Swift::String_optional v12;
  Swift::String_optional v13;
  void *object;
  uint64_t v15;
  uint64_t v16;
  NSString v17;
  uint64_t v18;

  v4 = a4;
  if (a3)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v8 = v7;
    if (v4)
    {
LABEL_3:
      v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
      v4 = v10;
      goto LABEL_6;
    }
  }
  else
  {
    v6 = 0;
    v8 = 0;
    if (a4)
      goto LABEL_3;
  }
  v9 = 0;
LABEL_6:
  v11 = self;
  v12.value._countAndFlagsBits = v6;
  v12.value._object = v8;
  v13.value._countAndFlagsBits = v9;
  v13.value._object = v4;
  object = GameDaemonTTR.getURLForNewMultiplayerRadar(callbackIdentifier:descriptionAddition:)(v12, v13).value._object;

  swift_bridgeObjectRelease(v4, v15);
  swift_bridgeObjectRelease(v8, v16);
  if (object)
  {
    v17 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(object, v18);
  }
  else
  {
    v17 = 0;
  }
  return v17;
}

- (id)getURLForExistingMultiplayerRadarWithRadarID:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC14GameDaemonCore13GameDaemonTTR *v7;
  Swift::String v8;
  void *object;
  uint64_t v10;
  NSString v11;
  uint64_t v12;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  object = GameDaemonTTR.getURLForExistingMultiplayerRadar(radarID:)(v8).value._object;

  swift_bridgeObjectRelease(v6, v10);
  if (object)
  {
    v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(object, v12);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (_TtC14GameDaemonCore13GameDaemonTTR)init
{
  GameDaemonTTR.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->clientProxyBundleIdentifier[OBJC_IVAR____TtC14GameDaemonCore13GameDaemonTTR_clientProxyBundleIdentifier], a2);

}

@end
