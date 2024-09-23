@implementation SAUIAssistantUtteranceView(SiriUIUUFRShowable)

- (id)_uufrShownRequestedByInstrumentationManager:()SiriUIUUFRShowable
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&off_2550C7768;
  objc_msgSendSuper2(&v5, sel__uufrShownRequestedByInstrumentationManager_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dialogIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDialogIdentifier:", v3);

  return v2;
}

@end
