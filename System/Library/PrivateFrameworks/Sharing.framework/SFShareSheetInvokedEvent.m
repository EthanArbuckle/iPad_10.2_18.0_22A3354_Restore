@implementation SFShareSheetInvokedEvent

+ (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.sharing.sharesheetInvocation");
}

- (NSDictionary)eventPayload
{
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[9];
  _QWORD v23[11];

  v23[9] = *MEMORY[0x1E0C80C00];
  v19 = objc_alloc(MEMORY[0x1E0C99E08]);
  v22[0] = CFSTR("sourceApplicationBundleID");
  -[SFShareSheetInvokedEvent appBundleId](self, "appBundleId");
  v3 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v3;
  if (v3)
    v4 = (const __CFString *)v3;
  else
    v4 = &stru_1E483B8E8;
  v23[0] = v4;
  v22[1] = CFSTR("numberOfSuggestions");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SFShareSheetInvokedEvent numberOfSuggestions](self, "numberOfSuggestions"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v20;
  v22[2] = CFSTR("suggestionsHash");
  -[SFShareSheetInvokedEvent suggestionsHash](self, "suggestionsHash");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = &stru_1E483B8E8;
  v23[2] = v7;
  v22[3] = CFSTR("daemonPID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SFShareSheetInvokedEvent daemonPID](self, "daemonPID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v8;
  v22[4] = CFSTR("durationInMS");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SFShareSheetInvokedEvent durationInMS](self, "durationInMS"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v9;
  v22[5] = CFSTR("isDarkMode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SFShareSheetInvokedEvent isDarkMode](self, "isDarkMode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v10;
  v22[6] = CFSTR("cacheFileCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SFShareSheetInvokedEvent cacheFileCount](self, "cacheFileCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v11;
  v22[7] = CFSTR("totalCacheAccessCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SFShareSheetInvokedEvent totalCacheAccessCount](self, "totalCacheAccessCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[7] = v12;
  v22[8] = CFSTR("isCollaborative");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SFShareSheetInvokedEvent isCollaborative](self, "isCollaborative"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[8] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v19, "initWithDictionary:", v14);

  -[SFShareSheetInvokedEvent cacheAccessInfo](self, "cacheAccessInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addEntriesFromDictionary:", v16);

  v17 = (void *)objc_msgSend(v15, "copy");
  return (NSDictionary *)v17;
}

- (void)submitEvent
{
  void *v3;
  id v4;

  +[SFShareSheetInvokedEvent eventName](SFShareSheetInvokedEvent, "eventName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SFShareSheetInvokedEvent eventPayload](self, "eventPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SFMetricsLog(v4, v3);

}

- (int)daemonPID
{
  return self->_daemonPID;
}

- (void)setDaemonPID:(int)a3
{
  self->_daemonPID = a3;
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)suggestionsHash
{
  return self->_suggestionsHash;
}

- (void)setSuggestionsHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)numberOfSuggestions
{
  return self->_numberOfSuggestions;
}

- (void)setNumberOfSuggestions:(int64_t)a3
{
  self->_numberOfSuggestions = a3;
}

- (int64_t)durationInMS
{
  return self->_durationInMS;
}

- (void)setDurationInMS:(int64_t)a3
{
  self->_durationInMS = a3;
}

- (int64_t)cacheFileCount
{
  return self->_cacheFileCount;
}

- (void)setCacheFileCount:(int64_t)a3
{
  self->_cacheFileCount = a3;
}

- (int64_t)totalCacheAccessCount
{
  return self->_totalCacheAccessCount;
}

- (void)setTotalCacheAccessCount:(int64_t)a3
{
  self->_totalCacheAccessCount = a3;
}

- (BOOL)isDarkMode
{
  return self->_isDarkMode;
}

- (void)setIsDarkMode:(BOOL)a3
{
  self->_isDarkMode = a3;
}

- (BOOL)isCollaborative
{
  return self->_isCollaborative;
}

- (void)setIsCollaborative:(BOOL)a3
{
  self->_isCollaborative = a3;
}

- (NSDictionary)cacheAccessInfo
{
  return self->_cacheAccessInfo;
}

- (void)setCacheAccessInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheAccessInfo, 0);
  objc_storeStrong((id *)&self->_suggestionsHash, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
}

@end
