@implementation NSMutableData(Append)

- (uint64_t)appendByte:()Append
{
  char v4;

  v4 = a3;
  return objc_msgSend(a1, "appendBytes:length:", &v4, 1);
}

- (void)appendShortBE:()Append
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithShortBE:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "appendData:", v2);

}

@end
