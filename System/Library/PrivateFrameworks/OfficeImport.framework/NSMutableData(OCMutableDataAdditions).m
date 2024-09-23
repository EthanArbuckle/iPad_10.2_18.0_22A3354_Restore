@implementation NSMutableData(OCMutableDataAdditions)

- (uint64_t)appendLELong:()OCMutableDataAdditions
{
  int v5;

  CsLeWriteUInt32(a3, &v5);
  return objc_msgSend(a1, "appendBytes:length:", &v5, 4);
}

- (uint64_t)replaceBytesInRange:()OCMutableDataAdditions withLELong:
{
  int v9;

  CsLeWriteUInt32(a5, &v9);
  return objc_msgSend(a1, "replaceBytesInRange:withBytes:length:", a3, a4, &v9, 4);
}

- (uint64_t)appendLEShort:()OCMutableDataAdditions
{
  __int16 v5;

  CsLeWriteUInt16(a3, &v5);
  return objc_msgSend(a1, "appendBytes:length:", &v5, 2);
}

- (void)appendString:()OCMutableDataAdditions encoding:
{
  id v5;

  objc_msgSend(a3, "dataUsingEncoding:allowLossyConversion:", a4, 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "appendData:");

}

@end
