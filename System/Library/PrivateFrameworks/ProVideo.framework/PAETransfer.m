@implementation PAETransfer

- (PAETransfer)initWithAPIManager:(id)a3
{
  PAETransfer *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAETransfer;
  result = -[PAEPhotosFilters initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
  if (result)
    result->super.whichFilter = 6;
  return result;
}

- (BOOL)addParameters
{
  return 1;
}

@end
