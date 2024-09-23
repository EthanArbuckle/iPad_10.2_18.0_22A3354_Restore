@implementation CloudKitSyncEngineDataSource

- (void)syncEngine:(id)a3 didSaveRecordZone:(id)a4
{
  id v6;
  id v7;
  _TtC14VoiceShortcuts28CloudKitSyncEngineDataSource *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CloudKitSyncEngineDataSource.syncEngine(_:didSave:)((CKSyncEngine)v8, (CKRecordZone)v7);

}

- (void)syncEngine:(id)a3 didDeleteRecordZoneWithID:(id)a4
{
  id v6;
  id v7;
  _TtC14VoiceShortcuts28CloudKitSyncEngineDataSource *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CloudKitSyncEngineDataSource.syncEngine(_:didDelete:)((CKSyncEngine)v8, (CKRecordZoneID)v7);

}

- (void)syncEngine:(id)a3 failedToSaveRecordZone:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC14VoiceShortcuts28CloudKitSyncEngineDataSource *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v11 = a5;
  v10 = self;
  CloudKitSyncEngineDataSource.syncEngine(_:failedToSave:error:)();

}

- (void)syncEngine:(id)a3 failedToDeleteRecordZoneWithID:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC14VoiceShortcuts28CloudKitSyncEngineDataSource *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v11 = a5;
  v10 = self;
  CloudKitSyncEngineDataSource.syncEngine(_:failedToDelete:error:)();

}

- (void)syncEngine:(id)a3 zoneWithIDChanged:(id)a4
{
  id v6;
  id v7;
  _TtC14VoiceShortcuts28CloudKitSyncEngineDataSource *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CloudKitSyncEngineDataSource.syncEngine(_:zoneWithIDChanged:)((CKSyncEngine)v8, (CKRecordZoneID)v7);

}

- (void)syncEngine:(id)a3 zoneWithIDWasDeleted:(id)a4
{
  id v6;
  id v7;
  _TtC14VoiceShortcuts28CloudKitSyncEngineDataSource *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CloudKitSyncEngineDataSource.syncEngine(_:zoneWithIDWasDeleted:)((CKSyncEngine)v8, (CKRecordZoneID)v7);

}

- (void)syncEngine:(id)a3 zoneWithIDWasPurged:(id)a4
{
  id v6;
  id v7;
  _TtC14VoiceShortcuts28CloudKitSyncEngineDataSource *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CloudKitSyncEngineDataSource.syncEngine(_:zoneWithIDWasPurged:)((CKSyncEngine)v8, (CKRecordZoneID)v7);

}

- (id)syncEngine:(id)a3 recordToSaveForRecordID:(id)a4
{
  id v6;
  id v7;
  _TtC14VoiceShortcuts28CloudKitSyncEngineDataSource *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)CloudKitSyncEngineDataSource.syncEngine(_:recordToSaveFor:)((CKSyncEngine)v8, (CKRecordID)v7);

  return v9;
}

- (void)syncEngine:(id)a3 didSaveRecord:(id)a4
{
  id v6;
  id v7;
  _TtC14VoiceShortcuts28CloudKitSyncEngineDataSource *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CloudKitSyncEngineDataSource.syncEngine(_:didSave:)((CKSyncEngine)v8, (CKRecord)v7);

}

- (void)syncEngine:(id)a3 failedToSaveRecord:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC14VoiceShortcuts28CloudKitSyncEngineDataSource *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v11 = a5;
  v10 = self;
  CloudKitSyncEngineDataSource.syncEngine(_:failedToSave:error:)();

}

- (void)syncEngine:(id)a3 didDeleteRecordWithID:(id)a4
{
  id v6;
  id v7;
  _TtC14VoiceShortcuts28CloudKitSyncEngineDataSource *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CloudKitSyncEngineDataSource.syncEngine(_:didDeleteRecordWith:)((CKSyncEngine)v8, (CKRecordID)v7);

}

- (void)syncEngine:(id)a3 failedToDeleteRecordWithID:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC14VoiceShortcuts28CloudKitSyncEngineDataSource *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v11 = a5;
  v10 = self;
  CloudKitSyncEngineDataSource.syncEngine(_:failedToDeleteRecordWith:error:)();

}

- (void)syncEngine:(id)a3 didFetchRecord:(id)a4
{
  id v6;
  id v7;
  _TtC14VoiceShortcuts28CloudKitSyncEngineDataSource *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CloudKitSyncEngineDataSource.syncEngine(_:didFetch:)((CKSyncEngine)v8, (CKRecord)v7);

}

- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5
{
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _TtC14VoiceShortcuts28CloudKitSyncEngineDataSource *v13;
  Swift::String v14;

  v8 = sub_1C1546BD0();
  v10 = v9;
  v11 = a3;
  v12 = a4;
  v13 = self;
  v14._countAndFlagsBits = v8;
  v14._object = v10;
  CloudKitSyncEngineDataSource.syncEngine(_:recordWithIDWasDeleted:recordType:)((CKSyncEngine)v13, (CKRecordID)v12, v14);

  swift_bridgeObjectRelease();
}

- (void)syncEngine:(id)a3 didUpdateMetadata:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _TtC14VoiceShortcuts28CloudKitSyncEngineDataSource *v12;

  v6 = a3;
  v7 = a4;
  v12 = self;
  v8 = sub_1C15460C0();
  v10 = v9;

  CloudKitSyncEngineDataSource.syncEngine(_:didUpdateMetadata:)(v11, v8, v10);
  sub_1C147C238(v8, v10);

}

- (_TtC14VoiceShortcuts28CloudKitSyncEngineDataSource)init
{
  _TtC14VoiceShortcuts28CloudKitSyncEngineDataSource *result;

  CloudKitSyncEngineDataSource.init()();
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC14VoiceShortcuts28CloudKitSyncEngineDataSource__eventStream;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6E3AB0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1C1475F3C((uint64_t)self + OBJC_IVAR____TtC14VoiceShortcuts28CloudKitSyncEngineDataSource_recordSource);
}

@end
