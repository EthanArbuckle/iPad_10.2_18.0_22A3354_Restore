@implementation PXCMMSharedAlbumParticipant

- (PXCMMSharedAlbumParticipant)initWithRecord:(id)a3
{
  id v4;
  PXCMMSharedAlbumParticipant *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  NSString *phoneNumberString;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  uint64_t v19;
  NSString *lastName;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PXCMMSharedAlbumParticipant;
  v5 = -[PXCMMSharedAlbumParticipant init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "inviteeEmails");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = (__CFString *)v7;
    else
      v9 = CFSTR("bob@bob.com");
    objc_storeStrong((id *)&v5->_emailAddressString, v9);

    objc_msgSend(v4, "inviteePhones");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = objc_claimAutoreleasedReturnValue();
    phoneNumberString = v5->_phoneNumberString;
    v5->_phoneNumberString = (NSString *)v11;

    objc_msgSend(v4, "inviteeFirstName");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (__CFString *)v13;
    else
      v15 = CFSTR("Bob");
    objc_storeStrong((id *)&v5->_localizedName, v15);

    objc_msgSend(v4, "inviteeFirstName");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
      v18 = (__CFString *)v16;
    else
      v18 = CFSTR("Bob");
    objc_storeStrong((id *)&v5->_firstName, v18);

    objc_msgSend(v4, "inviteeLastName");
    v19 = objc_claimAutoreleasedReturnValue();
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v19;

  }
  return v5;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PXCMMSharedAlbumParticipant emailAddressString](self, "emailAddressString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCMMSharedAlbumParticipant phoneNumberString](self, "phoneNumberString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, email: \"%@\", phone: \"%@\">"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)emailAddressString
{
  return self->_emailAddressString;
}

- (NSString)phoneNumberString
{
  return self->_phoneNumberString;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_phoneNumberString, 0);
  objc_storeStrong((id *)&self->_emailAddressString, 0);
}

@end
