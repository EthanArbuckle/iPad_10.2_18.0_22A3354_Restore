@implementation PXAnimatedImageRequestOptions

- (id)photoKitRequestOptions
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CD1388]);
  -[PXImageRequestOptions copyPropertiesToPhotoKitOptions:](self, "copyPropertiesToPhotoKitOptions:", v3);
  objc_msgSend(v3, "setAllowPreCaching:", -[PXAnimatedImageRequestOptions allowPreCaching](self, "allowPreCaching"));
  objc_msgSend(v3, "setUseSharedImageDecoding:", -[PXAnimatedImageRequestOptions useSharedImageDecoding](self, "useSharedImageDecoding"));
  return v3;
}

- (PXAnimatedImageRequestOptions)init
{
  PXAnimatedImageRequestOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXAnimatedImageRequestOptions;
  result = -[PXAnimatedImageRequestOptions init](&v3, sel_init);
  if (result)
    result->_allowPreCaching = 1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v6.receiver = self;
  v6.super_class = (Class)PXAnimatedImageRequestOptions;
  -[PXAnimatedImageRequestOptions copyPropertiesToOptions:](&v6, sel_copyPropertiesToOptions_, v4);
  objc_msgSend(v4, "setAllowPreCaching:", self->_allowPreCaching);
  objc_msgSend(v4, "setUseSharedImageDecoding:", self->_useSharedImageDecoding);
  return v4;
}

- (BOOL)allowPreCaching
{
  return self->_allowPreCaching;
}

- (void)setAllowPreCaching:(BOOL)a3
{
  self->_allowPreCaching = a3;
}

- (BOOL)useSharedImageDecoding
{
  return self->_useSharedImageDecoding;
}

- (void)setUseSharedImageDecoding:(BOOL)a3
{
  self->_useSharedImageDecoding = a3;
}

@end
