@implementation SWPresentationStateScript

- (SWPresentationStateScript)initWithPresentationState:(unint64_t)a3
{
  SWPresentationStateScript *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SWPresentationStateScript;
  result = -[SWPresentationStateScript init](&v5, sel_init);
  if (result)
    result->_presentationState = a3;
  return result;
}

- (NSString)identifier
{
  return (NSString *)CFSTR("presentationState");
}

- (BOOL)queueable
{
  return 0;
}

- (NSString)executableScript
{
  unint64_t v2;
  const __CFString *v3;

  v2 = -[SWPresentationStateScript presentationState](self, "presentationState");
  v3 = CFSTR("unknown");
  if (v2 == 1)
    v3 = CFSTR("presented");
  if (v2 == 2)
    v3 = CFSTR("notpresented");
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("var oldPresentationState = applenews.presentationState; applenews.presentationState = '%@'; var event = new CustomEvent('ANPresentationStateChanged', {detail: {newPresentationState:applenews.presentationState, oldPresentationState: oldPresentationState}}); document.dispatchEvent(event);"),
                       v3);
}

- (WKUserScript)userScript
{
  return self->userScript;
}

- (unint64_t)presentationState
{
  return self->_presentationState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->userScript, 0);
}

@end
