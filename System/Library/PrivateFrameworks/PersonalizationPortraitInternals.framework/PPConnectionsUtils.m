@implementation PPConnectionsUtils

+ (id)supportedLocationSemanticTypes
{
  if (supportedLocationSemanticTypes_onceToken != -1)
    dispatch_once(&supportedLocationSemanticTypes_onceToken, &__block_literal_global_2667);
  return (id)supportedLocationSemanticTypes_supportedLocationSemanticTypes;
}

+ (BOOL)isClientAuthorizedForSemanticTriggers:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D70E68]))
    v5 = objc_msgSend(v3, "semanticTag") == 1;
  else
    v5 = 1;

  return v5;
}

+ (BOOL)isValidLinguisticQuery:(id)a3
{
  id v3;
  unsigned int v4;

  v3 = a3;
  if (objc_msgSend(v3, "type") == 3
    && (objc_msgSend(v3, "subtype") == 6 || objc_msgSend(v3, "subtype") == 7))
  {
    if ((objc_msgSend(v3, "fields") & 1) != 0)
      LOBYTE(v4) = 1;
    else
      v4 = (objc_msgSend(v3, "fields") >> 2) & 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

+ (BOOL)shouldAggregateLabel:(id)a3 withValue:(id)a4 query:(id)a5
{
  id v7;
  id v8;
  id v9;
  int v10;
  char v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend((id)objc_opt_class(), "isValidLinguisticQuery:", v9)
    && objc_msgSend(v9, "subtype") != 7)
  {
    v12 = objc_msgSend(v9, "fields");
    LOBYTE(v10) = 0;
    if (v7 && (v12 & 1) == 0)
      v10 = objc_msgSend(v7, "isEqualToString:", v8) ^ 1;
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

+ (id)triggerTypeFromQuery:(id)a3
{
  id v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  int v7;

  v3 = a3;
  if (objc_msgSend((id)objc_opt_class(), "isValidLinguisticQuery:", v3))
  {
    if (objc_msgSend(v3, "subtype") == 6)
    {
      if ((objc_msgSend(v3, "fields") & 1) != 0)
      {
        v4 = CFSTR("phone");
      }
      else if ((objc_msgSend(v3, "fields") & 4) != 0)
      {
        v4 = CFSTR("location");
      }
      else
      {
        v4 = CFSTR("unknown");
      }
    }
    else
    {
      v4 = CFSTR("unknown");
      if (objc_msgSend(v3, "subtype") == 7 && (objc_msgSend(v3, "fields") & 4) != 0)
        v4 = CFSTR("address");
    }
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "supportedLocationSemanticTypes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v3, "semanticTag"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

    if (v7)
      v4 = CFSTR("semantic");
    else
      v4 = CFSTR("unknown");
  }

  return (id)v4;
}

+ (unsigned)locationFieldFromSemanticTag:(unsigned __int8)a3
{
  if ((a3 - 1) > 0x10)
    return 0;
  else
    return byte_1C3AE5120[(a3 - 1)];
}

+ (id)calendarUserActivityIdentifier
{
  return CFSTR("com.apple.calendar.continuity.event_selection");
}

+ (id)calendarUserActivityExternalIDKey
{
  return CFSTR("com.apple.calendarUIKit.userActivity.externalID");
}

void __52__PPConnectionsUtils_supportedLocationSemanticTypes__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E7E59180, &unk_1E7E59198, &unk_1E7E591B0, &unk_1E7E591C8, &unk_1E7E591E0, &unk_1E7E591F8, &unk_1E7E59210, &unk_1E7E59228, 0);
  objc_autoreleasePoolPop(v0);
  v2 = (void *)supportedLocationSemanticTypes_supportedLocationSemanticTypes;
  supportedLocationSemanticTypes_supportedLocationSemanticTypes = v1;

}

@end
