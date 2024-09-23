@implementation SISignalStore

- (SISignalStore)init
{
  SISignalStore *result;

  SignalStore.init()();
  return result;
}

- (BOOL)logWithData:(id)a3 signalType:(id)a4 intentId:(id)a5 timestamp:(id)a6 error:(id *)a7
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  SISignalStore *v13;
  id *v15;

  v15 = a7;
  v8 = sub_1C057CBA4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C057D2C4();
  sub_1C057D2C4();
  sub_1C057CB68();
  swift_unknownObjectRetain();
  v13 = self;
  sub_1C04D33A4();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  return 1;
}

- (void).cxx_destruct
{
  sub_1C04D3CBC((uint64_t)self + OBJC_IVAR___SISignalStore_backingStore);
}

@end
