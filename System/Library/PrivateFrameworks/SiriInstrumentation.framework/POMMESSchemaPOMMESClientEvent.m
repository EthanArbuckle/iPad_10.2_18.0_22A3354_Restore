@implementation POMMESSchemaPOMMESClientEvent

- (id)getComponentId
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;

  -[POMMESSchemaPOMMESClientEvent eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pommesId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "value");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(v4, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "length");

      if (v8)
        goto LABEL_11;
    }
  }
  -[POMMESSchemaPOMMESClientEvent eventMetadata](self, "eventMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "value");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(v10, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");

      if (v14)
      {
        v4 = v10;
LABEL_11:
        v16 = v4;
        v4 = v16;
        goto LABEL_13;
      }
    }
  }
  -[POMMESSchemaPOMMESClientEvent eventMetadata](self, "eventMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "subRequestId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
LABEL_12:
    v16 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v4, "value");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v4, "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");

    if (v18)
      goto LABEL_11;
    goto LABEL_12;
  }
LABEL_13:

  return v16;
}

- (int)componentName
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;

  -[POMMESSchemaPOMMESClientEvent eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pommesId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_5;
  objc_msgSend(v4, "value");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_5;
  v6 = (void *)v5;
  objc_msgSend(v4, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    LODWORD(v9) = 21;
  }
  else
  {
LABEL_5:
    -[POMMESSchemaPOMMESClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "requestId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_9;
    objc_msgSend(v11, "value");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_9;
    v13 = (void *)v12;
    objc_msgSend(v11, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");

    if (v15)
    {
      LODWORD(v9) = 1;
      v4 = v11;
    }
    else
    {
LABEL_9:
      -[POMMESSchemaPOMMESClientEvent eventMetadata](self, "eventMetadata");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "subRequestId");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        objc_msgSend(v4, "value");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v4, "value");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "length");

          if (v18)
            LODWORD(v9) = 43;
          else
            LODWORD(v9) = 0;
        }
      }
      else
      {
        LODWORD(v9) = 0;
      }
    }
  }

  return (int)v9;
}

+ (int)joinability
{
  return 2;
}

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  int v47;
  objc_super v49;

  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)POMMESSchemaPOMMESClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v49, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMMESSchemaPOMMESClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[POMMESSchemaPOMMESClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[POMMESSchemaPOMMESClientEvent pegasusRequestContext](self, "pegasusRequestContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[POMMESSchemaPOMMESClientEvent deletePegasusRequestContext](self, "deletePegasusRequestContext");
  -[POMMESSchemaPOMMESClientEvent onDeviceIndexSearchContext](self, "onDeviceIndexSearchContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[POMMESSchemaPOMMESClientEvent deleteOnDeviceIndexSearchContext](self, "deleteOnDeviceIndexSearchContext");
  -[POMMESSchemaPOMMESClientEvent pommesServiceClassifierScoreReported](self, "pommesServiceClassifierScoreReported");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[POMMESSchemaPOMMESClientEvent deletePommesServiceClassifierScoreReported](self, "deletePommesServiceClassifierScoreReported");
  -[POMMESSchemaPOMMESClientEvent pommesRequestContext](self, "pommesRequestContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[POMMESSchemaPOMMESClientEvent deletePommesRequestContext](self, "deletePommesRequestContext");
  -[POMMESSchemaPOMMESClientEvent performanceReported](self, "performanceReported");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[POMMESSchemaPOMMESClientEvent deletePerformanceReported](self, "deletePerformanceReported");
  -[POMMESSchemaPOMMESClientEvent profileResolutionRequestContext](self, "profileResolutionRequestContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[POMMESSchemaPOMMESClientEvent deleteProfileResolutionRequestContext](self, "deleteProfileResolutionRequestContext");
  -[POMMESSchemaPOMMESClientEvent pegasusKitRequestContext](self, "pegasusKitRequestContext");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[POMMESSchemaPOMMESClientEvent deletePegasusKitRequestContext](self, "deletePegasusKitRequestContext");
  -[POMMESSchemaPOMMESClientEvent resourceDownloadContext](self, "resourceDownloadContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applySensitiveConditionsPolicy:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "suppressMessage");

  if (v32)
    -[POMMESSchemaPOMMESClientEvent deleteResourceDownloadContext](self, "deleteResourceDownloadContext");
  -[POMMESSchemaPOMMESClientEvent cacheLookupContext](self, "cacheLookupContext");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "applySensitiveConditionsPolicy:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "suppressMessage");

  if (v35)
    -[POMMESSchemaPOMMESClientEvent deleteCacheLookupContext](self, "deleteCacheLookupContext");
  -[POMMESSchemaPOMMESClientEvent cacheStoringContext](self, "cacheStoringContext");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "applySensitiveConditionsPolicy:", v4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "suppressMessage");

  if (v38)
    -[POMMESSchemaPOMMESClientEvent deleteCacheStoringContext](self, "deleteCacheStoringContext");
  -[POMMESSchemaPOMMESClientEvent cacheInvalidationContext](self, "cacheInvalidationContext");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "applySensitiveConditionsPolicy:", v4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "suppressMessage");

  if (v41)
    -[POMMESSchemaPOMMESClientEvent deleteCacheInvalidationContext](self, "deleteCacheInvalidationContext");
  -[POMMESSchemaPOMMESClientEvent cacheMaintenanceContext](self, "cacheMaintenanceContext");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "applySensitiveConditionsPolicy:", v4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "suppressMessage");

  if (v44)
    -[POMMESSchemaPOMMESClientEvent deleteCacheMaintenanceContext](self, "deleteCacheMaintenanceContext");
  -[POMMESSchemaPOMMESClientEvent pommesPegasusRequestGeoAppResolutionReported](self, "pommesPegasusRequestGeoAppResolutionReported");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "applySensitiveConditionsPolicy:", v4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "suppressMessage");

  if (v47)
    -[POMMESSchemaPOMMESClientEvent deletePommesPegasusRequestGeoAppResolutionReported](self, "deletePommesPegasusRequestGeoAppResolutionReported");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[POMMESSchemaPOMMESClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 0xC)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E562A948[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 0xC)
    return 0;
  else
    return off_1E562A9B0[a3 - 101];
}

- (int)clockIsolationLevel
{
  if (-[POMMESSchemaPOMMESClientEvent whichEvent_Type](self, "whichEvent_Type") == 112)
    return 2;
  else
    return 1;
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[POMMESSchemaPOMMESClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 0xC)
    return CFSTR("com.apple.aiml.siri.pommes.POMMESClientEvent");
  else
    return off_1E5632F80[v2 - 101];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[POMMESSchemaPOMMESClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setPegasusRequestContext:(id)a3
{
  POMMESSchemaPOMMESPegasusRequestContext *v4;
  POMMESSchemaPOMMESOnDeviceIndexSearchContext *onDeviceIndexSearchContext;
  POMMESSchemaPOMMESServiceClassifierScoreReported *pommesServiceClassifierScoreReported;
  POMMESSchemaPOMMESRequestContext *pommesRequestContext;
  POMMESSchemaPOMMESDebugPerformanceReported *performanceReported;
  POMMESSchemaPOMMESProfileSliceResolutionRequestContext *profileResolutionRequestContext;
  POMMESSchemaPOMMESPegasusKitPegasusRequestContext *pegasusKitRequestContext;
  POMMESSchemaPOMMESResourceDownloadContext *resourceDownloadContext;
  POMMESSchemaPOMMESCacheLookupContext *cacheLookupContext;
  POMMESSchemaPOMMESCacheStoringContext *cacheStoringContext;
  POMMESSchemaPOMMESCacheInvalidationContext *cacheInvalidationContext;
  POMMESSchemaPOMMESCacheMaintenanceContext *cacheMaintenanceContext;
  POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported *pommesPegasusRequestGeoAppResolutionReported;
  unint64_t v17;
  POMMESSchemaPOMMESPegasusRequestContext *pegasusRequestContext;

  v4 = (POMMESSchemaPOMMESPegasusRequestContext *)a3;
  onDeviceIndexSearchContext = self->_onDeviceIndexSearchContext;
  self->_onDeviceIndexSearchContext = 0;

  pommesServiceClassifierScoreReported = self->_pommesServiceClassifierScoreReported;
  self->_pommesServiceClassifierScoreReported = 0;

  pommesRequestContext = self->_pommesRequestContext;
  self->_pommesRequestContext = 0;

  performanceReported = self->_performanceReported;
  self->_performanceReported = 0;

  profileResolutionRequestContext = self->_profileResolutionRequestContext;
  self->_profileResolutionRequestContext = 0;

  pegasusKitRequestContext = self->_pegasusKitRequestContext;
  self->_pegasusKitRequestContext = 0;

  resourceDownloadContext = self->_resourceDownloadContext;
  self->_resourceDownloadContext = 0;

  cacheLookupContext = self->_cacheLookupContext;
  self->_cacheLookupContext = 0;

  cacheStoringContext = self->_cacheStoringContext;
  self->_cacheStoringContext = 0;

  cacheInvalidationContext = self->_cacheInvalidationContext;
  self->_cacheInvalidationContext = 0;

  cacheMaintenanceContext = self->_cacheMaintenanceContext;
  self->_cacheMaintenanceContext = 0;

  pommesPegasusRequestGeoAppResolutionReported = self->_pommesPegasusRequestGeoAppResolutionReported;
  self->_pommesPegasusRequestGeoAppResolutionReported = 0;

  v17 = 101;
  if (!v4)
    v17 = 0;
  self->_whichEvent_Type = v17;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = v4;

}

- (POMMESSchemaPOMMESPegasusRequestContext)pegasusRequestContext
{
  if (self->_whichEvent_Type == 101)
    return self->_pegasusRequestContext;
  else
    return (POMMESSchemaPOMMESPegasusRequestContext *)0;
}

- (void)deletePegasusRequestContext
{
  POMMESSchemaPOMMESPegasusRequestContext *pegasusRequestContext;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    pegasusRequestContext = self->_pegasusRequestContext;
    self->_pegasusRequestContext = 0;

  }
}

- (void)setOnDeviceIndexSearchContext:(id)a3
{
  POMMESSchemaPOMMESOnDeviceIndexSearchContext *v4;
  POMMESSchemaPOMMESPegasusRequestContext *pegasusRequestContext;
  POMMESSchemaPOMMESServiceClassifierScoreReported *pommesServiceClassifierScoreReported;
  POMMESSchemaPOMMESRequestContext *pommesRequestContext;
  POMMESSchemaPOMMESDebugPerformanceReported *performanceReported;
  POMMESSchemaPOMMESProfileSliceResolutionRequestContext *profileResolutionRequestContext;
  POMMESSchemaPOMMESPegasusKitPegasusRequestContext *pegasusKitRequestContext;
  POMMESSchemaPOMMESResourceDownloadContext *resourceDownloadContext;
  POMMESSchemaPOMMESCacheLookupContext *cacheLookupContext;
  POMMESSchemaPOMMESCacheStoringContext *cacheStoringContext;
  POMMESSchemaPOMMESCacheInvalidationContext *cacheInvalidationContext;
  POMMESSchemaPOMMESCacheMaintenanceContext *cacheMaintenanceContext;
  POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported *pommesPegasusRequestGeoAppResolutionReported;
  unint64_t v17;
  POMMESSchemaPOMMESOnDeviceIndexSearchContext *onDeviceIndexSearchContext;

  v4 = (POMMESSchemaPOMMESOnDeviceIndexSearchContext *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  pommesServiceClassifierScoreReported = self->_pommesServiceClassifierScoreReported;
  self->_pommesServiceClassifierScoreReported = 0;

  pommesRequestContext = self->_pommesRequestContext;
  self->_pommesRequestContext = 0;

  performanceReported = self->_performanceReported;
  self->_performanceReported = 0;

  profileResolutionRequestContext = self->_profileResolutionRequestContext;
  self->_profileResolutionRequestContext = 0;

  pegasusKitRequestContext = self->_pegasusKitRequestContext;
  self->_pegasusKitRequestContext = 0;

  resourceDownloadContext = self->_resourceDownloadContext;
  self->_resourceDownloadContext = 0;

  cacheLookupContext = self->_cacheLookupContext;
  self->_cacheLookupContext = 0;

  cacheStoringContext = self->_cacheStoringContext;
  self->_cacheStoringContext = 0;

  cacheInvalidationContext = self->_cacheInvalidationContext;
  self->_cacheInvalidationContext = 0;

  cacheMaintenanceContext = self->_cacheMaintenanceContext;
  self->_cacheMaintenanceContext = 0;

  pommesPegasusRequestGeoAppResolutionReported = self->_pommesPegasusRequestGeoAppResolutionReported;
  self->_pommesPegasusRequestGeoAppResolutionReported = 0;

  v17 = 102;
  if (!v4)
    v17 = 0;
  self->_whichEvent_Type = v17;
  onDeviceIndexSearchContext = self->_onDeviceIndexSearchContext;
  self->_onDeviceIndexSearchContext = v4;

}

- (POMMESSchemaPOMMESOnDeviceIndexSearchContext)onDeviceIndexSearchContext
{
  if (self->_whichEvent_Type == 102)
    return self->_onDeviceIndexSearchContext;
  else
    return (POMMESSchemaPOMMESOnDeviceIndexSearchContext *)0;
}

- (void)deleteOnDeviceIndexSearchContext
{
  POMMESSchemaPOMMESOnDeviceIndexSearchContext *onDeviceIndexSearchContext;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    onDeviceIndexSearchContext = self->_onDeviceIndexSearchContext;
    self->_onDeviceIndexSearchContext = 0;

  }
}

- (void)setPommesServiceClassifierScoreReported:(id)a3
{
  POMMESSchemaPOMMESServiceClassifierScoreReported *v4;
  POMMESSchemaPOMMESPegasusRequestContext *pegasusRequestContext;
  POMMESSchemaPOMMESOnDeviceIndexSearchContext *onDeviceIndexSearchContext;
  POMMESSchemaPOMMESRequestContext *pommesRequestContext;
  POMMESSchemaPOMMESDebugPerformanceReported *performanceReported;
  POMMESSchemaPOMMESProfileSliceResolutionRequestContext *profileResolutionRequestContext;
  POMMESSchemaPOMMESPegasusKitPegasusRequestContext *pegasusKitRequestContext;
  POMMESSchemaPOMMESResourceDownloadContext *resourceDownloadContext;
  POMMESSchemaPOMMESCacheLookupContext *cacheLookupContext;
  POMMESSchemaPOMMESCacheStoringContext *cacheStoringContext;
  POMMESSchemaPOMMESCacheInvalidationContext *cacheInvalidationContext;
  POMMESSchemaPOMMESCacheMaintenanceContext *cacheMaintenanceContext;
  POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported *pommesPegasusRequestGeoAppResolutionReported;
  unint64_t v17;
  POMMESSchemaPOMMESServiceClassifierScoreReported *pommesServiceClassifierScoreReported;

  v4 = (POMMESSchemaPOMMESServiceClassifierScoreReported *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  onDeviceIndexSearchContext = self->_onDeviceIndexSearchContext;
  self->_onDeviceIndexSearchContext = 0;

  pommesRequestContext = self->_pommesRequestContext;
  self->_pommesRequestContext = 0;

  performanceReported = self->_performanceReported;
  self->_performanceReported = 0;

  profileResolutionRequestContext = self->_profileResolutionRequestContext;
  self->_profileResolutionRequestContext = 0;

  pegasusKitRequestContext = self->_pegasusKitRequestContext;
  self->_pegasusKitRequestContext = 0;

  resourceDownloadContext = self->_resourceDownloadContext;
  self->_resourceDownloadContext = 0;

  cacheLookupContext = self->_cacheLookupContext;
  self->_cacheLookupContext = 0;

  cacheStoringContext = self->_cacheStoringContext;
  self->_cacheStoringContext = 0;

  cacheInvalidationContext = self->_cacheInvalidationContext;
  self->_cacheInvalidationContext = 0;

  cacheMaintenanceContext = self->_cacheMaintenanceContext;
  self->_cacheMaintenanceContext = 0;

  pommesPegasusRequestGeoAppResolutionReported = self->_pommesPegasusRequestGeoAppResolutionReported;
  self->_pommesPegasusRequestGeoAppResolutionReported = 0;

  v17 = 103;
  if (!v4)
    v17 = 0;
  self->_whichEvent_Type = v17;
  pommesServiceClassifierScoreReported = self->_pommesServiceClassifierScoreReported;
  self->_pommesServiceClassifierScoreReported = v4;

}

- (POMMESSchemaPOMMESServiceClassifierScoreReported)pommesServiceClassifierScoreReported
{
  if (self->_whichEvent_Type == 103)
    return self->_pommesServiceClassifierScoreReported;
  else
    return (POMMESSchemaPOMMESServiceClassifierScoreReported *)0;
}

- (void)deletePommesServiceClassifierScoreReported
{
  POMMESSchemaPOMMESServiceClassifierScoreReported *pommesServiceClassifierScoreReported;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    pommesServiceClassifierScoreReported = self->_pommesServiceClassifierScoreReported;
    self->_pommesServiceClassifierScoreReported = 0;

  }
}

- (void)setPommesRequestContext:(id)a3
{
  POMMESSchemaPOMMESRequestContext *v4;
  POMMESSchemaPOMMESPegasusRequestContext *pegasusRequestContext;
  POMMESSchemaPOMMESOnDeviceIndexSearchContext *onDeviceIndexSearchContext;
  POMMESSchemaPOMMESServiceClassifierScoreReported *pommesServiceClassifierScoreReported;
  POMMESSchemaPOMMESDebugPerformanceReported *performanceReported;
  POMMESSchemaPOMMESProfileSliceResolutionRequestContext *profileResolutionRequestContext;
  POMMESSchemaPOMMESPegasusKitPegasusRequestContext *pegasusKitRequestContext;
  POMMESSchemaPOMMESResourceDownloadContext *resourceDownloadContext;
  POMMESSchemaPOMMESCacheLookupContext *cacheLookupContext;
  POMMESSchemaPOMMESCacheStoringContext *cacheStoringContext;
  POMMESSchemaPOMMESCacheInvalidationContext *cacheInvalidationContext;
  POMMESSchemaPOMMESCacheMaintenanceContext *cacheMaintenanceContext;
  POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported *pommesPegasusRequestGeoAppResolutionReported;
  unint64_t v17;
  POMMESSchemaPOMMESRequestContext *pommesRequestContext;

  v4 = (POMMESSchemaPOMMESRequestContext *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  onDeviceIndexSearchContext = self->_onDeviceIndexSearchContext;
  self->_onDeviceIndexSearchContext = 0;

  pommesServiceClassifierScoreReported = self->_pommesServiceClassifierScoreReported;
  self->_pommesServiceClassifierScoreReported = 0;

  performanceReported = self->_performanceReported;
  self->_performanceReported = 0;

  profileResolutionRequestContext = self->_profileResolutionRequestContext;
  self->_profileResolutionRequestContext = 0;

  pegasusKitRequestContext = self->_pegasusKitRequestContext;
  self->_pegasusKitRequestContext = 0;

  resourceDownloadContext = self->_resourceDownloadContext;
  self->_resourceDownloadContext = 0;

  cacheLookupContext = self->_cacheLookupContext;
  self->_cacheLookupContext = 0;

  cacheStoringContext = self->_cacheStoringContext;
  self->_cacheStoringContext = 0;

  cacheInvalidationContext = self->_cacheInvalidationContext;
  self->_cacheInvalidationContext = 0;

  cacheMaintenanceContext = self->_cacheMaintenanceContext;
  self->_cacheMaintenanceContext = 0;

  pommesPegasusRequestGeoAppResolutionReported = self->_pommesPegasusRequestGeoAppResolutionReported;
  self->_pommesPegasusRequestGeoAppResolutionReported = 0;

  v17 = 104;
  if (!v4)
    v17 = 0;
  self->_whichEvent_Type = v17;
  pommesRequestContext = self->_pommesRequestContext;
  self->_pommesRequestContext = v4;

}

- (POMMESSchemaPOMMESRequestContext)pommesRequestContext
{
  if (self->_whichEvent_Type == 104)
    return self->_pommesRequestContext;
  else
    return (POMMESSchemaPOMMESRequestContext *)0;
}

- (void)deletePommesRequestContext
{
  POMMESSchemaPOMMESRequestContext *pommesRequestContext;

  if (self->_whichEvent_Type == 104)
  {
    self->_whichEvent_Type = 0;
    pommesRequestContext = self->_pommesRequestContext;
    self->_pommesRequestContext = 0;

  }
}

- (void)setPerformanceReported:(id)a3
{
  POMMESSchemaPOMMESDebugPerformanceReported *v4;
  POMMESSchemaPOMMESPegasusRequestContext *pegasusRequestContext;
  POMMESSchemaPOMMESOnDeviceIndexSearchContext *onDeviceIndexSearchContext;
  POMMESSchemaPOMMESServiceClassifierScoreReported *pommesServiceClassifierScoreReported;
  POMMESSchemaPOMMESRequestContext *pommesRequestContext;
  POMMESSchemaPOMMESProfileSliceResolutionRequestContext *profileResolutionRequestContext;
  POMMESSchemaPOMMESPegasusKitPegasusRequestContext *pegasusKitRequestContext;
  POMMESSchemaPOMMESResourceDownloadContext *resourceDownloadContext;
  POMMESSchemaPOMMESCacheLookupContext *cacheLookupContext;
  POMMESSchemaPOMMESCacheStoringContext *cacheStoringContext;
  POMMESSchemaPOMMESCacheInvalidationContext *cacheInvalidationContext;
  POMMESSchemaPOMMESCacheMaintenanceContext *cacheMaintenanceContext;
  POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported *pommesPegasusRequestGeoAppResolutionReported;
  unint64_t v17;
  POMMESSchemaPOMMESDebugPerformanceReported *performanceReported;

  v4 = (POMMESSchemaPOMMESDebugPerformanceReported *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  onDeviceIndexSearchContext = self->_onDeviceIndexSearchContext;
  self->_onDeviceIndexSearchContext = 0;

  pommesServiceClassifierScoreReported = self->_pommesServiceClassifierScoreReported;
  self->_pommesServiceClassifierScoreReported = 0;

  pommesRequestContext = self->_pommesRequestContext;
  self->_pommesRequestContext = 0;

  profileResolutionRequestContext = self->_profileResolutionRequestContext;
  self->_profileResolutionRequestContext = 0;

  pegasusKitRequestContext = self->_pegasusKitRequestContext;
  self->_pegasusKitRequestContext = 0;

  resourceDownloadContext = self->_resourceDownloadContext;
  self->_resourceDownloadContext = 0;

  cacheLookupContext = self->_cacheLookupContext;
  self->_cacheLookupContext = 0;

  cacheStoringContext = self->_cacheStoringContext;
  self->_cacheStoringContext = 0;

  cacheInvalidationContext = self->_cacheInvalidationContext;
  self->_cacheInvalidationContext = 0;

  cacheMaintenanceContext = self->_cacheMaintenanceContext;
  self->_cacheMaintenanceContext = 0;

  pommesPegasusRequestGeoAppResolutionReported = self->_pommesPegasusRequestGeoAppResolutionReported;
  self->_pommesPegasusRequestGeoAppResolutionReported = 0;

  v17 = 105;
  if (!v4)
    v17 = 0;
  self->_whichEvent_Type = v17;
  performanceReported = self->_performanceReported;
  self->_performanceReported = v4;

}

- (POMMESSchemaPOMMESDebugPerformanceReported)performanceReported
{
  if (self->_whichEvent_Type == 105)
    return self->_performanceReported;
  else
    return (POMMESSchemaPOMMESDebugPerformanceReported *)0;
}

- (void)deletePerformanceReported
{
  POMMESSchemaPOMMESDebugPerformanceReported *performanceReported;

  if (self->_whichEvent_Type == 105)
  {
    self->_whichEvent_Type = 0;
    performanceReported = self->_performanceReported;
    self->_performanceReported = 0;

  }
}

- (void)setProfileResolutionRequestContext:(id)a3
{
  POMMESSchemaPOMMESProfileSliceResolutionRequestContext *v4;
  POMMESSchemaPOMMESPegasusRequestContext *pegasusRequestContext;
  POMMESSchemaPOMMESOnDeviceIndexSearchContext *onDeviceIndexSearchContext;
  POMMESSchemaPOMMESServiceClassifierScoreReported *pommesServiceClassifierScoreReported;
  POMMESSchemaPOMMESRequestContext *pommesRequestContext;
  POMMESSchemaPOMMESDebugPerformanceReported *performanceReported;
  POMMESSchemaPOMMESPegasusKitPegasusRequestContext *pegasusKitRequestContext;
  POMMESSchemaPOMMESResourceDownloadContext *resourceDownloadContext;
  POMMESSchemaPOMMESCacheLookupContext *cacheLookupContext;
  POMMESSchemaPOMMESCacheStoringContext *cacheStoringContext;
  POMMESSchemaPOMMESCacheInvalidationContext *cacheInvalidationContext;
  POMMESSchemaPOMMESCacheMaintenanceContext *cacheMaintenanceContext;
  POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported *pommesPegasusRequestGeoAppResolutionReported;
  unint64_t v17;
  POMMESSchemaPOMMESProfileSliceResolutionRequestContext *profileResolutionRequestContext;

  v4 = (POMMESSchemaPOMMESProfileSliceResolutionRequestContext *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  onDeviceIndexSearchContext = self->_onDeviceIndexSearchContext;
  self->_onDeviceIndexSearchContext = 0;

  pommesServiceClassifierScoreReported = self->_pommesServiceClassifierScoreReported;
  self->_pommesServiceClassifierScoreReported = 0;

  pommesRequestContext = self->_pommesRequestContext;
  self->_pommesRequestContext = 0;

  performanceReported = self->_performanceReported;
  self->_performanceReported = 0;

  pegasusKitRequestContext = self->_pegasusKitRequestContext;
  self->_pegasusKitRequestContext = 0;

  resourceDownloadContext = self->_resourceDownloadContext;
  self->_resourceDownloadContext = 0;

  cacheLookupContext = self->_cacheLookupContext;
  self->_cacheLookupContext = 0;

  cacheStoringContext = self->_cacheStoringContext;
  self->_cacheStoringContext = 0;

  cacheInvalidationContext = self->_cacheInvalidationContext;
  self->_cacheInvalidationContext = 0;

  cacheMaintenanceContext = self->_cacheMaintenanceContext;
  self->_cacheMaintenanceContext = 0;

  pommesPegasusRequestGeoAppResolutionReported = self->_pommesPegasusRequestGeoAppResolutionReported;
  self->_pommesPegasusRequestGeoAppResolutionReported = 0;

  v17 = 106;
  if (!v4)
    v17 = 0;
  self->_whichEvent_Type = v17;
  profileResolutionRequestContext = self->_profileResolutionRequestContext;
  self->_profileResolutionRequestContext = v4;

}

- (POMMESSchemaPOMMESProfileSliceResolutionRequestContext)profileResolutionRequestContext
{
  if (self->_whichEvent_Type == 106)
    return self->_profileResolutionRequestContext;
  else
    return (POMMESSchemaPOMMESProfileSliceResolutionRequestContext *)0;
}

- (void)deleteProfileResolutionRequestContext
{
  POMMESSchemaPOMMESProfileSliceResolutionRequestContext *profileResolutionRequestContext;

  if (self->_whichEvent_Type == 106)
  {
    self->_whichEvent_Type = 0;
    profileResolutionRequestContext = self->_profileResolutionRequestContext;
    self->_profileResolutionRequestContext = 0;

  }
}

- (void)setPegasusKitRequestContext:(id)a3
{
  POMMESSchemaPOMMESPegasusKitPegasusRequestContext *v4;
  POMMESSchemaPOMMESPegasusRequestContext *pegasusRequestContext;
  POMMESSchemaPOMMESOnDeviceIndexSearchContext *onDeviceIndexSearchContext;
  POMMESSchemaPOMMESServiceClassifierScoreReported *pommesServiceClassifierScoreReported;
  POMMESSchemaPOMMESRequestContext *pommesRequestContext;
  POMMESSchemaPOMMESDebugPerformanceReported *performanceReported;
  POMMESSchemaPOMMESProfileSliceResolutionRequestContext *profileResolutionRequestContext;
  POMMESSchemaPOMMESResourceDownloadContext *resourceDownloadContext;
  POMMESSchemaPOMMESCacheLookupContext *cacheLookupContext;
  POMMESSchemaPOMMESCacheStoringContext *cacheStoringContext;
  POMMESSchemaPOMMESCacheInvalidationContext *cacheInvalidationContext;
  POMMESSchemaPOMMESCacheMaintenanceContext *cacheMaintenanceContext;
  POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported *pommesPegasusRequestGeoAppResolutionReported;
  unint64_t v17;
  POMMESSchemaPOMMESPegasusKitPegasusRequestContext *pegasusKitRequestContext;

  v4 = (POMMESSchemaPOMMESPegasusKitPegasusRequestContext *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  onDeviceIndexSearchContext = self->_onDeviceIndexSearchContext;
  self->_onDeviceIndexSearchContext = 0;

  pommesServiceClassifierScoreReported = self->_pommesServiceClassifierScoreReported;
  self->_pommesServiceClassifierScoreReported = 0;

  pommesRequestContext = self->_pommesRequestContext;
  self->_pommesRequestContext = 0;

  performanceReported = self->_performanceReported;
  self->_performanceReported = 0;

  profileResolutionRequestContext = self->_profileResolutionRequestContext;
  self->_profileResolutionRequestContext = 0;

  resourceDownloadContext = self->_resourceDownloadContext;
  self->_resourceDownloadContext = 0;

  cacheLookupContext = self->_cacheLookupContext;
  self->_cacheLookupContext = 0;

  cacheStoringContext = self->_cacheStoringContext;
  self->_cacheStoringContext = 0;

  cacheInvalidationContext = self->_cacheInvalidationContext;
  self->_cacheInvalidationContext = 0;

  cacheMaintenanceContext = self->_cacheMaintenanceContext;
  self->_cacheMaintenanceContext = 0;

  pommesPegasusRequestGeoAppResolutionReported = self->_pommesPegasusRequestGeoAppResolutionReported;
  self->_pommesPegasusRequestGeoAppResolutionReported = 0;

  v17 = 107;
  if (!v4)
    v17 = 0;
  self->_whichEvent_Type = v17;
  pegasusKitRequestContext = self->_pegasusKitRequestContext;
  self->_pegasusKitRequestContext = v4;

}

- (POMMESSchemaPOMMESPegasusKitPegasusRequestContext)pegasusKitRequestContext
{
  if (self->_whichEvent_Type == 107)
    return self->_pegasusKitRequestContext;
  else
    return (POMMESSchemaPOMMESPegasusKitPegasusRequestContext *)0;
}

- (void)deletePegasusKitRequestContext
{
  POMMESSchemaPOMMESPegasusKitPegasusRequestContext *pegasusKitRequestContext;

  if (self->_whichEvent_Type == 107)
  {
    self->_whichEvent_Type = 0;
    pegasusKitRequestContext = self->_pegasusKitRequestContext;
    self->_pegasusKitRequestContext = 0;

  }
}

- (void)setResourceDownloadContext:(id)a3
{
  POMMESSchemaPOMMESResourceDownloadContext *v4;
  POMMESSchemaPOMMESPegasusRequestContext *pegasusRequestContext;
  POMMESSchemaPOMMESOnDeviceIndexSearchContext *onDeviceIndexSearchContext;
  POMMESSchemaPOMMESServiceClassifierScoreReported *pommesServiceClassifierScoreReported;
  POMMESSchemaPOMMESRequestContext *pommesRequestContext;
  POMMESSchemaPOMMESDebugPerformanceReported *performanceReported;
  POMMESSchemaPOMMESProfileSliceResolutionRequestContext *profileResolutionRequestContext;
  POMMESSchemaPOMMESPegasusKitPegasusRequestContext *pegasusKitRequestContext;
  POMMESSchemaPOMMESCacheLookupContext *cacheLookupContext;
  POMMESSchemaPOMMESCacheStoringContext *cacheStoringContext;
  POMMESSchemaPOMMESCacheInvalidationContext *cacheInvalidationContext;
  POMMESSchemaPOMMESCacheMaintenanceContext *cacheMaintenanceContext;
  POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported *pommesPegasusRequestGeoAppResolutionReported;
  unint64_t v17;
  POMMESSchemaPOMMESResourceDownloadContext *resourceDownloadContext;

  v4 = (POMMESSchemaPOMMESResourceDownloadContext *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  onDeviceIndexSearchContext = self->_onDeviceIndexSearchContext;
  self->_onDeviceIndexSearchContext = 0;

  pommesServiceClassifierScoreReported = self->_pommesServiceClassifierScoreReported;
  self->_pommesServiceClassifierScoreReported = 0;

  pommesRequestContext = self->_pommesRequestContext;
  self->_pommesRequestContext = 0;

  performanceReported = self->_performanceReported;
  self->_performanceReported = 0;

  profileResolutionRequestContext = self->_profileResolutionRequestContext;
  self->_profileResolutionRequestContext = 0;

  pegasusKitRequestContext = self->_pegasusKitRequestContext;
  self->_pegasusKitRequestContext = 0;

  cacheLookupContext = self->_cacheLookupContext;
  self->_cacheLookupContext = 0;

  cacheStoringContext = self->_cacheStoringContext;
  self->_cacheStoringContext = 0;

  cacheInvalidationContext = self->_cacheInvalidationContext;
  self->_cacheInvalidationContext = 0;

  cacheMaintenanceContext = self->_cacheMaintenanceContext;
  self->_cacheMaintenanceContext = 0;

  pommesPegasusRequestGeoAppResolutionReported = self->_pommesPegasusRequestGeoAppResolutionReported;
  self->_pommesPegasusRequestGeoAppResolutionReported = 0;

  v17 = 108;
  if (!v4)
    v17 = 0;
  self->_whichEvent_Type = v17;
  resourceDownloadContext = self->_resourceDownloadContext;
  self->_resourceDownloadContext = v4;

}

- (POMMESSchemaPOMMESResourceDownloadContext)resourceDownloadContext
{
  if (self->_whichEvent_Type == 108)
    return self->_resourceDownloadContext;
  else
    return (POMMESSchemaPOMMESResourceDownloadContext *)0;
}

- (void)deleteResourceDownloadContext
{
  POMMESSchemaPOMMESResourceDownloadContext *resourceDownloadContext;

  if (self->_whichEvent_Type == 108)
  {
    self->_whichEvent_Type = 0;
    resourceDownloadContext = self->_resourceDownloadContext;
    self->_resourceDownloadContext = 0;

  }
}

- (void)setCacheLookupContext:(id)a3
{
  POMMESSchemaPOMMESCacheLookupContext *v4;
  POMMESSchemaPOMMESPegasusRequestContext *pegasusRequestContext;
  POMMESSchemaPOMMESOnDeviceIndexSearchContext *onDeviceIndexSearchContext;
  POMMESSchemaPOMMESServiceClassifierScoreReported *pommesServiceClassifierScoreReported;
  POMMESSchemaPOMMESRequestContext *pommesRequestContext;
  POMMESSchemaPOMMESDebugPerformanceReported *performanceReported;
  POMMESSchemaPOMMESProfileSliceResolutionRequestContext *profileResolutionRequestContext;
  POMMESSchemaPOMMESPegasusKitPegasusRequestContext *pegasusKitRequestContext;
  POMMESSchemaPOMMESResourceDownloadContext *resourceDownloadContext;
  POMMESSchemaPOMMESCacheStoringContext *cacheStoringContext;
  POMMESSchemaPOMMESCacheInvalidationContext *cacheInvalidationContext;
  POMMESSchemaPOMMESCacheMaintenanceContext *cacheMaintenanceContext;
  POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported *pommesPegasusRequestGeoAppResolutionReported;
  unint64_t v17;
  POMMESSchemaPOMMESCacheLookupContext *cacheLookupContext;

  v4 = (POMMESSchemaPOMMESCacheLookupContext *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  onDeviceIndexSearchContext = self->_onDeviceIndexSearchContext;
  self->_onDeviceIndexSearchContext = 0;

  pommesServiceClassifierScoreReported = self->_pommesServiceClassifierScoreReported;
  self->_pommesServiceClassifierScoreReported = 0;

  pommesRequestContext = self->_pommesRequestContext;
  self->_pommesRequestContext = 0;

  performanceReported = self->_performanceReported;
  self->_performanceReported = 0;

  profileResolutionRequestContext = self->_profileResolutionRequestContext;
  self->_profileResolutionRequestContext = 0;

  pegasusKitRequestContext = self->_pegasusKitRequestContext;
  self->_pegasusKitRequestContext = 0;

  resourceDownloadContext = self->_resourceDownloadContext;
  self->_resourceDownloadContext = 0;

  cacheStoringContext = self->_cacheStoringContext;
  self->_cacheStoringContext = 0;

  cacheInvalidationContext = self->_cacheInvalidationContext;
  self->_cacheInvalidationContext = 0;

  cacheMaintenanceContext = self->_cacheMaintenanceContext;
  self->_cacheMaintenanceContext = 0;

  pommesPegasusRequestGeoAppResolutionReported = self->_pommesPegasusRequestGeoAppResolutionReported;
  self->_pommesPegasusRequestGeoAppResolutionReported = 0;

  v17 = 109;
  if (!v4)
    v17 = 0;
  self->_whichEvent_Type = v17;
  cacheLookupContext = self->_cacheLookupContext;
  self->_cacheLookupContext = v4;

}

- (POMMESSchemaPOMMESCacheLookupContext)cacheLookupContext
{
  if (self->_whichEvent_Type == 109)
    return self->_cacheLookupContext;
  else
    return (POMMESSchemaPOMMESCacheLookupContext *)0;
}

- (void)deleteCacheLookupContext
{
  POMMESSchemaPOMMESCacheLookupContext *cacheLookupContext;

  if (self->_whichEvent_Type == 109)
  {
    self->_whichEvent_Type = 0;
    cacheLookupContext = self->_cacheLookupContext;
    self->_cacheLookupContext = 0;

  }
}

- (void)setCacheStoringContext:(id)a3
{
  POMMESSchemaPOMMESCacheStoringContext *v4;
  POMMESSchemaPOMMESPegasusRequestContext *pegasusRequestContext;
  POMMESSchemaPOMMESOnDeviceIndexSearchContext *onDeviceIndexSearchContext;
  POMMESSchemaPOMMESServiceClassifierScoreReported *pommesServiceClassifierScoreReported;
  POMMESSchemaPOMMESRequestContext *pommesRequestContext;
  POMMESSchemaPOMMESDebugPerformanceReported *performanceReported;
  POMMESSchemaPOMMESProfileSliceResolutionRequestContext *profileResolutionRequestContext;
  POMMESSchemaPOMMESPegasusKitPegasusRequestContext *pegasusKitRequestContext;
  POMMESSchemaPOMMESResourceDownloadContext *resourceDownloadContext;
  POMMESSchemaPOMMESCacheLookupContext *cacheLookupContext;
  POMMESSchemaPOMMESCacheInvalidationContext *cacheInvalidationContext;
  POMMESSchemaPOMMESCacheMaintenanceContext *cacheMaintenanceContext;
  POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported *pommesPegasusRequestGeoAppResolutionReported;
  unint64_t v17;
  POMMESSchemaPOMMESCacheStoringContext *cacheStoringContext;

  v4 = (POMMESSchemaPOMMESCacheStoringContext *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  onDeviceIndexSearchContext = self->_onDeviceIndexSearchContext;
  self->_onDeviceIndexSearchContext = 0;

  pommesServiceClassifierScoreReported = self->_pommesServiceClassifierScoreReported;
  self->_pommesServiceClassifierScoreReported = 0;

  pommesRequestContext = self->_pommesRequestContext;
  self->_pommesRequestContext = 0;

  performanceReported = self->_performanceReported;
  self->_performanceReported = 0;

  profileResolutionRequestContext = self->_profileResolutionRequestContext;
  self->_profileResolutionRequestContext = 0;

  pegasusKitRequestContext = self->_pegasusKitRequestContext;
  self->_pegasusKitRequestContext = 0;

  resourceDownloadContext = self->_resourceDownloadContext;
  self->_resourceDownloadContext = 0;

  cacheLookupContext = self->_cacheLookupContext;
  self->_cacheLookupContext = 0;

  cacheInvalidationContext = self->_cacheInvalidationContext;
  self->_cacheInvalidationContext = 0;

  cacheMaintenanceContext = self->_cacheMaintenanceContext;
  self->_cacheMaintenanceContext = 0;

  pommesPegasusRequestGeoAppResolutionReported = self->_pommesPegasusRequestGeoAppResolutionReported;
  self->_pommesPegasusRequestGeoAppResolutionReported = 0;

  v17 = 110;
  if (!v4)
    v17 = 0;
  self->_whichEvent_Type = v17;
  cacheStoringContext = self->_cacheStoringContext;
  self->_cacheStoringContext = v4;

}

- (POMMESSchemaPOMMESCacheStoringContext)cacheStoringContext
{
  if (self->_whichEvent_Type == 110)
    return self->_cacheStoringContext;
  else
    return (POMMESSchemaPOMMESCacheStoringContext *)0;
}

- (void)deleteCacheStoringContext
{
  POMMESSchemaPOMMESCacheStoringContext *cacheStoringContext;

  if (self->_whichEvent_Type == 110)
  {
    self->_whichEvent_Type = 0;
    cacheStoringContext = self->_cacheStoringContext;
    self->_cacheStoringContext = 0;

  }
}

- (void)setCacheInvalidationContext:(id)a3
{
  POMMESSchemaPOMMESCacheInvalidationContext *v4;
  POMMESSchemaPOMMESPegasusRequestContext *pegasusRequestContext;
  POMMESSchemaPOMMESOnDeviceIndexSearchContext *onDeviceIndexSearchContext;
  POMMESSchemaPOMMESServiceClassifierScoreReported *pommesServiceClassifierScoreReported;
  POMMESSchemaPOMMESRequestContext *pommesRequestContext;
  POMMESSchemaPOMMESDebugPerformanceReported *performanceReported;
  POMMESSchemaPOMMESProfileSliceResolutionRequestContext *profileResolutionRequestContext;
  POMMESSchemaPOMMESPegasusKitPegasusRequestContext *pegasusKitRequestContext;
  POMMESSchemaPOMMESResourceDownloadContext *resourceDownloadContext;
  POMMESSchemaPOMMESCacheLookupContext *cacheLookupContext;
  POMMESSchemaPOMMESCacheStoringContext *cacheStoringContext;
  POMMESSchemaPOMMESCacheMaintenanceContext *cacheMaintenanceContext;
  POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported *pommesPegasusRequestGeoAppResolutionReported;
  unint64_t v17;
  POMMESSchemaPOMMESCacheInvalidationContext *cacheInvalidationContext;

  v4 = (POMMESSchemaPOMMESCacheInvalidationContext *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  onDeviceIndexSearchContext = self->_onDeviceIndexSearchContext;
  self->_onDeviceIndexSearchContext = 0;

  pommesServiceClassifierScoreReported = self->_pommesServiceClassifierScoreReported;
  self->_pommesServiceClassifierScoreReported = 0;

  pommesRequestContext = self->_pommesRequestContext;
  self->_pommesRequestContext = 0;

  performanceReported = self->_performanceReported;
  self->_performanceReported = 0;

  profileResolutionRequestContext = self->_profileResolutionRequestContext;
  self->_profileResolutionRequestContext = 0;

  pegasusKitRequestContext = self->_pegasusKitRequestContext;
  self->_pegasusKitRequestContext = 0;

  resourceDownloadContext = self->_resourceDownloadContext;
  self->_resourceDownloadContext = 0;

  cacheLookupContext = self->_cacheLookupContext;
  self->_cacheLookupContext = 0;

  cacheStoringContext = self->_cacheStoringContext;
  self->_cacheStoringContext = 0;

  cacheMaintenanceContext = self->_cacheMaintenanceContext;
  self->_cacheMaintenanceContext = 0;

  pommesPegasusRequestGeoAppResolutionReported = self->_pommesPegasusRequestGeoAppResolutionReported;
  self->_pommesPegasusRequestGeoAppResolutionReported = 0;

  v17 = 111;
  if (!v4)
    v17 = 0;
  self->_whichEvent_Type = v17;
  cacheInvalidationContext = self->_cacheInvalidationContext;
  self->_cacheInvalidationContext = v4;

}

- (POMMESSchemaPOMMESCacheInvalidationContext)cacheInvalidationContext
{
  if (self->_whichEvent_Type == 111)
    return self->_cacheInvalidationContext;
  else
    return (POMMESSchemaPOMMESCacheInvalidationContext *)0;
}

- (void)deleteCacheInvalidationContext
{
  POMMESSchemaPOMMESCacheInvalidationContext *cacheInvalidationContext;

  if (self->_whichEvent_Type == 111)
  {
    self->_whichEvent_Type = 0;
    cacheInvalidationContext = self->_cacheInvalidationContext;
    self->_cacheInvalidationContext = 0;

  }
}

- (void)setCacheMaintenanceContext:(id)a3
{
  POMMESSchemaPOMMESCacheMaintenanceContext *v4;
  POMMESSchemaPOMMESPegasusRequestContext *pegasusRequestContext;
  POMMESSchemaPOMMESOnDeviceIndexSearchContext *onDeviceIndexSearchContext;
  POMMESSchemaPOMMESServiceClassifierScoreReported *pommesServiceClassifierScoreReported;
  POMMESSchemaPOMMESRequestContext *pommesRequestContext;
  POMMESSchemaPOMMESDebugPerformanceReported *performanceReported;
  POMMESSchemaPOMMESProfileSliceResolutionRequestContext *profileResolutionRequestContext;
  POMMESSchemaPOMMESPegasusKitPegasusRequestContext *pegasusKitRequestContext;
  POMMESSchemaPOMMESResourceDownloadContext *resourceDownloadContext;
  POMMESSchemaPOMMESCacheLookupContext *cacheLookupContext;
  POMMESSchemaPOMMESCacheStoringContext *cacheStoringContext;
  POMMESSchemaPOMMESCacheInvalidationContext *cacheInvalidationContext;
  POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported *pommesPegasusRequestGeoAppResolutionReported;
  unint64_t v17;
  POMMESSchemaPOMMESCacheMaintenanceContext *cacheMaintenanceContext;

  v4 = (POMMESSchemaPOMMESCacheMaintenanceContext *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  onDeviceIndexSearchContext = self->_onDeviceIndexSearchContext;
  self->_onDeviceIndexSearchContext = 0;

  pommesServiceClassifierScoreReported = self->_pommesServiceClassifierScoreReported;
  self->_pommesServiceClassifierScoreReported = 0;

  pommesRequestContext = self->_pommesRequestContext;
  self->_pommesRequestContext = 0;

  performanceReported = self->_performanceReported;
  self->_performanceReported = 0;

  profileResolutionRequestContext = self->_profileResolutionRequestContext;
  self->_profileResolutionRequestContext = 0;

  pegasusKitRequestContext = self->_pegasusKitRequestContext;
  self->_pegasusKitRequestContext = 0;

  resourceDownloadContext = self->_resourceDownloadContext;
  self->_resourceDownloadContext = 0;

  cacheLookupContext = self->_cacheLookupContext;
  self->_cacheLookupContext = 0;

  cacheStoringContext = self->_cacheStoringContext;
  self->_cacheStoringContext = 0;

  cacheInvalidationContext = self->_cacheInvalidationContext;
  self->_cacheInvalidationContext = 0;

  pommesPegasusRequestGeoAppResolutionReported = self->_pommesPegasusRequestGeoAppResolutionReported;
  self->_pommesPegasusRequestGeoAppResolutionReported = 0;

  v17 = 112;
  if (!v4)
    v17 = 0;
  self->_whichEvent_Type = v17;
  cacheMaintenanceContext = self->_cacheMaintenanceContext;
  self->_cacheMaintenanceContext = v4;

}

- (POMMESSchemaPOMMESCacheMaintenanceContext)cacheMaintenanceContext
{
  if (self->_whichEvent_Type == 112)
    return self->_cacheMaintenanceContext;
  else
    return (POMMESSchemaPOMMESCacheMaintenanceContext *)0;
}

- (void)deleteCacheMaintenanceContext
{
  POMMESSchemaPOMMESCacheMaintenanceContext *cacheMaintenanceContext;

  if (self->_whichEvent_Type == 112)
  {
    self->_whichEvent_Type = 0;
    cacheMaintenanceContext = self->_cacheMaintenanceContext;
    self->_cacheMaintenanceContext = 0;

  }
}

- (void)setPommesPegasusRequestGeoAppResolutionReported:(id)a3
{
  POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported *v4;
  POMMESSchemaPOMMESPegasusRequestContext *pegasusRequestContext;
  POMMESSchemaPOMMESOnDeviceIndexSearchContext *onDeviceIndexSearchContext;
  POMMESSchemaPOMMESServiceClassifierScoreReported *pommesServiceClassifierScoreReported;
  POMMESSchemaPOMMESRequestContext *pommesRequestContext;
  POMMESSchemaPOMMESDebugPerformanceReported *performanceReported;
  POMMESSchemaPOMMESProfileSliceResolutionRequestContext *profileResolutionRequestContext;
  POMMESSchemaPOMMESPegasusKitPegasusRequestContext *pegasusKitRequestContext;
  POMMESSchemaPOMMESResourceDownloadContext *resourceDownloadContext;
  POMMESSchemaPOMMESCacheLookupContext *cacheLookupContext;
  POMMESSchemaPOMMESCacheStoringContext *cacheStoringContext;
  POMMESSchemaPOMMESCacheInvalidationContext *cacheInvalidationContext;
  POMMESSchemaPOMMESCacheMaintenanceContext *cacheMaintenanceContext;
  unint64_t v17;
  POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported *pommesPegasusRequestGeoAppResolutionReported;

  v4 = (POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  onDeviceIndexSearchContext = self->_onDeviceIndexSearchContext;
  self->_onDeviceIndexSearchContext = 0;

  pommesServiceClassifierScoreReported = self->_pommesServiceClassifierScoreReported;
  self->_pommesServiceClassifierScoreReported = 0;

  pommesRequestContext = self->_pommesRequestContext;
  self->_pommesRequestContext = 0;

  performanceReported = self->_performanceReported;
  self->_performanceReported = 0;

  profileResolutionRequestContext = self->_profileResolutionRequestContext;
  self->_profileResolutionRequestContext = 0;

  pegasusKitRequestContext = self->_pegasusKitRequestContext;
  self->_pegasusKitRequestContext = 0;

  resourceDownloadContext = self->_resourceDownloadContext;
  self->_resourceDownloadContext = 0;

  cacheLookupContext = self->_cacheLookupContext;
  self->_cacheLookupContext = 0;

  cacheStoringContext = self->_cacheStoringContext;
  self->_cacheStoringContext = 0;

  cacheInvalidationContext = self->_cacheInvalidationContext;
  self->_cacheInvalidationContext = 0;

  cacheMaintenanceContext = self->_cacheMaintenanceContext;
  self->_cacheMaintenanceContext = 0;

  v17 = 113;
  if (!v4)
    v17 = 0;
  self->_whichEvent_Type = v17;
  pommesPegasusRequestGeoAppResolutionReported = self->_pommesPegasusRequestGeoAppResolutionReported;
  self->_pommesPegasusRequestGeoAppResolutionReported = v4;

}

- (POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported)pommesPegasusRequestGeoAppResolutionReported
{
  if (self->_whichEvent_Type == 113)
    return self->_pommesPegasusRequestGeoAppResolutionReported;
  else
    return (POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported *)0;
}

- (void)deletePommesPegasusRequestGeoAppResolutionReported
{
  POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported *pommesPegasusRequestGeoAppResolutionReported;

  if (self->_whichEvent_Type == 113)
  {
    self->_whichEvent_Type = 0;
    pommesPegasusRequestGeoAppResolutionReported = self->_pommesPegasusRequestGeoAppResolutionReported;
    self->_pommesPegasusRequestGeoAppResolutionReported = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESClientEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v32 = a3;
  -[POMMESSchemaPOMMESClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[POMMESSchemaPOMMESClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[POMMESSchemaPOMMESClientEvent pegasusRequestContext](self, "pegasusRequestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[POMMESSchemaPOMMESClientEvent pegasusRequestContext](self, "pegasusRequestContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[POMMESSchemaPOMMESClientEvent onDeviceIndexSearchContext](self, "onDeviceIndexSearchContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[POMMESSchemaPOMMESClientEvent onDeviceIndexSearchContext](self, "onDeviceIndexSearchContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[POMMESSchemaPOMMESClientEvent pommesServiceClassifierScoreReported](self, "pommesServiceClassifierScoreReported");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[POMMESSchemaPOMMESClientEvent pommesServiceClassifierScoreReported](self, "pommesServiceClassifierScoreReported");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[POMMESSchemaPOMMESClientEvent pommesRequestContext](self, "pommesRequestContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[POMMESSchemaPOMMESClientEvent pommesRequestContext](self, "pommesRequestContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[POMMESSchemaPOMMESClientEvent performanceReported](self, "performanceReported");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[POMMESSchemaPOMMESClientEvent performanceReported](self, "performanceReported");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[POMMESSchemaPOMMESClientEvent profileResolutionRequestContext](self, "profileResolutionRequestContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[POMMESSchemaPOMMESClientEvent profileResolutionRequestContext](self, "profileResolutionRequestContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[POMMESSchemaPOMMESClientEvent pegasusKitRequestContext](self, "pegasusKitRequestContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[POMMESSchemaPOMMESClientEvent pegasusKitRequestContext](self, "pegasusKitRequestContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[POMMESSchemaPOMMESClientEvent resourceDownloadContext](self, "resourceDownloadContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[POMMESSchemaPOMMESClientEvent resourceDownloadContext](self, "resourceDownloadContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[POMMESSchemaPOMMESClientEvent cacheLookupContext](self, "cacheLookupContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[POMMESSchemaPOMMESClientEvent cacheLookupContext](self, "cacheLookupContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[POMMESSchemaPOMMESClientEvent cacheStoringContext](self, "cacheStoringContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[POMMESSchemaPOMMESClientEvent cacheStoringContext](self, "cacheStoringContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[POMMESSchemaPOMMESClientEvent cacheInvalidationContext](self, "cacheInvalidationContext");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[POMMESSchemaPOMMESClientEvent cacheInvalidationContext](self, "cacheInvalidationContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[POMMESSchemaPOMMESClientEvent cacheMaintenanceContext](self, "cacheMaintenanceContext");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[POMMESSchemaPOMMESClientEvent cacheMaintenanceContext](self, "cacheMaintenanceContext");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[POMMESSchemaPOMMESClientEvent pommesPegasusRequestGeoAppResolutionReported](self, "pommesPegasusRequestGeoAppResolutionReported");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[POMMESSchemaPOMMESClientEvent pommesPegasusRequestGeoAppResolutionReported](self, "pommesPegasusRequestGeoAppResolutionReported");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichEvent_Type;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  char v77;
  BOOL v78;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_73;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_73;
  -[POMMESSchemaPOMMESClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_72;
  -[POMMESSchemaPOMMESClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[POMMESSchemaPOMMESClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_73;
  }
  else
  {

  }
  -[POMMESSchemaPOMMESClientEvent pegasusRequestContext](self, "pegasusRequestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pegasusRequestContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_72;
  -[POMMESSchemaPOMMESClientEvent pegasusRequestContext](self, "pegasusRequestContext");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[POMMESSchemaPOMMESClientEvent pegasusRequestContext](self, "pegasusRequestContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pegasusRequestContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_73;
  }
  else
  {

  }
  -[POMMESSchemaPOMMESClientEvent onDeviceIndexSearchContext](self, "onDeviceIndexSearchContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "onDeviceIndexSearchContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_72;
  -[POMMESSchemaPOMMESClientEvent onDeviceIndexSearchContext](self, "onDeviceIndexSearchContext");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[POMMESSchemaPOMMESClientEvent onDeviceIndexSearchContext](self, "onDeviceIndexSearchContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "onDeviceIndexSearchContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_73;
  }
  else
  {

  }
  -[POMMESSchemaPOMMESClientEvent pommesServiceClassifierScoreReported](self, "pommesServiceClassifierScoreReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pommesServiceClassifierScoreReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_72;
  -[POMMESSchemaPOMMESClientEvent pommesServiceClassifierScoreReported](self, "pommesServiceClassifierScoreReported");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[POMMESSchemaPOMMESClientEvent pommesServiceClassifierScoreReported](self, "pommesServiceClassifierScoreReported");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pommesServiceClassifierScoreReported");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_73;
  }
  else
  {

  }
  -[POMMESSchemaPOMMESClientEvent pommesRequestContext](self, "pommesRequestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pommesRequestContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_72;
  -[POMMESSchemaPOMMESClientEvent pommesRequestContext](self, "pommesRequestContext");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[POMMESSchemaPOMMESClientEvent pommesRequestContext](self, "pommesRequestContext");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pommesRequestContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_73;
  }
  else
  {

  }
  -[POMMESSchemaPOMMESClientEvent performanceReported](self, "performanceReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performanceReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_72;
  -[POMMESSchemaPOMMESClientEvent performanceReported](self, "performanceReported");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[POMMESSchemaPOMMESClientEvent performanceReported](self, "performanceReported");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "performanceReported");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_73;
  }
  else
  {

  }
  -[POMMESSchemaPOMMESClientEvent profileResolutionRequestContext](self, "profileResolutionRequestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "profileResolutionRequestContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_72;
  -[POMMESSchemaPOMMESClientEvent profileResolutionRequestContext](self, "profileResolutionRequestContext");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[POMMESSchemaPOMMESClientEvent profileResolutionRequestContext](self, "profileResolutionRequestContext");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "profileResolutionRequestContext");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_73;
  }
  else
  {

  }
  -[POMMESSchemaPOMMESClientEvent pegasusKitRequestContext](self, "pegasusKitRequestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pegasusKitRequestContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_72;
  -[POMMESSchemaPOMMESClientEvent pegasusKitRequestContext](self, "pegasusKitRequestContext");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[POMMESSchemaPOMMESClientEvent pegasusKitRequestContext](self, "pegasusKitRequestContext");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pegasusKitRequestContext");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_73;
  }
  else
  {

  }
  -[POMMESSchemaPOMMESClientEvent resourceDownloadContext](self, "resourceDownloadContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourceDownloadContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_72;
  -[POMMESSchemaPOMMESClientEvent resourceDownloadContext](self, "resourceDownloadContext");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[POMMESSchemaPOMMESClientEvent resourceDownloadContext](self, "resourceDownloadContext");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resourceDownloadContext");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_73;
  }
  else
  {

  }
  -[POMMESSchemaPOMMESClientEvent cacheLookupContext](self, "cacheLookupContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cacheLookupContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_72;
  -[POMMESSchemaPOMMESClientEvent cacheLookupContext](self, "cacheLookupContext");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[POMMESSchemaPOMMESClientEvent cacheLookupContext](self, "cacheLookupContext");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cacheLookupContext");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if (!v57)
      goto LABEL_73;
  }
  else
  {

  }
  -[POMMESSchemaPOMMESClientEvent cacheStoringContext](self, "cacheStoringContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cacheStoringContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_72;
  -[POMMESSchemaPOMMESClientEvent cacheStoringContext](self, "cacheStoringContext");
  v58 = objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    v59 = (void *)v58;
    -[POMMESSchemaPOMMESClientEvent cacheStoringContext](self, "cacheStoringContext");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cacheStoringContext");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v60, "isEqual:", v61);

    if (!v62)
      goto LABEL_73;
  }
  else
  {

  }
  -[POMMESSchemaPOMMESClientEvent cacheInvalidationContext](self, "cacheInvalidationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cacheInvalidationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_72;
  -[POMMESSchemaPOMMESClientEvent cacheInvalidationContext](self, "cacheInvalidationContext");
  v63 = objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v64 = (void *)v63;
    -[POMMESSchemaPOMMESClientEvent cacheInvalidationContext](self, "cacheInvalidationContext");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cacheInvalidationContext");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v65, "isEqual:", v66);

    if (!v67)
      goto LABEL_73;
  }
  else
  {

  }
  -[POMMESSchemaPOMMESClientEvent cacheMaintenanceContext](self, "cacheMaintenanceContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cacheMaintenanceContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_72;
  -[POMMESSchemaPOMMESClientEvent cacheMaintenanceContext](self, "cacheMaintenanceContext");
  v68 = objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    v69 = (void *)v68;
    -[POMMESSchemaPOMMESClientEvent cacheMaintenanceContext](self, "cacheMaintenanceContext");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cacheMaintenanceContext");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v70, "isEqual:", v71);

    if (!v72)
      goto LABEL_73;
  }
  else
  {

  }
  -[POMMESSchemaPOMMESClientEvent pommesPegasusRequestGeoAppResolutionReported](self, "pommesPegasusRequestGeoAppResolutionReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pommesPegasusRequestGeoAppResolutionReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[POMMESSchemaPOMMESClientEvent pommesPegasusRequestGeoAppResolutionReported](self, "pommesPegasusRequestGeoAppResolutionReported");
    v73 = objc_claimAutoreleasedReturnValue();
    if (!v73)
    {

LABEL_76:
      v78 = 1;
      goto LABEL_74;
    }
    v74 = (void *)v73;
    -[POMMESSchemaPOMMESClientEvent pommesPegasusRequestGeoAppResolutionReported](self, "pommesPegasusRequestGeoAppResolutionReported");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pommesPegasusRequestGeoAppResolutionReported");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v75, "isEqual:", v76);

    if ((v77 & 1) != 0)
      goto LABEL_76;
  }
  else
  {
LABEL_72:

  }
LABEL_73:
  v78 = 0;
LABEL_74:

  return v78;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v3 = -[POMMESSchemaPOMMESClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[POMMESSchemaPOMMESPegasusRequestContext hash](self->_pegasusRequestContext, "hash") ^ v3;
  v5 = -[POMMESSchemaPOMMESOnDeviceIndexSearchContext hash](self->_onDeviceIndexSearchContext, "hash");
  v6 = v4 ^ v5 ^ -[POMMESSchemaPOMMESServiceClassifierScoreReported hash](self->_pommesServiceClassifierScoreReported, "hash");
  v7 = -[POMMESSchemaPOMMESRequestContext hash](self->_pommesRequestContext, "hash");
  v8 = v7 ^ -[POMMESSchemaPOMMESDebugPerformanceReported hash](self->_performanceReported, "hash");
  v9 = v6 ^ v8 ^ -[POMMESSchemaPOMMESProfileSliceResolutionRequestContext hash](self->_profileResolutionRequestContext, "hash");
  v10 = -[POMMESSchemaPOMMESPegasusKitPegasusRequestContext hash](self->_pegasusKitRequestContext, "hash");
  v11 = v10 ^ -[POMMESSchemaPOMMESResourceDownloadContext hash](self->_resourceDownloadContext, "hash");
  v12 = v11 ^ -[POMMESSchemaPOMMESCacheLookupContext hash](self->_cacheLookupContext, "hash");
  v13 = v9 ^ v12 ^ -[POMMESSchemaPOMMESCacheStoringContext hash](self->_cacheStoringContext, "hash");
  v14 = -[POMMESSchemaPOMMESCacheInvalidationContext hash](self->_cacheInvalidationContext, "hash");
  v15 = v14 ^ -[POMMESSchemaPOMMESCacheMaintenanceContext hash](self->_cacheMaintenanceContext, "hash");
  return v13 ^ v15 ^ -[POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported hash](self->_pommesPegasusRequestGeoAppResolutionReported, "hash");
}

- (id)dictionaryRepresentation
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
  void *v25;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_cacheInvalidationContext)
  {
    -[POMMESSchemaPOMMESClientEvent cacheInvalidationContext](self, "cacheInvalidationContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("cacheInvalidationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("cacheInvalidationContext"));

    }
  }
  if (self->_cacheLookupContext)
  {
    -[POMMESSchemaPOMMESClientEvent cacheLookupContext](self, "cacheLookupContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("cacheLookupContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("cacheLookupContext"));

    }
  }
  if (self->_cacheMaintenanceContext)
  {
    -[POMMESSchemaPOMMESClientEvent cacheMaintenanceContext](self, "cacheMaintenanceContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("cacheMaintenanceContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("cacheMaintenanceContext"));

    }
  }
  if (self->_cacheStoringContext)
  {
    -[POMMESSchemaPOMMESClientEvent cacheStoringContext](self, "cacheStoringContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("cacheStoringContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("cacheStoringContext"));

    }
  }
  if (self->_eventMetadata)
  {
    -[POMMESSchemaPOMMESClientEvent eventMetadata](self, "eventMetadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("eventMetadata"));

    }
  }
  if (self->_onDeviceIndexSearchContext)
  {
    -[POMMESSchemaPOMMESClientEvent onDeviceIndexSearchContext](self, "onDeviceIndexSearchContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("onDeviceIndexSearchContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("onDeviceIndexSearchContext"));

    }
  }
  if (self->_pegasusKitRequestContext)
  {
    -[POMMESSchemaPOMMESClientEvent pegasusKitRequestContext](self, "pegasusKitRequestContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("pegasusKitRequestContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("pegasusKitRequestContext"));

    }
  }
  if (self->_pegasusRequestContext)
  {
    -[POMMESSchemaPOMMESClientEvent pegasusRequestContext](self, "pegasusRequestContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("pegasusRequestContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("pegasusRequestContext"));

    }
  }
  if (self->_performanceReported)
  {
    -[POMMESSchemaPOMMESClientEvent performanceReported](self, "performanceReported");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("performanceReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("performanceReported"));

    }
  }
  if (self->_pommesPegasusRequestGeoAppResolutionReported)
  {
    -[POMMESSchemaPOMMESClientEvent pommesPegasusRequestGeoAppResolutionReported](self, "pommesPegasusRequestGeoAppResolutionReported");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("pommesPegasusRequestGeoAppResolutionReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("pommesPegasusRequestGeoAppResolutionReported"));

    }
  }
  if (self->_pommesRequestContext)
  {
    -[POMMESSchemaPOMMESClientEvent pommesRequestContext](self, "pommesRequestContext");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("pommesRequestContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("pommesRequestContext"));

    }
  }
  if (self->_pommesServiceClassifierScoreReported)
  {
    -[POMMESSchemaPOMMESClientEvent pommesServiceClassifierScoreReported](self, "pommesServiceClassifierScoreReported");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "dictionaryRepresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("pommesServiceClassifierScoreReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("pommesServiceClassifierScoreReported"));

    }
  }
  if (self->_profileResolutionRequestContext)
  {
    -[POMMESSchemaPOMMESClientEvent profileResolutionRequestContext](self, "profileResolutionRequestContext");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("profileResolutionRequestContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("profileResolutionRequestContext"));

    }
  }
  if (self->_resourceDownloadContext)
  {
    -[POMMESSchemaPOMMESClientEvent resourceDownloadContext](self, "resourceDownloadContext");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "dictionaryRepresentation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("resourceDownloadContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("resourceDownloadContext"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[POMMESSchemaPOMMESClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (POMMESSchemaPOMMESClientEvent)initWithJSON:(id)a3
{
  void *v4;
  POMMESSchemaPOMMESClientEvent *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[POMMESSchemaPOMMESClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (POMMESSchemaPOMMESClientEvent)initWithDictionary:(id)a3
{
  id v4;
  POMMESSchemaPOMMESClientEvent *v5;
  uint64_t v6;
  POMMESSchemaPOMMESClientEventMetadata *v7;
  uint64_t v8;
  POMMESSchemaPOMMESPegasusRequestContext *v9;
  uint64_t v10;
  POMMESSchemaPOMMESOnDeviceIndexSearchContext *v11;
  uint64_t v12;
  POMMESSchemaPOMMESServiceClassifierScoreReported *v13;
  uint64_t v14;
  POMMESSchemaPOMMESRequestContext *v15;
  uint64_t v16;
  POMMESSchemaPOMMESDebugPerformanceReported *v17;
  uint64_t v18;
  POMMESSchemaPOMMESProfileSliceResolutionRequestContext *v19;
  uint64_t v20;
  POMMESSchemaPOMMESPegasusKitPegasusRequestContext *v21;
  void *v22;
  POMMESSchemaPOMMESResourceDownloadContext *v23;
  void *v24;
  POMMESSchemaPOMMESCacheLookupContext *v25;
  void *v26;
  POMMESSchemaPOMMESCacheStoringContext *v27;
  void *v28;
  void *v29;
  POMMESSchemaPOMMESCacheInvalidationContext *v30;
  void *v31;
  POMMESSchemaPOMMESCacheMaintenanceContext *v32;
  void *v33;
  POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported *v34;
  POMMESSchemaPOMMESClientEvent *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  objc_super v44;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)POMMESSchemaPOMMESClientEvent;
  v5 = -[POMMESSchemaPOMMESClientEvent init](&v44, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[POMMESSchemaPOMMESClientEventMetadata initWithDictionary:]([POMMESSchemaPOMMESClientEventMetadata alloc], "initWithDictionary:", v6);
      -[POMMESSchemaPOMMESClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pegasusRequestContext"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[POMMESSchemaPOMMESPegasusRequestContext initWithDictionary:]([POMMESSchemaPOMMESPegasusRequestContext alloc], "initWithDictionary:", v8);
      -[POMMESSchemaPOMMESClientEvent setPegasusRequestContext:](v5, "setPegasusRequestContext:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("onDeviceIndexSearchContext"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[POMMESSchemaPOMMESOnDeviceIndexSearchContext initWithDictionary:]([POMMESSchemaPOMMESOnDeviceIndexSearchContext alloc], "initWithDictionary:", v10);
      -[POMMESSchemaPOMMESClientEvent setOnDeviceIndexSearchContext:](v5, "setOnDeviceIndexSearchContext:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pommesServiceClassifierScoreReported"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[POMMESSchemaPOMMESServiceClassifierScoreReported initWithDictionary:]([POMMESSchemaPOMMESServiceClassifierScoreReported alloc], "initWithDictionary:", v12);
      -[POMMESSchemaPOMMESClientEvent setPommesServiceClassifierScoreReported:](v5, "setPommesServiceClassifierScoreReported:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pommesRequestContext"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[POMMESSchemaPOMMESRequestContext initWithDictionary:]([POMMESSchemaPOMMESRequestContext alloc], "initWithDictionary:", v14);
      -[POMMESSchemaPOMMESClientEvent setPommesRequestContext:](v5, "setPommesRequestContext:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("performanceReported"));
    v16 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[POMMESSchemaPOMMESDebugPerformanceReported initWithDictionary:]([POMMESSchemaPOMMESDebugPerformanceReported alloc], "initWithDictionary:", v16);
      -[POMMESSchemaPOMMESClientEvent setPerformanceReported:](v5, "setPerformanceReported:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("profileResolutionRequestContext"));
    v18 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v43 = (void *)v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[POMMESSchemaPOMMESProfileSliceResolutionRequestContext initWithDictionary:]([POMMESSchemaPOMMESProfileSliceResolutionRequestContext alloc], "initWithDictionary:", v18);
      -[POMMESSchemaPOMMESClientEvent setProfileResolutionRequestContext:](v5, "setProfileResolutionRequestContext:", v19);

    }
    v42 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pegasusKitRequestContext"));
    v20 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[POMMESSchemaPOMMESPegasusKitPegasusRequestContext initWithDictionary:]([POMMESSchemaPOMMESPegasusKitPegasusRequestContext alloc], "initWithDictionary:", v20);
      -[POMMESSchemaPOMMESClientEvent setPegasusKitRequestContext:](v5, "setPegasusKitRequestContext:", v21);

    }
    v37 = (void *)v20;
    v41 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resourceDownloadContext"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[POMMESSchemaPOMMESResourceDownloadContext initWithDictionary:]([POMMESSchemaPOMMESResourceDownloadContext alloc], "initWithDictionary:", v22);
      -[POMMESSchemaPOMMESClientEvent setResourceDownloadContext:](v5, "setResourceDownloadContext:", v23);

    }
    v40 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cacheLookupContext"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[POMMESSchemaPOMMESCacheLookupContext initWithDictionary:]([POMMESSchemaPOMMESCacheLookupContext alloc], "initWithDictionary:", v24);
      -[POMMESSchemaPOMMESClientEvent setCacheLookupContext:](v5, "setCacheLookupContext:", v25);

    }
    v38 = (void *)v16;
    v39 = (void *)v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cacheStoringContext"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[POMMESSchemaPOMMESCacheStoringContext initWithDictionary:]([POMMESSchemaPOMMESCacheStoringContext alloc], "initWithDictionary:", v26);
      -[POMMESSchemaPOMMESClientEvent setCacheStoringContext:](v5, "setCacheStoringContext:", v27);

    }
    v28 = (void *)v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cacheInvalidationContext"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = -[POMMESSchemaPOMMESCacheInvalidationContext initWithDictionary:]([POMMESSchemaPOMMESCacheInvalidationContext alloc], "initWithDictionary:", v29);
      -[POMMESSchemaPOMMESClientEvent setCacheInvalidationContext:](v5, "setCacheInvalidationContext:", v30);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cacheMaintenanceContext"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = -[POMMESSchemaPOMMESCacheMaintenanceContext initWithDictionary:]([POMMESSchemaPOMMESCacheMaintenanceContext alloc], "initWithDictionary:", v31);
      -[POMMESSchemaPOMMESClientEvent setCacheMaintenanceContext:](v5, "setCacheMaintenanceContext:", v32);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pommesPegasusRequestGeoAppResolutionReported"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = -[POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported initWithDictionary:]([POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported alloc], "initWithDictionary:", v33);
      -[POMMESSchemaPOMMESClientEvent setPommesPegasusRequestGeoAppResolutionReported:](v5, "setPommesPegasusRequestGeoAppResolutionReported:", v34);

    }
    v35 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (POMMESSchemaPOMMESClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (void)setEventMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_eventMetadata, a3);
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (BOOL)hasPegasusRequestContext
{
  return self->_hasPegasusRequestContext;
}

- (void)setHasPegasusRequestContext:(BOOL)a3
{
  self->_hasPegasusRequestContext = a3;
}

- (BOOL)hasOnDeviceIndexSearchContext
{
  return self->_hasOnDeviceIndexSearchContext;
}

- (void)setHasOnDeviceIndexSearchContext:(BOOL)a3
{
  self->_hasOnDeviceIndexSearchContext = a3;
}

- (BOOL)hasPommesServiceClassifierScoreReported
{
  return self->_hasPommesServiceClassifierScoreReported;
}

- (void)setHasPommesServiceClassifierScoreReported:(BOOL)a3
{
  self->_hasPommesServiceClassifierScoreReported = a3;
}

- (BOOL)hasPommesRequestContext
{
  return self->_hasPommesRequestContext;
}

- (void)setHasPommesRequestContext:(BOOL)a3
{
  self->_hasPommesRequestContext = a3;
}

- (BOOL)hasPerformanceReported
{
  return self->_hasPerformanceReported;
}

- (void)setHasPerformanceReported:(BOOL)a3
{
  self->_hasPerformanceReported = a3;
}

- (BOOL)hasProfileResolutionRequestContext
{
  return self->_hasProfileResolutionRequestContext;
}

- (void)setHasProfileResolutionRequestContext:(BOOL)a3
{
  self->_hasProfileResolutionRequestContext = a3;
}

- (BOOL)hasPegasusKitRequestContext
{
  return self->_hasPegasusKitRequestContext;
}

- (void)setHasPegasusKitRequestContext:(BOOL)a3
{
  self->_hasPegasusKitRequestContext = a3;
}

- (BOOL)hasResourceDownloadContext
{
  return self->_hasResourceDownloadContext;
}

- (void)setHasResourceDownloadContext:(BOOL)a3
{
  self->_hasResourceDownloadContext = a3;
}

- (BOOL)hasCacheLookupContext
{
  return self->_hasCacheLookupContext;
}

- (void)setHasCacheLookupContext:(BOOL)a3
{
  self->_hasCacheLookupContext = a3;
}

- (BOOL)hasCacheStoringContext
{
  return self->_hasCacheStoringContext;
}

- (void)setHasCacheStoringContext:(BOOL)a3
{
  self->_hasCacheStoringContext = a3;
}

- (BOOL)hasCacheInvalidationContext
{
  return self->_hasCacheInvalidationContext;
}

- (void)setHasCacheInvalidationContext:(BOOL)a3
{
  self->_hasCacheInvalidationContext = a3;
}

- (BOOL)hasCacheMaintenanceContext
{
  return self->_hasCacheMaintenanceContext;
}

- (void)setHasCacheMaintenanceContext:(BOOL)a3
{
  self->_hasCacheMaintenanceContext = a3;
}

- (BOOL)hasPommesPegasusRequestGeoAppResolutionReported
{
  return self->_hasPommesPegasusRequestGeoAppResolutionReported;
}

- (void)setHasPommesPegasusRequestGeoAppResolutionReported:(BOOL)a3
{
  self->_hasPommesPegasusRequestGeoAppResolutionReported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pommesPegasusRequestGeoAppResolutionReported, 0);
  objc_storeStrong((id *)&self->_cacheMaintenanceContext, 0);
  objc_storeStrong((id *)&self->_cacheInvalidationContext, 0);
  objc_storeStrong((id *)&self->_cacheStoringContext, 0);
  objc_storeStrong((id *)&self->_cacheLookupContext, 0);
  objc_storeStrong((id *)&self->_resourceDownloadContext, 0);
  objc_storeStrong((id *)&self->_pegasusKitRequestContext, 0);
  objc_storeStrong((id *)&self->_profileResolutionRequestContext, 0);
  objc_storeStrong((id *)&self->_performanceReported, 0);
  objc_storeStrong((id *)&self->_pommesRequestContext, 0);
  objc_storeStrong((id *)&self->_pommesServiceClassifierScoreReported, 0);
  objc_storeStrong((id *)&self->_onDeviceIndexSearchContext, 0);
  objc_storeStrong((id *)&self->_pegasusRequestContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 42;
}

@end
