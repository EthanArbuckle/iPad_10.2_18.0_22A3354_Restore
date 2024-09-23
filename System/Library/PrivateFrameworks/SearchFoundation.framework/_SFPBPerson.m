@implementation _SFPBPerson

- (_SFPBPerson)initWithFacade:(id)a3
{
  id v4;
  _SFPBPerson *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  _SFPBPerson *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBPerson init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "personIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "personIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBPerson setPersonIdentifier:](v5, "setPersonIdentifier:", v7);

    }
    objc_msgSend(v4, "contactIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "contactIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBPerson setContactIdentifier:](v5, "setContactIdentifier:", v9);

    }
    objc_msgSend(v4, "displayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "displayName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBPerson setDisplayName:](v5, "setDisplayName:", v11);

    }
    objc_msgSend(v4, "phoneNumbers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v13 = 0;

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v4, "phoneNumbers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v35 != v17)
            objc_enumerationMutation(v14);
          if (*(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i))
            objc_msgSend(v13, "addObject:");
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v16);
    }

    -[_SFPBPerson setPhoneNumbers:](v5, "setPhoneNumbers:", v13);
    objc_msgSend(v4, "emailAddresses");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v20 = 0;

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v4, "emailAddresses", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v31 != v24)
            objc_enumerationMutation(v21);
          if (*(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j))
            objc_msgSend(v20, "addObject:");
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v23);
    }

    -[_SFPBPerson setEmailAddresses:](v5, "setEmailAddresses:", v20);
    objc_msgSend(v4, "photosIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v4, "photosIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBPerson setPhotosIdentifier:](v5, "setPhotosIdentifier:", v27);

    }
    v28 = v5;

  }
  return v5;
}

- (void)setPersonIdentifier:(id)a3
{
  NSString *v4;
  NSString *personIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  personIdentifier = self->_personIdentifier;
  self->_personIdentifier = v4;

}

- (void)setContactIdentifier:(id)a3
{
  NSString *v4;
  NSString *contactIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  contactIdentifier = self->_contactIdentifier;
  self->_contactIdentifier = v4;

}

- (void)setDisplayName:(id)a3
{
  NSString *v4;
  NSString *displayName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  displayName = self->_displayName;
  self->_displayName = v4;

}

- (void)setPhoneNumbers:(id)a3
{
  NSArray *v4;
  NSArray *phoneNumbers;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  phoneNumbers = self->_phoneNumbers;
  self->_phoneNumbers = v4;

}

- (void)clearPhoneNumbers
{
  -[NSArray removeAllObjects](self->_phoneNumbers, "removeAllObjects");
}

- (void)addPhoneNumbers:(id)a3
{
  id v4;
  NSArray *phoneNumbers;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  phoneNumbers = self->_phoneNumbers;
  v8 = v4;
  if (!phoneNumbers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_phoneNumbers;
    self->_phoneNumbers = v6;

    v4 = v8;
    phoneNumbers = self->_phoneNumbers;
  }
  -[NSArray addObject:](phoneNumbers, "addObject:", v4);

}

- (unint64_t)phoneNumbersCount
{
  return -[NSArray count](self->_phoneNumbers, "count");
}

- (id)phoneNumbersAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_phoneNumbers, "objectAtIndexedSubscript:", a3);
}

- (void)setEmailAddresses:(id)a3
{
  NSArray *v4;
  NSArray *emailAddresses;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  emailAddresses = self->_emailAddresses;
  self->_emailAddresses = v4;

}

- (void)clearEmailAddresses
{
  -[NSArray removeAllObjects](self->_emailAddresses, "removeAllObjects");
}

- (void)addEmailAddresses:(id)a3
{
  id v4;
  NSArray *emailAddresses;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  emailAddresses = self->_emailAddresses;
  v8 = v4;
  if (!emailAddresses)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_emailAddresses;
    self->_emailAddresses = v6;

    v4 = v8;
    emailAddresses = self->_emailAddresses;
  }
  -[NSArray addObject:](emailAddresses, "addObject:", v4);

}

- (unint64_t)emailAddressesCount
{
  return -[NSArray count](self->_emailAddresses, "count");
}

- (id)emailAddressesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_emailAddresses, "objectAtIndexedSubscript:", a3);
}

- (void)setPhotosIdentifier:(id)a3
{
  NSString *v4;
  NSString *photosIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  photosIdentifier = self->_photosIdentifier;
  self->_photosIdentifier = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBPersonReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBPerson personIdentifier](self, "personIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  -[_SFPBPerson contactIdentifier](self, "contactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteStringField();

  -[_SFPBPerson displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteStringField();

  -[_SFPBPerson phoneNumbers](self, "phoneNumbers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteStringField();
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v10);
  }

  -[_SFPBPerson emailAddresses](self, "emailAddresses");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        PBDataWriterWriteStringField();
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v15);
  }

  -[_SFPBPerson photosIdentifier](self, "photosIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    PBDataWriterWriteStringField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  BOOL v37;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  -[_SFPBPerson personIdentifier](self, "personIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_SFPBPerson personIdentifier](self, "personIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBPerson personIdentifier](self, "personIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "personIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_32;
  }
  else
  {

  }
  -[_SFPBPerson contactIdentifier](self, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_SFPBPerson contactIdentifier](self, "contactIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBPerson contactIdentifier](self, "contactIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_32;
  }
  else
  {

  }
  -[_SFPBPerson displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_SFPBPerson displayName](self, "displayName");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBPerson displayName](self, "displayName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_32;
  }
  else
  {

  }
  -[_SFPBPerson phoneNumbers](self, "phoneNumbers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneNumbers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_SFPBPerson phoneNumbers](self, "phoneNumbers");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_SFPBPerson phoneNumbers](self, "phoneNumbers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phoneNumbers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_32;
  }
  else
  {

  }
  -[_SFPBPerson emailAddresses](self, "emailAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emailAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_SFPBPerson emailAddresses](self, "emailAddresses");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_SFPBPerson emailAddresses](self, "emailAddresses");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "emailAddresses");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_32;
  }
  else
  {

  }
  -[_SFPBPerson photosIdentifier](self, "photosIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photosIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBPerson photosIdentifier](self, "photosIdentifier");
    v32 = objc_claimAutoreleasedReturnValue();
    if (!v32)
    {

LABEL_35:
      v37 = 1;
      goto LABEL_33;
    }
    v33 = (void *)v32;
    -[_SFPBPerson photosIdentifier](self, "photosIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "photosIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if ((v36 & 1) != 0)
      goto LABEL_35;
  }
  else
  {
LABEL_31:

  }
LABEL_32:
  v37 = 0;
LABEL_33:

  return v37;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_personIdentifier, "hash");
  v4 = -[NSString hash](self->_contactIdentifier, "hash") ^ v3;
  v5 = -[NSString hash](self->_displayName, "hash");
  v6 = v4 ^ v5 ^ -[NSArray hash](self->_phoneNumbers, "hash");
  v7 = -[NSArray hash](self->_emailAddresses, "hash");
  return v6 ^ v7 ^ -[NSString hash](self->_photosIdentifier, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_contactIdentifier)
  {
    -[_SFPBPerson contactIdentifier](self, "contactIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("contactIdentifier"));

  }
  if (self->_displayName)
  {
    -[_SFPBPerson displayName](self, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("displayName"));

  }
  if (self->_emailAddresses)
  {
    -[_SFPBPerson emailAddresses](self, "emailAddresses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("emailAddresses"));

  }
  if (self->_personIdentifier)
  {
    -[_SFPBPerson personIdentifier](self, "personIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("personIdentifier"));

  }
  if (self->_phoneNumbers)
  {
    -[_SFPBPerson phoneNumbers](self, "phoneNumbers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("phoneNumbers"));

  }
  if (self->_photosIdentifier)
  {
    -[_SFPBPerson photosIdentifier](self, "photosIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("photosIdentifier"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBPerson dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBPerson)initWithJSON:(id)a3
{
  void *v4;
  _SFPBPerson *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBPerson initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBPerson)initWithDictionary:(id)a3
{
  id v4;
  _SFPBPerson *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _SFPBPerson *v30;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)_SFPBPerson;
  v5 = -[_SFPBPerson init](&v43, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("personIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBPerson setPersonIdentifier:](v5, "setPersonIdentifier:", v7);

    }
    v34 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBPerson setContactIdentifier:](v5, "setContactIdentifier:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("displayName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[_SFPBPerson setDisplayName:](v5, "setDisplayName:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("phoneNumbers"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v32 = v10;
    v33 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v40;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v40 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v17);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v19 = (void *)objc_msgSend(v18, "copy");
              -[_SFPBPerson addPhoneNumbers:](v5, "addPhoneNumbers:", v19);

            }
            ++v17;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
        }
        while (v15);
      }

      v10 = v32;
      v8 = v33;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("emailAddresses"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v21 = v20;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v36;
        do
        {
          v25 = 0;
          do
          {
            if (*(_QWORD *)v36 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v25);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v27 = (void *)objc_msgSend(v26, "copy");
              -[_SFPBPerson addEmailAddresses:](v5, "addEmailAddresses:", v27);

            }
            ++v25;
          }
          while (v23 != v25);
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
        }
        while (v23);
      }

      v10 = v32;
      v8 = v33;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("photosIdentifier"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = (void *)objc_msgSend(v28, "copy");
      -[_SFPBPerson setPhotosIdentifier:](v5, "setPhotosIdentifier:", v29);

    }
    v30 = v5;

  }
  return v5;
}

- (NSString)personIdentifier
{
  return self->_personIdentifier;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (NSString)photosIdentifier
{
  return self->_photosIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosIdentifier, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_personIdentifier, 0);
}

@end
