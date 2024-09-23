@implementation PBFLegacyMigrationAnalyticsReporter

+ (void)recordWithEvent:(int64_t)a3 migrationInfo:(id)a4 duration:(double)a5 errorCode:(int64_t)a6
{
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[6];

  v9 = a4;
  LegacyMigrationEvent.analyticsIdentifier.getter(a3);
  v10 = (void *)sub_1CBB824A8();
  swift_bridgeObjectRelease();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v9;
  *(double *)(v11 + 24) = a5;
  *(_QWORD *)(v11 + 32) = a3;
  *(_QWORD *)(v11 + 40) = a6;
  v14[4] = sub_1CBB28F58;
  v14[5] = v11;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 1107296256;
  v14[2] = sub_1CBB28C1C;
  v14[3] = &block_descriptor_7_1;
  v12 = _Block_copy(v14);
  v13 = v9;
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v12);

}

- (PBFLegacyMigrationAnalyticsReporter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LegacyMigrationAnalyticsReporter();
  return -[PBFLegacyMigrationAnalyticsReporter init](&v3, sel_init);
}

@end
