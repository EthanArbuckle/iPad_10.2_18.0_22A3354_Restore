@implementation NSString(TelephonyUtilities)

- (uint64_t)destinationIdIsPhoneNumber
{
  uint64_t result;

  result = objc_msgSend(a1, "length");
  if (result)
  {
    if ((objc_msgSend(a1, "destinationIdIsEmailAddress") & 1) != 0
      || (objc_msgSend(a1, "destinationIdIsTemporary") & 1) != 0
      || (objc_msgSend(a1, "destinationIdIsPseudonym") & 1) != 0)
    {
      return 0;
    }
    else
    {
      return objc_msgSend(a1, "destinationIdIsHardware") ^ 1;
    }
  }
  return result;
}

- (uint64_t)destinationIdIsEmailAddress
{
  uint64_t result;

  result = objc_msgSend(a1, "length");
  if (result)
    return IMStringIsEmail();
  return result;
}

- (uint64_t)destinationIdIsTokenURI
{
  id v0;

  v0 = (id)IDSCopyTokenAndIDForTokenWithID();
  return 0;
}

- (uint64_t)LTRString
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\u202D%@\u202C"), a1);
}

- (uint64_t)RTLString
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\u202E%@\u202C"), a1);
}

- (BOOL)destinationIdIsCallControlCode
{
  BOOL v2;
  int v3;
  unsigned int v4;

  if (objc_msgSend(a1, "length") == 1)
  {
    v2 = objc_msgSend(a1, "characterAtIndex:", 0) - 48 >= 6;
  }
  else
  {
    if (objc_msgSend(a1, "length") != 2)
      return 0;
    v3 = objc_msgSend(a1, "characterAtIndex:", 0);
    v4 = objc_msgSend(a1, "characterAtIndex:", 1);
    v2 = (v3 - 49) >= 2 || v4 <= 0x2F || v4 >= 0x3A;
  }
  return !v2;
}

- (id)IDSFormattedDestinationID
{
  void *v2;
  void *v3;
  uint64_t *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByRemovingCharactersFromSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (MEMORY[0x19AEC8D18](v3))
  {
    if (IDSFormattedDestinationID__pred_IDSCopyIDForTemporaryIDIDS != -1)
      dispatch_once(&IDSFormattedDestinationID__pred_IDSCopyIDForTemporaryIDIDS, &__block_literal_global_39);
    v4 = &IDSFormattedDestinationID__IDSCopyIDForTemporaryID;
  }
  else if (MEMORY[0x19AEC8D0C](v3))
  {
    if (IDSFormattedDestinationID__pred_IDSCopyIDForPseudonymIDIDS != -1)
      dispatch_once(&IDSFormattedDestinationID__pred_IDSCopyIDForPseudonymIDIDS, &__block_literal_global_12_3);
    v4 = &IDSFormattedDestinationID__IDSCopyIDForPseudonymID;
  }
  else if (MEMORY[0x19AEC8D00](v3))
  {
    if (IDSFormattedDestinationID__pred_IDSCopyIDForPhoneNumberIDS != -1)
      dispatch_once(&IDSFormattedDestinationID__pred_IDSCopyIDForPhoneNumberIDS, &__block_literal_global_14_2);
    v4 = &IDSFormattedDestinationID__IDSCopyIDForPhoneNumber;
  }
  else
  {
    if (IDSFormattedDestinationID__pred_IDSCopyIDForEmailAddressIDS != -1)
      dispatch_once(&IDSFormattedDestinationID__pred_IDSCopyIDForEmailAddressIDS, &__block_literal_global_16_1);
    v4 = &IDSFormattedDestinationID__IDSCopyIDForEmailAddress;
  }
  v5 = (void *)((uint64_t (*)(void *))*v4)(v3);

  return v5;
}

- (id)normalizedTokenURI
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)IDSCopyAddressDestinationForDestination();
  v1 = (void *)IDSCopyRawAddressForDestination();

  objc_msgSend(v1, "_im_normalizedURIString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)destinationIDWithoutControlOrPhoneNumberSeparatorCharacters
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByRemovingCharactersFromSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1, "_appearsToBePhoneNumber"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "phoneNumberSeparatorCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByRemovingCharactersFromSet:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

- (id)normalizedDestinationID
{
  void *v1;
  void *v2;

  +[TUHandle normalizedHandleWithDestinationID:](TUHandle, "normalizedHandleWithDestinationID:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)formattedDisplayID
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const void *v8;
  void *String;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "_appearsToBePhoneNumber"))
  {
    if (!formattedDisplayID_sCountryCode)
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C997B0]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lowercaseString");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)formattedDisplayID_sCountryCode;
      formattedDisplayID_sCountryCode = v5;

    }
    v7 = CFPhoneNumberCreate();
    if (v7)
    {
      v8 = (const void *)v7;
      String = (void *)CFPhoneNumberCreateString();
      if (!String)
        String = (void *)CFPhoneNumberCreateString();
      CFRelease(v8);
      if (objc_msgSend(String, "length"))
      {
        objc_msgSend(String, "LTRString");
        v10 = objc_claimAutoreleasedReturnValue();

        v2 = (void *)v10;
      }

    }
  }
  return v2;
}

- (id)tu_stringByStrippingBase64Padding
{
  if ((objc_msgSend(a1, "length") & 3) != 0)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", a1);
  else
    objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("="), &stru_1E38A53C8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tu_stringByAddingBase64Padding
{
  if ((objc_msgSend(a1, "length") & 3) != 0)
    objc_msgSend(a1, "stringByPaddingToLength:withString:startingAtIndex:", objc_msgSend(a1, "length") - (objc_msgSend(a1, "length") & 3) + 4, CFSTR("="), 0);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tu_unsignedLongLongNumber
{
  void *v2;

  v2 = (void *)objc_msgSend(a1, "length");
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", strtoull((const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String"), 0, 0));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (TUConversationHandoffEligibility)tu_handoffEligibility
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  TUConversationHandoffEligibility *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  TUConversationParticipantAssociation *v17;
  uint64_t v18;
  void *v19;

  if (objc_msgSend(a1, "length"))
  {
    objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("~"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v2, "count") < 2)
    {
      v7 = 0;
      v5 = 0;
      v11 = 0;
    }
    else
    {
      v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v3, "initWithUUIDString:", v4);

      objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "tu_unsignedLongLongNumber");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v2, "objectAtIndexedSubscript:", 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v2, "objectAtIndexedSubscript:", 2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("1"));

      }
      else
      {
        v10 = 0;
      }

      objc_msgSend(v2, "objectAtIndexedSubscript:", 3);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        objc_msgSend(v2, "objectAtIndexedSubscript:", 3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("0"));

        v16 = v15 ^ 1u;
      }
      else
      {
        v16 = 1;
      }
      v11 = 0;
      if (v5 && v7)
      {
        v11 = objc_alloc_init(TUConversationHandoffEligibility);
        -[TUConversationHandoffEligibility setEligible:](v11, "setEligible:", 1);
        -[TUConversationHandoffEligibility setConversationGroupUUID:](v11, "setConversationGroupUUID:", v5);
        -[TUConversationHandoffEligibility setUplinkMuted:](v11, "setUplinkMuted:", v10);
        -[TUConversationHandoffEligibility setSendingVideo:](v11, "setSendingVideo:", v16);
        v17 = objc_alloc_init(TUConversationParticipantAssociation);
        -[TUConversationHandoffEligibility setAssociation:](v11, "setAssociation:", v17);

        v18 = objc_msgSend(v7, "unsignedLongLongValue");
        -[TUConversationHandoffEligibility association](v11, "association");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setIdentifier:", v18);

      }
    }

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

+ (id)tu_conversationHandoffDynamicIdentifierWithGroupUUID:()TelephonyUtilities participantIdentifier:uplinkMuted:sendingVideo:
{
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), a4, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = CFSTR("0");
  if (a5)
    v13 = CFSTR("1");
  else
    v13 = CFSTR("0");
  v17[1] = v10;
  v17[2] = v13;
  if (a6)
    v12 = CFSTR("1");
  v17[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "componentsJoinedByString:", CFSTR("~"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)tu_conversationHandoffDynamicIdentifierForEligibility:()TelephonyUtilities
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "conversationGroupUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "association");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "identifier");
  v8 = objc_msgSend(v4, "isUplinkMuted");
  v9 = objc_msgSend(v4, "isSendingVideo");

  objc_msgSend(a1, "tu_conversationHandoffDynamicIdentifierWithGroupUUID:participantIdentifier:uplinkMuted:sendingVideo:", v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
