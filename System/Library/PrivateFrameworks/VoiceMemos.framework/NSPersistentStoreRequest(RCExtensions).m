@implementation NSPersistentStoreRequest(RCExtensions)

- (void)rc_setAffectedStore:()RCExtensions
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setAffectedStores:", v6);

  }
  else
  {
    objc_msgSend(a1, "setAffectedStores:", 0);
  }

}

@end
