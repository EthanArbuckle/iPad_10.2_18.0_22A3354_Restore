@implementation NSString(VCSUtilities)

- (id)VCS_uncommentedAddress
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  int v20;
  id v21;
  char v23;
  char v24;

  objc_sync_enter(CFSTR("AddressParsing"));
  v2 = (void *)VCS_uncommentedAddress_uncommentedAddresses;
  if (!VCS_uncommentedAddress_uncommentedAddresses)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)VCS_uncommentedAddress_uncommentedAddresses;
    VCS_uncommentedAddress_uncommentedAddresses = (uint64_t)v3;

    v2 = (void *)VCS_uncommentedAddress_uncommentedAddresses;
  }
  objc_msgSend(v2, "objectForKey:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(CFSTR("AddressParsing"));
  if (!v5)
  {
    v6 = objc_msgSend(a1, "length");
    v7 = (char *)NSZoneMalloc(0, 2 * v6 + 2);
    v8 = v7;
    v9 = MEMORY[0x1E0C80978];
    v10 = v7;
    if (v6)
    {
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v23 = 0;
      v24 = 1;
      v10 = v7;
      do
      {
        v14 = objc_msgSend(a1, "characterAtIndex:", v11);
        v15 = v14;
        if (v14 == 92)
        {
          if (v11 + 1 >= v6)
          {
            if ((v13 & 1) == 0)
            {
              if (v12 < 1)
                goto LABEL_21;
LABEL_18:
              v13 = 0;
              v12 -= v14 == 41;
              goto LABEL_27;
            }
LABEL_13:
            *(_WORD *)v10 = v14;
            v10 += 2;
            v13 &= v14 != 34;
            goto LABEL_27;
          }
          *(_WORD *)v10 = 92;
          *((_WORD *)v10 + 1) = objc_msgSend(a1, "characterAtIndex:", v11 + 1);
          v10 += 4;
          ++v11;
        }
        else
        {
          if ((v13 & 1) != 0)
            goto LABEL_13;
          if (v14 == 40)
          {
            v13 = 0;
            ++v12;
          }
          else
          {
            if (v12 > 0)
              goto LABEL_18;
            if (v14 != 60)
            {
              if ((v23 & (v14 == 62)) != 0)
                break;
              if (v14 > 0x7F)
              {
                if (__maskrune(v14, 0x4000uLL))
                {
LABEL_22:
                  v13 = 0;
                  if ((v24 & 1) == 0)
                  {
                    *(_WORD *)v10 = 32;
                    v10 += 2;
                  }
                  v24 = 1;
                  goto LABEL_27;
                }
              }
              else
              {
LABEL_21:
                if ((*(_DWORD *)(v9 + 4 * v14 + 60) & 0x4000) != 0)
                  goto LABEL_22;
              }
              v24 = 0;
              *(_WORD *)v10 = v15;
              v10 += 2;
              v13 |= v15 == 34;
              goto LABEL_27;
            }
            v13 = 0;
            v23 = 1;
            v10 = v8;
          }
        }
LABEL_27:
        ++v11;
      }
      while (v11 < v6);
    }
    v16 = v10 - v8;
    do
    {
      v17 = v10;
      v18 = v16;
      if (v10 <= v8)
        break;
      v10 -= 2;
      v19 = *((unsigned __int16 *)v17 - 1);
      v20 = v19 > 0x7F ? __maskrune(v19, 0x4000uLL) : *(_DWORD *)(v9 + 4 * v19 + 60) & 0x4000;
      v16 = v18 - 2;
    }
    while (v20);
    *(_WORD *)v17 = 0;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", v8, v18 >> 1);
    NSZoneFree(0, v8);
    objc_sync_enter(CFSTR("AddressParsing"));
    objc_msgSend((id)VCS_uncommentedAddress_uncommentedAddresses, "setObject:forKey:", v5, a1);
    objc_sync_exit(CFSTR("AddressParsing"));
  }
  v21 = v5;

  return v21;
}

- (uint64_t)VCS_isPhoneNumber
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (VCS_isPhoneNumber_onceToken != -1)
    dispatch_once(&VCS_isPhoneNumber_onceToken, &__block_literal_global_4);
  v2 = objc_msgSend(a1, "length");
  if (!v2)
    return 0;
  objc_msgSend((id)VCS_isPhoneNumber_phoneNumberDetector, "matchesInString:options:range:", a1, 0, 0, v2);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v8, "resultType", (_QWORD)v14) == 32)
        {
          objc_msgSend(v8, "URL");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "scheme");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("tel"));

          if ((v11 & 1) != 0)
            goto LABEL_16;
        }
        else if (objc_msgSend(v8, "resultType") == 2048)
        {
LABEL_16:
          v12 = 1;
          goto LABEL_17;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_17:

  return v12;
}

@end
