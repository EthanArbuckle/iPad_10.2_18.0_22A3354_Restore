@implementation CNVCardInstantMessageParser

+ (id)valueWithService:(id)a3 existingHandles:(id)a4 parser:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  int v26;
  void *v27;
  id v28;
  id v30;
  void *v31;
  _QWORD v32[4];
  id v33;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v9, "firstValueForParameterWithName:", CFSTR("X-TEAMIDENTIFIER"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstParameterWithName:", CFSTR("X-BUNDLEIDENTIFIERS"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "values");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstValueForParameterWithName:", CFSTR("X-USERID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "parseStringValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "advancePastSemicolon");

  objc_msgSend(v15, "componentsSeparatedByString:", CFSTR(":"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v16, "count") >= 2)
  {
    v17 = (void *)objc_msgSend(v16, "mutableCopy");
    v30 = a1;
    if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
    {
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNVCardInstantMessageParser serviceForString:](CNVCardInstantMessageParser, "serviceForString:", v18);
      v19 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v19;
    }
    objc_msgSend(v17, "removeObjectAtIndex:", 0, v30);
    objc_msgSend(v17, "componentsJoinedByString:", CFSTR(":"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "stringByRemovingPercentEncoding");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      v23 = v21;

      v20 = v23;
    }
    a1 = v31;

    v15 = v20;
  }
  objc_msgSend(a1, "handleWithUsername:userIdentifier:service:bundleIdentifiers:teamIdentifier:", v15, v14, v8, v13, v11);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __71__CNVCardInstantMessageParser_valueWithService_existingHandles_parser___block_invoke;
  v32[3] = &unk_1E956F928;
  v33 = v24;
  v25 = v24;
  v26 = objc_msgSend(v10, "_cn_any:", v32);

  if (v26)
    v27 = 0;
  else
    v27 = v25;
  v28 = v27;

  return v28;
}

uint64_t __71__CNVCardInstantMessageParser_valueWithService_existingHandles_parser___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

+ (id)handleWithUsername:(id)a3 userIdentifier:(id)a4 service:(id)a5 bundleIdentifiers:(id)a6 teamIdentifier:(id)a7
{
  id v11;
  id v12;
  void *v13;
  id v14;
  __CFString *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;

  v11 = a3;
  v12 = a6;
  v13 = (void *)MEMORY[0x1E0C99E08];
  v14 = a7;
  v15 = (__CFString *)a5;
  v16 = a4;
  objc_msgSend(v13, "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count") == 1)
  {
    objc_msgSend(v12, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "componentsSeparatedByString:", CFSTR(","));
    v19 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v19;
  }
  objc_msgSend(v17, "_cn_setNonNilObject:forKey:", v11, CFSTR("username"));
  objc_msgSend(v17, "_cn_setNonNilObject:forKey:", v16, CFSTR("userIdentifier"));

  objc_msgSend(v17, "_cn_setNonNilObject:forKey:", v14, CFSTR("teamIdentifier"));
  objc_msgSend(v17, "_cn_setNonNilObject:forKey:", v12, CFSTR("bundleIdentifiers"));
  if (v15)
    v20 = v15;
  else
    v20 = &stru_1E95708D8;
  objc_msgSend(v17, "setObject:forKey:", v20, CFSTR("service"));

  return v17;
}

+ (id)serviceForString:(id)a3
{
  __CFString *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  int v7;
  __CFString **v8;
  __CFString **v9;
  const __CFString *v10;
  char v11;
  __CFString *v12;
  const __CFString *v13;

  v3 = (__CFString *)a3;
  -[__CFString lowercaseString](v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[__CFString length](v3, "length");
  v6 = v3;
  switch(v5)
  {
    case 2:
      v7 = objc_msgSend(v4, "isEqualToString:", CFSTR("qq"));
      v8 = CNVCardInstantMessageServiceQQ;
      goto LABEL_27;
    case 3:
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("aim")))
      {
        v9 = CNVCardInstantMessageServiceAIM;
        goto LABEL_24;
      }
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("icq")))
      {
        v9 = CNVCardInstantMessageServiceICQ;
        goto LABEL_24;
      }
      v13 = CFSTR("msn");
      goto LABEL_26;
    case 4:
      v10 = CFSTR("xmpp");
      goto LABEL_14;
    case 5:
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("gtalk")))
      {
        v9 = CNVCardInstantMessageServiceGoogleTalk;
        goto LABEL_24;
      }
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("skype")))
      {
        v9 = CNVCardInstantMessageServiceSkype;
        goto LABEL_24;
      }
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("yahoo"))
        || objc_msgSend(v4, "isEqualToString:", CFSTR("ymsgr")))
      {
        v9 = CNVCardInstantMessageServiceYahoo;
        goto LABEL_24;
      }
      v13 = CFSTR("msnim");
LABEL_26:
      v7 = objc_msgSend(v4, "isEqualToString:", v13);
      v8 = CNVCardInstantMessageServiceMSN;
      goto LABEL_27;
    case 6:
      v10 = CFSTR("jabber");
LABEL_14:
      v7 = objc_msgSend(v4, "isEqualToString:", v10);
      v8 = CNVCardInstantMessageServiceJabber;
      goto LABEL_27;
    case 7:
      v11 = objc_msgSend(v4, "isEqualToString:", CFSTR("x-apple"));
      v6 = v3;
      if ((v11 & 1) == 0)
        goto LABEL_29;
      v12 = 0;
      goto LABEL_30;
    case 8:
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("facebook")))
      {
        v9 = CNVCardInstantMessageServiceFacebook;
LABEL_24:
        v6 = *v9;
      }
      else
      {
        v7 = objc_msgSend(v4, "isEqualToString:", CFSTR("gadugadu"));
        v8 = CNVCardInstantMessageServiceGaduGadu;
LABEL_27:
        v6 = *v8;
        if (!v7)
          v6 = v3;
      }
LABEL_29:
      v12 = v6;
LABEL_30:

      return v12;
    case 10:
      v7 = objc_msgSend(v4, "isEqualToString:", CFSTR("googletalk"));
      v8 = CNVCardInstantMessageServiceGoogleTalk;
      goto LABEL_27;
    default:
      goto LABEL_29;
  }
}

@end
