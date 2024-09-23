@implementation PAEBlackAndWhiteMono

- (PAEBlackAndWhiteMono)initWithAPIManager:(id)a3
{
  PAEBlackAndWhiteMono *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEBlackAndWhiteMono;
  result = -[PAEPhotosFilters initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
  if (result)
    result->super.whichFilter = 27;
  return result;
}

- (BOOL)addParameters
{
  return 1;
}

@end
