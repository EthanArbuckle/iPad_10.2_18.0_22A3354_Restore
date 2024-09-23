@implementation PAEDramaticCoolFG

- (PAEDramaticCoolFG)initWithAPIManager:(id)a3
{
  PAEDramaticCoolFG *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEDramaticCoolFG;
  result = -[PAEPhotosFilters initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
  if (result)
    result->super.whichFilter = 23;
  return result;
}

- (BOOL)addParameters
{
  return 1;
}

@end
