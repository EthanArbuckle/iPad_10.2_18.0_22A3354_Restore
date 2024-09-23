@implementation REMGrocerySuggestions

- (REMGrocerySuggestions)initWithSuggestedSectionsByReminderTitle:(id)a3
{
  id v5;
  REMGrocerySuggestions *v6;
  REMGrocerySuggestions *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMGrocerySuggestions;
  v6 = -[REMGrocerySuggestions init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_suggestedSectionsByReminderTitle, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  if (a3 == self)
    return 1;
  v4 = a3;
  v5 = objc_opt_class();
  REMDynamicCast(v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMGrocerySuggestions suggestedSectionsByReminderTitle](self, "suggestedSectionsByReminderTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "suggestedSectionsByReminderTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == v8)
  {
    v11 = 1;
  }
  else
  {
    -[REMGrocerySuggestions suggestedSectionsByReminderTitle](self, "suggestedSectionsByReminderTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "suggestedSectionsByReminderTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = objc_alloc((Class)objc_opt_class());
  -[REMGrocerySuggestions suggestedSectionsByReminderTitle](self, "suggestedSectionsByReminderTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  v8 = (void *)objc_msgSend(v5, "initWithSuggestedSectionsByReminderTitle:", v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMGrocerySuggestions suggestedSectionsByReminderTitle](self, "suggestedSectionsByReminderTitle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("suggestedSectionsByReminderTitle"));

}

- (REMGrocerySuggestions)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  REMGrocerySuggestions *v11;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v9, CFSTR("suggestedSectionsByReminderTitle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[REMGrocerySuggestions initWithSuggestedSectionsByReminderTitle:](self, "initWithSuggestedSectionsByReminderTitle:", v10);
  return v11;
}

- (NSDictionary)suggestedSectionsByReminderTitle
{
  return self->_suggestedSectionsByReminderTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedSectionsByReminderTitle, 0);
}

@end
