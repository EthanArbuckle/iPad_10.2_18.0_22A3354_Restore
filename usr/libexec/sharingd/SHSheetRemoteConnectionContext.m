@implementation SHSheetRemoteConnectionContext

- (SHSheetRemoteConnectionContext)initWithSessionIdentifier:(id)a3
{
  id v4;
  SHSheetRemoteConnectionContext *v5;
  NSString *v6;
  NSString *sessionIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHSheetRemoteConnectionContext;
  v5 = -[SHSheetRemoteConnectionContext init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)objc_msgSend(v4, "copy");
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = v6;

  }
  return v5;
}

- (SHSheetRemoteConnectionContext)initWithDictionary:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  void *v7;
  SHSheetRemoteConnectionContext *v8;
  NSString *v9;
  void *v10;
  uint64_t v11;
  _UIActivityDiscoveryContext *discoveryContext;
  NSString *v13;
  void *v14;
  uint64_t v15;
  NSArray *assetIdentifiers;
  NSString *v17;
  void *v18;
  uint64_t v19;
  NSArray *urlsBeingShared;
  NSString *v21;
  void *v22;
  uint64_t v23;
  NSDictionary *sandboxExtensionsByfileURLPath;
  NSString *v25;
  void *v26;
  void *v27;
  NSString *v28;
  void *v29;
  void *v30;
  NSString *v31;
  void *v32;
  void *v33;
  NSString *v34;
  void *v35;
  void *v36;
  NSString *v37;
  void *v38;
  void *v39;
  NSString *v40;
  void *v41;
  void *v42;
  NSString *v43;
  void *v44;
  uint64_t v45;
  NSArray *peopleSuggestionBundleIds;
  NSString *v47;
  void *v48;
  uint64_t v49;
  NSData *processedImageResultsData;
  NSString *v51;
  void *v52;
  void *v53;
  double v54;
  NSString *v55;
  void *v56;
  void *v57;

  v4 = a3;
  v5 = NSStringFromSelector("sessionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v6));
  v8 = -[SHSheetRemoteConnectionContext initWithSessionIdentifier:](self, "initWithSessionIdentifier:", v7);

  if (v8)
  {
    v9 = NSStringFromSelector("discoveryContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v10));
    discoveryContext = v8->_discoveryContext;
    v8->_discoveryContext = (_UIActivityDiscoveryContext *)v11;

    v13 = NSStringFromSelector("assetIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v14));
    assetIdentifiers = v8->_assetIdentifiers;
    v8->_assetIdentifiers = (NSArray *)v15;

    v17 = NSStringFromSelector("urlsBeingShared");
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v18));
    urlsBeingShared = v8->_urlsBeingShared;
    v8->_urlsBeingShared = (NSArray *)v19;

    v21 = NSStringFromSelector("sandboxExtensionsByfileURLPath");
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v22));
    sandboxExtensionsByfileURLPath = v8->_sandboxExtensionsByfileURLPath;
    v8->_sandboxExtensionsByfileURLPath = (NSDictionary *)v23;

    v25 = NSStringFromSelector("shouldSuggestFamilyMembers");
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v26));
    v8->_shouldSuggestFamilyMembers = objc_msgSend(v27, "BOOLValue");

    v28 = NSStringFromSelector("instantShareSheet");
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v29));
    v8->_instantShareSheet = objc_msgSend(v30, "BOOLValue");

    v31 = NSStringFromSelector("remoteShareSheet");
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v32));
    v8->_remoteShareSheet = objc_msgSend(v33, "BOOLValue");

    v34 = NSStringFromSelector("isSharePlayAvailable");
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v35));
    v8->_isSharePlayAvailable = objc_msgSend(v36, "BOOLValue");

    v37 = NSStringFromSelector("supportsCollaboration");
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v38));
    v8->_supportsCollaboration = objc_msgSend(v39, "BOOLValue");

    v40 = NSStringFromSelector("hideSuggestions");
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v41));
    v8->_hideSuggestions = objc_msgSend(v42, "BOOLValue");

    v43 = NSStringFromSelector("peopleSuggestionBundleIds");
    v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v44));
    peopleSuggestionBundleIds = v8->_peopleSuggestionBundleIds;
    v8->_peopleSuggestionBundleIds = (NSArray *)v45;

    v47 = NSStringFromSelector("processedImageResultsData");
    v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
    v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v48));
    processedImageResultsData = v8->_processedImageResultsData;
    v8->_processedImageResultsData = (NSData *)v49;

    v51 = NSStringFromSelector("peopleSuggestionsTimeout");
    v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v52));
    objc_msgSend(v53, "doubleValue");
    v8->_peopleSuggestionsTimeout = v54;

    v55 = NSStringFromSelector("xrRenderingMode");
    v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v56));
    v8->_xrRenderingMode = objc_msgSend(v57, "unsignedIntValue");

  }
  return v8;
}

- (id)createContextDictionary
{
  void *v3;
  void *v4;
  NSString *v5;
  void *v6;
  void *v7;
  NSString *v8;
  void *v9;
  void *v10;
  NSString *v11;
  void *v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  NSString *v17;
  void *v18;
  void *v19;
  NSString *v20;
  void *v21;
  void *v22;
  NSString *v23;
  void *v24;
  void *v25;
  NSString *v26;
  void *v27;
  void *v28;
  NSString *v29;
  void *v30;
  void *v31;
  NSString *v32;
  void *v33;
  void *v34;
  NSString *v35;
  void *v36;
  void *v37;
  NSString *v38;
  void *v39;
  void *v40;
  NSString *v41;
  void *v42;
  void *v43;
  NSString *v44;
  void *v45;
  void *v46;
  NSString *v47;
  void *v48;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHSheetRemoteConnectionContext sessionIdentifier](self, "sessionIdentifier"));
  v5 = NSStringFromSelector("sessionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHSheetRemoteConnectionContext discoveryContext](self, "discoveryContext"));
  v8 = NSStringFromSelector("discoveryContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHSheetRemoteConnectionContext assetIdentifiers](self, "assetIdentifiers"));
  v11 = NSStringFromSelector("assetIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SHSheetRemoteConnectionContext urlsBeingShared](self, "urlsBeingShared"));
  v14 = NSStringFromSelector("urlsBeingShared");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SHSheetRemoteConnectionContext sandboxExtensionsByfileURLPath](self, "sandboxExtensionsByfileURLPath"));
  v17 = NSStringFromSelector("sandboxExtensionsByfileURLPath");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SHSheetRemoteConnectionContext shouldSuggestFamilyMembers](self, "shouldSuggestFamilyMembers")));
  v20 = NSStringFromSelector("shouldSuggestFamilyMembers");
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SHSheetRemoteConnectionContext instantShareSheet](self, "instantShareSheet")));
  v23 = NSStringFromSelector("instantShareSheet");
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SHSheetRemoteConnectionContext remoteShareSheet](self, "remoteShareSheet")));
  v26 = NSStringFromSelector("remoteShareSheet");
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SHSheetRemoteConnectionContext isSharePlayAvailable](self, "isSharePlayAvailable")));
  v29 = NSStringFromSelector("isSharePlayAvailable");
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SHSheetRemoteConnectionContext supportsCollaboration](self, "supportsCollaboration")));
  v32 = NSStringFromSelector("supportsCollaboration");
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SHSheetRemoteConnectionContext hideSuggestions](self, "hideSuggestions")));
  v35 = NSStringFromSelector("hideSuggestions");
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[SHSheetRemoteConnectionContext peopleSuggestionBundleIds](self, "peopleSuggestionBundleIds"));
  v38 = NSStringFromSelector("peopleSuggestionBundleIds");
  v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, v39);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[SHSheetRemoteConnectionContext processedImageResultsData](self, "processedImageResultsData"));
  v41 = NSStringFromSelector("processedImageResultsData");
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, v42);

  -[SHSheetRemoteConnectionContext peopleSuggestionsTimeout](self, "peopleSuggestionsTimeout");
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v44 = NSStringFromSelector("peopleSuggestionsTimeout");
  v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, v45);

  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[SHSheetRemoteConnectionContext xrRenderingMode](self, "xrRenderingMode")));
  v47 = NSStringFromSelector("xrRenderingMode");
  v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, v48);

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
