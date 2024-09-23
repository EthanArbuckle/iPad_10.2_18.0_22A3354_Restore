@implementation SMSessionMonitorState

- (SMSessionMonitorState)initWithSessionIdentifier:(id)a3 currentRegionState:(unint64_t)a4 triggerPending:(BOOL)a5 triggerConfirmed:(BOOL)a6 date:(id)a7
{
  id v13;
  id v14;
  SMSessionMonitorState *v15;
  SMSessionMonitorState *v16;
  objc_super v18;

  v13 = a3;
  v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)SMSessionMonitorState;
  v15 = -[SMSessionMonitorState init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sessionIdentifier, a3);
    v16->_currentRegionState = a4;
    v16->_triggerPending = a5;
    v16->_triggerConfirmed = a6;
    objc_storeStrong((id *)&v16->_date, a7);
    v16->_dirty = 1;
  }

  return v16;
}

- (void)markDirty
{
  NSDate *v3;
  NSDate *date;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  date = self->_date;
  self->_date = v3;

  self->_dirty = 1;
}

- (void)setCurrentRegionState:(unint64_t)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (self->_currentRegionState != a3)
  {
    self->_currentRegionState = a3;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      +[SMSessionMonitorState regionStateToString:](SMSessionMonitorState, "regionStateToString:", self->_currentRegionState);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 136315394;
      v7 = "-[SMSessionMonitorState setCurrentRegionState:]";
      v8 = 2112;
      v9 = v5;
      _os_log_impl(&dword_245521000, v4, OS_LOG_TYPE_INFO, "%s, currentRegionState, %@", (uint8_t *)&v6, 0x16u);

    }
    -[SMSessionMonitorState markDirty](self, "markDirty");
  }
}

- (void)setTriggerPending:(BOOL)a3
{
  NSObject *v4;
  _BOOL4 triggerPending;
  int v6;
  const char *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (self->_triggerPending != a3)
  {
    self->_triggerPending = a3;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      triggerPending = self->_triggerPending;
      v6 = 136315394;
      v7 = "-[SMSessionMonitorState setTriggerPending:]";
      v8 = 1024;
      v9 = triggerPending;
      _os_log_impl(&dword_245521000, v4, OS_LOG_TYPE_INFO, "%s, triggerPending, %d", (uint8_t *)&v6, 0x12u);
    }

    -[SMSessionMonitorState markDirty](self, "markDirty");
  }
}

- (void)setTriggerConfirmed:(BOOL)a3
{
  NSObject *v4;
  _BOOL4 triggerConfirmed;
  int v6;
  const char *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (self->_triggerConfirmed != a3)
  {
    self->_triggerConfirmed = a3;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      triggerConfirmed = self->_triggerConfirmed;
      v6 = 136315394;
      v7 = "-[SMSessionMonitorState setTriggerConfirmed:]";
      v8 = 1024;
      v9 = triggerConfirmed;
      _os_log_impl(&dword_245521000, v4, OS_LOG_TYPE_INFO, "%s, triggerConfirmed, %d", (uint8_t *)&v6, 0x12u);
    }

    -[SMSessionMonitorState markDirty](self, "markDirty");
  }
}

+ (id)regionStateToString:(unint64_t)a3
{
  if (a3 > 3)
    return CFSTR("Invalid");
  else
    return off_25166D728[a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMSessionMonitorState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  SMSessionMonitorState *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMSessionMonitorStateSessionIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("__kSMSessionMonitorStateCurrentRegionStateKey"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("__kSMSessionMonitorStateTriggerPendingKey"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("__kSMSessionMonitorStateTriggerConfirmedKey"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMSessionMonitorStateDateKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SMSessionMonitorState initWithSessionIdentifier:currentRegionState:triggerPending:triggerConfirmed:date:](self, "initWithSessionIdentifier:currentRegionState:triggerPending:triggerConfirmed:date:", v5, v6, v7, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *sessionIdentifier;
  id v5;

  sessionIdentifier = self->_sessionIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sessionIdentifier, CFSTR("__kSMSessionMonitorStateSessionIdentifierKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_currentRegionState, CFSTR("__kSMSessionMonitorStateCurrentRegionStateKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_triggerPending, CFSTR("__kSMSessionMonitorStateTriggerPendingKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_triggerConfirmed, CFSTR("__kSMSessionMonitorStateTriggerConfirmedKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("__kSMSessionMonitorStateDateKey"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  SMSessionMonitorState *v4;
  void *v5;
  unint64_t v6;
  _BOOL8 v7;
  _BOOL8 v8;
  void *v9;
  SMSessionMonitorState *v10;

  v4 = +[SMSessionMonitorState allocWithZone:](SMSessionMonitorState, "allocWithZone:", a3);
  -[SMSessionMonitorState sessionIdentifier](self, "sessionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SMSessionMonitorState currentRegionState](self, "currentRegionState");
  v7 = -[SMSessionMonitorState triggerPending](self, "triggerPending");
  v8 = -[SMSessionMonitorState triggerConfirmed](self, "triggerConfirmed");
  -[SMSessionMonitorState date](self, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SMSessionMonitorState initWithSessionIdentifier:currentRegionState:triggerPending:triggerConfirmed:date:](v4, "initWithSessionIdentifier:currentRegionState:triggerPending:triggerConfirmed:date:", v5, v6, v7, v8, v9);

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  -[SMSessionMonitorState sessionIdentifier](self, "sessionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[SMSessionMonitorState currentRegionState](self, "currentRegionState") ^ v4;
  v6 = v5 ^ -[SMSessionMonitorState triggerPending](self, "triggerPending");
  v7 = -[SMSessionMonitorState triggerConfirmed](self, "triggerConfirmed");
  -[SMSessionMonitorState date](self, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  SMSessionMonitorState *v4;
  SMSessionMonitorState *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  _BOOL4 v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  char v22;
  void *v23;
  char v24;
  char v25;
  char v27;
  unint64_t v28;

  v4 = (SMSessionMonitorState *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SMSessionMonitorState sessionIdentifier](self, "sessionIdentifier");
      v6 = objc_claimAutoreleasedReturnValue();
      -[SMSessionMonitorState sessionIdentifier](v5, "sessionIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((void *)v6 == v7)
      {
        v11 = 0;
      }
      else
      {
        -[SMSessionMonitorState sessionIdentifier](self, "sessionIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMSessionMonitorState sessionIdentifier](v5, "sessionIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

        v11 = v10 ^ 1;
      }

      v13 = -[SMSessionMonitorState currentRegionState](self, "currentRegionState");
      v14 = -[SMSessionMonitorState currentRegionState](v5, "currentRegionState");
      v15 = -[SMSessionMonitorState triggerPending](self, "triggerPending");
      LODWORD(v6) = v15 ^ -[SMSessionMonitorState triggerPending](v5, "triggerPending");
      v16 = -[SMSessionMonitorState triggerConfirmed](self, "triggerConfirmed");
      v17 = v16 ^ -[SMSessionMonitorState triggerConfirmed](v5, "triggerConfirmed");
      -[SMSessionMonitorState date](self, "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSessionMonitorState date](v5, "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18 == v19)
      {
        v24 = 1;
      }
      else
      {
        -[SMSessionMonitorState date](self, "date");
        v28 = v13;
        v27 = v11;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMSessionMonitorState date](v5, "date");
        v21 = v17;
        v22 = v6;
        v6 = v14;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v20, "isEqual:", v23);

        v14 = v6;
        LOBYTE(v6) = v22;
        LOBYTE(v17) = v21;

        v11 = v27;
        v13 = v28;
      }

      if (v13 == v14)
        v25 = v11;
      else
        v25 = 1;
      v12 = v24 & ~(v25 | v6 | v17);

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SMSessionMonitorState sessionIdentifier](self, "sessionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionMonitorState date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SMSessionMonitorState regionStateToString:](SMSessionMonitorState, "regionStateToString:", -[SMSessionMonitorState currentRegionState](self, "currentRegionState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("sessionIdenfier, %@, date, %@, currentRegionState, %@, triggerPending, %d, triggerConfirmed, %d"), v4, v6, v7, -[SMSessionMonitorState triggerPending](self, "triggerPending"), -[SMSessionMonitorState triggerConfirmed](self, "triggerConfirmed"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (unint64_t)currentRegionState
{
  return self->_currentRegionState;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)triggerPending
{
  return self->_triggerPending;
}

- (BOOL)triggerConfirmed
{
  return self->_triggerConfirmed;
}

- (BOOL)dirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
