@implementation PCMessages

+ (void)initialize
{
  TCTaggedMessage *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  if ((id)objc_opt_class() == a1)
  {
    objc_opt_class();
    v2 = [TCTaggedMessage alloc];
    TCBundle();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("This document was created with an unsupported version of PowerPoint."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[TCTaggedMessage initWithMessageText:](v2, "initWithMessageText:", v3);
    v5 = (void *)PCUnsupportedVersion;
    PCUnsupportedVersion = v4;

  }
}

@end
