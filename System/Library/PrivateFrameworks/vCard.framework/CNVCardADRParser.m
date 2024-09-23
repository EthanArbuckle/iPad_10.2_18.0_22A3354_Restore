@implementation CNVCardADRParser

+ (id)valueWithParser:(id)a3
{
  void *v4;

  objc_msgSend(a1, "parseStreetAddressComponentsWithParser:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "collectStreetAddressComponentsIntoSingleKeyInAddress:", v4);
  return v4;
}

+ (id)parseStreetAddressComponentsWithParser:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  _QWORD v17[8];

  v17[7] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = CFSTR("postOfficeBox");
  v17[1] = CFSTR("extendedStreet");
  v17[2] = CFSTR("street");
  v17[3] = CFSTR("city");
  v17[4] = CFSTR("state");
  v17[5] = CFSTR("postalCode");
  v17[6] = CFSTR("country");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 7);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v9)
        objc_enumerationMutation(v6);
      if (!objc_msgSend(a1, "parseNextStringWithParser:components:key:", v4, v5, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), (_QWORD)v12))break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }

  return v5;
}

+ (BOOL)parseNextStringWithParser:(id)a3 components:(id)a4 key:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  char v11;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "parseStringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
  {

    v10 = 0;
  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v8);
  v11 = objc_msgSend(v9, "advancePastSemicolon");

  return v11;
}

+ (void)collectStreetAddressComponentsIntoSingleKeyInAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("street"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("extendedStreet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("postOfficeBox"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addressValueWithPrimaryAddress:extendedAddress:poBox:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = CFSTR("street");
  v10[1] = CFSTR("extendedStreet");
  v10[2] = CFSTR("postOfficeBox");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectsForKeys:", v9);

  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("street"));
}

+ (id)addressValueWithPrimaryAddress:(id)a3 extendedAddress:(id)a4 poBox:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v7 = (void *)MEMORY[0x1E0C99DE8];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_cn_addNonNilObject:", v8);

  objc_msgSend(v11, "_cn_addNonNilObject:", v10);
  objc_msgSend(v11, "_cn_addNonNilObject:", v9);

  objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (void)processExtensionValuesForLines:(id)a3 validCountryCodes:(id)a4 parser:(id)a5
{
  id v7;
  id v8;
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
  id obj;
  uint64_t v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v23 = a4;
  v8 = a5;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v7;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v21 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v12, "grouping");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "firstValueForKey:inExtensionGroup:", CFSTR("X-APPLE-SUBLOCALITY"), v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "grouping");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "firstValueForKey:inExtensionGroup:", CFSTR("X-APPLE-SUBADMINISTRATIVEAREA"), v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1, "countryCodeForLine:validCountryCodes:parser:", v12, v23, v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "value");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v18, "mutableCopy");

        objc_msgSend(v19, "setObject:forKeyedSubscript:", v14, CFSTR("subLocality"));
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v16, CFSTR("subAdministrativeArea"));
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, CFSTR("ISOCountryCode"));
        objc_msgSend(v12, "setValue:", v19);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v10);
  }

}

+ (id)countryCodeForLine:(id)a3 validCountryCodes:(id)a4 parser:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  char v13;

  v7 = a4;
  v8 = a5;
  objc_msgSend(a3, "grouping");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstValueForKey:inExtensionGroup:", CFSTR("X-ABADR"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    if (v7)
    {
      objc_msgSend(v10, "lowercaseString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v7, "containsObject:", v12);

      if ((v13 & 1) == 0)
      {

        v10 = 0;
      }
    }
    v11 = v10;
    v10 = v11;
  }

  return v11;
}

@end
