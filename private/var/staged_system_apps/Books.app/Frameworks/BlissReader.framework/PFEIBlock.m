@implementation PFEIBlock

- (BOOL)mapStartElementWithState:(id)a3
{
  BOOL v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFEIBlock;
  v4 = -[PFXBlock mapStartElementWithState:](&v6, "mapStartElementWithState:");
  objc_msgSend(a3, "setCfiPathForCurrentStorage");
  return v4;
}

@end
