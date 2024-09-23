@implementation PAEDramaticWarmBG

- (PAEDramaticWarmBG)initWithAPIManager:(id)a3
{
  PAEDramaticWarmBG *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEDramaticWarmBG;
  result = -[PAEPhotosFilters initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
  if (result)
    result->super.whichFilter = 21;
  return result;
}

- (BOOL)addParameters
{
  return 1;
}

@end
