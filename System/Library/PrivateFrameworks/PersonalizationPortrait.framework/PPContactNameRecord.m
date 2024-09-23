@implementation PPContactNameRecord

- (id)init_
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PPContactNameRecord;
  return -[PPContactNameRecord init](&v3, sel_init);
}

- (PPContactNameRecord)initWithIdentifier:(id)a3 score:(double)a4 source:(unsigned __int8)a5 sourceIdentifier:(id)a6 changeType:(unsigned __int8)a7 firstName:(id)a8 phoneticFirstName:(id)a9 middleName:(id)a10 phoneticMiddleName:(id)a11 lastName:(id)a12 phoneticLastName:(id)a13 organizationName:(id)a14 jobTitle:(id)a15 nickname:(id)a16 relatedNames:(id)a17 streetNames:(id)a18 cityNames:(id)a19
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v33;
  id v34;
  unsigned int v37;
  unsigned int v38;
  PPClientContactNameRecord *v39;
  id v41;
  id v42;

  v38 = a7;
  v37 = a5;
  v34 = a19;
  v31 = a18;
  v30 = a17;
  v27 = a16;
  v29 = a15;
  v42 = a14;
  v41 = a13;
  v21 = a12;
  v22 = a11;
  v28 = a10;
  v33 = a9;
  v23 = a8;
  v24 = a6;
  v25 = a3;
  v39 = -[PPClientContactNameRecord initWithIdentifier:score:source:sourceIdentifier:changeType:firstName:phoneticFirstName:middleName:phoneticMiddleName:lastName:phoneticLastName:organizationName:jobTitle:nickname:relatedNames:streetNames:cityNames:]([PPClientContactNameRecord alloc], "initWithIdentifier:score:source:sourceIdentifier:changeType:firstName:phoneticFirstName:middleName:phoneticMiddleName:lastName:phoneticLastName:organizationName:jobTitle:nickname:relatedNames:streetNames:cityNames:", v25, v37, v24, v38, v23, v33, a4, v28, v22, v21, v41, v42, v29, v27, v30, v31,
          v34);

  return &v39->super;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PPContactNameRecord firstName](self, "firstName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPContactNameRecord middleName](self, "middleName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPContactNameRecord lastName](self, "lastName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPContactNameRecord cityNames](self, "cityNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_pas_componentsJoinedByString:", CFSTR(","));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPContactNameRecord score](self, "score");
  v10 = v9;
  +[PPContactNameRecord describeSource:](PPContactNameRecord, "describeSource:", -[PPContactNameRecord source](self, "source"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPContactNameRecord describeChangeType:](PPContactNameRecord, "describeChangeType:", -[PPContactNameRecord changeType](self, "changeType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<PPContactNameRecord '%@' '%@' '%@' [%@] s:%f src:%@ ct:%@>"), v4, v5, v6, v8, v10, v11, v12);

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  double v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
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
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  -[PPContactNameRecord identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[PPContactNameRecord score](self, "score");
  v6 = 31 * (31 * ((unint64_t)v5 - v4 + 32 * v4) + -[PPContactNameRecord source](self, "source"));
  v7 = v6 + -[PPContactNameRecord changeType](self, "changeType");
  -[PPContactNameRecord sourceIdentifier](self, "sourceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash") - v7 + 32 * v7;

  -[PPContactNameRecord firstName](self, "firstName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash") - v9 + 32 * v9;

  -[PPContactNameRecord phoneticFirstName](self, "phoneticFirstName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hash") - v11 + 32 * v11;

  -[PPContactNameRecord middleName](self, "middleName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash") - v13 + 32 * v13;

  -[PPContactNameRecord phoneticMiddleName](self, "phoneticMiddleName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hash") - v15 + 32 * v15;

  -[PPContactNameRecord lastName](self, "lastName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "hash") - v17 + 32 * v17;

  -[PPContactNameRecord phoneticLastName](self, "phoneticLastName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "hash") - v19 + 32 * v19;

  -[PPContactNameRecord organizationName](self, "organizationName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "hash") - v21 + 32 * v21;

  -[PPContactNameRecord jobTitle](self, "jobTitle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "hash") - v23 + 32 * v23;

  -[PPContactNameRecord nickname](self, "nickname");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "hash") - v25 + 32 * v25;

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  -[PPContactNameRecord relatedNames](self, "relatedNames");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "allKeys");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "sortedArrayUsingSelector:", sel_compare_);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v64;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v64 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v34);
        v36 = (void *)MEMORY[0x18D7805AC]();
        v37 = objc_msgSend(v35, "hash") - v27 + 32 * v27;
        -[PPContactNameRecord relatedNames](self, "relatedNames");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectForKeyedSubscript:", v35);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v39, "hash") - v37 + 32 * v37;

        objc_autoreleasePoolPop(v36);
        ++v34;
      }
      while (v32 != v34);
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
    }
    while (v32);
  }

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  -[PPContactNameRecord streetNames](self, "streetNames");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v60;
    do
    {
      v44 = 0;
      do
      {
        if (*(_QWORD *)v60 != v43)
          objc_enumerationMutation(v40);
        v45 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v44);
        v46 = (void *)MEMORY[0x18D7805AC]();
        v27 = objc_msgSend(v45, "hash") - v27 + 32 * v27;
        objc_autoreleasePoolPop(v46);
        ++v44;
      }
      while (v42 != v44);
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
    }
    while (v42);
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  -[PPContactNameRecord cityNames](self, "cityNames", 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v56;
    do
    {
      v51 = 0;
      do
      {
        if (*(_QWORD *)v56 != v50)
          objc_enumerationMutation(v47);
        v52 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v51);
        v53 = (void *)MEMORY[0x18D7805AC]();
        v27 = objc_msgSend(v52, "hash") - v27 + 32 * v27;
        objc_autoreleasePoolPop(v53);
        ++v51;
      }
      while (v49 != v51);
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
    }
    while (v49);
  }

  return v27;
}

- (PPContactNameRecord)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PPContactNameRecord *v16;
  void *v17;
  NSObject *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  PPContactNameRecord *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned __int8 v31;
  unsigned __int8 v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("ide"));
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("scr"));
    v9 = v8;
    v32 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("src"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("sid"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("cht"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("fnm"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("pfn"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("mnm"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("pmn"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("lnm"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("pln"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("org"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("job"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("nic"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x18D7805AC]();
    v25 = self;
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v7, v5, 0);
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("rel"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x18D7805AC]();
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v6, v5, 0);
    objc_autoreleasePoolPop(v11);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("str"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x18D7805AC]();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v6, v5, 0);
    objc_autoreleasePoolPop(v13);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("cty"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_retain(-[PPContactNameRecord initWithIdentifier:score:source:sourceIdentifier:changeType:firstName:phoneticFirstName:middleName:phoneticMiddleName:lastName:phoneticLastName:organizationName:jobTitle:nickname:relatedNames:streetNames:cityNames:](v25, "initWithIdentifier:score:source:sourceIdentifier:changeType:firstName:phoneticFirstName:middleName:phoneticMiddleName:lastName:phoneticLastName:organizationName:jobTitle:nickname:relatedNames:streetNames:cityNames:", v36, v32, v35, v31, v34, v30, v9, v33, v29, v28, v22, v27, v21, v24, v20,
              v12,
              v15));

    self = v16;
    v17 = (void *)v36;
  }
  else
  {
    v17 = 0;
    pp_contacts_log_handle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v4;
      _os_log_error_impl(&dword_18BE3A000, v18, OS_LOG_TYPE_ERROR, "failed to decode identifier from %@", buf, 0xCu);
    }

    v16 = 0;
  }

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
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
  void *v17;
  id v18;

  v4 = a3;
  -[PPContactNameRecord identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ide"));

  -[PPContactNameRecord score](self, "score");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("scr"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[PPContactNameRecord source](self, "source"), CFSTR("src"));
  -[PPContactNameRecord sourceIdentifier](self, "sourceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sid"));

  objc_msgSend(v4, "encodeInt32:forKey:", -[PPContactNameRecord changeType](self, "changeType"), CFSTR("cht"));
  -[PPContactNameRecord firstName](self, "firstName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("fnm"));

  -[PPContactNameRecord phoneticFirstName](self, "phoneticFirstName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("pfn"));

  -[PPContactNameRecord middleName](self, "middleName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("mnm"));

  -[PPContactNameRecord phoneticMiddleName](self, "phoneticMiddleName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("pmn"));

  -[PPContactNameRecord lastName](self, "lastName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("lnm"));

  -[PPContactNameRecord phoneticLastName](self, "phoneticLastName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("pln"));

  -[PPContactNameRecord organizationName](self, "organizationName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("org"));

  -[PPContactNameRecord jobTitle](self, "jobTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("job"));

  -[PPContactNameRecord nickname](self, "nickname");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("nic"));

  -[PPContactNameRecord relatedNames](self, "relatedNames");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("rel"));

  -[PPContactNameRecord streetNames](self, "streetNames");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("str"));

  -[PPContactNameRecord cityNames](self, "cityNames");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("cty"));

}

- (BOOL)isEqual:(id)a3
{
  PPContactNameRecord *v4;
  PPContactNameRecord *v5;
  BOOL v6;

  v4 = (PPContactNameRecord *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PPContactNameRecord isEqualToContactNameRecord:](self, "isEqualToContactNameRecord:", v5);

  return v6;
}

- (BOOL)isEqualToContactNameRecord:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  int v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  void *v20;
  char v21;
  void *v22;
  uint64_t v23;
  void *v24;
  char v25;
  void *v26;
  uint64_t v27;
  void *v28;
  char v29;
  void *v30;
  uint64_t v31;
  void *v32;
  char v33;
  void *v34;
  uint64_t v35;
  void *v36;
  char v37;
  void *v38;
  uint64_t v39;
  void *v40;
  char v41;
  void *v42;
  uint64_t v43;
  void *v44;
  char v45;
  void *v46;
  uint64_t v47;
  void *v48;
  char v49;
  void *v50;
  uint64_t v51;
  void *v52;
  char v53;
  void *v54;
  uint64_t v55;
  void *v56;
  char v57;
  char v58;
  void *v60;
  void *v61;

  v4 = a3;
  if (!v4)
    goto LABEL_51;
  -[PPContactNameRecord score](self, "score");
  v6 = v5;
  objc_msgSend(v4, "score");
  if (v6 != v7)
    goto LABEL_51;
  v8 = -[PPContactNameRecord source](self, "source");
  if (v8 != objc_msgSend(v4, "source"))
    goto LABEL_51;
  v9 = -[PPContactNameRecord changeType](self, "changeType");
  if (v9 != objc_msgSend(v4, "changeType"))
    goto LABEL_51;
  -[PPContactNameRecord sourceIdentifier](self, "sourceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceIdentifier");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v10 == (void *)v11)
  {

  }
  else
  {
    v12 = (void *)v11;
    v13 = objc_msgSend(v10, "isEqual:", v11);

    if ((v13 & 1) == 0)
      goto LABEL_51;
  }
  -[PPContactNameRecord firstName](self, "firstName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstName");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v14 == (void *)v15)
  {

  }
  else
  {
    v16 = (void *)v15;
    v17 = objc_msgSend(v14, "isEqual:", v15);

    if ((v17 & 1) == 0)
      goto LABEL_51;
  }
  -[PPContactNameRecord phoneticFirstName](self, "phoneticFirstName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneticFirstName");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v18 == (void *)v19)
  {

  }
  else
  {
    v20 = (void *)v19;
    v21 = objc_msgSend(v18, "isEqual:", v19);

    if ((v21 & 1) == 0)
      goto LABEL_51;
  }
  -[PPContactNameRecord middleName](self, "middleName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "middleName");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v22 == (void *)v23)
  {

  }
  else
  {
    v24 = (void *)v23;
    v25 = objc_msgSend(v22, "isEqual:", v23);

    if ((v25 & 1) == 0)
      goto LABEL_51;
  }
  -[PPContactNameRecord phoneticMiddleName](self, "phoneticMiddleName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneticMiddleName");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v26 == (void *)v27)
  {

  }
  else
  {
    v28 = (void *)v27;
    v29 = objc_msgSend(v26, "isEqual:", v27);

    if ((v29 & 1) == 0)
      goto LABEL_51;
  }
  -[PPContactNameRecord lastName](self, "lastName");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastName");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v30 == (void *)v31)
  {

  }
  else
  {
    v32 = (void *)v31;
    v33 = objc_msgSend(v30, "isEqual:", v31);

    if ((v33 & 1) == 0)
      goto LABEL_51;
  }
  -[PPContactNameRecord phoneticLastName](self, "phoneticLastName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneticLastName");
  v35 = objc_claimAutoreleasedReturnValue();
  if (v34 == (void *)v35)
  {

  }
  else
  {
    v36 = (void *)v35;
    v37 = objc_msgSend(v34, "isEqual:", v35);

    if ((v37 & 1) == 0)
      goto LABEL_51;
  }
  -[PPContactNameRecord organizationName](self, "organizationName");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "organizationName");
  v39 = objc_claimAutoreleasedReturnValue();
  if (v38 == (void *)v39)
  {

  }
  else
  {
    v40 = (void *)v39;
    v41 = objc_msgSend(v38, "isEqual:", v39);

    if ((v41 & 1) == 0)
      goto LABEL_51;
  }
  -[PPContactNameRecord jobTitle](self, "jobTitle");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "jobTitle");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v42 == (void *)v43)
  {

  }
  else
  {
    v44 = (void *)v43;
    v45 = objc_msgSend(v42, "isEqual:", v43);

    if ((v45 & 1) == 0)
      goto LABEL_51;
  }
  -[PPContactNameRecord nickname](self, "nickname");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nickname");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v46 == (void *)v47)
  {

  }
  else
  {
    v48 = (void *)v47;
    v49 = objc_msgSend(v46, "isEqual:", v47);

    if ((v49 & 1) == 0)
      goto LABEL_51;
  }
  -[PPContactNameRecord relatedNames](self, "relatedNames");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relatedNames");
  v51 = objc_claimAutoreleasedReturnValue();
  if (v50 == (void *)v51)
  {

  }
  else
  {
    v52 = (void *)v51;
    v53 = objc_msgSend(v50, "isEqual:", v51);

    if ((v53 & 1) == 0)
      goto LABEL_51;
  }
  -[PPContactNameRecord streetNames](self, "streetNames");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "streetNames");
  v55 = objc_claimAutoreleasedReturnValue();
  if (v54 == (void *)v55)
  {

  }
  else
  {
    v56 = (void *)v55;
    v57 = objc_msgSend(v54, "isEqual:", v55);

    if ((v57 & 1) == 0)
    {
LABEL_51:
      v58 = 0;
      goto LABEL_52;
    }
  }
  -[PPContactNameRecord cityNames](self, "cityNames");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cityNames");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (v60 == v61)
    v58 = 1;
  else
    v58 = objc_msgSend(v60, "isEqual:", v61);

LABEL_52:
  return v58;
}

- (int64_t)compare:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  int64_t v11;
  const __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  const __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  const __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  const __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;

  v4 = a3;
  -[PPContactNameRecord lastName](self, "lastName");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (__CFString *)v5;
  else
    v7 = &stru_1E226D4B0;
  objc_msgSend(v4, "lastName");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_1E226D4B0;
  v11 = -[__CFString compare:](v7, "compare:", v10);

  if (!v11)
  {
    -[PPContactNameRecord firstName](self, "firstName");
    v12 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    v13 = (__CFString *)v12;
    v14 = v12 ? (__CFString *)v12 : &stru_1E226D4B0;
    objc_msgSend(v4, "firstName");
    v15 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    v16 = (__CFString *)v15;
    v17 = v15 ? (__CFString *)v15 : &stru_1E226D4B0;
    v11 = -[__CFString compare:](v14, "compare:", v17);

    if (!v11)
    {
      -[PPContactNameRecord middleName](self, "middleName");
      v18 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      v19 = (__CFString *)v18;
      v20 = v18 ? (__CFString *)v18 : &stru_1E226D4B0;
      objc_msgSend(v4, "middleName");
      v21 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      v22 = (__CFString *)v21;
      v23 = v21 ? (__CFString *)v21 : &stru_1E226D4B0;
      v11 = -[__CFString compare:](v20, "compare:", v23);

      if (!v11)
      {
        -[PPContactNameRecord sourceIdentifier](self, "sourceIdentifier");
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)v24;
        if (v24)
          v26 = (__CFString *)v24;
        else
          v26 = &stru_1E226D4B0;
        objc_msgSend(v4, "sourceIdentifier");
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = (void *)v27;
        if (v27)
          v29 = (const __CFString *)v27;
        else
          v29 = &stru_1E226D4B0;
        v11 = -[__CFString compare:](v26, "compare:", v29);

      }
    }
  }

  return v11;
}

+ (id)describeSource:(unsigned __int8)a3
{
  __CFString *v3;

  if (a3 >= 3u)
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid (%lu)"), a3);
  else
    v3 = off_1E226C238[a3];
  return v3;
}

+ (id)describeChangeType:(unsigned __int8)a3
{
  __CFString *v3;

  if (a3 >= 4u)
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid (%lu)"), a3);
  else
    v3 = off_1E226C250[a3];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
