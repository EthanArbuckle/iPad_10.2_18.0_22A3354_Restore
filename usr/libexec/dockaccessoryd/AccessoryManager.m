@implementation AccessoryManager

- (_TtC14dockaccessoryd16AccessoryManager)init
{
  return (_TtC14dockaccessoryd16AccessoryManager *)sub_1000BF9A8();
}

- (void)startDiscoveringAccessoryServers
{
  _TtC14dockaccessoryd16AccessoryManager *v2;

  v2 = self;
  sub_1000CAC18();

}

- (void)stopDiscoveringAccessoryServers
{
  _TtC14dockaccessoryd16AccessoryManager *v2;

  v2 = self;
  sub_1000CAC58();

}

- (void)deRegisterAccessoryWithIdentifier:(id)a3
{
  sub_1000CB298(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1000CADD4);
}

- (void)markNotifyingCharacteristicUpdatedForIdentifier:(id)a3
{
  sub_1000CB298(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1000CB280);
}

- (void)connectToBTLEAccessoryServer:(id)a3
{
  id v4;
  _TtC14dockaccessoryd16AccessoryManager *v5;

  v4 = a3;
  v5 = self;
  sub_1000D580C("HAP requested BLE connect, ignoring.");

}

- (void)disconnectFromBTLEAccessoryServer:(id)a3
{
  id v5;
  _TtC14dockaccessoryd16AccessoryManager *v6;

  v5 = a3;
  v6 = self;
  sub_1000CB354(a3);

}

- (void)setConnectionLatency:(int64_t)a3 forPeripheral:(id)a4
{
  id v7;
  _TtC14dockaccessoryd16AccessoryManager *v8;

  v7 = a4;
  v8 = self;
  sub_1000CB7D0(a3, a4);

}

- (id)cachedAccessoryForIdentifier:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _TtC14dockaccessoryd16AccessoryManager *v7;
  void *v8;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  v8 = (void *)sub_1000CB9F8(v4, v6);

  swift_bridgeObjectRelease(v6);
  return v8;
}

- (void)removeCachedAccessoryWithIdentifier:(id)a3
{
  sub_1000CB298(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1000CC5AC);
}

- (void)saveCacheToDisk:(id)a3
{
  id v5;
  _TtC14dockaccessoryd16AccessoryManager *v6;

  v5 = a3;
  v6 = self;
  sub_1000CCBD0(a3);

}

- (void)updateBroadcastKeyForIdentifer:(id)a3 key:(id)a4 keyUpdatedStateNumber:(id)a5 keyUpdatedTime:(double)a6
{
  id v7;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  id v13;
  _TtC14dockaccessoryd16AccessoryManager *v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  _TtC14dockaccessoryd16AccessoryManager *v18;

  v7 = a4;
  if (!a3)
  {
    v9 = 0;
    v11 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v17 = a5;
    v18 = self;
    v16 = 0xF000000000000000;
    goto LABEL_6;
  }
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  if (!v7)
    goto LABEL_5;
LABEL_3:
  v12 = v7;
  v13 = a5;
  v14 = self;
  v7 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(v7);
  v16 = v15;

LABEL_6:
  sub_1000D5914(v9, v11, "updateBroadcastKey(%s)");
  sub_10009E3A0((uint64_t)v7, v16);

  swift_bridgeObjectRelease(v11);
}

- (void)updateCachedStateForIdentifier:(id)a3 stateNumber:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  _TtC14dockaccessoryd16AccessoryManager *v10;

  if (a3)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = a4;
  v10 = self;
  sub_1000CD8E8(v6, v8, a4);

  swift_bridgeObjectRelease(v8);
}

- (void)pauseScans
{
  uint64_t v2;
  _TtC14dockaccessoryd16AccessoryManager *v3;

  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd16AccessoryManager__performingGeneralScan) = 0;
  v2 = qword_10026BC20;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_10026BC20, sub_1001A3078);
  sub_1000D5CB0();

}

- (BOOL)isPerformingGeneralScan
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd16AccessoryManager__performingGeneralScan);
}

- (BOOL)isPaired:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC14dockaccessoryd16AccessoryManager *v7;
  BOOL v8;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  v8 = sub_1000CDEC4(v4, v6);

  swift_bridgeObjectRelease(v6);
  return v8;
}

- (id)pairSetupSession:(id)a3 pairSetupType:(unint64_t)a4 enhancedEncryption:(BOOL)a5
{
  id v9;
  _TtC14dockaccessoryd16AccessoryManager *v10;
  void *v11;

  v9 = a3;
  v10 = self;
  v11 = sub_1000D5AE4(a3, a4, a5);
  swift_unknownObjectRetain(v11);

  return v11;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd16AccessoryManager_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_10009B2C0((uint64_t)self + OBJC_IVAR____TtC14dockaccessoryd16AccessoryManager_cachePath, &qword_10026BF70);

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC14dockaccessoryd16AccessoryManager_accessories));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC14dockaccessoryd16AccessoryManager_tokens));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14dockaccessoryd16AccessoryManager_firmwareUpdateManager));

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd16AccessoryManager_pairing));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd16AccessoryManager_pairingStateLock));

  v5 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd16AccessoryManager_dockStatus;
  v6 = type metadata accessor for DockStatus(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC14dockaccessoryd16AccessoryManager_dockSetupIdMap));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd16AccessoryManager_rssiTxn));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd16AccessoryManager_haptics));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14dockaccessoryd16AccessoryManager_deviceConnectionTimer));
}

@end
