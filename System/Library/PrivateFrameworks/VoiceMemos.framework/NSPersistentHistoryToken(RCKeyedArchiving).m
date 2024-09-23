@implementation NSPersistentHistoryToken(RCKeyedArchiving)

+ (id)rc_unarchivedTokenWithData:()RCKeyedArchiving
{
  void *v3;
  id v4;
  void *v5;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0CB3710];
    v4 = a3;
    objc_msgSend(v3, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (uint64_t)rc_archiveToken
{
  return objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a1, 1, 0);
}

@end
