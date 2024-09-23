@implementation PXStoryMiroPhotoInfo

- (PXStoryMiroPhotoInfo)initWithData:(id)a3
{
  id v4;
  PXStoryMiroPhotoInfo *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PXStoryMiroPhotoInfo;
  v5 = -[PXStoryMiroAssetInfo initWithData:](&v7, sel_initWithData_, v4);
  if (v5 && objc_msgSend(v4, "length") == 5)
    -[PXStoryMiroAssetInfo setIsUsed:](v5, "setIsUsed:", *(_BYTE *)(objc_msgSend(objc_retainAutorelease(v4), "bytes") + 4) & 1);

  return v5;
}

- (id)dataRepresentation
{
  _BYTE v3[5];

  v3[4] = -[PXStoryMiroAssetInfo isUsed](self, "isUsed");
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
