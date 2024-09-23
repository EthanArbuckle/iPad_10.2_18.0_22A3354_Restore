@implementation VUIFamilyMembersRequestResponseParser

- (id)parseAMSURLResult:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v17[16];
  uint8_t v18[16];
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "vui_dictionaryForKey:", CFSTR("results"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[VUIFamilyMembersRequestResponseParser _parseFamilyMemberIdentifierFromDictionary:withKey:](self, "_parseFamilyMemberIdentifierFromDictionary:withKey:", v8, CFSTR("me"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "vui_arrayForKey:", CFSTR("members"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[VUIFamilyMembersRequestResponseParser _processRawFamilyMemberResults:](self, "_processRawFamilyMemberResults:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[VUIFamilyMembersRequestResponseParser _filterCurrentFamilyMember:fromResults:](self, "_filterCurrentFamilyMember:fromResults:", v9, v11);
          v12 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v12;
        }
      }
      else
      {
        v15 = sLogObject_8;
        if (os_log_type_enabled((os_log_t)sLogObject_8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v17 = 0;
          _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "Parsing AMS Family Member Fetch with no family members bag", v17, 2u);
        }
        v11 = (void *)MEMORY[0x1E0C9AA60];
      }

    }
    else
    {
      v14 = sLogObject_8;
      if (os_log_type_enabled((os_log_t)sLogObject_8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_DEFAULT, "Parsing AMS Family Member Fetch with no results bag", v18, 2u);
      }
      v11 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v13 = sLogObject_8;
    if (os_log_type_enabled((os_log_t)sLogObject_8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "Parsing AMS Family Member Fetch with no object dictionary", buf, 2u);
    }
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

- (VUIFamilyMembersRequestResponseParser)init
{
  VUIFamilyMembersRequestResponseParser *v2;
  os_log_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIFamilyMembersRequestResponseParser;
  v2 = -[VUIFamilyMembersRequestResponseParser init](&v6, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.tv.mediaAPI", "VUIFamilyMembersRequestResponseParser");
    v4 = (void *)sLogObject_8;
    sLogObject_8 = (uint64_t)v3;

  }
  return v2;
}

- (id)_processRawFamilyMemberResults:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  VUIFamilyMember *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v18;
  id obj;
  uint8_t buf[16];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v18 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = objc_alloc_init(VUIFamilyMember);
          objc_msgSend(v8, "vui_stringForKey:", CFSTR("firstName"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUIFamilyMember setFirstName:](v9, "setFirstName:", v10);
          objc_msgSend(v8, "vui_stringForKey:", CFSTR("lastName"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUIFamilyMember setLastName:](v9, "setLastName:", v11);
          -[VUIFamilyMembersRequestResponseParser _parseFamilyMemberIdentifierFromDictionary:withKey:](self, "_parseFamilyMemberIdentifierFromDictionary:withKey:", v8, CFSTR("id"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUIFamilyMember setMemberIdentifier:](v9, "setMemberIdentifier:", v12);
          objc_msgSend(v8, "vui_stringForKey:", CFSTR("accountName"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUIFamilyMember setAccountName:](v9, "setAccountName:", v13);
          -[VUIFamilyMember setSharingPurchases:](v9, "setSharingPurchases:", objc_msgSend(v8, "vui_BOOLForKey:defaultValue:", CFSTR("sharingPurchases"), 0));
          objc_msgSend(v18, "addObject:", v9);

        }
        else
        {
          v14 = sLogObject_8;
          if (os_log_type_enabled((os_log_t)sLogObject_8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_DEFAULT, "Parsing AMS Family Member Fetch invalid member dictionary", buf, 2u);
          }
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }

  v15 = (void *)objc_msgSend(v18, "copy");
  return v15;
}

- (id)_parseFamilyMemberIdentifierFromDictionary:(id)a3 withKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "vui_stringForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v8, "numberFromString:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "vui_numberForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)_filterCurrentFamilyMember:(id)a3 fromResults:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB3880];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__VUIFamilyMembersRequestResponseParser__filterCurrentFamilyMember_fromResults___block_invoke;
  v13[3] = &unk_1E9F9E538;
  v14 = v5;
  v7 = v5;
  v8 = a4;
  objc_msgSend(v6, "predicateWithBlock:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v8);

  objc_msgSend(v10, "filteredArrayUsingPredicate:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __80__VUIFamilyMembersRequestResponseParser__filterCurrentFamilyMember_fromResults___block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "memberIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(v3, "isEqualToNumber:", *(_QWORD *)(a1 + 32));

  return a1 ^ 1;
}

@end
