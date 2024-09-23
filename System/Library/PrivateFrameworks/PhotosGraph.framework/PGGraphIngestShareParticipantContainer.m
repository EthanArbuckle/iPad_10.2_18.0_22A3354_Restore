@implementation PGGraphIngestShareParticipantContainer

- (NSString)fullName
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[PGGraphIngestShareParticipantContainer personIdentityFound](self, "personIdentityFound"))
  {
    -[PGGraphIngestShareParticipantContainer linkedPersonIdentity](self, "linkedPersonIdentity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fullName");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PGGraphIngestShareParticipantContainer shareParticipant](self, "shareParticipant");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nameComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v4 = &stru_1E8436F28;
      return (NSString *)v4;
    }
    v7 = (void *)MEMORY[0x1E0CB3858];
    -[PGGraphIngestShareParticipantContainer shareParticipant](self, "shareParticipant");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "nameComponents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringFromPersonNameComponents:style:options:", v8, 0, 0);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v4;
}

- (NSString)localIdentifier
{
  void *v3;
  __CFString *v4;

  if (-[PGGraphIngestShareParticipantContainer personIdentityFound](self, "personIdentityFound"))
  {
    -[PGGraphIngestShareParticipantContainer linkedPersonIdentity](self, "linkedPersonIdentity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localIdentifier");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = &stru_1E8436F28;
  }
  return (NSString *)v4;
}

- (NSString)contactID
{
  void *v3;
  __CFString *v4;

  if (-[PGGraphIngestShareParticipantContainer personIdentityFound](self, "personIdentityFound"))
  {
    -[PGGraphIngestShareParticipantContainer linkedPersonIdentity](self, "linkedPersonIdentity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contactID");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = &stru_1E8436F28;
  }
  return (NSString *)v4;
}

- (NSString)shareParticipantLocalIdentifier
{
  void *v2;
  void *v3;

  -[PGGraphIngestShareParticipantContainer shareParticipant](self, "shareParticipant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isFavorite
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[PGGraphIngestShareParticipantContainer personIdentityFound](self, "personIdentityFound");
  if (v3)
  {
    -[PGGraphIngestShareParticipantContainer linkedPersonIdentity](self, "linkedPersonIdentity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isFavorite");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isHidden
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[PGGraphIngestShareParticipantContainer personIdentityFound](self, "personIdentityFound");
  if (v3)
  {
    -[PGGraphIngestShareParticipantContainer linkedPersonIdentity](self, "linkedPersonIdentity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isHidden");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isUserCreated
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[PGGraphIngestShareParticipantContainer personIdentityFound](self, "personIdentityFound");
  if (v3)
  {
    -[PGGraphIngestShareParticipantContainer linkedPersonIdentity](self, "linkedPersonIdentity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isUserCreated");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isMe
{
  void *v2;
  char v3;

  -[PGGraphIngestShareParticipantContainer shareParticipant](self, "shareParticipant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentUser");

  return v3;
}

- (NSDate)birthdayDate
{
  void *v3;
  void *v4;

  if (-[PGGraphIngestShareParticipantContainer personIdentityFound](self, "personIdentityFound"))
  {
    -[PGGraphIngestShareParticipantContainer linkedPersonIdentity](self, "linkedPersonIdentity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "birthdayDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (NSDate)potentialBirthdayDate
{
  void *v3;
  void *v4;

  if (-[PGGraphIngestShareParticipantContainer personIdentityFound](self, "personIdentityFound"))
  {
    -[PGGraphIngestShareParticipantContainer linkedPersonIdentity](self, "linkedPersonIdentity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "potentialBirthdayDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (NSDate)anniversaryDate
{
  void *v3;
  void *v4;

  if (-[PGGraphIngestShareParticipantContainer personIdentityFound](self, "personIdentityFound"))
  {
    -[PGGraphIngestShareParticipantContainer linkedPersonIdentity](self, "linkedPersonIdentity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "anniversaryDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (unint64_t)relationship
{
  void *v3;
  unint64_t v4;

  if (!-[PGGraphIngestShareParticipantContainer personIdentityFound](self, "personIdentityFound"))
    return 0;
  -[PGGraphIngestShareParticipantContainer linkedPersonIdentity](self, "linkedPersonIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "relationship");

  return v4;
}

- (unint64_t)ageCategory
{
  void *v3;
  unint64_t v4;

  if (!-[PGGraphIngestShareParticipantContainer personIdentityFound](self, "personIdentityFound"))
    return 0;
  -[PGGraphIngestShareParticipantContainer linkedPersonIdentity](self, "linkedPersonIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ageCategory");

  return v4;
}

- (unint64_t)sex
{
  void *v3;
  unint64_t v4;

  if (!-[PGGraphIngestShareParticipantContainer personIdentityFound](self, "personIdentityFound"))
    return 0;
  -[PGGraphIngestShareParticipantContainer linkedPersonIdentity](self, "linkedPersonIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sex");

  return v4;
}

- (NSDictionary)locationsByAddressTypes
{
  void *v3;
  void *v4;

  if (-[PGGraphIngestShareParticipantContainer personIdentityFound](self, "personIdentityFound"))
  {
    -[PGGraphIngestShareParticipantContainer linkedPersonIdentity](self, "linkedPersonIdentity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "locationsByAddressTypes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA70];
  }
  return (NSDictionary *)v4;
}

- (PGGraphIngestShareParticipantContainer)initWithShareParticipant:(id)a3 person:(id)a4
{
  id v6;
  id v7;
  PGGraphIngestShareParticipantContainer *v8;
  PGGraphIngestShareParticipantContainer *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PGGraphIngestShareParticipantContainer;
  v8 = -[PGGraphIngestShareParticipantContainer init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[PGGraphIngestShareParticipantContainer setShareParticipant:](v8, "setShareParticipant:", v6);
    -[PGGraphIngestShareParticipantContainer setLinkedPersonIdentity:](v9, "setLinkedPersonIdentity:", v7);
    -[PGGraphIngestShareParticipantContainer setPersonIdentityFound:](v9, "setPersonIdentityFound:", v7 != 0);
  }

  return v9;
}

- (PHShareParticipant)shareParticipant
{
  return self->_shareParticipant;
}

- (void)setShareParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_shareParticipant, a3);
}

- (CLSPersonIdentity)linkedPersonIdentity
{
  return self->_linkedPersonIdentity;
}

- (void)setLinkedPersonIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_linkedPersonIdentity, a3);
}

- (BOOL)personIdentityFound
{
  return self->_personIdentityFound;
}

- (void)setPersonIdentityFound:(BOOL)a3
{
  self->_personIdentityFound = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedPersonIdentity, 0);
  objc_storeStrong((id *)&self->_shareParticipant, 0);
}

@end
