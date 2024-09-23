@implementation SPUIProxySearchField

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance_field;
}

void __38__SPUIProxySearchField_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_field;
  sharedInstance_field = v0;

}

- (SPUIProxySearchField)init
{
  SPUIProxySearchField *v2;
  SPUIProxySearchField *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SPUIProxySearchField;
  v2 = -[SPUIProxySearchField init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SPUIProxySearchField setAutocapitalizationType:](v2, "setAutocapitalizationType:", 0);
    -[SPUIProxySearchField setAutocorrectionType:](v3, "setAutocorrectionType:", 1);
    -[SPUIProxySearchField setReturnKeyType:](v3, "setReturnKeyType:", 6);
    -[SPUIProxySearchField setAcceptsDictationSearchResults:](v3, "setAcceptsDictationSearchResults:", 1);
  }
  return v3;
}

@end
