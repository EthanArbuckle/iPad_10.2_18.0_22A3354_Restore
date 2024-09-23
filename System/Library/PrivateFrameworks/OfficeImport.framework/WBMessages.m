@implementation WBMessages

+ (void)initialize
{
  TCTaggedMessage *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  TCTaggedMessage *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  if ((id)objc_opt_class() == a1)
  {
    v2 = [TCTaggedMessage alloc];
    TCBundle();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("The document was created with an unsupported version of Word."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[TCTaggedMessage initWithMessageText:](v2, "initWithMessageText:", v3);
    v5 = (void *)WBUnsupportedVersion;
    WBUnsupportedVersion = v4;

    v6 = [TCTaggedMessage alloc];
    TCBundle();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("An image is missing from the document."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[TCTaggedMessage initWithMessageText:](v6, "initWithMessageText:", v7);
    v9 = (void *)WBMissingImage;
    WBMissingImage = v8;

  }
}

@end
