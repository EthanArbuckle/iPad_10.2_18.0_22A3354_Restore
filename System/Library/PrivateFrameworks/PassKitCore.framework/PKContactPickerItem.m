@implementation PKContactPickerItem

- (PKContactPickerItem)initWithDictionary:(id)a3
{
  id v4;
  PKContactPickerItem *v5;
  uint64_t v6;
  NSString *displayName;
  uint64_t v8;
  NSString *submissionValue;
  uint64_t v10;
  NSArray *alternativeAcceptedValues;
  PKContactPickerItem *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKContactPickerItem;
  v5 = -[PKContactPickerItem init](&v14, sel_init);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("displayName"));
  v6 = objc_claimAutoreleasedReturnValue();
  displayName = v5->_displayName;
  v5->_displayName = (NSString *)v6;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("submissionValue"));
  v8 = objc_claimAutoreleasedReturnValue();
  submissionValue = v5->_submissionValue;
  v5->_submissionValue = (NSString *)v8;

  objc_msgSend(v4, "PKArrayForKey:", CFSTR("alternativeAcceptedValues"));
  v10 = objc_claimAutoreleasedReturnValue();
  alternativeAcceptedValues = v5->_alternativeAcceptedValues;
  v5->_alternativeAcceptedValues = (NSArray *)v10;

  if (!v5->_displayName)
    goto LABEL_5;
  if (v5->_submissionValue)
LABEL_4:
    v12 = v5;
  else
LABEL_5:
    v12 = 0;

  return v12;
}

- (id)acceptedValues
{
  NSMutableSet *acceptedValues;
  id v4;
  NSMutableSet *v5;
  NSMutableSet *v6;

  acceptedValues = self->_acceptedValues;
  if (!acceptedValues)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(v4, "addObject:", self->_submissionValue);
    objc_msgSend(v4, "addObject:", self->_displayName);
    objc_msgSend(v4, "addObjectsFromArray:", self->_alternativeAcceptedValues);
    v5 = (NSMutableSet *)objc_msgSend(v4, "copy");
    v6 = self->_acceptedValues;
    self->_acceptedValues = v5;

    acceptedValues = self->_acceptedValues;
  }
  return acceptedValues;
}

- (BOOL)isValueAccepted:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PKContactPickerItem acceptedValues](self, "acceptedValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "caseInsensitiveCompare:", v4))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p; "),
                 objc_opt_class(),
                 self);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("displayName"), self->_displayName);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("submissionValue"), self->_submissionValue);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "),
    CFSTR("alternativeAcceptedValues"),
    self->_alternativeAcceptedValues);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *displayName;
  id v5;

  displayName = self->_displayName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", displayName, CFSTR("displayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_submissionValue, CFSTR("submissionValue"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_alternativeAcceptedValues, CFSTR("alternativeAcceptedValues"));

}

- (PKContactPickerItem)initWithCoder:(id)a3
{
  id v4;
  PKContactPickerItem *v5;
  uint64_t v6;
  NSString *displayName;
  uint64_t v8;
  NSString *submissionValue;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *alternativeAcceptedValues;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKContactPickerItem;
  v5 = -[PKContactPickerItem init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v6 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("submissionValue"));
    v8 = objc_claimAutoreleasedReturnValue();
    submissionValue = v5->_submissionValue;
    v5->_submissionValue = (NSString *)v8;

    v10 = objc_alloc(MEMORY[0x1E0C99E60]);
    v11 = objc_opt_class();
    v12 = (void *)objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("alternativeAcceptedValues"));
    v13 = objc_claimAutoreleasedReturnValue();
    alternativeAcceptedValues = v5->_alternativeAcceptedValues;
    v5->_alternativeAcceptedValues = (NSArray *)v13;

  }
  return v5;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)submissionValue
{
  return self->_submissionValue;
}

- (NSArray)alternativeAcceptedValues
{
  return self->_alternativeAcceptedValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeAcceptedValues, 0);
  objc_storeStrong((id *)&self->_submissionValue, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_acceptedValues, 0);
}

@end
