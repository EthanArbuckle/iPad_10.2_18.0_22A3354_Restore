@implementation PPInternalContactNameRecord

- (PPInternalContactNameRecord)initWithIdentifier:(id)a3 score:(double)a4 source:(unsigned __int8)a5 sourceIdentifier:(id)a6 changeType:(unsigned __int8)a7 firstName:(id)a8 phoneticFirstName:(id)a9 middleName:(id)a10 phoneticMiddleName:(id)a11 lastName:(id)a12 phoneticLastName:(id)a13 organizationName:(id)a14 jobTitle:(id)a15 nickname:(id)a16 relatedNames:(id)a17 streetNames:(id)a18 cityNames:(id)a19
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  PPInternalContactNameRecord *v33;
  uint64_t v34;
  PPPBContactNameRecord *pbRecord;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  unsigned int v50;
  id v51;
  unsigned int v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  objc_super v68;
  _BYTE v69[128];
  uint64_t v70;

  v52 = a7;
  v50 = a5;
  v70 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v24 = a6;
  v25 = a8;
  v26 = a9;
  v63 = a10;
  v27 = a11;
  v62 = a12;
  v61 = a13;
  v28 = v23;
  v60 = a14;
  v29 = a15;
  v30 = a16;
  v31 = a17;
  v59 = a18;
  v32 = a19;
  v68.receiver = self;
  v68.super_class = (Class)PPInternalContactNameRecord;
  v33 = -[PPContactNameRecord init_](&v68, sel_init_);
  if (v33)
  {
    v34 = objc_opt_new();
    v58 = v27;
    pbRecord = v33->_pbRecord;
    v33->_pbRecord = (PPPBContactNameRecord *)v34;

    -[PPPBContactNameRecord setIdentifier:](v33->_pbRecord, "setIdentifier:", v28);
    -[PPPBContactNameRecord setScore:](v33->_pbRecord, "setScore:", a4);
    -[PPPBContactNameRecord setSource:](v33->_pbRecord, "setSource:", v50);
    v54 = v24;
    -[PPPBContactNameRecord setSourceIdentifier:](v33->_pbRecord, "setSourceIdentifier:", v24);
    -[PPPBContactNameRecord setChangeType:](v33->_pbRecord, "setChangeType:", v52);
    -[PPPBContactNameRecord setFirstName:](v33->_pbRecord, "setFirstName:", v25);
    v56 = v26;
    -[PPPBContactNameRecord setPhoneticFirstName:](v33->_pbRecord, "setPhoneticFirstName:", v26);
    -[PPPBContactNameRecord setMiddleName:](v33->_pbRecord, "setMiddleName:", v63);
    -[PPPBContactNameRecord setPhoneticMiddleName:](v33->_pbRecord, "setPhoneticMiddleName:", v27);
    -[PPPBContactNameRecord setLastName:](v33->_pbRecord, "setLastName:", v62);
    -[PPPBContactNameRecord setPhoneticLastName:](v33->_pbRecord, "setPhoneticLastName:", v61);
    -[PPPBContactNameRecord setOrganizationName:](v33->_pbRecord, "setOrganizationName:", v60);
    v55 = v29;
    -[PPPBContactNameRecord setJobTitle:](v33->_pbRecord, "setJobTitle:", v29);
    -[PPPBContactNameRecord setNickname:](v33->_pbRecord, "setNickname:", v30);
    v51 = v31;
    v53 = v30;
    v36 = v24;
    if (objc_msgSend(v31, "count"))
    {
      v49 = v28;
      v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v31, "count"));
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v38 = v31;
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v65;
        do
        {
          for (i = 0; i != v40; ++i)
          {
            if (*(_QWORD *)v65 != v41)
              objc_enumerationMutation(v38);
            v43 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i);
            v44 = (void *)objc_opt_new();
            objc_msgSend(v44, "setKey:", v43);
            objc_msgSend(v38, "objectForKeyedSubscript:", v43);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setValue:", v45);

            objc_msgSend(v37, "addObject:", v44);
          }
          v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
        }
        while (v40);
      }

      -[PPPBContactNameRecord setRelatedNames:](v33->_pbRecord, "setRelatedNames:", v37);
      v28 = v49;
      v36 = v54;
    }
    v24 = v36;
    if (objc_msgSend(v59, "count", v49))
    {
      v46 = (void *)objc_msgSend(v59, "mutableCopy");
      -[PPPBContactNameRecord setStreetNames:](v33->_pbRecord, "setStreetNames:", v46);

    }
    else
    {
      -[PPPBContactNameRecord setStreetNames:](v33->_pbRecord, "setStreetNames:", 0);
    }
    v27 = v58;
    if (objc_msgSend(v32, "count"))
    {
      v47 = (void *)objc_msgSend(v32, "mutableCopy");
      -[PPPBContactNameRecord setCityNames:](v33->_pbRecord, "setCityNames:", v47);

    }
    else
    {
      -[PPPBContactNameRecord setCityNames:](v33->_pbRecord, "setCityNames:", 0);
    }
    v26 = v56;
    v29 = v55;
    v31 = v51;
    v30 = v53;
  }

  return v33;
}

- (PPInternalContactNameRecord)initWithPBContactNameRecord:(id)a3
{
  id v5;
  id *v6;
  PPInternalContactNameRecord *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPInternalContactNameRecord;
  v6 = -[PPContactNameRecord init_](&v9, sel_init_);
  v7 = (PPInternalContactNameRecord *)v6;
  if (v6)
    objc_storeStrong(v6 + 1, a3);

  return v7;
}

- (id)clientCopy
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  unsigned int v20;
  id v21;
  void *v22;
  void *v23;

  v21 = objc_alloc(MEMORY[0x1E0D70B08]);
  -[PPInternalContactNameRecord identifier](self, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPInternalContactNameRecord score](self, "score");
  v4 = v3;
  v20 = -[PPInternalContactNameRecord source](self, "source");
  -[PPInternalContactNameRecord sourceIdentifier](self, "sourceIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PPInternalContactNameRecord changeType](self, "changeType");
  -[PPInternalContactNameRecord firstName](self, "firstName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPInternalContactNameRecord phoneticFirstName](self, "phoneticFirstName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPInternalContactNameRecord middleName](self, "middleName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPInternalContactNameRecord phoneticMiddleName](self, "phoneticMiddleName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPInternalContactNameRecord lastName](self, "lastName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPInternalContactNameRecord phoneticLastName](self, "phoneticLastName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPInternalContactNameRecord organizationName](self, "organizationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPInternalContactNameRecord jobTitle](self, "jobTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPInternalContactNameRecord nickname](self, "nickname");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPInternalContactNameRecord relatedNames](self, "relatedNames");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPInternalContactNameRecord streetNames](self, "streetNames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPInternalContactNameRecord cityNames](self, "cityNames");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "initWithIdentifier:score:source:sourceIdentifier:changeType:firstName:phoneticFirstName:middleName:phoneticMiddleName:lastName:phoneticLastName:organizationName:jobTitle:nickname:relatedNames:streetNames:cityNames:", v23, v20, v19, v18, v17, v16, v4, v15, v14, v13, v5, v6, v7, v8, v9, v10,
                  v11);

  return v22;
}

- (id)identifier
{
  return -[PPPBContactNameRecord identifier](self->_pbRecord, "identifier");
}

- (double)score
{
  double result;

  -[PPPBContactNameRecord score](self->_pbRecord, "score");
  return result;
}

- (void)setScore:(double)a3
{
  -[PPPBContactNameRecord setScore:](self->_pbRecord, "setScore:", a3);
}

- (unsigned)source
{
  return -[PPPBContactNameRecord source](self->_pbRecord, "source");
}

- (unsigned)changeType
{
  return -[PPPBContactNameRecord changeType](self->_pbRecord, "changeType");
}

- (id)sourceIdentifier
{
  return -[PPPBContactNameRecord sourceIdentifier](self->_pbRecord, "sourceIdentifier");
}

- (id)firstName
{
  return -[PPPBContactNameRecord firstName](self->_pbRecord, "firstName");
}

- (id)phoneticFirstName
{
  return -[PPPBContactNameRecord phoneticFirstName](self->_pbRecord, "phoneticFirstName");
}

- (id)middleName
{
  return -[PPPBContactNameRecord middleName](self->_pbRecord, "middleName");
}

- (id)phoneticMiddleName
{
  return -[PPPBContactNameRecord phoneticMiddleName](self->_pbRecord, "phoneticMiddleName");
}

- (id)lastName
{
  return -[PPPBContactNameRecord lastName](self->_pbRecord, "lastName");
}

- (id)phoneticLastName
{
  return -[PPPBContactNameRecord phoneticLastName](self->_pbRecord, "phoneticLastName");
}

- (id)organizationName
{
  return -[PPPBContactNameRecord organizationName](self->_pbRecord, "organizationName");
}

- (id)jobTitle
{
  return -[PPPBContactNameRecord jobTitle](self->_pbRecord, "jobTitle");
}

- (id)nickname
{
  return -[PPPBContactNameRecord nickname](self->_pbRecord, "nickname");
}

- (id)relatedNames
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[PPPBContactNameRecord relatedNames](self->_pbRecord, "relatedNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PPPBContactNameRecord relatedNames](self->_pbRecord, "relatedNames", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "key");
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          objc_msgSend(v11, "value");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(v11, "value");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "key");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v16);

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)streetNames
{
  return -[PPPBContactNameRecord streetNames](self->_pbRecord, "streetNames");
}

- (id)cityNames
{
  return -[PPPBContactNameRecord cityNames](self->_pbRecord, "cityNames");
}

- (id)pbRecord
{
  return self->_pbRecord;
}

- (id)localizedFullName
{
  NSString *localizedFullName;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *v10;

  localizedFullName = self->_localizedFullName;
  if (!localizedFullName)
  {
    v4 = (void *)objc_opt_new();
    -[PPPBContactNameRecord firstName](self->_pbRecord, "firstName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPPBContactNameRecord middleName](self->_pbRecord, "middleName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPPBContactNameRecord lastName](self->_pbRecord, "lastName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPPBContactNameRecord nickname](self->_pbRecord, "nickname");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v4, "setGivenName:", v5);
    if (v6)
      objc_msgSend(v4, "setMiddleName:", v6);
    if (v7)
      objc_msgSend(v4, "setFamilyName:", v7);
    if (v8)
      objc_msgSend(v4, "setNickname:", v8);
    objc_msgSend(v4, "setContactType:", 0);
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v4, 0);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = self->_localizedFullName;
    self->_localizedFullName = v9;

    localizedFullName = self->_localizedFullName;
  }
  return localizedFullName;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PPInternalContactNameRecord *v4;
  void *v5;
  PPInternalContactNameRecord *v6;

  v4 = [PPInternalContactNameRecord alloc];
  v5 = (void *)-[PPPBContactNameRecord copy](self->_pbRecord, "copy");
  v6 = -[PPInternalContactNameRecord initWithPBContactNameRecord:](v4, "initWithPBContactNameRecord:", v5);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedFullName, 0);
  objc_storeStrong((id *)&self->_pbRecord, 0);
}

@end
