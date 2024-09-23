@implementation CLTransitMacTileDataProviderResult

- (CLTransitMacTileDataProviderResult)initWithMacAddress:(unint64_t)a3
{
  CLTransitMacTileDataProviderResult *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLTransitMacTileDataProviderResult;
  result = -[CLTransitMacTileDataProviderResult init](&v5, "init");
  if (result)
    result->_macAddress = a3;
  return result;
}

- (unint64_t)macAddress
{
  return self->_macAddress;
}

@end
