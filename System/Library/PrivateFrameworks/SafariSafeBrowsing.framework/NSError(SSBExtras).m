@implementation NSError(SSBExtras)

- (id)ssb_privacyPreservingDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Error: domain=%@, code=%ld"), v3, objc_msgSend(a1, "code"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
