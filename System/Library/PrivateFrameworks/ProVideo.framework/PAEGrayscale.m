@implementation PAEGrayscale

- (PAEGrayscale)initWithAPIManager:(id)a3
{
  PAEGrayscale *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEGrayscale;
  result = -[PAEPhotosFilters initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
  if (result)
    result->super.whichFilter = 11;
  return result;
}

- (BOOL)addParameters
{
  return 1;
}

@end
