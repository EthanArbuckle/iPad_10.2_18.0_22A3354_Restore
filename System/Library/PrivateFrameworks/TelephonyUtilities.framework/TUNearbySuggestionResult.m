@implementation TUNearbySuggestionResult

- (TUNearbySuggestionResult)initWithSuggestion:(id)a3 selectedActivity:(id)a4 type:(int64_t)a5
{
  id v9;
  id v10;
  TUNearbySuggestionResult *v11;
  TUNearbySuggestionResult *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TUNearbySuggestionResult;
  v11 = -[TUNearbySuggestionResult init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_suggestion, a3);
    objc_storeStrong((id *)&v12->_selectedActivity, a4);
    v12->_type = a5;
  }

  return v12;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR(" suggestion=%@"), self->_suggestion);
  objc_msgSend(v6, "appendFormat:", CFSTR(" selectedActivity=%@"), self->_selectedActivity);
  v7 = self->_type - 1;
  if (v7 > 2)
    v8 = CFSTR("cancelled");
  else
    v8 = off_1E38A2880[v7];
  objc_msgSend(v6, "appendFormat:", CFSTR(" type=%@"), v8);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  v9 = (void *)objc_msgSend(v6, "copy");

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUNearbySuggestionResult)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  TUNearbySuggestionResult *v13;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_suggestion);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_selectedActivity);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_type);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "decodeIntegerForKey:", v11);

  v13 = -[TUNearbySuggestionResult initWithSuggestion:selectedActivity:type:](self, "initWithSuggestion:selectedActivity:type:", v7, v10, v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  TUNearbySuggestion *suggestion;
  id v5;
  void *v6;
  TUConversationActivity *selectedActivity;
  void *v8;
  int64_t type;
  id v10;

  suggestion = self->_suggestion;
  v5 = a3;
  NSStringFromSelector(sel_suggestion);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", suggestion, v6);

  selectedActivity = self->_selectedActivity;
  NSStringFromSelector(sel_selectedActivity);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", selectedActivity, v8);

  type = self->_type;
  NSStringFromSelector(sel_type);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", type, v10);

}

- (TUNearbySuggestion)suggestion
{
  return self->_suggestion;
}

- (TUConversationActivity)selectedActivity
{
  return self->_selectedActivity;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedActivity, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end
