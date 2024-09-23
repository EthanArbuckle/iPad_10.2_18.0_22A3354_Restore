@implementation SVXTargetLEDSupplier

- (unsigned)get
{
  if (-[SVXTargetLEDSupplier isSecondGeneration](self, "isSecondGeneration"))
    return 38;
  else
    return 30;
}

- (BOOL)isSecondGeneration
{
  return MGGetProductType() == 1540760353;
}

@end
