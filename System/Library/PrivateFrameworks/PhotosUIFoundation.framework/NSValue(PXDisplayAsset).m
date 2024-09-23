@implementation NSValue(PXDisplayAsset)

- (uint64_t)PXDisplayAssetTypedCountValue
{
  _QWORD v2[2];

  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getValue:", v2);
  return v2[0];
}

+ (id)valueWithPXDisplayAssetTypedCount:()PXDisplayAsset
{
  _QWORD v5[2];

  v5[0] = a3;
  v5[1] = a4;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1968]), "initWithBytes:objCType:", v5, "{?=Qq}");
}

- (uint64_t)PXDisplayAssetDetailedCountsValue
{
  *x8_0 = 0;
  x8_0[1] = 0;
  x8_0[2] = 0;
  return objc_msgSend(a1, "getValue:", x8_0);
}

+ (id)valueWithPXDisplayAssetDetailedCounts:()PXDisplayAsset
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1968]), "initWithBytes:objCType:", a3, "{?=QQQ}");
}

@end
