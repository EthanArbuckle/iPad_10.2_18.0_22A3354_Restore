@implementation PKPlaceholderPassConfiguration

- (PKPlaceholderPassConfiguration)initWithSubcredential:(id)a3 automaticSelectionCriterion:(id)a4
{
  id v7;
  id v8;
  PKPlaceholderPassConfiguration *v9;
  PKPlaceholderPassConfiguration *v10;
  PKPlaceholderPassConfiguration *v11;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = -[PKPlaceholderPassConfiguration init](self, "init");
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_subcredential, a3);
      objc_storeStrong((id *)&v10->_automaticSelectionCriterion, a4);
      v10->_paymentApplicationState = -[PKAppletSubcredential state](v10->_subcredential, "state");
    }
    self = v10;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; Subcredential: %@, automaticSelectionCriterion: %@, paymentApplicationState: %ld. associatedApplicationIdentifiers: %@ >"),
               objc_opt_class(),
               self,
               self->_subcredential,
               self->_automaticSelectionCriterion,
               self->_paymentApplicationState,
               self->_associatedApplicationIdentifiers);
}

- (void)encodeWithCoder:(id)a3
{
  PKAppletSubcredential *subcredential;
  id v5;

  subcredential = self->_subcredential;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", subcredential, CFSTR("subcredential"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_automaticSelectionCriterion, CFSTR("automaticSelectionCriterion"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_paymentApplicationState, CFSTR("paymentApplicationState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedApplicationIdentifiers, CFSTR("associatedApplicationIdentifiers"));

}

- (PKPlaceholderPassConfiguration)initWithCoder:(id)a3
{
  id v4;
  PKPlaceholderPassConfiguration *v5;
  uint64_t v6;
  PKAppletSubcredential *subcredential;
  uint64_t v8;
  PKPassAutomaticSelectionCriterion *automaticSelectionCriterion;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *associatedApplicationIdentifiers;

  v4 = a3;
  v5 = -[PKPlaceholderPassConfiguration init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subcredential"));
    v6 = objc_claimAutoreleasedReturnValue();
    subcredential = v5->_subcredential;
    v5->_subcredential = (PKAppletSubcredential *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("automaticSelectionCriterion"));
    v8 = objc_claimAutoreleasedReturnValue();
    automaticSelectionCriterion = v5->_automaticSelectionCriterion;
    v5->_automaticSelectionCriterion = (PKPassAutomaticSelectionCriterion *)v8;

    v5->_paymentApplicationState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("paymentApplicationState"));
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("associatedApplicationIdentifiers"));
    v13 = objc_claimAutoreleasedReturnValue();
    associatedApplicationIdentifiers = v5->_associatedApplicationIdentifiers;
    v5->_associatedApplicationIdentifiers = (NSArray *)v13;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAppletSubcredential)subcredential
{
  return self->_subcredential;
}

- (PKPassAutomaticSelectionCriterion)automaticSelectionCriterion
{
  return self->_automaticSelectionCriterion;
}

- (int64_t)paymentApplicationState
{
  return self->_paymentApplicationState;
}

- (NSArray)associatedApplicationIdentifiers
{
  return self->_associatedApplicationIdentifiers;
}

- (void)setAssociatedApplicationIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)passFields
{
  return self->_passFields;
}

- (void)setPassFields:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passFields, 0);
  objc_storeStrong((id *)&self->_associatedApplicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_automaticSelectionCriterion, 0);
  objc_storeStrong((id *)&self->_subcredential, 0);
}

@end
