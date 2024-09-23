@implementation NSData(SecureRandom)

+ (id)rem_dataWithRandomBytesWithLength:()SecureRandom
{
  void *v4;
  const __SecRandom *v5;
  id v6;
  uint64_t v7;
  void *v8;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", a3);
  v5 = (const __SecRandom *)*MEMORY[0x1E0CD7000];
  v6 = objc_retainAutorelease(v4);
  v7 = SecRandomCopyBytes(v5, a3, (void *)objc_msgSend(v6, "mutableBytes"));
  if ((_DWORD)v7)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("NSData+Random: SecRandomCopyBytes error: %d"), v7);
  v8 = (void *)objc_msgSend(v6, "copy");

  return v8;
}

@end
