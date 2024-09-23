@implementation RelatedSearchSuggestionComponent

- (RelatedSearchSuggestionComponent)initWithDisplayText:(id)a3 substitute:(id)a4
{
  id v6;
  id v7;
  RelatedSearchSuggestionComponent *v8;
  NSString *v9;
  NSString *displayText;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RelatedSearchSuggestionComponent;
  v8 = -[RelatedSearchSuggestionComponent init](&v12, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v6, "copy");
    displayText = v8->_displayText;
    v8->_displayText = v9;

    objc_storeStrong((id *)&v8->_substitute, a4);
  }

  return v8;
}

- (BOOL)isRelatedSearchSuggestion
{
  return -[RelatedSearchSuggestionSubstitute isRelatedSearchSuggestion](self->_substitute, "isRelatedSearchSuggestion");
}

- (GEORelatedSearchSuggestion)suggestion
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionSubstitute pdSubstitute](self->_substitute, "pdSubstitute"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "relatedSearchSuggestion"));

  return (GEORelatedSearchSuggestion *)v3;
}

- (NSString)displayText
{
  return self->_displayText;
}

- (RelatedSearchSuggestionSubstitute)substitute
{
  return self->_substitute;
}

- (void)setSubstitute:(id)a3
{
  objc_storeStrong((id *)&self->_substitute, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_substitute, 0);
  objc_storeStrong((id *)&self->_displayText, 0);
}

@end
