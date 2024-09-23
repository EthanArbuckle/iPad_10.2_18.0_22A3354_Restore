@implementation PPConnectionsCalendarSource

- (id)identifier
{
  return CFSTR("calendar");
}

- (PPConnectionsCalendarSource)init
{
  PPConnectionsCalendarSource *v2;
  uint64_t v3;
  PPLocalEventStore *localEventStore;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PPConnectionsCalendarSource;
  v2 = -[PPConnectionsCalendarSource init](&v6, sel_init);
  if (v2)
  {
    +[PPLocalEventStore defaultStore](PPLocalEventStore, "defaultStore");
    v3 = objc_claimAutoreleasedReturnValue();
    localEventStore = v2->_localEventStore;
    v2->_localEventStore = (PPLocalEventStore *)v3;

  }
  return v2;
}

- (id)ekEventWithExternalID:(id)a3
{
  return -[PPLocalEventStore eventWithExternalID:](self->_localEventStore, "eventWithExternalID:", a3);
}

- (BOOL)isCalendarEventEligibleForLocationPrediction:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "eventFlags") & 4) != 0)
  {
    objc_msgSend(v4, "structuredLocationAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)locationItemsWithCriteria:(id)a3 earliest:(id)a4 latest:(id)a5 limit:(unint64_t)a6 consumer:(unint64_t)a7 explanationSet:(id)a8
{
  char v9;
  id v12;
  id v13;
  void *v14;
  double v16;
  double v17;
  void *v18;
  void *v19;
  PPLocalEventStore *localEventStore;
  id v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v9 = a7;
  v47 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a8;
  if ((v9 & 6) != 0 || objc_msgSend(a3, "locationField") == 10)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v12, "timeIntervalSinceNow");
    v17 = v16;
    v18 = (void *)objc_opt_new();
    v19 = v18;
    if (self)
    {
      localEventStore = self->_localEventStore;
      v21 = v18;
      objc_msgSend(v21, "dateByAddingTimeInterval:", v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPLocalEventStore eventsFromDate:toDate:](localEventStore, "eventsFromDate:toDate:", v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v23 = 0;
    }

    if (objc_msgSend(v23, "count"))
    {
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v24 = v23;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      if (v25)
      {
        v26 = v25;
        v27 = 0;
        v28 = *(_QWORD *)v42;
LABEL_10:
        v29 = 0;
        while (1)
        {
          if (*(_QWORD *)v42 != v28)
            objc_enumerationMutation(v24);
          v30 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v29);
          if (-[PPConnectionsCalendarSource isCalendarEventEligibleForLocationPrediction:](self, "isCalendarEventEligibleForLocationPrediction:", v30, (_QWORD)v41))
          {
            break;
          }
          ++v29;
          v27 = 1;
          if (v26 == v29)
          {
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
            if (v26)
              goto LABEL_10;

LABEL_23:
            v39 = v13;
            v40 = 30;
            goto LABEL_20;
          }
        }
        objc_msgSend((id)objc_opt_class(), "locationLabelFromEvent:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "locationValueFromEvent:", v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_alloc(MEMORY[0x1E0D70AF0]);
        v34 = (void *)objc_msgSend(v33, "initWithOriginatingBundleID:", *MEMORY[0x1E0D70DC0]);
        objc_msgSend((id)objc_opt_class(), "locationNameFromEvent:", v30);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setName:", v35);

        objc_msgSend(v34, "setLabel:", v31);
        objc_msgSend(v34, "setValue:", v32);
        objc_msgSend(v34, "setShortValue:", v32);
        objc_msgSend(v34, "setSource:", CFSTR("calendar"));
        v36 = (void *)MEMORY[0x1E0CB37E8];
        +[PPConnectionsParameters sharedInstance](PPConnectionsParameters, "sharedInstance");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "calendarEventLocationExpirySeconds");
        objc_msgSend(v36, "numberWithDouble:");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setLifetime:", v38);

        if (v34)
        {
          v45 = v34;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_25;
        }
        if ((v27 & 1) != 0)
          goto LABEL_23;
      }
      else
      {

      }
    }
    else
    {
      v39 = v13;
      v40 = 29;
LABEL_20:
      objc_msgSend(v39, "push:", v40);
    }
    v14 = 0;
LABEL_25:

  }
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localEventStore, 0);
}

+ (PPConnectionsCalendarSource)sharedInstance
{
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, &__block_literal_global_14324);
  return (PPConnectionsCalendarSource *)(id)sharedInstance_shared;
}

+ (id)locationNameFromEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "structuredLocationTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    PPCollapseWhitespaceAndStrip();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PPCollapseWhitespaceAndStrip();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)locationLabelFromEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "structuredLocationTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    PPCollapseWhitespaceAndStrip();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PPCollapseWhitespaceAndStrip();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)locationValueFromEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "structuredLocationAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "structuredLocationAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR(", "), CFSTR(" "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PPCollapseWhitespaceAndStrip();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __45__PPConnectionsCalendarSource_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_shared;
  sharedInstance_shared = v0;

}

@end
