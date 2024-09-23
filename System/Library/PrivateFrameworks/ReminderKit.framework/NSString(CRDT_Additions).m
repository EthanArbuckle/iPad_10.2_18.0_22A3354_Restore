@implementation NSString(CRDT_Additions)

- (void)mergeWith:()CRDT_Additions
{
  NSObject *v1;

  if ((objc_msgSend(a1, "isEqual:") & 1) == 0)
  {
    +[REMLog crdt](REMLog, "crdt");
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
      -[NSString(CRDT_Additions) mergeWith:].cold.1(v1);

  }
}

- (uint64_t)initWithCRCoder:()CRDT_Additions
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "decodeStringForKey:", CFSTR("self"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "initWithString:", v4);

  return v5;
}

- (uint64_t)encodeWithCRCoder:()CRDT_Additions
{
  return objc_msgSend(a3, "encodeString:forKey:", a1, CFSTR("self"));
}

- (uint64_t)deltaSince:()CRDT_Additions in:
{
  return 0;
}

- (void)mergeWith:()CRDT_Additions .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B4A39000, log, OS_LOG_TYPE_FAULT, "rem_log_fault_if (![self isEqual:other]) -- Cannot merge NSString with different value.", v1, 2u);
}

@end
