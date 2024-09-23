@implementation PPPBContact

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasGivenName
{
  return self->_givenName != 0;
}

- (BOOL)hasMiddleName
{
  return self->_middleName != 0;
}

- (BOOL)hasFamilyName
{
  return self->_familyName != 0;
}

- (BOOL)hasNickname
{
  return self->_nickname != 0;
}

- (void)clearPhoneNumbers
{
  -[NSMutableArray removeAllObjects](self->_phoneNumbers, "removeAllObjects");
}

- (void)addPhoneNumbers:(id)a3
{
  id v4;
  NSMutableArray *phoneNumbers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  phoneNumbers = self->_phoneNumbers;
  v8 = v4;
  if (!phoneNumbers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_phoneNumbers;
    self->_phoneNumbers = v6;

    v4 = v8;
    phoneNumbers = self->_phoneNumbers;
  }
  -[NSMutableArray addObject:](phoneNumbers, "addObject:", v4);

}

- (unint64_t)phoneNumbersCount
{
  return -[NSMutableArray count](self->_phoneNumbers, "count");
}

- (id)phoneNumbersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_phoneNumbers, "objectAtIndex:", a3);
}

- (void)clearEmailAddresses
{
  -[NSMutableArray removeAllObjects](self->_emailAddresses, "removeAllObjects");
}

- (void)addEmailAddresses:(id)a3
{
  id v4;
  NSMutableArray *emailAddresses;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  emailAddresses = self->_emailAddresses;
  v8 = v4;
  if (!emailAddresses)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_emailAddresses;
    self->_emailAddresses = v6;

    v4 = v8;
    emailAddresses = self->_emailAddresses;
  }
  -[NSMutableArray addObject:](emailAddresses, "addObject:", v4);

}

- (unint64_t)emailAddressesCount
{
  return -[NSMutableArray count](self->_emailAddresses, "count");
}

- (id)emailAddressesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_emailAddresses, "objectAtIndex:", a3);
}

- (void)clearPostalAddresses
{
  -[NSMutableArray removeAllObjects](self->_postalAddresses, "removeAllObjects");
}

- (void)addPostalAddresses:(id)a3
{
  id v4;
  NSMutableArray *postalAddresses;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  postalAddresses = self->_postalAddresses;
  v8 = v4;
  if (!postalAddresses)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_postalAddresses;
    self->_postalAddresses = v6;

    v4 = v8;
    postalAddresses = self->_postalAddresses;
  }
  -[NSMutableArray addObject:](postalAddresses, "addObject:", v4);

}

- (unint64_t)postalAddressesCount
{
  return -[NSMutableArray count](self->_postalAddresses, "count");
}

- (id)postalAddressesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_postalAddresses, "objectAtIndex:", a3);
}

- (BOOL)hasOrganizationName
{
  return self->_organizationName != 0;
}

- (BOOL)hasBirthday
{
  return self->_birthday != 0;
}

- (BOOL)hasNonGregorianBirthday
{
  return self->_nonGregorianBirthday != 0;
}

- (void)clearSocialProfiles
{
  -[NSMutableArray removeAllObjects](self->_socialProfiles, "removeAllObjects");
}

- (void)addSocialProfiles:(id)a3
{
  id v4;
  NSMutableArray *socialProfiles;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  socialProfiles = self->_socialProfiles;
  v8 = v4;
  if (!socialProfiles)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_socialProfiles;
    self->_socialProfiles = v6;

    v4 = v8;
    socialProfiles = self->_socialProfiles;
  }
  -[NSMutableArray addObject:](socialProfiles, "addObject:", v4);

}

- (unint64_t)socialProfilesCount
{
  return -[NSMutableArray count](self->_socialProfiles, "count");
}

- (id)socialProfilesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_socialProfiles, "objectAtIndex:", a3);
}

- (BOOL)hasNamePrefix
{
  return self->_namePrefix != 0;
}

- (BOOL)hasNameSuffix
{
  return self->_nameSuffix != 0;
}

- (void)setDisplayNameOrder:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_displayNameOrder = a3;
}

- (void)setHasDisplayNameOrder:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDisplayNameOrder
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasSortingGivenName
{
  return self->_sortingGivenName != 0;
}

- (BOOL)hasSortingFamilyName
{
  return self->_sortingFamilyName != 0;
}

- (void)setCreatedAt:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_createdAt = a3;
}

- (void)setHasCreatedAt:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreatedAt
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PPPBContact;
  -[PPPBContact description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPPBContact dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  NSString *givenName;
  NSString *middleName;
  NSString *familyName;
  NSString *nickname;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  NSString *organizationName;
  PPPBDateComponents *birthday;
  void *v33;
  PPPBDateComponents *nonGregorianBirthday;
  void *v35;
  void *v36;
  NSMutableArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t m;
  void *v42;
  NSString *namePrefix;
  NSString *nameSuffix;
  void *v45;
  NSString *sortingGivenName;
  NSString *sortingFamilyName;
  void *v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  givenName = self->_givenName;
  if (givenName)
    objc_msgSend(v4, "setObject:forKey:", givenName, CFSTR("givenName"));
  middleName = self->_middleName;
  if (middleName)
    objc_msgSend(v4, "setObject:forKey:", middleName, CFSTR("middleName"));
  familyName = self->_familyName;
  if (familyName)
    objc_msgSend(v4, "setObject:forKey:", familyName, CFSTR("familyName"));
  nickname = self->_nickname;
  if (nickname)
    objc_msgSend(v4, "setObject:forKey:", nickname, CFSTR("nickname"));
  if (-[NSMutableArray count](self->_phoneNumbers, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_phoneNumbers, "count"));
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v11 = self->_phoneNumbers;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v63 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * i), "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
      }
      while (v13);
    }

    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("phoneNumbers"));
  }
  if (-[NSMutableArray count](self->_emailAddresses, "count"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_emailAddresses, "count"));
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v18 = self->_emailAddresses;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v59;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v59 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * j), "dictionaryRepresentation");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v23);

        }
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
      }
      while (v20);
    }

    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("emailAddresses"));
  }
  if (-[NSMutableArray count](self->_postalAddresses, "count"))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_postalAddresses, "count"));
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v25 = self->_postalAddresses;
    v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v55;
      do
      {
        for (k = 0; k != v27; ++k)
        {
          if (*(_QWORD *)v55 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * k), "dictionaryRepresentation");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v30);

        }
        v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
      }
      while (v27);
    }

    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("postalAddresses"));
  }
  organizationName = self->_organizationName;
  if (organizationName)
    objc_msgSend(v4, "setObject:forKey:", organizationName, CFSTR("organizationName"));
  birthday = self->_birthday;
  if (birthday)
  {
    -[PPPBDateComponents dictionaryRepresentation](birthday, "dictionaryRepresentation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("birthday"));

  }
  nonGregorianBirthday = self->_nonGregorianBirthday;
  if (nonGregorianBirthday)
  {
    -[PPPBDateComponents dictionaryRepresentation](nonGregorianBirthday, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("nonGregorianBirthday"));

  }
  if (-[NSMutableArray count](self->_socialProfiles, "count"))
  {
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_socialProfiles, "count"));
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v37 = self->_socialProfiles;
    v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v51;
      do
      {
        for (m = 0; m != v39; ++m)
        {
          if (*(_QWORD *)v51 != v40)
            objc_enumerationMutation(v37);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * m), "dictionaryRepresentation", (_QWORD)v50);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addObject:", v42);

        }
        v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
      }
      while (v39);
    }

    objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("socialProfiles"));
  }
  namePrefix = self->_namePrefix;
  if (namePrefix)
    objc_msgSend(v4, "setObject:forKey:", namePrefix, CFSTR("namePrefix"));
  nameSuffix = self->_nameSuffix;
  if (nameSuffix)
    objc_msgSend(v4, "setObject:forKey:", nameSuffix, CFSTR("nameSuffix"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_displayNameOrder);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v45, CFSTR("displayNameOrder"));

  }
  sortingGivenName = self->_sortingGivenName;
  if (sortingGivenName)
    objc_msgSend(v4, "setObject:forKey:", sortingGivenName, CFSTR("sortingGivenName"));
  sortingFamilyName = self->_sortingFamilyName;
  if (sortingFamilyName)
    objc_msgSend(v4, "setObject:forKey:", sortingFamilyName, CFSTR("sortingFamilyName"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_createdAt);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v48, CFSTR("created_at"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PPPBContactReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_identifier)
    PBDataWriterWriteStringField();
  if (self->_givenName)
    PBDataWriterWriteStringField();
  if (self->_middleName)
    PBDataWriterWriteStringField();
  if (self->_familyName)
    PBDataWriterWriteStringField();
  if (self->_nickname)
    PBDataWriterWriteStringField();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = self->_phoneNumbers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v38;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v7);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = self->_emailAddresses;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v12);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = self->_postalAddresses;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
    }
    while (v17);
  }

  if (self->_organizationName)
    PBDataWriterWriteStringField();
  if (self->_birthday)
    PBDataWriterWriteSubmessage();
  if (self->_nonGregorianBirthday)
    PBDataWriterWriteSubmessage();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = self->_socialProfiles;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    }
    while (v22);
  }

  if (self->_namePrefix)
    PBDataWriterWriteStringField();
  if (self->_nameSuffix)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_sortingGivenName)
    PBDataWriterWriteStringField();
  if (self->_sortingFamilyName)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  void *v19;
  _DWORD *v20;
  id v21;

  v21 = a3;
  if (self->_identifier)
    objc_msgSend(v21, "setIdentifier:");
  if (self->_givenName)
    objc_msgSend(v21, "setGivenName:");
  if (self->_middleName)
    objc_msgSend(v21, "setMiddleName:");
  if (self->_familyName)
    objc_msgSend(v21, "setFamilyName:");
  if (self->_nickname)
    objc_msgSend(v21, "setNickname:");
  if (-[PPPBContact phoneNumbersCount](self, "phoneNumbersCount"))
  {
    objc_msgSend(v21, "clearPhoneNumbers");
    v4 = -[PPPBContact phoneNumbersCount](self, "phoneNumbersCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[PPPBContact phoneNumbersAtIndex:](self, "phoneNumbersAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addPhoneNumbers:", v7);

      }
    }
  }
  if (-[PPPBContact emailAddressesCount](self, "emailAddressesCount"))
  {
    objc_msgSend(v21, "clearEmailAddresses");
    v8 = -[PPPBContact emailAddressesCount](self, "emailAddressesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[PPPBContact emailAddressesAtIndex:](self, "emailAddressesAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addEmailAddresses:", v11);

      }
    }
  }
  if (-[PPPBContact postalAddressesCount](self, "postalAddressesCount"))
  {
    objc_msgSend(v21, "clearPostalAddresses");
    v12 = -[PPPBContact postalAddressesCount](self, "postalAddressesCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[PPPBContact postalAddressesAtIndex:](self, "postalAddressesAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addPostalAddresses:", v15);

      }
    }
  }
  if (self->_organizationName)
    objc_msgSend(v21, "setOrganizationName:");
  if (self->_birthday)
    objc_msgSend(v21, "setBirthday:");
  if (self->_nonGregorianBirthday)
    objc_msgSend(v21, "setNonGregorianBirthday:");
  if (-[PPPBContact socialProfilesCount](self, "socialProfilesCount"))
  {
    objc_msgSend(v21, "clearSocialProfiles");
    v16 = -[PPPBContact socialProfilesCount](self, "socialProfilesCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[PPPBContact socialProfilesAtIndex:](self, "socialProfilesAtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addSocialProfiles:", v19);

      }
    }
  }
  if (self->_namePrefix)
    objc_msgSend(v21, "setNamePrefix:");
  v20 = v21;
  if (self->_nameSuffix)
  {
    objc_msgSend(v21, "setNameSuffix:");
    v20 = v21;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v20[6] = self->_displayNameOrder;
    *((_BYTE *)v20 + 152) |= 2u;
  }
  if (self->_sortingGivenName)
  {
    objc_msgSend(v21, "setSortingGivenName:");
    v20 = v21;
  }
  if (self->_sortingFamilyName)
  {
    objc_msgSend(v21, "setSortingFamilyName:");
    v20 = v21;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v20 + 1) = self->_createdAt;
    *((_BYTE *)v20 + 152) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  NSMutableArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v6;

  v8 = -[NSString copyWithZone:](self->_givenName, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v8;

  v10 = -[NSString copyWithZone:](self->_middleName, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v10;

  v12 = -[NSString copyWithZone:](self->_familyName, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  v14 = -[NSString copyWithZone:](self->_nickname, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v14;

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v16 = self->_phoneNumbers;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v68;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v68 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * v20), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addPhoneNumbers:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
    }
    while (v18);
  }

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v22 = self->_emailAddresses;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v64;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v64 != v25)
          objc_enumerationMutation(v22);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * v26), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addEmailAddresses:", v27);

        ++v26;
      }
      while (v24 != v26);
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
    }
    while (v24);
  }

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v28 = self->_postalAddresses;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v60;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v60 != v31)
          objc_enumerationMutation(v28);
        v33 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * v32), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addPostalAddresses:", v33);

        ++v32;
      }
      while (v30 != v32);
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
    }
    while (v30);
  }

  v34 = -[NSString copyWithZone:](self->_organizationName, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v34;

  v36 = -[PPPBDateComponents copyWithZone:](self->_birthday, "copyWithZone:", a3);
  v37 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v36;

  v38 = -[PPPBDateComponents copyWithZone:](self->_nonGregorianBirthday, "copyWithZone:", a3);
  v39 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v38;

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v40 = self->_socialProfiles;
  v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v56;
    do
    {
      v44 = 0;
      do
      {
        if (*(_QWORD *)v56 != v43)
          objc_enumerationMutation(v40);
        v45 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * v44), "copyWithZone:", a3, (_QWORD)v55);
        objc_msgSend((id)v5, "addSocialProfiles:", v45);

        ++v44;
      }
      while (v42 != v44);
      v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
    }
    while (v42);
  }

  v46 = -[NSString copyWithZone:](self->_namePrefix, "copyWithZone:", a3);
  v47 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v46;

  v48 = -[NSString copyWithZone:](self->_nameSuffix, "copyWithZone:", a3);
  v49 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v48;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_displayNameOrder;
    *(_BYTE *)(v5 + 152) |= 2u;
  }
  v50 = -[NSString copyWithZone:](self->_sortingGivenName, "copyWithZone:", a3, (_QWORD)v55);
  v51 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v50;

  v52 = -[NSString copyWithZone:](self->_sortingFamilyName, "copyWithZone:", a3);
  v53 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v52;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_createdAt;
    *(_BYTE *)(v5 + 152) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  NSString *givenName;
  NSString *middleName;
  NSString *familyName;
  NSString *nickname;
  NSMutableArray *phoneNumbers;
  NSMutableArray *emailAddresses;
  NSMutableArray *postalAddresses;
  NSString *organizationName;
  PPPBDateComponents *birthday;
  PPPBDateComponents *nonGregorianBirthday;
  NSMutableArray *socialProfiles;
  NSString *namePrefix;
  NSString *nameSuffix;
  NSString *sortingGivenName;
  NSString *sortingFamilyName;
  BOOL v21;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_43;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_43;
  }
  givenName = self->_givenName;
  if ((unint64_t)givenName | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](givenName, "isEqual:"))
      goto LABEL_43;
  }
  middleName = self->_middleName;
  if ((unint64_t)middleName | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](middleName, "isEqual:"))
      goto LABEL_43;
  }
  familyName = self->_familyName;
  if ((unint64_t)familyName | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](familyName, "isEqual:"))
      goto LABEL_43;
  }
  nickname = self->_nickname;
  if ((unint64_t)nickname | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](nickname, "isEqual:"))
      goto LABEL_43;
  }
  phoneNumbers = self->_phoneNumbers;
  if ((unint64_t)phoneNumbers | *((_QWORD *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](phoneNumbers, "isEqual:"))
      goto LABEL_43;
  }
  emailAddresses = self->_emailAddresses;
  if ((unint64_t)emailAddresses | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](emailAddresses, "isEqual:"))
      goto LABEL_43;
  }
  postalAddresses = self->_postalAddresses;
  if ((unint64_t)postalAddresses | *((_QWORD *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](postalAddresses, "isEqual:"))
      goto LABEL_43;
  }
  organizationName = self->_organizationName;
  if ((unint64_t)organizationName | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](organizationName, "isEqual:"))
      goto LABEL_43;
  }
  birthday = self->_birthday;
  if ((unint64_t)birthday | *((_QWORD *)v4 + 2))
  {
    if (!-[PPPBDateComponents isEqual:](birthday, "isEqual:"))
      goto LABEL_43;
  }
  nonGregorianBirthday = self->_nonGregorianBirthday;
  if ((unint64_t)nonGregorianBirthday | *((_QWORD *)v4 + 12))
  {
    if (!-[PPPBDateComponents isEqual:](nonGregorianBirthday, "isEqual:"))
      goto LABEL_43;
  }
  socialProfiles = self->_socialProfiles;
  if ((unint64_t)socialProfiles | *((_QWORD *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](socialProfiles, "isEqual:"))
      goto LABEL_43;
  }
  namePrefix = self->_namePrefix;
  if ((unint64_t)namePrefix | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](namePrefix, "isEqual:"))
      goto LABEL_43;
  }
  nameSuffix = self->_nameSuffix;
  if ((unint64_t)nameSuffix | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](nameSuffix, "isEqual:"))
      goto LABEL_43;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 152) & 2) == 0 || self->_displayNameOrder != *((_DWORD *)v4 + 6))
      goto LABEL_43;
  }
  else if ((*((_BYTE *)v4 + 152) & 2) != 0)
  {
LABEL_43:
    v21 = 0;
    goto LABEL_44;
  }
  sortingGivenName = self->_sortingGivenName;
  if ((unint64_t)sortingGivenName | *((_QWORD *)v4 + 18)
    && !-[NSString isEqual:](sortingGivenName, "isEqual:"))
  {
    goto LABEL_43;
  }
  sortingFamilyName = self->_sortingFamilyName;
  if ((unint64_t)sortingFamilyName | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](sortingFamilyName, "isEqual:"))
      goto LABEL_43;
  }
  v21 = (*((_BYTE *)v4 + 152) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 152) & 1) == 0 || self->_createdAt != *((_QWORD *)v4 + 1))
      goto LABEL_43;
    v21 = 1;
  }
LABEL_44:

  return v21;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  NSUInteger v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  NSUInteger v21;

  v21 = -[NSString hash](self->_identifier, "hash");
  v20 = -[NSString hash](self->_givenName, "hash");
  v19 = -[NSString hash](self->_middleName, "hash");
  v18 = -[NSString hash](self->_familyName, "hash");
  v17 = -[NSString hash](self->_nickname, "hash");
  v16 = -[NSMutableArray hash](self->_phoneNumbers, "hash");
  v15 = -[NSMutableArray hash](self->_emailAddresses, "hash");
  v14 = -[NSMutableArray hash](self->_postalAddresses, "hash");
  v13 = -[NSString hash](self->_organizationName, "hash");
  v3 = -[PPPBDateComponents hash](self->_birthday, "hash");
  v4 = -[PPPBDateComponents hash](self->_nonGregorianBirthday, "hash");
  v5 = -[NSMutableArray hash](self->_socialProfiles, "hash");
  v6 = -[NSString hash](self->_namePrefix, "hash");
  v7 = -[NSString hash](self->_nameSuffix, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v8 = 2654435761 * self->_displayNameOrder;
  else
    v8 = 0;
  v9 = -[NSString hash](self->_sortingGivenName, "hash");
  v10 = -[NSString hash](self->_sortingFamilyName, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v11 = 2654435761 * self->_createdAt;
  else
    v11 = 0;
  return v20 ^ v21 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  PPPBDateComponents *birthday;
  uint64_t v21;
  PPPBDateComponents *nonGregorianBirthday;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 7))
    -[PPPBContact setIdentifier:](self, "setIdentifier:");
  if (*((_QWORD *)v4 + 6))
    -[PPPBContact setGivenName:](self, "setGivenName:");
  if (*((_QWORD *)v4 + 8))
    -[PPPBContact setMiddleName:](self, "setMiddleName:");
  if (*((_QWORD *)v4 + 5))
    -[PPPBContact setFamilyName:](self, "setFamilyName:");
  if (*((_QWORD *)v4 + 11))
    -[PPPBContact setNickname:](self, "setNickname:");
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v5 = *((id *)v4 + 14);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v42 != v8)
          objc_enumerationMutation(v5);
        -[PPPBContact addPhoneNumbers:](self, "addPhoneNumbers:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    }
    while (v7);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v10 = *((id *)v4 + 4);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v38 != v13)
          objc_enumerationMutation(v10);
        -[PPPBContact addEmailAddresses:](self, "addEmailAddresses:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    }
    while (v12);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v15 = *((id *)v4 + 15);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v34;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v34 != v18)
          objc_enumerationMutation(v15);
        -[PPPBContact addPostalAddresses:](self, "addPostalAddresses:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
    }
    while (v17);
  }

  if (*((_QWORD *)v4 + 13))
    -[PPPBContact setOrganizationName:](self, "setOrganizationName:");
  birthday = self->_birthday;
  v21 = *((_QWORD *)v4 + 2);
  if (birthday)
  {
    if (v21)
      -[PPPBDateComponents mergeFrom:](birthday, "mergeFrom:");
  }
  else if (v21)
  {
    -[PPPBContact setBirthday:](self, "setBirthday:");
  }
  nonGregorianBirthday = self->_nonGregorianBirthday;
  v23 = *((_QWORD *)v4 + 12);
  if (nonGregorianBirthday)
  {
    if (v23)
      -[PPPBDateComponents mergeFrom:](nonGregorianBirthday, "mergeFrom:");
  }
  else if (v23)
  {
    -[PPPBContact setNonGregorianBirthday:](self, "setNonGregorianBirthday:");
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v24 = *((id *)v4 + 16);
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v30;
    do
    {
      for (m = 0; m != v26; ++m)
      {
        if (*(_QWORD *)v30 != v27)
          objc_enumerationMutation(v24);
        -[PPPBContact addSocialProfiles:](self, "addSocialProfiles:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * m), (_QWORD)v29);
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
    }
    while (v26);
  }

  if (*((_QWORD *)v4 + 9))
    -[PPPBContact setNamePrefix:](self, "setNamePrefix:");
  if (*((_QWORD *)v4 + 10))
    -[PPPBContact setNameSuffix:](self, "setNameSuffix:");
  if ((*((_BYTE *)v4 + 152) & 2) != 0)
  {
    self->_displayNameOrder = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 18))
    -[PPPBContact setSortingGivenName:](self, "setSortingGivenName:");
  if (*((_QWORD *)v4 + 17))
    -[PPPBContact setSortingFamilyName:](self, "setSortingFamilyName:");
  if ((*((_BYTE *)v4 + 152) & 1) != 0)
  {
    self->_createdAt = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void)setGivenName:(id)a3
{
  objc_storeStrong((id *)&self->_givenName, a3);
}

- (NSString)middleName
{
  return self->_middleName;
}

- (void)setMiddleName:(id)a3
{
  objc_storeStrong((id *)&self->_middleName, a3);
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
  objc_storeStrong((id *)&self->_familyName, a3);
}

- (NSString)nickname
{
  return self->_nickname;
}

- (void)setNickname:(id)a3
{
  objc_storeStrong((id *)&self->_nickname, a3);
}

- (NSMutableArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (void)setPhoneNumbers:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumbers, a3);
}

- (NSMutableArray)emailAddresses
{
  return self->_emailAddresses;
}

- (void)setEmailAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_emailAddresses, a3);
}

- (NSMutableArray)postalAddresses
{
  return self->_postalAddresses;
}

- (void)setPostalAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_postalAddresses, a3);
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
  objc_storeStrong((id *)&self->_organizationName, a3);
}

- (PPPBDateComponents)birthday
{
  return self->_birthday;
}

- (void)setBirthday:(id)a3
{
  objc_storeStrong((id *)&self->_birthday, a3);
}

- (PPPBDateComponents)nonGregorianBirthday
{
  return self->_nonGregorianBirthday;
}

- (void)setNonGregorianBirthday:(id)a3
{
  objc_storeStrong((id *)&self->_nonGregorianBirthday, a3);
}

- (NSMutableArray)socialProfiles
{
  return self->_socialProfiles;
}

- (void)setSocialProfiles:(id)a3
{
  objc_storeStrong((id *)&self->_socialProfiles, a3);
}

- (NSString)namePrefix
{
  return self->_namePrefix;
}

- (void)setNamePrefix:(id)a3
{
  objc_storeStrong((id *)&self->_namePrefix, a3);
}

- (NSString)nameSuffix
{
  return self->_nameSuffix;
}

- (void)setNameSuffix:(id)a3
{
  objc_storeStrong((id *)&self->_nameSuffix, a3);
}

- (int)displayNameOrder
{
  return self->_displayNameOrder;
}

- (NSString)sortingGivenName
{
  return self->_sortingGivenName;
}

- (void)setSortingGivenName:(id)a3
{
  objc_storeStrong((id *)&self->_sortingGivenName, a3);
}

- (NSString)sortingFamilyName
{
  return self->_sortingFamilyName;
}

- (void)setSortingFamilyName:(id)a3
{
  objc_storeStrong((id *)&self->_sortingFamilyName, a3);
}

- (int64_t)createdAt
{
  return self->_createdAt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortingGivenName, 0);
  objc_storeStrong((id *)&self->_sortingFamilyName, 0);
  objc_storeStrong((id *)&self->_socialProfiles, 0);
  objc_storeStrong((id *)&self->_postalAddresses, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_nonGregorianBirthday, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_nameSuffix, 0);
  objc_storeStrong((id *)&self->_namePrefix, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_birthday, 0);
}

+ (Class)phoneNumbersType
{
  return (Class)objc_opt_class();
}

+ (Class)emailAddressesType
{
  return (Class)objc_opt_class();
}

+ (Class)postalAddressesType
{
  return (Class)objc_opt_class();
}

+ (Class)socialProfilesType
{
  return (Class)objc_opt_class();
}

@end
