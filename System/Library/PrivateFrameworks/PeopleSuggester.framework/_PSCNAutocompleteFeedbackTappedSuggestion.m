@implementation _PSCNAutocompleteFeedbackTappedSuggestion

- (_PSCNAutocompleteFeedbackTappedSuggestion)initWithSuggestion:(id)a3
{
  id v5;
  _PSCNAutocompleteFeedbackTappedSuggestion *v6;
  _PSCNAutocompleteFeedbackTappedSuggestion *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PSCNAutocompleteFeedbackTappedSuggestion;
  v6 = -[_PSCNAutocompleteFeedbackTappedSuggestion init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_suggestion, a3);

  return v7;
}

- (_PSCNAutocompleteFeedbackTappedSuggestion)initWithCoder:(id)a3
{
  id v4;
  _PSCNAutocompleteFeedbackTappedSuggestion *v5;
  uint64_t v6;
  _PSSuggestion *suggestion;
  _PSCNAutocompleteFeedbackTappedSuggestion *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_PSCNAutocompleteFeedbackTappedSuggestion;
  v5 = -[_PSCNAutocompleteFeedbackTappedSuggestion init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suggestion"));
    v6 = objc_claimAutoreleasedReturnValue();
    suggestion = v5->_suggestion;
    v5->_suggestion = (_PSSuggestion *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_suggestion, CFSTR("suggestion"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_PSSuggestion)suggestion
{
  return self->_suggestion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end
