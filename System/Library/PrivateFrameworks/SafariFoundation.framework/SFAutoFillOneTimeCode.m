@implementation SFAutoFillOneTimeCode

- (SFAutoFillOneTimeCode)initWithIMCoreDictionary:(id)a3
{
  id v4;
  SFAutoFillOneTimeCode *v5;
  SFAutoFillOneTimeCode *v6;
  id *v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSDate *timestamp;
  id *v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSString *GUID;
  id *v17;
  void *v18;
  id v19;
  uint64_t v20;
  NSString *detectedCode;
  id *v22;
  void *v23;
  id v24;
  uint64_t v25;
  NSString *displayCode;
  id *v27;
  void *v28;
  id v29;
  uint64_t v30;
  NSString *handle;
  id *v32;
  void *v33;
  id v34;
  uint64_t v35;
  NSString *machineReadableCode;
  id *v37;
  void *v38;
  id v39;
  uint64_t v40;
  NSString *domain;
  id *v42;
  void *v43;
  id v44;
  uint64_t v45;
  NSString *embeddedDomain;
  _QWORD *v47;
  void *v48;
  void *v49;
  id *v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  NSArray *embeddedDomains;
  SFAutoFillOneTimeCode *v56;
  objc_super v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;

  v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)SFAutoFillOneTimeCode;
  v5 = -[SFAutoFillOneTimeCode init](&v58, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_source = 0;
    v59 = 0;
    v60 = &v59;
    v61 = 0x2020000000;
    v7 = (id *)getIMOneTimeCodeTimeStampKeySymbolLoc_ptr;
    v62 = getIMOneTimeCodeTimeStampKeySymbolLoc_ptr;
    if (!getIMOneTimeCodeTimeStampKeySymbolLoc_ptr)
    {
      v8 = (void *)IMSharedUtilitiesLibrary();
      v7 = (id *)dlsym(v8, "IMOneTimeCodeTimeStampKey");
      v60[3] = (uint64_t)v7;
      getIMOneTimeCodeTimeStampKeySymbolLoc_ptr = (uint64_t)v7;
    }
    _Block_object_dispose(&v59, 8);
    if (!v7)
      -[SFAutoFillOneTimeCode initWithIMCoreDictionary:].cold.1();
    v9 = *v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    timestamp = v6->_timestamp;
    v6->_timestamp = (NSDate *)v10;

    v59 = 0;
    v60 = &v59;
    v61 = 0x2020000000;
    v12 = (id *)getIMOneTimeCodeGuidKeySymbolLoc_ptr;
    v62 = getIMOneTimeCodeGuidKeySymbolLoc_ptr;
    if (!getIMOneTimeCodeGuidKeySymbolLoc_ptr)
    {
      v13 = (void *)IMSharedUtilitiesLibrary();
      v12 = (id *)dlsym(v13, "IMOneTimeCodeGuidKey");
      v60[3] = (uint64_t)v12;
      getIMOneTimeCodeGuidKeySymbolLoc_ptr = (uint64_t)v12;
    }
    _Block_object_dispose(&v59, 8);
    if (!v12)
      -[SFAutoFillOneTimeCode initWithIMCoreDictionary:].cold.2();
    v14 = *v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    GUID = v6->_GUID;
    v6->_GUID = (NSString *)v15;

    v59 = 0;
    v60 = &v59;
    v61 = 0x2020000000;
    v17 = (id *)getIMOneTimeCodeKeySymbolLoc_ptr;
    v62 = getIMOneTimeCodeKeySymbolLoc_ptr;
    if (!getIMOneTimeCodeKeySymbolLoc_ptr)
    {
      v18 = (void *)IMSharedUtilitiesLibrary();
      v17 = (id *)dlsym(v18, "IMOneTimeCodeKey");
      v60[3] = (uint64_t)v17;
      getIMOneTimeCodeKeySymbolLoc_ptr = (uint64_t)v17;
    }
    _Block_object_dispose(&v59, 8);
    if (!v17)
      -[SFAutoFillOneTimeCode initWithIMCoreDictionary:].cold.3();
    v19 = *v17;
    objc_msgSend(v4, "objectForKeyedSubscript:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    detectedCode = v6->_detectedCode;
    v6->_detectedCode = (NSString *)v20;

    v59 = 0;
    v60 = &v59;
    v61 = 0x2020000000;
    v22 = (id *)getIMOneTimeCodeDisplayKeySymbolLoc_ptr;
    v62 = getIMOneTimeCodeDisplayKeySymbolLoc_ptr;
    if (!getIMOneTimeCodeDisplayKeySymbolLoc_ptr)
    {
      v23 = (void *)IMSharedUtilitiesLibrary();
      v22 = (id *)dlsym(v23, "IMOneTimeCodeDisplayKey");
      v60[3] = (uint64_t)v22;
      getIMOneTimeCodeDisplayKeySymbolLoc_ptr = (uint64_t)v22;
    }
    _Block_object_dispose(&v59, 8);
    if (!v22)
      -[SFAutoFillOneTimeCode initWithIMCoreDictionary:].cold.4();
    v24 = *v22;
    objc_msgSend(v4, "objectForKeyedSubscript:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    displayCode = v6->_displayCode;
    v6->_displayCode = (NSString *)v25;

    v59 = 0;
    v60 = &v59;
    v61 = 0x2020000000;
    v27 = (id *)getIMOneTimeCodeHandleKeySymbolLoc_ptr;
    v62 = getIMOneTimeCodeHandleKeySymbolLoc_ptr;
    if (!getIMOneTimeCodeHandleKeySymbolLoc_ptr)
    {
      v28 = (void *)IMSharedUtilitiesLibrary();
      v27 = (id *)dlsym(v28, "IMOneTimeCodeHandleKey");
      v60[3] = (uint64_t)v27;
      getIMOneTimeCodeHandleKeySymbolLoc_ptr = (uint64_t)v27;
    }
    _Block_object_dispose(&v59, 8);
    if (!v27)
      -[SFAutoFillOneTimeCode initWithIMCoreDictionary:].cold.5();
    v29 = *v27;
    objc_msgSend(v4, "objectForKeyedSubscript:", v29);
    v30 = objc_claimAutoreleasedReturnValue();
    handle = v6->_handle;
    v6->_handle = (NSString *)v30;

    v59 = 0;
    v60 = &v59;
    v61 = 0x2020000000;
    v32 = (id *)getIMOneTimeCodeMachineReadableCodeKeySymbolLoc_ptr;
    v62 = getIMOneTimeCodeMachineReadableCodeKeySymbolLoc_ptr;
    if (!getIMOneTimeCodeMachineReadableCodeKeySymbolLoc_ptr)
    {
      v33 = (void *)IMSharedUtilitiesLibrary();
      v32 = (id *)dlsym(v33, "IMOneTimeCodeMachineReadableCodeKey");
      v60[3] = (uint64_t)v32;
      getIMOneTimeCodeMachineReadableCodeKeySymbolLoc_ptr = (uint64_t)v32;
    }
    _Block_object_dispose(&v59, 8);
    if (!v32)
      -[SFAutoFillOneTimeCode initWithIMCoreDictionary:].cold.6();
    v34 = *v32;
    objc_msgSend(v4, "objectForKeyedSubscript:", v34);
    v35 = objc_claimAutoreleasedReturnValue();
    machineReadableCode = v6->_machineReadableCode;
    v6->_machineReadableCode = (NSString *)v35;

    v59 = 0;
    v60 = &v59;
    v61 = 0x2020000000;
    v37 = (id *)getIMOneTimeCodeDomainKeySymbolLoc_ptr;
    v62 = getIMOneTimeCodeDomainKeySymbolLoc_ptr;
    if (!getIMOneTimeCodeDomainKeySymbolLoc_ptr)
    {
      v38 = (void *)IMSharedUtilitiesLibrary();
      v37 = (id *)dlsym(v38, "IMOneTimeCodeDomainKey");
      v60[3] = (uint64_t)v37;
      getIMOneTimeCodeDomainKeySymbolLoc_ptr = (uint64_t)v37;
    }
    _Block_object_dispose(&v59, 8);
    if (!v37)
      -[SFAutoFillOneTimeCode initWithIMCoreDictionary:].cold.7();
    v39 = *v37;
    objc_msgSend(v4, "objectForKeyedSubscript:", v39);
    v40 = objc_claimAutoreleasedReturnValue();
    domain = v6->_domain;
    v6->_domain = (NSString *)v40;

    v59 = 0;
    v60 = &v59;
    v61 = 0x2020000000;
    v42 = (id *)getIMOneTimeCodeEmbeddedDomainKeySymbolLoc_ptr;
    v62 = getIMOneTimeCodeEmbeddedDomainKeySymbolLoc_ptr;
    if (!getIMOneTimeCodeEmbeddedDomainKeySymbolLoc_ptr)
    {
      v43 = (void *)IMSharedUtilitiesLibrary();
      v42 = (id *)dlsym(v43, "IMOneTimeCodeEmbeddedDomainKey");
      v60[3] = (uint64_t)v42;
      getIMOneTimeCodeEmbeddedDomainKeySymbolLoc_ptr = (uint64_t)v42;
    }
    _Block_object_dispose(&v59, 8);
    if (!v42)
      -[SFAutoFillOneTimeCode initWithIMCoreDictionary:].cold.8();
    v44 = *v42;
    objc_msgSend(v4, "objectForKeyedSubscript:", v44);
    v45 = objc_claimAutoreleasedReturnValue();
    embeddedDomain = v6->_embeddedDomain;
    v6->_embeddedDomain = (NSString *)v45;

    v59 = 0;
    v60 = &v59;
    v61 = 0x2020000000;
    v47 = (_QWORD *)getIMOneTimeCodeDomainStrictMatchKeySymbolLoc_ptr;
    v62 = getIMOneTimeCodeDomainStrictMatchKeySymbolLoc_ptr;
    if (!getIMOneTimeCodeDomainStrictMatchKeySymbolLoc_ptr)
    {
      v48 = (void *)IMSharedUtilitiesLibrary();
      v47 = dlsym(v48, "IMOneTimeCodeDomainStrictMatchKey");
      v60[3] = (uint64_t)v47;
      getIMOneTimeCodeDomainStrictMatchKeySymbolLoc_ptr = (uint64_t)v47;
    }
    _Block_object_dispose(&v59, 8);
    if (!v47)
      -[SFAutoFillOneTimeCode initWithIMCoreDictionary:].cold.9();
    objc_msgSend(v4, "objectForKeyedSubscript:", *v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_domainStrictMatch = objc_msgSend(v49, "BOOLValue");

    v59 = 0;
    v60 = &v59;
    v61 = 0x2020000000;
    v50 = (id *)getIMOneTimeCodeEmbeddedDomainsKeySymbolLoc_ptr;
    v62 = getIMOneTimeCodeEmbeddedDomainsKeySymbolLoc_ptr;
    if (!getIMOneTimeCodeEmbeddedDomainsKeySymbolLoc_ptr)
    {
      v51 = (void *)IMSharedUtilitiesLibrary();
      v50 = (id *)dlsym(v51, "IMOneTimeCodeEmbeddedDomainsKey");
      v60[3] = (uint64_t)v50;
      getIMOneTimeCodeEmbeddedDomainsKeySymbolLoc_ptr = (uint64_t)v50;
    }
    _Block_object_dispose(&v59, 8);
    if (!v50)
      -[SFAutoFillOneTimeCode initWithIMCoreDictionary:].cold.10();
    v52 = *v50;
    objc_msgSend(v4, "objectForKeyedSubscript:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAutoFillOneTimeCode _embeddedDomainArrayFromIMCoreEmbeddedDomains:](v6, "_embeddedDomainArrayFromIMCoreEmbeddedDomains:", v53);
    v54 = objc_claimAutoreleasedReturnValue();
    embeddedDomains = v6->_embeddedDomains;
    v6->_embeddedDomains = (NSArray *)v54;

    v56 = v6;
  }

  return v6;
}

- (SFAutoFillOneTimeCode)initWithMailOneTimeCode:(id)a3 timestamp:(id)a4 messageID:(int64_t)a5
{
  id v9;
  id v10;
  SFAutoFillOneTimeCode *v11;
  SFAutoFillOneTimeCode *v12;
  NSString *GUID;
  NSString *handle;
  SFAutoFillOneTimeCode *v15;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SFAutoFillOneTimeCode;
  v11 = -[SFAutoFillOneTimeCode init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_source = 1;
    objc_storeStrong((id *)&v11->_displayCode, a3);
    objc_storeStrong((id *)&v12->_detectedCode, a3);
    objc_storeStrong((id *)&v12->_timestamp, a4);
    v12->_messageID = a5;
    GUID = v12->_GUID;
    v12->_GUID = (NSString *)&stru_24C9367F0;

    handle = v12->_handle;
    v12->_handle = (NSString *)&stru_24C9367F0;

    v15 = v12;
  }

  return v12;
}

- (SFAutoFillOneTimeCode)initWithTOTPGenerator:(id)a3 user:(id)a4 highLevelDomain:(id)a5 lastUsedDateOfAssociatedSavedAccount:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SFAutoFillOneTimeCode *v15;
  SFAutoFillOneTimeCode *v16;
  uint64_t v17;
  NSString *user;
  uint64_t v19;
  NSString *domain;
  SFAutoFillOneTimeCode *v21;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)SFAutoFillOneTimeCode;
  v15 = -[SFAutoFillOneTimeCode init](&v23, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_source = 2;
    objc_storeStrong((id *)&v15->_totpGenerator, a3);
    v17 = objc_msgSend(v12, "copy");
    user = v16->_user;
    v16->_user = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    domain = v16->_domain;
    v16->_domain = (NSString *)v19;

    objc_storeStrong((id *)&v16->_lastUseDateOfAssociatedSavedAccount, a6);
    v21 = v16;
  }

  return v16;
}

- (NSString)code
{
  unint64_t source;
  NSString *machineReadableCode;
  __CFString *v4;
  WBSTOTPGenerator *totpGenerator;
  void *v6;

  source = self->_source;
  if (source >= 2)
  {
    if (source == 2)
    {
      totpGenerator = self->_totpGenerator;
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSTOTPGenerator codeForDate:](totpGenerator, "codeForDate:", v6);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = &stru_24C9367F0;
    }
  }
  else
  {
    machineReadableCode = self->_machineReadableCode;
    if (!machineReadableCode || !self->_domain)
      machineReadableCode = self->_detectedCode;
    v4 = machineReadableCode;
  }
  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  SFAutoFillOneTimeCode *v4;
  SFAutoFillOneTimeCode *v5;
  char v6;

  v4 = (SFAutoFillOneTimeCode *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (self->_source == v5->_source
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual())
      {
        v6 = WBSIsEqual();
      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  int64_t source;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;

  source = self->_source;
  v4 = -[NSString hash](self->_detectedCode, "hash") ^ source;
  v5 = -[NSString hash](self->_machineReadableCode, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_displayCode, "hash");
  v7 = -[NSString hash](self->_GUID, "hash");
  v8 = v7 ^ -[NSString hash](self->_handle, "hash");
  v9 = v6 ^ v8 ^ -[NSDate hash](self->_timestamp, "hash");
  v10 = -[NSString hash](self->_user, "hash");
  v11 = v10 ^ -[NSString hash](self->_domain, "hash");
  v12 = v11 ^ -[NSString hash](self->_embeddedDomain, "hash");
  return v9 ^ v12 ^ -[WBSTOTPGenerator hash](self->_totpGenerator, "hash");
}

- (id)description
{
  unint64_t source;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v9;
  uint64_t v10;
  WBSTOTPGenerator *totpGenerator;
  void *v12;
  void *v13;
  objc_super v14;

  source = self->_source;
  if (source >= 2)
  {
    if (source != 2)
    {
      v14.receiver = self;
      v14.super_class = (Class)SFAutoFillOneTimeCode;
      -[SFAutoFillOneTimeCode description](&v14, sel_description);
      return (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)MEMORY[0x24BDD17C8];
    v10 = objc_opt_class();
    -[SFAutoFillOneTimeCode _stringForSource:](self, "_stringForSource:", self->_source);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    totpGenerator = self->_totpGenerator;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSTOTPGenerator codeForDate:](totpGenerator, "codeForDate:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@: %p; source=%@; code=<promised>%@; generator=%p; user=\"%@\"; domain=\"%@\">"),
      v10,
      self,
      v6,
      v13,
      self->_totpGenerator,
      self->_user,
      self->_domain);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    v5 = objc_opt_class();
    -[SFAutoFillOneTimeCode _stringForSource:](self, "_stringForSource:", self->_source);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; source=%@; code=\"%@\"; machineReadableCode=\"%@\"; displayCode=\"%@\"; guid=\"%@\"; handle=\"%@\"; timeStamp=\"%@\"; user=\"%@\"; domain=\"%@\" embeddedDomain=\"%@\">"),
      v5,
      self,
      v6,
      self->_detectedCode,
      self->_machineReadableCode,
      self->_displayCode,
      self->_GUID,
      self->_handle,
      self->_timestamp,
      self->_user,
      self->_domain,
      self->_embeddedDomain);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (NSDate)timestamp
{
  unint64_t source;

  source = self->_source;
  if (source < 2)
    return self->_timestamp;
  if (source == 2)
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
  else
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)detectedCode
{
  unint64_t source;
  __CFString *v3;
  WBSTOTPGenerator *totpGenerator;
  void *v5;

  source = self->_source;
  if (source >= 2)
  {
    if (source == 2)
    {
      totpGenerator = self->_totpGenerator;
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSTOTPGenerator codeForDate:](totpGenerator, "codeForDate:", v5);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = &stru_24C9367F0;
    }
  }
  else
  {
    v3 = self->_detectedCode;
  }
  return (NSString *)v3;
}

- (int64_t)matchDomainWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  v5 = v4;
  if (self->_domain)
  {
    if (v4 && self->_machineReadableCode)
    {
      -[SFAutoFillOneTimeCode _domainBoundTopLevelURL](self, "_domainBoundTopLevelURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[SFAutoFillOneTimeCode _matchURL:withBoundDomainURL:strict:](self, "_matchURL:withBoundDomainURL:strict:", v5, v6, self->_domainStrictMatch);

    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 2;
  }

  return v7;
}

- (int64_t)matchBoundDomainsWithFrameURLs:(id)a3
{
  id v4;
  uint64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  int64_t v9;

  v4 = a3;
  if (!self->_domain && !-[NSArray count](self->_embeddedDomains, "count") && !self->_embeddedDomain)
  {
    v6 = 2;
    goto LABEL_22;
  }
  if (!self->_machineReadableCode)
    goto LABEL_21;
  v5 = objc_msgSend(v4, "count");
  if (v5 == 1)
  {
    if (self->_domain && !self->_embeddedDomain && !-[NSArray count](self->_embeddedDomains, "count"))
    {
      objc_msgSend(v4, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAutoFillOneTimeCode _domainBoundTopLevelURL](self, "_domainBoundTopLevelURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[SFAutoFillOneTimeCode _matchURL:withBoundDomainURL:strict:](self, "_matchURL:withBoundDomainURL:strict:", v7, v8, self->_domainStrictMatch);

      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (v5)
  {
    if (self->_domain)
    {
      if (-[NSArray count](self->_embeddedDomains, "count"))
      {
        v9 = -[SFAutoFillOneTimeCode _matchBoundDomainAndEmbeddedDomainsWithFrameURLs:](self, "_matchBoundDomainAndEmbeddedDomainsWithFrameURLs:", v4);
LABEL_20:
        v6 = v9;
        goto LABEL_22;
      }
      if (self->_embeddedDomain)
      {
        v9 = -[SFAutoFillOneTimeCode _matchBoundDomainAndEmbeddedDomainWithFrameURLs:](self, "_matchBoundDomainAndEmbeddedDomainWithFrameURLs:", v4);
        goto LABEL_20;
      }
    }
LABEL_21:
    v6 = 0;
    goto LABEL_22;
  }
  if (self->_domain || -[NSArray count](self->_embeddedDomains, "count"))
    goto LABEL_21;
  v6 = 2 * (self->_embeddedDomain == 0);
LABEL_22:

  return v6;
}

- (int64_t)_matchBoundDomainAndEmbeddedDomainWithFrameURLs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t i;
  uint64_t v15;
  int64_t v16;
  int64_t v17;
  void *v19;
  unint64_t v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SFAutoFillOneTimeCode _domainBoundTopLevelURL](self, "_domainBoundTopLevelURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAutoFillOneTimeCode _domainBoundEmbeddedURL](self, "_domainBoundEmbeddedURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SFAutoFillOneTimeCode _matchURL:withBoundDomainURL:strict:](self, "_matchURL:withBoundDomainURL:strict:", v7, v6, 0);

  if (v8)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v10)
    {
      v11 = v10;
      v22 = v4;
      v12 = *(_QWORD *)v24;
      v13 = 2;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          v16 = -[SFAutoFillOneTimeCode _matchURL:withBoundDomainURL:strict:](self, "_matchURL:withBoundDomainURL:strict:", v15, v5, 0);
          v17 = -[SFAutoFillOneTimeCode _matchURL:withBoundDomainURL:strict:](self, "_matchURL:withBoundDomainURL:strict:", v15, v6, 0);
          if (!(v16 | v17))
          {

            v13 = 0;
            v4 = v22;
            goto LABEL_21;
          }
          if (v17 != 2 && v16 != 2)
            v13 = 1;
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v11)
          continue;
        break;
      }

      v4 = v22;
    }
    else
    {

      v13 = 2;
    }
    objc_msgSend(v9, "lastObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[SFAutoFillOneTimeCode _matchURL:withBoundDomainURL:strict:](self, "_matchURL:withBoundDomainURL:strict:", v19, v5, 0);

    if (v20 <= 1)
      v13 = v20;
  }
  else
  {
    v13 = 0;
  }
LABEL_21:

  return v13;
}

- (int64_t)_matchBoundDomainAndEmbeddedDomainsWithFrameURLs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  int64_t v22;
  BOOL v23;
  void *v24;
  unint64_t v25;
  void *v27;
  void *v28;
  id v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  int64_t v35;
  int64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SFAutoFillOneTimeCode _domainBoundTopLevelURL](self, "_domainBoundTopLevelURL");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray firstObject](self->_embeddedDomains, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAutoFillOneTimeCode _secureURLForDomain:](self, "_secureURLForDomain:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SFAutoFillOneTimeCode _matchURL:withBoundDomainURL:strict:](self, "_matchURL:withBoundDomainURL:strict:", v8, v7, objc_msgSend(v5, "strict"));

  if (v9)
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v10 = v4;
    v32 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v32)
    {
      v27 = v7;
      v28 = v5;
      obj = v10;
      v31 = *(_QWORD *)v42;
      v9 = 2;
      v29 = v4;
      while (2)
      {
        v11 = 0;
        do
        {
          v35 = v9;
          if (*(_QWORD *)v42 != v31)
            objc_enumerationMutation(obj);
          v34 = v11;
          v12 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v11);
          v36 = -[SFAutoFillOneTimeCode _matchURL:withBoundDomainURL:strict:](self, "_matchURL:withBoundDomainURL:strict:", v12, v33, self->_domainStrictMatch, v27, v28);
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v13 = self->_embeddedDomains;
          v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          if (v14)
          {
            v15 = v14;
            v16 = 0;
            v17 = *(_QWORD *)v38;
            do
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v38 != v17)
                  objc_enumerationMutation(v13);
                v19 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
                objc_msgSend(v19, "domain");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFAutoFillOneTimeCode _secureURLForDomain:](self, "_secureURLForDomain:", v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = -[SFAutoFillOneTimeCode _matchURL:withBoundDomainURL:strict:](self, "_matchURL:withBoundDomainURL:strict:", v12, v21, objc_msgSend(v19, "strict"));

                if (v22 > v16)
                  v16 = v22;
              }
              v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
            }
            while (v15);
          }
          else
          {
            v16 = 0;
          }

          if (!(v36 | v16))
          {

            v9 = 0;
            v5 = v28;
            v4 = v29;
            v7 = v27;
            goto LABEL_31;
          }
          v23 = v16 == 2 || v36 == 2;
          v9 = v35;
          if (!v23)
            v9 = 1;
          v11 = v34 + 1;
        }
        while (v34 + 1 != v32);
        v4 = v29;
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        if (v32)
          continue;
        break;
      }
      v10 = obj;

      v7 = v27;
      v5 = v28;
    }
    else
    {

      v9 = 2;
    }
    objc_msgSend(v10, "lastObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[SFAutoFillOneTimeCode _matchURL:withBoundDomainURL:strict:](self, "_matchURL:withBoundDomainURL:strict:", v24, v33, self->_domainStrictMatch);

    if (v25 <= 1)
      v9 = v25;
  }
LABEL_31:

  return v9;
}

- (int64_t)_matchURL:(id)a3 withBoundDomainURL:(id)a4 strict:(BOOL)a5
{
  id v7;
  id v8;
  int64_t v9;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v8, "safari_hasSameOriginAsURL:", v7) & 1) != 0)
    v9 = 2;
  else
    v9 = !a5 && (objc_msgSend(v8, "safari_hasSameSiteAsURL:", v7) & 1) != 0;

  return v9;
}

- (NSURL)_domainBoundTopLevelURL
{
  return (NSURL *)-[SFAutoFillOneTimeCode _secureURLForDomain:](self, "_secureURLForDomain:", self->_domain);
}

- (NSURL)_domainBoundEmbeddedURL
{
  void *v3;
  void *v4;
  void *v5;

  if (-[NSArray count](self->_embeddedDomains, "count"))
  {
    -[NSArray firstObject](self->_embeddedDomains, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAutoFillOneTimeCode _secureURLForDomain:](self, "_secureURLForDomain:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SFAutoFillOneTimeCode _secureURLForDomain:](self, "_secureURLForDomain:", self->_embeddedDomain);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSURL *)v5;
}

- (id)_secureURLForDomain:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x24BDD1808];
    v4 = a3;
    v5 = objc_alloc_init(v3);
    objc_msgSend(v5, "setScheme:", CFSTR("https"));
    objc_msgSend(v5, "setHost:", v4);

    objc_msgSend(v5, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_stringForSource:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Messages");
  if (a3 == 1)
    v3 = CFSTR("Mail");
  if (a3 == 2)
    return CFSTR("TOTPGenerator");
  else
    return (id)v3;
}

- (id)_embeddedDomainArrayFromIMCoreEmbeddedDomains:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  SFAutoFillOneTimeCodeEmbeddedDomainPair *v9;
  id v10;

  v3 = a3;
  if ((objc_msgSend(v3, "count") & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      v5 = 0;
      while (1)
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        v7 = v5 + 1;
        objc_msgSend(v3, "objectAtIndexedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          break;
        }
        v9 = objc_alloc_init(SFAutoFillOneTimeCodeEmbeddedDomainPair);
        -[SFAutoFillOneTimeCodeEmbeddedDomainPair setDomain:](v9, "setDomain:", v6);
        -[SFAutoFillOneTimeCodeEmbeddedDomainPair setStrict:](v9, "setStrict:", objc_msgSend(v8, "BOOLValue"));
        objc_msgSend(v4, "addObject:", v9);

        v5 = v7 + 1;
        if (v5 >= objc_msgSend(v3, "count"))
          goto LABEL_7;
      }

      v10 = 0;
    }
    else
    {
LABEL_7:
      v10 = v4;
    }

  }
  return v10;
}

- (id)localizedTitleForContext:(int64_t)a3
{
  int64_t source;
  void *v5;
  int v6;
  NSString *domain;
  void *v8;
  NSString *v10;
  void *v11;
  void *v12;

  source = self->_source;
  if (source == 2)
    goto LABEL_11;
  if (source != 1)
  {
    if (source)
      return &stru_24C9367F0;
    if ((unint64_t)(a3 - 2) >= 2)
    {
      if (a3 != 1)
      {
        if (!a3)
          goto LABEL_20;
        goto LABEL_11;
      }
      goto LABEL_19;
    }
LABEL_15:
    v10 = self->_displayCode;
LABEL_21:
    v12 = v10;
    return v12;
  }
  if ((unint64_t)(a3 - 2) < 2)
    goto LABEL_15;
  if (a3 == 1)
  {
LABEL_19:
    fillCodeString(self->_displayCode);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (!a3)
    goto LABEL_20;
LABEL_11:
  +[SFCredentialProviderExtensionManager sharedManager](SFCredentialProviderExtensionManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "atLeastOneEnabledExtensionSupportsOneTimeCodes");

  domain = self->_domain;
  if (!v6)
  {
    if (domain)
    {
      v8 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_18;
    }
LABEL_20:
    _WBSLocalizedString();
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (!domain)
    goto LABEL_20;
  v8 = (void *)MEMORY[0x24BDD17C8];
LABEL_18:
  _WBSLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", v11, self->_domain);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)localizedSubtitleForContext:(int64_t)a3
{
  int64_t source;
  NSString *v4;
  NSString *user;

  source = self->_source;
  if (source == 2)
  {
LABEL_10:
    user = self->_user;
    if (user)
    {
LABEL_12:
      v4 = user;
      return v4;
    }
LABEL_11:
    user = self->_displayCode;
    goto LABEL_12;
  }
  if (source != 1)
  {
    if (source)
      return &stru_24C9367F0;
    if ((unint64_t)(a3 - 1) < 3)
      goto LABEL_7;
LABEL_9:
    if (!a3)
      goto LABEL_11;
    goto LABEL_10;
  }
  if ((unint64_t)(a3 - 1) >= 3)
    goto LABEL_9;
LABEL_7:
  _WBSLocalizedString();
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t source;
  id v5;

  source = self->_source;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", source, CFSTR("source"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timestamp, CFSTR("timestamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_GUID, CFSTR("GUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_detectedCode, CFSTR("detectedCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayCode, CFSTR("displayCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_handle, CFSTR("handle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_machineReadableCode, CFSTR("machineReadableCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_domain, CFSTR("domain"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_domainStrictMatch, CFSTR("domainStrictMatch"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_embeddedDomain, CFSTR("embeddedDomain"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_embeddedDomains, CFSTR("embeddedDomains"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_user, CFSTR("user"));

}

- (SFAutoFillOneTimeCode)initWithCoder:(id)a3
{
  id v4;
  SFAutoFillOneTimeCode *v5;
  uint64_t v6;
  NSString *user;
  uint64_t v8;
  NSDate *timestamp;
  uint64_t v10;
  NSString *GUID;
  uint64_t v12;
  NSString *detectedCode;
  uint64_t v14;
  NSString *displayCode;
  uint64_t v16;
  NSString *handle;
  uint64_t v18;
  NSString *machineReadableCode;
  uint64_t v20;
  NSString *domain;
  uint64_t v22;
  NSString *embeddedDomain;
  uint64_t v24;
  NSArray *embeddedDomains;
  SFAutoFillOneTimeCode *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SFAutoFillOneTimeCode;
  v5 = -[SFAutoFillOneTimeCode init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("user"));
    v6 = objc_claimAutoreleasedReturnValue();
    user = v5->_user;
    v5->_user = (NSString *)v6;

    v5->_source = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("source"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
    v8 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GUID"));
    v10 = objc_claimAutoreleasedReturnValue();
    GUID = v5->_GUID;
    v5->_GUID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("detectedCode"));
    v12 = objc_claimAutoreleasedReturnValue();
    detectedCode = v5->_detectedCode;
    v5->_detectedCode = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayCode"));
    v14 = objc_claimAutoreleasedReturnValue();
    displayCode = v5->_displayCode;
    v5->_displayCode = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handle"));
    v16 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("machineReadableCode"));
    v18 = objc_claimAutoreleasedReturnValue();
    machineReadableCode = v5->_machineReadableCode;
    v5->_machineReadableCode = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("domain"));
    v20 = objc_claimAutoreleasedReturnValue();
    domain = v5->_domain;
    v5->_domain = (NSString *)v20;

    v5->_domainStrictMatch = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("domainStrictMatch"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("embeddedDomain"));
    v22 = objc_claimAutoreleasedReturnValue();
    embeddedDomain = v5->_embeddedDomain;
    v5->_embeddedDomain = (NSString *)v22;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("embeddedDomains"));
    v24 = objc_claimAutoreleasedReturnValue();
    embeddedDomains = v5->_embeddedDomains;
    v5->_embeddedDomains = (NSArray *)v24;

    v26 = v5;
  }

  return v5;
}

- (int64_t)source
{
  return self->_source;
}

- (NSString)machineReadableCode
{
  return self->_machineReadableCode;
}

- (NSString)displayCode
{
  return self->_displayCode;
}

- (NSString)GUID
{
  return self->_GUID;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)user
{
  return self->_user;
}

- (NSString)domain
{
  return self->_domain;
}

- (BOOL)domainStrictMatch
{
  return self->_domainStrictMatch;
}

- (NSString)embeddedDomain
{
  return self->_embeddedDomain;
}

- (NSArray)embeddedDomains
{
  return self->_embeddedDomains;
}

- (int64_t)messageID
{
  return self->_messageID;
}

- (WBSTOTPGenerator)totpGenerator
{
  return self->_totpGenerator;
}

- (NSDate)lastUseDateOfAssociatedSavedAccount
{
  return self->_lastUseDateOfAssociatedSavedAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUseDateOfAssociatedSavedAccount, 0);
  objc_storeStrong((id *)&self->_embeddedDomains, 0);
  objc_storeStrong((id *)&self->_embeddedDomain, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
  objc_storeStrong((id *)&self->_displayCode, 0);
  objc_storeStrong((id *)&self->_machineReadableCode, 0);
  objc_storeStrong((id *)&self->_totpGenerator, 0);
  objc_storeStrong((id *)&self->_detectedCode, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

- (void)initWithIMCoreDictionary:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getIMOneTimeCodeTimeStampKey(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SFAutoFillOneTimeCode.m"), 19, CFSTR("%s"), OUTLINED_FUNCTION_0_1());

  __break(1u);
}

- (void)initWithIMCoreDictionary:.cold.2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getIMOneTimeCodeGuidKey(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SFAutoFillOneTimeCode.m"), 18, CFSTR("%s"), OUTLINED_FUNCTION_0_1());

  __break(1u);
}

- (void)initWithIMCoreDictionary:.cold.3()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getIMOneTimeCodeKey(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SFAutoFillOneTimeCode.m"), 15, CFSTR("%s"), OUTLINED_FUNCTION_0_1());

  __break(1u);
}

- (void)initWithIMCoreDictionary:.cold.4()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getIMOneTimeCodeDisplayKey(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SFAutoFillOneTimeCode.m"), 17, CFSTR("%s"), OUTLINED_FUNCTION_0_1());

  __break(1u);
}

- (void)initWithIMCoreDictionary:.cold.5()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getIMOneTimeCodeHandleKey(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SFAutoFillOneTimeCode.m"), 20, CFSTR("%s"), OUTLINED_FUNCTION_0_1());

  __break(1u);
}

- (void)initWithIMCoreDictionary:.cold.6()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getIMOneTimeCodeMachineReadableCodeKey(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SFAutoFillOneTimeCode.m"), 16, CFSTR("%s"), OUTLINED_FUNCTION_0_1());

  __break(1u);
}

- (void)initWithIMCoreDictionary:.cold.7()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getIMOneTimeCodeDomainKey(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SFAutoFillOneTimeCode.m"), 21, CFSTR("%s"), OUTLINED_FUNCTION_0_1());

  __break(1u);
}

- (void)initWithIMCoreDictionary:.cold.8()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getIMOneTimeCodeEmbeddedDomainKey(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SFAutoFillOneTimeCode.m"), 23, CFSTR("%s"), OUTLINED_FUNCTION_0_1());

  __break(1u);
}

- (void)initWithIMCoreDictionary:.cold.9()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getIMOneTimeCodeDomainStrictMatchKey(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SFAutoFillOneTimeCode.m"), 22, CFSTR("%s"), OUTLINED_FUNCTION_0_1());

  __break(1u);
}

- (void)initWithIMCoreDictionary:.cold.10()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getIMOneTimeCodeEmbeddedDomainsKey(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SFAutoFillOneTimeCode.m"), 24, CFSTR("%s"), OUTLINED_FUNCTION_0_1());

  __break(1u);
}

@end
