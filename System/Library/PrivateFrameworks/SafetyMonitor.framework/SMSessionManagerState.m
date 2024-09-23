@implementation SMSessionManagerState

- (SMSessionManagerState)init
{
  void *v3;
  void *v4;
  SMSessionManagerState *v5;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SMSessionManagerState initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:](self, "initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:", 0, 0, 0, 0, v3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
         0,
         v4,
         0);

  return v5;
}

- (SMSessionManagerState)initWithSessionState:(unint64_t)a3 configuration:(id)a4 userTriggerResponse:(int64_t)a5 monitorContext:(id)a6 allowReadToken:(id)a7 safetyCacheKey:(id)a8 startMessageGUID:(id)a9 scheduledSendMessageGUID:(id)a10 scheduledSendMessageDate:(id)a11 activeDeviceIdentifier:(id)a12 estimatedEndDate:(id)a13 coarseEstimatedEndDate:(id)a14 estimatedEndDateStatus:(unint64_t)a15 sessionEndReason:(unint64_t)a16 activePairedDeviceIdentifier:(id)a17
{
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v31;
  id v32;
  id v33;
  void *v35;
  SMSessionManagerState *v39;

  v29 = (void *)MEMORY[0x24BDBCE60];
  v33 = a17;
  v32 = a14;
  v25 = a13;
  v28 = a12;
  v27 = a11;
  v19 = a10;
  v20 = a9;
  v21 = a8;
  v31 = a7;
  v26 = a6;
  v22 = a4;
  objc_msgSend(v29, "date");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[SMSessionManagerState initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:](self, "initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:", a3, v22, a5, v26, v23, 0, v31, v21, v20, v19, v27, v28, v25, v32, a15,
          a16,
          v35,
          v33);

  return v39;
}

- (SMSessionManagerState)initWithSessionState:(unint64_t)a3 configuration:(id)a4 userTriggerResponse:(int64_t)a5 monitorContext:(id)a6 date:(id)a7 location:(id)a8 allowReadToken:(id)a9 safetyCacheKey:(id)a10 startMessageGUID:(id)a11 scheduledSendMessageGUID:(id)a12 scheduledSendMessageDate:(id)a13 activeDeviceIdentifier:(id)a14 estimatedEndDate:(id)a15 coarseEstimatedEndDate:(id)a16 estimatedEndDateStatus:(unint64_t)a17 sessionEndReason:(unint64_t)a18 sessionStateTransitionDate:(id)a19 activePairedDeviceIdentifier:(id)a20
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  SMSessionManagerState *v31;
  SMSessionManagerState *v32;
  uint64_t v33;
  SMSessionConfiguration *configuration;
  uint64_t v35;
  SMSessionMonitorContext *monitorContext;
  uint64_t v37;
  NSData *allowReadToken;
  uint64_t v39;
  NSData *safetyCacheKey;
  uint64_t v41;
  NSString *startMessageGUID;
  id obj;
  id v47;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  objc_super v56;

  v55 = a4;
  v54 = a6;
  obj = a7;
  v53 = a7;
  v47 = a8;
  v52 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a11;
  v51 = a12;
  v50 = a13;
  v49 = a14;
  v26 = a15;
  v27 = a16;
  v28 = a19;
  v29 = v25;
  v30 = a20;
  v56.receiver = self;
  v56.super_class = (Class)SMSessionManagerState;
  v31 = -[SMSessionManagerState init](&v56, sel_init);
  v32 = v31;
  if (v31)
  {
    v31->_sessionState = a3;
    v33 = objc_msgSend(v55, "copy");
    configuration = v32->_configuration;
    v32->_configuration = (SMSessionConfiguration *)v33;

    v32->_userTriggerResponse = a5;
    v35 = objc_msgSend(v54, "copy");
    monitorContext = v32->_monitorContext;
    v32->_monitorContext = (SMSessionMonitorContext *)v35;

    objc_storeStrong((id *)&v32->_date, obj);
    objc_storeStrong((id *)&v32->_location, v47);
    v37 = objc_msgSend(v23, "copy");
    allowReadToken = v32->_allowReadToken;
    v32->_allowReadToken = (NSData *)v37;

    v39 = objc_msgSend(v24, "copy");
    safetyCacheKey = v32->_safetyCacheKey;
    v32->_safetyCacheKey = (NSData *)v39;

    v41 = objc_msgSend(v29, "copy");
    startMessageGUID = v32->_startMessageGUID;
    v32->_startMessageGUID = (NSString *)v41;

    objc_storeStrong((id *)&v32->_scheduledSendMessageGUID, a12);
    objc_storeStrong((id *)&v32->_scheduledSendMessageDate, a13);
    objc_storeStrong((id *)&v32->_activeDeviceIdentifier, a14);
    objc_storeStrong((id *)&v32->_estimatedEndDate, a15);
    objc_storeStrong((id *)&v32->_coarseEstimatedEndDate, a16);
    v32->_estimatedEndDateStatus = a17;
    v32->_sessionEndReason = a18;
    objc_storeStrong((id *)&v32->_sessionStateTransitionDate, a19);
    objc_storeStrong((id *)&v32->_activePairedDeviceIdentifier, a20);
  }

  return v32;
}

+ (id)convertSessionStateToString:(unint64_t)a3
{
  __CFString *v3;

  if (a3 < 0xF && ((0x5F97u >> a3) & 1) != 0)
  {
    v3 = off_25166D9C0[a3];
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unsupported (%lu)"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)convertEstimatedEndDateStatusToString:(unint64_t)a3
{
  if (a3 < 4)
    return off_25166DA38[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unsupported (%lu)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)cacheReleaseDate
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x24BDBCE60]);
  if (-[SMSessionManagerState sessionState](self, "sessionState") == 9
    || -[SMSessionManagerState sessionState](self, "sessionState") == 7
    || -[SMSessionManagerState sessionState](self, "sessionState") == 8
    || -[SMSessionManagerState sessionState](self, "sessionState") == 14)
  {
    -[SMSessionManagerState sessionStateTransitionDate](self, "sessionStateTransitionDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateByAddingTimeInterval:", 900.0);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v5;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMSessionManagerState)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  SMSessionManagerState *v23;
  void *v24;

  v3 = a3;
  v20 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("__kSMSessionManagerStateStateKey"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMSessionManagerStateConfigurationKey"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("__kSMSessionManagerStateUserTriggerResposeKey"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMSessionManagerStateMonitorContextKey"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMSessionManagerStateDateKey"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMSessionManagerStateLocationKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMSessionManagerStateAllowReadTokenKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMSessionManagerStateSafetyCacheKeyKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMSessionManagerStateStartMessageGUIDKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMSessionManagerStateScheduledSendMessageGUIDKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMSessionManagerStateScheduledSendMessageDateKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMSessionManagerStateActiveDeviceIdentifierKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMSessionManagerStateEstimatedEndDateKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMSessionManagerStateCoarseEstimatedEndDateKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("__kSMSessionManagerStateEstimatedEndDateStatusKey"));
  v7 = (int)objc_msgSend(v3, "decodeIntForKey:", CFSTR("__kSMSessionManagerStateSessionEndReasonKey"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMSessionManagerStateSessionStateTransitionDateKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMSessionManagerStateActivePairedDeviceIdentifierKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = -[SMSessionManagerState initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:](self, "initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:", v20, v24, v18, v21, v19, v17, v16, v15, v14, v13, v12, v11, v4, v5, v6,
          v7,
          v8,
          v9);

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
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
  id v18;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[SMSessionManagerState sessionState](self, "sessionState"), CFSTR("__kSMSessionManagerStateStateKey"));
  -[SMSessionManagerState configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("__kSMSessionManagerStateConfigurationKey"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SMSessionManagerState userTriggerResponse](self, "userTriggerResponse"), CFSTR("__kSMSessionManagerStateUserTriggerResposeKey"));
  -[SMSessionManagerState monitorContext](self, "monitorContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("__kSMSessionManagerStateMonitorContextKey"));

  -[SMSessionManagerState date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("__kSMSessionManagerStateDateKey"));

  -[SMSessionManagerState location](self, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("__kSMSessionManagerStateLocationKey"));

  -[SMSessionManagerState allowReadToken](self, "allowReadToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("__kSMSessionManagerStateAllowReadTokenKey"));

  -[SMSessionManagerState safetyCacheKey](self, "safetyCacheKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("__kSMSessionManagerStateSafetyCacheKeyKey"));

  -[SMSessionManagerState startMessageGUID](self, "startMessageGUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("__kSMSessionManagerStateStartMessageGUIDKey"));

  -[SMSessionManagerState scheduledSendMessageGUID](self, "scheduledSendMessageGUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("__kSMSessionManagerStateScheduledSendMessageGUIDKey"));

  -[SMSessionManagerState scheduledSendMessageDate](self, "scheduledSendMessageDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("__kSMSessionManagerStateScheduledSendMessageDateKey"));

  -[SMSessionManagerState activeDeviceIdentifier](self, "activeDeviceIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("__kSMSessionManagerStateActiveDeviceIdentifierKey"));

  -[SMSessionManagerState estimatedEndDate](self, "estimatedEndDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("__kSMSessionManagerStateEstimatedEndDateKey"));

  -[SMSessionManagerState coarseEstimatedEndDate](self, "coarseEstimatedEndDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("__kSMSessionManagerStateCoarseEstimatedEndDateKey"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SMSessionManagerState estimatedEndDateStatus](self, "estimatedEndDateStatus"), CFSTR("__kSMSessionManagerStateEstimatedEndDateStatusKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SMSessionManagerState sessionEndReason](self, "sessionEndReason"), CFSTR("__kSMSessionManagerStateSessionEndReasonKey"));
  -[SMSessionManagerState sessionStateTransitionDate](self, "sessionStateTransitionDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("__kSMSessionManagerStateSessionStateTransitionDateKey"));

  -[SMSessionManagerState activePairedDeviceIdentifier](self, "activePairedDeviceIdentifier");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("__kSMSessionManagerStateActivePairedDeviceIdentifierKey"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int64_t v20;
  void *v21;
  unint64_t v22;
  SMSessionManagerMutableState *v23;
  SMSessionManagerMutableState *v24;

  v23 = +[SMSessionManagerMutableState allocWithZone:](SMSessionManagerMutableState, "allocWithZone:", a3);
  v22 = -[SMSessionManagerState sessionState](self, "sessionState");
  -[SMSessionManagerState configuration](self, "configuration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[SMSessionManagerState userTriggerResponse](self, "userTriggerResponse");
  -[SMSessionManagerState monitorContext](self, "monitorContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManagerState date](self, "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManagerState location](self, "location");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManagerState allowReadToken](self, "allowReadToken");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManagerState safetyCacheKey](self, "safetyCacheKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManagerState startMessageGUID](self, "startMessageGUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManagerState scheduledSendMessageGUID](self, "scheduledSendMessageGUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManagerState scheduledSendMessageDate](self, "scheduledSendMessageDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManagerState activeDeviceIdentifier](self, "activeDeviceIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManagerState estimatedEndDate](self, "estimatedEndDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManagerState coarseEstimatedEndDate](self, "coarseEstimatedEndDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SMSessionManagerState estimatedEndDateStatus](self, "estimatedEndDateStatus");
  v7 = -[SMSessionManagerState sessionEndReason](self, "sessionEndReason");
  -[SMSessionManagerState sessionStateTransitionDate](self, "sessionStateTransitionDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManagerState activePairedDeviceIdentifier](self, "activePairedDeviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[SMSessionManagerState initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:](v23, "initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:", v22, v21, v20, v19, v18, v17, v15, v14, v13, v16, v11, v12, v4, v5, v6,
          v7,
          v8,
          v9);

  return v24;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v3 = -[SMSessionManagerState sessionState](self, "sessionState");
  -[SMSessionManagerState configuration](self, "configuration");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v35, "hash");
  v5 = v4 ^ v3 ^ -[SMSessionManagerState userTriggerResponse](self, "userTriggerResponse");
  -[SMSessionManagerState monitorContext](self, "monitorContext");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v34, "hash");
  -[SMSessionManagerState date](self, "date");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ v6 ^ objc_msgSend(v33, "hash");
  -[SMSessionManagerState location](self, "location");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v32, "hash");
  -[SMSessionManagerState allowReadToken](self, "allowReadToken");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 ^ objc_msgSend(v31, "hash");
  -[SMSessionManagerState safetyCacheKey](self, "safetyCacheKey");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7 ^ v9 ^ objc_msgSend(v30, "hash");
  -[SMSessionManagerState startMessageGUID](self, "startMessageGUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[SMSessionManagerState scheduledSendMessageGUID](self, "scheduledSendMessageGUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[SMSessionManagerState scheduledSendMessageDate](self, "scheduledSendMessageDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 ^ objc_msgSend(v15, "hash");
  -[SMSessionManagerState activeDeviceIdentifier](self, "activeDeviceIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v10 ^ v16 ^ objc_msgSend(v17, "hash");
  -[SMSessionManagerState estimatedEndDate](self, "estimatedEndDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hash");
  -[SMSessionManagerState coarseEstimatedEndDate](self, "coarseEstimatedEndDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20 ^ objc_msgSend(v21, "hash");
  v23 = v22 ^ -[SMSessionManagerState estimatedEndDateStatus](self, "estimatedEndDateStatus");
  v24 = v23 ^ -[SMSessionManagerState sessionEndReason](self, "sessionEndReason");
  -[SMSessionManagerState sessionStateTransitionDate](self, "sessionStateTransitionDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v18 ^ v24 ^ objc_msgSend(v25, "hash");
  -[SMSessionManagerState activePairedDeviceIdentifier](self, "activePairedDeviceIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v26 ^ objc_msgSend(v27, "hash");

  return v28;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  SMSessionManagerState *v6;
  SMSessionManagerState *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  char v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  BOOL v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  unint64_t v69;
  unint64_t v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;

  v6 = (SMSessionManagerState *)a3;
  if (self == v6)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      v8 = -[SMSessionManagerState sessionState](self, "sessionState");
      if (v8 != -[SMSessionManagerState sessionState](v7, "sessionState"))
      {
        v11 = 0;
LABEL_90:

        goto LABEL_91;
      }
      -[SMSessionManagerState configuration](self, "configuration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSessionManagerState configuration](v7, "configuration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 != v10)
      {
        -[SMSessionManagerState configuration](self, "configuration");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMSessionManagerState configuration](v7, "configuration");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v11 = 0;
          goto LABEL_88;
        }
      }
      v12 = -[SMSessionManagerState userTriggerResponse](self, "userTriggerResponse");
      if (v12 != -[SMSessionManagerState userTriggerResponse](v7, "userTriggerResponse"))
      {
        v11 = 0;
        goto LABEL_87;
      }
      -[SMSessionManagerState monitorContext](self, "monitorContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSessionManagerState monitorContext](v7, "monitorContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 == v14)
      {
        v121 = v13;
      }
      else
      {
        -[SMSessionManagerState monitorContext](self, "monitorContext");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMSessionManagerState monitorContext](v7, "monitorContext");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v15, "isEqual:"))
        {
          v11 = 0;
          goto LABEL_85;
        }
        v118 = v15;
        v121 = v13;
      }
      -[SMSessionManagerState date](self, "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSince1970");
      v18 = v17;
      -[SMSessionManagerState date](v7, "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSince1970");
      if (v18 != v20)
      {

        v11 = 0;
        v13 = v121;
        goto LABEL_84;
      }
      v119 = v19;
      v117 = v16;
      -[SMSessionManagerState location](self, "location");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "coordinate");
      v22 = v21;
      -[SMSessionManagerState location](v7, "location");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "coordinate");
      v24 = v23;
      if (v22 == v23)
      {
        v28 = v19;
      }
      else
      {
        -[SMSessionManagerState location](self, "location");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "coordinate");
        v26 = v25;
        -[SMSessionManagerState location](v7, "location");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "coordinate");
        v28 = v19;
        if (vabdd_f64(v26, v27) >= 2.22044605e-16)
        {
          v11 = 0;
          v13 = v121;
          goto LABEL_82;
        }
      }
      -[SMSessionManagerState location](self, "location");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "coordinate");
      v30 = v29;
      -[SMSessionManagerState location](v7, "location");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "coordinate");
      v32 = v31;
      if (v30 == v31)
      {
        v108 = v14;
      }
      else
      {
        -[SMSessionManagerState location](self, "location");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "coordinate");
        v34 = v33;
        -[SMSessionManagerState location](v7, "location");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "coordinate");
        if (vabdd_f64(v34, v35) >= 2.22044605e-16)
        {
          v11 = 0;
          v13 = v121;
LABEL_80:

LABEL_81:
          if (v22 == v24)
          {
LABEL_83:

LABEL_84:
            v15 = v118;
            if (v13 == v14)
            {
LABEL_86:

LABEL_87:
              if (v9 == v10)
              {
LABEL_89:

                goto LABEL_90;
              }
LABEL_88:

              goto LABEL_89;
            }
LABEL_85:

            goto LABEL_86;
          }
LABEL_82:

          goto LABEL_83;
        }
        v108 = v14;
      }
      -[SMSessionManagerState allowReadToken](self, "allowReadToken");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSessionManagerState allowReadToken](v7, "allowReadToken");
      v110 = v36;
      v109 = objc_claimAutoreleasedReturnValue();
      if (v36 != (void *)v109)
      {
        -[SMSessionManagerState allowReadToken](self, "allowReadToken");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMSessionManagerState allowReadToken](v7, "allowReadToken");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = v37;
        if (!objc_msgSend(v37, "isEqual:", v103))
        {
          v11 = 0;
          v13 = v121;
          v38 = (void *)v109;
LABEL_78:

LABEL_79:
          v28 = v119;
          v14 = v108;
          if (v30 == v32)
            goto LABEL_81;
          goto LABEL_80;
        }
      }
      -[SMSessionManagerState safetyCacheKey](self, "safetyCacheKey");
      v39 = objc_claimAutoreleasedReturnValue();
      -[SMSessionManagerState safetyCacheKey](v7, "safetyCacheKey");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = (void *)v39;
      if ((void *)v39 != v40)
      {
        -[SMSessionManagerState safetyCacheKey](self, "safetyCacheKey");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMSessionManagerState safetyCacheKey](v7, "safetyCacheKey");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = v41;
        if (!objc_msgSend(v41, "isEqual:", v99))
        {
          v11 = 0;
          v13 = v121;
          v42 = v105;
LABEL_76:

LABEL_77:
          v36 = v110;
          v38 = (void *)v109;
          if (v110 == (void *)v109)
            goto LABEL_79;
          goto LABEL_78;
        }
      }
      -[SMSessionManagerState startMessageGUID](self, "startMessageGUID");
      v43 = objc_claimAutoreleasedReturnValue();
      -[SMSessionManagerState startMessageGUID](v7, "startMessageGUID");
      v44 = objc_claimAutoreleasedReturnValue();
      v101 = (void *)v43;
      v102 = v40;
      v45 = v43 == v44;
      v46 = (void *)v44;
      if (!v45)
      {
        -[SMSessionManagerState startMessageGUID](self, "startMessageGUID");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMSessionManagerState startMessageGUID](v7, "startMessageGUID");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = v47;
        if (!objc_msgSend(v47, "isEqual:", v94))
        {
          v11 = 0;
          v13 = v121;
          v48 = v101;
LABEL_74:

LABEL_75:
          v40 = v102;
          v42 = v105;
          if (v105 == v102)
            goto LABEL_77;
          goto LABEL_76;
        }
      }
      -[SMSessionManagerState scheduledSendMessageGUID](self, "scheduledSendMessageGUID");
      v49 = objc_claimAutoreleasedReturnValue();
      -[SMSessionManagerState scheduledSendMessageGUID](v7, "scheduledSendMessageGUID");
      v97 = objc_claimAutoreleasedReturnValue();
      v98 = (void *)v49;
      v96 = v46;
      if (v49 != v97)
      {
        -[SMSessionManagerState scheduledSendMessageGUID](self, "scheduledSendMessageGUID");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMSessionManagerState scheduledSendMessageGUID](v7, "scheduledSendMessageGUID");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = v50;
        if (!objc_msgSend(v50, "isEqual:", v91))
        {
          v11 = 0;
          v13 = v121;
          v52 = (void *)v97;
          v51 = v98;
          goto LABEL_72;
        }
      }
      -[SMSessionManagerState scheduledSendMessageDate](self, "scheduledSendMessageDate");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      if (v93
        || (-[SMSessionManagerState scheduledSendMessageDate](v7, "scheduledSendMessageDate"),
            (v89 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[SMSessionManagerState scheduledSendMessageDate](self, "scheduledSendMessageDate");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMSessionManagerState scheduledSendMessageDate](v7, "scheduledSendMessageDate");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "timeIntervalSinceDate:", v54);
        v56 = v55;

        v57 = -v56;
        if (v56 >= 0.0)
          v57 = v56;
        if (v57 >= 0.01)
        {
          v11 = 0;
          v13 = v121;
          goto LABEL_69;
        }
      }
      else
      {
        v89 = 0;
      }
      -[SMSessionManagerState activeDeviceIdentifier](self, "activeDeviceIdentifier");
      v58 = objc_claimAutoreleasedReturnValue();
      -[SMSessionManagerState activeDeviceIdentifier](v7, "activeDeviceIdentifier");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = (void *)v58;
      if ((void *)v58 == v59
        || (-[SMSessionManagerState activeDeviceIdentifier](self, "activeDeviceIdentifier"),
            v60 = (void *)objc_claimAutoreleasedReturnValue(),
            -[SMSessionManagerState activeDeviceIdentifier](v7, "activeDeviceIdentifier"),
            v86 = (void *)objc_claimAutoreleasedReturnValue(),
            v87 = v60,
            objc_msgSend(v60, "isEqual:", v86)))
      {
        -[SMSessionManagerState estimatedEndDate](self, "estimatedEndDate");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "timeIntervalSince1970");
        v63 = v62;
        -[SMSessionManagerState estimatedEndDate](v7, "estimatedEndDate");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "timeIntervalSince1970");
        if (v63 == v64)
        {
          v85 = v59;
          -[SMSessionManagerState coarseEstimatedEndDate](self, "coarseEstimatedEndDate");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "timeIntervalSince1970");
          v67 = v66;
          -[SMSessionManagerState coarseEstimatedEndDate](v7, "coarseEstimatedEndDate");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "timeIntervalSince1970");
          v84 = v61;
          if (v67 == v68)
          {
            v82 = v65;
            v69 = -[SMSessionManagerState estimatedEndDateStatus](self, "estimatedEndDateStatus");
            if (v69 == -[SMSessionManagerState estimatedEndDateStatus](v7, "estimatedEndDateStatus")
              && (v70 = -[SMSessionManagerState sessionEndReason](self, "sessionEndReason"),
                  v70 == -[SMSessionManagerState sessionEndReason](v7, "sessionEndReason")))
            {
              -[SMSessionManagerState sessionStateTransitionDate](self, "sessionStateTransitionDate");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "timeIntervalSince1970");
              v73 = v72;
              -[SMSessionManagerState sessionStateTransitionDate](v7, "sessionStateTransitionDate");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v81, "timeIntervalSince1970");
              if (v73 == v74)
              {
                -[SMSessionManagerState activePairedDeviceIdentifier](self, "activePairedDeviceIdentifier");
                v75 = objc_claimAutoreleasedReturnValue();
                -[SMSessionManagerState activePairedDeviceIdentifier](v7, "activePairedDeviceIdentifier");
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                v80 = (void *)v75;
                if ((void *)v75 == v79)
                {
                  v11 = 1;
                }
                else
                {
                  -[SMSessionManagerState activePairedDeviceIdentifier](self, "activePairedDeviceIdentifier", v79, v75);
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SMSessionManagerState activePairedDeviceIdentifier](v7, "activePairedDeviceIdentifier");
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  v11 = objc_msgSend(v76, "isEqual:", v77);

                }
              }
              else
              {
                v11 = 0;
              }

            }
            else
            {
              v11 = 0;
            }
            v13 = v121;
            v65 = v82;
          }
          else
          {
            v11 = 0;
            v13 = v121;
          }

          v59 = v85;
          if (v90 == v85)
            goto LABEL_68;
        }
        else
        {

          v11 = 0;
          v13 = v121;
          if (v90 == v59)
            goto LABEL_68;
        }
      }
      else
      {
        v11 = 0;
        v13 = v121;
      }

LABEL_68:
LABEL_69:
      if (!v93)

      v52 = (void *)v97;
      v51 = v98;
      if (v98 == (void *)v97)
      {
LABEL_73:

        v48 = v101;
        v46 = v96;
        if (v101 == v96)
          goto LABEL_75;
        goto LABEL_74;
      }
LABEL_72:

      goto LABEL_73;
    }
    v11 = 0;
  }
LABEL_91:

  return v11;
}

- (SMSessionManagerState)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  SMSessionConfiguration *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  SMSessionManagerState *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  int v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  SMSessionMonitorContext *v69;
  SMSessionConfiguration *v70;
  SMSessionManagerState *v71;
  SMSessionManagerState *v72;
  uint8_t buf[4];
  const char *v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "valueForKey:", CFSTR("__kSMSessionManagerStateStateKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("__kSMSessionManagerStateUserTriggerResposeKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("__kSMSessionManagerStateEstimatedEndDateStatusKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("__kSMSessionManagerStateSessionEndReasonKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "intValue");
  v10 = objc_msgSend(v5, "intValue");
  v11 = -[SMSessionConfiguration initWithDictionary:]([SMSessionConfiguration alloc], "initWithDictionary:", v4);
  if (v11)
  {
    v60 = v10;
    v62 = v9;
    v71 = self;
    v69 = -[SMSessionMonitorContext initWithDictionary:]([SMSessionMonitorContext alloc], "initWithDictionary:", v4);
    objc_msgSend(v4, "valueForKey:", CFSTR("__kSMSessionManagerStateDateKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v5;
    v59 = v12;
    if (v12)
    {
      v13 = (void *)MEMORY[0x24BDBCE60];
      objc_msgSend(v12, "doubleValue");
      objc_msgSend(v13, "dateWithTimeIntervalSince1970:");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v68 = 0;
    }
    v16 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend(v4, "valueForKey:", CFSTR("__kSMSessionManagerStateActiveDeviceIdentifierKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = (void *)objc_msgSend(v16, "initWithUUIDString:", v17);

    objc_msgSend(v4, "valueForKey:", CFSTR("__kSMSessionManagerStateLocationKeyLatitude"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKey:", CFSTR("__kSMSessionManagerStateLocationKeyLongitude"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    if (v18 && v19)
    {
      v21 = objc_alloc(MEMORY[0x24BDBFA80]);
      objc_msgSend(v18, "doubleValue");
      v23 = v22;
      objc_msgSend(v19, "doubleValue");
      v20 = objc_msgSend(v21, "initWithLatitude:longitude:", v23, v24);
    }
    v66 = (void *)v20;
    objc_msgSend(v4, "valueForKey:", CFSTR("__kSMSessionManagerStateAllowReadTokenKey"));
    v25 = objc_claimAutoreleasedReturnValue();
    v56 = (void *)v25;
    if (v25)
      v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v25, 0);
    else
      v55 = 0;
    objc_msgSend(v4, "valueForKey:", CFSTR("__kSMSessionManagerStateSafetyCacheKeyKey"));
    v26 = objc_claimAutoreleasedReturnValue();
    if (v26)
      v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v26, 0);
    else
      v53 = 0;
    v54 = (void *)v26;
    objc_msgSend(v4, "valueForKey:", CFSTR("__kSMSessionManagerStateStartMessageGUIDKey"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKey:", CFSTR("__kSMSessionManagerStateScheduledSendMessageGUIDKey"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKey:", CFSTR("__kSMSessionManagerStateScheduledSendMessageDateKey"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v27;
    if (v27)
    {
      v28 = (void *)MEMORY[0x24BDBCE60];
      objc_msgSend(v27, "doubleValue");
      objc_msgSend(v28, "dateWithTimeIntervalSince1970:");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = 0;
    }
    v58 = v18;
    objc_msgSend(v4, "valueForKey:", CFSTR("__kSMSessionManagerStateEstimatedEndDateKey"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v19;
    v49 = v30;
    if (v30)
    {
      v31 = (void *)MEMORY[0x24BDBCE60];
      objc_msgSend(v30, "doubleValue");
      objc_msgSend(v31, "dateWithTimeIntervalSince1970:");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = 0;
    }
    v47 = v62;
    v46 = v60;
    objc_msgSend(v4, "valueForKey:", CFSTR("__kSMSessionManagerStateCoarseEstimatedEndDateKey"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v6;
    v70 = v11;
    v48 = v33;
    if (v33)
    {
      v34 = (void *)MEMORY[0x24BDBCE60];
      objc_msgSend(v33, "doubleValue");
      objc_msgSend(v34, "dateWithTimeIntervalSince1970:");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = 0;
    }
    v63 = v7;
    v36 = (int)objc_msgSend(v7, "intValue");
    v61 = v8;
    v37 = (int)objc_msgSend(v8, "intValue");
    objc_msgSend(v4, "valueForKey:", CFSTR("__kSMSessionManagerStateSessionStateTransitionDateKey"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (v38)
    {
      v40 = (void *)MEMORY[0x24BDBCE60];
      objc_msgSend(v38, "doubleValue");
      objc_msgSend(v40, "dateWithTimeIntervalSince1970:");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v41 = 0;
    }
    v42 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend(v4, "valueForKey:", CFSTR("__kSMSessionManagerStateActivePairedDeviceIdentifierKey"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)objc_msgSend(v42, "initWithUUIDString:", v43);

    v72 = objc_retain(-[SMSessionManagerState initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:](v71, "initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:", v46, v70, v47, v69, v68, v66, v55, v53, v52, v51, v29, v67, v32,
              v35,
              v36,
              v37,
              v41,
              v44));

    self = v72;
    v11 = v70;

    v15 = v72;
    v6 = v64;
    v5 = v65;
    v8 = v61;
    v7 = v63;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v74 = "-[SMSessionManagerState initWithDictionary:]";
      _os_log_error_impl(&dword_245521000, v14, OS_LOG_TYPE_ERROR, "%s, configuration is nil", buf, 0xCu);
    }

    v15 = 0;
  }

  return v15;
}

- (id)outputToDictionary
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
  double v25;
  void *v26;
  void *v27;
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
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;

  v3 = (void *)objc_opt_new();
  -[SMSessionManagerState date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    -[SMSessionManagerState date](self, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSince1970");
    objc_msgSend(v5, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("__kSMSessionManagerStateDateKey"));

  }
  -[SMSessionManagerState sessionStateTransitionDate](self, "sessionStateTransitionDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x24BDD16E0];
    -[SMSessionManagerState sessionStateTransitionDate](self, "sessionStateTransitionDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSince1970");
    objc_msgSend(v9, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("__kSMSessionManagerStateSessionStateTransitionDateKey"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMSessionManagerState sessionState](self, "sessionState"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("__kSMSessionManagerStateStateKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SMSessionManagerState userTriggerResponse](self, "userTriggerResponse"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("__kSMSessionManagerStateUserTriggerResposeKey"));

  -[SMSessionManagerState monitorContext](self, "monitorContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[SMSessionManagerState monitorContext](self, "monitorContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "outputToDictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addEntriesFromDictionary:", v16);

  }
  -[SMSessionManagerState configuration](self, "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "outputToDictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    objc_msgSend(v3, "addEntriesFromDictionary:", v18);
  -[SMSessionManagerState activeDeviceIdentifier](self, "activeDeviceIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[SMSessionManagerState activeDeviceIdentifier](self, "activeDeviceIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("__kSMSessionManagerStateActiveDeviceIdentifierKey"));

  }
  -[SMSessionManagerState location](self, "location");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = (void *)MEMORY[0x24BDD16E0];
    -[SMSessionManagerState location](self, "location");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "coordinate");
    objc_msgSend(v23, "numberWithDouble:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("__kSMSessionManagerStateLocationKeyLongitude"));

    v27 = (void *)MEMORY[0x24BDD16E0];
    -[SMSessionManagerState location](self, "location");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "coordinate");
    objc_msgSend(v27, "numberWithDouble:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("__kSMSessionManagerStateLocationKeyLatitude"));

  }
  -[SMSessionManagerState allowReadToken](self, "allowReadToken");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[SMSessionManagerState allowReadToken](self, "allowReadToken");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "base64EncodedStringWithOptions:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("__kSMSessionManagerStateAllowReadTokenKey"));

  }
  -[SMSessionManagerState safetyCacheKey](self, "safetyCacheKey");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[SMSessionManagerState safetyCacheKey](self, "safetyCacheKey");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "base64EncodedStringWithOptions:", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("__kSMSessionManagerStateSafetyCacheKeyKey"));

  }
  -[SMSessionManagerState startMessageGUID](self, "startMessageGUID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[SMSessionManagerState startMessageGUID](self, "startMessageGUID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("__kSMSessionManagerStateStartMessageGUIDKey"));

  }
  -[SMSessionManagerState scheduledSendMessageGUID](self, "scheduledSendMessageGUID");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[SMSessionManagerState scheduledSendMessageGUID](self, "scheduledSendMessageGUID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("__kSMSessionManagerStateScheduledSendMessageGUIDKey"));

  }
  -[SMSessionManagerState scheduledSendMessageDate](self, "scheduledSendMessageDate");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    v41 = (void *)MEMORY[0x24BDD16E0];
    -[SMSessionManagerState scheduledSendMessageDate](self, "scheduledSendMessageDate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "timeIntervalSince1970");
    objc_msgSend(v41, "numberWithDouble:");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("__kSMSessionManagerStateScheduledSendMessageDateKey"));

  }
  -[SMSessionManagerState estimatedEndDate](self, "estimatedEndDate");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    v45 = (void *)MEMORY[0x24BDD16E0];
    -[SMSessionManagerState estimatedEndDate](self, "estimatedEndDate");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "timeIntervalSince1970");
    objc_msgSend(v45, "numberWithDouble:");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("__kSMSessionManagerStateEstimatedEndDateKey"));

  }
  -[SMSessionManagerState coarseEstimatedEndDate](self, "coarseEstimatedEndDate");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    v49 = (void *)MEMORY[0x24BDD16E0];
    -[SMSessionManagerState coarseEstimatedEndDate](self, "coarseEstimatedEndDate");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "timeIntervalSince1970");
    objc_msgSend(v49, "numberWithDouble:");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v51, CFSTR("__kSMSessionManagerStateCoarseEstimatedEndDateKey"));

  }
  -[SMSessionManagerState activePairedDeviceIdentifier](self, "activePairedDeviceIdentifier");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    -[SMSessionManagerState activePairedDeviceIdentifier](self, "activePairedDeviceIdentifier");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "UUIDString");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v54, CFSTR("__kSMSessionManagerStateActivePairedDeviceIdentifierKey"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMSessionManagerState estimatedEndDateStatus](self, "estimatedEndDateStatus"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v55, CFSTR("__kSMSessionManagerStateEstimatedEndDateStatusKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMSessionManagerState sessionEndReason](self, "sessionEndReason"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v56, CFSTR("__kSMSessionManagerStateSessionEndReasonKey"));

  return v3;
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

  v19 = (void *)MEMORY[0x24BDD17C8];
  +[SMSessionManagerState convertSessionStateToString:](SMSessionManagerState, "convertSessionStateToString:", -[SMSessionManagerState sessionState](self, "sessionState"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManagerState configuration](self, "configuration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "description");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[SMSessionMonitorContext userTriggerResponseToString:](SMSessionMonitorContext, "userTriggerResponseToString:", -[SMSessionManagerState userTriggerResponse](self, "userTriggerResponse"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManagerState monitorContext](self, "monitorContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "description");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManagerState date](self, "date");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringFromDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManagerState location](self, "location");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "description");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManagerState allowReadToken](self, "allowReadToken");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "description");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManagerState safetyCacheKey](self, "safetyCacheKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "description");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManagerState startMessageGUID](self, "startMessageGUID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManagerState scheduledSendMessageGUID](self, "scheduledSendMessageGUID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManagerState scheduledSendMessageDate](self, "scheduledSendMessageDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringFromDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManagerState activeDeviceIdentifier](self, "activeDeviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManagerState estimatedEndDate](self, "estimatedEndDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringFromDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManagerState coarseEstimatedEndDate](self, "coarseEstimatedEndDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringFromDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SMSessionManagerState convertEstimatedEndDateStatusToString:](SMSessionManagerState, "convertEstimatedEndDateStatusToString:", -[SMSessionManagerState estimatedEndDateStatus](self, "estimatedEndDateStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SMSessionMonitorContext sessionEndReasonToString:](SMSessionMonitorContext, "sessionEndReasonToString:", -[SMSessionManagerState sessionEndReason](self, "sessionEndReason"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManagerState sessionStateTransitionDate](self, "sessionStateTransitionDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManagerState activePairedDeviceIdentifier](self, "activePairedDeviceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("{SessionState:%@, Configuration:%@, UserTriggerResponse:%@, monitorContext:%@, date:%@, location:%@, allowReadToken:%@, safetyCacheKey:%@, startMessageGUID:%@, scheduledSendMessageGUID:%@, scheduledSendMessageDate:%@, activeDeviceIdentifier:%@, estimatedEndDate:%@, coarseEstimatedEndDate:%@, estimatedEndDateStatus:%@, sessionEndReason:%@, sessionStateTransitionDate:%@, activePairedDeviceIdentifier:%@}"), v31, v33, v32, v29, v30, v16, v28, v14, v27, v26, v12, v3, v4, v5, v6, v7,
    v9,
    v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (BOOL)isValidState
{
  unint64_t v2;

  v2 = -[SMSessionManagerState sessionState](self, "sessionState");
  return (v2 < 0xF) & (0x5F96u >> v2);
}

- (BOOL)isActiveState
{
  unint64_t v2;

  v2 = -[SMSessionManagerState sessionState](self, "sessionState");
  return (v2 < 0xF) & (0x4394u >> v2);
}

- (BOOL)isAnomalyState
{
  unint64_t v2;

  v2 = -[SMSessionManagerState sessionState](self, "sessionState");
  return (v2 < 0xF) & (0x4380u >> v2);
}

- (BOOL)isEndSessionState
{
  unint64_t v2;

  v2 = -[SMSessionManagerState sessionState](self, "sessionState");
  return v2 == 1 || v2 == 12;
}

- (BOOL)isPromptState
{
  unint64_t v2;

  v2 = -[SMSessionManagerState sessionState](self, "sessionState");
  return (v2 < 0xF) & (0x4380u >> v2);
}

- (BOOL)isMonitoringState
{
  return -[SMSessionManagerState sessionState](self, "sessionState") == 2;
}

- (BOOL)isCacheReleasedState
{
  return -[SMSessionManagerState sessionState](self, "sessionState") == 4;
}

- (BOOL)isTimerExtensionValid:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  BOOL v11;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[SMSessionManagerState configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SMSessionManagerState configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "time");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeBound");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v9)
  {
    objc_msgSend(v9, "timeIntervalSinceDate:", v6);
    v11 = v10 + 900.0 + a3 <= 43200.0;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315650;
      v15 = "-[SMSessionManagerState isTimerExtensionValid:]";
      v16 = 2112;
      v17 = v6;
      v18 = 2112;
      v19 = v9;
      _os_log_error_impl(&dword_245521000, v12, OS_LOG_TYPE_ERROR, "%s, Unable to determine if timer extension is valid,startDate,%@,endDate,%@", (uint8_t *)&v14, 0x20u);
    }

    v11 = 0;
  }

  return v11;
}

- (unint64_t)sessionState
{
  return self->_sessionState;
}

- (SMSessionConfiguration)configuration
{
  return self->_configuration;
}

- (int64_t)userTriggerResponse
{
  return self->_userTriggerResponse;
}

- (SMSessionMonitorContext)monitorContext
{
  return self->_monitorContext;
}

- (NSDate)date
{
  return self->_date;
}

- (CLLocation)location
{
  return self->_location;
}

- (NSData)allowReadToken
{
  return self->_allowReadToken;
}

- (NSData)safetyCacheKey
{
  return self->_safetyCacheKey;
}

- (NSString)startMessageGUID
{
  return self->_startMessageGUID;
}

- (NSString)scheduledSendMessageGUID
{
  return self->_scheduledSendMessageGUID;
}

- (NSDate)scheduledSendMessageDate
{
  return self->_scheduledSendMessageDate;
}

- (NSUUID)activeDeviceIdentifier
{
  return self->_activeDeviceIdentifier;
}

- (NSDate)estimatedEndDate
{
  return self->_estimatedEndDate;
}

- (NSDate)coarseEstimatedEndDate
{
  return self->_coarseEstimatedEndDate;
}

- (unint64_t)estimatedEndDateStatus
{
  return self->_estimatedEndDateStatus;
}

- (unint64_t)sessionEndReason
{
  return self->_sessionEndReason;
}

- (NSDate)sessionStateTransitionDate
{
  return self->_sessionStateTransitionDate;
}

- (NSUUID)activePairedDeviceIdentifier
{
  return self->_activePairedDeviceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePairedDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionStateTransitionDate, 0);
  objc_storeStrong((id *)&self->_coarseEstimatedEndDate, 0);
  objc_storeStrong((id *)&self->_estimatedEndDate, 0);
  objc_storeStrong((id *)&self->_activeDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_scheduledSendMessageDate, 0);
  objc_storeStrong((id *)&self->_scheduledSendMessageGUID, 0);
  objc_storeStrong((id *)&self->_startMessageGUID, 0);
  objc_storeStrong((id *)&self->_safetyCacheKey, 0);
  objc_storeStrong((id *)&self->_allowReadToken, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_monitorContext, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
