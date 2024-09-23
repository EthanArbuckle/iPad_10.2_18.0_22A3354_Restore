@implementation NSError(HKSPXPCConnectionProvider)

- (BOOL)hksp_shouldRetryMessage
{
  void *v2;
  int v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

  return v3 && (objc_msgSend(a1, "code") & 0xFFFFFFFFFFFFFFFDLL) == 4097;
}

@end
