@implementation PPQuickTypeConnectionsServant

- (PPQuickTypeConnectionsServant)init
{
  PPQuickTypeConnectionsServant *v2;
  NSObject *v3;
  uint64_t v4;
  PPConnectionsMetricsTracker *metricsTracker;
  NSObject *v6;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PPQuickTypeConnectionsServant;
  v2 = -[PPQuickTypeConnectionsServant init](&v9, sel_init);
  if (v2)
  {
    pp_quicktype_log_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1C392E000, v3, OS_LOG_TYPE_INFO, "PPQuickTypeConnectionsServant initializing", v8, 2u);
    }

    +[PPConnectionsMetricsTracker sharedInstance](PPConnectionsMetricsTracker, "sharedInstance");
    v4 = objc_claimAutoreleasedReturnValue();
    metricsTracker = v2->_metricsTracker;
    v2->_metricsTracker = (PPConnectionsMetricsTracker *)v4;

    pp_quicktype_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1C392E000, v6, OS_LOG_TYPE_INFO, "PPQuickTypeConnectionsServant initialization complete", v8, 2u);
    }

  }
  return v2;
}

- (id)quickTypeItemsWithQuery:(id)a3 limit:(unint64_t)a4 explanationSet:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  PPConnectionsMetricsTracker *metricsTracker;
  void *v15;
  id v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  PPConnectionsMetricsTracker *v44;
  void *v45;
  void *v46;
  void *v47;
  id v49;
  PPQuickTypeConnectionsServant *v50;
  void *v51;
  id v52;
  void *v53;
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  +[PPSettings sharedInstance](PPSettings, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isAppConnectionsLocationsEnabled");

  if ((v11 & 1) != 0)
  {
    +[PPConnectionsMetricsTracker consumerStringForConsumerType:](PPConnectionsMetricsTracker, "consumerStringForConsumerType:", 1);
    v12 = objc_claimAutoreleasedReturnValue();
    +[PPConnectionsMetricsTracker triggerFromCriteria:](PPConnectionsMetricsTracker, "triggerFromCriteria:", v8);
    v13 = objc_claimAutoreleasedReturnValue();
    v50 = self;
    metricsTracker = self->_metricsTracker;
    objc_msgSend(v8, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)v12;
    v53 = (void *)v13;
    -[PPConnectionsMetricsTracker trackOpportunityForConsumer:trigger:targetApp:](metricsTracker, "trackOpportunityForConsumer:trigger:targetApp:", v12, v13, v15);

    v16 = v8;
    v52 = v9;
    v17 = +[PPConnectionsUtils isValidLinguisticQuery:](PPConnectionsUtils, "isValidLinguisticQuery:", v16);
    +[PPConnectionsUtils supportedLocationSemanticTypes](PPConnectionsUtils, "supportedLocationSemanticTypes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v16, "semanticTag"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "containsObject:", v19)
      && +[PPConnectionsUtils isClientAuthorizedForSemanticTriggers:](PPConnectionsUtils, "isClientAuthorizedForSemanticTriggers:", v16))
    {

    }
    else
    {

      if (!v17)
      {
        v26 = (void *)v12;
        if (objc_msgSend(v16, "semanticTag"))
        {
          +[PPConnectionsUtils supportedLocationSemanticTypes](PPConnectionsUtils, "supportedLocationSemanticTypes");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v16, "semanticTag"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v27, "containsObject:", v28);

          v30 = v52;
          if ((v29 & 1) == 0)
            objc_msgSend(v52, "push:", 3);
          if (!+[PPConnectionsUtils isClientAuthorizedForSemanticTriggers:](PPConnectionsUtils, "isClientAuthorizedForSemanticTriggers:", v16))objc_msgSend(v52, "push:", 4);
          v31 = 0;
        }
        else
        {
          v31 = 0;
          v30 = v52;
        }
LABEL_35:

        v39 = (void *)objc_opt_new();
        if (v31)
        {
          objc_msgSend(v31, "label");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "value");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setShouldAggregate:", +[PPConnectionsUtils shouldAggregateLabel:withValue:query:](PPConnectionsUtils, "shouldAggregateLabel:withValue:query:", v40, v41, v16));

          objc_msgSend(v31, "quickTypeItem");
          v42 = objc_claimAutoreleasedReturnValue();
          if (!v42)
          {
            objc_msgSend(v52, "push:", 2);
            v21 = 0;
            goto LABEL_40;
          }
          v43 = (void *)v42;
          objc_msgSend(v39, "addObject:", v42);
          v44 = v50->_metricsTracker;
          objc_msgSend(v31, "source");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "originatingBundleID");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "bundleIdentifier");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[PPConnectionsMetricsTracker trackConversionGoalForConsumer:source:trigger:originatingApp:targetApp:converted:](v44, "trackConversionGoalForConsumer:source:trigger:originatingApp:targetApp:converted:", v26, v45, v53, v46, v47, 0);

        }
        v21 = v39;
LABEL_40:

        goto LABEL_41;
      }
    }
    v49 = v9;
    if (v17)
      v22 = 40000000;
    else
      v22 = 90000000;
    +[PPLocalConnectionsStore defaultStore](PPLocalConnectionsStore, "defaultStore");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v16;
    if (objc_msgSend(v24, "semanticTag"))
    {
      v25 = +[PPConnectionsUtils locationFieldFromSemanticTag:](PPConnectionsUtils, "locationFieldFromSemanticTag:", objc_msgSend(v24, "semanticTag"));
    }
    else if (objc_msgSend(v24, "type") == 3
           && (objc_msgSend(v24, "subtype") == 6 || objc_msgSend(v24, "subtype") == 7)
           && (objc_msgSend(v24, "fields") & 4) != 0)
    {
      v25 = 1;
    }
    else if (objc_msgSend(v24, "type") == 3
           && (objc_msgSend(v24, "subtype") == 6 || objc_msgSend(v24, "subtype") == 7))
    {
      v25 = ((int)(objc_msgSend(v24, "fields") << 31) >> 31) & 0xA;
    }
    else
    {
      v25 = 0;
    }
    v32 = objc_alloc(MEMORY[0x1E0D70AE8]);
    objc_msgSend(v24, "bundleIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v32, "initWithLocationField:bundleIdentifier:", v25, v33);

    +[PPConnectionsParameters sharedInstance](PPConnectionsParameters, "sharedInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "quickTypePredictionLimit");

    if (v36 <= a4)
      v37 = a4;
    else
      v37 = v36;
    v30 = v52;
    objc_msgSend(v23, "recentLocationsForConsumer:criteria:limit:explanationSet:timeout:error:", 1, v34, v37, v52, v22, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "firstObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = v51;
    v9 = v49;
    goto LABEL_35;
  }
  pp_quicktype_log_handle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C392E000, v20, OS_LOG_TYPE_DEBUG, "PPQuickTypeConnectionsServant: Ignoring prediction request because Found Locations in Other Apps settings is off", buf, 2u);
  }

  v21 = 0;
LABEL_41:

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsTracker, 0);
}

@end
