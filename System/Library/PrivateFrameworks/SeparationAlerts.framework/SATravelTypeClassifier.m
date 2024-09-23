@implementation SATravelTypeClassifier

- (void)ingestTAEvent:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SATravelTypeClassifier _handleVehicleStateEvent:](self, "_handleVehicleStateEvent:", v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SATravelTypeClassifier _handleUserActivityEvent:](self, "_handleUserActivityEvent:", v4);
  }

}

- (SATravelTypeClassifier)initWithClock:(id)a3
{
  id v5;
  SATravelTypeClassifier *v6;
  uint64_t v7;
  NSHashTable *clients;
  uint64_t v9;
  NSDate *currentTravelTypeChangeDate;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SATravelTypeClassifier;
  v6 = -[SATravelTypeClassifier init](&v12, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v7 = objc_claimAutoreleasedReturnValue();
    clients = v6->_clients;
    v6->_clients = (NSHashTable *)v7;

    v6->_currentTravelType = 0;
    objc_storeStrong((id *)&v6->_clock, a3);
    -[SATimeServiceProtocol getCurrentTime](v6->_clock, "getCurrentTime");
    v9 = objc_claimAutoreleasedReturnValue();
    currentTravelTypeChangeDate = v6->_currentTravelTypeChangeDate;
    v6->_currentTravelTypeChangeDate = (NSDate *)v9;

  }
  return v6;
}

+ (id)convertSATravelTypeToString:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 1)
    v3 = CFSTR("Vehicular");
  if (a3 == 2)
    return CFSTR("NonVehicular");
  else
    return (id)v3;
}

- (id)_vehicularHintsToString:(unint64_t)a3
{
  char v3;
  id v4;
  void *v5;
  const __CFString *v6;
  id v7;
  const __CFString *v8;
  id v9;
  const __CFString *v10;
  id v11;
  const __CFString *v12;
  id v13;
  const __CFString *v14;
  id v15;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3940]);
  v5 = v4;
  if ((v3 & 1) != 0)
    v6 = CFSTR("M");
  else
    v6 = CFSTR("-");
  v7 = (id)objc_msgSend(v4, "stringByAppendingString:", v6);
  if ((v3 & 2) != 0)
    v8 = CFSTR("G");
  else
    v8 = CFSTR("-");
  v9 = (id)objc_msgSend(v5, "stringByAppendingString:", v8);
  if ((v3 & 4) != 0)
    v10 = CFSTR("C");
  else
    v10 = CFSTR("-");
  v11 = (id)objc_msgSend(v5, "stringByAppendingString:", v10);
  if ((v3 & 8) != 0)
    v12 = CFSTR("W");
  else
    v12 = CFSTR("-");
  v13 = (id)objc_msgSend(v5, "stringByAppendingString:", v12);
  if ((v3 & 0x10) != 0)
    v14 = CFSTR("B");
  else
    v14 = CFSTR("-");
  v15 = (id)objc_msgSend(v5, "stringByAppendingString:", v14);
  return v5;
}

- (BOOL)_setNewTravelType:(unint64_t)a3 hints:(unint64_t)a4
{
  unint64_t v7;
  unint64_t v8;
  void *v9;

  v7 = -[SATravelTypeClassifier currentTravelType](self, "currentTravelType");
  -[SATravelTypeClassifier setCurrentTravelType:](self, "setCurrentTravelType:", a3);
  v8 = -[SATravelTypeClassifier currentTravelType](self, "currentTravelType");
  if (v8 != v7)
  {
    -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SATravelTypeClassifier setCurrentTravelTypeChangeDate:](self, "setCurrentTravelTypeChangeDate:", v9);

    -[SATravelTypeClassifier _notifyAllClientsOfTravelTypeChangeFrom:to:hints:](self, "_notifyAllClientsOfTravelTypeChangeFrom:to:hints:", v7, -[SATravelTypeClassifier currentTravelType](self, "currentTravelType"), a4);
  }
  return v8 != v7;
}

- (void)_handleVehicleStateEvent:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  id v16;
  SATravelTypeClassifier *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  id v23;
  int v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "vehicularState");
  v6 = objc_msgSend(v4, "vehicularHints");

  switch(v5)
  {
    case 2:
      v12 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v12;
        +[SATravelTypeClassifier convertSATravelTypeToString:](SATravelTypeClassifier, "convertSATravelTypeToString:", -[SATravelTypeClassifier currentTravelType](self, "currentTravelType"));
        v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v15 = objc_msgSend(v14, "UTF8String");
        -[SATravelTypeClassifier _vehicularHintsToString:](self, "_vehicularHintsToString:", v6);
        v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v24 = 68289795;
        v25 = 0;
        v26 = 2082;
        v27 = "";
        v28 = 2081;
        v29 = v15;
        v30 = 2081;
        v31 = "Vehicular";
        v32 = 2081;
        v33 = objc_msgSend(v16, "UTF8String");
        _os_log_impl(&dword_1CA04F000, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SATravelTypeClassifier handleVehicleState\", \"curr\":\"%{private}s\", \"new\":\"%{private}s\", \"hints\":\"%{private}s\"}", (uint8_t *)&v24, 0x30u);

      }
      v17 = self;
      v18 = 1;
      goto LABEL_12;
    case 1:
      v19 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        v20 = v19;
        +[SATravelTypeClassifier convertSATravelTypeToString:](SATravelTypeClassifier, "convertSATravelTypeToString:", -[SATravelTypeClassifier currentTravelType](self, "currentTravelType"));
        v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v22 = objc_msgSend(v21, "UTF8String");
        -[SATravelTypeClassifier _vehicularHintsToString:](self, "_vehicularHintsToString:", v6);
        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v24 = 68289795;
        v25 = 0;
        v26 = 2082;
        v27 = "";
        v28 = 2081;
        v29 = v22;
        v30 = 2081;
        v31 = "NonVehicular";
        v32 = 2081;
        v33 = objc_msgSend(v23, "UTF8String");
        _os_log_impl(&dword_1CA04F000, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SATravelTypeClassifier handleVehicleState\", \"curr\":\"%{private}s\", \"new\":\"%{private}s\", \"hints\":\"%{private}s\"}", (uint8_t *)&v24, 0x30u);

      }
      v17 = self;
      v18 = 2;
LABEL_12:
      -[SATravelTypeClassifier _setNewTravelType:hints:](v17, "_setNewTravelType:hints:", v18, v6);
      return;
    case 0:
      v7 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        v8 = v7;
        +[SATravelTypeClassifier convertSATravelTypeToString:](SATravelTypeClassifier, "convertSATravelTypeToString:", -[SATravelTypeClassifier currentTravelType](self, "currentTravelType"));
        v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v10 = objc_msgSend(v9, "UTF8String");
        -[SATravelTypeClassifier _vehicularHintsToString:](self, "_vehicularHintsToString:", v6);
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v24 = 68289795;
        v25 = 0;
        v26 = 2082;
        v27 = "";
        v28 = 2081;
        v29 = v10;
        v30 = 2081;
        v31 = "Unknown";
        v32 = 2081;
        v33 = objc_msgSend(v11, "UTF8String");
        _os_log_impl(&dword_1CA04F000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SATravelTypeClassifier handleVehicleState\", \"curr\":\"%{private}s\", \"new\":\"%{private}s\", \"hints\":\"%{private}s\"}", (uint8_t *)&v24, 0x30u);

      }
      break;
  }
}

- (void)_handleUserActivityEvent:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  switch(objc_msgSend(a3, "activityType"))
  {
    case 0:
      v4 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
      {
        v5 = v4;
        +[SATravelTypeClassifier convertSATravelTypeToString:](SATravelTypeClassifier, "convertSATravelTypeToString:", -[SATravelTypeClassifier currentTravelType](self, "currentTravelType"));
        v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v11 = 68289539;
        v12 = 0;
        v13 = 2082;
        v14 = "";
        v15 = 2081;
        v16 = objc_msgSend(v6, "UTF8String");
        v17 = 2081;
        v18 = "Unknown";
        goto LABEL_12;
      }
      break;
    case 1:
      v7 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
      {
        v5 = v7;
        +[SATravelTypeClassifier convertSATravelTypeToString:](SATravelTypeClassifier, "convertSATravelTypeToString:", -[SATravelTypeClassifier currentTravelType](self, "currentTravelType"));
        v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v11 = 68289539;
        v12 = 0;
        v13 = 2082;
        v14 = "";
        v15 = 2081;
        v16 = objc_msgSend(v6, "UTF8String");
        v17 = 2081;
        v18 = "NonVehicular - Static";
        goto LABEL_12;
      }
      break;
    case 2:
      v8 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
      {
        v5 = v8;
        +[SATravelTypeClassifier convertSATravelTypeToString:](SATravelTypeClassifier, "convertSATravelTypeToString:", -[SATravelTypeClassifier currentTravelType](self, "currentTravelType"));
        v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v11 = 68289539;
        v12 = 0;
        v13 = 2082;
        v14 = "";
        v15 = 2081;
        v16 = objc_msgSend(v6, "UTF8String");
        v17 = 2081;
        v18 = "NonVehicular - Pedestrian";
        goto LABEL_12;
      }
      break;
    case 3:
      v9 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
      {
        v5 = v9;
        +[SATravelTypeClassifier convertSATravelTypeToString:](SATravelTypeClassifier, "convertSATravelTypeToString:", -[SATravelTypeClassifier currentTravelType](self, "currentTravelType"));
        v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v11 = 68289539;
        v12 = 0;
        v13 = 2082;
        v14 = "";
        v15 = 2081;
        v16 = objc_msgSend(v6, "UTF8String");
        v17 = 2081;
        v18 = "Vehicular";
        goto LABEL_12;
      }
      break;
    case 4:
      v10 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
      {
        v5 = v10;
        +[SATravelTypeClassifier convertSATravelTypeToString:](SATravelTypeClassifier, "convertSATravelTypeToString:", -[SATravelTypeClassifier currentTravelType](self, "currentTravelType"));
        v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v11 = 68289539;
        v12 = 0;
        v13 = 2082;
        v14 = "";
        v15 = 2081;
        v16 = objc_msgSend(v6, "UTF8String");
        v17 = 2081;
        v18 = "NonVehicular - Cycling";
LABEL_12:
        _os_log_impl(&dword_1CA04F000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#SATravelTypeClassifier handleUserActivity\", \"curr\":\"%{private}s\", \"new\":\"%{private}s\"}", (uint8_t *)&v11, 0x26u);

      }
      break;
    default:
      return;
  }
}

- (void)_notifyAllClientsOfTravelTypeChangeFrom:(unint64_t)a3 to:(unint64_t)a4 hints:(unint64_t)a5
{
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t buf;
  __int16 v25;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    +[SATravelTypeClassifier convertSATravelTypeToString:](SATravelTypeClassifier, "convertSATravelTypeToString:", a3);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = objc_msgSend(v11, "UTF8String");
    +[SATravelTypeClassifier convertSATravelTypeToString:](SATravelTypeClassifier, "convertSATravelTypeToString:", a4);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    buf = 68289539;
    v25 = 2082;
    v26 = "";
    v27 = 2081;
    v28 = v12;
    v29 = 2081;
    v30 = objc_msgSend(v13, "UTF8String");
    _os_log_impl(&dword_1CA04F000, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SATravelTypeClassifier notifyTravelTypeChange\", \"from\":\"%{private}s\", \"to\":\"%{private}s\"}", (uint8_t *)&buf, 0x26u);

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[SATravelTypeClassifier clients](self, "clients", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "didChangeTravelTypeFrom:to:hints:", a3, a4, a5);
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v16);
  }

}

- (void)addClient:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SATravelTypeClassifier clients](self, "clients");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeClient:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SATravelTypeClassifier clients](self, "clients");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (SATimeServiceProtocol)clock
{
  return self->_clock;
}

- (void)setClock:(id)a3
{
  objc_storeStrong((id *)&self->_clock, a3);
}

- (NSHashTable)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
  objc_storeStrong((id *)&self->_clients, a3);
}

- (unint64_t)currentTravelType
{
  return self->_currentTravelType;
}

- (void)setCurrentTravelType:(unint64_t)a3
{
  self->_currentTravelType = a3;
}

- (NSDate)currentTravelTypeChangeDate
{
  return self->_currentTravelTypeChangeDate;
}

- (void)setCurrentTravelTypeChangeDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTravelTypeChangeDate, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_clock, 0);
}

@end
