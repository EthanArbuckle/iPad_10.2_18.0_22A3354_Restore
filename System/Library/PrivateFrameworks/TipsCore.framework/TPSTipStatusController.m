@implementation TPSTipStatusController

- (id)_tipStatusForIdentifier:(id)a3 addIfMissing:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  TPSTipStatusController *v7;
  uint64_t v8;
  TPSTipStatus *v9;

  v4 = a4;
  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  -[NSMutableDictionary objectForKeyedSubscript:](v7->_identifierToTipStatusMap, "objectForKeyedSubscript:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (TPSTipStatus *)v8;
  if (v4 && !v8)
  {
    if (objc_msgSend(v6, "length"))
    {
      v9 = -[TPSTipStatus initWithIdentifier:]([TPSTipStatus alloc], "initWithIdentifier:", v6);
      if (v9)
        -[NSMutableDictionary setObject:forKeyedSubscript:](v7->_identifierToTipStatusMap, "setObject:forKeyedSubscript:", v9, v6);
    }
    else
    {
      v9 = 0;
    }
  }
  objc_sync_exit(v7);

  return v9;
}

void __59__TPSTipStatusController_statusesForCorrelationIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "correlationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    v6 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v5, "addObject:", v6);

  }
}

- (id)statusForIdentifier:(id)a3
{
  return -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](self, "_tipStatusForIdentifier:addIfMissing:", a3, 0);
}

- (BOOL)isTipAppDisplayEligibleForIdentifier:(id)a3
{
  id v4;
  TPSTipStatusController *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](v5, "_tipStatusForIdentifier:addIfMissing:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6
    && objc_msgSend(v6, "displayType") != 2
    && objc_msgSend(v7, "isPreconditionMatched")
    && (objc_msgSend(v7, "isUserKnew") & 1) == 0)
  {
    objc_msgSend(v7, "hintEligibleDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v8 = 1;
    }
    else
    {
      objc_msgSend(v7, "hintDisplayedDates");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "count"))
      {
        v8 = 1;
      }
      else
      {
        objc_msgSend(v7, "hintDismissalDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v8 = 1;
        }
        else
        {
          objc_msgSend(v7, "contentViewedDate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v13 != 0;

        }
      }

    }
  }
  else
  {
    v8 = 0;
  }

  objc_sync_exit(v5);
  return v8;
}

- (BOOL)isContentNeverVisibleForIdentifier:(id)a3
{
  id v4;
  TPSTipStatusController *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](v5, "_tipStatusForIdentifier:addIfMissing:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "hintDisplayedDates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      LOBYTE(v9) = 0;
    }
    else
    {
      objc_msgSend(v7, "hintDismissalDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        LOBYTE(v9) = 0;
      }
      else
      {
        objc_msgSend(v7, "contentViewedDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          LOBYTE(v9) = 0;
        }
        else
        {
          objc_msgSend(v7, "desiredOutcomePerformedDates");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "count"))
            LOBYTE(v9) = 0;
          else
            v9 = objc_msgSend(v7, "isExpired") ^ 1;

        }
      }

    }
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  objc_sync_exit(v5);
  return v9;
}

- (void)syncWithIdentifiers:(id)a3
{
  TPSTipStatusController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (objc_msgSend(v9, "count"))
  {
    v5 = (void *)MEMORY[0x1E0C99E20];
    -[NSMutableDictionary allKeys](v4->_identifierToTipStatusMap, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "minusSet:", v9);
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSTipStatusController updatePreconditionMatchedForIdentifiers:value:](v4, "updatePreconditionMatchedForIdentifiers:value:", v8, 0);

  }
  objc_sync_exit(v4);

}

- (void)updatePreconditionMatchedForIdentifiers:(id)a3 value:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[TPSTipStatusController updatePreconditionMatchedForIdentifier:value:](self, "updatePreconditionMatchedForIdentifier:value:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), v4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)updateLastUsedVersionForIdentifier:(id)a3 value:(id)a4
{
  id v6;
  TPSTipStatusController *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](v7, "_tipStatusForIdentifier:addIfMissing:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastUsedVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", v6);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(v8, "setLastUsedVersion:", v6);
    v7->_isDirty = 1;
  }

  objc_sync_exit(v7);
}

- (void)updateVariantIdentifierForIdentifier:(id)a3 value:(id)a4
{
  id v6;
  TPSTipStatusController *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](v7, "_tipStatusForIdentifier:addIfMissing:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setVariantIdentifier:", v6);
  if (!v7->_isDirty && v8)
    v7->_isDirty = 1;

  objc_sync_exit(v7);
}

- (void)updateCorrelationIdentifierForIdentifier:(id)a3 value:(id)a4
{
  id v6;
  TPSTipStatusController *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](v7, "_tipStatusForIdentifier:addIfMissing:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCorrelationIdentifier:", v6);
  if (!v7->_isDirty && v8)
    v7->_isDirty = 1;

  objc_sync_exit(v7);
}

- (void)updateClonedFromIdentifierForIdentifier:(id)a3 value:(id)a4
{
  id v6;
  TPSTipStatusController *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](v7, "_tipStatusForIdentifier:addIfMissing:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClonedFromIdentifier:", v6);
  if (!v7->_isDirty && v8)
    v7->_isDirty = 1;

  objc_sync_exit(v7);
}

- (void)updateDisplayTypeForIdentifier:(id)a3 value:(unint64_t)a4
{
  TPSTipStatusController *v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = self;
  objc_sync_enter(v6);
  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](v6, "_tipStatusForIdentifier:addIfMissing:", v8, a4 != 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDisplayType:", a4);
  if (!v6->_isDirty && v7)
    v6->_isDirty = 1;

  objc_sync_exit(v6);
}

- (void)updateOverrideFrequencyControlForIdentifier:(id)a3 value:(BOOL)a4
{
  _BOOL8 v4;
  TPSTipStatusController *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  v6 = self;
  objc_sync_enter(v6);
  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](v6, "_tipStatusForIdentifier:addIfMissing:", v8, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOverrideFrequencyControl:", v4);
  if (!v6->_isDirty && v7)
    v6->_isDirty = 1;

  objc_sync_exit(v6);
}

- (void)updateOverrideHoldoutForIdentifier:(id)a3 value:(BOOL)a4
{
  _BOOL8 v4;
  TPSTipStatusController *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  v6 = self;
  objc_sync_enter(v6);
  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](v6, "_tipStatusForIdentifier:addIfMissing:", v8, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOverrideHoldout:", v4);
  if (!v6->_isDirty && v7)
    v6->_isDirty = 1;

  objc_sync_exit(v6);
}

- (void)updatePreconditionMatchedForIdentifier:(id)a3 value:(BOOL)a4
{
  _BOOL8 v4;
  TPSTipStatusController *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  v6 = self;
  objc_sync_enter(v6);
  if (-[TPSTipStatusController isPreconditionMatchedForIdentifier:](v6, "isPreconditionMatchedForIdentifier:", v8) != v4)
  {
    -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](v6, "_tipStatusForIdentifier:addIfMissing:", v8, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPreconditionMatched:", v4);
    if (v4 && objc_msgSend(v7, "hintIneligibleReason") == 15)
      objc_msgSend(v7, "setHintIneligibleReason:", 0);
    if (!v6->_isDirty && v7)
      v6->_isDirty = 1;

  }
  objc_sync_exit(v6);

}

- (BOOL)isPreconditionMatchedForIdentifier:(id)a3
{
  void *v3;
  char v4;

  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](self, "_tipStatusForIdentifier:addIfMissing:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPreconditionMatched");

  return v4;
}

- (id)statusesForCorrelationIdentifier:(id)a3
{
  id v4;
  void *v5;
  TPSTipStatusController *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self;
  objc_sync_enter(v6);
  -[NSMutableDictionary allValues](v6->_identifierToTipStatusMap, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__TPSTipStatusController_statusesForCorrelationIdentifier___block_invoke;
  v11[3] = &unk_1E395BBF0;
  v8 = v4;
  v12 = v8;
  v9 = v5;
  v13 = v9;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

  objc_sync_exit(v6);
  return v9;
}

- (void)updateCacheData
{
  TPSTipStatusController *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_isDirty)
  {
    +[TPSSecureArchivingUtilities archivedDataWithRootObject:forKey:userDefaults:](TPSSecureArchivingUtilities, "archivedDataWithRootObject:forKey:userDefaults:", obj->_identifierToTipStatusMap, CFSTR("TipStatusIdentifierToTipStatusMap"), obj->_appGroupDefaults);
    -[NSUserDefaults synchronize](obj->_appGroupDefaults, "synchronize");
    obj->_isDirty = 0;
  }
  objc_sync_exit(obj);

}

- (void)setAppGroupDefaults:(id)a3
{
  TPSTipStatusController *v5;
  id v6;

  v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_storeStrong((id *)&v5->_appGroupDefaults, a3);
  -[TPSTipStatusController _reloadCacheData](v5, "_reloadCacheData");
  objc_sync_exit(v5);

}

- (void)_reloadCacheData
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *identifierToTipStatusMap;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v3 = (void *)MEMORY[0x1E0C99E20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  +[TPSSecureArchivingUtilities unarchivedObjectOfClasses:forKey:userDefaults:](TPSSecureArchivingUtilities, "unarchivedObjectOfClasses:forKey:userDefaults:");
  v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  identifierToTipStatusMap = self->_identifierToTipStatusMap;
  self->_identifierToTipStatusMap = v6;

  if (!self->_identifierToTipStatusMap)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = self->_identifierToTipStatusMap;
    self->_identifierToTipStatusMap = v8;

  }
}

- (TPSTipStatusController)initWithAppGroupDefaults:(id)a3
{
  id v4;
  TPSTipStatusController *v5;
  TPSTipStatusController *v6;
  TPSTipStatusController *v7;
  objc_super v9;

  v4 = a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)TPSTipStatusController;
    v5 = -[TPSTipStatusController init](&v9, sel_init);
    v6 = v5;
    if (v5)
      -[TPSTipStatusController setAppGroupDefaults:](v5, "setAppGroupDefaults:", v4);
    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (TPSTipStatusController)init
{

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = (void *)-[NSMutableDictionary copy](self->_identifierToTipStatusMap, "copy");
  objc_msgSend(v4, "setIdentifierToTipStatusMap:", v5);

  return v4;
}

- (NSDictionary)tipStatusMap
{
  TPSTipStatusController *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  if (-[NSMutableDictionary count](v2->_identifierToTipStatusMap, "count"))
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v2->_identifierToTipStatusMap);
  else
    v3 = 0;
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (int64_t)tipStatusCount
{
  TPSTipStatusController *v2;
  int64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSMutableDictionary count](v2->_identifierToTipStatusMap, "count");
  objc_sync_exit(v2);

  return v3;
}

- (void)addTipStatuses:(id)a3
{
  TPSTipStatusController *v4;
  id v5;
  _QWORD v6[5];

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__TPSTipStatusController_addTipStatuses___block_invoke;
  v6[3] = &unk_1E395BBC8;
  v6[4] = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);
  -[TPSTipStatusController updateCacheData](v4, "updateCacheData");
  objc_sync_exit(v4);

}

void __41__TPSTipStatusController_addTipStatuses___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", v5, v3);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  }

}

- (void)removeTipStatusWithIdentifiers:(id)a3
{
  TPSTipStatusController *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableDictionary removeObjectsForKeys:](v4->_identifierToTipStatusMap, "removeObjectsForKeys:", v5);
  v4->_isDirty = 1;
  objc_sync_exit(v4);

}

- (void)removeAllTipStatus
{
  TPSTipStatusController *obj;

  obj = self;
  objc_sync_enter(obj);
  -[NSMutableDictionary removeAllObjects](obj->_identifierToTipStatusMap, "removeAllObjects");
  obj->_isDirty = 1;
  objc_sync_exit(obj);

}

- (id)reenrollHoldoutContent
{
  TPSTipStatusController *v2;
  void *v3;
  NSMutableDictionary *identifierToTipStatusMap;
  id v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, void *);
  void *v10;
  id v11;
  TPSTipStatusController *v12;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[NSMutableDictionary count](v2->_identifierToTipStatusMap, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  identifierToTipStatusMap = v2->_identifierToTipStatusMap;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __48__TPSTipStatusController_reenrollHoldoutContent__block_invoke;
  v10 = &unk_1E395BC18;
  v5 = v3;
  v11 = v5;
  v12 = v2;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](identifierToTipStatusMap, "enumerateKeysAndObjectsUsingBlock:", &v7);
  -[TPSTipStatusController updateCacheData](v2, "updateCacheData", v7, v8, v9, v10);

  objc_sync_exit(v2);
  return v5;
}

void __48__TPSTipStatusController_reenrollHoldoutContent__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(a3, "reenrollIfAllowed"))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    +[TPSLogger data](TPSLogger, "data");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_19A906000, v6, OS_LOG_TYPE_INFO, "Content %@ reenrolled due to experiment change.", (uint8_t *)&v7, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 8) = 1;
  }

}

- (id)reenrollPreconditionChangeContent
{
  TPSTipStatusController *v2;
  void *v3;
  NSMutableDictionary *identifierToTipStatusMap;
  id v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, void *);
  void *v10;
  id v11;
  TPSTipStatusController *v12;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[NSMutableDictionary count](v2->_identifierToTipStatusMap, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  identifierToTipStatusMap = v2->_identifierToTipStatusMap;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __59__TPSTipStatusController_reenrollPreconditionChangeContent__block_invoke;
  v10 = &unk_1E395BC18;
  v5 = v3;
  v11 = v5;
  v12 = v2;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](identifierToTipStatusMap, "enumerateKeysAndObjectsUsingBlock:", &v7);
  -[TPSTipStatusController updateCacheData](v2, "updateCacheData", v7, v8, v9, v10);

  objc_sync_exit(v2);
  return v5;
}

void __59__TPSTipStatusController_reenrollPreconditionChangeContent__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "hintIneligibleReason") == 15 && objc_msgSend(v6, "isPreconditionMatched"))
  {
    objc_msgSend(v6, "setHintIneligibleReason:", 0);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    +[TPSLogger data](TPSLogger, "data");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_19A906000, v7, OS_LOG_TYPE_INFO, "Content %@ eligible for reenrolled due to precondition change.", (uint8_t *)&v8, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 8) = 1;
  }

}

- (BOOL)isLockScreenHintDisplayEligibleForIdentifier:(id)a3
{
  id v4;
  TPSTipStatusController *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[TPSTipStatusController isContentNeverVisibleForIdentifier:](v5, "isContentNeverVisibleForIdentifier:", v4))
  {
    v8 = 0;
    goto LABEL_7;
  }
  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](v5, "_tipStatusForIdentifier:addIfMissing:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "displayType");
  if (objc_msgSend(v6, "isPreconditionMatched") && !objc_msgSend(v6, "hintIneligibleReason"))
  {
    objc_msgSend(v6, "contentViewedDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      if (!v7)
      {
        v8 = 1;
        goto LABEL_10;
      }
      if (v7 == 1)
      {
        objc_msgSend(v6, "hintEligibleDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v6, "desiredOutcomePerformedDates");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v12, "count") == 0;

        }
        else
        {
          v8 = 0;
        }

        goto LABEL_10;
      }
    }
    v8 = 0;
LABEL_10:

    goto LABEL_5;
  }
  v8 = 0;
LABEL_5:

LABEL_7:
  objc_sync_exit(v5);

  return v8;
}

- (BOOL)isContextualInfoLifetimeExpiredForIdentifier:(id)a3
{
  id v4;
  TPSTipStatusController *v5;
  void *v6;
  char v7;
  char v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](v5, "_tipStatusForIdentifier:addIfMissing:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isExpired");
  if (v6)
    v8 = v7;
  else
    v8 = 1;
  if (v6)
    v9 = 1;
  else
    v9 = v7;
  if ((v8 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v6, "contentViewedDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isDateExpired:maxTimeInterval:", v11, -2160000.0))
    {

    }
    else
    {
      v12 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v6, "hintDisplayedDates");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v12) = objc_msgSend(v12, "isDateExpired:maxTimeInterval:", v14, -2160000.0);

      if (!(_DWORD)v12)
      {
        v9 = 0;
        goto LABEL_13;
      }
    }
    v9 = 1;
    objc_msgSend(v6, "setExpired:", 1);
    v5->_isDirty = 1;
  }
LABEL_13:

  objc_sync_exit(v5);
  return v9;
}

- (BOOL)isHintMaxDurationExcceededForIdentifier:(id)a3
{
  id v4;
  TPSTipStatusController *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v11;
  void *v12;
  double v13;
  char v14;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](v5, "_tipStatusForIdentifier:addIfMissing:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hintDisplayedDates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "hintDismissalDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8
      || (objc_msgSend(v6, "desiredOutcomePerformedDates"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v8, "count"))
      || objc_msgSend(v6, "hintIneligibleReason"))
    {

    }
    else
    {
      v11 = objc_msgSend(v6, "displayType");

      if (v11 == 2)
      {
        objc_msgSend(v7, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[TPSDefaultsManager hintMaxDurationTimeInterval](TPSDefaultsManager, "hintMaxDurationTimeInterval");
        if (v13 == 0.0)
          v13 = -604800.0;
        v14 = objc_msgSend(MEMORY[0x1E0C99D68], "isDateExpired:maxTimeInterval:", v12, v13);

        if ((v14 & 1) != 0)
        {
          v9 = 1;
          goto LABEL_7;
        }
      }
    }
  }
  v9 = 0;
LABEL_7:

  objc_sync_exit(v5);
  return v9;
}

- (BOOL)isEligibilityTrackingNeedsRestartForIdentifier:(id)a3
{
  id v4;
  TPSTipStatusController *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](v5, "_tipStatusForIdentifier:addIfMissing:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hintEligibleDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(MEMORY[0x1E0C99D68], "isDateExpired:maxTimeInterval:", v7, -2160000.0)
    && -[TPSTipStatusController isTriggerTrackingEligibleForIdentifier:checkForPrecondition:checkForEligibleDate:](v5, "isTriggerTrackingEligibleForIdentifier:checkForPrecondition:checkForEligibleDate:", v4, 0, 0);

  objc_sync_exit(v5);
  return v8;
}

- (BOOL)isTriggerTrackingEligibleForIdentifier:(id)a3
{
  return -[TPSTipStatusController isTriggerTrackingEligibleForIdentifier:checkForPrecondition:checkForEligibleDate:](self, "isTriggerTrackingEligibleForIdentifier:checkForPrecondition:checkForEligibleDate:", a3, 1, 1);
}

- (BOOL)isTriggerTrackingEligibleForIdentifier:(id)a3 checkForPrecondition:(BOOL)a4 checkForEligibleDate:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v6;
  id v8;
  TPSTipStatusController *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v18;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = self;
  objc_sync_enter(v9);
  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](v9, "_tipStatusForIdentifier:addIfMissing:", v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10 || (_DWORD)v6 && !objc_msgSend(v10, "isPreconditionMatched"))
  {
    v13 = 0;
    goto LABEL_24;
  }
  if (v5)
  {
    objc_msgSend(v11, "hintEligibleDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = 0;
LABEL_23:

      goto LABEL_24;
    }
  }
  v14 = objc_msgSend(v11, "hintIneligibleReason");
  if (v14 >= 1)
  {
    objc_msgSend(v11, "dateForTriggerRestartTracking");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v13 = 0;
      goto LABEL_21;
    }
  }
  if ((objc_msgSend(v11, "isExpired") & 1) != 0)
  {
    v13 = 0;
    if (v14 < 1)
      goto LABEL_13;
    goto LABEL_21;
  }
  objc_msgSend(v11, "hintDisplayedDates");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
    goto LABEL_19;
  objc_msgSend(v11, "hintDismissalDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 || (objc_msgSend(v11, "contentViewedDate"), (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_19:
    v13 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v11, "desiredOutcomePerformedDates");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v18, "count") == 0;

LABEL_20:
  if (v14 <= 0)
  {
LABEL_13:
    if (!v5)
      goto LABEL_24;
    goto LABEL_22;
  }
LABEL_21:

  if (v5)
  {
LABEL_22:
    v12 = 0;
    goto LABEL_23;
  }
LABEL_24:

  objc_sync_exit(v9);
  return v13;
}

- (BOOL)isDesiredOutcomeTrackingEligibleForIdentifier:(id)a3
{
  id v4;
  TPSTipStatusController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](v5, "_tipStatusForIdentifier:addIfMissing:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    goto LABEL_10;
  objc_msgSend(v6, "hintDisplayedDates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
    goto LABEL_6;
  objc_msgSend(v7, "hintWouldHaveBeenDisplayedDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 || (objc_msgSend(v7, "contentViewedDate"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_6:
    goto LABEL_7;
  }
  objc_msgSend(v7, "desiredOutcomePerformedDates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
    goto LABEL_10;
LABEL_7:
  if (!objc_msgSend(v7, "isPreconditionMatched"))
  {
LABEL_10:
    LOBYTE(v10) = 0;
    goto LABEL_11;
  }
  v10 = objc_msgSend(v7, "isExpired") ^ 1;
LABEL_11:

  objc_sync_exit(v5);
  return v10;
}

- (int64_t)hintInelgibileReasonForIdentifier:(id)a3
{
  void *v3;
  int64_t v4;

  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](self, "_tipStatusForIdentifier:addIfMissing:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hintIneligibleReason");

  return v4;
}

- (BOOL)isHintInelgibileForIdentifier:(id)a3
{
  void *v3;
  char v4;

  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](self, "_tipStatusForIdentifier:addIfMissing:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHintInelgibile");

  return v4;
}

- (BOOL)isHintInelgibileForReason:(int64_t)a3 identifier:(id)a4
{
  void *v5;

  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](self, "_tipStatusForIdentifier:addIfMissing:", a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "hintIneligibleReason") == a3;

  return a3;
}

- (void)updateHintInelgibileForIdentifier:(id)a3 value:(int64_t)a4
{
  TPSTipStatusController *v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = self;
  objc_sync_enter(v6);
  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](v6, "_tipStatusForIdentifier:addIfMissing:", v8, a4 != 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "hintIneligibleReason") != a4)
  {
    objc_msgSend(v7, "setHintIneligibleReason:", a4);
    if (a4)
    {
      objc_msgSend(v7, "setHintEligibleDate:", 0);
      if (a4 == 15)
        objc_msgSend(v7, "setPreconditionMatched:", 0);
    }
    if (!v6->_isDirty && v7)
      v6->_isDirty = 1;
  }

  objc_sync_exit(v6);
}

- (id)dateForTriggerRestartTrackingForIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](self, "_tipStatusForIdentifier:addIfMissing:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateForTriggerRestartTracking");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)updateDateForTriggerRestartTrackingForIdentifier:(id)a3 date:(id)a4
{
  id v6;
  TPSTipStatusController *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](v7, "_tipStatusForIdentifier:addIfMissing:", v9, v6 != 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDateForTriggerRestartTracking:", v6);
  if (!v7->_isDirty && v8)
    v7->_isDirty = 1;

  objc_sync_exit(v7);
}

- (unint64_t)displayTypeForIdentifier:(id)a3
{
  void *v3;
  unint64_t v4;

  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](self, "_tipStatusForIdentifier:addIfMissing:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "displayType");

  return v4;
}

- (id)variantIdentifierForIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](self, "_tipStatusForIdentifier:addIfMissing:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "variantIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)correlationIdentifierForIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](self, "_tipStatusForIdentifier:addIfMissing:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "correlationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)clonedFromIdentifierForIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](self, "_tipStatusForIdentifier:addIfMissing:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clonedFromIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hintEligibleDateForIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](self, "_tipStatusForIdentifier:addIfMissing:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hintEligibleDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)updateHintEligibleDateForIdentifier:(id)a3 value:(BOOL)a4
{
  _BOOL8 v4;
  TPSTipStatusController *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  v6 = self;
  objc_sync_enter(v6);
  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](v6, "_tipStatusForIdentifier:addIfMissing:", v10, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v7, "setHintEligibleDate:", v8);
  if (v4)

  objc_msgSend(v7, "hintEligibleDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[TPSTipStatusController updateHintWouldHaveBeenDisplayedDateForIdentifier:value:](v6, "updateHintWouldHaveBeenDisplayedDateForIdentifier:value:", v10, 0);
    -[TPSTipStatusController updateHintInelgibileForIdentifier:value:](v6, "updateHintInelgibileForIdentifier:value:", v10, 0);
  }
  if (!v6->_isDirty && v7)
    v6->_isDirty = 1;

  objc_sync_exit(v6);
}

- (id)hintWouldHaveBeenDisplayedDateForIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](self, "_tipStatusForIdentifier:addIfMissing:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hintWouldHaveBeenDisplayedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)updateHintWouldHaveBeenDisplayedDateForIdentifier:(id)a3 value:(BOOL)a4
{
  _BOOL8 v4;
  TPSTipStatusController *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  id v11;

  v4 = a4;
  v11 = a3;
  v6 = self;
  objc_sync_enter(v6);
  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](v6, "_tipStatusForIdentifier:addIfMissing:", v11, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hintWouldHaveBeenDisplayedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;

  if (v9 == v4)
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v7, "setHintWouldHaveBeenDisplayedDate:", v10);
    if (v4)

    if (!v6->_isDirty && v7)
      v6->_isDirty = 1;
  }

  objc_sync_exit(v6);
}

- (BOOL)isHintDisplayedForIdentifier:(id)a3
{
  void *v3;
  char v4;

  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](self, "_tipStatusForIdentifier:addIfMissing:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHintDisplayed");

  return v4;
}

- (int)hintDisplayedCountForIdentifier:(id)a3
{
  void *v3;
  void *v4;
  int v5;

  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](self, "_tipStatusForIdentifier:addIfMissing:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hintDisplayedDates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (void)addHintDisplayedForIdentifier:(id)a3 context:(id)a4
{
  id v6;
  TPSTipStatusController *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](v7, "_tipStatusForIdentifier:addIfMissing:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addHintDisplayedDate:", v9);

  objc_msgSend(v8, "setLastDisplayContext:", v6);
  if (!v7->_isDirty && v8)
    v7->_isDirty = 1;

  objc_sync_exit(v7);
}

- (id)firstHintDisplayDateForIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](self, "_tipStatusForIdentifier:addIfMissing:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hintDisplayedDates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)addHintNotDisplayedDueToFrequencyControlDateForIdentifier:(id)a3
{
  TPSTipStatusController *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](v4, "_tipStatusForIdentifier:addIfMissing:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addHintNotDisplayedDueToFrequencyControlDate:", v6);

  if (!v4->_isDirty && v5)
    v4->_isDirty = 1;

  objc_sync_exit(v4);
}

- (id)hintNotDisplayedDueToFrequencyControlDatesForIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](self, "_tipStatusForIdentifier:addIfMissing:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hintNotDisplayedDueToFrequencyControlDates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isHintDismissedForIdentifier:(id)a3
{
  void *v3;
  char v4;

  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](self, "_tipStatusForIdentifier:addIfMissing:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHintDismissed");

  return v4;
}

- (void)updateHintDismissedForIdentifier:(id)a3 value:(BOOL)a4
{
  _BOOL8 v4;
  TPSTipStatusController *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  v6 = self;
  objc_sync_enter(v6);
  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](v6, "_tipStatusForIdentifier:addIfMissing:", v9, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v7, "setHintDismissalDate:", v8);
  if (v4)

  if (!v6->_isDirty && v7)
    v6->_isDirty = 1;

  objc_sync_exit(v6);
}

- (BOOL)isContentViewedForIdentifier:(id)a3
{
  void *v3;
  char v4;

  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](self, "_tipStatusForIdentifier:addIfMissing:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isContentViewed");

  return v4;
}

- (void)updateContentViewedForIdentifier:(id)a3 value:(BOOL)a4
{
  _BOOL8 v4;
  TPSTipStatusController *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  v6 = self;
  objc_sync_enter(v6);
  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](v6, "_tipStatusForIdentifier:addIfMissing:", v10, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentViewedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v7, "setContentViewedDate:", v9);
    if (v4)

    if (!v6->_isDirty && v7)
      v6->_isDirty = 1;
  }

  objc_sync_exit(v6);
}

- (id)contentViewedDateForIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](self, "_tipStatusForIdentifier:addIfMissing:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentViewedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isDesiredOutcomePerformedForIdentifier:(id)a3
{
  void *v3;
  char v4;

  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](self, "_tipStatusForIdentifier:addIfMissing:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDesiredOutcomePerformed");

  return v4;
}

- (void)donateDesiredOutcomePerformedForIdentifier:(id)a3 date:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](self, "_tipStatusForIdentifier:addIfMissing:", v16, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "hintIneligibleReason") == 22)
    {
      objc_msgSend(v8, "hintWouldHaveBeenDisplayedDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "hintDisplayedDates");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    +[TPSAnalyticsCommonDefines displayTypeStringForDisplayType:](TPSAnalyticsCommonDefines, "displayTypeStringForDisplayType:", objc_msgSend(v8, "displayType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "correlationIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "overrideHoldout");
    objc_msgSend(v8, "lastDisplayContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[TPSAnalyticsEventDesiredOutcomePerformed eventWithTipID:correlationID:displayType:overrideHoldout:lastDisplayedContext:lastHintDisplayedDate:desiredOutcomePerformedDate:](TPSAnalyticsEventDesiredOutcomePerformed, "eventWithTipID:correlationID:displayType:overrideHoldout:lastDisplayedContext:lastHintDisplayedDate:desiredOutcomePerformedDate:", v16, v12, v11, v13, v14, v9, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "log");

  }
}

- (void)addDesiredOutcomePerformedDateForIdentifier:(id)a3 date:(id)a4
{
  id v6;
  TPSTipStatusController *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](v7, "_tipStatusForIdentifier:addIfMissing:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "desiredOutcomePerformedDates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (!v10)
    -[TPSTipStatusController donateDesiredOutcomePerformedForIdentifier:date:](v7, "donateDesiredOutcomePerformedForIdentifier:date:", v11, v6);
  objc_msgSend(v8, "addDesiredOutcomePerformedDate:", v6);
  if (!v7->_isDirty && v8)
    v7->_isDirty = 1;

  objc_sync_exit(v7);
}

- (BOOL)isExpiredForIdentifier:(id)a3
{
  void *v3;
  char v4;

  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](self, "_tipStatusForIdentifier:addIfMissing:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isExpired");

  return v4;
}

- (void)updateExpiredForIdentifier:(id)a3 value:(BOOL)a4
{
  _BOOL8 v4;
  TPSTipStatusController *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  v6 = self;
  objc_sync_enter(v6);
  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](v6, "_tipStatusForIdentifier:addIfMissing:", v8, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExpired:", v4);
  if (!v6->_isDirty && v7)
    v6->_isDirty = 1;

  objc_sync_exit(v6);
}

- (id)lastUsedVersionForIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](self, "_tipStatusForIdentifier:addIfMissing:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastUsedVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isOverrideHoldoutForIdentifier:(id)a3
{
  void *v3;
  char v4;

  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](self, "_tipStatusForIdentifier:addIfMissing:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "overrideHoldout");

  return v4;
}

- (BOOL)isOverrideFrequencyControlForIdentifier:(id)a3
{
  void *v3;
  char v4;

  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](self, "_tipStatusForIdentifier:addIfMissing:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "overrideFrequencyControl");

  return v4;
}

- (unint64_t)usageFlagsForIdentifier:(id)a3
{
  void *v3;
  unint64_t v4;

  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](self, "_tipStatusForIdentifier:addIfMissing:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "usageFlags");

  return v4;
}

- (id)lastDisplayContextForIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](self, "_tipStatusForIdentifier:addIfMissing:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastDisplayContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)userInfoForIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](self, "_tipStatusForIdentifier:addIfMissing:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)clearSavedDateForIdentifier:(id)a3
{
  TPSTipStatusController *v4;
  void *v5;
  void *v6;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](v4, "_tipStatusForIdentifier:addIfMissing:", v8, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v4->_isDirty && v5 != 0)
  {
    objc_msgSend(v5, "setSavedDate:", 0);
    v4->_isDirty = 1;
  }

  objc_sync_exit(v4);
}

- (void)updateUserInfoForIdentifier:(id)a3 key:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  TPSTipStatusController *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](v10, "_tipStatusForIdentifier:addIfMissing:", v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateUserInfoValue:forKey:", v9, v8);
  if (!v10->_isDirty && v11)
    v10->_isDirty = 1;

  objc_sync_exit(v10);
}

- (void)removeUserInfoForIdentifier:(id)a3
{
  TPSTipStatusController *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[TPSTipStatusController _tipStatusForIdentifier:addIfMissing:](v4, "_tipStatusForIdentifier:addIfMissing:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeUserInfo");
  if (!v4->_isDirty && v5)
    v4->_isDirty = 1;

  objc_sync_exit(v4);
}

- (void)removeCacheData
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19A906000, log, OS_LOG_TYPE_DEBUG, "Remove all tipStatus cache", v1, 2u);
}

- (id)debugDescription
{
  void *v3;
  TPSTipStatusController *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@"), self);
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableDictionary allValues](v4->_identifierToTipStatusMap, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n %@ = %@\n"), CFSTR("TipStatusIdentifierToTipStatusMap"), v6);

  objc_sync_exit(v4);
  return v3;
}

- (BOOL)unviewedContentAvailable
{
  TPSTipStatusController *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v2 = self;
  -[TPSTipStatusController tipStatusMap](self, "tipStatusMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__TPSTipStatusController_unviewedContentAvailable__block_invoke;
  v6[3] = &unk_1E395B610;
  v6[4] = v2;
  LOBYTE(v2) = objc_msgSend(v4, "na_any:", v6);

  return (char)v2;
}

uint64_t __50__TPSTipStatusController_unviewedContentAvailable__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isContentViewedForIdentifier:", a2) ^ 1;
}

- (NSUserDefaults)appGroupDefaults
{
  return self->_appGroupDefaults;
}

- (NSMutableDictionary)identifierToTipStatusMap
{
  return self->_identifierToTipStatusMap;
}

- (void)setIdentifierToTipStatusMap:(id)a3
{
  objc_storeStrong((id *)&self->_identifierToTipStatusMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierToTipStatusMap, 0);
  objc_storeStrong((id *)&self->_appGroupDefaults, 0);
}

@end
