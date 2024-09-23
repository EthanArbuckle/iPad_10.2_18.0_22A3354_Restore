@implementation PFAIList

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5;
  id v6;
  id v7;
  objc_super v9;
  objc_super v10;

  v5 = objc_msgSend(a3, "currentStackEntry");
  if (objc_msgSend(a3, "setFlowAsCurrent"))
  {
    v10.receiver = self;
    v10.super_class = (Class)PFAIList;
    v6 = (id)-[PFXList mapStartElementWithState:](&v10, "mapStartElementWithState:", a3);
    objc_msgSend(objc_msgSend(v5, "flowState"), "setProcessOrientation:", v6);
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  if (objc_msgSend(a3, "setPaginatedAsCurrent"))
  {
    v9.receiver = self;
    v9.super_class = (Class)PFAIList;
    v7 = (id)-[PFXList mapStartElementWithState:](&v9, "mapStartElementWithState:", a3);
    objc_msgSend(objc_msgSend(v5, "paginatedState"), "setProcessOrientation:", v7);
    LOBYTE(v6) = v6 | v7;
  }
  objc_msgSend(a3, "setCfiPathForCurrentStorage");
  return (char)v6;
}

- (void)mapEndElementWithState:(id)a3
{
  objc_super v5;
  objc_super v6;

  if (objc_msgSend(a3, "setFlowAsCurrent"))
  {
    v6.receiver = self;
    v6.super_class = (Class)PFAIList;
    -[PFXList mapEndElementWithState:](&v6, "mapEndElementWithState:", a3);
  }
  if (objc_msgSend(a3, "setPaginatedAsCurrent"))
  {
    v5.receiver = self;
    v5.super_class = (Class)PFAIList;
    -[PFXList mapEndElementWithState:](&v5, "mapEndElementWithState:", a3);
  }
}

@end
