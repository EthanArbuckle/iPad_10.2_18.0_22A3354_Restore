@implementation PFAIGlossaryBody

- (BOOL)mapStartElementWithState:(id)a3
{
  objc_msgSend(a3, "setInBody:", 1);
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  objc_msgSend(a3, "setInBody:", 0);
}

@end
