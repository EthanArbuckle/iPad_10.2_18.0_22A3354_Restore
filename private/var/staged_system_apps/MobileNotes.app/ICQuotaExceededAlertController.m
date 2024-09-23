@implementation ICQuotaExceededAlertController

- (NSString)accountID
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->accountID[OBJC_IVAR___ICQuotaExceededAlertController_accountID];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (NSDate)date
{
  return (NSDate *)Date._bridgeToObjectiveC()().super.isa;
}

- (CKRecordID)recordID
{
  return (CKRecordID *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR___ICQuotaExceededAlertController_recordID));
}

- (BOOL)didShowForRecord
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___ICQuotaExceededAlertController_didShowForRecord);
}

- (void)setDidShowForRecord:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  ICQuotaExceededAlertController *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v3 = a3;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___ICQuotaExceededAlertController_didShowForRecord) = a3;
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICQuotaExceededAlertController_recordID);
  v5 = self;
  v8 = objc_msgSend(v4, "recordName");
  if (!v8)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0);
    v7 = v6;
    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  objc_msgSend((id)objc_opt_self(ICNote), "setDidShowExceededStorageQuotaAlert:forNoteWithIdentifier:", v3, v8);

}

- (BOOL)ignoresDebouncing
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___ICQuotaExceededAlertController_ignoresDebouncing);
}

- (void)setIgnoresDebouncing:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___ICQuotaExceededAlertController_ignoresDebouncing) = a3;
}

- (NSDate)lastShowDate
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  Class isa;
  _BYTE v12[24];

  v3 = sub_100012E18((uint64_t *)&unk_1005D7B20);
  __chkstk_darwin(v3);
  v5 = &v12[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = (char *)self + OBJC_IVAR___ICQuotaExceededAlertController_lastShowDate;
  swift_beginAccess(v6, v12, 0, 0);
  sub_1001CE8D4((uint64_t)v6, (uint64_t)v5);
  v7 = type metadata accessor for Date(0);
  v8 = *(_QWORD *)(v7 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSDate *)isa;
}

- (void)setLastShowDate:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  ICQuotaExceededAlertController *v10;
  uint64_t v11;

  v5 = sub_100012E18((uint64_t *)&unk_1005D7B20);
  __chkstk_darwin(v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v8 = type metadata accessor for Date(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = type metadata accessor for Date(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  sub_1001CD108((uint64_t)v7);

}

- (ICCloudContext)cloudContext
{
  return (ICCloudContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                   + OBJC_IVAR___ICQuotaExceededAlertController_cloudContext));
}

- (void)setCloudContext:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICQuotaExceededAlertController_cloudContext);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICQuotaExceededAlertController_cloudContext) = (Class)a3;
  v3 = a3;

}

- (NSManagedObjectContext)managedObjectContext
{
  return (NSManagedObjectContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR___ICQuotaExceededAlertController_managedObjectContext));
}

- (void)setManagedObjectContext:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICQuotaExceededAlertController_managedObjectContext);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICQuotaExceededAlertController_managedObjectContext) = (Class)a3;
  v3 = a3;

}

- (double)minimumLastShowDateInterval
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___ICQuotaExceededAlertController_minimumLastShowDateInterval);
}

- (void)setMinimumLastShowDateInterval:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR___ICQuotaExceededAlertController_minimumLastShowDateInterval) = a3;
}

- (ICQuotaExceededAlertController)initWithRecordID:(id)a3 accountID:(id)a4 date:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  ICQuotaExceededAlertController *v15;
  uint64_t v17;

  v8 = type metadata accessor for Date(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v14 = a3;
  v15 = (ICQuotaExceededAlertController *)sub_1001CE4A4(v14, v11, v13, (uint64_t)v10);

  return v15;
}

- (BOOL)showIfNeededFromWindow:(id)a3
{
  id v4;
  ICQuotaExceededAlertController *v5;
  char v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[5];
  uint64_t v12;

  v4 = a3;
  v5 = self;
  v6 = sub_1001CD34C();
  if ((v6 & 1) != 0)
  {
    v7 = swift_allocObject(&unk_10055CC80, 32, 7);
    *(_QWORD *)(v7 + 16) = v5;
    *(_QWORD *)(v7 + 24) = v4;
    v11[4] = sub_1001CE8CC;
    v12 = v7;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 1107296256;
    v11[2] = sub_100206734;
    v11[3] = &unk_10055CC98;
    v8 = _Block_copy(v11);
    v9 = v12;
    v4 = v4;
    v5 = v5;
    swift_release(v9);
    performBlockOnMainThread(v8);
    _Block_release(v8);
  }

  return v6 & 1;
}

- (id)makeAlert
{
  ICQuotaExceededAlertController *v2;
  id v3;

  v2 = self;
  v3 = sub_1001CDAFC();

  return v3;
}

- (ICQuotaExceededAlertController)init
{
  ICQuotaExceededAlertController *result;

  result = (ICQuotaExceededAlertController *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.QuotaExceededAlertController", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(_QWORD *)&self->accountID[OBJC_IVAR___ICQuotaExceededAlertController_accountID]);
  v3 = (char *)self + OBJC_IVAR___ICQuotaExceededAlertController_date;
  v4 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  sub_100012DDC((uint64_t)self + OBJC_IVAR___ICQuotaExceededAlertController_lastShowDate, (uint64_t *)&unk_1005D7B20);
  swift_bridgeObjectRelease(*(_QWORD *)&self->accountID[OBJC_IVAR___ICQuotaExceededAlertController_lastShowDateKey]);
}

@end
