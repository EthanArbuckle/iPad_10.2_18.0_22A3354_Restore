@implementation NSData(_PASDistilledString)

- (id)_pas_revivedString
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1A1AFDC98]();
  objc_msgSend(a1, "base64EncodedStringWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v2);
  return v3;
}

@end
