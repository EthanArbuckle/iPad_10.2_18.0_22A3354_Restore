@implementation AccessRecordObject#1inPAAccessReader._accessRecordsForReport(from:to:)

- (NSString)identifier
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A5DFF8D8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)accessorBundleID
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A5DFF8D8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)category
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)&self->record[OBJC_IVAR____TtCFE17PrivacyAccountingCSo14PAAccessReader23_accessRecordsForReportFzT4fromV10Foundation4Date2toS2__CSo12NSEnumeratorL_18AccessRecordObject_record
                                                                          + 24]);
}

- (int64_t)timing
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  int EnumCaseMultiPayload;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t);
  _TtCFE17PrivacyAccountingCSo14PAAccessReader23_accessRecordsForReportFzT4fromV10Foundation4Date2toS2__CSo12NSEnumeratorL_18AccessRecordObject *v14;
  uint64_t v15;

  v3 = type metadata accessor for AccessRecord.Timing(0);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self
     + OBJC_IVAR____TtCFE17PrivacyAccountingCSo14PAAccessReader23_accessRecordsForReportFzT4fromV10Foundation4Date2toS2__CSo12NSEnumeratorL_18AccessRecordObject_record;
  v8 = type metadata accessor for AccessRecord(0);
  sub_1A5DFEB20((uint64_t)&v7[*(int *)(v8 + 28)], (uint64_t)v6, type metadata accessor for AccessRecord.Timing);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_1A5DFEA20((uint64_t)v6, type metadata accessor for AccessRecord.Timing);
      return 2;
    }
    else
    {
      v11 = &v6[*(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE808DA0) + 48)];
      v12 = sub_1A5DFF884();
      v13 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v12 - 8) + 8);
      v14 = self;
      v13(v11, v12);
      v13(v6, v12);

      return 3;
    }
  }
  else
  {
    sub_1A5DFEA20((uint64_t)v6, type metadata accessor for AccessRecord.Timing);
    return 1;
  }
}

- (NSDate)startDate
{
  return (NSDate *)sub_1A5DF8E88(self, (uint64_t)a2, (void (*)(void))sub_1A5DF8D14);
}

- (NSDate)endDate
{
  return (NSDate *)sub_1A5DF8E88(self, (uint64_t)a2, (void (*)(void))sub_1A5DF8F50);
}

- (NSNumber)accessCount
{
  char *v2;
  uint64_t v3;
  id v4;
  char *v5;

  v2 = (char *)self
     + OBJC_IVAR____TtCFE17PrivacyAccountingCSo14PAAccessReader23_accessRecordsForReportFzT4fromV10Foundation4Date2toS2__CSo12NSEnumeratorL_18AccessRecordObject_record;
  v3 = type metadata accessor for AccessRecord(0);
  v4 = 0;
  v5 = &v2[*(int *)(v3 + 32)];
  if ((v5[8] & 1) == 0)
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithUnsignedInteger_, *(_QWORD *)v5);
  return (NSNumber *)v4;
}

- (_TtCFE17PrivacyAccountingCSo14PAAccessReader23_accessRecordsForReportFzT4fromV10Foundation4Date2toS2__CSo12NSEnumeratorL_18AccessRecordObject)init
{
  _TtCFE17PrivacyAccountingCSo14PAAccessReader23_accessRecordsForReportFzT4fromV10Foundation4Date2toS2__CSo12NSEnumeratorL_18AccessRecordObject *result;

  result = (_TtCFE17PrivacyAccountingCSo14PAAccessReader23_accessRecordsForReportFzT4fromV10Foundation4Date2toS2__CSo12NSEnumeratorL_18AccessRecordObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A5DFEA20((uint64_t)self+ OBJC_IVAR____TtCFE17PrivacyAccountingCSo14PAAccessReader23_accessRecordsForReportFzT4fromV10Foundation4Date2toS2__CSo12NSEnumeratorL_18AccessRecordObject_record, type metadata accessor for AccessRecord);
}

@end
