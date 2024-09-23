@implementation SHSheetRemoteConnectionContext

- (SHSheetRemoteConnectionContext)initWithSessionIdentifier:(id)a3
{
  id v4;
  SHSheetRemoteConnectionContext *v5;
  uint64_t v6;
  NSString *sessionIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHSheetRemoteConnectionContext;
  v5 = -[SHSheetRemoteConnectionContext init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v6;

  }
  return v5;
}

- (SHSheetRemoteConnectionContext)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SHSheetRemoteConnectionContext *v7;
  void *v8;
  uint64_t v9;
  _UIActivityDiscoveryContext *discoveryContext;
  void *v11;
  uint64_t v12;
  NSArray *assetIdentifiers;
  void *v14;
  uint64_t v15;
  NSArray *urlsBeingShared;
  void *v17;
  uint64_t v18;
  NSDictionary *sandboxExtensionsByfileURLPath;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSArray *peopleSuggestionBundleIds;
  void *v35;
  uint64_t v36;
  NSData *processedImageResultsData;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;

  v4 = a3;
  NSStringFromSelector(sel_sessionIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SHSheetRemoteConnectionContext initWithSessionIdentifier:](self, "initWithSessionIdentifier:", v6);

  if (v7)
  {
    NSStringFromSelector(sel_discoveryContext);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    discoveryContext = v7->_discoveryContext;
    v7->_discoveryContext = (_UIActivityDiscoveryContext *)v9;

    NSStringFromSelector(sel_assetIdentifiers);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    assetIdentifiers = v7->_assetIdentifiers;
    v7->_assetIdentifiers = (NSArray *)v12;

    NSStringFromSelector(sel_urlsBeingShared);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    urlsBeingShared = v7->_urlsBeingShared;
    v7->_urlsBeingShared = (NSArray *)v15;

    NSStringFromSelector(sel_sandboxExtensionsByfileURLPath);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    sandboxExtensionsByfileURLPath = v7->_sandboxExtensionsByfileURLPath;
    v7->_sandboxExtensionsByfileURLPath = (NSDictionary *)v18;

    NSStringFromSelector(sel_shouldSuggestFamilyMembers);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_shouldSuggestFamilyMembers = objc_msgSend(v21, "BOOLValue");

    NSStringFromSelector(sel_instantShareSheet);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_instantShareSheet = objc_msgSend(v23, "BOOLValue");

    NSStringFromSelector(sel_remoteShareSheet);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_remoteShareSheet = objc_msgSend(v25, "BOOLValue");

    NSStringFromSelector(sel_isSharePlayAvailable);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_isSharePlayAvailable = objc_msgSend(v27, "BOOLValue");

    NSStringFromSelector(sel_supportsCollaboration);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_supportsCollaboration = objc_msgSend(v29, "BOOLValue");

    NSStringFromSelector(sel_hideSuggestions);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_hideSuggestions = objc_msgSend(v31, "BOOLValue");

    NSStringFromSelector(sel_peopleSuggestionBundleIds);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v32);
    v33 = objc_claimAutoreleasedReturnValue();
    peopleSuggestionBundleIds = v7->_peopleSuggestionBundleIds;
    v7->_peopleSuggestionBundleIds = (NSArray *)v33;

    NSStringFromSelector(sel_processedImageResultsData);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v35);
    v36 = objc_claimAutoreleasedReturnValue();
    processedImageResultsData = v7->_processedImageResultsData;
    v7->_processedImageResultsData = (NSData *)v36;

    NSStringFromSelector(sel_peopleSuggestionsTimeout);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "doubleValue");
    v7->_peopleSuggestionsTimeout = v40;

    NSStringFromSelector(sel_xrRenderingMode);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_xrRenderingMode = objc_msgSend(v42, "unsignedIntValue");

  }
  return v7;
}

- (id)createContextDictionary
{
  void *v3;
  void *v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetRemoteConnectionContext sessionIdentifier](self, "sessionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sessionIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, v5);

  -[SHSheetRemoteConnectionContext discoveryContext](self, "discoveryContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_discoveryContext);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, v7);

  -[SHSheetRemoteConnectionContext assetIdentifiers](self, "assetIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_assetIdentifiers);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, v9);

  -[SHSheetRemoteConnectionContext urlsBeingShared](self, "urlsBeingShared");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_urlsBeingShared);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v11);

  -[SHSheetRemoteConnectionContext sandboxExtensionsByfileURLPath](self, "sandboxExtensionsByfileURLPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sandboxExtensionsByfileURLPath);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v13);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SHSheetRemoteConnectionContext shouldSuggestFamilyMembers](self, "shouldSuggestFamilyMembers"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_shouldSuggestFamilyMembers);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, v15);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SHSheetRemoteConnectionContext instantShareSheet](self, "instantShareSheet"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_instantShareSheet);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, v17);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SHSheetRemoteConnectionContext remoteShareSheet](self, "remoteShareSheet"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_remoteShareSheet);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, v19);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SHSheetRemoteConnectionContext isSharePlayAvailable](self, "isSharePlayAvailable"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isSharePlayAvailable);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, v21);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SHSheetRemoteConnectionContext supportsCollaboration](self, "supportsCollaboration"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_supportsCollaboration);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, v23);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SHSheetRemoteConnectionContext hideSuggestions](self, "hideSuggestions"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_hideSuggestions);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, v25);

  -[SHSheetRemoteConnectionContext peopleSuggestionBundleIds](self, "peopleSuggestionBundleIds");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_peopleSuggestionBundleIds);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, v27);

  -[SHSheetRemoteConnectionContext processedImageResultsData](self, "processedImageResultsData");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_processedImageResultsData);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, v29);

  v30 = (void *)MEMORY[0x1E0CB37E8];
  -[SHSheetRemoteConnectionContext peopleSuggestionsTimeout](self, "peopleSuggestionsTimeout");
  objc_msgSend(v30, "numberWithDouble:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_peopleSuggestionsTimeout);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, v32);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SHSheetRemoteConnectionContext xrRenderingMode](self, "xrRenderingMode"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_xrRenderingMode);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, v34);

  return v3;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (_UIActivityDiscoveryContext)discoveryContext
{
  return self->_discoveryContext;
}

- (void)setDiscoveryContext:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryContext, a3);
}

- (NSArray)assetIdentifiers
{
  return self->_assetIdentifiers;
}

- (void)setAssetIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)urlsBeingShared
{
  return self->_urlsBeingShared;
}

- (void)setUrlsBeingShared:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)sandboxExtensionsByfileURLPath
{
  return self->_sandboxExtensionsByfileURLPath;
}

- (void)setSandboxExtensionsByfileURLPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)shouldSuggestFamilyMembers
{
  return self->_shouldSuggestFamilyMembers;
}

- (void)setShouldSuggestFamilyMembers:(BOOL)a3
{
  self->_shouldSuggestFamilyMembers = a3;
}

- (BOOL)isSharePlayAvailable
{
  return self->_isSharePlayAvailable;
}

- (void)setIsSharePlayAvailable:(BOOL)a3
{
  self->_isSharePlayAvailable = a3;
}

- (BOOL)supportsCollaboration
{
  return self->_supportsCollaboration;
}

- (void)setSupportsCollaboration:(BOOL)a3
{
  self->_supportsCollaboration = a3;
}

- (BOOL)hideSuggestions
{
  return self->_hideSuggestions;
}

- (void)setHideSuggestions:(BOOL)a3
{
  self->_hideSuggestions = a3;
}

- (NSArray)peopleSuggestionBundleIds
{
  return self->_peopleSuggestionBundleIds;
}

- (void)setPeopleSuggestionBundleIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSData)processedImageResultsData
{
  return self->_processedImageResultsData;
}

- (void)setProcessedImageResultsData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (double)peopleSuggestionsTimeout
{
  return self->_peopleSuggestionsTimeout;
}

- (void)setPeopleSuggestionsTimeout:(double)a3
{
  self->_peopleSuggestionsTimeout = a3;
}

- (unint64_t)xrRenderingMode
{
  return self->_xrRenderingMode;
}

- (void)setXrRenderingMode:(unint64_t)a3
{
  self->_xrRenderingMode = a3;
}

- (BOOL)instantShareSheet
{
  return self->_instantShareSheet;
}

- (void)setInstantShareSheet:(BOOL)a3
{
  self->_instantShareSheet = a3;
}

- (BOOL)remoteShareSheet
{
  return self->_remoteShareSheet;
}

- (void)setRemoteShareSheet:(BOOL)a3
{
  self->_remoteShareSheet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedImageResultsData, 0);
  objc_storeStrong((id *)&self->_peopleSuggestionBundleIds, 0);
  objc_storeStrong((id *)&self->_sandboxExtensionsByfileURLPath, 0);
  objc_storeStrong((id *)&self->_urlsBeingShared, 0);
  objc_storeStrong((id *)&self->_assetIdentifiers, 0);
  objc_storeStrong((id *)&self->_discoveryContext, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
