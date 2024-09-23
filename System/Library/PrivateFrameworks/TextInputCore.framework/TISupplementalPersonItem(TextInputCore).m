@implementation TISupplementalPersonItem(TextInputCore)

- (void)core_appendEntitiesToArray:()TextInputCore
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;

  v47 = a3;
  objc_msgSend(a1, "givenName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0D3AB80]);
    objc_msgSend(a1, "givenName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithName:data:", v7, objc_msgSend(a1, "identifier"));
    objc_msgSend(v47, "addObject:", v8);

  }
  objc_msgSend(a1, "phoneticGivenName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0D3AB80]);
    objc_msgSend(a1, "phoneticGivenName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithName:data:", v12, objc_msgSend(a1, "identifier"));
    objc_msgSend(v47, "addObject:", v13);

  }
  objc_msgSend(a1, "middleName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15)
  {
    v16 = objc_alloc(MEMORY[0x1E0D3AB80]);
    objc_msgSend(a1, "middleName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithName:data:", v17, objc_msgSend(a1, "identifier"));
    objc_msgSend(v47, "addObject:", v18);

  }
  objc_msgSend(a1, "phoneticMiddleName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "length");

  if (v20)
  {
    v21 = objc_alloc(MEMORY[0x1E0D3AB80]);
    objc_msgSend(a1, "phoneticMiddleName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithName:data:", v22, objc_msgSend(a1, "identifier"));
    objc_msgSend(v47, "addObject:", v23);

  }
  objc_msgSend(a1, "familyName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "length");

  if (v25)
  {
    v26 = objc_alloc(MEMORY[0x1E0D3AB80]);
    objc_msgSend(a1, "familyName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v26, "initWithName:data:", v27, objc_msgSend(a1, "identifier"));
    objc_msgSend(v47, "addObject:", v28);

  }
  objc_msgSend(a1, "phoneticFamilyName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "length");

  if (v30)
  {
    v31 = objc_alloc(MEMORY[0x1E0D3AB80]);
    objc_msgSend(a1, "phoneticFamilyName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v31, "initWithName:data:", v32, objc_msgSend(a1, "identifier"));
    objc_msgSend(v47, "addObject:", v33);

  }
  objc_msgSend(a1, "previousFamilyName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "length");

  if (v35)
  {
    v36 = objc_alloc(MEMORY[0x1E0D3AB80]);
    objc_msgSend(a1, "previousFamilyName");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v36, "initWithName:data:", v37, objc_msgSend(a1, "identifier"));
    objc_msgSend(v47, "addObject:", v38);

  }
  objc_msgSend(a1, "nickname");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "length");

  if (v40)
  {
    v41 = objc_alloc(MEMORY[0x1E0D3AB80]);
    objc_msgSend(a1, "nickname");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v41, "initWithName:data:", v42, objc_msgSend(a1, "identifier"));
    objc_msgSend(v47, "addObject:", v43);

  }
  objc_msgSend(a1, "personNameComponents");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v44, 2, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3AB80]), "initWithName:data:", v45, objc_msgSend(a1, "identifier"));
    objc_msgSend(v47, "addObject:", v46);

  }
}

- (uint64_t)core_isEqualToMecabraCandidate:()TextInputCore
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  char v38;
  uint64_t v39;

  v4 = a3;
  objc_msgSend(v4, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    objc_msgSend(a1, "phoneticGivenName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "input");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if ((v9 & 1) != 0)
      goto LABEL_13;
    objc_msgSend(a1, "phoneticMiddleName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "input");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if ((v12 & 1) != 0)
      goto LABEL_13;
    objc_msgSend(a1, "phoneticFamilyName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "input");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToString:", v14);

    if ((v15 & 1) != 0)
      goto LABEL_13;
    objc_msgSend(a1, "nickname");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "input");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqualToString:", v17);

    if ((v18 & 1) != 0)
      goto LABEL_13;
    objc_msgSend(a1, "previousFamilyName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "input");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqualToString:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_13;
  }
  objc_msgSend(v4, "candidate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "length");

  if (!v23)
    goto LABEL_15;
  objc_msgSend(a1, "givenName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v24, "isEqualToString:", v25);

  if ((v26 & 1) != 0)
    goto LABEL_13;
  objc_msgSend(a1, "middleName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v27, "isEqualToString:", v28);

  if ((v29 & 1) != 0)
    goto LABEL_13;
  objc_msgSend(a1, "familyName");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v30, "isEqualToString:", v31);

  if ((v32 & 1) != 0)
    goto LABEL_13;
  objc_msgSend(a1, "nickname");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v33, "isEqualToString:", v34);

  if ((v35 & 1) != 0
    || (objc_msgSend(a1, "previousFamilyName"),
        v36 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "candidate"),
        v37 = (void *)objc_claimAutoreleasedReturnValue(),
        v38 = objc_msgSend(v36, "isEqualToString:", v37),
        v37,
        v36,
        (v38 & 1) != 0))
  {
LABEL_13:
    v39 = 1;
  }
  else
  {
LABEL_15:
    v39 = 0;
  }

  return v39;
}

- (id)core_nonPhoneticRangesInString:()TextInputCore options:locale:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  objc_msgSend(a1, "givenName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    objc_msgSend(a1, "givenName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    rangesOfStringInString(v13, v8, a4, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v14);

  }
  objc_msgSend(a1, "middleName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  if (v16)
  {
    objc_msgSend(a1, "middleName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    rangesOfStringInString(v17, v8, a4, v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v18);

  }
  objc_msgSend(a1, "familyName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "length");

  if (v20)
  {
    objc_msgSend(a1, "familyName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    rangesOfStringInString(v21, v8, a4, v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v22);

  }
  objc_msgSend(a1, "nickname");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "length");

  if (v24)
  {
    objc_msgSend(a1, "nickname");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    rangesOfStringInString(v25, v8, a4, v9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v26);

  }
  objc_msgSend(a1, "previousFamilyName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "length");

  if (v28)
  {
    objc_msgSend(a1, "previousFamilyName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    rangesOfStringInString(v29, v8, a4, v9);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v30);

  }
  return v10;
}

- (id)core_nameReadingPairsWithGenerationMode:()TextInputCore mecabraEnvironment:
{
  id v5;
  id v6;
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
  id v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v5 = a4;
  v6 = objc_alloc(MEMORY[0x1E0D3AB70]);
  objc_msgSend(a1, "givenName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "phoneticGivenName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "middleName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "phoneticMiddleName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "familyName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "phoneticFamilyName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "organizationName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nickname");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v6, "initWithFirstName:phoneticFirstName:middleName:phoneticMiddleName:lastName:phoneticLastName:organizationName:jobTitle:nickname:relations:streets:cities:score:", v7, v8, v9, v10, v11, v12, 0.0, v13, 0, v14, 0, 0, 0);

  v16 = v5;
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  TICreateNameReadingPairFromContactAndAppendToArray(v15, a3, v5, v17);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", (unint64_t)objc_msgSend(v17, "count") >> 1);
  if (objc_msgSend(v17, "count"))
  {
    v19 = 0;
    do
    {
      objc_msgSend(v17, "objectAtIndexedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "count") <= v19 + 1)
      {
        v21 = 0;
      }
      else
      {
        objc_msgSend(v17, "objectAtIndexedSubscript:", v19 + 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v22 = v21;
      else
        v22 = 0;
      +[TINameReadingPair nameReadingPairWithName:reading:](TINameReadingPair, "nameReadingPairWithName:reading:", v20, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v23);

      v19 += 2;
    }
    while (objc_msgSend(v17, "count") > v19);
  }

  return v18;
}

@end
