@implementation PDRMigrator_Impl

- (id)setMigrationConsented:(BOOL)a3 forDevice:(id)a4
{
  return 0;
}

- (id)beginMigrationWithDevice:(id)a3 passcode:(id)a4
{
  return 0;
}

- (id)migrationConsentRequestData
{
  return Data._bridgeToObjectiveC()().super.isa;
}

- (id)devicesFromMigrationConsentRequestData:(id)a3
{
  id v4;
  PDRMigrator_Impl *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v4 = a3;
  v5 = self;
  v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;

  outlined consume of Data._Representation(v6, v8);
  type metadata accessor for PDRDevice();
  return Array._bridgeToObjectiveC()().super.isa;
}

- (BOOL)migrationIsAvailable
{
  return 0;
}

- (NSArray)migratableDevices
{
  type metadata accessor for PDRDevice();
  return (NSArray *)Array._bridgeToObjectiveC()().super.isa;
}

- (id)migrationDataPreRestoreForConsentedDevices:(id)a3
{
  return Data._bridgeToObjectiveC()().super.isa;
}

- (void)ingestPostRestoreMigrationDataForConsentedDevices:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  PDRMigrator_Impl *v8;

  v4 = a3;
  v8 = self;
  v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = v6;

  outlined consume of Data._Representation(v5, v7);
}

- (NSString)lastMigrationRequestPhoneName
{
  return (NSString *)(id)MEMORY[0x2494F7BCC](0, 0xE000000000000000);
}

- (void)isPhoneReadyToMigrateDevice:(id)a3 withCompletion:(id)a4
{
  _QWORD *v6;
  void (*v7)(_QWORD *, _QWORD, _QWORD);
  id v8;
  PDRMigrator_Impl *v9;

  v6 = _Block_copy(a4);
  v7 = (void (*)(_QWORD *, _QWORD, _QWORD))v6[2];
  v8 = a3;
  v9 = self;
  v7(v6, 0, 0);
  _Block_release(v6);

}

- (id)beginMigrationWithDevice:(id)a3
{
  return 0;
}

- (PDRMigrator_Impl)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Migrator_Impl();
  return -[PDRMigrator_Impl init](&v3, sel_init);
}

@end
