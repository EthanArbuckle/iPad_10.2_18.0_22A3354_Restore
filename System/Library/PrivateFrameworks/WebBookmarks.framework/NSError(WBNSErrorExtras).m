@implementation NSError(WBNSErrorExtras)

+ (id)wb_databaseOpenError
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BDD0FD8];
  v5[0] = CFSTR("Failed to open database");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "errorWithDomain:code:userInfo:", CFSTR("com.apple.WebBookmarks.TabGroupSyncAgent.ErrorDomain"), 3, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)wb_featureDisabledError
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BDD0FD8];
  v5[0] = CFSTR("The feature is disabled");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "errorWithDomain:code:userInfo:", CFSTR("com.apple.WebBookmarks.TabGroupSyncAgent.ErrorDomain"), 2, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)wb_lockError
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BDD0FD8];
  v5[0] = CFSTR("Failed to acquire the lock on the database");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "errorWithDomain:code:userInfo:", CFSTR("com.apple.WebBookmarks.TabGroupSyncAgent.ErrorDomain"), 1, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)wb_privacyPreservingDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Error: domain=%@, code=%ld"), v3, objc_msgSend(a1, "code"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
