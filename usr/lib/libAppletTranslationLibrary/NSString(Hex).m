@implementation NSString(Hex)

+ (id)hexStringFromBytes:()Hex length:
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", a3, a4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asHexString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (uint64_t)hexStringFromDER:()Hex
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "hexStringFromBytes:length:", *a3, a3[1]);
}

- (uint64_t)hexStringAsData
{
  return objc_msgSend(MEMORY[0x1E0C99D50], "dataWithHexString:", a1);
}

@end
