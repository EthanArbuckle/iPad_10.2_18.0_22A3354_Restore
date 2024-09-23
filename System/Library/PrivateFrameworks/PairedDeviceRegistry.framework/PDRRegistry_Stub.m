@implementation PDRRegistry_Stub

- (PDRRegistry_Stub)init
{
  return (PDRRegistry_Stub *)Registry_Stub.init()();
}

- (BOOL)started
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR___PDRRegistry_Stub_started_);
}

- (int64_t)status
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR___PDRRegistry_Stub_status_);
}

- (OS_dispatch_queue)callbackQueue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Registry_Stub();
  return -[PDRRegistry callbackQueue](&v3, sel_callbackQueue);
}

- (void)setCallbackQueue:(id)a3
{
  objc_super v4;

  if (*((_BYTE *)&self->super.super.isa + OBJC_IVAR___PDRRegistry_Stub_amSingleton) == 1)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)type metadata accessor for Registry_Stub();
    -[PDRRegistry setCallbackQueue:](&v4, sel_setCallbackQueue_, a3);
  }
}

- (int64_t)compatibilityState
{
  return 0;
}

+ (id)sharedInstance
{
  if (one-time initialization token for sharedInstance_ != -1)
    swift_once();
  return (id)static Registry_Stub.sharedInstance_;
}

+ (BOOL)supportsPairedDevice
{
  return 0;
}

- (void)start
{
  if (*((_BYTE *)&self->super.super.isa + OBJC_IVAR___PDRRegistry_Stub_started_) == 1)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    *((_BYTE *)&self->super.super.isa + OBJC_IVAR___PDRRegistry_Stub_started_) = 1;
  }
}

- (void)stop
{
  Registry_Stub.stop()();
}

- (id)getDevicesExcluding:(unint64_t)a3
{
  type metadata accessor for PDRDevice();
  return Array._bridgeToObjectiveC()().super.isa;
}

- (id)getActivePairedDeviceIncludingAltAccount
{
  return 0;
}

- (id)getActivePairedDeviceExcludingAltAccount
{
  return 0;
}

- (id)getActiveDevice
{
  return 0;
}

- (id)pairingStorePath
{
  return 0;
}

- (id)pairingID
{
  return 0;
}

- (BOOL)isPaired
{
  return 0;
}

- (void)addDelegate:(id)a3
{
  PDRRegistry_Stub *v4;

  swift_unknownObjectRetain();
  v4 = self;
  Registry_Stub.add(delegate:)();
  swift_unknownObjectRelease();

}

- (BOOL)removeDelegate:(id)a3
{
  PDRRegistry_Stub *v5;
  char v6;

  swift_unknownObjectRetain();
  v5 = self;
  v6 = Registry_Stub.remove(delegate:)((uint64_t)a3);
  swift_unknownObjectRelease();

  return v6 & 1;
}

- (int64_t)switchIndex
{
  return 0;
}

- (void)getSwitchEventsAfterIndex:(unsigned int)a3 process:(id)a4
{
  void *v4;

  v4 = _Block_copy(a4);
  _Block_release(v4);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

- (id)unpairWithDevice:(id)a3 withOptions:(id)a4
{
  return 0;
}

- (id)failsafeUnpairWithOptions:(id)a3
{
  return 0;
}

- (void)setActivePairedDevice:(id)a3 resultsCallback:(id)a4
{
  _QWORD *v6;
  void (*v7)(_QWORD *, _QWORD, _QWORD);
  id v8;
  PDRRegistry_Stub *v9;

  v6 = _Block_copy(a4);
  v7 = (void (*)(_QWORD *, _QWORD, _QWORD))v6[2];
  v8 = a3;
  v9 = self;
  v7(v6, 0, 0);
  _Block_release(v6);

}

- (int64_t)lastSyncSwitchIndex
{
  return 0;
}

- (int64_t)migrationCountForPairingID:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v3 = type metadata accessor for UUID();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return 0;
}

- (void)pairingClientSetAltAccountName:(id)a3 altDSID:(id)a4 forDevice:(id)a5 completion:(id)a6
{
  _QWORD *v8;
  void (*v9)(_QWORD *, _QWORD);
  id v10;
  PDRRegistry_Stub *v11;

  v8 = _Block_copy(a6);
  v9 = (void (*)(_QWORD *, _QWORD))v8[2];
  v10 = a5;
  v11 = self;
  v9(v8, 0);
  _Block_release(v8);

}

- (int64_t)maxPairedDeviceCount
{
  return 0;
}

- (int64_t)maxTinkerPairedDeviceCount
{
  return 0;
}

@end
