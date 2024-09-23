@implementation AceObject(SiriUIUUFRShowable)

- (id)_uufrShownRequestedByInstrumentationManager:()SiriUIUUFRShowable
{
  id v2;
  void *v3;
  objc_class *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x24BE95C60]);
  objc_msgSend(a1, "aceId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAceViewID:", v3);

  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSnippetClass:", v5);

  return v2;
}

@end
