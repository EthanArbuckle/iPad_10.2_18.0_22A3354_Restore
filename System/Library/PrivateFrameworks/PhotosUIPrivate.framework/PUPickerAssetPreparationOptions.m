@implementation PUPickerAssetPreparationOptions

- (PUPickerAssetPreparationOptions)init
{
  return -[PUPickerAssetPreparationOptions initWithIncludeLocation:includeCaption:userEncodingPolicy:](self, "initWithIncludeLocation:includeCaption:userEncodingPolicy:", 1, 1, 0);
}

- (PUPickerAssetPreparationOptions)initWithIncludeLocation:(BOOL)a3 includeCaption:(BOOL)a4 userEncodingPolicy:(int64_t)a5
{
  PUPickerAssetPreparationOptions *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUPickerAssetPreparationOptions;
  result = -[PUPickerAssetPreparationOptions init](&v9, sel_init);
  if (result)
  {
    result->_shouldIncludeLocation = a3;
    result->_shouldIncludeCaption = a4;
    result->_userEncodingPolicy = a5;
  }
  return result;
}

- (BOOL)shouldIncludeLocation
{
  return self->_shouldIncludeLocation;
}

- (BOOL)shouldIncludeCaption
{
  return self->_shouldIncludeCaption;
}

- (int64_t)userEncodingPolicy
{
  return self->_userEncodingPolicy;
}

@end
