@implementation AVContentKeyRequest(ICAdditions)

- (id)ic_description
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  objc_msgSend(a1, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@ %p (%@, status:%d, persistable:%d)>"), v3, a1, v4, objc_msgSend(a1, "status"), objc_msgSend(a1, "canProvidePersistableContentKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
