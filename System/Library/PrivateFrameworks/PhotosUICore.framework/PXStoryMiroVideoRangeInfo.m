@implementation PXStoryMiroVideoRangeInfo

- (PXStoryMiroVideoRangeInfo)initWithData:(id)a3
{
  id v4;
  PXStoryMiroVideoRangeInfo *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PXStoryMiroVideoRangeInfo;
  v5 = -[PXStoryMiroAssetInfo initWithData:](&v7, sel_initWithData_, v4);
  if (v5 && (unint64_t)(objc_msgSend(v4, "length") - 9) <= 1)
    -[PXStoryMiroAssetInfo setIsUsed:](v5, "setIsUsed:", *(_BYTE *)(objc_msgSend(objc_retainAutorelease(v4), "bytes") + 8) & 1);

  return v5;
}

- (id)dataRepresentation
{
  _BYTE v3[10];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[8] = -[PXStoryMiroAssetInfo isUsed](self, "isUsed");
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v3, 10);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
