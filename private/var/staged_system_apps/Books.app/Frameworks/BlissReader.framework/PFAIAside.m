@implementation PFAIAside

- (BOOL)mapStartElementWithState:(id)a3
{
  objc_super v6;

  if (objc_msgSend(a3, "setPaginatedAsCurrent"))
  {
    v6.receiver = self;
    v6.super_class = (Class)PFAIAside;
    -[PFXAside mapStartElementWithState:](&v6, "mapStartElementWithState:", a3);
  }
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentStackEntry"), "flowState"), "setProcessOrientation:", 0);
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  objc_super v5;

  if (objc_msgSend(a3, "setPaginatedAsCurrent"))
  {
    v5.receiver = self;
    v5.super_class = (Class)PFAIAside;
    -[PFXAside mapEndElementWithState:](&v5, "mapEndElementWithState:", a3);
  }
}

@end
