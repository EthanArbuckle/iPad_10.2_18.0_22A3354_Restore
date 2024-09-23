@implementation SFSuggestionEngagementFeedback

- (SFSuggestionEngagementFeedback)initWithSuggestion:(id)a3
{
  id v5;
  SFSuggestionEngagementFeedback *v6;
  SFSuggestionEngagementFeedback *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFSuggestionEngagementFeedback;
  v6 = -[SFFeedback init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_suggestion, a3);

  return v7;
}

- (SFSuggestionEngagementFeedback)initWithCoder:(id)a3
{
  id v4;
  SFSuggestionEngagementFeedback *v5;
  uint64_t v6;
  SFSearchSuggestion *suggestion;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFSuggestionEngagementFeedback;
  v5 = -[SFFeedback initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_suggestion"));
    v6 = objc_claimAutoreleasedReturnValue();
    suggestion = v5->_suggestion;
    v5->_suggestion = (SFSearchSuggestion *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFSuggestionEngagementFeedback;
  v4 = a3;
  -[SFFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_suggestion, CFSTR("_suggestion"), v5.receiver, v5.super_class);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFSuggestionEngagementFeedback;
  v4 = -[SFFeedback copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SFSuggestionEngagementFeedback suggestion](self, "suggestion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setSuggestion:", v6);

  return v4;
}

- (SFSearchSuggestion)suggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_suggestion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestion, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
