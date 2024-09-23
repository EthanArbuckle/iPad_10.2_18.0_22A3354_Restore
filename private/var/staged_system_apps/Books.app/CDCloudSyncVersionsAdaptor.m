@implementation CDCloudSyncVersionsAdaptor

- (NSPersistentHistoryToken)historyToken
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = *(_QWORD *)&self->cdVersions[24];
  v4 = *(_QWORD *)&self->cdVersions[32];
  sub_10003F198(self->cdVersions, v3);
  swift_retain(self);
  v5 = (void *)dispatch thunk of CDCloudSyncVersionsProtocol.historyToken.getter(v3, v4);
  swift_release(self);
  return (NSPersistentHistoryToken *)v5;
}

- (NSString)dataType
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;

  v3 = *(_QWORD *)&self->cdVersions[24];
  v4 = *(_QWORD *)&self->cdVersions[32];
  sub_10003F198(self->cdVersions, v3);
  swift_retain(self);
  dispatch thunk of CDCloudSyncVersionsProtocol.dataType.getter(v3, v4);
  v6 = v5;
  swift_release(self);
  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  return (NSString *)v7;
}

- (int64_t)historyTokenOffset
{
  return sub_100017444(self, (uint64_t)a2, (uint64_t (*)(uint64_t, uint64_t))&dispatch thunk of CDCloudSyncVersionsProtocol.historyTokenOffset.getter);
}

- (int64_t)localVersion
{
  return sub_100017444(self, (uint64_t)a2, (uint64_t (*)(uint64_t, uint64_t))&dispatch thunk of CDCloudSyncVersionsProtocol.localVersion.getter);
}

- (int64_t)cloudVersion
{
  return sub_100017444(self, (uint64_t)a2, (uint64_t (*)(uint64_t, uint64_t))&dispatch thunk of CDCloudSyncVersionsProtocol.cloudVersion.getter);
}

- (int64_t)syncVersion
{
  return sub_100017444(self, (uint64_t)a2, (uint64_t (*)(uint64_t, uint64_t))&dispatch thunk of CDCloudSyncVersionsProtocol.syncVersion.getter);
}

@end
