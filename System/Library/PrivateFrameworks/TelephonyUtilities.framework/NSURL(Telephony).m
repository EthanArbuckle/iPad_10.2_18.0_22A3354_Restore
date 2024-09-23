@implementation NSURL(Telephony)

+ (uint64_t)telephonyURLWithDestinationID:()Telephony
{
  return objc_msgSend(a1, "telephonyURLWithDestinationID:promptUser:", a3, 0);
}

+ (id)telephonyURLWithDestinationID:()Telephony promptUser:
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;

  TUURLHostForTelephoneNumber(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "URLHostAllowedCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAddingPercentEncodingWithAllowedCharacters:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  v8 = (void *)MEMORY[0x1E0C99E98];
  v9 = CFSTR("tel");
  if (a4)
    v9 = CFSTR("telprompt");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://%@?%@=%@"), v9, v5, CFSTR("handleType"), CFSTR("phoneNumber"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)telephonyURLWithDestinationID:()Telephony addressBookUID:
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend(a1, "telephonyURLWithDestinationID:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)a4 != -1)
    objc_msgSend(v7, "appendFormat:", CFSTR("&%@=%d"), CFSTR("abuid"), a4);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)telephonyURLWithDestinationID:()Telephony addressBookUID:forceAssist:suppressAssist:wasAssisted:
{
  id v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v12 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((_DWORD)a4 != -1)
    objc_msgSend(v13, "appendFormat:", CFSTR("&%@=%d"), CFSTR("abuid"), a4);
  if ((a5 & 1) != 0 || a6)
  {
    v15 = CFSTR("suppressAssist");
    if (a5)
      v15 = CFSTR("forceAssist");
    objc_msgSend(v14, "appendFormat:", CFSTR("&%@=1"), v15);
  }
  if (a7)
    objc_msgSend(v14, "appendFormat:", CFSTR("&%@=1"), CFSTR("wasAssisted"));
  v16 = (void *)MEMORY[0x1E0C99E98];
  v17 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "telephonyURLWithDestinationID:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@%@"), v18, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URLWithString:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)telephonyURLForVoicemail
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://?%@=1"), CFSTR("tel"), CFSTR("isVoicemail"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLWithString:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)telephonyURLForTelEmergencyCall
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://"), CFSTR("telemergencycall"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLWithString:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_destinationIDConvertingNumbersToLatin:()Telephony
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(a1, "resourceSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByRemovingPercentEncoding");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "rangeOfString:options:", CFSTR("//"), 8);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v5, "substringFromIndex:", v6 + v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  v9 = objc_msgSend(v5, "rangeOfString:", CFSTR("?"));
  if (v10)
  {
    objc_msgSend(v5, "substringToIndex:", v9);
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v11;
  }
  if ((unint64_t)objc_msgSend(v5, "length") >= 2
    && objc_msgSend(v5, "characterAtIndex:", objc_msgSend(v5, "length") - 1) == 47)
  {
    objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "length") - 1);
    v12 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v12;
  }
  if (a3 && objc_msgSend(v5, "length"))
  {
    v13 = (void *)IMCopyStringWithLatinNumbers();
    v14 = v13;
    if (v13)
    {
      v15 = v13;

      v5 = v15;
    }

  }
  return v5;
}

- (uint64_t)phoneNumber
{
  return objc_msgSend(a1, "_destinationIDConvertingNumbersToLatin:", 1);
}

- (uint64_t)addressBookUID
{
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;
  uint64_t v6;

  if (objc_msgSend(a1, "hasTelephonyScheme"))
  {
    objc_msgSend(a1, "_mobilePhoneQueryParameters");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("abuid");
  }
  else
  {
    if ((objc_msgSend(a1, "isFaceTimeURL") & 1) == 0 && !objc_msgSend(a1, "isFaceTimeAudioURL"))
      return 0xFFFFFFFFLL;
    objc_msgSend(a1, "queryParameters");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("uid");
  }
  objc_msgSend(v2, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v5, "intValue");

    return v6;
  }
  return 0xFFFFFFFFLL;
}

- (uint64_t)callService
{
  if ((objc_msgSend(a1, "hasTelephonyScheme") & 1) != 0 || (objc_msgSend(a1, "isEmergencyCallURL") & 1) != 0)
    return 1;
  if ((objc_msgSend(a1, "isFaceTimeAudioURL") & 1) != 0)
    return 2;
  if (objc_msgSend(a1, "isFaceTimeURL"))
    return 3;
  return 0;
}

- (id)originatingUIIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_mobilePhoneQueryParameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("originatingUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)forceAssist
{
  return objc_msgSend(a1, "_dialAssistBooleanQueryParameterValueForKey:", CFSTR("forceAssist"));
}

- (uint64_t)suppressAssist
{
  return objc_msgSend(a1, "_dialAssistBooleanQueryParameterValueForKey:", CFSTR("suppressAssist"));
}

- (uint64_t)wasAlreadyAssisted
{
  return objc_msgSend(a1, "_dialAssistBooleanQueryParameterValueForKey:", CFSTR("wasAssisted"));
}

- (uint64_t)_dialAssistBooleanQueryParameterValueForKey:()Telephony
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  if (objc_msgSend(a1, "hasTelephonyScheme"))
  {
    objc_msgSend(a1, "_mobilePhoneQueryParameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_msgSend(a1, "isFaceTimeURL") & 1) == 0 && !objc_msgSend(a1, "isFaceTimeAudioURL"))
      goto LABEL_8;
    objc_msgSend(a1, "queryParameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  objc_msgSend(v5, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  v8 = objc_msgSend(v7, "BOOLValue");

LABEL_9:
  return v8;
}

- (uint64_t)isTelephonyURL
{
  if ((objc_msgSend(a1, "_hasScheme:", CFSTR("tel")) & 1) != 0 || (objc_msgSend(a1, "isTelephonyPromptURL") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "_hasScheme:", CFSTR("telSOS"));
}

- (uint64_t)isTelephonyPromptURL
{
  return objc_msgSend(a1, "_hasScheme:", CFSTR("telprompt"));
}

- (uint64_t)hasTelephonyScheme
{
  if ((objc_msgSend(a1, "isTelephonyURL") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "_hasScheme:", CFSTR("callto"));
}

- (BOOL)_hasScheme:()Telephony
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v4 = a3;
  objc_msgSend(a1, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(a1, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "caseInsensitiveCompare:", v4) == 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)formattedPhoneNumber
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if ((objc_msgSend(a1, "hasTelephonyScheme") & 1) == 0 && !objc_msgSend(a1, "isFaceTimeAudioURL"))
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend(a1, "_destinationIDConvertingNumbersToLatin:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!MGGetBoolAnswer())
  {
    v3 = 0;
LABEL_9:
    v5 = v3;
    TUHomeCountryCode();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v3, "length")
      || !PNIsValidPhoneNumberForCountry()
      || (v6 = (id)PNCreateFormattedStringWithCountry()) == 0)
    {
      v6 = v2;
    }
    v4 = v6;
    goto LABEL_14;
  }
  TUNetworkCountryCode();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
    goto LABEL_9;
  if (!PNIsValidPhoneNumberForCountry())
    goto LABEL_9;
  v4 = (void *)PNCreateFormattedStringWithCountry();
  if (!v4)
    goto LABEL_9;
LABEL_14:

  return v4;
}

- (uint64_t)isWebSafeTelephoneURL
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char v8;
  int v9;
  char v10;

  if (!objc_msgSend(a1, "hasTelephonyScheme"))
    return 0;
  if ((objc_msgSend(a1, "isVoicemailURL") & 1) != 0)
    return 1;
  objc_msgSend(a1, "phoneNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  if (!v4)
  {
LABEL_23:
    v2 = objc_msgSend(v3, "destinationIdIsCallControlCode");
    goto LABEL_25;
  }
  v5 = v4;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  do
  {
    v9 = objc_msgSend(v3, "characterAtIndex:", v7);
    v10 = v9 - 38;
    if ((v9 - 38) > 0x31)
      goto LABEL_12;
    if (((1 << v10) & 0x2040000200040) != 0)
      goto LABEL_9;
    if (((1 << v10) & 0x81) == 0)
    {
LABEL_12:
      if (v9 == 112 || v9 == 119)
      {
LABEL_9:
        v8 = 1;
        goto LABEL_21;
      }
      if ((v8 & 1) == 0 && (v9 == 35 || v9 == 42))
      {
        v2 = 0;
        goto LABEL_25;
      }
      if ((v9 - 48) < 0xA || (v9 & 0xFFFFFFDF) - 65 < 0x1A)
        ++v6;
    }
LABEL_21:
    ++v7;
  }
  while (v5 != v7);
  if (v6 <= 2)
    goto LABEL_23;
  v2 = 1;
LABEL_25:

  return v2;
}

- (id)webSafeTelephoneURL
{
  void *v2;
  uint64_t v3;
  unsigned __int16 *v4;
  _WORD *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int16 *v8;
  uint64_t v9;
  unsigned int v10;
  unsigned __int16 v11;
  __int16 v12;
  __int16 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;

  if (objc_msgSend(a1, "hasTelephonyScheme"))
  {
    objc_msgSend(a1, "phoneNumber");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "length");
    v4 = (unsigned __int16 *)malloc_type_malloc((2 * v3) | 1, 0x3F951BC9uLL);
    v5 = malloc_type_malloc((2 * v3) | 1, 0x58A7AA4EuLL);
    v19 = v2;
    objc_msgSend(v2, "getCharacters:", v4);
    v6 = 0;
    if (v3)
    {
      v7 = MEMORY[0x1E0C80978];
      v8 = v4;
      do
      {
        v10 = *v8++;
        v9 = v10;
        if (v10 > 0x7F)
        {
          if (__maskrune(v9, 0x100uLL))
          {
LABEL_6:
            v11 = __toupper(v9);
            if (v11 < 0x57u)
              v12 = 56;
            else
              v12 = 57;
            if (v11 < 0x54u)
              v12 = 55;
            if (v11 <= 0x4Fu)
              v13 = ((((86 * (char)(v11 - 65)) & 0x8000) != 0)
                                    + ((unsigned __int16)(86 * (char)(v11 - 65)) >> 8)
                                    + 50);
            else
              v13 = v12;
            v5[v6] = v13;
            goto LABEL_18;
          }
        }
        else if ((*(_DWORD *)(v7 + 4 * v9 + 60) & 0x100) != 0)
        {
          goto LABEL_6;
        }
        if ((v9 - 48) > 9)
        {
          if ((_DWORD)v9 == 43 && !v6)
          {
            *v5 = 43;
            v6 = 1;
          }
          goto LABEL_19;
        }
        v5[v6] = v9;
LABEL_18:
        ++v6;
LABEL_19:
        --v3;
      }
      while (v3);
    }
    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v5, v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@:%@"), CFSTR("tel"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    free(v4);
    free(v5);

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (uint64_t)isBasebandLogURL
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "phoneNumber");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "rangeOfString:", CFSTR("?"));
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v1, "substringToIndex:", v2);
    v3 = objc_claimAutoreleasedReturnValue();

    v1 = (void *)v3;
  }
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "*5005*78283#");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v1, "isEqual:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (uint64_t)isEmergencyURL
{
  return 0;
}

- (uint64_t)isEmergencyCallURL
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("telemergencycall"));

  return v2;
}

- (uint64_t)isVoicemailURL
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99E98], "telephonyURLForVoicemail");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", a1);

  return v3;
}

- (id)telephonyParameterDictionary
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_mobilePhoneQueryParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = v3;
LABEL_4:
    objc_msgSend(v2, "addEntriesFromDictionary:", v3);
    goto LABEL_5;
  }
  objc_msgSend(a1, "_mobilePhonePathParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = v4;
  if (objc_msgSend(v4, "count"))
    goto LABEL_4;
LABEL_5:

  return v2;
}

- (id)_mobilePhonePathParameters
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "absoluteString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "componentsSeparatedByString:", CFSTR("/"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (unint64_t)objc_msgSend(v2, "count") >= 2)
  {
    objc_msgSend(v3, "objectAtIndex:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      v15 = v4;
      v16 = v1;
      objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("&"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v18;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v18 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v10), "componentsSeparatedByString:", CFSTR("="));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v11, "count") == 2)
            {
              objc_msgSend(v11, "objectAtIndex:", 1);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "objectAtIndex:", 0);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKey:", v12, v13);

            }
            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v8);
      }

      v4 = v15;
      v1 = v16;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_mobilePhoneQueryParameters
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id object;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_getAssociatedObject(a1, "_TelephonyUtilities_telURLQueryParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    return v2;
  objc_msgSend(a1, "query");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && !objc_msgSend(v3, "isEqual:", &stru_1E38A53C8))
  {
    object = a1;
    goto LABEL_8;
  }
  objc_msgSend(a1, "resourceSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasPrefix:", CFSTR("//"));

  if ((v6 & 1) != 0)
  {
LABEL_19:

    v2 = 0;
    return v2;
  }
  objc_msgSend(a1, "resourceSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("?"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count") != 2)
  {

    goto LABEL_19;
  }
  object = a1;
  objc_msgSend(v8, "objectAtIndex:", 1);
  v9 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)v9;
LABEL_8:
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v23 = v4;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("&"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR("="));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "count") == 2)
        {
          objc_msgSend(v15, "objectAtIndex:", 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringByRemovingPercentEncoding");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectAtIndex:", 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringByRemovingPercentEncoding");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setObject:forKey:", v17, v19);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v12);
  }
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v24);
  objc_setAssociatedObject(object, "_TelephonyUtilities_telURLQueryParameters", v20, (void *)0x301);

  return v20;
}

- (uint64_t)isPhoneAppVoicemailURL
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("vmshow"));

  return v2;
}

- (void)voicemailRecordID
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (objc_msgSend(a1, "isPhoneAppVoicemailURL"))
  {
    v2 = objc_alloc(MEMORY[0x1E0CB3998]);
    objc_msgSend(a1, "absoluteString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v2, "initWithString:", v3);

    objc_msgSend(v4, "queryItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("recordID")))
    {
      objc_msgSend(v6, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
LABEL_8:

        return v8;
      }
      objc_msgSend(v6, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "integerValue");
    }
    else
    {
      v8 = 0;
    }

    goto LABEL_8;
  }
  return 0;
}

- (id)recentsUniqueID
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = objc_alloc(MEMORY[0x1E0CB3998]);
  objc_msgSend(a1, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithString:", v3);

  objc_msgSend(v4, "queryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("uniqueId")) & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(v6, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v6, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v9;
}

- (id)voicemailMessageUUID
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (objc_msgSend(a1, "isPhoneAppVoicemailURL"))
  {
    v2 = objc_alloc(MEMORY[0x1E0CB3998]);
    objc_msgSend(a1, "absoluteString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v2, "initWithString:", v3);

    objc_msgSend(v4, "queryItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("uuid")))
    {
      objc_msgSend(v6, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
LABEL_8:

        return v8;
      }
      v9 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v6, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v9, "initWithUUIDString:", v7);
    }
    else
    {
      v8 = 0;
    }

    goto LABEL_8;
  }
  v8 = 0;
  return v8;
}

+ (id)phoneAppVoicemailURLForRecordID:()Telephony
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v4, "setScheme:", CFSTR("vmshow"));
  v5 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryItemWithName:value:", CFSTR("recordID"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQueryItems:", v9);

  objc_msgSend(v4, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)phoneAppVoicemailURLForMessageUUID:()Telephony
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CB3998];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setScheme:", CFSTR("vmshow"));
  v6 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend(v4, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "queryItemWithName:value:", CFSTR("uuid"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setQueryItems:", v9);

  objc_msgSend(v5, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
