@implementation PFAIGlossaryWidgetDefinition

- (BOOL)mapStartElementWithState:(id)a3
{
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState"), "setOverriddenStorage:", objc_msgSend(objc_msgSend(a3, "entryBody"), "bodyStorage"));
  return 1;
}

@end
