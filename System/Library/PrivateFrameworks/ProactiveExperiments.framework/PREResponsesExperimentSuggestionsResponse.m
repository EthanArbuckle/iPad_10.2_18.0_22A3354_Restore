@implementation PREResponsesExperimentSuggestionsResponse

- (PREResponsesExperimentSuggestionsResponse)initWithSuggestions:(id)a3
{
  id v4;
  PREResponsesExperimentSuggestionsResponse *v5;
  uint64_t v6;
  NSArray *suggestions;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PREResponsesExperimentSuggestionsResponse;
  v5 = -[PREResponsesExperimentSuggestionsResponse init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    suggestions = v5->_suggestions;
    v5->_suggestions = (NSArray *)v6;

  }
  return v5;
}

- (PREResponsesExperimentSuggestionsResponse)initWithCoder:(id)a3
{
  id v4;
  PREResponsesExperimentSuggestionsResponse *v5;
  uint64_t v6;
  NSArray *suggestions;

  v4 = a3;
  v5 = -[PREResponsesExperimentSuggestionsResponse init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("suggestions"));
    v6 = objc_claimAutoreleasedReturnValue();
    suggestions = v5->_suggestions;
    v5->_suggestions = (NSArray *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_suggestions, CFSTR("suggestions"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  PREResponsesExperimentSuggestionsResponse *v3;

  v3 = self;
  return -[PREResponsesExperimentSuggestionsResponse initWithSuggestions:](v3, "initWithSuggestions:", v3->_suggestions);
}

- (BOOL)isEqual:(id)a3
{
  PREResponsesExperimentSuggestionsResponse *v4;
  uint64_t v5;
  BOOL v6;
  PREResponsesExperimentSuggestionsResponse *v7;
  unint64_t v8;
  uint64_t v9;

  v4 = (PREResponsesExperimentSuggestionsResponse *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      v8 = -[PREResponsesExperimentSuggestionsResponse hash](self, "hash");
      v9 = -[PREResponsesExperimentSuggestionsResponse hash](v7, "hash");

      v6 = v8 == v9;
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PREResponsesExperimentSuggestionsResponse suggestions](self, "suggestions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash") + 31;

  return v3;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestions, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
