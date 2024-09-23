@implementation ACAccount(ICAccountAdditions)

- (uint64_t)ic_isITunesAccount
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  _BOOL8 v8;

  objc_msgSend(a1, "accountType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C8F170]);

  if (!v4)
    return 0;
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMac");

  if (!v6)
    return 1;
  objc_msgSend(a1, "ic_activeMediaTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = !objc_msgSend(v7, "count")
    || objc_msgSend(v7, "containsObject:", CFSTR("com.apple.AppleMediaServices.accountmediatype.itunes"));

  return v8;
}

- (id)ic_description
{
  void *v2;
  __CFString *v3;
  void *v4;
  char v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  _QWORD *v10;
  ldiv_t v11;
  uint64_t v12;
  char *v13;
  const UInt8 *v14;
  unsigned __int8 *v15;
  char *v16;
  char *v17;
  uint64_t m;
  unsigned int v19;
  char *v20;
  id v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  _BYTE *v26;
  unint64_t v27;
  unsigned __int8 *v28;
  char *v29;
  char *v30;
  uint64_t j;
  unsigned int v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t quot;
  lldiv_t v37;
  uint64_t v38;
  CFStringRef v39;
  unsigned __int8 *v40;
  char *v41;
  char *v42;
  uint64_t k;
  unsigned int v44;
  char *v45;
  char *v46;
  uint64_t v47;
  _BYTE *v48;
  unint64_t v49;
  unsigned __int8 *v50;
  char *v51;
  char *v52;
  uint64_t i;
  unsigned int v54;
  char *v55;
  const __CFString *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v65;
  void *v66;
  _BYTE v67[208];
  _BYTE v68[72];
  _OWORD v69[4];
  uint64_t v70;
  _QWORD v71[3];
  _QWORD v72[3];

  v72[0] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "username");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInternalBuild");

  if ((v5 & 1) == 0)
  {
    v6 = &stru_1E4391778;
    if (v3)
      v6 = v3;
    v7 = v6;
    memset(v67, 0, sizeof(v67));
    CC_SHA1_Init((CC_SHA1_CTX *)v67);
    v8 = objc_retainAutorelease(v7);
    CC_SHA1_Update((CC_SHA1_CTX *)v67, (const void *)-[__CFString UTF8String](v8, "UTF8String"), -[__CFString length](v8, "length"));

    memset(&v68[8], 0, 64);
    *(_QWORD *)v68 = 4001;
    CC_SHA1_Final(&v68[8], (CC_SHA1_CTX *)v67);
    v69[0] = *(_OWORD *)v68;
    v69[1] = *(_OWORD *)&v68[16];
    v69[2] = *(_OWORD *)&v68[32];
    v69[3] = *(_OWORD *)&v68[48];
    v70 = *(_QWORD *)&v68[64];
    if (*(uint64_t *)v68 > 3999)
    {
      if (*(uint64_t *)v68 > 4255)
      {
        if (*(_QWORD *)v68 == 4256)
        {
          v50 = (unsigned __int8 *)v69 + 8;
          v51 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
          v52 = v51;
          for (i = 0; i != 64; i += 2)
          {
            v54 = *v50++;
            v55 = &v51[i];
            *v55 = MSVFastHexStringFromBytes_hexCharacters_37049[(unint64_t)v54 >> 4];
            v55[1] = MSVFastHexStringFromBytes_hexCharacters_37049[v54 & 0xF];
          }
          v21 = objc_alloc(MEMORY[0x1E0CB3940]);
          v22 = v52;
          v23 = 64;
        }
        else
        {
          if (*(_QWORD *)v68 != 4512)
            goto LABEL_58;
          v28 = (unsigned __int8 *)v69 + 8;
          v29 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
          v30 = v29;
          for (j = 0; j != 128; j += 2)
          {
            v32 = *v28++;
            v33 = &v29[j];
            *v33 = MSVFastHexStringFromBytes_hexCharacters_37049[(unint64_t)v32 >> 4];
            v33[1] = MSVFastHexStringFromBytes_hexCharacters_37049[v32 & 0xF];
          }
          v21 = objc_alloc(MEMORY[0x1E0CB3940]);
          v22 = v30;
          v23 = 128;
        }
      }
      else if (*(_QWORD *)v68 == 4000)
      {
        v40 = (unsigned __int8 *)v69 + 8;
        v41 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
        v42 = v41;
        for (k = 0; k != 32; k += 2)
        {
          v44 = *v40++;
          v45 = &v41[k];
          *v45 = MSVFastHexStringFromBytes_hexCharacters_37049[(unint64_t)v44 >> 4];
          v45[1] = MSVFastHexStringFromBytes_hexCharacters_37049[v44 & 0xF];
        }
        v21 = objc_alloc(MEMORY[0x1E0CB3940]);
        v22 = v42;
        v23 = 32;
      }
      else
      {
        if (*(_QWORD *)v68 != 4001)
          goto LABEL_58;
        v15 = (unsigned __int8 *)v69 + 8;
        v16 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
        v17 = v16;
        for (m = 0; m != 40; m += 2)
        {
          v19 = *v15++;
          v20 = &v16[m];
          *v20 = MSVFastHexStringFromBytes_hexCharacters_37049[(unint64_t)v19 >> 4];
          v20[1] = MSVFastHexStringFromBytes_hexCharacters_37049[v19 & 0xF];
        }
        v21 = objc_alloc(MEMORY[0x1E0CB3940]);
        v22 = v17;
        v23 = 40;
      }
    }
    else
    {
      if (*(uint64_t *)v68 <= 2999)
      {
        if (*(_QWORD *)v68 == 1000)
        {
          v34 = *((_QWORD *)&v69[0] + 1);
          v35 = (char *)v72 + 1;
          quot = *((_QWORD *)&v69[0] + 1);
          do
          {
            v37 = lldiv(quot, 10);
            quot = v37.quot;
            if (v37.rem >= 0)
              LOBYTE(v38) = v37.rem;
            else
              v38 = -v37.rem;
            *(v35 - 2) = v38 + 48;
            v14 = (const UInt8 *)(v35 - 2);
            --v35;
          }
          while (v37.quot);
          if (v34 < 0)
          {
            *(v35 - 2) = 45;
            v14 = (const UInt8 *)(v35 - 2);
          }
          v13 = (char *)((char *)v72 - (char *)v14);
          goto LABEL_38;
        }
        if (*(_QWORD *)v68 == 2000)
        {
          v9 = DWORD2(v69[0]);
          v10 = v72;
          do
          {
            v11 = ldiv(v9, 10);
            v9 = v11.quot;
            if (v11.rem >= 0)
              LOBYTE(v12) = v11.rem;
            else
              v12 = -v11.rem;
            *((_BYTE *)v10 - 1) = v12 + 48;
            v10 = (_QWORD *)((char *)v10 - 1);
          }
          while (v11.quot);
          v13 = (char *)((char *)v72 - (char *)v10);
          v14 = (const UInt8 *)v10;
LABEL_38:
          v39 = CFStringCreateWithBytes(0, v14, (CFIndex)v13, 0x8000100u, 0);
LABEL_49:
          v56 = v39;
LABEL_50:

          v3 = (__CFString *)v56;
          goto LABEL_51;
        }
LABEL_58:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull _MSVHashGetDigest(MSVHash)");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "handleFailureInFunction:file:lineNumber:description:", v66, CFSTR("MSVHasher+Algorithms.h"), 356, CFSTR("Cannot obtain digest from unknown hasher algorithm"));

        v56 = &stru_1E4391778;
        goto LABEL_50;
      }
      if (*(_QWORD *)v68 == 3000)
      {
        LODWORD(v71[0]) = bswap32(DWORD2(v69[0]));
        v46 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
        v47 = 0;
        v48 = v46 + 1;
        do
        {
          v49 = *((unsigned __int8 *)v71 + v47);
          *(v48 - 1) = MSVFastHexStringFromBytes_hexCharacters_37049[v49 >> 4];
          *v48 = MSVFastHexStringFromBytes_hexCharacters_37049[v49 & 0xF];
          v48 += 2;
          ++v47;
        }
        while (v47 != 4);
        v21 = objc_alloc(MEMORY[0x1E0CB3940]);
        v22 = v46;
        v23 = 8;
      }
      else
      {
        if (*(_QWORD *)v68 != 3001)
          goto LABEL_58;
        v71[0] = bswap64(*((unint64_t *)&v69[0] + 1));
        v24 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
        v25 = 0;
        v26 = v24 + 1;
        do
        {
          v27 = *((unsigned __int8 *)v71 + v25);
          *(v26 - 1) = MSVFastHexStringFromBytes_hexCharacters_37049[v27 >> 4];
          *v26 = MSVFastHexStringFromBytes_hexCharacters_37049[v27 & 0xF];
          v26 += 2;
          ++v25;
        }
        while (v25 != 8);
        v21 = objc_alloc(MEMORY[0x1E0CB3940]);
        v22 = v24;
        v23 = 16;
      }
    }
    v39 = (CFStringRef)objc_msgSend(v21, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v22, v23, 4, 1);
    goto LABEL_49;
  }
LABEL_51:
  if (objc_msgSend(a1, "ic_isITunesAccount"))
  {
    v57 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "ic_DSID");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    ICCreateLoggableValueForDSID(v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "stringWithFormat:", CFSTR("<%@ (%@) [DSID=%@, isActive=%d]>"), v3, v2, v59, objc_msgSend(a1, "isActive"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "accountType");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "identifier");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "isEqualToString:", *MEMORY[0x1E0C8F030]);

    if (v63)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ (%@) [primary=%d]>"), v3, v2, objc_msgSend(a1, "aa_isAccountClass:", *MEMORY[0x1E0CFAAE8]));
    else
      objc_msgSend(a1, "description");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v60;
}

- (id)ic_DSID
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("dsid"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v1, "longLongValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)ic_privateListeningEnabledForHomeUsers
{
  void *v1;
  void *v2;
  _QWORD v4[4];
  id v5;

  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("musicPrivateListeningEnabledForHomeUsers"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v1, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __71__ACAccount_ICAccountAdditions__ic_privateListeningEnabledForHomeUsers__block_invoke;
    v4[3] = &unk_1E438F5A0;
    v5 = v2;
    objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v4);

  }
  return v2;
}

- (uint64_t)ic_isActiveLockerAccount
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("isActiveLockerAccount"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)ic_privateListeningEnabled
{
  return objc_msgSend(a1, "accountPropertyForKey:", CFSTR("musicPrivateListeningEnabled"));
}

- (uint64_t)ic_privacyAcknowledgementVersions
{
  return objc_msgSend(a1, "accountPropertyForKey:", CFSTR("privacyAcknowledgement"));
}

- (uint64_t)ic_mergeWithCloudLibraryPreference
{
  return objc_msgSend(a1, "accountPropertyForKey:", CFSTR("mergeToCloudLibraryPreference"));
}

- (uint64_t)ic_lastName
{
  return objc_msgSend(a1, "accountPropertyForKey:", CFSTR("lastName"));
}

- (uint64_t)ic_isSubscriptionStatusEnabled
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("eligibleServices"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)ic_isSandboxed
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("scope"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue") == 1;

  return v2;
}

- (uint64_t)ic_isManagedAppleID
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("isManagedAppleID"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)ic_homeUserIdentifiers
{
  return MEMORY[0x1E0C9AA60];
}

- (uint64_t)ic_firstName
{
  return objc_msgSend(a1, "accountPropertyForKey:", CFSTR("firstName"));
}

- (uint64_t)ic_cloudLibraryStateReason
{
  return objc_msgSend(a1, "accountPropertyForKey:", CFSTR("cloudLibraryStateReason"));
}

- (uint64_t)ic_altDSID
{
  return objc_msgSend(a1, "accountPropertyForKey:", CFSTR("altDSID"));
}

- (id)ic_ageVerificationExpirationDate
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "ams_accountFlagValueForAccountFlag:", *MEMORY[0x1E0CFD778]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(objc_msgSend(v1, "longLongValue") / 1000));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)ic_storefront
{
  void *v1;
  id v2;
  NSObject *v3;
  id v4;
  int v6;
  id v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("storefrontID"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
  {
    v2 = v1;
  }
  else
  {
    if (v1)
    {
      v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      {
        v6 = 138543618;
        v7 = (id)objc_opt_class();
        v8 = 2114;
        v9 = v1;
        v4 = v7;
        _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_FAULT, "unexpected storefront value type. propertyType=%{public}@ propertyValue=%{public}@", (uint8_t *)&v6, 0x16u);

      }
    }
    v2 = 0;
  }

  return v2;
}

- (uint64_t)ic_isManageable
{
  void *v2;
  int v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isAppleTV") & 1) == 0 && (objc_msgSend(v2, "isAudioAccessory") & 1) == 0)
  {
    v6 = objc_msgSend(a1, "isActive");
    goto LABEL_16;
  }
  v3 = objc_msgSend(v2, "isAppleTV");
  v4 = objc_msgSend(a1, "isActive");
  if (v3)
  {
    if ((v4 & 1) == 0)
    {
      if ((objc_msgSend(a1, "ic_isLocalAccount") & 1) == 0)
      {
        objc_msgSend(a1, "ic_DSID");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5 != 0;

        goto LABEL_16;
      }
LABEL_11:
      v6 = 0;
      goto LABEL_16;
    }
LABEL_8:
    v6 = 1;
    goto LABEL_16;
  }
  if ((v4 & 1) != 0)
    goto LABEL_8;
  if ((objc_msgSend(a1, "ic_isLocalAccount") & 1) != 0)
    goto LABEL_11;
  objc_msgSend(a1, "ic_homeUserIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(a1, "ic_DSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v8 != 0;

  }
  else
  {
    v6 = 0;
  }

LABEL_16:
  return v6;
}

- (uint64_t)ic_setDSID:()ICAccountAdditions
{
  return objc_msgSend(a1, "setAccountProperty:forKey:", a3, CFSTR("dsid"));
}

- (uint64_t)ic_setAltDSID:()ICAccountAdditions
{
  return objc_msgSend(a1, "setAccountProperty:forKey:", a3, CFSTR("altDSID"));
}

- (uint64_t)ic_setFirstName:()ICAccountAdditions
{
  return objc_msgSend(a1, "setAccountProperty:forKey:", a3, CFSTR("firstName"));
}

- (uint64_t)ic_setLastName:()ICAccountAdditions
{
  return objc_msgSend(a1, "setAccountProperty:forKey:", a3, CFSTR("lastName"));
}

- (uint64_t)ic_setStorefront:()ICAccountAdditions
{
  return objc_msgSend(a1, "setAccountProperty:forKey:", a3, CFSTR("storefrontID"));
}

- (id)ic_uniqueIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("dsid"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v1, "longLongValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)ic_setUniqueIdentifier:()ICAccountAdditions
{
  id v4;

  objc_msgSend(a3, "stringValue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccountProperty:forKey:", v4, CFSTR("dsid"));

}

- (void)ic_setSandboxed:()ICAccountAdditions
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccountProperty:forKey:", v4, CFSTR("scope"));

}

- (void)ic_setActiveLockerAccount:()ICAccountAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccountProperty:forKey:", v2, CFSTR("isActiveLockerAccount"));

}

- (uint64_t)ic_isCloudBackupEnabled
{
  return objc_msgSend(a1, "isEnabledForDataclass:", *MEMORY[0x1E0C8F360]);
}

- (void)ic_setManagedAppleID:()ICAccountAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccountProperty:forKey:", v2, CFSTR("isManagedAppleID"));

}

- (void)ic_setAgeVerificationExpirationDate:()ICAccountAdditions
{
  double v4;
  id v5;

  objc_msgSend(a3, "timeIntervalSince1970");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ams_setAccountFlagValue:forAccountFlag:", v5, *MEMORY[0x1E0CFD778]);

}

- (uint64_t)ic_setMergeWithCloudLibraryPreference:()ICAccountAdditions
{
  return objc_msgSend(a1, "setAccountProperty:forKey:", a3, CFSTR("mergeToCloudLibraryPreference"));
}

- (void)ic_setSubscriptionStatusEnabled:()ICAccountAdditions
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("eligibleServices"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v11, v10);

  v12 = (id)objc_msgSend(v9, "copy");
  objc_msgSend(a1, "setAccountProperty:forKey:", v12, CFSTR("eligibleServices"));

}

- (uint64_t)ic_setCloudLibraryStateReason:()ICAccountAdditions
{
  return objc_msgSend(a1, "setAccountProperty:forKey:", a3, CFSTR("cloudLibraryStateReason"));
}

- (id)ic_automaticDownloadKinds
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "ams_automaticDownloadKinds");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)ic_setAutomaticDownloadKinds:()ICAccountAdditions
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    objc_msgSend(a3, "allObjects");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  objc_msgSend(a1, "setAccountProperty:forKey:", v4, CFSTR("automaticDownloadKinds"));

}

- (uint64_t)ic_isAutomaticDownloadsEnabledForMediaKindMusic
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "ams_automaticDownloadKinds");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  +[ICUpdateAutomaticDownloadMediaKindsRequest automaticDownloadMediaKindsForMusic](ICUpdateAutomaticDownloadMediaKindsRequest, "automaticDownloadMediaKindsForMusic", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    LODWORD(v6) = 1;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v6 = objc_msgSend(v1, "containsObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i)) & v6;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (uint64_t)ic_setPrivateListeningEnabled:()ICAccountAdditions
{
  return objc_msgSend(a1, "setAccountProperty:forKey:", a3, CFSTR("musicPrivateListeningEnabled"));
}

- (void)ic_setPrivateListeningEnabledForHomeUsers:()ICAccountAdditions
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  id v13;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0C99E08];
    v5 = a3;
    objc_msgSend(v4, "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __75__ACAccount_ICAccountAdditions__ic_setPrivateListeningEnabledForHomeUsers___block_invoke;
    v12 = &unk_1E438F5C8;
    v7 = v6;
    v13 = v7;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v9);

  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(a1, "setAccountProperty:forKey:", v7, CFSTR("musicPrivateListeningEnabledForHomeUsers"), v7, v9, v10, v11, v12);

}

- (uint64_t)ic_activeMediaTypes
{
  return objc_msgSend(a1, "accountPropertyForKey:", CFSTR("activeMediaTypes"));
}

- (uint64_t)ic_isU18MinorAccount
{
  void *v0;
  uint64_t v1;

  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "cachedU18MinorAccountStatus");

  return v1;
}

@end
