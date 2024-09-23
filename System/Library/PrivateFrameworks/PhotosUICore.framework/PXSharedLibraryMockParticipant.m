@implementation PXSharedLibraryMockParticipant

- (PXSharedLibraryMockParticipant)init
{
  PXSharedLibraryMockParticipant *v2;
  void *v3;
  uint64_t v4;
  NSString *localIdentifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXSharedLibraryMockParticipant;
  v2 = -[PXSharedLibraryMockParticipant init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    localIdentifier = v2->_localIdentifier;
    v2->_localIdentifier = (NSString *)v4;

  }
  return v2;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  NSString *emailAddress;
  NSPersonNameComponents *nameComponents;
  unint64_t status;
  __CFString *v8;
  __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  emailAddress = self->_emailAddress;
  nameComponents = self->_nameComponents;
  status = self->_status;
  if (status > 4)
    v8 = CFSTR("Invalid");
  else
    v8 = off_1E512A3B0[status];
  v9 = v8;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p, emailAddress: \"%@\", nameComponents: \"%@\", status: \"%@\">"), v4, self, emailAddress, nameComponents, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (int64_t)requestImageWithTargetSize:(CGSize)a3 displayScale:(double)a4 isRTL:(BOOL)a5 completionHandler:(id)a6
{
  double height;
  double width;
  id v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;

  height = a3.height;
  width = a3.width;
  v11 = a6;
  if (PXSizeIsEmpty())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryMockParticipant.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!PXSizeIsEmpty(targetSize)"));

  }
  if (a4 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryMockParticipant.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayScale > 0"));

    if (v11)
      goto LABEL_5;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryMockParticipant.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_5;
  }
  if (!v11)
    goto LABEL_7;
LABEL_5:
  PXSharedLibraryTestingParticipantImageWithSize(width, height, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD, _QWORD))v11 + 2))(v11, v12, MEMORY[0x1E0C9AAA0], 0);

  return 0;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (void)setNameComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isCurrentUser
{
  return self->_isCurrentUser;
}

- (void)setIsCurrentUser:(BOOL)a3
{
  self->_isCurrentUser = a3;
}

- (PXPerson)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
}

- (int64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
}

@end
