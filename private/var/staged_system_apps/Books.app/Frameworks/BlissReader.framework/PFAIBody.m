@implementation PFAIBody

- (BOOL)mapStartElementWithState:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PFAIBody;
  -[PFXBody mapStartElementWithState:](&v5, "mapStartElementWithState:");
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentDocOrientationState"), "contentNodeBody"), "setNodeUniqueID:forInfo:", objc_msgSend(a3, "nodeGUID"), objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentStackEntry"), "currentEntryMediaState"), "storage"));
  objc_msgSend(a3, "setCfiPathForCurrentStorage");
  return 1;
}

@end
