@implementation SUCoreErrorAttributes

- (id)initForDomain:(id)a3 withCode:(int64_t)a4 ofCodeName:(id)a5 indicating:(int64_t)a6 ifKeyTrue:(id)a7 keyMatchTrueMap:(id)a8
{
  id v15;
  id v16;
  id v17;
  SUCoreErrorAttributes *v18;
  SUCoreErrorAttributes *v19;
  id v21;
  objc_super v22;

  v21 = a3;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)SUCoreErrorAttributes;
  v18 = -[SUCoreErrorAttributes init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_domain, a3);
    v19->_code = a4;
    objc_storeStrong((id *)&v19->_codeName, a5);
    v19->_indications = a6;
    objc_storeStrong((id *)&v19->_keyMatchTrue, a7);
    objc_storeStrong((id *)&v19->_keyMatchTrueMap, a8);
  }

  return v19;
}

- (id)description
{
  id v3;
  void *v4;
  int64_t v5;
  void *v6;
  int64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCoreErrorAttributes domain](self, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreErrorAttributes code](self, "code");
  -[SUCoreErrorAttributes codeName](self, "codeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SUCoreErrorAttributes indications](self, "indications");
  -[SUCoreErrorAttributes keyMatchTrue](self, "keyMatchTrue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[SUCoreErrorAttributes keyMatchTrue](self, "keyMatchTrue");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = CFSTR("NONE");
  }
  -[SUCoreErrorAttributes keyMatchTrueMap](self, "keyMatchTrueMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("DEFINED");
  if (!v10)
    v11 = CFSTR("NONE");
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("domain(%@),code(%d),codeName(%@),indications(0x%08llX),keyMatchTrue(%@),keyMatchTrueMap(%@)"), v4, v5, v6, v7, v9, v11);

  if (v8)
  return v12;
}

+ (id)nameForIndication:(int64_t)a3
{
  id result;

  if (a3 > 15)
  {
    if (a3 <= 63)
    {
      if (a3 == 16)
        return CFSTR("TATSUDeclinedAuthorization");
      if (a3 == 32)
        return CFSTR("PallasNoPMVMatchFound");
    }
    else
    {
      switch(a3)
      {
        case 64:
          return CFSTR("PallasNoBuildVersionMatchFound");
        case 128:
          return CFSTR("DownloadTimedOut");
        case 255:
          return CFSTR("All");
      }
    }
    return CFSTR("Unknown Error Indication");
  }
  else
  {
    result = CFSTR("None");
    switch(a3)
    {
      case 0:
        return result;
      case 1:
        result = CFSTR("NetworkRequired");
        break;
      case 2:
        result = CFSTR("FullReplacementRequired");
        break;
      case 4:
        result = CFSTR("FilesystemSpaceRequired");
        break;
      case 8:
        result = CFSTR("AlternateInstallerRecommended");
        break;
      default:
        return CFSTR("Unknown Error Indication");
    }
  }
  return result;
}

+ (id)descriptionForIndication:(int64_t)a3
{
  id result;

  if (a3 > 15)
  {
    if (a3 <= 63)
    {
      if (a3 == 16)
        return CFSTR("TATSU declined to authorize this user for this install.");
      if (a3 == 32)
        return CFSTR("Pallas returned no match found for requested PMV (HTTP 422).");
    }
    else
    {
      switch(a3)
      {
        case 64:
          return CFSTR("Pallas returned no match found for requested Build Version.");
        case 128:
          return CFSTR("Download has timedout.");
        case 255:
          return CFSTR("All possible error indications.");
      }
    }
    return CFSTR("Unknown Error Indication");
  }
  else
  {
    result = CFSTR("No indications associated with error attributes");
    switch(a3)
    {
      case 0:
        return result;
      case 1:
        result = CFSTR("Network access is required.");
        break;
      case 2:
        result = CFSTR("Full replacement is required [as opposed to incremental patch].");
        break;
      case 4:
        result = CFSTR("Additional filesystem space is required.");
        break;
      case 8:
        result = CFSTR("Current device configuration requires an alternate installer to perform the update.");
        break;
      default:
        return CFSTR("Unknown Error Indication");
    }
  }
  return result;
}

- (NSString)domain
{
  return self->_domain;
}

- (int64_t)code
{
  return self->_code;
}

- (NSString)codeName
{
  return self->_codeName;
}

- (int64_t)indications
{
  return self->_indications;
}

- (void)setIndications:(int64_t)a3
{
  self->_indications = a3;
}

- (NSString)keyMatchTrue
{
  return self->_keyMatchTrue;
}

- (void)setKeyMatchTrue:(id)a3
{
  objc_storeStrong((id *)&self->_keyMatchTrue, a3);
}

- (NSDictionary)keyMatchTrueMap
{
  return self->_keyMatchTrueMap;
}

- (void)setKeyMatchTrueMap:(id)a3
{
  objc_storeStrong((id *)&self->_keyMatchTrueMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyMatchTrueMap, 0);
  objc_storeStrong((id *)&self->_keyMatchTrue, 0);
  objc_storeStrong((id *)&self->_codeName, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
