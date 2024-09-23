@implementation CNContact(PKAdditions)

+ (id)pkPassbookRequiredKeys
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[9];

  v5[8] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C966A8];
  v5[0] = *MEMORY[0x1E0C967F0];
  v5[1] = v0;
  v1 = *MEMORY[0x1E0C966D0];
  v5[2] = *MEMORY[0x1E0C967C0];
  v5[3] = v1;
  v2 = *MEMORY[0x1E0C966C0];
  v5[4] = *MEMORY[0x1E0C96780];
  v5[5] = v2;
  v3 = *MEMORY[0x1E0C967D0];
  v5[6] = *MEMORY[0x1E0C967D8];
  v5[7] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)contactWithABRecordRef:()PKAdditions
{
  id v4;
  void *v5;

  v4 = objc_alloc_init(MEMORY[0x1E0C97298]);
  objc_msgSend(MEMORY[0x1E0C97200], "pkPassbookRequiredKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    objc_msgSend(v4, "contactFromPublicABPerson:keysToFetch:", a3, v5);
    a3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return a3;
}

+ (id)contactWithPkDictionary:()PKAdditions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void **v23;
  uint64_t *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("address"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C973A8];
    objc_msgSend(v3, "PKDictionaryForKey:", CFSTR("address"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "backwardsCompatiblePostalAddressDictionary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C973A8], "postalAddressWithDictionaryRepresentation:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0CB3850]);
    objc_msgSend(v3, "PKStringForKey:", CFSTR("givenName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setGivenName:", v11);

    objc_msgSend(v3, "PKStringForKey:", CFSTR("familyName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFamilyName:", v12);

    v13 = objc_alloc_init(MEMORY[0x1E0CB3850]);
    objc_msgSend(v3, "PKStringForKey:", CFSTR("phoneticGivenName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setGivenName:", v14);

    objc_msgSend(v3, "PKStringForKey:", CFSTR("phoneticFamilyName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFamilyName:", v15);

    objc_msgSend(v10, "setPhoneticRepresentation:", v13);
    v16 = (void *)MEMORY[0x1E0C97200];
    v33 = *MEMORY[0x1E0C967F0];
    objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", v4, v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pkContactWithNameComponents:labeledValues:", v10, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("email"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v3, "PKStringForKey:", CFSTR("email"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0C97200];
      v31 = *MEMORY[0x1E0C966A8];
      objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", v4, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v9;
      v22 = (void *)MEMORY[0x1E0C99D80];
      v23 = &v32;
      v24 = &v31;
    }
    else
    {
      objc_msgSend(v3, "objectForKey:", CFSTR("phone"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
        v19 = 0;
        goto LABEL_9;
      }
      v26 = (void *)MEMORY[0x1E0C97398];
      objc_msgSend(v3, "PKStringForKey:", CFSTR("phone"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "phoneNumberWithStringValue:", v27);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = (void *)MEMORY[0x1E0C97200];
      v29 = *MEMORY[0x1E0C967C0];
      objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", v4, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v9;
      v22 = (void *)MEMORY[0x1E0C99D80];
      v23 = &v30;
      v24 = &v29;
    }
    objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "pkContactWithNameComponents:labeledValues:", 0, v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_9:
  return v19;
}

- (id)pkDictionaryForProperty:()PKAdditions
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
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "givenName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(a1, "givenName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("givenName"));

  }
  objc_msgSend(a1, "familyName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(a1, "familyName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("familyName"));

  }
  objc_msgSend(a1, "phoneticGivenName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(a1, "phoneticGivenName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("phoneticGivenName"));

  }
  objc_msgSend(a1, "phoneticFamilyName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(a1, "phoneticFamilyName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("phoneticFamilyName"));

  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C967F0]))
  {
    objc_msgSend(a1, "postalAddresses");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "value");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "label");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v15, "label");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v18, CFSTR("label"));

    }
    if (!v16)
      goto LABEL_25;
    objc_msgSend(v16, "backwardsCompatibleDictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = CFSTR("address");
    goto LABEL_24;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C966A8]))
  {
    objc_msgSend(a1, "emailAddresses");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "label");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v15, "label");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v23, CFSTR("label"));

    }
    objc_msgSend(v15, "value");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
      goto LABEL_26;
    objc_msgSend(v15, "value");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v16, CFSTR("email"));
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C967C0]))
  {
    objc_msgSend(a1, "phoneNumbers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "label");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v15, "label");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v27, CFSTR("label"));

    }
    objc_msgSend(v15, "value");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
      goto LABEL_26;
    objc_msgSend(v15, "value");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = CFSTR("phone");
LABEL_24:
    objc_msgSend(v5, "setObject:forKey:", v19, v20);

    goto LABEL_25;
  }
LABEL_27:
  v29 = (void *)objc_msgSend(v5, "copy");

  return v29;
}

+ (id)pkContactWithNameComponents:()PKAdditions labeledValues:
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0C97360];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "populateNamesFromComponents:", v7);

  if (objc_msgSend(v5, "count"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__CNContact_PKAdditions__pkContactWithNameComponents_labeledValues___block_invoke;
    v11[3] = &unk_1E2ABD8C0;
    v12 = v8;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v11);

  }
  v9 = (void *)objc_msgSend(v8, "copy");

  return v9;
}

+ (id)pkContactWithNameFromContact:()PKAdditions labeledValue:property:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  v11 = 0;
  if (v8 && v9)
  {
    v16 = v9;
    v17[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(v7, "nameComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pkContactWithNameComponents:labeledValues:", v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)pkContactWithNameComponents:()PKAdditions postalAddresses:emailAddresses:phoneNumbers:
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;

  v9 = (objc_class *)MEMORY[0x1E0C97360];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(v9);
  objc_msgSend(v14, "populateNamesFromComponents:", v13);

  objc_msgSend(v14, "pkAddLabeledValues:withProperty:", v12, *MEMORY[0x1E0C967F0]);
  objc_msgSend(v14, "pkAddLabeledValues:withProperty:", v11, *MEMORY[0x1E0C966A8]);

  objc_msgSend(v14, "pkAddLabeledValues:withProperty:", v10, *MEMORY[0x1E0C967C0]);
  v15 = (void *)objc_msgSend(v14, "copy");

  return v15;
}

- (uint64_t)pkFormattedContactAddress
{
  return objc_msgSend(a1, "pkFormattedContactAddressIncludingPhoneticName:", 0);
}

- (uint64_t)pkFormattedContactAddressWithoutName
{
  return objc_msgSend(a1, "pkFormattedContactAddressIncludingPhoneticName:showName:", 0, 0);
}

- (uint64_t)pkFormattedContactAddressIncludingPhoneticName:()PKAdditions
{
  return objc_msgSend(a1, "pkFormattedContactAddressIncludingPhoneticName:showName:", a3, 1);
}

- (id)pkFormattedContactAddressIncludingPhoneticName:()PKAdditions showName:
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;

  objc_msgSend(a1, "postalAddresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((a3 & 1) != 0)
    objc_msgSend(a1, "pkFullAndPhoneticName");
  else
    objc_msgSend(a1, "pkFullName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "country");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (!v12)
  {
    v13 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ISOCountryCode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedStringForCountryCode(v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCountry:", v16);

    v17 = objc_msgSend(v13, "copy");
    v9 = (void *)v17;
  }
  if (objc_msgSend(v10, "length") && a4)
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0C973B0], "stringFromPostalAddress:style:", v9, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%@\n%@"), v10, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C973B0], "stringFromPostalAddress:style:", v9, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

- (uint64_t)pkSingleLineFormattedContactAddress
{
  return objc_msgSend(a1, "pkSingleLineFormattedContactAddressIncludingCountryName:", 1);
}

- (id)pkSingleLineFormattedContactAddressIncludingCountryName:()PKAdditions
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(a1, "postalAddresses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((a3 & 1) == 0)
  {
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v7, "setCountry:", &stru_1E2ADF4C0);
    v8 = objc_msgSend(v7, "copy");

    v6 = (void *)v8;
  }
  objc_msgSend(MEMORY[0x1E0C973B0], "singleLineStringFromPostalAddress:addCountryName:", v6, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setRecentContact:()PKAdditions
{
  objc_setAssociatedObject(a1, sel_recentContact, a3, (void *)1);
}

- (id)recentContact
{
  return objc_getAssociatedObject(a1, sel_recentContact);
}

- (void)setContactSource:()PKAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel_contactSource, v2, (void *)1);

}

- (uint64_t)contactSource
{
  void *v2;
  uint64_t v3;

  objc_getAssociatedObject(a1, sel_contactSource);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  if (v3 == 3)
  {
    if (objc_msgSend(a1, "isSubsetOfMeCard"))
      return 1;
    else
      return 3;
  }
  return v3;
}

- (BOOL)isSubsetOfMeCard
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _QWORD v44[3];
  _QWORD v45[6];

  v1 = a1;
  v45[3] = *MEMORY[0x1E0C80C00];
  objc_getAssociatedObject(a1, sel_contactSource);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  if (v3 == 1)
    return 1;
  +[PKPaymentOptionsRecents defaultInstance](PKPaymentOptionsRecents, "defaultInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "meCard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_6;
  objc_msgSend(v1, "pkFullName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
  {

    goto LABEL_8;
  }
  objc_msgSend(v1, "pkFullName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pkFullName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
LABEL_8:
    v12 = *MEMORY[0x1E0C966A8];
    v44[0] = *MEMORY[0x1E0C967F0];
    v44[1] = v12;
    v45[0] = CFSTR("postalAddresses");
    v45[1] = CFSTR("emailAddresses");
    v44[2] = *MEMORY[0x1E0C967C0];
    v45[2] = CFSTR("phoneNumbers");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend(v13, "allKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v39;
      v28 = *(_QWORD *)v39;
      v29 = v1;
      v31 = v14;
      v32 = v13;
      do
      {
        v18 = 0;
        v30 = v16;
        do
        {
          if (*(_QWORD *)v39 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v18);
          if (objc_msgSend(v1, "isKeyAvailable:", v19, v28, v29))
          {
            objc_msgSend(v13, "objectForKey:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = 0u;
            v35 = 0u;
            v36 = 0u;
            v37 = 0u;
            objc_msgSend(v1, "valueForKey:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            if (v22)
            {
              v23 = v22;
              v24 = *(_QWORD *)v35;
              while (2)
              {
                for (i = 0; i != v23; ++i)
                {
                  if (*(_QWORD *)v35 != v24)
                    objc_enumerationMutation(v21);
                  v26 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
                  objc_msgSend(v6, "valueForKey:", v20);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v33[0] = MEMORY[0x1E0C809B0];
                  v33[1] = 3221225472;
                  v33[2] = __42__CNContact_PKAdditions__isSubsetOfMeCard__block_invoke;
                  v33[3] = &unk_1E2ABD8E8;
                  v33[4] = v26;
                  LOBYTE(v26) = objc_msgSend(v27, "pk_containsObjectPassingTest:", v33);

                  if ((v26 & 1) != 0)
                  {

                    v11 = 1;
                    v14 = v31;
                    v13 = v32;
                    goto LABEL_28;
                  }
                }
                v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
                if (v23)
                  continue;
                break;
              }
            }

            v17 = v28;
            v1 = v29;
            v14 = v31;
            v13 = v32;
            v16 = v30;
          }
          ++v18;
        }
        while (v18 != v16);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        v11 = 0;
      }
      while (v16);
    }
    else
    {
      v11 = 0;
    }
LABEL_28:

    goto LABEL_29;
  }
LABEL_6:
  v11 = 0;
LABEL_29:

  return v11 != 0;
}

- (void)setRecentFromContactInformation:()PKAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel_recentFromContactInformation, v2, (void *)1);

}

- (uint64_t)recentFromContactInformation
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, sel_recentFromContactInformation);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)setValueSource:()PKAdditions
{
  objc_setAssociatedObject(a1, sel_valueSource, a3, (void *)3);
}

- (id)valueSource
{
  return objc_getAssociatedObject(a1, sel_valueSource);
}

- (void)setFormattingConstrained:()PKAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel_formattingConstrained, v2, (void *)1);

}

- (uint64_t)formattingConstrained
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, sel_formattingConstrained);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntegerValue");

  return v2;
}

- (void)setIsHideMyEmail:()PKAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel_isHideMyEmail, v2, (void *)1);

}

- (uint64_t)isHideMyEmail
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, sel_isHideMyEmail);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (id)pkFullyQualifiedName
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "nameComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_fullNameFromComponents:style:", v2, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pkFullName
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "nameComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_fullNameFromComponents:style:", v2, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pkPhoneticName
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "nameComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_phoneticNameFromComponents:style:", v2, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pkFullAndPhoneticName
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;

  objc_msgSend(a1, "pkPhoneticName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pkFullName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    if (objc_msgSend(v3, "length"))
    {
      v4 = v3;
      v5 = v2;
      v6 = v5;
      if (v4 != v5)
      {
        if (v5 && v4)
        {
          v7 = objc_msgSend(v4, "caseInsensitiveCompare:", v5);

          if (!v7)
            goto LABEL_10;
        }
        else
        {

        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), v4, v6);
        v8 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }

    }
LABEL_10:
    v8 = v2;
    goto LABEL_13;
  }
  v8 = v3;
LABEL_13:
  v9 = v8;

  return v9;
}

- (id)_fullNameFromComponents:()PKAdditions style:
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a3;
  objc_msgSend(v5, "givenName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else
  {
    objc_msgSend(v5, "familyName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v9 = 0;
      goto LABEL_5;
    }
  }
  v8 = objc_alloc_init(MEMORY[0x1E0CB3858]);
  objc_msgSend(v8, "setStyle:", a4);
  objc_msgSend(v8, "stringFromPersonNameComponents:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
  return v9;
}

- (id)_phoneticNameFromComponents:()PKAdditions style:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a3;
  objc_msgSend(v5, "phoneticRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "givenName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else
  {
    objc_msgSend(v6, "familyName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v10 = 0;
      goto LABEL_5;
    }
  }
  v9 = objc_alloc_init(MEMORY[0x1E0CB3858]);
  objc_msgSend(v9, "setPhonetic:", 1);
  objc_msgSend(v9, "setStyle:", a4);
  objc_msgSend(v9, "stringFromPersonNameComponents:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
  return v10;
}

- (id)nameComponents
{
  id v2;
  id v3;
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
  void *v15;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  v3 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  if (objc_msgSend(a1, "isKeyAvailable:", *MEMORY[0x1E0C96790]))
  {
    objc_msgSend(a1, "namePrefix");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setNamePrefix:", v4);

  }
  if (objc_msgSend(a1, "isKeyAvailable:", *MEMORY[0x1E0C966D0]))
  {
    objc_msgSend(a1, "givenName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setGivenName:", v5);

  }
  if (objc_msgSend(a1, "isKeyAvailable:", *MEMORY[0x1E0C96780]))
  {
    objc_msgSend(a1, "middleName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setMiddleName:", v6);

  }
  if (objc_msgSend(a1, "isKeyAvailable:", *MEMORY[0x1E0C966C0]))
  {
    objc_msgSend(a1, "familyName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setFamilyName:", v7);

  }
  if (objc_msgSend(a1, "isKeyAvailable:", *MEMORY[0x1E0C96798]))
  {
    objc_msgSend(a1, "nameSuffix");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setNameSuffix:", v8);

  }
  if (objc_msgSend(a1, "isKeyAvailable:", *MEMORY[0x1E0C967A0]))
  {
    objc_msgSend(a1, "nickname");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setNickname:", v9);

  }
  if (objc_msgSend(a1, "isKeyAvailable:", *MEMORY[0x1E0C967D8]))
  {
    objc_msgSend(a1, "phoneticGivenName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setGivenName:", v10);

  }
  if (objc_msgSend(a1, "isKeyAvailable:", *MEMORY[0x1E0C967E0]))
  {
    objc_msgSend(a1, "phoneticMiddleName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setMiddleName:", v11);

  }
  if (objc_msgSend(a1, "isKeyAvailable:", *MEMORY[0x1E0C967D0]))
  {
    objc_msgSend(a1, "phoneticFamilyName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFamilyName:", v12);

  }
  objc_msgSend(v3, "givenName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 || (objc_msgSend(v3, "familyName"), (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    objc_msgSend(v3, "middleName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_23;
  }
  objc_msgSend(v2, "setPhoneticRepresentation:", v3);
LABEL_23:

  return v2;
}

- (id)sanitizedContact
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  id obj;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v25 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v25, "postalAddresses");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "ISOCountryCodes");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v1;
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v35 != v4)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "value");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "ISOCountryCode");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v7, "length"))
          goto LABEL_22;
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __42__CNContact_PKAdditions__sanitizedContact__block_invoke;
        v32[3] = &unk_1E2ABD910;
        v8 = v7;
        v33 = v8;
        v9 = objc_msgSend(v27, "indexOfObjectPassingTest:", v32);

        if (v9 == 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_22:
          objc_msgSend(v6, "suggestedCountryCode");
          v8 = (id)objc_claimAutoreleasedReturnValue();

          if (v8)
            objc_msgSend(v6, "setISOCountryCode:", v8);
        }

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v3);
  }

  objc_msgSend(v25, "phoneNumbers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
        objc_msgSend(v17, "value");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "digits");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "labeledValueBySettingValue:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v21);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    }
    while (v14);
  }

  v22 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v25, "setPhoneNumbers:", v22);

  v23 = (void *)objc_msgSend(v25, "copy");
  return v23;
}

- (id)contactWithCleanedUpDistrict
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  if (objc_msgSend(v1, "isKeyAvailable:", *MEMORY[0x1E0C967F0]))
  {
    objc_msgSend(v1, "postalAddresses");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    if (objc_msgSend(v1, "isKeyAvailable:", *MEMORY[0x1E0C967B0]))
      v6 = v5 == 0;
    else
      v6 = 1;
    if (!v6)
    {
      objc_msgSend(v1, "note");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setSubLocality:", v7);

      objc_msgSend(v1, "setNote:", &stru_1E2ADF4C0);
    }

  }
  return v1;
}

- (id)pkContactWithCleanedUpCountryCode
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v1, "postalAddresses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ISOCountryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length") == 2)
  {
    objc_msgSend(v5, "uppercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    if ((v7 & 1) != 0)
      goto LABEL_7;
    objc_msgSend(v5, "uppercaseString");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "suggestedCountryCode");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
  if (v8)
  {
    v10 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v10, "setISOCountryCode:", v9);
    v11 = objc_alloc(MEMORY[0x1E0C97338]);
    objc_msgSend(v3, "label");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "copy");
    v14 = (void *)objc_msgSend(v11, "initWithLabel:value:", v12, v13);
    v18[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setPostalAddresses:", v15);

  }
LABEL_7:
  v16 = (void *)objc_msgSend(v1, "copy");

  return v16;
}

- (id)pk_displayName
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "pkFullName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "length"))
  {
    objc_msgSend(a1, "organizationName");
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  if (!objc_msgSend(v2, "length"))
  {

    v2 = 0;
  }
  return v2;
}

- (id)pkDeconstructContactUsingKey:()PKAdditions
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(a1, "isKeyAvailable:", v4))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(a1, "postalAddresses", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
          v12 = (void *)objc_msgSend(a1, "mutableCopy");
          v20 = v11;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setValue:forKey:", v13, v4);

          objc_msgSend(v5, "addObject:", v12);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v8);
    }

  }
  v14 = (void *)objc_msgSend(v5, "copy");

  return v14;
}

- (id)pkDeconstructContactUsingKey:()PKAdditions substring:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id obj;
  id v38;
  uint64_t v39;
  id v40;
  uint8_t buf[16];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!objc_msgSend(a1, "isKeyAvailable:", v6))
    goto LABEL_37;
  objc_msgSend(a1, "valueForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_36;
  v40 = v7;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v30 = v8;
  obj = v8;
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (!v39)
    goto LABEL_35;
  v9 = *(_QWORD *)v43;
  v10 = 0x1E0C97000uLL;
  v36 = v6;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v43 != v9)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v11);
      objc_msgSend(v12, "value", v30);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v10;
        v15 = v9;
        v16 = a1;
        v17 = v13;
        objc_msgSend(v17, "street");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v18, "localizedStandardContainsString:", v40) & 1) != 0)
          goto LABEL_20;
        objc_msgSend(v17, "subLocality");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v19, "localizedStandardContainsString:", v40) & 1) != 0)
          goto LABEL_19;
        objc_msgSend(v17, "city");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v20, "localizedStandardContainsString:", v40) & 1) != 0)
          goto LABEL_18;
        v35 = v19;
        objc_msgSend(v17, "subAdministrativeArea");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v21, "localizedStandardContainsString:", v40) & 1) != 0)
          goto LABEL_17;
        v34 = v21;
        objc_msgSend(v17, "state");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v22, "localizedStandardContainsString:", v40) & 1) != 0)
          goto LABEL_16;
        objc_msgSend(v17, "postalCode");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v33, "localizedStandardContainsString:") & 1) != 0)
        {

LABEL_16:
          v21 = v34;
LABEL_17:

          v19 = v35;
LABEL_18:

LABEL_19:
          v6 = v36;
LABEL_20:

          a1 = v16;
          v9 = v15;
          v10 = v14;
LABEL_26:
          v25 = objc_msgSend(a1, "mutableCopy");
          v46 = v12;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setValue:forKey:](v25, "setValue:forKey:", v26, v6);

          objc_msgSend(v38, "addObject:", v25);
          goto LABEL_27;
        }
        objc_msgSend(v17, "country");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "localizedStandardContainsString:", v40);

        v6 = v36;
        a1 = v16;
        v9 = v15;
        v10 = v14;
        if ((v32 & 1) != 0)
          goto LABEL_26;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v13, "stringValue");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "localizedStandardContainsString:", v40);

            if ((v24 & 1) == 0)
              goto LABEL_28;
            goto LABEL_26;
          }
          PKLogFacilityTypeGetObject(0);
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18FC92000, v25, OS_LOG_TYPE_DEFAULT, "Tried to deconstruct a contact with a CNLabeledValue value class that we don't know how to handle", buf, 2u);
          }
LABEL_27:

          goto LABEL_28;
        }
        if ((objc_msgSend(v13, "localizedStandardContainsString:", v40) & 1) != 0)
          goto LABEL_26;
      }
LABEL_28:

      ++v11;
    }
    while (v39 != v11);
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    v39 = v27;
  }
  while (v27);
LABEL_35:

  v7 = v40;
  v8 = v30;
LABEL_36:

LABEL_37:
  v28 = (void *)objc_msgSend(v38, "copy", v30);

  return v28;
}

+ (uint64_t)pk_predicateForContactsMatchingEmailAddress:()PKAdditions
{
  return objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:");
}

+ (uint64_t)pk_predicateForContactsMatchingPhoneNumber:()PKAdditions
{
  return objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingPhoneNumber:");
}

- (uint64_t)representsContact:()PKAdditions forContactKeys:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  unint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  BOOL v37;
  char v38;
  uint64_t v39;
  id v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "pkFullName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (!v9)
    goto LABEL_15;
  objc_msgSend(a1, "givenName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "givenName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  v13 = v11;
  v14 = v13;
  if (v12 == v13)
  {

  }
  else
  {
    if (!v12 || !v13)
    {

LABEL_38:
LABEL_39:
      v39 = 0;
      goto LABEL_40;
    }
    v15 = objc_msgSend(v12, "isEqualToString:", v13);

    if (!v15)
      goto LABEL_38;
  }
  objc_msgSend(a1, "familyName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "familyName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16;
  v19 = v17;
  if (v18 == v19)
  {

    goto LABEL_15;
  }
  v20 = v19;
  if (!v18 || !v19)
  {

    goto LABEL_38;
  }
  v21 = objc_msgSend(v18, "isEqualToString:", v19);

  if ((v21 & 1) == 0)
    goto LABEL_39;
LABEL_15:
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v7;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v22)
  {
    v23 = v22;
    v41 = v7;
    v24 = *(_QWORD *)v44;
    v25 = 0x1E0C99000uLL;
    while (2)
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v44 != v24)
          objc_enumerationMutation(obj);
        v27 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(a1, "valueForKey:", v27, v41);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "valueForKey:", v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v28, "firstObject");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "value");
          v31 = a1;
          v32 = v6;
          v33 = v25;
          v34 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v29, "firstObject");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "value");
          v36 = objc_claimAutoreleasedReturnValue();

          v28 = (void *)v34;
          v25 = v33;
          v6 = v32;
          a1 = v31;
          v29 = (void *)v36;
        }
        if (v28)
          v37 = v29 == 0;
        else
          v37 = 1;
        if (v37)
        {

          if (v28 != v29)
            goto LABEL_33;
        }
        else
        {
          v38 = objc_msgSend(v28, "isEqual:", v29);

          if ((v38 & 1) == 0)
          {
LABEL_33:
            v39 = 0;
            goto LABEL_34;
          }
        }
      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (v23)
        continue;
      break;
    }
    v39 = 1;
LABEL_34:
    v7 = v41;
  }
  else
  {
    v39 = 1;
  }

LABEL_40:
  return v39;
}

- (uint64_t)ABPerson
{
  id v2;
  uint64_t v3;

  v2 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v3 = objc_msgSend(v2, "publicABPersonFromContact:publicAddressBook:", a1, 0);

  return v3;
}

@end
