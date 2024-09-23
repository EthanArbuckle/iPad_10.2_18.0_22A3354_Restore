@implementation CNContact(TelephonyUtilities)

- (id)tu_labeledValueForEmailAddress:()TelephonyUtilities
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(a1, "isKeyAvailable:", *MEMORY[0x1E0C966A8]))
  {
    objc_msgSend(a1, "emailAddresses");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v9, "tuIsSuggested", (_QWORD)v13) & 1) == 0)
          {
            objc_msgSend(v9, "value");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v10, "isEqualToString:", v4);

            if (v11)
            {
              v6 = v9;
              goto LABEL_14;
            }
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)tu_labeledValueForHandle:()TelephonyUtilities
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  if (v5 != 1)
  {
    if (v5 == 2)
    {
      objc_msgSend(v4, "normalizedValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 || (objc_msgSend(v4, "value"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v10 = objc_alloc(MEMORY[0x1E0C97398]);
        objc_msgSend(v4, "isoCountryCode");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)objc_msgSend(v10, "initWithStringValue:countryCode:", v6, v11);

        objc_msgSend(a1, "tu_labeledValueForPhoneNumber:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

        goto LABEL_16;
      }
    }
    else if (v5 == 3)
    {
      objc_msgSend(v4, "normalizedValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (!v6)
      {
        objc_msgSend(v4, "value");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(a1, "tu_labeledValueForEmailAddress:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    v9 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v4, "normalizedValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(v4, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "tu_labeledValueForSocialProfileWithUsername:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v9 = (void *)v8;
  if (!v6)
    goto LABEL_15;
LABEL_16:

LABEL_18:
  return v9;
}

- (id)tu_labeledValueForPhoneNumber:()TelephonyUtilities
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(a1, "isKeyAvailable:", *MEMORY[0x1E0C967C0]))
  {
    objc_msgSend(a1, "phoneNumbers");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v9, "tuIsSuggested", (_QWORD)v13) & 1) == 0)
          {
            objc_msgSend(v9, "value");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v10, "isLikePhoneNumber:", v4);

            if (v11)
            {
              v6 = v9;
              goto LABEL_14;
            }
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)tu_labeledValueForSocialProfileWithUsername:()TelephonyUtilities
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(a1, "isKeyAvailable:", *MEMORY[0x1E0C96868]))
  {
    objc_msgSend(a1, "socialProfiles");
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "value", (_QWORD)v14);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "username");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", v4);

          if (v12)
          {
            v6 = v9;

            goto LABEL_13;
          }

        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)tu_localizedDisplayStringForHandle:()TelephonyUtilities
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  if (v5 != 1)
  {
    if (v5 != 2)
    {
      if (v5 == 3)
      {
        objc_msgSend(v4, "normalizedValue");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        if (!v6)
        {
          objc_msgSend(v4, "value");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(a1, "tu_labeledValueForEmailAddress:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v6)

        v9 = objc_opt_respondsToSelector();
        v10 = (void *)MEMORY[0x1E0C97338];
        objc_msgSend(v8, "label");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v9 & 1) != 0)
        {
          v12 = (_QWORD *)MEMORY[0x1E0C966A8];
LABEL_16:
          objc_msgSend(v10, "localizedDisplayStringForLabel:propertyName:", v11, *v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:

          goto LABEL_32;
        }
        objc_msgSend(v10, "localizedStringForLabel:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v16, "length"))
        {
          TUBundle();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v23;
          v24 = CFSTR("CONTACTS_EMAIL_LABEL");
LABEL_26:
          objc_msgSend(v23, "localizedStringForKey:value:table:", v24, &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
          v25 = objc_claimAutoreleasedReturnValue();

          v16 = (void *)v25;
          goto LABEL_31;
        }
        goto LABEL_32;
      }
LABEL_21:
      v8 = 0;
      v16 = 0;
      goto LABEL_32;
    }
    objc_msgSend(v4, "normalizedValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(v4, "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
        goto LABEL_21;
    }
    v17 = objc_alloc(MEMORY[0x1E0C97398]);
    objc_msgSend(v4, "isoCountryCode");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithStringValue:countryCode:", v11, v18);

    objc_msgSend(a1, "tu_labeledValueForPhoneNumber:", v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_respondsToSelector();
    v21 = (void *)MEMORY[0x1E0C97338];
    objc_msgSend(v8, "label");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v20 & 1) != 0)
    {
      objc_msgSend(v21, "localizedDisplayStringForLabel:propertyName:", v22, *MEMORY[0x1E0C967C0]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v21, "localizedStringForLabel:", v22);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v16, "length"))
      {
LABEL_30:

        goto LABEL_31;
      }
      TUBundle();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("CONTACTS_PHONE_LABEL"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
      v26 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v26;
    }

    goto LABEL_30;
  }
  objc_msgSend(v4, "normalizedValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(v4, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "tu_labeledValueForSocialProfileWithUsername:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)

  v15 = objc_opt_respondsToSelector();
  v10 = (void *)MEMORY[0x1E0C97338];
  objc_msgSend(v8, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v15 & 1) != 0)
  {
    v12 = (_QWORD *)MEMORY[0x1E0C96868];
    goto LABEL_16;
  }
  objc_msgSend(v10, "localizedStringForLabel:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v16, "length"))
  {
    TUBundle();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v23;
    v24 = CFSTR("CONTACTS_SOCIAL_PROFILE_LABEL");
    goto LABEL_26;
  }
LABEL_32:

  return v16;
}

- (id)tuHandlesForPhoneNumbers
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
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
  v2 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a1, "phoneNumbers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v7), "value");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          objc_msgSend(v8, "stringValue");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "countryCode");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          +[TUHandle normalizedPhoneNumberHandleForValue:isoCountryCode:](TUHandle, "normalizedPhoneNumberHandleForValue:isoCountryCode:", v10, v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
            objc_msgSend(v2, "addObject:", v12);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  objc_msgSend(v2, "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)tuHandlesForEmailAddresses
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a1, "emailAddresses", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7), "value");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "length"))
        {
          +[TUHandle normalizedEmailAddressHandleForValue:](TUHandle, "normalizedEmailAddressHandleForValue:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
            objc_msgSend(v2, "addObject:", v9);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  objc_msgSend(v2, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)allTUHandles
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "tuHandlesForPhoneNumbers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tuHandlesForEmailAddresses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);
  objc_msgSend(v2, "addObjectsFromArray:", v4);
  v5 = (void *)objc_msgSend(v2, "copy");

  return v5;
}

@end
