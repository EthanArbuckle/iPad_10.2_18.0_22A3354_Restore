@implementation PAETonal

- (PAETonal)initWithAPIManager:(id)a3
{
  PAETonal *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAETonal;
  result = -[PAEPhotosFilters initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
  if (result)
    result->super.whichFilter = 1;
  return result;
}

- (BOOL)addParameters
{
  return 1;
}

@end
