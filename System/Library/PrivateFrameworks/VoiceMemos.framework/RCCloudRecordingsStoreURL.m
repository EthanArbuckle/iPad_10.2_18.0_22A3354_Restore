@implementation RCCloudRecordingsStoreURL

void __RCCloudRecordingsStoreURL_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  RCRecordingsDirectoryURL();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("CloudRecordings.db"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)RCCloudRecordingsStoreURL_storeURL;
  RCCloudRecordingsStoreURL_storeURL = v0;

}

@end
