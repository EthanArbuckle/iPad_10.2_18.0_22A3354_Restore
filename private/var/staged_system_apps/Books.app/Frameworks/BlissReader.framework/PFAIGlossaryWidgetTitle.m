@implementation PFAIGlossaryWidgetTitle

- (BOOL)mapStartElementWithState:(id)a3
{
  objc_super v6;

  objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState"), "setOverriddenStorage:", objc_msgSend(objc_msgSend(a3, "entryBody"), "headerInfo"));
  v6.receiver = self;
  v6.super_class = (Class)PFAIGlossaryWidgetTitle;
  return -[PFXBlock mapStartElementWithState:](&v6, "mapStartElementWithState:", a3);
}

@end
