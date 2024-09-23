@implementation WFCoreDataCloudKitSyncToken

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("CloudKitSyncToken"));
}

- (id)descriptor
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0DC7AA8]);
  -[WFCoreDataCloudKitSyncToken identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithIdentifier:objectType:", v4, 3);

  return v5;
}

@end
