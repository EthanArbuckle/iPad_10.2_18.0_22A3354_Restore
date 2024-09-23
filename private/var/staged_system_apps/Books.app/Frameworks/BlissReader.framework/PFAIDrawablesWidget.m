@implementation PFAIDrawablesWidget

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5;
  objc_super v7;

  v5 = objc_msgSend(a3, "currentStackEntry");
  objc_msgSend(objc_msgSend(v5, "flowState"), "setProcessOrientation:", 0);
  objc_msgSend(objc_msgSend(v5, "paginatedState"), "setProcessOrientation:", 1);
  objc_msgSend(a3, "setPaginatedAsCurrent");
  v7.receiver = self;
  v7.super_class = (Class)PFAIDrawablesWidget;
  return -[PFXDrawablesWidget mapStartElementWithState:](&v7, "mapStartElementWithState:", a3);
}

- (BOOL)shouldImportInCurrentLayoutWithState:(id)a3
{
  return 1;
}

@end
