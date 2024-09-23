@implementation SHSheetUserDefaultsContext

- (SHSheetUserDefaultsContext)initWithApplicationActivityTypes:(id)a3 activitiesByUUID:(id)a4 favoritesProxies:(id)a5 suggestionProxies:(id)a6 orderedUUIDs:(id)a7 excludedActivityTypes:(id)a8 activityCategory:(int64_t)a9 isPresentedModally:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  SHSheetUserDefaultsContext *v22;
  uint64_t v23;
  NSArray *applicationActivityTypes;
  uint64_t v25;
  NSDictionary *activitiesByUUID;
  uint64_t v27;
  NSArray *favoritesProxies;
  uint64_t v29;
  NSArray *suggestionProxies;
  uint64_t v31;
  NSArray *orderedUUIDs;
  uint64_t v33;
  NSArray *excludedActivityTypes;
  objc_super v36;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v36.receiver = self;
  v36.super_class = (Class)SHSheetUserDefaultsContext;
  v22 = -[SHSheetUserDefaultsContext init](&v36, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v16, "copy");
    applicationActivityTypes = v22->_applicationActivityTypes;
    v22->_applicationActivityTypes = (NSArray *)v23;

    v25 = objc_msgSend(v17, "copy");
    activitiesByUUID = v22->_activitiesByUUID;
    v22->_activitiesByUUID = (NSDictionary *)v25;

    v27 = objc_msgSend(v18, "copy");
    favoritesProxies = v22->_favoritesProxies;
    v22->_favoritesProxies = (NSArray *)v27;

    v29 = objc_msgSend(v19, "copy");
    suggestionProxies = v22->_suggestionProxies;
    v22->_suggestionProxies = (NSArray *)v29;

    v31 = objc_msgSend(v20, "copy");
    orderedUUIDs = v22->_orderedUUIDs;
    v22->_orderedUUIDs = (NSArray *)v31;

    v33 = objc_msgSend(v21, "copy");
    excludedActivityTypes = v22->_excludedActivityTypes;
    v22->_excludedActivityTypes = (NSArray *)v33;

    v22->_category = a9;
    v22->_isPresentedModally = a10;
  }

  return v22;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)SHSheetUserDefaultsContext;
  -[SHSheetUserDefaultsContext description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetUserDefaultsContext applicationActivityTypes](self, "applicationActivityTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetUserDefaultsContext activitiesByUUID](self, "activitiesByUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetUserDefaultsContext favoritesProxies](self, "favoritesProxies");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetUserDefaultsContext suggestionProxies](self, "suggestionProxies");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetUserDefaultsContext orderedUUIDs](self, "orderedUUIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ applicationActivityTypes:%@ activitiesByUUID:%@ favoritesProxies:%@ suggestionProxies:%@ orderedUUIDs:%@ category:%ld>"), v4, v5, v6, v7, v8, v9, -[SHSheetUserDefaultsContext category](self, "category"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSArray)applicationActivityTypes
{
  return self->_applicationActivityTypes;
}

- (NSDictionary)activitiesByUUID
{
  return self->_activitiesByUUID;
}

- (NSArray)favoritesProxies
{
  return self->_favoritesProxies;
}

- (NSArray)suggestionProxies
{
  return self->_suggestionProxies;
}

- (NSArray)orderedUUIDs
{
  return self->_orderedUUIDs;
}

- (NSArray)excludedActivityTypes
{
  return self->_excludedActivityTypes;
}

- (int64_t)category
{
  return self->_category;
}

- (BOOL)isPresentedModally
{
  return self->_isPresentedModally;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong((id *)&self->_orderedUUIDs, 0);
  objc_storeStrong((id *)&self->_suggestionProxies, 0);
  objc_storeStrong((id *)&self->_favoritesProxies, 0);
  objc_storeStrong((id *)&self->_activitiesByUUID, 0);
  objc_storeStrong((id *)&self->_applicationActivityTypes, 0);
}

@end
