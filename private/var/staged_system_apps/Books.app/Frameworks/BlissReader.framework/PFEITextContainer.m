@implementation PFEITextContainer

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFEITextContainer;
  -[PFEITextContainer dealloc](&v3, "dealloc");
}

- (BOOL)mapStartElementWithState:(id)a3
{
  self->_storage = -[THWPStorage initWithContext:string:stylesheet:kind:]([THWPStorage alloc], "initWithContext:string:stylesheet:kind:", objc_msgSend(a3, "tspContext"), &stru_43D7D8, objc_msgSend(objc_msgSend(a3, "currentHtmlDocMediaState"), "stylesheet"), 3);
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState"), "setOverriddenStorage:", self->_storage);
  objc_msgSend(a3, "setUniqueIdForInfo:fromStackEntry:", self->_storage, objc_msgSend(a3, "currentHtmlStackEntry"));
  objc_msgSend(a3, "setCfiPathForInfo:fromStackEntry:", self->_storage, objc_msgSend(a3, "currentHtmlStackEntry"));
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState"), "setResult:", self->_storage);
}

- (THWPStorage)storage
{
  return self->_storage;
}

@end
