@implementation REMExternalSyncMetadataUtils

+ (id)encodeExternalIdentifierForMarkedForDeletionObject:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (void *)MEMORY[0x1E0CB3A28];
    v5 = a3;
    objc_msgSend(v4, "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@%@"), v5, CFSTR("-REMCDOBJECT_DELETED-"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (id)decodeExternalIdentifierForMarkedForDeletionObject:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("-REMCDOBJECT_DELETED-"));
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v3, "substringToIndex:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

+ (BOOL)shouldUseExternalIdentifierAsDeletionKeyWithAccountType:(int64_t)a3
{
  BOOL v3;

  if (a3)
    v3 = (unint64_t)(a3 - 3) >= 2;
  else
    v3 = 0;
  return !v3;
}

@end
