@implementation WBSOfflineSearchRemoteDisablementSnapshot

- (BOOL)areOfflineSearchSuggestionsDisabledRemotelyForSearchProvider:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[NSDictionary safari_dictionaryForKey:](self->_disablementDictionary, "safari_dictionaryForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if ((objc_msgSend(v4, "safari_BOOLForKey:", CFSTR("OfflineSearchDisabled")) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(v5, "safari_dictionaryForKey:", CFSTR("DisabledSafariVersions"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[WBSOfflineSearchRemoteDisablementSnapshot _isCurrentSafariVersionDisabled:](self, "_isCurrentSafariVersionDisabled:", v7))
      {
        v6 = 1;
      }
      else
      {
        objc_msgSend(v5, "safari_arrayForKey:", CFSTR("DisabledLocales"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "safari_localeStringInOfflineSearchModelFormat");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v8, "containsObject:", v10);

      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (WBSOfflineSearchRemoteDisablementSnapshot)initWithSnapshotData:(id)a3 error:(id *)a4
{
  id v6;
  WBSOfflineSearchRemoteDisablementSnapshot *v7;
  uint64_t v8;
  NSDictionary *disablementDictionary;
  WBSOfflineSearchRemoteDisablementSnapshot *v10;
  NSObject *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WBSOfflineSearchRemoteDisablementSnapshot;
  v7 = -[WBSOfflineSearchRemoteDisablementSnapshot init](&v13, sel_init);
  if (!v7)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0C99D80], "safari_dictionaryWithPropertyListData:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  disablementDictionary = v7->_disablementDictionary;
  v7->_disablementDictionary = (NSDictionary *)v8;

  if (!v7->_disablementDictionary)
  {
    v11 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[WBSOfflineSearchRemoteDisablementSnapshot initWithSnapshotData:error:].cold.1(v11);
      if (a4)
        goto LABEL_6;
    }
    else if (a4)
    {
LABEL_6:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, 0);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  v10 = v7;
LABEL_9:

  return v10;
}

- (id)snapshotData
{
  return (id)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", self->_disablementDictionary, 200, 0, 0);
}

- (BOOL)_isCurrentSafariVersionDisabled:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  char v16;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_normalizedVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "safari_arrayForKey:", CFSTR("DisallowedSafariVersionsList"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "containsObject:", v5) & 1) != 0)
    {
      LOBYTE(v7) = 1;
    }
    else
    {
      objc_msgSend(v3, "safari_stringForKey:", CFSTR("DisabledBeforeVersionNumber"));
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = CFSTR("0");
      if (v8)
        v10 = (__CFString *)v8;
      v11 = v10;

      objc_msgSend(v3, "safari_stringForKey:", CFSTR("DisabledAfterVersionNumber"));
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v14 = CFSTR("9999999999");
      if (v12)
        v14 = (__CFString *)v12;
      v15 = v14;

      v16 = -[__CFString safari_isVersionStringGreaterThanVersionString:](v11, "safari_isVersionStringGreaterThanVersionString:", v5);
      if ((v16 & 1) != 0)
        LOBYTE(v7) = 1;
      else
        v7 = -[__CFString safari_isVersionStringGreaterThanOrEqualToVersionString:](v15, "safari_isVersionStringGreaterThanOrEqualToVersionString:", v5) ^ 1;

    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disablementDictionary, 0);
}

- (void)initWithSnapshotData:(os_log_t)log error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A3D90000, log, OS_LOG_TYPE_ERROR, "Failed to decode disablement dictionary", v1, 2u);
}

@end
