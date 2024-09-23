@implementation RCRecordingsDirectoryURL

void __RCRecordingsDirectoryURL_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.VoiceMemos.shared"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "URLByAppendingPathComponent:", CFSTR("Recordings"));
  v2 = objc_claimAutoreleasedReturnValue();

  v3 = (void *)RCRecordingsDirectoryURL_recordingsDirectory;
  RCRecordingsDirectoryURL_recordingsDirectory = v2;

}

@end
