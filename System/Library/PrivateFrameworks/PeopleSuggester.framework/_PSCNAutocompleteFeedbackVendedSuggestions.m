@implementation _PSCNAutocompleteFeedbackVendedSuggestions

- (_PSCNAutocompleteFeedbackVendedSuggestions)initWithSuggestions:(id)a3
{
  id v5;
  _PSCNAutocompleteFeedbackVendedSuggestions *v6;
  _PSCNAutocompleteFeedbackVendedSuggestions *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PSCNAutocompleteFeedbackVendedSuggestions;
  v6 = -[_PSCNAutocompleteFeedbackVendedSuggestions init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_suggestions, a3);

  return v7;
}

- (_PSCNAutocompleteFeedbackVendedSuggestions)initWithCoder:(id)a3
{
  id v4;
  _PSCNAutocompleteFeedbackVendedSuggestions *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *suggestions;
  _PSCNAutocompleteFeedbackVendedSuggestions *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_PSCNAutocompleteFeedbackVendedSuggestions;
  v5 = -[_PSCNAutocompleteFeedbackVendedSuggestions init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("suggestions"));
    v9 = objc_claimAutoreleasedReturnValue();
    suggestions = v5->_suggestions;
    v5->_suggestions = (NSArray *)v9;

    v11 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_suggestions, CFSTR("suggestions"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
