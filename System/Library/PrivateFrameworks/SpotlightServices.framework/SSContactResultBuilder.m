@implementation SSContactResultBuilder

+ (id)bundleId
{
  return CFSTR("com.apple.MobileAddressBook");
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

+ (BOOL)supportsResult:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  objc_super v11;

  v4 = a3;
  if (supportsResult__onceToken != -1)
    dispatch_once(&supportsResult__onceToken, &__block_literal_global_32);
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___SSContactResultBuilder;
  if ((objc_msgSendSuper2(&v11, sel_supportsResult_, v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)supportsResult__contactResultBundleIds;
    objc_msgSend(v4, "resultBundleId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "containsObject:", v7);

  }
  objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6430], objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", CFSTR("vCard"));

  return v5 & (v9 ^ 1);
}

void __41__SSContactResultBuilder_supportsResult___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("com.apple.spotlight.contacts");
  v4[1] = CFSTR("com.apple.MobileAddressBook");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)supportsResult__contactResultBundleIds;
  supportsResult__contactResultBundleIds = v2;

}

+ (BOOL)doesNotContainObject:(id)a3 inArray:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v5, "isEqual:", v11, (_QWORD)v14) & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v5, "isLikePhoneNumber:", v11) & 1) == 0)
            continue;
        }
        v12 = 0;
        goto LABEL_14;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_14:

  return v12;
}

+ (id)labeledValuesFromStrings:(id)a3 labeledValues:(id)a4 withStringForLabeledValueBlock:(id)a5 labeledValueForStringBlock:(id)a6
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id obj;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a6;
  v31 = (id)objc_opt_new();
  v11 = (void *)objc_opt_new();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v9;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v37;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v37 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v15);
        v17 = (void *)objc_opt_class();
        objc_msgSend(v16, "value");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v17) = objc_msgSend(v17, "doesNotContainObject:inArray:", v18, v11);

        if ((_DWORD)v17)
        {
          objc_msgSend(v31, "addObject:", v16);
          objc_msgSend(v16, "value");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v19);

        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v13);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v20 = v8;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v33;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(v20);
        v10[2](v10, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v24));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_opt_class();
        objc_msgSend(v25, "value");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v26) = objc_msgSend(v26, "doesNotContainObject:inArray:", v27, v11);

        if ((_DWORD)v26)
        {
          objc_msgSend(v31, "addObject:", v25);
          objc_msgSend(v25, "value");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v28);

        }
        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v22);
  }

  return v31;
}

- (SSContactResultBuilder)initWithResult:(id)a3
{
  return -[SSContactResultBuilder initWithResult:contactEntity:contact:](self, "initWithResult:contactEntity:contact:", a3, 0, 0);
}

- (SSContactResultBuilder)initWithResult:(id)a3 contactEntity:(id)a4 contact:(id)a5
{
  id v8;
  id v9;
  id v10;
  SSContactResultBuilder *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  int v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  id v63;
  void *v64;
  id v65;
  objc_super v66;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v66.receiver = self;
  v66.super_class = (Class)SSContactResultBuilder;
  v11 = -[SSResultBuilder initWithResult:](&v66, sel_initWithResult_, v8);
  if (!v11)
    goto LABEL_61;
  objc_msgSend(v8, "personIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[SSContactResultBuilder setPersonIdentifier:](v11, "setPersonIdentifier:", v12);
  }
  else
  {
    objc_msgSend(v9, "personIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSContactResultBuilder setPersonIdentifier:](v11, "setPersonIdentifier:", v13);

  }
  objc_msgSend(v8, "personQueryIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[SSContactResultBuilder setPersonQueryIdentifier:](v11, "setPersonQueryIdentifier:", v14);
  }
  else
  {
    objc_msgSend(v9, "personQueryIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSContactResultBuilder setPersonQueryIdentifier:](v11, "setPersonQueryIdentifier:", v15);

  }
  objc_msgSend(v8, "valueForAttribute:withType:", *MEMORY[0x1E0CA6158], objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[SSContactResultBuilder setDisplayName:](v11, "setDisplayName:", v16);
  }
  else
  {
    objc_msgSend(v9, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSContactResultBuilder setDisplayName:](v11, "setDisplayName:", v17);

  }
  if (v8)
  {
    -[SSContactResultBuilder setResultType:](v11, "setResultType:", objc_msgSend(v8, "type"));
  }
  else
  {
    -[SSContactResultBuilder personIdentifier](v11, "personIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      v19 = 37;
    else
      v19 = 36;
    -[SSContactResultBuilder setResultType:](v11, "setResultType:", v19);

  }
  objc_msgSend(v8, "contactIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v22 = v20;
  }
  else
  {
    objc_msgSend(v8, "valueForAttribute:withType:", *MEMORY[0x1E0CA60B0], objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      v25 = v23;
    }
    else
    {
      objc_msgSend(v9, "contactIdentifier");
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    v22 = v25;

  }
  -[SSContactResultBuilder setRealContactIdentifier:](v11, "setRealContactIdentifier:", v22);
  v65 = v10;
  if (v9)
  {
    v26 = v9;
    goto LABEL_32;
  }
  v26 = (id)objc_opt_new();
  if (v26)
  {
LABEL_32:
    v35 = (void *)objc_msgSend(v10, "mutableCopy");
    if (v22)
      goto LABEL_33;
LABEL_41:
    v38 = 1;
    if (!v35)
      goto LABEL_42;
    goto LABEL_44;
  }
  -[SSContactResultBuilder personQueryIdentifier](v11, "personQueryIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[SSContactResultBuilder personQueryIdentifier](v11, "personQueryIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      +[SPSearchContactEntity updatePersonQueryIdentifier:withContactIdentifier:](SPSearchContactEntity, "updatePersonQueryIdentifier:withContactIdentifier:", v28, v22);
      v29 = objc_claimAutoreleasedReturnValue();

      v28 = (void *)v29;
    }
    -[SSContactResultBuilder personIdentifier](v11, "personIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      -[SSContactResultBuilder personIdentifier](v11, "personIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[SPSearchContactEntity updatePersonQueryIdentifier:withContactIdentifier:](SPSearchContactEntity, "updatePersonQueryIdentifier:withContactIdentifier:", v28, v31);
      v32 = objc_claimAutoreleasedReturnValue();

      v28 = (void *)v32;
    }
    -[SSResultBuilder result](v11, "result");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "completion");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[SPSearchEntity searchEntityWithPersonQueryIdentifier:personName:fromSuggestion:](SPSearchEntity, "searchEntityWithPersonQueryIdentifier:personName:fromSuggestion:", v28, v34, 1);
    v26 = (id)objc_claimAutoreleasedReturnValue();

    v10 = v65;
    goto LABEL_32;
  }
  if (!v22)
  {
    v35 = (void *)objc_msgSend(v10, "mutableCopy");
    v26 = 0;
    goto LABEL_41;
  }
  +[SPSearchEntity searchEntityWithContactIdentifier:fromSuggestion:](SPSearchEntity, "searchEntityWithContactIdentifier:fromSuggestion:", v22, 0);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v10, "mutableCopy");
LABEL_33:
  objc_msgSend(v10, "identifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v22, "isEqual:", v36);

  if ((v37 & 1) != 0)
  {
    v38 = 0;
    if (!v35)
      goto LABEL_42;
  }
  else
  {
    +[SSContactStore contactForContactIdentifier:](SSContactStore, "contactForContactIdentifier:", v22);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "mutableCopy");

    v38 = 0;
    v35 = (void *)v40;
    if (!v40)
    {
LABEL_42:
      objc_msgSend(v26, "contact");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v41, "mutableCopy");

      if (!v35)
        v35 = (void *)objc_opt_new();
    }
  }
LABEL_44:
  if (v38)
  {
    -[SSContactResultBuilder displayName](v11, "displayName");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[SSNameFormatManager contactFromName:](SSNameFormatManager, "contactFromName:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "mutableCopy");

    v35 = (void *)v44;
  }
  objc_msgSend(v26, "emailAddresses");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v9;
  if (objc_msgSend(v45, "count"))
    objc_msgSend(v26, "emailAddresses");
  else
    objc_msgSend(v8, "valueForAttribute:withType:", *MEMORY[0x1E0CA61B8], objc_opt_class());
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = (void *)objc_opt_class();
  objc_msgSend(v35, "emailAddresses");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "labeledValuesFromStrings:labeledValues:withStringForLabeledValueBlock:labeledValueForStringBlock:", v46, v48, &__block_literal_global_23, &__block_literal_global_25_0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setEmailAddresses:", v49);

  objc_msgSend(v26, "rawPhoneNumbers");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v50, "count"))
    objc_msgSend(v26, "rawPhoneNumbers");
  else
    objc_msgSend(v8, "valueForAttribute:withType:", *MEMORY[0x1E0CA6570], objc_opt_class());
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = (void *)objc_opt_class();
  objc_msgSend(v35, "phoneNumbers");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "labeledValuesFromStrings:labeledValues:withStringForLabeledValueBlock:labeledValueForStringBlock:", v51, v53, &__block_literal_global_27, &__block_literal_global_28);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setPhoneNumbers:", v54);

  objc_msgSend(v26, "addresses");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v55, "count"))
    objc_msgSend(v26, "addresses");
  else
    objc_msgSend(v8, "valueForAttribute:withType:", *MEMORY[0x1E0CA6018], objc_opt_class());
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "postalAddresses");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "count");

  if (!v58)
  {
    objc_msgSend((id)objc_opt_class(), "labeledValuesFromStrings:labeledValues:withStringForLabeledValueBlock:labeledValueForStringBlock:", v56, 0, &__block_literal_global_29, &__block_literal_global_31_0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPostalAddresses:", v59);

  }
  objc_msgSend(v35, "birthday", v63);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (v60)
  {
    objc_msgSend(v35, "setBirthday:", v60);
  }
  else
  {
    objc_msgSend(v26, "birthdayComponents");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setBirthday:", v61);

  }
  -[SSContactResultBuilder setContact:](v11, "setContact:", v35);

  v9 = v64;
  v10 = v65;
LABEL_61:

  return v11;
}

uint64_t __63__SSContactResultBuilder_initWithResult_contactEntity_contact___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

id __63__SSContactResultBuilder_initWithResult_contactEntity_contact___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0C97338];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithLabel:value:", 0, v3);

  return v4;
}

id __63__SSContactResultBuilder_initWithResult_contactEntity_contact___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formattedStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __63__SSContactResultBuilder_initWithResult_contactEntity_contact___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97338]), "initWithLabel:value:", 0, v2);

  return v3;
}

id __63__SSContactResultBuilder_initWithResult_contactEntity_contact___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C973B0];
  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromPostalAddress:style:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __63__SSContactResultBuilder_initWithResult_contactEntity_contact___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "postalAddressFromString:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setStreet:", v2);
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97338]), "initWithLabel:value:", 0, v4);

  return v5;
}

- (NSString)fullName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C97218];
  -[SSContactResultBuilder contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromContact:style:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)buildResult
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SSContactResultBuilder;
  -[SSResultBuilder buildResult](&v8, sel_buildResult);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSContactResultBuilder realContactIdentifier](self, "realContactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContactIdentifier:", v4);

  -[SSContactResultBuilder personIdentifier](self, "personIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPersonIdentifier:", v5);

  -[SSContactResultBuilder personQueryIdentifier](self, "personQueryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPersonQueryIdentifier:", v6);

  objc_msgSend(v3, "setResultBundleId:", CFSTR("com.apple.MobileAddressBook"));
  objc_msgSend(v3, "setApplicationBundleIdentifier:", CFSTR("com.apple.MobileAddressBook"));
  objc_msgSend(v3, "setType:", -[SSContactResultBuilder resultType](self, "resultType"));
  return v3;
}

- (id)buildHeaderResultForEntity
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
  const __CFString *v15;
  __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  -[SSContactResultBuilder realContactIdentifier](self, "realContactIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setContactIdentifier:", v3);
  -[SSContactResultBuilder personIdentifier](self, "personIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPersonIdentifier:", v5);

  -[SSContactResultBuilder fullName](self, "fullName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayName:", v6);

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setPerson:", v4);
  objc_msgSend(v7, "setCardSectionId:", CFSTR("com.apple.spotlight.contactHeader"));
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  objc_msgSend(v8, "setCollectionStyle:", v9);

  v22[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCardSections:", v10);

  v11 = (void *)objc_opt_new();
  v21 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCardSections:", v12);

  -[SSContactResultBuilder buildResult](self, "buildResult");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setResultBundleId:", CFSTR("com.apple.MobileAddressBook"));
  objc_msgSend(v13, "setApplicationBundleIdentifier:", 0);
  objc_msgSend(v13, "setContactIdentifier:", v3);
  -[SSContactResultBuilder personIdentifier](self, "personIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPersonIdentifier:", v14);

  objc_msgSend(v13, "setInlineCard:", v11);
  objc_msgSend(v13, "setCompactCard:", 0);
  if (v3)
  {
    v15 = v3;
  }
  else
  {
    -[SSContactResultBuilder personIdentifier](self, "personIdentifier");
    v15 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  v16 = (__CFString *)v15;
  if (v15)
    v17 = v15;
  else
    v17 = CFSTR("unknown");
  objc_msgSend(CFSTR("com.apple.spotlight.contactHeader"), "stringByAppendingString:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setIdentifier:", v18);

  objc_msgSend(v13, "setNoGoTakeover:", 1);
  objc_msgSend(v13, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setResultIdentifier:", v19);

  return v13;
}

- (id)buildFooterResultForEntity
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
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
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  SSContactResultBuilder *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  const __CFString *v90;
  __CFString *v91;
  const __CFString *v92;
  void *v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t m;
  void *v99;
  void *v100;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  id obj;
  id obja;
  id objb;
  SSContactResultBuilder *v109;
  void *v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE v127[128];
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  _BYTE v132[128];
  void *v133;
  _BYTE v134[128];
  void *v135;
  _BYTE v136[128];
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  if (buildFooterResultForEntity_onceToken != -1)
    dispatch_once(&buildFooterResultForEntity_onceToken, &__block_literal_global_43_0);
  v3 = (void *)objc_opt_new();
  v109 = self;
  -[SSContactResultBuilder contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneNumbers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v104 = v4;
  v105 = v3;
  if (v6)
  {
    v7 = (void *)objc_opt_new();
    v123 = 0u;
    v124 = 0u;
    v125 = 0u;
    v126 = 0u;
    objc_msgSend(v4, "phoneNumbers");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v136, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v124;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v124 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * i);
          v13 = (void *)objc_opt_new();
          v14 = (void *)MEMORY[0x1E0C97338];
          objc_msgSend(v12, "label");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "localizedStringForLabel:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v16, "length"))
          {
            objc_msgSend(v13, "setKey:", v16);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("PHONE_LABEL"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setKey:", v18);

          }
          objc_msgSend(v12, "value");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "formattedStringValue");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          -[SSContactResultBuilder contact](v109, "contact");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[SSCommandConfiguration commandButtonItemForPhoneNumber:contact:](SSCommandConfiguration, "commandButtonItemForPhoneNumber:contact:", v20, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v135 = v22;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v135, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setValues:", v23);

          objc_msgSend(v7, "addObject:", v13);
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v136, 16);
      }
      while (v9);
    }

    v24 = (void *)objc_opt_new();
    objc_msgSend(v24, "setInfoTuples:", v7);
    v3 = v105;
    objc_msgSend(v105, "addObject:", v24);

    v4 = v104;
  }
  objc_msgSend(v4, "emailAddresses");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "count");

  if (v26)
  {
    v27 = (void *)objc_opt_new();
    v119 = 0u;
    v120 = 0u;
    v121 = 0u;
    v122 = 0u;
    objc_msgSend(v4, "emailAddresses");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v119, v134, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v120;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v120 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * j);
          v34 = (void *)objc_opt_new();
          v35 = (void *)MEMORY[0x1E0C97338];
          objc_msgSend(v33, "label");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "localizedStringForLabel:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v37, "length"))
          {
            objc_msgSend(v34, "setKey:", v37);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("EMAIL_LABEL"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setKey:", v39);

          }
          objc_msgSend(v33, "value");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          +[SSCommandConfiguration commandButtonItemForEmail:](SSCommandConfiguration, "commandButtonItemForEmail:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v133 = v41;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v133, 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setValues:", v42);

          objc_msgSend(v27, "addObject:", v34);
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v119, v134, 16);
      }
      while (v30);
    }

    v43 = (void *)objc_opt_new();
    objc_msgSend(v43, "setInfoTuples:", v27);
    v3 = v105;
    objc_msgSend(v105, "addObject:", v43);

    v4 = v104;
  }
  objc_msgSend(v4, "postalAddresses");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "count");

  if (v45)
  {
    v46 = (void *)objc_opt_new();
    v115 = 0u;
    v116 = 0u;
    v117 = 0u;
    v118 = 0u;
    objc_msgSend(v4, "postalAddresses");
    obja = (id)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v115, v132, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v116;
      do
      {
        for (k = 0; k != v48; ++k)
        {
          if (*(_QWORD *)v116 != v49)
            objc_enumerationMutation(obja);
          v51 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * k);
          v52 = (void *)objc_opt_new();
          v53 = (void *)MEMORY[0x1E0C97338];
          objc_msgSend(v51, "label");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "localizedStringForLabel:", v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v55, "length"))
          {
            objc_msgSend(v52, "setKey:", v55);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("ADDRESS_LABEL"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "setKey:", v57);

          }
          v58 = (void *)MEMORY[0x1E0C973B0];
          objc_msgSend(v51, "value");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "stringFromPostalAddress:style:", v59, 0);
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          +[SSCommandConfiguration commandButtonItemForAddressLocation:](SSCommandConfiguration, "commandButtonItemForAddressLocation:", v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v131 = v61;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v131, 1);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "setValues:", v62);

          objc_msgSend(v46, "addObject:", v52);
        }
        v48 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v115, v132, 16);
      }
      while (v48);
    }

    v63 = (void *)objc_opt_new();
    objc_msgSend(v63, "setInfoTuples:", v46);
    v3 = v105;
    objc_msgSend(v105, "addObject:", v63);

    v4 = v104;
  }
  objc_msgSend(v4, "birthday");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
  {
    v65 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "localizedStringForKey:value:table:", CFSTR("BIRTHDAY_LABEL"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setKey:", v67);

    objc_msgSend(v4, "birthday");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    +[SSCommandConfiguration commandButtonItemForBirthday:](SSCommandConfiguration, "commandButtonItemForBirthday:", v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = v69;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v130, 1);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setValues:", v70);

    v71 = (void *)objc_opt_new();
    v129 = v65;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v129, 1);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setInfoTuples:", v72);

    objc_msgSend(v3, "addObject:", v71);
  }
  if (objc_msgSend(v3, "count"))
  {
    v73 = (void *)objc_opt_new();
    objc_msgSend(v73, "setSymbolName:", CFSTR("arrow.up.forward.app.fill"));
    objc_msgSend(v73, "setIsTemplate:", 1);
    objc_msgSend(v4, "identifier");
    objb = (id)objc_claimAutoreleasedReturnValue();
    v74 = (void *)objc_opt_new();
    objc_msgSend(v74, "setCoreSpotlightIdentifier:", objb);
    if (isMacOS())
    {
      objc_msgSend(v74, "setApplicationBundleIdentifier:", CFSTR("com.apple.AddressBook"));
      v75 = v109;
    }
    else
    {
      v75 = v109;
      objc_msgSend((id)objc_opt_class(), "bundleId");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "setApplicationBundleIdentifier:", v77);

    }
    v78 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "localizedStringForKey:value:table:", CFSTR("OPEN_IN_CONTACTS_TITLE"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setTitle:", v80);

    v110 = v73;
    objc_msgSend(v78, "setImage:", v73);
    v103 = v74;
    objc_msgSend(v78, "setCommand:", v74);
    v81 = (void *)objc_opt_new();
    v82 = (void *)MEMORY[0x1E0D8C660];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "localizedStringForKey:value:table:", CFSTR("CONTACT_HEADER_TITLE"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "textWithString:", v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setTitle:", v85);

    v86 = (void *)objc_opt_new();
    objc_msgSend(v81, "setCollectionStyle:", v86);

    objc_msgSend(v81, "setCardSections:", v3);
    v102 = v78;
    objc_msgSend(v81, "setButtonItem:", v78);
    v87 = (void *)objc_opt_new();
    v128 = v81;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v128, 1);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setCardSections:", v88);

    -[SSContactResultBuilder buildResult](v75, "buildResult");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setContactIdentifier:", objb);
    -[SSContactResultBuilder personIdentifier](v75, "personIdentifier");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setPersonIdentifier:", v89);

    objc_msgSend(v76, "setInlineCard:", v87);
    objc_msgSend(v76, "setCompactCard:", v87);
    if (objb)
    {
      v90 = (const __CFString *)objb;
    }
    else
    {
      -[SSContactResultBuilder personIdentifier](v75, "personIdentifier");
      v90 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    v91 = (__CFString *)v90;
    if (v90)
      v92 = v90;
    else
      v92 = CFSTR("unknown");
    objc_msgSend(CFSTR("com.apple.spotlight.contactInfo"), "stringByAppendingString:", v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setIdentifier:", v93);

    v113 = 0u;
    v114 = 0u;
    v111 = 0u;
    v112 = 0u;
    v94 = v3;
    v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v111, v127, 16);
    if (v95)
    {
      v96 = v95;
      v97 = *(_QWORD *)v112;
      do
      {
        for (m = 0; m != v96; ++m)
        {
          if (*(_QWORD *)v112 != v97)
            objc_enumerationMutation(v94);
          v99 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * m);
          objc_msgSend(v76, "identifier");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "setResultIdentifier:", v100);

        }
        v96 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v111, v127, 16);
      }
      while (v96);
    }

    v4 = v104;
    v3 = v105;
  }
  else
  {
    v76 = 0;
  }

  return v76;
}

void __52__SSContactResultBuilder_buildFooterResultForEntity__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(CFSTR("com.apple.spotlight.contactInfo"), "stringByAppendingString:", CFSTR(".phoneNumber"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)buildFooterResultForEntity_phoneNumberCardSectionIdentifier;
  buildFooterResultForEntity_phoneNumberCardSectionIdentifier = v0;

  objc_msgSend(CFSTR("com.apple.spotlight.contactInfo"), "stringByAppendingString:", CFSTR(".emailAddress"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)buildFooterResultForEntity_emailAddressCardSectionIdentifier;
  buildFooterResultForEntity_emailAddressCardSectionIdentifier = v2;

  objc_msgSend(CFSTR("com.apple.spotlight.contactInfo"), "stringByAppendingString:", CFSTR(".address"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)buildFooterResultForEntity_addressCardSectionIdentifier;
  buildFooterResultForEntity_addressCardSectionIdentifier = v4;

  objc_msgSend(CFSTR("com.apple.spotlight.contactInfo"), "stringByAppendingString:", CFSTR(".birthday"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)buildFooterResultForEntity_birthdayCardSectionIdentifier;
  buildFooterResultForEntity_birthdayCardSectionIdentifier = v6;

}

- (id)buildSocialMediaResultForEntity
{
  void *v3;
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __CFString *v42;
  __CFString *v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  SSContactResultBuilder *v48;
  id obj;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (buildSocialMediaResultForEntity_onceToken != -1)
    dispatch_once(&buildSocialMediaResultForEntity_onceToken, &__block_literal_global_81);
  v51 = (void *)objc_opt_new();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v48 = self;
  -[SSContactResultBuilder contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "socialProfiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v52 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
  if (v52)
  {
    v50 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v52; ++i)
      {
        if (*(_QWORD *)v56 != v50)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "value");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "service");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "urlString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "bundleIdentifiers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "length"))
        {
          objc_msgSend(v6, "bundleIdentifiers");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "firstObject");
          v12 = objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend((id)buildSocialMediaResultForEntity_bundleIDForDefaultServices, "objectForKeyedSubscript:", v7);
          v12 = objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "applicationIsInstalled:", v12);

        if (v14)
        {
          v15 = (void *)objc_opt_new();
          objc_msgSend(v15, "setBundleIdentifier:", v12);
        }
        else
        {
          v15 = (void *)objc_opt_new();
          objc_msgSend(v15, "setSymbolName:", CFSTR("safari"));
          objc_msgSend(v15, "setPunchThroughBackground:", 1);
          objc_msgSend(v15, "setSize:", 45.0, 45.0);
        }
        v53 = v8;
        v54 = (void *)v12;
        if (objc_msgSend(v8, "length"))
        {
          v16 = (void *)MEMORY[0x1E0D8C5E0];
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "punchoutWithURL:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v18 = 0;
        }
        v19 = (void *)objc_opt_new();
        objc_msgSend(v19, "setPunchout:", v18);
        v20 = (void *)objc_opt_new();
        v21 = (void *)MEMORY[0x1E0D8C660];
        objc_msgSend(MEMORY[0x1E0C973E8], "localizedStringForService:", v7);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "textWithString:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setTitle:", v23);

        objc_msgSend(v20, "title");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setMaxLines:", 1);

        v25 = (void *)MEMORY[0x1E0D8C660];
        objc_msgSend(v6, "username");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "textWithString:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setSubtitle:", v27);

        objc_msgSend(v20, "subtitle");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setMaxLines:", 1);

        objc_msgSend(v20, "setImage:", v15);
        objc_msgSend(v20, "setCardSectionId:", CFSTR("com.apple.MobileAddressBook.SocialMedia"));
        objc_msgSend(v20, "setCommand:", v19);
        objc_msgSend(v51, "addObject:", v20);

      }
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    }
    while (v52);
  }

  if (objc_msgSend(v51, "count"))
  {
    v29 = (void *)objc_opt_new();
    objc_msgSend(v29, "setNumberOfRows:", 1);
    v30 = (void *)objc_opt_new();
    v31 = (void *)MEMORY[0x1E0D8C660];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("SOCIAL_MEDIA_SECTION_TITLE"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "textWithString:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setTitle:", v34);

    objc_msgSend(v30, "setCollectionStyle:", v29);
    objc_msgSend(v30, "setCardSections:", v51);
    v35 = (void *)objc_opt_new();
    v59 = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setCardSections:", v36);

    -[SSContactResultBuilder buildResult](v48, "buildResult");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setResultBundleId:", CFSTR("com.apple.MobileAddressBook.SocialMedia"));
    objc_msgSend(v37, "setApplicationBundleIdentifier:", CFSTR("com.apple.MobileAddressBook.SocialMedia"));
    -[SSContactResultBuilder realContactIdentifier](v48, "realContactIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setContactIdentifier:", v38);

    -[SSContactResultBuilder personIdentifier](v48, "personIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setPersonIdentifier:", v39);

    objc_msgSend(v37, "setInlineCard:", v35);
    objc_msgSend(v37, "setCompactCard:", 0);
    -[SSContactResultBuilder realContactIdentifier](v48, "realContactIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (v40)
    {
      v42 = v40;
    }
    else
    {
      -[SSContactResultBuilder personIdentifier](v48, "personIdentifier");
      v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v43 = v42;

    if (v43)
      v44 = v43;
    else
      v44 = CFSTR("unknown");
    objc_msgSend(CFSTR("com.apple.MobileAddressBook.SocialMedia"), "stringByAppendingString:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setIdentifier:", v45);

    objc_msgSend(v37, "identifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setResultIdentifier:", v46);

  }
  else
  {
    v37 = 0;
  }

  return v37;
}

void __57__SSContactResultBuilder_buildSocialMediaResultForEntity__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[8];
  _QWORD v8[9];

  v8[8] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C970F0];
  v7[0] = *MEMORY[0x1E0C970E8];
  v7[1] = v0;
  v8[0] = CFSTR("com.facebook.Facebook");
  v8[1] = CFSTR("com.yahoo.flickr");
  v1 = *MEMORY[0x1E0C97100];
  v7[2] = *MEMORY[0x1E0C970F8];
  v7[3] = v1;
  v8[2] = CFSTR("com.linkedin.LinkedIn");
  v8[3] = &stru_1E6E549F0;
  v2 = *MEMORY[0x1E0C97110];
  v7[4] = *MEMORY[0x1E0C97108];
  v7[5] = v2;
  v8[4] = CFSTR("com.sina.weibo");
  v8[5] = CFSTR("com.sina.weibo");
  v7[6] = *MEMORY[0x1E0C97118];
  v3 = isMacOS();
  v4 = CFSTR("com.atebits.Tweetie2");
  if (v3)
    v4 = CFSTR("maccatalyst.com.atebits.Tweetie2");
  v7[7] = *MEMORY[0x1E0C97120];
  v8[6] = v4;
  v8[7] = CFSTR("com.yelp.yelpiphone");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 8);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)buildSocialMediaResultForEntity_bundleIDForDefaultServices;
  buildSocialMediaResultForEntity_bundleIDForDefaultServices = v5;

}

- (id)buildPreviewCommand
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[SSContactResultBuilder realContactIdentifier](self, "realContactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContactIdentifier:", v4);

  return v3;
}

- (id)buildFootnote
{
  void *v3;
  void *v4;
  void *v5;

  -[SSContactResultBuilder buildTitle](self, "buildTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSResultBuilder buildHighlightedMatchedTextWithTitle:headTruncation:](self, "buildHighlightedMatchedTextWithTitle:headTruncation:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setMaxLines:", 1);
  return v5;
}

- (id)buildDescriptions
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v8;
  void *v9;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (SSSnippetModernizationEnabled())
  {
    if ((isIpad() & 1) == 0 && !isMacOS())
      return 0;
    -[SSContactResultBuilder contact](self, "contact");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "organizationName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v4, "length")
      || (-[SSContactResultBuilder displayName](self, "displayName"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v4, "isEqualToString:", v5),
          v5,
          v6))
    {

      return 0;
    }
    objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMaxLines:", 1);
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SSContactResultBuilder;
    -[SSResultBuilder buildDescriptions](&v10, sel_buildDescriptions);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)buildCommand
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

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setSymbolName:", CFSTR("person.crop.circle"));
  objc_msgSend(v4, "setIsTemplate:", 1);
  -[SSContactResultBuilder fullName](self, "fullName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTokenString:", v5);

  -[SSContactResultBuilder realContactIdentifier](self, "realContactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSContactResultBuilder personQueryIdentifier](self, "personQueryIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v3, "setEntityIdentifier:", v7);
  }
  else
  {
    -[SSResultBuilder result](self, "result");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "personQueryIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setEntityIdentifier:", v9);
    }
    else
    {
      +[SPSearchContactEntity updatePersonQueryIdentifier:withContactIdentifier:](SPSearchContactEntity, "updatePersonQueryIdentifier:withContactIdentifier:", &stru_1E6E549F0, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setEntityIdentifier:", v10);

    }
  }

  objc_msgSend(v3, "setEntityType:", 2);
  objc_msgSend(v3, "setSymbolImage:", v4);
  -[SSContactResultBuilder buildBackgroundColor](self, "buildBackgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEntityBackgroundColor:", v11);

  return v3;
}

- (id)buildTitle
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

  -[SSContactResultBuilder displayName](self, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    -[SSContactResultBuilder fullName](self, "fullName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "length"))
    {
      v3 = v4;
    }
    else
    {
      -[SSContactResultBuilder contact](self, "contact");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "phoneNumbers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringValue");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v3, "length"))
      {
        -[SSContactResultBuilder contact](self, "contact");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "emailAddresses");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "value");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "length"))
        {
          v3 = v12;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("NO_NAME"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
          v3 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setMaxLines:", 2);

  return v14;
}

- (id)buildAction
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[SSContactResultBuilder realContactIdentifier](self, "realContactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContactIdentifier:", v4);

  return v3;
}

- (id)buildThumbnail
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[SSContactResultBuilder realContactIdentifier](self, "realContactIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  if (v3)
  {
    objc_msgSend(v4, "setThreeDTouchEnabled:", 1);
    v9[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setContactIdentifiers:", v5);
  }
  else
  {
    objc_msgSend(v4, "setMonogramStyle:", 0);
    v6 = (void *)MEMORY[0x1E0C97218];
    -[SSContactResultBuilder contact](self, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromContact:style:", v5, 1002);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMonogramLetters:", v7);

  }
  return v4;
}

- (id)buildBadgingImageWithThumbnail:(id)a3
{
  return 0;
}

- (id)buildBackgroundColor
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[SSContactResultBuilder buildThumbnail](self, "buildThumbnail");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v4);

  return v3;
}

- (id)buildPreviewButtonItems
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[SSContactResultBuilder realContactIdentifier](self, "realContactIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setContactIdentifier:", v3);
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SSContactResultBuilder;
    -[SSResultBuilder buildPreviewButtonItems](&v7, sel_buildPreviewButtonItems);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (NSString)personIdentifier
{
  return self->_personIdentifier;
}

- (void)setPersonIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_personIdentifier, a3);
}

- (CNMutableContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (int)resultType
{
  return self->_resultType;
}

- (void)setResultType:(int)a3
{
  self->_resultType = a3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSString)personQueryIdentifier
{
  return self->_personQueryIdentifier;
}

- (void)setPersonQueryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_personQueryIdentifier, a3);
}

- (NSString)realContactIdentifier
{
  return self->_realContactIdentifier;
}

- (void)setRealContactIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_realContactIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_realContactIdentifier, 0);
  objc_storeStrong((id *)&self->_personQueryIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_personIdentifier, 0);
}

@end
