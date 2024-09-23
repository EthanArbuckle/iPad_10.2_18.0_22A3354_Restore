@implementation PXStoryMiroAssetInfo

- (PXStoryMiroAssetInfo)initWithData:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryMiroAssetInfo;
  return -[PXStoryMiroAssetInfo init](&v4, sel_init, a3);
}

- (BOOL)isUsed
{
  return self->_isUsed;
}

- (void)setIsUsed:(BOOL)a3
{
  self->_isUsed = a3;
}

- (NSData)dataRepresentation
{
  return self->_dataRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataRepresentation, 0);
}

+ (id)infoWithData:(id)a3
{
  id v3;
  uint64_t v4;
  __objc2_class **v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = off_1E50B5448;
  if (v4 != 5)
    v5 = off_1E50B5450;
  v6 = (void *)objc_msgSend(objc_alloc(*v5), "initWithData:", v3);

  return v6;
}

+ (id)infoForUsedPhoto
{
  PXStoryMiroPhotoInfo *v2;

  v2 = objc_alloc_init(PXStoryMiroPhotoInfo);
  -[PXStoryMiroAssetInfo setIsUsed:](v2, "setIsUsed:", 1);
  return v2;
}

@end
