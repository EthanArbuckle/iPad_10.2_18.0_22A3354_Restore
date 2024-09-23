@implementation TPSMonitoringEvents

- (TPSMonitoringEvents)initWithDictionary:(id)a3 desiredOutcomeDictionary:(id)a4
{
  id v6;
  id v7;
  TPSMonitoringEvents *v8;
  void *v9;
  uint64_t v10;
  NSDictionary *initialDisplayEventMap;
  void *v12;
  uint64_t v13;
  NSDictionary *displayEventMap;
  void *v15;
  uint64_t v16;
  NSDictionary *restartTrackingTriggerEventMap;
  void *v18;
  uint64_t v19;
  NSDictionary *restartTrackingDisplayEventMap;
  void *v21;
  uint64_t v22;
  NSDictionary *dismissalEventMap;
  uint64_t v24;
  NSDictionary *desiredOutcomeEventMap;
  TPSMonitoringEvents *v26;
  objc_super v28;

  v6 = a3;
  v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)TPSMonitoringEvents;
  v8 = -[TPSMonitoringEvents init](&v28, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "TPSSafeDictionaryForKey:", CFSTR("initialDisplayEvents"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSMonitoringEvents eventMapFromMonitoringEventsDictionary:](v8, "eventMapFromMonitoringEventsDictionary:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    initialDisplayEventMap = v8->_initialDisplayEventMap;
    v8->_initialDisplayEventMap = (NSDictionary *)v10;

    objc_msgSend(v6, "TPSSafeDictionaryForKey:", CFSTR("displayEvents"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSMonitoringEvents eventMapFromMonitoringEventsDictionary:](v8, "eventMapFromMonitoringEventsDictionary:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    displayEventMap = v8->_displayEventMap;
    v8->_displayEventMap = (NSDictionary *)v13;

    objc_msgSend(v6, "TPSSafeDictionaryForKey:", CFSTR("restartTrackingTriggerEvents"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSMonitoringEvents eventMapFromMonitoringEventsDictionary:](v8, "eventMapFromMonitoringEventsDictionary:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    restartTrackingTriggerEventMap = v8->_restartTrackingTriggerEventMap;
    v8->_restartTrackingTriggerEventMap = (NSDictionary *)v16;

    objc_msgSend(v6, "TPSSafeDictionaryForKey:", CFSTR("restartTrackingDisplayEvents"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSMonitoringEvents eventMapFromMonitoringEventsDictionary:](v8, "eventMapFromMonitoringEventsDictionary:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
    restartTrackingDisplayEventMap = v8->_restartTrackingDisplayEventMap;
    v8->_restartTrackingDisplayEventMap = (NSDictionary *)v19;

    objc_msgSend(v6, "TPSSafeDictionaryForKey:", CFSTR("dismissalEvents"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSMonitoringEvents eventMapFromMonitoringEventsDictionary:](v8, "eventMapFromMonitoringEventsDictionary:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    dismissalEventMap = v8->_dismissalEventMap;
    v8->_dismissalEventMap = (NSDictionary *)v22;

    -[TPSMonitoringEvents eventMapFromMonitoringEventsDictionary:](v8, "eventMapFromMonitoringEventsDictionary:", v7);
    v24 = objc_claimAutoreleasedReturnValue();
    desiredOutcomeEventMap = v8->_desiredOutcomeEventMap;
    v8->_desiredOutcomeEventMap = (NSDictionary *)v24;

  }
  if (-[TPSMonitoringEvents hasEvents](v8, "hasEvents"))
    v26 = v8;
  else
    v26 = 0;

  return v26;
}

- (id)eventMapFromMonitoringEventsDictionary:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  TPSContextualClientContextEvent *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[TPSContextualCondition eventsForConditionDictionary:](TPSContextualCondition, "eventsForConditionDictionary:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (+[TPSContextualEvent typeFromEventDictionary:](TPSContextualEvent, "typeFromEventDictionary:", v10, (_QWORD)v15) == 4)v11 = -[TPSContextualClientContextEvent initWithDictionary:]([TPSContextualClientContextEvent alloc], "initWithDictionary:", v10);
        else
          v11 = 0;
        -[TPSContextualEvent identifier](v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
    v13 = (void *)objc_msgSend(v4, "copy");
  else
    v13 = 0;

  return v13;
}

- (BOOL)hasEvents
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[TPSMonitoringEvents initialDisplayEventMap](self, "initialDisplayEventMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[TPSMonitoringEvents displayEventMap](self, "displayEventMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 1;
    }
    else
    {
      -[TPSMonitoringEvents restartTrackingTriggerEventMap](self, "restartTrackingTriggerEventMap");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v4 = 1;
      }
      else
      {
        -[TPSMonitoringEvents restartTrackingDisplayEventMap](self, "restartTrackingDisplayEventMap");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v4 = 1;
        }
        else
        {
          -[TPSMonitoringEvents dismissalEventMap](self, "dismissalEventMap");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            v4 = 1;
          }
          else
          {
            -[TPSMonitoringEvents desiredOutcomeEventMap](self, "desiredOutcomeEventMap");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v4 = v9 != 0;

          }
        }

      }
    }

  }
  return v4;
}

- (NSDictionary)restartTrackingTriggerEventMap
{
  return self->_restartTrackingTriggerEventMap;
}

- (NSDictionary)restartTrackingDisplayEventMap
{
  return self->_restartTrackingDisplayEventMap;
}

- (NSDictionary)initialDisplayEventMap
{
  return self->_initialDisplayEventMap;
}

- (NSDictionary)displayEventMap
{
  return self->_displayEventMap;
}

- (NSDictionary)dismissalEventMap
{
  return self->_dismissalEventMap;
}

- (NSDictionary)desiredOutcomeEventMap
{
  return self->_desiredOutcomeEventMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredOutcomeEventMap, 0);
  objc_storeStrong((id *)&self->_dismissalEventMap, 0);
  objc_storeStrong((id *)&self->_restartTrackingDisplayEventMap, 0);
  objc_storeStrong((id *)&self->_restartTrackingTriggerEventMap, 0);
  objc_storeStrong((id *)&self->_displayEventMap, 0);
  objc_storeStrong((id *)&self->_initialDisplayEventMap, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSMonitoringEvents)initWithCoder:(id)a3
{
  id v4;
  TPSMonitoringEvents *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *initialDisplayEventMap;
  uint64_t v12;
  NSDictionary *displayEventMap;
  uint64_t v14;
  NSDictionary *restartTrackingTriggerEventMap;
  uint64_t v16;
  NSDictionary *restartTrackingDisplayEventMap;
  uint64_t v18;
  NSDictionary *dismissalEventMap;
  uint64_t v20;
  NSDictionary *desiredOutcomeEventMap;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TPSMonitoringEvents;
  v5 = -[TPSMonitoringEvents init](&v23, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("initialDisplayEvents"));
    v10 = objc_claimAutoreleasedReturnValue();
    initialDisplayEventMap = v5->_initialDisplayEventMap;
    v5->_initialDisplayEventMap = (NSDictionary *)v10;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("displayEvents"));
    v12 = objc_claimAutoreleasedReturnValue();
    displayEventMap = v5->_displayEventMap;
    v5->_displayEventMap = (NSDictionary *)v12;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("restartTrackingTriggerEvents"));
    v14 = objc_claimAutoreleasedReturnValue();
    restartTrackingTriggerEventMap = v5->_restartTrackingTriggerEventMap;
    v5->_restartTrackingTriggerEventMap = (NSDictionary *)v14;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("restartTrackingDisplayEvents"));
    v16 = objc_claimAutoreleasedReturnValue();
    restartTrackingDisplayEventMap = v5->_restartTrackingDisplayEventMap;
    v5->_restartTrackingDisplayEventMap = (NSDictionary *)v16;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("dismissalEvents"));
    v18 = objc_claimAutoreleasedReturnValue();
    dismissalEventMap = v5->_dismissalEventMap;
    v5->_dismissalEventMap = (NSDictionary *)v18;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("desiredOutcome"));
    v20 = objc_claimAutoreleasedReturnValue();
    desiredOutcomeEventMap = v5->_desiredOutcomeEventMap;
    v5->_desiredOutcomeEventMap = (NSDictionary *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *initialDisplayEventMap;
  id v5;

  initialDisplayEventMap = self->_initialDisplayEventMap;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", initialDisplayEventMap, CFSTR("initialDisplayEvents"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayEventMap, CFSTR("displayEvents"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_restartTrackingTriggerEventMap, CFSTR("restartTrackingTriggerEvents"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_restartTrackingDisplayEventMap, CFSTR("restartTrackingDisplayEvents"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dismissalEventMap, CFSTR("dismissalEvents"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_desiredOutcomeEventMap, CFSTR("desiredOutcome"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  objc_msgSend(v4, "setInitialDisplayEventMap:", self->_initialDisplayEventMap);
  objc_msgSend(v4, "setDisplayEventMap:", self->_displayEventMap);
  objc_msgSend(v4, "setRestartTrackingTriggerEventMap:", self->_restartTrackingTriggerEventMap);
  objc_msgSend(v4, "setRestartTrackingDisplayEventMap:", self->_restartTrackingDisplayEventMap);
  objc_msgSend(v4, "setDismissalEventMap:", self->_dismissalEventMap);
  objc_msgSend(v4, "setDesiredOutcomeEventMap:", self->_desiredOutcomeEventMap);
  return v4;
}

- (unint64_t)eventOptionsForEventIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  unint64_t v23;

  v4 = a3;
  -[TPSMonitoringEvents initialDisplayEventMap](self, "initialDisplayEventMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6 != 0;
  -[TPSMonitoringEvents displayEventMap](self, "displayEventMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v7 |= 2uLL;
  -[TPSMonitoringEvents restartTrackingTriggerEventMap](self, "restartTrackingTriggerEventMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v12 = v7 | 8;
  else
    v12 = v7;
  -[TPSMonitoringEvents restartTrackingDisplayEventMap](self, "restartTrackingDisplayEventMap");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v4);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[TPSMonitoringEvents displayEventMap](self, "displayEventMap");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v17)
      v12 |= 4uLL;
  }
  else
  {

  }
  -[TPSMonitoringEvents dismissalEventMap](self, "dismissalEventMap");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    v20 = v12 | 0x10;
  else
    v20 = v12;
  -[TPSMonitoringEvents desiredOutcomeEventMap](self, "desiredOutcomeEventMap");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    v23 = v20 | 0x20;
  else
    v23 = v20;

  return v23;
}

- (BOOL)hasClientContextKeysForEventOptions:(unint64_t)a3
{
  void *v3;
  BOOL v4;

  -[TPSMonitoringEvents clientContextKeysForEventOptions:](self, "clientContextKeysForEventOptions:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (BOOL)hasRegistrableContextualEventsForEventOptions:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;

  -[TPSMonitoringEvents registrableContextualEventsForEventOptions:type:](self, "registrableContextualEventsForEventOptions:type:", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
    return 1;
  -[TPSMonitoringEvents registrableContextualEventsForEventOptions:type:](self, "registrableContextualEventsForEventOptions:type:", a3, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v8, "count") != 0;

  return v7;
}

- (id)clientContextKeysForEventOptions:(unint64_t)a3
{
  char v3;
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

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v3 & 8) != 0)
  {
    -[TPSMonitoringEvents restartTrackingTriggerEventMap](self, "restartTrackingTriggerEventMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSMonitoringEvents clientContextKeysForMap:](self, "clientContextKeysForMap:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v10);

    if ((v3 & 1) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((v3 & 1) == 0)
  {
    goto LABEL_3;
  }
  -[TPSMonitoringEvents initialDisplayEventMap](self, "initialDisplayEventMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSMonitoringEvents clientContextKeysForMap:](self, "clientContextKeysForMap:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v12);

  if ((v3 & 2) == 0)
  {
LABEL_4:
    if ((v3 & 4) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  -[TPSMonitoringEvents displayEventMap](self, "displayEventMap");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSMonitoringEvents clientContextKeysForMap:](self, "clientContextKeysForMap:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v14);

  if ((v3 & 4) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  -[TPSMonitoringEvents restartTrackingDisplayEventMap](self, "restartTrackingDisplayEventMap");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSMonitoringEvents clientContextKeysForMap:](self, "clientContextKeysForMap:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v16);

  if ((v3 & 0x10) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_14:
  -[TPSMonitoringEvents dismissalEventMap](self, "dismissalEventMap");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSMonitoringEvents clientContextKeysForMap:](self, "clientContextKeysForMap:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v18);

  if ((v3 & 0x20) != 0)
  {
LABEL_7:
    -[TPSMonitoringEvents desiredOutcomeEventMap](self, "desiredOutcomeEventMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSMonitoringEvents clientContextKeysForMap:](self, "clientContextKeysForMap:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v7);

  }
LABEL_8:
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)registrableContextualEventsForEventOptions:(unint64_t)a3 type:(int64_t)a4
{
  char v5;
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

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 & 8) != 0)
  {
    -[TPSMonitoringEvents restartTrackingTriggerEventMap](self, "restartTrackingTriggerEventMap");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSMonitoringEvents registrableContextualEventsForMap:type:](self, "registrableContextualEventsForMap:type:", v11, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v12);

    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_3;
  }
  -[TPSMonitoringEvents initialDisplayEventMap](self, "initialDisplayEventMap");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSMonitoringEvents registrableContextualEventsForMap:type:](self, "registrableContextualEventsForMap:type:", v13, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v14);

  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  -[TPSMonitoringEvents displayEventMap](self, "displayEventMap");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSMonitoringEvents registrableContextualEventsForMap:type:](self, "registrableContextualEventsForMap:type:", v15, a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v16);

  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  -[TPSMonitoringEvents restartTrackingDisplayEventMap](self, "restartTrackingDisplayEventMap");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSMonitoringEvents registrableContextualEventsForMap:type:](self, "registrableContextualEventsForMap:type:", v17, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v18);

  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_14:
  -[TPSMonitoringEvents dismissalEventMap](self, "dismissalEventMap");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSMonitoringEvents registrableContextualEventsForMap:type:](self, "registrableContextualEventsForMap:type:", v19, a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v20);

  if ((v5 & 0x20) != 0)
  {
LABEL_7:
    -[TPSMonitoringEvents desiredOutcomeEventMap](self, "desiredOutcomeEventMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSMonitoringEvents registrableContextualEventsForMap:type:](self, "registrableContextualEventsForMap:type:", v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v9);

  }
LABEL_8:
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)autoDismissEvents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0C99E08];
  -[TPSMonitoringEvents dismissalEventMap](self, "dismissalEventMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[TPSMonitoringEvents desiredOutcomeEventMap](self, "desiredOutcomeEventMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v6);

  -[TPSMonitoringEvents displayEventMap](self, "displayEventMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    -[TPSMonitoringEvents restartTrackingDisplayEventMap](self, "restartTrackingDisplayEventMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addEntriesFromDictionary:", v9);

  }
  objc_msgSend(v5, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)registrableContextualEventsForMap:(id)a3 type:(int64_t)a4
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E20], "set", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)clientContextKeysForMap:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v3, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "clientContextKeys");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObjectsFromArray:", v11);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)clientContextEventsForMap:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v4, "addObject:", v10);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  if (v4)
    v11 = (void *)objc_msgSend(v4, "copy");
  else
    v11 = 0;

  return v11;
}

- (id)debugDescription
{
  id v3;
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
  objc_super v19;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v19.receiver = self;
  v19.super_class = (Class)TPSMonitoringEvents;
  -[TPSSerializableObject debugDescription](&v19, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  if (-[NSDictionary count](self->_initialDisplayEventMap, "count"))
  {
    -[NSDictionary allValues](self->_initialDisplayEventMap, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "debugDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("initialDisplayEvents"), v7);

  }
  if (-[NSDictionary count](self->_displayEventMap, "count"))
  {
    -[NSDictionary allValues](self->_displayEventMap, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "debugDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("displayEvents"), v9);

  }
  if (-[NSDictionary count](self->_restartTrackingTriggerEventMap, "count"))
  {
    -[NSDictionary allValues](self->_restartTrackingTriggerEventMap, "allValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "debugDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("restartTrackingTriggerEvents"), v11);

  }
  if (-[NSDictionary count](self->_restartTrackingDisplayEventMap, "count"))
  {
    -[NSDictionary allValues](self->_restartTrackingDisplayEventMap, "allValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "debugDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("restartTrackingDisplayEvents"), v13);

  }
  if (-[NSDictionary count](self->_dismissalEventMap, "count"))
  {
    -[NSDictionary allValues](self->_dismissalEventMap, "allValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "debugDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("dismissalEvents"), v15);

  }
  if (-[NSDictionary count](self->_desiredOutcomeEventMap, "count"))
  {
    -[NSDictionary allValues](self->_desiredOutcomeEventMap, "allValues");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "debugDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("desiredOutcome"), v17);

  }
  return v5;
}

- (void)setInitialDisplayEventMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setDisplayEventMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setRestartTrackingTriggerEventMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setRestartTrackingDisplayEventMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setDismissalEventMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setDesiredOutcomeEventMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

@end
