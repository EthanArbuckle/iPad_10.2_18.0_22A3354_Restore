@implementation _PSContactSuggestion

- (_PSContactSuggestion)initWithContact:(id)a3 andScore:(double)a4
{
  id v7;
  _PSContactSuggestion *v8;
  _PSContactSuggestion *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_PSContactSuggestion;
  v8 = -[_PSContactSuggestion init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_contact, a3);
    v9->_peopleWidgetScore = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_PSContactSuggestion)initWithCoder:(id)a3
{
  id v4;
  _PSContactSuggestion *v5;
  uint64_t v6;
  NSString *contactIdentifier;
  uint64_t v8;
  NSString *givenName;
  uint64_t v10;
  NSString *familyName;
  uint64_t v12;
  NSString *suggestedHandle;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSSet *daysInteracted;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSDictionary *handleAndAppFrequencies;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSDictionary *handleAndAppRegularityScores;
  _PSContactSuggestion *v32;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)_PSContactSuggestion;
  v5 = -[_PSContactSuggestion init](&v34, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("givenName"));
    v8 = objc_claimAutoreleasedReturnValue();
    givenName = v5->_givenName;
    v5->_givenName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("familyName"));
    v10 = objc_claimAutoreleasedReturnValue();
    familyName = v5->_familyName;
    v5->_familyName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suggestedHandle"));
    v12 = objc_claimAutoreleasedReturnValue();
    suggestedHandle = v5->_suggestedHandle;
    v5->_suggestedHandle = (NSString *)v12;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("regularityScore"));
    v5->_regularityScore = v14;
    v5->_totalFrequency = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("totalFrequency"));
    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("daysInteracted"));
    v18 = objc_claimAutoreleasedReturnValue();
    daysInteracted = v5->_daysInteracted;
    v5->_daysInteracted = (NSSet *)v18;

    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("handleAndAppFrequencies"));
    v24 = objc_claimAutoreleasedReturnValue();
    handleAndAppFrequencies = v5->_handleAndAppFrequencies;
    v5->_handleAndAppFrequencies = (NSDictionary *)v24;

    v26 = (void *)MEMORY[0x1E0C99E60];
    v27 = objc_opt_class();
    v28 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("handleAndAppRegularityScores"));
    v30 = objc_claimAutoreleasedReturnValue();
    handleAndAppRegularityScores = v5->_handleAndAppRegularityScores;
    v5->_handleAndAppRegularityScores = (NSDictionary *)v30;

    v32 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *contactIdentifier;
  id v5;

  contactIdentifier = self->_contactIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contactIdentifier, CFSTR("contactIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_givenName, CFSTR("givenName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_familyName, CFSTR("familyName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_suggestedHandle, CFSTR("suggestedHandle"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("regularityScore"), self->_regularityScore);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_totalFrequency, CFSTR("totalFrequency"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_handleAndAppFrequencies, CFSTR("handleAndAppFrequencies"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_handleAndAppRegularityScores, CFSTR("handleAndAppRegularityScores"));

}

- (unint64_t)hash
{
  return -[NSString hash](self->_contactIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _PSContactSuggestion *v4;
  _PSContactSuggestion *v5;
  _PSContactSuggestion *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (_PSContactSuggestion *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[_PSContactSuggestion contactIdentifier](self, "contactIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7
      && (v8 = (void *)v7,
          -[_PSContactSuggestion contactIdentifier](v6, "contactIdentifier"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v9,
          v8,
          v9))
    {
      -[_PSContactSuggestion contactIdentifier](self, "contactIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSContactSuggestion contactIdentifier](v6, "contactIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToString:", v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_PSContactSuggestion contactIdentifier](self, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSContactSuggestion suggestedHandle](self, "suggestedHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> contactIdentifier: %@, suggestedHandle: %@"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void)setGivenName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)suggestedHandle
{
  return self->_suggestedHandle;
}

- (void)setSuggestedHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)regularityScore
{
  return self->_regularityScore;
}

- (void)setRegularityScore:(double)a3
{
  self->_regularityScore = a3;
}

- (unint64_t)totalFrequency
{
  return self->_totalFrequency;
}

- (void)setTotalFrequency:(unint64_t)a3
{
  self->_totalFrequency = a3;
}

- (NSSet)daysInteracted
{
  return self->_daysInteracted;
}

- (void)setDaysInteracted:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)messagesGroupIdentifier
{
  return self->_messagesGroupIdentifier;
}

- (void)setMessagesGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)groupRecipients
{
  return self->_groupRecipients;
}

- (void)setGroupRecipients:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSDictionary)handleAndAppFrequencies
{
  return self->_handleAndAppFrequencies;
}

- (void)setHandleAndAppFrequencies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSDictionary)handleAndAppRegularityScores
{
  return self->_handleAndAppRegularityScores;
}

- (void)setHandleAndAppRegularityScores:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (double)peopleWidgetScore
{
  return self->_peopleWidgetScore;
}

- (void)setPeopleWidgetScore:(double)a3
{
  self->_peopleWidgetScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_handleAndAppRegularityScores, 0);
  objc_storeStrong((id *)&self->_handleAndAppFrequencies, 0);
  objc_storeStrong((id *)&self->_groupRecipients, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_messagesGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_daysInteracted, 0);
  objc_storeStrong((id *)&self->_suggestedHandle, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

@end
