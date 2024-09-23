@implementation PXPeoplePickerMockPerson

- (PXPeoplePickerMockPerson)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerMockPerson.m"), 23, CFSTR("%s is not available as initializer"), "-[PXPeoplePickerMockPerson init]");

  abort();
}

- (PXPeoplePickerMockPerson)initWithLocalIdentifier:(id)a3 displayName:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PXPeoplePickerMockPerson *v10;
  uint64_t v11;
  NSString *mockName;
  uint64_t v13;
  NSString *mockLocalIdentifier;
  void *v16;
  void *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerMockPerson.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localIdentifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerMockPerson.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayName"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)PXPeoplePickerMockPerson;
  v10 = -[PXPeoplePickerMockPerson init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v9, "copy");
    mockName = v10->_mockName;
    v10->_mockName = (NSString *)v11;

    v13 = objc_msgSend(v7, "copy");
    mockLocalIdentifier = v10->_mockLocalIdentifier;
    v10->_mockLocalIdentifier = (NSString *)v13;

  }
  return v10;
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
  -[PXPeoplePickerMockPerson mockName](self, "mockName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeoplePickerMockPerson px_localizedName](self, "px_localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p, uuid:%@, displayName:%@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)mockName
{
  return self->_mockName;
}

- (void)setMockName:(id)a3
{
  objc_storeStrong((id *)&self->_mockName, a3);
}

- (NSString)mockLocalIdentifier
{
  return self->_mockLocalIdentifier;
}

- (void)setMockLocalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_mockLocalIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mockLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_mockName, 0);
}

@end
