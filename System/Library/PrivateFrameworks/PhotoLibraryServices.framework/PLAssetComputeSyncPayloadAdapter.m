@implementation PLAssetComputeSyncPayloadAdapter

- (id)payloadID
{
  void *v2;
  void *v3;
  void *v4;

  -[PLAssetComputeSyncPayloadAdapter asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudAssetGUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:](PLJournalEntryPayloadIDFactory, "payloadIDWithUUIDString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
