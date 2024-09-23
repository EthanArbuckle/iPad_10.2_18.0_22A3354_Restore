@implementation PDRRegistry_Impl

- (PDRRegistry_Impl)init
{
  return (PDRRegistry_Impl *)Registry_Impl.init()();
}

+ (BOOL)supportsWatch
{
  if (one-time initialization token for supportWatch != -1)
    swift_once();
  return static RegistryCrux.supportWatch;
}

- (BOOL)started
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR___PDRRegistry_Impl_started_);
}

- (int64_t)status
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR___PDRRegistry_Impl_status_);
}

- (OS_dispatch_queue)callbackQueue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Registry_Impl();
  return -[PDRRegistry callbackQueue](&v3, sel_callbackQueue);
}

- (void)setCallbackQueue:(id)a3
{
  objc_super v4;

  if (*((_BYTE *)&self->super.super.isa + OBJC_IVAR___PDRRegistry_Impl_amSingleton) == 1)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)type metadata accessor for Registry_Impl();
    -[PDRRegistry setCallbackQueue:](&v4, sel_setCallbackQueue_, a3);
  }
}

- (int64_t)compatibilityState
{
  PDRRegistry_Impl *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  Registry_Impl.computeCompatibilityState()();
  v4 = v3;

  return v4;
}

+ (id)sharedInstance
{
  if (one-time initialization token for sharedInstance_ != -1)
    swift_once();
  return (id)static Registry_Impl.sharedInstance_;
}

- (void)start
{
  PDRRegistry_Impl *v2;

  v2 = self;
  Registry_Impl.start()();

}

- (void)stop
{
  PDRRegistry_Impl *v2;

  v2 = self;
  Registry_Impl.stop()();

}

- (id)getDevicesExcluding:(unint64_t)a3
{
  Class isa;

  specialized Registry_Impl.getDevicesExcluding(_:)(a3);
  type metadata accessor for PDRDevice();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)getActivePairedDeviceIncludingAltAccount
{
  PDRRegistry_Impl *v2;
  void *v3;
  void *v4;

  v2 = self;
  Registry_Impl.getActivePairedDeviceIncludingAltAccount()(7);
  v4 = v3;

  return v4;
}

- (id)getActivePairedDeviceExcludingAltAccount
{
  PDRRegistry_Impl *v2;
  void *v3;
  void *v4;

  v2 = self;
  Registry_Impl.getActivePairedDeviceIncludingAltAccount()(39);
  v4 = v3;

  return v4;
}

- (id)getActiveDevice
{
  PDRRegistry_Impl *v2;
  void *v3;
  void *v4;

  v2 = self;
  Registry_Impl.getActivePairedDeviceIncludingAltAccount()(6);
  v4 = v3;

  return v4;
}

- (id)pairingStorePath
{
  PDRRegistry_Impl *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = self;
  v3 = -[PDRRegistry_Impl getActiveDevice](v2, sel_getActiveDevice);
  if (v3
    && (v4 = v3, v5 = objc_msgSend(v3, sel_pairingStorePath), v4, v5))
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = v7;

    v9 = (void *)MEMORY[0x2494F7BCC](v6, v8);
    swift_bridgeObjectRelease();
  }
  else
  {

    v9 = 0;
  }
  return v9;
}

- (id)pairingID
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  PDRRegistry_Impl *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  Class isa;
  uint64_t v14;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  v7 = -[PDRRegistry_Impl getActiveDevice](v6, sel_getActiveDevice);
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(v7, sel_pairingID);

    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    v10 = type metadata accessor for UUID();
    v11 = *(_QWORD *)(v10 - 8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v5, 0, 1, v10);
  }
  else
  {
    v10 = type metadata accessor for UUID();
    v11 = *(_QWORD *)(v10 - 8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v5, 1, 1, v10);
  }

  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v5, 1, v10) != 1)
  {
    isa = UUID._bridgeToObjectiveC()().super.isa;
    type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v5, v10);
  }
  return isa;
}

- (BOOL)isPaired
{
  PDRRegistry_Impl *v2;
  id v3;
  unint64_t v4;
  uint64_t v5;

  v2 = self;
  v3 = -[PDRRegistry_Impl getDevicesExcluding:](v2, sel_getDevicesExcluding_, 1);
  type metadata accessor for PDRDevice();
  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = _CocoaArrayWrapper.endIndex.getter();

    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);

  }
  swift_bridgeObjectRelease();
  return v5 != 0;
}

- (void)addDelegate:(id)a3
{
  PDRRegistry_Impl *v4;

  swift_unknownObjectRetain();
  v4 = self;
  Registry_Impl.add(delegate:)();
  swift_unknownObjectRelease();

}

- (BOOL)removeDelegate:(id)a3
{
  PDRRegistry_Impl *v5;
  char v6;

  swift_unknownObjectRetain();
  v5 = self;
  v6 = Registry_Impl.remove(delegate:)((uint64_t)a3);
  swift_unknownObjectRelease();

  return v6 & 1;
}

- (int64_t)switchIndex
{
  PDRRegistry_Impl *v2;
  Swift::Int v3;

  v2 = self;
  if (-[PDRRegistry_Impl isPaired](v2, sel_isPaired))
  {
    if (one-time initialization token for instance != -1)
      swift_once();
    swift_retain();
    v3 = RegistryCrux.switchIndex()();

    swift_release();
    return v3;
  }
  else
  {

    return 0;
  }
}

- (void)getSwitchEventsAfterIndex:(unsigned int)a3 process:(id)a4
{
  void *v6;
  PDRRegistry_Impl *v7;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  specialized Registry_Impl.getSwitchEvents(after:process:)(a3, (Class)v7, (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (id)deviceForBluetoothID:(id)a3
{
  return @objc Registry_Impl.device(forBluetoothID:)(self, (uint64_t)a2, (uint64_t)a3, closure #1 in Registry_Impl.device(forBluetoothID:)partial apply);
}

- (id)deviceForPairingID:(id)a3
{
  return @objc Registry_Impl.device(forBluetoothID:)(self, (uint64_t)a2, (uint64_t)a3, closure #1 in Registry_Impl.device(forPairingID:)partial apply);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

- (id)unpairWithDevice:(id)a3 withOptions:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  PDRRegistry_Impl *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v6 = type metadata accessor for UUID();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = one-time initialization token for instance;
  v11 = a3;
  v12 = self;
  if (v10 != -1)
    swift_once();
  swift_retain();
  v13 = objc_msgSend(v11, sel_pairingID);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  v14 = RegistryCrux.unpair(pairingID:options:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  swift_bridgeObjectRelease();
  if (v14)
  {
    v15 = (void *)_convertErrorToNSError(_:)();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)failsafeUnpairWithOptions:(id)a3
{
  uint64_t v4;
  PDRRegistry_Impl *v5;
  void *v6;
  void *v7;

  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = one-time initialization token for instance;
  v5 = self;
  if (v4 != -1)
    swift_once();
  swift_retain();
  v6 = RegistryCrux.failsafeUnpair(options:)();

  swift_bridgeObjectRelease();
  swift_release();
  if (v6)
  {
    v7 = (void *)_convertErrorToNSError(_:)();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)setActivePairedDevice:(id)a3 resultsCallback:(id)a4
{
  void *v6;
  id v7;
  PDRRegistry_Impl *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  specialized Registry_Impl.setActive(device:results:)(v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (int64_t)lastSyncSwitchIndex
{
  uint64_t v2;
  PDRRegistry_Impl *v3;
  Swift::Int v4;

  v2 = one-time initialization token for instance;
  v3 = self;
  if (v2 != -1)
    swift_once();
  swift_retain();
  v4 = RegistryCrux.lastSyncSwitchIndex()();

  swift_release();
  return v4;
}

- (int64_t)migrationCountForPairingID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  PDRRegistry_Impl *v9;
  int64_t v10;
  uint64_t v12;

  v4 = type metadata accessor for UUID();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = one-time initialization token for instance;
  v9 = self;
  if (v8 != -1)
    swift_once();
  swift_retain();
  v10 = RegistryCrux.migrationCount(pairingID:)();

  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v10;
}

- (void)waitForPairingExtendedMetadataForAdvertisedName:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  PDRRegistry_Impl *v9;

  v5 = _Block_copy(a4);
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;
  _Block_copy(v5);
  v9 = self;
  specialized Registry_Impl.waitForPairingExtendedMetadata(advertisedName:results:)(v6, v8, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)completeRTCPairingMetricForMetricID:(id)a3 withSuccess:(id)a4
{
  void (**v5)(void *, _QWORD, void *);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  PDRRegistry_Impl *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = (void (**)(void *, _QWORD, void *))_Block_copy(a4);
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;
  v9 = one-time initialization token for instance;
  v10 = self;
  if (v9 != -1)
    swift_once();
  swift_retain();
  v11 = RegistryCrux.completeRTCPairingMetric(metricID:)(v6, v8);
  v13 = v12;
  swift_release();
  if (v13)
    v14 = (void *)_convertErrorToNSError(_:)();
  else
    v14 = 0;
  v5[2](v5, v11 & 1, v14);

  _Block_release(v5);
  swift_bridgeObjectRelease();
}

- (void)pairingClientSetAltAccountName:(id)a3 altDSID:(id)a4 forDevice:(id)a5 completion:(id)a6
{
  void (**v8)(void *, void *);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  PDRRegistry_Impl *v17;
  void *v18;
  void *v19;

  v8 = (void (**)(void *, void *))_Block_copy(a6);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = v10;
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v14 = v13;
  v15 = one-time initialization token for instance;
  v16 = a5;
  v17 = self;
  if (v15 != -1)
    swift_once();
  swift_retain();
  v18 = RegistryCrux.pairingClientSetAltAccount(name:altDSID:device:)(v9, v11, v12, v14, v16);
  swift_release();
  if (v18)
    v19 = (void *)_convertErrorToNSError(_:)();
  else
    v19 = 0;
  v8[2](v8, v19);

  _Block_release(v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (int64_t)maxPairedDeviceCount
{
  return 5;
}

- (int64_t)maxTinkerPairedDeviceCount
{
  return 5;
}

@end
