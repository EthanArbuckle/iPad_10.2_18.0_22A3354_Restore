@implementation ICCallNoteCoordinator

+ (void)createNewCallNoteWithNoteID:(id)a3 recordingID:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  sub_100177E20(v7, v8, v9);

}

+ (void)callRecordingEndedWithNoteID:(id)a3 recordingID:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  sub_10017866C(v7, v8, v9);

}

- (ICCallNoteCoordinator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CallNoteCoordinator();
  return -[ICCallNoteCoordinator init](&v3, "init");
}

+ (void)importAndDeleteCallRecordingFilesIfNeededFromDirectory:(id)a3 managedObjectContext:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;

  v6 = sub_100012E18(&qword_1005CEFD0);
  __chkstk_darwin(v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v9 = type metadata accessor for URL(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    v10 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  v11 = a4;
  _s11MobileNotes19CallNoteCoordinatorC015importAndDeleteC22RecordingFilesIfNeeded9directory20managedObjectContexty10Foundation3URLVSg_So09NSManagedoP0CtFZ_0((uint64_t)v8, v11);

  sub_10013B118((uint64_t)v8);
}

@end
