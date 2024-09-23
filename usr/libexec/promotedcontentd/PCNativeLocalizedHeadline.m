@implementation PCNativeLocalizedHeadline

- (id)initWithLocalizedStringEntry:(id)a3
{
  id v4;
  PCNativeLocalizedHeadline *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[PCNativeLocalizedHeadline init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "languageIdentifier"));
    -[PCNativeLocalizedHeadline setLanguageIdentifier:](v5, "setLanguageIdentifier:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "value"));
    -[PCNativeLocalizedHeadline setValue:](v5, "setValue:", v7);

  }
  return v5;
}

@end
