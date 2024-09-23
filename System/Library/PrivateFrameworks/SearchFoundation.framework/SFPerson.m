@implementation SFPerson

- (SFPerson)initWithProtobuf:(id)a3
{
  id v4;
  SFPerson *v5;
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
  SFPerson *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)SFPerson;
  v5 = -[SFPerson init](&v38, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "personIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "personIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPerson setPersonIdentifier:](v5, "setPersonIdentifier:", v7);

    }
    objc_msgSend(v4, "contactIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "contactIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPerson setContactIdentifier:](v5, "setContactIdentifier:", v9);

    }
    objc_msgSend(v4, "displayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "displayName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPerson setDisplayName:](v5, "setDisplayName:", v11);

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
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
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
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      }
      while (v16);
    }

    -[SFPerson setPhoneNumbers:](v5, "setPhoneNumbers:", v13);
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
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
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
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      }
      while (v23);
    }

    -[SFPerson setEmailAddresses:](v5, "setEmailAddresses:", v20);
    objc_msgSend(v4, "photosIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v4, "photosIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPerson setPhotosIdentifier:](v5, "setPhotosIdentifier:", v27);

    }
    v28 = v5;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFPerson)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBPerson *v6;
  SFPerson *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBPerson initWithData:]([_SFPBPerson alloc], "initWithData:", v5);
  v7 = -[SFPerson initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBPerson *v6;

  v4 = a3;
  v6 = -[_SFPBPerson initWithFacade:]([_SFPBPerson alloc], "initWithFacade:", self);
  -[_SFPBPerson data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBPerson *v2;
  void *v3;

  v2 = -[_SFPBPerson initWithFacade:]([_SFPBPerson alloc], "initWithFacade:", self);
  -[_SFPBPerson dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBPerson *v2;
  void *v3;

  v2 = -[_SFPBPerson initWithFacade:]([_SFPBPerson alloc], "initWithFacade:", self);
  -[_SFPBPerson jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
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
  void *v16;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFPerson personIdentifier](self, "personIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setPersonIdentifier:", v6);

  -[SFPerson contactIdentifier](self, "contactIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setContactIdentifier:", v8);

  -[SFPerson displayName](self, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setDisplayName:", v10);

  -[SFPerson phoneNumbers](self, "phoneNumbers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setPhoneNumbers:", v12);

  -[SFPerson emailAddresses](self, "emailAddresses");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setEmailAddresses:", v14);

  -[SFPerson photosIdentifier](self, "photosIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setPhotosIdentifier:", v16);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFPerson *v5;
  SFPerson *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;

  v5 = (SFPerson *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFPerson isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[SFPerson personIdentifier](self, "personIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPerson personIdentifier](v6, "personIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v11 = 0;
LABEL_36:

        goto LABEL_37;
      }
      -[SFPerson personIdentifier](self, "personIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[SFPerson personIdentifier](self, "personIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFPerson personIdentifier](v6, "personIdentifier");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v10, "isEqual:"))
        {
          v11 = 0;
          goto LABEL_34;
        }
        v54 = v10;
      }
      -[SFPerson contactIdentifier](self, "contactIdentifier");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPerson contactIdentifier](v6, "contactIdentifier");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v56 == 0) == (v55 != 0))
        goto LABEL_32;
      -[SFPerson contactIdentifier](self, "contactIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[SFPerson contactIdentifier](self, "contactIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFPerson contactIdentifier](v6, "contactIdentifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "isEqual:", v3) & 1) == 0)
        {

LABEL_31:
LABEL_32:

          v11 = 0;
          goto LABEL_33;
        }
        v51 = v13;
        v53 = v8;
        v14 = v57;
        v15 = v12;
      }
      else
      {
        v53 = v8;
        v14 = v57;
        v15 = 0;
      }
      v52 = v3;
      v57 = v14;
      -[SFPerson displayName](self, "displayName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPerson displayName](v6, "displayName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v15;
      v8 = v53;
      if ((v16 == 0) != (v17 != 0))
      {
        v50 = v17;
        -[SFPerson displayName](self, "displayName");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (v49)
        {
          -[SFPerson displayName](self, "displayName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFPerson displayName](v6, "displayName");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v18;
          if (!objc_msgSend(v18, "isEqual:"))
          {
            v11 = 0;
            v24 = v49;
            goto LABEL_56;
          }
          v48 = v15;
        }
        else
        {
          v48 = v15;
        }
        -[SFPerson phoneNumbers](self, "phoneNumbers");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFPerson phoneNumbers](v6, "phoneNumbers");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v19 == 0) != (v20 != 0))
        {
          v45 = v20;
          -[SFPerson phoneNumbers](self, "phoneNumbers");
          v12 = v48;
          v43 = objc_claimAutoreleasedReturnValue();
          v44 = v19;
          if (v43)
          {
            -[SFPerson phoneNumbers](self, "phoneNumbers");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFPerson phoneNumbers](v6, "phoneNumbers");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = v21;
            if (!objc_msgSend(v21, "isEqual:"))
            {
              v11 = 0;
              v22 = (void *)v43;
LABEL_54:

LABEL_55:
              v24 = v49;
              if (!v49)
              {
LABEL_57:

                if (v12)
                {

                }
LABEL_33:
                v10 = v54;
                if (!v9)
                {
LABEL_35:

                  goto LABEL_36;
                }
LABEL_34:

                goto LABEL_35;
              }
LABEL_56:

              goto LABEL_57;
            }
          }
          -[SFPerson emailAddresses](self, "emailAddresses");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFPerson emailAddresses](v6, "emailAddresses");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v25 == 0) == (v26 != 0))
          {

            v11 = 0;
            v12 = v48;
            goto LABEL_53;
          }
          v39 = v25;
          v40 = v26;
          -[SFPerson emailAddresses](self, "emailAddresses");
          v12 = v48;
          v38 = objc_claimAutoreleasedReturnValue();
          if (v38
            && (-[SFPerson emailAddresses](self, "emailAddresses"),
                v27 = (void *)objc_claimAutoreleasedReturnValue(),
                -[SFPerson emailAddresses](v6, "emailAddresses"),
                v36 = (void *)objc_claimAutoreleasedReturnValue(),
                v37 = v27,
                !objc_msgSend(v27, "isEqual:")))
          {
            v11 = 0;
            v32 = (void *)v38;
          }
          else
          {
            -[SFPerson photosIdentifier](self, "photosIdentifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFPerson photosIdentifier](v6, "photosIdentifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v28 == 0) == (v29 != 0))
            {

              v11 = 0;
              v12 = v48;
            }
            else
            {
              v35 = v29;
              -[SFPerson photosIdentifier](self, "photosIdentifier");
              v30 = objc_claimAutoreleasedReturnValue();
              v12 = v48;
              if (v30)
              {
                v34 = (void *)v30;
                -[SFPerson photosIdentifier](self, "photosIdentifier");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFPerson photosIdentifier](v6, "photosIdentifier");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v11 = objc_msgSend(v33, "isEqual:");

              }
              else
              {

                v11 = 1;
              }
            }
            v32 = (void *)v38;
            if (!v38)
              goto LABEL_52;
          }

LABEL_52:
LABEL_53:
          v22 = (void *)v43;
          if (!v43)
            goto LABEL_55;
          goto LABEL_54;
        }

        v12 = v48;
        if (v49)
        {

        }
        v17 = v50;
      }

      if (v12)
      {

      }
      goto LABEL_31;
    }
    v11 = 0;
  }
LABEL_37:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;

  -[SFPerson personIdentifier](self, "personIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SFPerson contactIdentifier](self, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SFPerson displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[SFPerson phoneNumbers](self, "phoneNumbers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[SFPerson emailAddresses](self, "emailAddresses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[SFPerson photosIdentifier](self, "photosIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10 ^ v12 ^ objc_msgSend(v13, "hash");

  return v14;
}

- (NSString)personIdentifier
{
  return self->_personIdentifier;
}

- (void)setPersonIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (void)setPhoneNumbers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (void)setEmailAddresses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)photosIdentifier
{
  return self->_photosIdentifier;
}

- (void)setPhotosIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
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
