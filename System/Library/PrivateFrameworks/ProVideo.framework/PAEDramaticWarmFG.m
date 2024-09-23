@implementation PAEDramaticWarmFG

- (PAEDramaticWarmFG)initWithAPIManager:(id)a3
{
  PAEDramaticWarmFG *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEDramaticWarmFG;
  result = -[PAEPhotosFilters initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
  if (result)
    result->super.whichFilter = 24;
  return result;
}

- (BOOL)addParameters
{
  return 1;
}

@end
