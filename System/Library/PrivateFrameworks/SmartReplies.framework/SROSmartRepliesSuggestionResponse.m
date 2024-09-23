@implementation SROSmartRepliesSuggestionResponse

- (SROSmartRepliesSuggestionResponse)initWithSuggestions:(id)a3
{
  id v5;
  SROSmartRepliesSuggestionResponse *v6;
  SROSmartRepliesSuggestionResponse *v7;
  SROSmartRepliesSuggestionResponse *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SROSmartRepliesSuggestionResponse;
  v6 = -[SROSmartRepliesSuggestionResponse init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_suggestions, a3);
    v8 = v7;
  }

  return v7;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestions, 0);
}

@end
