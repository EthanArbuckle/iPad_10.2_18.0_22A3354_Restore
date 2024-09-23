@implementation SHSheetContentDataSourceState

- (void)logDiagnosticProperties
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  unsigned int v41;
  NSObject *v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v44 = 138412290;
    v45 = objc_opt_class();
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "<START %@>", (uint8_t *)&v44, 0xCu);
  }

  -[SHSheetContentDataSourceState peopleIdentifiers](self, "peopleIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    share_sheet_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[SHSheetContentDataSourceState peopleIdentifiers](self, "peopleIdentifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 138412290;
      v45 = (uint64_t)v7;
      _os_log_impl(&dword_19E419000, v6, OS_LOG_TYPE_DEFAULT, "peopleIdentifiers%@", (uint8_t *)&v44, 0xCu);

    }
  }
  -[SHSheetContentDataSourceState shareIdentifiers](self, "shareIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    share_sheet_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[SHSheetContentDataSourceState shareIdentifiers](self, "shareIdentifiers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 138412290;
      v45 = (uint64_t)v11;
      _os_log_impl(&dword_19E419000, v10, OS_LOG_TYPE_DEFAULT, "shareIdentifiers:%@", (uint8_t *)&v44, 0xCu);

    }
  }
  -[SHSheetContentDataSourceState heroActionIdentifiers](self, "heroActionIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    share_sheet_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[SHSheetContentDataSourceState heroActionIdentifiers](self, "heroActionIdentifiers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 138412290;
      v45 = (uint64_t)v15;
      _os_log_impl(&dword_19E419000, v14, OS_LOG_TYPE_DEFAULT, "heroActionIdentifiers:%@", (uint8_t *)&v44, 0xCu);

    }
  }
  -[SHSheetContentDataSourceState informationalActionIdentifiers](self, "informationalActionIdentifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    share_sheet_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      -[SHSheetContentDataSourceState informationalActionIdentifiers](self, "informationalActionIdentifiers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 138412290;
      v45 = (uint64_t)v19;
      _os_log_impl(&dword_19E419000, v18, OS_LOG_TYPE_DEFAULT, "informationalActionIdentifiers:%@", (uint8_t *)&v44, 0xCu);

    }
  }
  -[SHSheetContentDataSourceState favoriteActionIdentifiers](self, "favoriteActionIdentifiers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21)
  {
    share_sheet_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      -[SHSheetContentDataSourceState favoriteActionIdentifiers](self, "favoriteActionIdentifiers");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 138412290;
      v45 = (uint64_t)v23;
      _os_log_impl(&dword_19E419000, v22, OS_LOG_TYPE_DEFAULT, "favoriteActionIdentifiers:%@", (uint8_t *)&v44, 0xCu);

    }
  }
  -[SHSheetContentDataSourceState systemActionIdentifiers](self, "systemActionIdentifiers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (v25)
  {
    share_sheet_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      -[SHSheetContentDataSourceState systemActionIdentifiers](self, "systemActionIdentifiers");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 138412290;
      v45 = (uint64_t)v27;
      _os_log_impl(&dword_19E419000, v26, OS_LOG_TYPE_DEFAULT, "systemActionIdentifiers:%@", (uint8_t *)&v44, 0xCu);

    }
  }
  -[SHSheetContentDataSourceState extensionActionIdentifiers](self, "extensionActionIdentifiers");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "count");

  if (v29)
  {
    share_sheet_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      -[SHSheetContentDataSourceState extensionActionIdentifiers](self, "extensionActionIdentifiers");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 138412290;
      v45 = (uint64_t)v31;
      _os_log_impl(&dword_19E419000, v30, OS_LOG_TYPE_DEFAULT, "extensionActionIdentifiers:%@", (uint8_t *)&v44, 0xCu);

    }
  }
  -[SHSheetContentDataSourceState customSectionIdentifiers](self, "customSectionIdentifiers");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "count");

  if (v33)
  {
    share_sheet_log();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      -[SHSheetContentDataSourceState customSectionIdentifiers](self, "customSectionIdentifiers");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 138412290;
      v45 = (uint64_t)v35;
      _os_log_impl(&dword_19E419000, v34, OS_LOG_TYPE_DEFAULT, "customSectionIdentifiers:%@", (uint8_t *)&v44, 0xCu);

    }
  }
  -[SHSheetContentDataSourceState activitiesByUUID](self, "activitiesByUUID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "count");

  if (v37)
  {
    share_sheet_log();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      -[SHSheetContentDataSourceState activitiesByUUID](self, "activitiesByUUID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 138412290;
      v45 = (uint64_t)v39;
      _os_log_impl(&dword_19E419000, v38, OS_LOG_TYPE_DEFAULT, "activitiesByUUID:%@", (uint8_t *)&v44, 0xCu);

    }
  }
  if (-[SHSheetContentDataSourceState nearbyCountSlotID](self, "nearbyCountSlotID"))
  {
    share_sheet_log();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      v41 = -[SHSheetContentDataSourceState nearbyCountSlotID](self, "nearbyCountSlotID");
      v44 = 67109120;
      LODWORD(v45) = v41;
      _os_log_impl(&dword_19E419000, v40, OS_LOG_TYPE_DEFAULT, "nearbyCountSlotID:%u", (uint8_t *)&v44, 8u);
    }

  }
  share_sheet_log();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    v43 = objc_opt_class();
    v44 = 138412290;
    v45 = v43;
    _os_log_impl(&dword_19E419000, v42, OS_LOG_TYPE_DEFAULT, "<END %@>", (uint8_t *)&v44, 0xCu);
  }

}

- (UIAirDropNode)airDropProxy
{
  return self->_airDropProxy;
}

- (void)setAirDropProxy:(id)a3
{
  objc_storeStrong((id *)&self->_airDropProxy, a3);
}

- (NSArray)peopleProxies
{
  return self->_peopleProxies;
}

- (void)setPeopleProxies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)peopleProxyByUUID
{
  return self->_peopleProxyByUUID;
}

- (void)setPeopleProxyByUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)peopleIdentifiers
{
  return self->_peopleIdentifiers;
}

- (void)setPeopleIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)shareProxies
{
  return self->_shareProxies;
}

- (void)setShareProxies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDictionary)shareProxyByUUID
{
  return self->_shareProxyByUUID;
}

- (void)setShareProxyByUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)shareIdentifiers
{
  return self->_shareIdentifiers;
}

- (void)setShareIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)actionProxies
{
  return self->_actionProxies;
}

- (void)setActionProxies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDictionary)actionProxyByUUID
{
  return self->_actionProxyByUUID;
}

- (void)setActionProxyByUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)heroActionIdentifiers
{
  return self->_heroActionIdentifiers;
}

- (void)setHeroActionIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)informationalActionIdentifiers
{
  return self->_informationalActionIdentifiers;
}

- (void)setInformationalActionIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)favoriteActionIdentifiers
{
  return self->_favoriteActionIdentifiers;
}

- (void)setFavoriteActionIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)systemActionIdentifiers
{
  return self->_systemActionIdentifiers;
}

- (void)setSystemActionIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)extensionActionIdentifiers
{
  return self->_extensionActionIdentifiers;
}

- (void)setExtensionActionIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSDictionary)customActionIdentifiersByCustomSectionIdentifier
{
  return self->_customActionIdentifiersByCustomSectionIdentifier;
}

- (void)setCustomActionIdentifiersByCustomSectionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSOrderedSet)customSectionIdentifiers
{
  return self->_customSectionIdentifiers;
}

- (void)setCustomSectionIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSDictionary)activitiesByUUID
{
  return self->_activitiesByUUID;
}

- (void)setActivitiesByUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (unsigned)nearbyCountSlotID
{
  return self->_nearbyCountSlotID;
}

- (void)setNearbyCountSlotID:(unsigned int)a3
{
  self->_nearbyCountSlotID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activitiesByUUID, 0);
  objc_storeStrong((id *)&self->_customSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_customActionIdentifiersByCustomSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionActionIdentifiers, 0);
  objc_storeStrong((id *)&self->_systemActionIdentifiers, 0);
  objc_storeStrong((id *)&self->_favoriteActionIdentifiers, 0);
  objc_storeStrong((id *)&self->_informationalActionIdentifiers, 0);
  objc_storeStrong((id *)&self->_heroActionIdentifiers, 0);
  objc_storeStrong((id *)&self->_actionProxyByUUID, 0);
  objc_storeStrong((id *)&self->_actionProxies, 0);
  objc_storeStrong((id *)&self->_shareIdentifiers, 0);
  objc_storeStrong((id *)&self->_shareProxyByUUID, 0);
  objc_storeStrong((id *)&self->_shareProxies, 0);
  objc_storeStrong((id *)&self->_peopleIdentifiers, 0);
  objc_storeStrong((id *)&self->_peopleProxyByUUID, 0);
  objc_storeStrong((id *)&self->_peopleProxies, 0);
  objc_storeStrong((id *)&self->_airDropProxy, 0);
}

@end
