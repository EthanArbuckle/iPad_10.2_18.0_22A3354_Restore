@implementation PFAIMath

- (BOOL)mapStartElementWithState:(id)a3
{
  objc_super v6;
  objc_super v7;

  if (objc_msgSend(a3, "setFlowAsCurrent"))
  {
    v7.receiver = self;
    v7.super_class = (Class)PFAIMath;
    -[PFXMath mapStartElementWithState:](&v7, "mapStartElementWithState:", a3);
  }
  if (objc_msgSend(a3, "setPaginatedAsCurrent"))
  {
    v6.receiver = self;
    v6.super_class = (Class)PFAIMath;
    -[PFXMath mapStartElementWithState:](&v6, "mapStartElementWithState:", a3);
  }
  return 0;
}

@end
