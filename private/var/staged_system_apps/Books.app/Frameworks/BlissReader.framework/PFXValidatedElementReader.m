@implementation PFXValidatedElementReader

- (BOOL)mapStartElementWithState:(id)a3
{
  return -[PFXValidatedElementReader isParentValid:](self, "isParentValid:", objc_msgSend(a3, "currentXmlStackEntry"));
}

- (BOOL)isParentValid:(id)a3
{
  return 0;
}

@end
