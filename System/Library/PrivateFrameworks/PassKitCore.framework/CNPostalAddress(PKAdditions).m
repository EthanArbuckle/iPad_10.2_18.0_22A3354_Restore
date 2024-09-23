@implementation CNPostalAddress(PKAdditions)

- (id)backwardsCompatibleDictionaryRepresentation
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(a1, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dictionaryWithDictionary:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v3, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "length");

        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0C973A8], "_ABKeyFromCNKey:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(v3, "objectForKeyedSubscript:", v10);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKey:", v14, v13);

          }
          objc_msgSend(v3, "objectForKeyedSubscript:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v15, v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)webServiceDictionaryRepresentation
{
  id v2;
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

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(a1, "street");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("addressLine1"));

  }
  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    objc_msgSend(v5, "objectAtIndex:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("addressLine2"));

  }
  objc_msgSend(a1, "city");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("city"));
  objc_msgSend(a1, "state");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, CFSTR("state"));
  objc_msgSend(a1, "postalCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("postalCode"));
  objc_msgSend(a1, "country");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("country"));
  objc_msgSend(a1, "ISOCountryCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uppercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, CFSTR("countryCode"));
  return v2;
}

- (id)redactedStreetAddress
{
  void *v1;
  void *v2;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v1, "setStreet:", &stru_1E2ADF4C0);
  v2 = (void *)objc_msgSend(v1, "copy");

  return v2;
}

- (id)redactedPostalAddress
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v10;

  objc_msgSend(a1, "redactedStreetAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "ISOCountryCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    objc_msgSend(a1, "suggestedCountryCode");
    v10 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v10;
    if (v10)
      goto LABEL_3;
LABEL_13:
    PKCurrentRegion();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  if (!v4)
    goto LABEL_13;
LABEL_3:
  objc_msgSend(v3, "postalCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("US")) && (unint64_t)objc_msgSend(v5, "length") > 5)
  {
    v6 = 5;
LABEL_10:
    objc_msgSend(v5, "substringToIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPostalCode:", v7);

    goto LABEL_11;
  }
  if ((!objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("GB"))
     || !objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("CA")))
    && (unint64_t)objc_msgSend(v5, "length") >= 5)
  {
    v6 = objc_msgSend(v5, "length") - 3;
    goto LABEL_10;
  }
LABEL_11:
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (id)suggestedCountryCode
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "country");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_countryCodeForCountryName:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_countryCodeForCountryName:()PKAdditions
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "ISOCountryCodes");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = *MEMORY[0x1E0C997B0];
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v4, "displayNameForKey:value:", v9, v11, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "compare:options:", v12, 129))
        {
          v13 = v11;

          goto LABEL_11;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

+ (id)backwardsCompatiblePostalAddressDictionary:()PKAdditions
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(MEMORY[0x1E0C973A8], "_CNKeyFromABKey:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v3, "objectForKeyedSubscript:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v13)
              objc_msgSend(v4, "setObject:forKey:", v11, v12);
          }

        }
        else
        {
          objc_msgSend(v4, "removeObjectForKey:", v10);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)postalAddressFromWebServiceDictionaryRepresentation:()PKAdditions
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0C97378];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "PKStringForKey:", CFSTR("addressLine1"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKStringForKey:", CFSTR("addressLine2"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKStringForKey:", CFSTR("city"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKStringForKey:", CFSTR("state"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKStringForKey:", CFSTR("postalCode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKStringForKey:", CFSTR("countryCode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKStringForKey:", CFSTR("country"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "length") == 2)
  {
    if (v6 && v7)
    {
      objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("\n%@"), v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setStreet:", v13);

    }
    else if (v6)
    {
      objc_msgSend(v5, "setStreet:", v6);
    }
    if (v8)
      objc_msgSend(v5, "setCity:", v8);
    if (v9)
      objc_msgSend(v5, "setState:", v9);
    if (v10)
      objc_msgSend(v5, "setPostalCode:", v10);
    if (v11)
    {
      objc_msgSend(v11, "uppercaseString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setISOCountryCode:", v16);

    }
    if (v12)
      objc_msgSend(v5, "setCountry:", v12);
    v15 = (void *)objc_msgSend(v5, "copy");
  }
  else
  {
    PKLogFacilityTypeGetObject(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v11;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "CNPostalAddress+PKAdditions: Cannot create CNPostalAddress from web service dictionary because the countryCode: %@ is invalid", buf, 0xCu);
    }

    v15 = 0;
  }

  return v15;
}

+ (const)_ABKeyFromCNKey:()PKAdditions
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C970C8]) & 1) != 0)
  {
    v4 = CFSTR("Street");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C97098]) & 1) != 0)
  {
    v4 = CFSTR("City");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C970C0]) & 1) != 0)
  {
    v4 = CFSTR("State");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C970B0]) & 1) != 0)
  {
    v4 = CFSTR("ZIP");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C970A0]) & 1) != 0)
  {
    v4 = CFSTR("Country");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C970A8]) & 1) != 0)
  {
    v4 = CFSTR("CountryCode");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C970D8]) & 1) != 0)
  {
    v4 = CFSTR("SubLocality");
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C970D0]))
  {
    v4 = CFSTR("SubAdministrativeArea");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_CNKeyFromABKey:()PKAdditions
{
  id v3;
  id *v4;
  id v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Street")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x1E0C970C8];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("City")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x1E0C97098];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("State")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x1E0C970C0];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ZIP")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x1E0C970B0];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Country")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x1E0C970A0];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CountryCode")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x1E0C970A8];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SubLocality")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x1E0C970D8];
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("SubAdministrativeArea")))
    {
      v5 = 0;
      goto LABEL_18;
    }
    v4 = (id *)MEMORY[0x1E0C970D0];
  }
  v5 = *v4;
LABEL_18:

  return v5;
}

@end
