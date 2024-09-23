@implementation CNVCardInstantMessagingLineGenerator

- (id)makeLineWithName:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  v8 = v7;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }

  objc_msgSend(v10, "valueForKey:", CFSTR("username"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v8, "valueForKey:", CFSTR("service"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNVCardValueEncoder encodeValue:](CNVCardValueEncoder, "encodeValue:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "instantMessageUsernameWithSchemeForUsername:service:", v14, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17.receiver = self;
    v17.super_class = (Class)CNVCardInstantMessagingLineGenerator;
    -[CNVCardLineGenerator makeLineWithName:value:](&v17, sel_makeLineWithName_value_, v6, v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (id)lineWithValue:(id)a3 label:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CNVCardInstantMessagingLineGenerator;
  v5 = a3;
  -[CNVCardLineGenerator lineWithValue:label:](&v14, sel_lineWithValue_label_, v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("service"), v14.receiver, v14.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("userIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceTypeStringForInstantMessageService:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("teamIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("bundleIdentifiers"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR(","));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) == 0)
    objc_msgSend(v6, "insertParameterWithName:value:atIndex:", CFSTR("X-SERVICE-TYPE"), v9, 0);
  objc_msgSend(v6, "addParameterWithName:value:", CFSTR("x-userid"), v8);
  objc_msgSend(v6, "addParameterWithName:value:", CFSTR("x-bundleidentifiers"), v12);
  objc_msgSend(v6, "addParameterWithName:value:", CFSTR("x-teamidentifier"), v10);

  return v6;
}

+ (id)serviceTypeStringForInstantMessageService:(id)a3
{
  id v3;
  __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AIMInstant")) & 1) != 0)
  {
    v4 = CFSTR("AIM");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FacebookInstant")) & 1) != 0)
  {
    v4 = CFSTR("Facebook");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GaduGaduInstant")) & 1) != 0)
  {
    v4 = CFSTR("GaduGadu");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GoogleTalkInstant")) & 1) != 0)
  {
    v4 = CFSTR("GoogleTalk");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ICQInstant")) & 1) != 0)
  {
    v4 = CFSTR("ICQ");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("JabberInstant")) & 1) != 0)
  {
    v4 = CFSTR("Jabber");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSNInstant")) & 1) != 0)
  {
    v4 = CFSTR("MSN");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("QQInstant")) & 1) != 0)
  {
    v4 = CFSTR("QQ");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SkypeInstant")) & 1) != 0)
  {
    v4 = CFSTR("Skype");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("YahooInstant")) & 1) != 0)
  {
    v4 = CFSTR("Yahoo");
  }
  else
  {
    v4 = (__CFString *)v3;
  }

  return v4;
}

+ (id)instantMessageUsernameWithSchemeForUsername:(id)a3 service:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[3];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CB3500];
  v7 = a3;
  objc_msgSend(v6, "URLPathAllowedCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAddingPercentEncodingWithAllowedCharacters:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = CFSTR("AIMInstant");
  v21[1] = CFSTR("ICQInstant");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v10, "containsObject:", v5);

  if ((_DWORD)v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("aim:%@"), v9);
  }
  else
  {
    v20[0] = CFSTR("FacebookInstant");
    v20[1] = CFSTR("GoogleTalkInstant");
    v20[2] = CFSTR("JabberInstant");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", v5);

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("xmpp:%@"), v9);
    }
    else
    {
      if (!objc_msgSend(v5, "isEqualToString:", CFSTR("MSNInstant")))
      {
        v19[0] = CFSTR("GaduGaduInstant");
        v19[1] = CFSTR("QQInstant");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "containsObject:", v5);

        if (v14)
        {
          v15 = (void *)MEMORY[0x1E0CB3940];
        }
        else
        {
          if (objc_msgSend(v5, "isEqualToString:", CFSTR("SkypeInstant")))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("skype:%@"), v9);
            goto LABEL_14;
          }
          v16 = objc_msgSend(v5, "isEqualToString:", CFSTR("YahooInstant"));
          v15 = (void *)MEMORY[0x1E0CB3940];
          if (v16)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ymsgr:%@"), v9);
            goto LABEL_14;
          }
        }
        objc_msgSend(v15, "stringWithFormat:", CFSTR("x-apple:%@"), v9);
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("msnim:%@"), v9);
    }
  }
LABEL_14:
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)standardLabelsForLabel:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("MobileMe")))
  {
    v9[0] = CFSTR("MobileMe");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CNVCardInstantMessagingLineGenerator;
    -[CNVCardLineGenerator standardLabelsForLabel:](&v8, sel_standardLabelsForLabel_, v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

@end
