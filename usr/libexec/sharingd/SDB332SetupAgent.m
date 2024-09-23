@implementation SDB332SetupAgent

+ (_TtC16DaemoniOSLibrary16SDB332SetupAgent)shared
{
  if (qword_1007B4208 != -1)
    swift_once(&qword_1007B4208, sub_1004C5888);
  return (_TtC16DaemoniOSLibrary16SDB332SetupAgent *)(id)qword_1007D8590;
}

- (void)dealloc
{
  _TtC16DaemoniOSLibrary16SDB332SetupAgent *v2;
  __CFNotificationCenter *v3;
  objc_super v4;

  v2 = self;
  v3 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(v3, v2);

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for SDB332SetupAgent(0);
  -[SDXPCDaemon dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary16SDB332SetupAgent_orientationObserver));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary16SDB332SetupAgent_uiAgentConnection);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary16SDB332SetupAgent_systemMonitor));
  swift_bridgeObjectRelease(*(const char **)((char *)&self->super.super.isa
                                           + OBJC_IVAR____TtC16DaemoniOSLibrary16SDB332SetupAgent_peripheralsIConnectedTo));
  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary16SDB332SetupAgent_lastB332WeWantedToPair, &qword_1007B7280);

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary16SDB332SetupAgent_powerSourceMonitor));
  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary16SDB332SetupAgent_lastAccessoryDetachTimestamp, &qword_1007C4330);
  swift_bridgeObjectRelease(*(const char **)((char *)&self->super._xpcListener
                                           + OBJC_IVAR____TtC16DaemoniOSLibrary16SDB332SetupAgent_lastAttachedAccessorySerialNum));
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary16SDB332SetupAgent_sessionState));
}

- (_TtC16DaemoniOSLibrary16SDB332SetupAgent)init
{
  return (_TtC16DaemoniOSLibrary16SDB332SetupAgent *)sub_1004C6844();
}

- (void)activate
{
  _TtC16DaemoniOSLibrary16SDB332SetupAgent *v2;

  v2 = self;
  sub_1004C6E4C();

}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4;
  _TtC16DaemoniOSLibrary16SDB332SetupAgent *v5;

  v4 = a3;
  v5 = self;
  sub_1004F082C((uint64_t)&unk_10072C618, (uint64_t)sub_1004F45D8, (uint64_t)&unk_10072C630);

}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  _TtC16DaemoniOSLibrary16SDB332SetupAgent *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_1004E5E34(v6, (uint64_t)a4);

}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4;
  _TtC16DaemoniOSLibrary16SDB332SetupAgent *v5;

  v4 = a3;
  v5 = self;
  sub_1004F0A18();

}

- (void)pairTapped
{
  _TtC16DaemoniOSLibrary16SDB332SetupAgent *v2;

  v2 = self;
  sub_1004E6398();

}

- (void)showEducationUIIfNecessary
{
  _TtC16DaemoniOSLibrary16SDB332SetupAgent *v2;

  v2 = self;
  sub_1004F082C((uint64_t)&unk_10072C578, (uint64_t)sub_1004F4590, (uint64_t)&unk_10072C590);

}

- (NSString)machServiceName
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (NSXPCInterface)exportedInterface
{
  return (NSXPCInterface *)objc_msgSend((id)objc_opt_self(NSXPCInterface), "interfaceWithProtocol:", &OBJC_PROTOCOL___SDB332AgentProtocol);
}

- (NSXPCInterface)remoteObjectInterface
{
  return (NSXPCInterface *)(id)sub_1004F0C84();
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  id v4;
  _TtC16DaemoniOSLibrary16SDB332SetupAgent *v5;
  char v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1004F0E0C(v4);

  return v6 & 1;
}

- (void)connectionEstablished:(id)a3
{
  id v4;
  _TtC16DaemoniOSLibrary16SDB332SetupAgent *v5;

  v4 = a3;
  v5 = self;
  sub_1004E68C8(v4);

}

- (void)connectionInvalidated:(id)a3
{
  id v4;
  _TtC16DaemoniOSLibrary16SDB332SetupAgent *v5;

  v4 = a3;
  v5 = self;
  sub_1004E6CBC(v4);

}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4;
  _TtC16DaemoniOSLibrary16SDB332SetupAgent *v5;

  v4 = a3;
  v5 = self;
  sub_1004E7090(v4);

}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6;
  id v7;
  _TtC16DaemoniOSLibrary16SDB332SetupAgent *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1004F10F8(v7);

}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC16DaemoniOSLibrary16SDB332SetupAgent *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_1004F1298(v9);

}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC16DaemoniOSLibrary16SDB332SetupAgent *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_1004F1A04(v9);

}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v9;
  id v10;
  id v11;
  _TtC16DaemoniOSLibrary16SDB332SetupAgent *v12;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = self;
  sub_1004F1F5C(v9);

}

- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6
{
  id v10;
  id v11;
  id v12;
  _TtC16DaemoniOSLibrary16SDB332SetupAgent *v13;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = self;
  sub_1004F2270(v10, v11, a5);

}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  id v8;
  _QWORD *v9;
  _TtC16DaemoniOSLibrary16SDB332SetupAgent *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v11 = a5;
  v10 = self;
  sub_1004F2A68(v9);

}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  id v6;
  uint64_t (*v7)(char *, uint64_t, uint64_t);
  _TtC16DaemoniOSLibrary16SDB332SetupAgent *v8;

  v6 = a3;
  v7 = (uint64_t (*)(char *, uint64_t, uint64_t))a4;
  v8 = self;
  sub_1004E794C(v6, v7);

}

- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4
{
  id v6;
  id v7;
  _TtC16DaemoniOSLibrary16SDB332SetupAgent *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1004E8EF0((uint64_t)v6, v7);

}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6;
  _TtC16DaemoniOSLibrary16SDB332SetupAgent *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_1004F2FE8(v6);

}

- (void)resetUIUpdatesFlagWithUndimScreen:(BOOL)a3
{
  _TtC16DaemoniOSLibrary16SDB332SetupAgent *v4;

  v4 = self;
  sub_1004E9A40(a3);

}

- (void)blePairing:(id)a3 accessoryAttached:(id)a4 blePairingUUID:(id)a5 accInfoDict:(id)a6 supportedPairTypes:(id)a7
{
  uint64_t v12;
  const char *v13;
  const char *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _TtC16DaemoniOSLibrary16SDB332SetupAgent *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  const char *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;

  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = v13;
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = self;
  v20 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v22 = v21;

  v23 = (const char *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v17, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v24 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v18);
  v26 = v25;

  sub_1004F31DC(v12, v14, v20, v22, v23, v24, v26);
  sub_100225AB4(v24, v26);
  swift_bridgeObjectRelease(v23);
  sub_100225AB4(v20, v22);

  swift_bridgeObjectRelease(v14);
}

- (void)blePairing:(id)a3 accessoryDetached:(id)a4 blePairingUUID:(id)a5
{
  uint64_t v8;
  const char *v9;
  const char *v10;
  id v11;
  id v12;
  _TtC16DaemoniOSLibrary16SDB332SetupAgent *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = v9;
  v11 = a3;
  v12 = a5;
  v13 = self;
  v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = v15;

  sub_1004F3434(v8, v10, v14, v16);
  sub_100225AB4(v14, v16);

  swift_bridgeObjectRelease(v10);
}

- (void)blePairingStateUpdate:(id)a3 validMask:(unsigned int)a4 btRadioOn:(BOOL)a5 pairingState:(int)a6 pairingModeOn:(BOOL)a7 accessory:(id)a8 blePairingUUID:(id)a9
{
  id v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _TtC16DaemoniOSLibrary16SDB332SetupAgent *v19;

  v14 = a3;
  v15 = a9;
  v19 = self;
  v16 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a9);
  v18 = v17;

  sub_1004F3650(a4, a5, a6, a7);
  sub_100225AB4(v16, v18);

}

- (void)blePairingInfoUpdate:(id)a3 pairType:(int)a4 pairInfoList:(id)a5 accessory:(id)a6 blePairingUUID:(id)a7
{
  const char *v10;
  id v11;
  id v12;
  _TtC16DaemoniOSLibrary16SDB332SetupAgent *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;

  v10 = (const char *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, (char *)&type metadata for Any + 8);
  v11 = a3;
  v12 = a7;
  v13 = self;
  v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a7);
  v16 = v15;

  sub_1004F3854(v10);
  sub_100225AB4(v14, v16);

  swift_bridgeObjectRelease(v10);
}

- (void)blePairingDataUpdate:(id)a3 pairType:(int)a4 pairData:(id)a5 accessory:(id)a6 blePairingUUID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _TtC16DaemoniOSLibrary16SDB332SetupAgent *v22;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v22 = self;
  v16 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v18 = v17;

  v19 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v15);
  v21 = v20;

  sub_1004F3A4C(a4, v16, v18);
  sub_100225AB4(v19, v21);
  sub_100225AB4(v16, v18);

}

- (void)startScanning
{
  _TtC16DaemoniOSLibrary16SDB332SetupAgent *v2;

  v2 = self;
  sub_1004ED178();

}

- (void)stopScanning
{
  _TtC16DaemoniOSLibrary16SDB332SetupAgent *v2;

  v2 = self;
  sub_1004ED494();

}

- (void)startBatteryScannerForPeripheral:(id)a3
{
  id v4;
  _TtC16DaemoniOSLibrary16SDB332SetupAgent *v5;

  v4 = a3;
  v5 = self;
  sub_1004ED688(v4);

}

- (void)stopBatteryScanner
{
  _TtC16DaemoniOSLibrary16SDB332SetupAgent *v2;

  v2 = self;
  sub_1004EF254();

}

- (void)enableBluetoothTapped
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  id v5;
  id v6;

  if (qword_1007B41F0 != -1)
    swift_once(&qword_1007B41F0, sub_1004C46F4);
  v0 = type metadata accessor for Logger(0);
  v1 = sub_100221DF8(v0, (uint64_t)qword_1007C37A0);
  v2 = Logger.logObject.getter(v1);
  v3 = static os_log_type_t.default.getter(v2);
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "enableBluetoothTapped", v4, 2u);
    swift_slowDealloc(v4, -1, -1);
  }

  v5 = objc_msgSend((id)objc_opt_self(SDStatusMonitor), "sharedMonitor");
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "setBluetoothEnabled:", 1);

  }
  else
  {
    __break(1u);
  }
}

@end
