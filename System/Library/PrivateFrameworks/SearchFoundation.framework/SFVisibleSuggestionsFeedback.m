@implementation SFVisibleSuggestionsFeedback

- (SFVisibleSuggestionsFeedback)initWithSuggestions:(id)a3
{
  id v4;
  SFVisibleSuggestionsFeedback *v5;
  uint64_t v6;
  NSArray *suggestions;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFVisibleSuggestionsFeedback;
  v5 = -[SFFeedback init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    suggestions = v5->_suggestions;
    v5->_suggestions = (NSArray *)v6;

  }
  return v5;
}

- (SFVisibleSuggestionsFeedback)initWithCoder:(id)a3
{
  id v4;
  SFVisibleSuggestionsFeedback *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *suggestions;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFVisibleSuggestionsFeedback;
  v5 = -[SFFeedback initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_suggestions"));
    v9 = objc_claimAutoreleasedReturnValue();
    suggestions = v5->_suggestions;
    v5->_suggestions = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFVisibleSuggestionsFeedback;
  v4 = a3;
  -[SFFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_suggestions, CFSTR("_suggestions"), v5.receiver, v5.super_class);

}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (void)setSuggestions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
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
