@implementation PKFieldMetadata

- (BOOL)shouldIgnoreField
{
  return self->_shouldIgnoreField;
}

- (PKFieldMetadata)initWithAssociatedPassIdentifiers:(id)a3 shouldIgnoreField:(BOOL)a4 foundExplicitlyRequestedPass:(BOOL)a5
{
  id v9;
  PKFieldMetadata *v10;
  PKFieldMetadata *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKFieldMetadata;
  v10 = -[PKFieldMetadata init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_associatedPassIdentifiers, a3);
    v11->_shouldIgnoreField = a4;
    v11->_foundExplicitlyRequestedPass = a5;
  }

  return v11;
}

- (NSArray)associatedPassIdentifiers
{
  return self->_associatedPassIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedPassIdentifiers, 0);
}

- (PKFieldMetadata)init
{

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *associatedPassIdentifiers;
  id v5;

  associatedPassIdentifiers = self->_associatedPassIdentifiers;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", associatedPassIdentifiers, CFSTR("associatedPassIdentifiers"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldIgnoreField, CFSTR("shouldIgnoreField"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_foundExplicitlyRequestedPass, CFSTR("foundExplicitlyRequestedPass"));

}

- (PKFieldMetadata)initWithCoder:(id)a3
{
  id v4;
  PKFieldMetadata *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *associatedPassIdentifiers;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKFieldMetadata;
  v5 = -[PKFieldMetadata init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("associatedPassIdentifiers"));
    v9 = objc_claimAutoreleasedReturnValue();
    associatedPassIdentifiers = v5->_associatedPassIdentifiers;
    v5->_associatedPassIdentifiers = (NSArray *)v9;

    v5->_shouldIgnoreField = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldIgnoreField"));
    v5->_foundExplicitlyRequestedPass = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("foundExplicitlyRequestedPass"));
  }

  return v5;
}

- (BOOL)foundExplicitlyRequestedPass
{
  return self->_foundExplicitlyRequestedPass;
}

@end
