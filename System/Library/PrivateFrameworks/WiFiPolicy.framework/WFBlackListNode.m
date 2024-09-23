@implementation WFBlackListNode

- (WFBlackListNode)initWithBlacklistNetwork:(id)a3
{
  id v4;
  WFBlackListNode *v5;
  NSMutableArray *v6;
  NSMutableArray *blacklistTriggers;
  NSMutableArray *v8;
  NSMutableArray *blacklistedStatesCurrent;
  NSMutableArray *v10;
  NSMutableArray *blacklistedStatesHistory;
  char v12;
  void *v13;
  WFBlackListNode *v14;
  void *v15;
  id v16;
  uint64_t v17;
  objc_super v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WFBlackListNode;
  v5 = -[WFBlackListNode init](&v19, sel_init);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s self nil"), "-[WFBlackListNode initWithBlacklistNetwork:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    goto LABEL_18;
  }
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s network nil"), "-[WFBlackListNode initWithBlacklistNetwork:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    goto LABEL_18;
  }
  v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  blacklistTriggers = v5->_blacklistTriggers;
  v5->_blacklistTriggers = v6;

  if (!v5->_blacklistTriggers)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Alloc failed: triggersList"), "-[WFBlackListNode initWithBlacklistNetwork:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    goto LABEL_18;
  }
  v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  blacklistedStatesCurrent = v5->_blacklistedStatesCurrent;
  v5->_blacklistedStatesCurrent = v8;

  if (!v5->_blacklistedStatesCurrent)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Alloc failed: statesList"), "-[WFBlackListNode initWithBlacklistNetwork:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    goto LABEL_18;
  }
  v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  blacklistedStatesHistory = v5->_blacklistedStatesHistory;
  v5->_blacklistedStatesHistory = v10;

  if (!v5->_blacklistedStatesHistory)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Alloc failed: historyList"), "-[WFBlackListNode initWithBlacklistNetwork:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
LABEL_17:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v15), "UTF8String"));
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v17 = objc_msgSend(v16, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v21 = v17;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

    }
LABEL_18:

    v13 = 0;
    goto LABEL_19;
  }
  v12 = objc_msgSend(v4, "isEAP");
  v5->_enterprisePolicy = v12 & objc_msgSend(v4, "isProfileBased");
  v13 = (void *)objc_msgSend(v4, "copyWithZone:", 0);
  if (!objc_msgSend(v13, "isEqualToBlacklistNetwork:", v4))
  {
LABEL_19:
    v14 = 0;
    goto LABEL_20;
  }
  -[WFBlackListNode setNetworkDelegate:](v5, "setNetworkDelegate:", v13);
  v14 = v5;
LABEL_20:

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[NSMutableArray removeAllObjects](self->_blacklistTriggers, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_blacklistedStatesCurrent, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_blacklistedStatesHistory, "removeAllObjects");
  v3.receiver = self;
  v3.super_class = (Class)WFBlackListNode;
  -[WFBlackListNode dealloc](&v3, sel_dealloc);
}

- (void)addBlacklistTrigger:(unint64_t)a3 reasonData:(int64_t)a4 bssid:(id)a5
{
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  WFBlacklistTriggerNode *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[WFBlackListNode blacklistTriggers](self, "blacklistTriggers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 >= 0x10)
  {
    -[WFBlackListNode blacklistTriggers](self, "blacklistTriggers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectAtIndex:", 0);

  }
  v12 = objc_alloc_init(WFBlacklistTriggerNode);
  if (v12)
  {
    +[WFBlacklistEngine stringRepresentationWithReason:](WFBlacklistEngine, "stringRepresentationWithReason:", a3);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[WFBlacklistTriggerNode setTriggerReason:](v12, "setTriggerReason:", a3);
    -[WFBlacklistTriggerNode setTriggerReasonData:](v12, "setTriggerReasonData:", a4);
    if (v13)
      -[WFBlacklistTriggerNode setTriggerReasonString:](v12, "setTriggerReasonString:", v13);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSince1970");
    -[WFBlacklistTriggerNode setTriggerReasonTimestamp:](v12, "setTriggerReasonTimestamp:");

    if (v8)
      -[WFBlacklistTriggerNode setBssid:](v12, "setBssid:", v8);
    -[WFBlackListNode blacklistTriggers](self, "blacklistTriggers");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v12);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s ev alloc failed"), "-[WFBlackListNode addBlacklistTrigger:reasonData:bssid:]");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    v16 = (void *)MEMORY[0x1E0CB3940];
    v13 = objc_retainAutorelease(v13);
    objc_msgSend(v16, "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v13, "UTF8String"));
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136446210;
    v18 = objc_msgSend(v15, "UTF8String");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }

LABEL_10:
}

- (BOOL)containsNetwork:(id)a3
{
  if (a3)
    return -[WFBlacklistNetwork isEqualToBlacklistNetwork:](self->_networkDelegate, "isEqualToBlacklistNetwork:");
  else
    return 0;
}

- (BOOL)hasBlacklistedState:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[WFBlackListNode blacklistedStatesCurrent](self, "blacklistedStatesCurrent", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "blacklistedState") == a3)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)updateNetwork:(id)a3
{
  WFBlacklistNetwork *v4;
  WFBlacklistNetwork *networkDelegate;

  v4 = (WFBlacklistNetwork *)objc_msgSend(a3, "copyWithZone:", 0);
  networkDelegate = self->_networkDelegate;
  self->_networkDelegate = v4;

  return 1;
}

- (id)_copyCreateBlacklistedState:(unint64_t)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5
{
  WFBlacklistStateNode *v8;
  id v9;
  void *v10;
  void *v11;
  void *v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = objc_alloc_init(WFBlacklistStateNode);
  if (v8)
  {
    +[WFBlacklistEngine stringRepresentationWithState:](WFBlacklistEngine, "stringRepresentationWithState:", a3);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    +[WFBlacklistEngine stringRepresentationWithReason:](WFBlacklistEngine, "stringRepresentationWithReason:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFBlacklistStateNode setBlacklistedState:](v8, "setBlacklistedState:", a3);
    -[WFBlacklistStateNode setBlacklistedStateString:](v8, "setBlacklistedStateString:", v9);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSince1970");
    -[WFBlacklistStateNode setBlacklistedStateTimestamp:](v8, "setBlacklistedStateTimestamp:");

    -[WFBlacklistStateNode setBlacklistedReason:](v8, "setBlacklistedReason:", a4);
    -[WFBlacklistStateNode setBlacklistedReasonData:](v8, "setBlacklistedReasonData:", a5);
    -[WFBlacklistStateNode setBlacklistedReasonString:](v8, "setBlacklistedReasonString:", v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s stateNode alloc failed"), "-[WFBlackListNode _copyCreateBlacklistedState:reason:reasonData:]");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      v9 = objc_retainAutorelease(v9);
      objc_msgSend(v13, "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v9, "UTF8String"));
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136446210;
      v16 = objc_msgSend(v14, "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

    }
  }

  return v8;
}

- (void)addBlacklistedState:(unint64_t)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5
{
  unint64_t v5;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  id v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  id v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  unint64_t v52;
  uint64_t v53;

  v5 = a4;
  v53 = *MEMORY[0x1E0C80C00];
  v8 = -[WFBlackListNode _copyCreateBlacklistedState:reason:reasonData:](self, "_copyCreateBlacklistedState:reason:reasonData:", a3, a4, a5);
  if (v8)
  {
    -[WFBlackListNode networkDelegate](self, "networkDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ssid");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    -[WFBlackListNode networkDelegate](self, "networkDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bssid");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    -[WFBlackListNode blacklistedStatesCurrent](self, "blacklistedStatesCurrent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      -[WFBlackListNode blacklistedStatesCurrent](self, "blacklistedStatesCurrent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v16)
      {
        v17 = v16;
        v32 = v5;
        v33 = v12;
        v18 = v10;
        v19 = 0;
        v20 = *(_QWORD *)v35;
        while (2)
        {
          v21 = 0;
          v22 = v19;
          do
          {
            if (*(_QWORD *)v35 != v20)
              objc_enumerationMutation(v15);
            v19 = *(id *)(*((_QWORD *)&v34 + 1) + 8 * v21);

            v23 = objc_msgSend(v19, "blacklistedState");
            if (v23 == objc_msgSend(v8, "blacklistedState"))
            {

              v10 = v18;
              v12 = v33;
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                +[WFBlacklistEngine stringRepresentationWithState:](WFBlacklistEngine, "stringRepresentationWithState:", a3);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                +[WFBlacklistEngine stringRepresentationWithReason:](WFBlacklistEngine, "stringRepresentationWithReason:", v32);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 141559554;
                v40 = 1752392040;
                v41 = 2112;
                v42 = v18;
                v43 = 2160;
                v44 = 1752392040;
                v45 = 2112;
                v46 = v33;
                v47 = 2112;
                v48 = v28;
                v49 = 2112;
                v50 = v29;
                v51 = 2048;
                v52 = v32;
                _os_log_error_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "'%{mask.hash}@[%{mask.hash}@]' was already %@. Would have blacklisted again due to %@(%lu)", buf, 0x48u);

              }
              goto LABEL_19;
            }
            ++v21;
            v22 = v19;
          }
          while (v17 != v21);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          if (v17)
            continue;
          break;
        }

        v10 = v18;
        v5 = v32;
        v12 = v33;
      }

      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      +[WFBlacklistEngine stringRepresentationWithState:](WFBlacklistEngine, "stringRepresentationWithState:", a3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFBlacklistEngine stringRepresentationWithReason:](WFBlacklistEngine, "stringRepresentationWithReason:", v5);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 141559554;
      v40 = 1752392040;
      v41 = 2112;
      v42 = v10;
      v43 = 2160;
      v44 = 1752392040;
      v45 = 2112;
      v46 = v12;
      v47 = 2112;
      v48 = v24;
      v49 = 2112;
      v50 = v25;
      v51 = 2048;
      v52 = v5;
      v26 = MEMORY[0x1E0C81028];
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
LABEL_18:
        -[WFBlackListNode blacklistedStatesCurrent](self, "blacklistedStatesCurrent");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addObject:", v8);

        -[WFBlackListNode processBlacklistedStateMetric:unblacklisting:unblacklistingReason:](self, "processBlacklistedStateMetric:unblacklisting:unblacklistingReason:", v8, 0, 0);
        goto LABEL_19;
      }
      +[WFBlacklistEngine stringRepresentationWithState:](WFBlacklistEngine, "stringRepresentationWithState:", a3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFBlacklistEngine stringRepresentationWithReason:](WFBlacklistEngine, "stringRepresentationWithReason:", v5);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 141559554;
      v40 = 1752392040;
      v41 = 2112;
      v42 = v10;
      v43 = 2160;
      v44 = 1752392040;
      v45 = 2112;
      v46 = v12;
      v47 = 2112;
      v48 = v24;
      v49 = 2112;
      v50 = v25;
      v51 = 2048;
      v52 = v5;
      v26 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1CC44E000, v26, OS_LOG_TYPE_ERROR, "Blacklisting and adding '%{mask.hash}@[%{mask.hash}@]' to %@ due to %@(%lu)", buf, 0x48u);

    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Failed to add state"), "-[WFBlackListNode addBlacklistedState:reason:reasonData:]");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    goto LABEL_20;
  v30 = (void *)MEMORY[0x1E0CB3940];
  v10 = objc_retainAutorelease(v10);
  objc_msgSend(v30, "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v10, "UTF8String"));
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v31 = objc_msgSend(v12, "UTF8String");
  *(_DWORD *)buf = 136446210;
  v40 = v31;
  _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
LABEL_19:

LABEL_20:
}

- (void)addBlacklistedStateHistory:(id)a3 state:(unint64_t)a4 reason:(unint64_t)a5 reasonData:(int64_t)a6
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = v10;
  if (v10)
  {
    v12 = v10;
LABEL_4:
    -[WFBlackListNode networkDelegate](self, "networkDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ssid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFBlackListNode blacklistedStatesHistory](self, "blacklistedStatesHistory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16 >= 5)
    {
      -[WFBlackListNode blacklistedStatesHistory](self, "blacklistedStatesHistory");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeObjectAtIndex:", 0);

    }
    v18 = (void *)MEMORY[0x1E0CB3940];
    +[WFBlacklistEngine stringRepresentationWithState:](WFBlacklistEngine, "stringRepresentationWithState:", a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFBlacklistEngine stringRepresentationWithReason:](WFBlacklistEngine, "stringRepresentationWithReason:", a5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("Adding to blacklistHistory: %@ for '%@' due to %@(%lu)"), v19, v14, v20, a5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v21), "UTF8String"));
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136446210;
      v27 = objc_msgSend(v22, "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

    }
    -[WFBlackListNode blacklistedStatesHistory](self, "blacklistedStatesHistory");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObject:", v12);

    goto LABEL_9;
  }
  v12 = -[WFBlackListNode _copyCreateBlacklistedState:reason:reasonData:](self, "_copyCreateBlacklistedState:reason:reasonData:", a4, a5, a6);
  if (v12)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Failed to add state to history"), "-[WFBlackListNode addBlacklistedStateHistory:state:reason:reasonData:]");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v24 = (void *)MEMORY[0x1E0CB3940];
    v12 = objc_retainAutorelease(v12);
    objc_msgSend(v24, "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v12, "UTF8String"));
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136446210;
    v27 = objc_msgSend(v25, "UTF8String");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

  }
LABEL_9:

}

- (void)networkPruned
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;
  __int16 v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5[0] = 136316162;
  OUTLINED_FUNCTION_0_2();
  v6 = v0;
  v7 = v1;
  v8 = v2;
  v9 = v3;
  v10 = v4;
  _os_log_error_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s Metric for %{mask.hash}@[%{mask.hash}@] not found!", (uint8_t *)v5, 0x34u);
}

- (void)processBlacklistedStateMetric:(id)a3 unblacklisting:(BOOL)a4 unblacklistingReason:(unint64_t)a5
{
  _BOOL4 v5;
  id v7;
  NSMutableArray *v8;
  NSMutableArray *blacklistMetrics;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  id v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  id v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  uint64_t v70;

  v5 = a4;
  v70 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s node nil"), "-[WFBlackListNode processBlacklistedStateMetric:unblacklisting:unblacklistingReason:]");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    goto LABEL_33;
  }
  if (!self->_blacklistMetrics)
  {
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    blacklistMetrics = self->_blacklistMetrics;
    self->_blacklistMetrics = v8;

    if (!self->_blacklistMetrics)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s _blacklistMetrics alloc failed"), "-[WFBlackListNode processBlacklistedStateMetric:unblacklisting:unblacklistingReason:]");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_27;
LABEL_33:
      v47 = (void *)MEMORY[0x1E0CB3940];
      v13 = objc_retainAutorelease(v13);
      objc_msgSend(v47, "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v13, "UTF8String"));
      v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136446210;
      v53 = (const char *)objc_msgSend(v45, "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
LABEL_34:

      goto LABEL_27;
    }
  }
  -[WFBlackListNode networkDelegate](self, "networkDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bssid");
  v11 = objc_claimAutoreleasedReturnValue();

  -[WFBlackListNode networkDelegate](self, "networkDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ssid");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s bssid nil"), "-[WFBlackListNode processBlacklistedStateMetric:unblacklisting:unblacklistingReason:]");
    v45 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v45), "UTF8String"));
      v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136446210;
      v53 = (const char *)objc_msgSend(v46, "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

    }
    goto LABEL_34;
  }
  if (v13)
  {
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSMutableArray count](self->_blacklistMetrics, "count"))
      {
        v14 = 0;
        v49 = v7;
        do
        {
          -[NSMutableArray objectAtIndex:](self->_blacklistMetrics, "objectAtIndex:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("state"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "unsignedIntegerValue");
          v18 = objc_msgSend(v7, "blacklistedState");

          if (v17 == v18)
          {
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ssid"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v19, "isEqualToString:", v13) & 1) == 0)
            {

LABEL_16:
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ssid"));
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("bssid"));
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136317186;
                v53 = "-[WFBlackListNode processBlacklistedStateMetric:unblacklisting:unblacklistingReason:]";
                v54 = 2160;
                v55 = 1752392040;
                v56 = 2112;
                v57 = v30;
                v58 = 2160;
                v59 = 1752392040;
                v60 = 2112;
                v61 = (uint64_t)v31;
                v62 = 2160;
                v63 = 1752392040;
                v64 = 2112;
                v65 = v13;
                v66 = 2160;
                v67 = 1752392040;
                v68 = 2112;
                v69 = v11;
                _os_log_error_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s metric ssid:%{mask.hash}@ bssid:%{mask.hash}@ doesnt match with node ssid:%{mask.hash}@ bssid:%{mask.hash}@", buf, 0x5Cu);

              }
              goto LABEL_18;
            }
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("bssid"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "isEqualToString:", v11);

            if (!v21)
              goto LABEL_16;
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "timeIntervalSince1970");
            v24 = v23;

            v25 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("blocklistTimestamp"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "doubleValue");
            objc_msgSend(v25, "numberWithDouble:", v24 - v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v28, CFSTR("blocklistedDuration"));

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v29, CFSTR("unblocklistingReason"));

            objc_msgSend(v15, "removeObjectForKey:", CFSTR("ssid"));
            objc_msgSend(v15, "removeObjectForKey:", CFSTR("bssid"));
            objc_msgSend(v15, "removeObjectForKey:", CFSTR("state"));
            objc_msgSend(v15, "removeObjectForKey:", CFSTR("blocklistTimestamp"));
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("blocklistedDuration"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("unblocklistingReason"));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("prunedCount"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136316930;
              v53 = "-[WFBlackListNode processBlacklistedStateMetric:unblacklisting:unblacklistingReason:]";
              v54 = 2160;
              v55 = 1752392040;
              v56 = 2112;
              v57 = v13;
              v58 = 2160;
              v59 = 1752392040;
              v60 = 2112;
              v61 = v11;
              v62 = 2112;
              v63 = (uint64_t)v32;
              v64 = 2112;
              v65 = v33;
              v66 = 2112;
              v67 = (uint64_t)v34;
              _os_log_error_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s Finish capturing metric for %{mask.hash}@[%{mask.hash}@] - {duration:%@ unblacklistReason:%@ prunedCount:%@}", buf, 0x52u);

            }
            objc_msgSend(v50, "addIndex:", v14);
            v7 = v49;
          }
LABEL_18:

          ++v14;
        }
        while (v14 < -[NSMutableArray count](self->_blacklistMetrics, "count"));
      }
      if (objc_msgSend(v50, "count"))
      {
        -[NSMutableArray objectsAtIndexes:](self->_blacklistMetrics, "objectsAtIndexes:", v50);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "enumerateObjectsUsingBlock:", &__block_literal_global_14);
        -[NSMutableArray removeObjectsAtIndexes:](self->_blacklistMetrics, "removeObjectsAtIndexes:", v50);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v13);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKeyedSubscript:", v36, CFSTR("ssid"));

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v11);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKeyedSubscript:", v37, CFSTR("bssid"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "blacklistedState"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKeyedSubscript:", v38, CFSTR("state"));

      v39 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "blacklistedStateTimestamp");
      objc_msgSend(v39, "numberWithDouble:");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKeyedSubscript:", v40, CFSTR("blocklistTimestamp"));

      +[WiFiUsagePrivacyFilter sanitizedOUI:](WiFiUsagePrivacyFilter, "sanitizedOUI:", v11);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKeyedSubscript:", v41, CFSTR("oui"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "blacklistedReason"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKeyedSubscript:", v42, CFSTR("blocklistedReason"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "blacklistedReasonData"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKeyedSubscript:", v43, CFSTR("blocklistedSubreason"));

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[WFBlackListNode processBlacklistedStateMetric:unblacklisting:unblacklistingReason:].cold.1((uint64_t)v13, v11, v35);
      -[NSMutableArray addObject:](self->_blacklistMetrics, "addObject:", v35);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s ssid nil"), "-[WFBlackListNode processBlacklistedStateMetric:unblacklisting:unblacklistingReason:]");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v13), "UTF8String"));
      v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136446210;
      v53 = (const char *)objc_msgSend(v48, "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

    }
  }

  v13 = (id)v11;
LABEL_27:

}

void __85__WFBlackListNode_processBlacklistedStateMetric_unblacklisting_unblacklistingReason___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v3 = a2;
  v2 = v3;
  AnalyticsSendEventLazy();

}

id __85__WFBlackListNode_processBlacklistedStateMetric_unblacklisting_unblacklistingReason___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (WFBlacklistNetwork)networkDelegate
{
  return (WFBlacklistNetwork *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNetworkDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableArray)blacklistTriggers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBlacklistTriggers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableArray)blacklistedStatesCurrent
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBlacklistedStatesCurrent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableArray)blacklistedStatesHistory
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBlacklistedStatesHistory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)enterprisePolicy
{
  return self->_enterprisePolicy;
}

- (void)setEnterprisePolicy:(BOOL)a3
{
  self->_enterprisePolicy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blacklistedStatesHistory, 0);
  objc_storeStrong((id *)&self->_blacklistedStatesCurrent, 0);
  objc_storeStrong((id *)&self->_blacklistTriggers, 0);
  objc_storeStrong((id *)&self->_networkDelegate, 0);
  objc_storeStrong((id *)&self->_blacklistMetrics, 0);
}

- (void)processBlacklistedStateMetric:(uint64_t)a1 unblacklisting:(uint64_t)a2 unblacklistingReason:(void *)a3 .cold.1(uint64_t a1, uint64_t a2, void *a3)
{
  void *v6;
  void *v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  int v13[6];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("oui"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("blocklistedReason"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("blocklistedSubreason"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = 136316930;
  OUTLINED_FUNCTION_0_2();
  v14 = a1;
  v15 = v9;
  v16 = v10;
  v17 = v11;
  v18 = a2;
  v19 = v11;
  v20 = v6;
  v21 = v11;
  v22 = v7;
  v23 = v11;
  v24 = v12;
  _os_log_error_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s Begin capturing metric for %{mask.hash}@[%{mask.hash}@] - {oui:%@ blacklistedReason:%@ blacklistedSubreason:%@}", (uint8_t *)v13, 0x52u);

}

@end
