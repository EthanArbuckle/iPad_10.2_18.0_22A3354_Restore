@implementation PXCMMMomentsParticipant

- (PXCMMMomentsParticipant)initWithEmailAddress:(id)a3 phoneNumber:(id)a4 localizedName:(id)a5
{
  unint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  PXCMMMomentsParticipant *v14;
  uint64_t v15;
  NSString *additionalLocalizedName;
  void *v18;
  objc_super v19;

  v9 = (unint64_t)a3;
  v10 = (unint64_t)a4;
  v11 = a5;
  if (!(v9 | v10))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMMomentsInvitation.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("emailAddress || phoneNumber"));

  }
  if (v9)
    v12 = 1;
  else
    v12 = 2;
  if (v9)
    v13 = v9;
  else
    v13 = v10;
  v19.receiver = self;
  v19.super_class = (Class)PXCMMMomentsParticipant;
  v14 = -[PXRecipient initWithAddress:nameComponents:recipientKind:](&v19, sel_initWithAddress_nameComponents_recipientKind_, v13, 0, v12);
  if (v14)
  {
    v15 = objc_msgSend(v11, "copy");
    additionalLocalizedName = v14->_additionalLocalizedName;
    v14->_additionalLocalizedName = (NSString *)v15;

  }
  return v14;
}

- (PXCMMMomentsParticipant)initWithPerson:(id)a3
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  PXCMMMomentsParticipant *v18;
  void *v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMMomentsInvitation.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("person"));

  }
  v7 = *MEMORY[0x1E0C967C0];
  v21[0] = *MEMORY[0x1E0C966A8];
  v21[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "linkedContactWithKeysToFetch:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "emailAddresses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "value");
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "phoneNumbers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringValue");
    v16 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
    v12 = 0;
  }
  if (!(v12 | v16))
    v12 = (uint64_t)CFSTR("foo@bar.com");
  objc_msgSend(v6, "px_localizedName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PXCMMMomentsParticipant initWithEmailAddress:phoneNumber:localizedName:](self, "initWithEmailAddress:phoneNumber:localizedName:", v12, v16, v17);

  if (v18)
    objc_storeStrong((id *)&v18->_person, a3);

  return v18;
}

- (id)localizedName
{
  NSString *additionalLocalizedName;

  additionalLocalizedName = self->_additionalLocalizedName;
  if (additionalLocalizedName)
    return additionalLocalizedName;
  -[PXCMMMomentsParticipant localizedName](self, "localizedName");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PHPerson)person
{
  return self->_person;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_additionalLocalizedName, 0);
}

@end
