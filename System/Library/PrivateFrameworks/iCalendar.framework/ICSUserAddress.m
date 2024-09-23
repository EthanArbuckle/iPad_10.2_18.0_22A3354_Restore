@implementation ICSUserAddress

- (void)fixAddress
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  char v35;

  -[ICSProperty value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    +[ICSUserAddress URLForNoMail](ICSUserAddress, "URLForNoMail");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSProperty setValue:type:](self, "setValue:type:", v5, 5021);

  }
  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("RSVP"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("RSVP"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v8 = objc_opt_isKindOfClass();

    if ((v8 & 1) == 0)
      -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("RSVP"));
  }
  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("SCHEDULE-FORCE-SEND"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("SCHEDULE-FORCE-SEND"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v11 = objc_opt_isKindOfClass();

    if ((v11 & 1) == 0)
      -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("SCHEDULE-FORCE-SEND"));
  }
  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("CN"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[ICSUserAddress cn](self, "cn");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v14 = objc_opt_isKindOfClass();

    if ((v14 & 1) == 0)
      -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("CN"));
  }
  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("CUTYPE"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("CUTYPE"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v17 = objc_opt_isKindOfClass();

    if ((v17 & 1) == 0)
      -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("CUTYPE"));
  }
  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("PARTSTAT"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("PARTSTAT"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v20 = objc_opt_isKindOfClass();

    if ((v20 & 1) == 0)
      -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("PARTSTAT"));
  }
  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("X-CALENDARSERVER-DTSTAMP"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("X-CALENDARSERVER-DTSTAMP"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v23 = objc_opt_isKindOfClass();

    if ((v23 & 1) == 0)
      -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("X-CALENDARSERVER-DTSTAMP"));
  }
  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("SCHEDULE-STATUS"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("SCHEDULE-STATUS"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v26 = objc_opt_isKindOfClass();

    if ((v26 & 1) == 0)
      -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("SCHEDULE-STATUS"));
  }
  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("SCHEDULE-AGENT"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("SCHEDULE-AGENT"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v29 = objc_opt_isKindOfClass();

    if ((v29 & 1) == 0)
      -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("SCHEDULE-AGENT"));
  }
  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("ROLE"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("ROLE"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v32 = objc_opt_isKindOfClass();

    if ((v32 & 1) == 0)
      -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("ROLE"));
  }
  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("RELTYPE"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("RELTYPE"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v35 = objc_opt_isKindOfClass();

    if ((v35 & 1) == 0)
      -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("RELTYPE"));
  }
}

+ (int)calendarUserFromICSString:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INDIVIDUAL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GROUP")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROOM")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (int)participationStatusFromICSString:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEEDS-ACTION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACCEPTED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DECLINED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TENTATIVE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DELEGATED")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COMPLETED")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IN-PROCESS")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("X-UNINVITED")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("X-UNDELIVERABLE")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (int)scheduleStatusFromICSString:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("1.0")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("1.1")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("1.2")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("2.0")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("2.3")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("3.7")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("3.8")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("5.1")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("5.2")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "hasPrefix:", CFSTR("5.3")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (int)scheduleAgentFromICSString:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NONE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (int)scheduleForceSendFromICSString:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("REPLY")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (int)roleFromICSString:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHAIR")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OPT-PARTICIPANT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NON-PARTICIPANT")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQ-PARTICIPANT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NON-PARTICIPANT-CHAIR")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)ICSStringFromCalendarUser:(int)a3
{
  if ((a3 - 1) > 4)
    return 0;
  else
    return off_1E953AEB0[a3 - 1];
}

+ (id)ICSStringFromParticipationStatus:(int)a3
{
  if ((a3 - 1) > 8)
    return 0;
  else
    return off_1E953AED8[a3 - 1];
}

+ (id)ICSStringFromScheduleAgent:(int)a3
{
  const __CFString *v3;

  v3 = CFSTR("NONE");
  if (a3 != 2)
    v3 = 0;
  if (a3 == 1)
    return CFSTR("CLIENT");
  else
    return (id)v3;
}

+ (id)ICSStringFromScheduleStatus:(int)a3
{
  if ((a3 - 1) > 9)
    return 0;
  else
    return off_1E953AF20[a3 - 1];
}

+ (id)ICSStringFromScheduleForceSend:(int)a3
{
  const __CFString *v3;

  v3 = CFSTR("REPLY");
  if (a3 != 2)
    v3 = 0;
  if (a3 == 1)
    return CFSTR("REQUEST");
  else
    return (id)v3;
}

+ (id)ICSStringFromRole:(int)a3
{
  if ((a3 - 1) > 4)
    return 0;
  else
    return off_1E953AF70[a3 - 1];
}

- (ICSUserAddress)initWithURL:(id)a3
{
  id v4;
  ICSUserAddress *v5;
  objc_super v7;

  v4 = a3;
  if (!v4)
  {
    +[ICSUserAddress URLForNoMail](ICSUserAddress, "URLForNoMail");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7.receiver = self;
  v7.super_class = (Class)ICSUserAddress;
  v5 = -[ICSProperty initWithValue:type:](&v7, sel_initWithValue_type_, v4, 5021);

  return v5;
}

- (id)sanitizeAddressString:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (sanitizeAddressString__onceToken != -1)
    dispatch_once(&sanitizeAddressString__onceToken, &__block_literal_global_2);
  v5 = v4;
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = (id)sanitizeAddressString__invalidIndexPrefixes;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  v9 = v5;
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v6, "hasPrefix:", v13, (_QWORD)v16))
        {
          objc_msgSend(v5, "substringFromIndex:", (unint64_t)objc_msgSend(v13, "length") >> 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          -[ICSUserAddress sanitizeAddressString:](self, "sanitizeAddressString:", v14);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_13;
        }
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
    v9 = v5;
  }
LABEL_13:

  return v9;
}

void __40__ICSUserAddress_sanitizeAddressString___block_invoke()
{
  void *v0;

  v0 = (void *)sanitizeAddressString__invalidIndexPrefixes;
  sanitizeAddressString__invalidIndexPrefixes = (uint64_t)&unk_1E9549488;

}

- (ICSUserAddress)initWithEmailAddress:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  ICSUserAddress *v8;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    if ((objc_msgSend(v4, "hasPrefix:", CFSTR("/")) & 1) != 0 || (objc_msgSend(v4, "rangeOfString:", CFSTR(":")), v5))
    {
      -[ICSUserAddress sanitizeAddressString:](self, "sanitizeAddressString:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:encodingInvalidCharacters:", v6, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "rangeOfString:", CFSTR("@"));
      if (!v10)
      {
        +[ICSUserAddress URLForNoMail](ICSUserAddress, "URLForNoMail");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      }
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v11);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x1E0CB3780];
      objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bitmapRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "characterSetWithBitmapRepresentation:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mailto:%@"), v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "URLWithString:encodingInvalidCharacters:", v18, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = 0;
  }
LABEL_7:
  v8 = -[ICSUserAddress initWithURL:](self, "initWithURL:", v7);

  return v8;
}

- (ICSUserAddress)initWithPhoneNumber:(id)a3
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
  uint64_t v15;
  ICSUserAddress *v16;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    if (objc_msgSend(v4, "rangeOfString:options:", CFSTR("tel:"), 9) == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v6, "hasPrefix:", CFSTR("+")))
      {
        v7 = (void *)MEMORY[0x1E0CB3780];
        objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "bitmapRepresentation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "characterSetWithBitmapRepresentation:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(CFSTR("tel:"), "stringByAppendingString:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "URLWithString:encodingInvalidCharacters:", v13, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
        goto LABEL_10;
      }
      +[ICSUserAddress URLForNoMail](ICSUserAddress, "URLForNoMail");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[ICSUserAddress sanitizeAddressString:](self, "sanitizeAddressString:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:encodingInvalidCharacters:", v6, 0);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (void *)v15;
    goto LABEL_9;
  }
  v14 = 0;
LABEL_10:
  v16 = -[ICSUserAddress initWithURL:](self, "initWithURL:", v14);

  return v16;
}

- (BOOL)hasEmailAddress
{
  BOOL v3;
  void *v4;

  if (-[ICSUserAddress isEmailAddress](self, "isEmailAddress"))
    return 1;
  -[ICSUserAddress email](self, "email");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 != 0;

  return v3;
}

- (BOOL)isEmailAddress
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[ICSProperty value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[ICSProperty value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("mailto")) == 0;

  return v7;
}

- (BOOL)isHTTPAddress
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[ICSProperty value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[ICSProperty value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("http")) == 0;

  return v7;
}

- (BOOL)isHTTPSAddress
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[ICSProperty value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[ICSProperty value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("https")) == 0;

  return v7;
}

- (BOOL)hasPhoneNumber
{
  BOOL v3;
  void *v4;

  if (-[ICSUserAddress isPhoneNumber](self, "isPhoneNumber"))
    return 1;
  -[ICSUserAddress x_apple_telephone](self, "x_apple_telephone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 != 0;

  return v3;
}

- (BOOL)isPhoneNumber
{
  void *v2;
  void *v3;
  BOOL v4;

  -[ICSProperty value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("tel")) == 0;
  else
    v4 = 0;

  return v4;
}

- (id)emailAddress
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[ICSUserAddress isEmailAddress](self, "isEmailAddress"))
  {
    -[ICSProperty value](self, "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resourceSpecifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ICSUserAddress email](self, "email");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[ICSUserAddress email](self, "email");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
  }
  objc_msgSend(v4, "stringByRemovingPercentEscapes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)phoneNumber
{
  void *v3;
  void *v4;
  void *v5;

  if (-[ICSUserAddress isPhoneNumber](self, "isPhoneNumber"))
  {
    -[ICSProperty value](self, "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resourceSpecifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ICSUserAddress x_apple_telephone](self, "x_apple_telephone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[ICSUserAddress x_apple_telephone](self, "x_apple_telephone");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

- (id)displayName
{
  void *v3;
  id v4;
  void *v5;
  void *v7;
  void *v8;

  -[ICSUserAddress cn](self, "cn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
LABEL_5:
    v5 = v4;
    goto LABEL_6;
  }
  if (-[ICSUserAddress isEmailAddress](self, "isEmailAddress"))
  {
    -[ICSUserAddress emailAddress](self, "emailAddress");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (-[ICSUserAddress isHTTPAddress](self, "isHTTPAddress")
    || -[ICSUserAddress isHTTPSAddress](self, "isHTTPSAddress"))
  {
    -[ICSProperty value](self, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resourceSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ICSProperty value](self, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_6:
  return v5;
}

- (void)setCn:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;

  v6 = a3;
  if (objc_msgSend(v6, "rangeOfString:", CFSTR("\")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = v6;
  }
  else
  {
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("\"), CFSTR("'"), 2, 0, objc_msgSend(v6, "length"));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  v7 = v4;
  -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", v4, CFSTR("CN"));

}

- (NSString)cn
{
  void *v2;
  uint64_t v3;

  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("CN"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "rangeOfString:", CFSTR("\\\")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("\\\"), CFSTR("\"), 2, 0, objc_msgSend(v2, "length"));
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  return (NSString *)v2;
}

- (void)setCutype:(int)a3
{
  id v4;

  if (a3)
  {
    +[ICSCalendarUserParameter calendarUserTypeParameterFromCode:](ICSCalendarUserParameter, "calendarUserTypeParameterFromCode:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", v4, CFSTR("CUTYPE"));

  }
  else
  {
    -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("CUTYPE"));
  }
}

- (int)cutype
{
  void *v3;
  void *v4;
  int v5;

  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("CUTYPE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("CUTYPE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "longValue");

  return v5;
}

- (void)setDir:(id)a3
{
  -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("DIR"));
}

- (NSString)dir
{
  return (NSString *)-[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("DIR"));
}

- (void)setPartstat:(int)a3
{
  id v4;

  if (a3)
  {
    +[ICSParticipationStatusParameter participationStatusParameterFromCode:](ICSParticipationStatusParameter, "participationStatusParameterFromCode:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", v4, CFSTR("PARTSTAT"));

  }
  else
  {
    -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("PARTSTAT"));
  }
}

- (int)partstat
{
  void *v3;
  void *v4;
  int v5;

  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("PARTSTAT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("PARTSTAT"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "longValue");

  return v5;
}

- (void)setSchedulestatus:(int)a3
{
  id v4;

  if (a3)
  {
    +[ICSScheduleStatusParameter scheduleStatusParameterFromCode:](ICSScheduleStatusParameter, "scheduleStatusParameterFromCode:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", v4, CFSTR("SCHEDULE-STATUS"));

  }
  else
  {
    -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("SCHEDULE-STATUS"));
  }
}

- (int)schedulestatus
{
  void *v3;
  void *v4;
  int v5;

  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("SCHEDULE-STATUS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("SCHEDULE-STATUS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "longValue");

  return v5;
}

- (void)setScheduleagent:(int)a3
{
  id v4;

  if (a3)
  {
    +[ICSScheduleAgentParameter scheduleAgentParameterFromCode:](ICSScheduleAgentParameter, "scheduleAgentParameterFromCode:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", v4, CFSTR("SCHEDULE-AGENT"));

  }
  else
  {
    -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("SCHEDULE-AGENT"));
  }
}

- (int)scheduleagent
{
  return -[ICSUserAddress scheduleAgentWithDefaultValue:](self, "scheduleAgentWithDefaultValue:", 0);
}

- (int)scheduleAgentWithDefaultValue:(int)a3
{
  void *v5;
  void *v6;

  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("SCHEDULE-AGENT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("SCHEDULE-AGENT"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = objc_msgSend(v6, "longValue");

  }
  return a3;
}

- (void)setScheduleforcesend:(int)a3
{
  id v4;

  if (a3)
  {
    +[ICSScheduleForceSendParameter scheduleForceSendParameterFromCode:](ICSScheduleForceSendParameter, "scheduleForceSendParameterFromCode:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", v4, CFSTR("SCHEDULE-FORCE-SEND"));

  }
  else
  {
    -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("SCHEDULE-FORCE-SEND"));
  }
}

- (int)scheduleforcesend
{
  void *v3;
  void *v4;
  int v5;

  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("SCHEDULE-FORCE-SEND"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("SCHEDULE-FORCE-SEND"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "longValue");

  return v5;
}

- (void)setRole:(int)a3
{
  id v4;

  if (a3)
  {
    +[ICSRoleParameter roleParameterFromCode:](ICSRoleParameter, "roleParameterFromCode:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", v4, CFSTR("ROLE"));

  }
  else
  {
    -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("ROLE"));
  }
}

- (int)role
{
  void *v3;
  void *v4;
  int v5;

  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("ROLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("ROLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "longValue");

  return v5;
}

- (void)setRsvp:(BOOL)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", v4, CFSTR("RSVP"));

  }
  else
  {
    -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("RSVP"));
  }
}

- (BOOL)rsvp
{
  void *v3;
  void *v4;
  char v5;

  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("RSVP"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("RSVP"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setPartstatModified:(id)a3
{
  -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("X-CALENDARSERVER-DTSTAMP"));
}

- (ICSDateValue)partstatModified
{
  return (ICSDateValue *)-[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("X-CALENDARSERVER-DTSTAMP"));
}

- (void)setX_apple_self_invited:(BOOL)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", v4, CFSTR("X-APPLE-SELF-INVITED"));

  }
  else
  {
    -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("X-APPLE-SELF-INVITED"));
  }
}

- (BOOL)x_apple_self_invited
{
  void *v3;
  void *v4;
  char v5;

  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("X-APPLE-SELF-INVITED"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("X-APPLE-SELF-INVITED"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setEmail:(id)a3
{
  if (a3)
    -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("EMAIL"));
  else
    -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("EMAIL"));
}

- (NSString)email
{
  void *v3;

  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("EMAIL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("X-CALENDARSERVER-EMAIL"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (void)setX_apple_telephone:(id)a3
{
  if (a3)
    -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("X-APPLE-TELEPHONE"));
  else
    -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("X-APPLE-TELEPHONE"));
}

- (NSString)x_apple_telephone
{
  return (NSString *)-[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("X-APPLE-TELEPHONE"));
}

- (void)setLikenessDataString:(id)a3
{
  if (a3)
    -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("TO-ALL-LIKENESS-DATA"));
  else
    -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("TO-ALL-LIKENESS-DATA"));
}

- (NSString)likenessDataString
{
  return (NSString *)-[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("TO-ALL-LIKENESS-DATA"));
}

- (void)setX_apple_inviterName:(id)a3
{
  if (a3)
    -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("X-APPLE-INVITER-NAME"));
  else
    -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("X-APPLE-INVITER-NAME"));
}

- (NSString)x_apple_inviterName
{
  return (NSString *)-[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("X-APPLE-INVITER-NAME"));
}

- (void)setAlternateTimeProposal:(id)a3
{
  if (a3)
    -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("TO-ALL-PROPOSED-NEW-TIME"));
  else
    -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("TO-ALL-PROPOSED-NEW-TIME"));
}

- (ICSAlternateTimeProposal)alternateTimeProposal
{
  return (ICSAlternateTimeProposal *)-[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("TO-ALL-PROPOSED-NEW-TIME"));
}

- (id)propertiesToObscure
{
  return 0;
}

- (id)propertiesToHide
{
  return 0;
}

- (BOOL)shouldObscureParameter:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v7;

  v7 = (void *)MEMORY[0x1E0C99E60];
  v3 = a3;
  objc_msgSend(v7, "setWithObjects:", CFSTR("CUTYPE"), CFSTR("PARTSTAT"), CFSTR("ROLE"), CFSTR("RSVP"), CFSTR("SCHEDULE-FORCE-SEND"), CFSTR("SCHEDULE-STATUS"), CFSTR("SCHEDULE-AGENT"), CFSTR("X-CALENDARSERVER-DTSTAMP"), CFSTR("TO-ALL-PROPOSED-NEW-TIME"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5 ^ 1;
}

- (BOOL)shouldObscureValue
{
  return 1;
}

- (void)setURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!v4)
  {
    +[ICSUserAddress URLForNoMail](ICSUserAddress, "URLForNoMail");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  -[ICSProperty setValue:type:](self, "setValue:type:", v4, 5021);

}

+ (id)URLForNoMail
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("invalid:nomail"));
}

@end
