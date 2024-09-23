@implementation PAENevada

- (PAENevada)initWithAPIManager:(id)a3
{
  PAENevada *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAENevada;
  result = -[PAEPhotosFilters initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
  if (result)
    result->super.whichFilter = 12;
  return result;
}

- (BOOL)addParameters
{
  return 1;
}

@end
