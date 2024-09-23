@implementation PAEDramaticFG

- (PAEDramaticFG)initWithAPIManager:(id)a3
{
  PAEDramaticFG *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEDramaticFG;
  result = -[PAEPhotosFilters initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
  if (result)
    result->super.whichFilter = 22;
  return result;
}

- (BOOL)addParameters
{
  return 1;
}

@end
