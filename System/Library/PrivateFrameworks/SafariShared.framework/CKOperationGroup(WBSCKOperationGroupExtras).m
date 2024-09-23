@implementation CKOperationGroup(WBSCKOperationGroupExtras)

- (id)safari_logDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "operationGroupID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("operation group: [GroupID:%@, GroupName:%@]"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
