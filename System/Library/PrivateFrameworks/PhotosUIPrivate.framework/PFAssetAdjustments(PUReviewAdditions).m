@implementation PFAssetAdjustments(PUReviewAdditions)

- (id)phAdjustmentData
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_alloc(MEMORY[0x1E0CD1370]);
  objc_msgSend(a1, "adjustmentFormatIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "adjustmentFormatVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "adjustmentData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithFormatIdentifier:formatVersion:data:", v3, v4, v5);

  v7 = objc_msgSend(a1, "adjustmentBaseVersion");
  if (v7 == 2)
    v8 = 2;
  else
    v8 = v7 == 1;
  objc_msgSend(v6, "setBaseVersion:", v8);
  return v6;
}

@end
