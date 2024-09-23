@implementation SHSheetContentDataSourceChangeRequest

+ (id)changeRequestForPeopleProxies:(id)a3 shareProxies:(id)a4 actionProxies:(id)a5 nearbyCountSlotID:(unsigned int)a6 activitiesByUUID:(id)a7
{
  uint64_t v7;
  id v11;
  id v12;
  id v13;
  id v14;
  SHSheetContentDataSourceChangeRequest *v15;

  v7 = *(_QWORD *)&a6;
  v11 = a7;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = objc_alloc_init(SHSheetContentDataSourceChangeRequest);
  -[SHSheetContentDataSourceChangeRequest setPeopleProxies:](v15, "setPeopleProxies:", v14);

  -[SHSheetContentDataSourceChangeRequest setShareProxies:](v15, "setShareProxies:", v13);
  -[SHSheetContentDataSourceChangeRequest setActionProxies:](v15, "setActionProxies:", v12);

  -[SHSheetContentDataSourceChangeRequest setActivitiesByUUID:](v15, "setActivitiesByUUID:", v11);
  -[SHSheetContentDataSourceChangeRequest setNearbyCountSlotID:](v15, "setNearbyCountSlotID:", v7);
  return v15;
}

+ (id)changeRequestFromState:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "peopleProxies");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shareProxies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionProxies");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "nearbyCountSlotID");
  objc_msgSend(v3, "activitiesByUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SHSheetContentDataSourceChangeRequest changeRequestForPeopleProxies:shareProxies:actionProxies:nearbyCountSlotID:activitiesByUUID:](SHSheetContentDataSourceChangeRequest, "changeRequestForPeopleProxies:shareProxies:actionProxies:nearbyCountSlotID:activitiesByUUID:", v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setState:", v3);
  return v9;
}

- (NSArray)peopleProxies
{
  return self->_peopleProxies;
}

- (void)setPeopleProxies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)shareProxies
{
  return self->_shareProxies;
}

- (void)setShareProxies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)actionProxies
{
  return self->_actionProxies;
}

- (void)setActionProxies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)activitiesByUUID
{
  return self->_activitiesByUUID;
}

- (void)setActivitiesByUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unsigned)nearbyCountSlotID
{
  return self->_nearbyCountSlotID;
}

- (void)setNearbyCountSlotID:(unsigned int)a3
{
  self->_nearbyCountSlotID = a3;
}

- (int64_t)excludeSectionTypes
{
  return self->_excludeSectionTypes;
}

- (void)setExcludeSectionTypes:(int64_t)a3
{
  self->_excludeSectionTypes = a3;
}

- (BOOL)forceReload
{
  return self->_forceReload;
}

- (void)setForceReload:(BOOL)a3
{
  self->_forceReload = a3;
}

- (BOOL)animated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (SHSheetContentDataSourceState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_activitiesByUUID, 0);
  objc_storeStrong((id *)&self->_actionProxies, 0);
  objc_storeStrong((id *)&self->_shareProxies, 0);
  objc_storeStrong((id *)&self->_peopleProxies, 0);
}

@end
