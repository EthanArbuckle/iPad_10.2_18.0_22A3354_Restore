@implementation SSCoreSuggestionsContactResultBuilder

+ (id)bundleId
{
  return CFSTR("com.apple.CoreSuggestions");
}

+ (BOOL)supportsResult:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "sectionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

- (SSCoreSuggestionsContactResultBuilder)initWithResult:(id)a3
{
  id v4;
  SSCoreSuggestionsContactResultBuilder *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SSCoreSuggestionsContactResultBuilder;
  v5 = -[SSContactResultBuilder initWithResult:](&v8, sel_initWithResult_, v4);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSCoreSuggestionsContactResultBuilder setSuggestedContactIdentifier:](v5, "setSuggestedContactIdentifier:", v6);

  }
  return v5;
}

- (id)buildCommand
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[SSCoreSuggestionsContactResultBuilder suggestedContactIdentifier](self, "suggestedContactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContactIdentifier:", v4);

  objc_msgSend(v3, "setIsSuggestedContact:", 1);
  return v3;
}

- (id)buildBadgingImageWithThumbnail:(id)a3
{
  return 0;
}

- (NSString)suggestedContactIdentifier
{
  return self->_suggestedContactIdentifier;
}

- (void)setSuggestedContactIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedContactIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedContactIdentifier, 0);
}

@end
