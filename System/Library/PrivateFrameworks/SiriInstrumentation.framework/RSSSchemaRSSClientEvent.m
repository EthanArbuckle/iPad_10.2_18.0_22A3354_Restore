@implementation RSSSchemaRSSClientEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[RSSSchemaRSSClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rssId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_5;
  objc_msgSend(v3, "value");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      v4 = v3;
      goto LABEL_6;
    }
LABEL_5:
    v4 = 0;
  }
LABEL_6:

  return v4;
}

+ (int)joinability
{
  return 1;
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
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)RSSSchemaRSSClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v34, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RSSSchemaRSSClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[RSSSchemaRSSClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[RSSSchemaRSSClientEvent syncDataDownloadContext](self, "syncDataDownloadContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[RSSSchemaRSSClientEvent deleteSyncDataDownloadContext](self, "deleteSyncDataDownloadContext");
  -[RSSSchemaRSSClientEvent syncTokenReceived](self, "syncTokenReceived");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[RSSSchemaRSSClientEvent deleteSyncTokenReceived](self, "deleteSyncTokenReceived");
  -[RSSSchemaRSSClientEvent syncTokenFetchRequestReceived](self, "syncTokenFetchRequestReceived");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[RSSSchemaRSSClientEvent deleteSyncTokenFetchRequestReceived](self, "deleteSyncTokenFetchRequestReceived");
  -[RSSSchemaRSSClientEvent syncDataUpdatedNotificationReceived](self, "syncDataUpdatedNotificationReceived");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[RSSSchemaRSSClientEvent deleteSyncDataUpdatedNotificationReceived](self, "deleteSyncDataUpdatedNotificationReceived");
  -[RSSSchemaRSSClientEvent syncDataDonationFailed](self, "syncDataDonationFailed");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[RSSSchemaRSSClientEvent deleteSyncDataDonationFailed](self, "deleteSyncDataDonationFailed");
  -[RSSSchemaRSSClientEvent companionSyncPluginSyncRequested](self, "companionSyncPluginSyncRequested");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[RSSSchemaRSSClientEvent deleteCompanionSyncPluginSyncRequested](self, "deleteCompanionSyncPluginSyncRequested");
  -[RSSSchemaRSSClientEvent companionSyncPluginSyncObjectAcquisitionStarted](self, "companionSyncPluginSyncObjectAcquisitionStarted");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[RSSSchemaRSSClientEvent deleteCompanionSyncPluginSyncObjectAcquisitionStarted](self, "deleteCompanionSyncPluginSyncObjectAcquisitionStarted");
  -[RSSSchemaRSSClientEvent companionSyncUploadStarted](self, "companionSyncUploadStarted");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applySensitiveConditionsPolicy:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "suppressMessage");

  if (v32)
    -[RSSSchemaRSSClientEvent deleteCompanionSyncUploadStarted](self, "deleteCompanionSyncUploadStarted");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[RSSSchemaRSSClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 7)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E562AC68[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 7)
    return 0;
  else
    return off_1E562ACA8[a3 - 101];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[RSSSchemaRSSClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 7)
    return CFSTR("com.apple.aiml.siri.rss.RSSClientEvent");
  else
    return off_1E56337B8[v2 - 101];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[RSSSchemaRSSClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setSyncDataDownloadContext:(id)a3
{
  RSSSchemaRSSSiriVocabSyncDataDownloadContext *v4;
  RSSSchemaRSSSiriVocabSyncTokenReceived *syncTokenReceived;
  RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived *syncTokenFetchRequestReceived;
  RSSSchemaRSSSiriVocabSyncDataUpdatedNotificationReceived *syncDataUpdatedNotificationReceived;
  RSSSchemaRSSSiriVocabSyncDataDonationFailed *syncDataDonationFailed;
  RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncRequested *companionSyncPluginSyncRequested;
  RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncObjectAcquisitionStarted *companionSyncPluginSyncObjectAcquisitionStarted;
  RSSSchemaRSSSiriVocabSyncCompanionSyncUploadStarted *companionSyncUploadStarted;
  unint64_t v12;
  RSSSchemaRSSSiriVocabSyncDataDownloadContext *syncDataDownloadContext;

  v4 = (RSSSchemaRSSSiriVocabSyncDataDownloadContext *)a3;
  syncTokenReceived = self->_syncTokenReceived;
  self->_syncTokenReceived = 0;

  syncTokenFetchRequestReceived = self->_syncTokenFetchRequestReceived;
  self->_syncTokenFetchRequestReceived = 0;

  syncDataUpdatedNotificationReceived = self->_syncDataUpdatedNotificationReceived;
  self->_syncDataUpdatedNotificationReceived = 0;

  syncDataDonationFailed = self->_syncDataDonationFailed;
  self->_syncDataDonationFailed = 0;

  companionSyncPluginSyncRequested = self->_companionSyncPluginSyncRequested;
  self->_companionSyncPluginSyncRequested = 0;

  companionSyncPluginSyncObjectAcquisitionStarted = self->_companionSyncPluginSyncObjectAcquisitionStarted;
  self->_companionSyncPluginSyncObjectAcquisitionStarted = 0;

  companionSyncUploadStarted = self->_companionSyncUploadStarted;
  self->_companionSyncUploadStarted = 0;

  v12 = 101;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  syncDataDownloadContext = self->_syncDataDownloadContext;
  self->_syncDataDownloadContext = v4;

}

- (RSSSchemaRSSSiriVocabSyncDataDownloadContext)syncDataDownloadContext
{
  if (self->_whichEvent_Type == 101)
    return self->_syncDataDownloadContext;
  else
    return (RSSSchemaRSSSiriVocabSyncDataDownloadContext *)0;
}

- (void)deleteSyncDataDownloadContext
{
  RSSSchemaRSSSiriVocabSyncDataDownloadContext *syncDataDownloadContext;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    syncDataDownloadContext = self->_syncDataDownloadContext;
    self->_syncDataDownloadContext = 0;

  }
}

- (void)setSyncTokenReceived:(id)a3
{
  RSSSchemaRSSSiriVocabSyncTokenReceived *v4;
  RSSSchemaRSSSiriVocabSyncDataDownloadContext *syncDataDownloadContext;
  RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived *syncTokenFetchRequestReceived;
  RSSSchemaRSSSiriVocabSyncDataUpdatedNotificationReceived *syncDataUpdatedNotificationReceived;
  RSSSchemaRSSSiriVocabSyncDataDonationFailed *syncDataDonationFailed;
  RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncRequested *companionSyncPluginSyncRequested;
  RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncObjectAcquisitionStarted *companionSyncPluginSyncObjectAcquisitionStarted;
  RSSSchemaRSSSiriVocabSyncCompanionSyncUploadStarted *companionSyncUploadStarted;
  unint64_t v12;
  RSSSchemaRSSSiriVocabSyncTokenReceived *syncTokenReceived;

  v4 = (RSSSchemaRSSSiriVocabSyncTokenReceived *)a3;
  syncDataDownloadContext = self->_syncDataDownloadContext;
  self->_syncDataDownloadContext = 0;

  syncTokenFetchRequestReceived = self->_syncTokenFetchRequestReceived;
  self->_syncTokenFetchRequestReceived = 0;

  syncDataUpdatedNotificationReceived = self->_syncDataUpdatedNotificationReceived;
  self->_syncDataUpdatedNotificationReceived = 0;

  syncDataDonationFailed = self->_syncDataDonationFailed;
  self->_syncDataDonationFailed = 0;

  companionSyncPluginSyncRequested = self->_companionSyncPluginSyncRequested;
  self->_companionSyncPluginSyncRequested = 0;

  companionSyncPluginSyncObjectAcquisitionStarted = self->_companionSyncPluginSyncObjectAcquisitionStarted;
  self->_companionSyncPluginSyncObjectAcquisitionStarted = 0;

  companionSyncUploadStarted = self->_companionSyncUploadStarted;
  self->_companionSyncUploadStarted = 0;

  v12 = 102;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  syncTokenReceived = self->_syncTokenReceived;
  self->_syncTokenReceived = v4;

}

- (RSSSchemaRSSSiriVocabSyncTokenReceived)syncTokenReceived
{
  if (self->_whichEvent_Type == 102)
    return self->_syncTokenReceived;
  else
    return (RSSSchemaRSSSiriVocabSyncTokenReceived *)0;
}

- (void)deleteSyncTokenReceived
{
  RSSSchemaRSSSiriVocabSyncTokenReceived *syncTokenReceived;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    syncTokenReceived = self->_syncTokenReceived;
    self->_syncTokenReceived = 0;

  }
}

- (void)setSyncTokenFetchRequestReceived:(id)a3
{
  RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived *v4;
  RSSSchemaRSSSiriVocabSyncDataDownloadContext *syncDataDownloadContext;
  RSSSchemaRSSSiriVocabSyncTokenReceived *syncTokenReceived;
  RSSSchemaRSSSiriVocabSyncDataUpdatedNotificationReceived *syncDataUpdatedNotificationReceived;
  RSSSchemaRSSSiriVocabSyncDataDonationFailed *syncDataDonationFailed;
  RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncRequested *companionSyncPluginSyncRequested;
  RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncObjectAcquisitionStarted *companionSyncPluginSyncObjectAcquisitionStarted;
  RSSSchemaRSSSiriVocabSyncCompanionSyncUploadStarted *companionSyncUploadStarted;
  unint64_t v12;
  RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived *syncTokenFetchRequestReceived;

  v4 = (RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived *)a3;
  syncDataDownloadContext = self->_syncDataDownloadContext;
  self->_syncDataDownloadContext = 0;

  syncTokenReceived = self->_syncTokenReceived;
  self->_syncTokenReceived = 0;

  syncDataUpdatedNotificationReceived = self->_syncDataUpdatedNotificationReceived;
  self->_syncDataUpdatedNotificationReceived = 0;

  syncDataDonationFailed = self->_syncDataDonationFailed;
  self->_syncDataDonationFailed = 0;

  companionSyncPluginSyncRequested = self->_companionSyncPluginSyncRequested;
  self->_companionSyncPluginSyncRequested = 0;

  companionSyncPluginSyncObjectAcquisitionStarted = self->_companionSyncPluginSyncObjectAcquisitionStarted;
  self->_companionSyncPluginSyncObjectAcquisitionStarted = 0;

  companionSyncUploadStarted = self->_companionSyncUploadStarted;
  self->_companionSyncUploadStarted = 0;

  v12 = 103;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  syncTokenFetchRequestReceived = self->_syncTokenFetchRequestReceived;
  self->_syncTokenFetchRequestReceived = v4;

}

- (RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived)syncTokenFetchRequestReceived
{
  if (self->_whichEvent_Type == 103)
    return self->_syncTokenFetchRequestReceived;
  else
    return (RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived *)0;
}

- (void)deleteSyncTokenFetchRequestReceived
{
  RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived *syncTokenFetchRequestReceived;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    syncTokenFetchRequestReceived = self->_syncTokenFetchRequestReceived;
    self->_syncTokenFetchRequestReceived = 0;

  }
}

- (void)setSyncDataUpdatedNotificationReceived:(id)a3
{
  RSSSchemaRSSSiriVocabSyncDataUpdatedNotificationReceived *v4;
  RSSSchemaRSSSiriVocabSyncDataDownloadContext *syncDataDownloadContext;
  RSSSchemaRSSSiriVocabSyncTokenReceived *syncTokenReceived;
  RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived *syncTokenFetchRequestReceived;
  RSSSchemaRSSSiriVocabSyncDataDonationFailed *syncDataDonationFailed;
  RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncRequested *companionSyncPluginSyncRequested;
  RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncObjectAcquisitionStarted *companionSyncPluginSyncObjectAcquisitionStarted;
  RSSSchemaRSSSiriVocabSyncCompanionSyncUploadStarted *companionSyncUploadStarted;
  unint64_t v12;
  RSSSchemaRSSSiriVocabSyncDataUpdatedNotificationReceived *syncDataUpdatedNotificationReceived;

  v4 = (RSSSchemaRSSSiriVocabSyncDataUpdatedNotificationReceived *)a3;
  syncDataDownloadContext = self->_syncDataDownloadContext;
  self->_syncDataDownloadContext = 0;

  syncTokenReceived = self->_syncTokenReceived;
  self->_syncTokenReceived = 0;

  syncTokenFetchRequestReceived = self->_syncTokenFetchRequestReceived;
  self->_syncTokenFetchRequestReceived = 0;

  syncDataDonationFailed = self->_syncDataDonationFailed;
  self->_syncDataDonationFailed = 0;

  companionSyncPluginSyncRequested = self->_companionSyncPluginSyncRequested;
  self->_companionSyncPluginSyncRequested = 0;

  companionSyncPluginSyncObjectAcquisitionStarted = self->_companionSyncPluginSyncObjectAcquisitionStarted;
  self->_companionSyncPluginSyncObjectAcquisitionStarted = 0;

  companionSyncUploadStarted = self->_companionSyncUploadStarted;
  self->_companionSyncUploadStarted = 0;

  v12 = 104;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  syncDataUpdatedNotificationReceived = self->_syncDataUpdatedNotificationReceived;
  self->_syncDataUpdatedNotificationReceived = v4;

}

- (RSSSchemaRSSSiriVocabSyncDataUpdatedNotificationReceived)syncDataUpdatedNotificationReceived
{
  if (self->_whichEvent_Type == 104)
    return self->_syncDataUpdatedNotificationReceived;
  else
    return (RSSSchemaRSSSiriVocabSyncDataUpdatedNotificationReceived *)0;
}

- (void)deleteSyncDataUpdatedNotificationReceived
{
  RSSSchemaRSSSiriVocabSyncDataUpdatedNotificationReceived *syncDataUpdatedNotificationReceived;

  if (self->_whichEvent_Type == 104)
  {
    self->_whichEvent_Type = 0;
    syncDataUpdatedNotificationReceived = self->_syncDataUpdatedNotificationReceived;
    self->_syncDataUpdatedNotificationReceived = 0;

  }
}

- (void)setSyncDataDonationFailed:(id)a3
{
  RSSSchemaRSSSiriVocabSyncDataDonationFailed *v4;
  RSSSchemaRSSSiriVocabSyncDataDownloadContext *syncDataDownloadContext;
  RSSSchemaRSSSiriVocabSyncTokenReceived *syncTokenReceived;
  RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived *syncTokenFetchRequestReceived;
  RSSSchemaRSSSiriVocabSyncDataUpdatedNotificationReceived *syncDataUpdatedNotificationReceived;
  RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncRequested *companionSyncPluginSyncRequested;
  RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncObjectAcquisitionStarted *companionSyncPluginSyncObjectAcquisitionStarted;
  RSSSchemaRSSSiriVocabSyncCompanionSyncUploadStarted *companionSyncUploadStarted;
  unint64_t v12;
  RSSSchemaRSSSiriVocabSyncDataDonationFailed *syncDataDonationFailed;

  v4 = (RSSSchemaRSSSiriVocabSyncDataDonationFailed *)a3;
  syncDataDownloadContext = self->_syncDataDownloadContext;
  self->_syncDataDownloadContext = 0;

  syncTokenReceived = self->_syncTokenReceived;
  self->_syncTokenReceived = 0;

  syncTokenFetchRequestReceived = self->_syncTokenFetchRequestReceived;
  self->_syncTokenFetchRequestReceived = 0;

  syncDataUpdatedNotificationReceived = self->_syncDataUpdatedNotificationReceived;
  self->_syncDataUpdatedNotificationReceived = 0;

  companionSyncPluginSyncRequested = self->_companionSyncPluginSyncRequested;
  self->_companionSyncPluginSyncRequested = 0;

  companionSyncPluginSyncObjectAcquisitionStarted = self->_companionSyncPluginSyncObjectAcquisitionStarted;
  self->_companionSyncPluginSyncObjectAcquisitionStarted = 0;

  companionSyncUploadStarted = self->_companionSyncUploadStarted;
  self->_companionSyncUploadStarted = 0;

  v12 = 105;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  syncDataDonationFailed = self->_syncDataDonationFailed;
  self->_syncDataDonationFailed = v4;

}

- (RSSSchemaRSSSiriVocabSyncDataDonationFailed)syncDataDonationFailed
{
  if (self->_whichEvent_Type == 105)
    return self->_syncDataDonationFailed;
  else
    return (RSSSchemaRSSSiriVocabSyncDataDonationFailed *)0;
}

- (void)deleteSyncDataDonationFailed
{
  RSSSchemaRSSSiriVocabSyncDataDonationFailed *syncDataDonationFailed;

  if (self->_whichEvent_Type == 105)
  {
    self->_whichEvent_Type = 0;
    syncDataDonationFailed = self->_syncDataDonationFailed;
    self->_syncDataDonationFailed = 0;

  }
}

- (void)setCompanionSyncPluginSyncRequested:(id)a3
{
  RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncRequested *v4;
  RSSSchemaRSSSiriVocabSyncDataDownloadContext *syncDataDownloadContext;
  RSSSchemaRSSSiriVocabSyncTokenReceived *syncTokenReceived;
  RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived *syncTokenFetchRequestReceived;
  RSSSchemaRSSSiriVocabSyncDataUpdatedNotificationReceived *syncDataUpdatedNotificationReceived;
  RSSSchemaRSSSiriVocabSyncDataDonationFailed *syncDataDonationFailed;
  RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncObjectAcquisitionStarted *companionSyncPluginSyncObjectAcquisitionStarted;
  RSSSchemaRSSSiriVocabSyncCompanionSyncUploadStarted *companionSyncUploadStarted;
  unint64_t v12;
  RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncRequested *companionSyncPluginSyncRequested;

  v4 = (RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncRequested *)a3;
  syncDataDownloadContext = self->_syncDataDownloadContext;
  self->_syncDataDownloadContext = 0;

  syncTokenReceived = self->_syncTokenReceived;
  self->_syncTokenReceived = 0;

  syncTokenFetchRequestReceived = self->_syncTokenFetchRequestReceived;
  self->_syncTokenFetchRequestReceived = 0;

  syncDataUpdatedNotificationReceived = self->_syncDataUpdatedNotificationReceived;
  self->_syncDataUpdatedNotificationReceived = 0;

  syncDataDonationFailed = self->_syncDataDonationFailed;
  self->_syncDataDonationFailed = 0;

  companionSyncPluginSyncObjectAcquisitionStarted = self->_companionSyncPluginSyncObjectAcquisitionStarted;
  self->_companionSyncPluginSyncObjectAcquisitionStarted = 0;

  companionSyncUploadStarted = self->_companionSyncUploadStarted;
  self->_companionSyncUploadStarted = 0;

  v12 = 106;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  companionSyncPluginSyncRequested = self->_companionSyncPluginSyncRequested;
  self->_companionSyncPluginSyncRequested = v4;

}

- (RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncRequested)companionSyncPluginSyncRequested
{
  if (self->_whichEvent_Type == 106)
    return self->_companionSyncPluginSyncRequested;
  else
    return (RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncRequested *)0;
}

- (void)deleteCompanionSyncPluginSyncRequested
{
  RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncRequested *companionSyncPluginSyncRequested;

  if (self->_whichEvent_Type == 106)
  {
    self->_whichEvent_Type = 0;
    companionSyncPluginSyncRequested = self->_companionSyncPluginSyncRequested;
    self->_companionSyncPluginSyncRequested = 0;

  }
}

- (void)setCompanionSyncPluginSyncObjectAcquisitionStarted:(id)a3
{
  RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncObjectAcquisitionStarted *v4;
  RSSSchemaRSSSiriVocabSyncDataDownloadContext *syncDataDownloadContext;
  RSSSchemaRSSSiriVocabSyncTokenReceived *syncTokenReceived;
  RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived *syncTokenFetchRequestReceived;
  RSSSchemaRSSSiriVocabSyncDataUpdatedNotificationReceived *syncDataUpdatedNotificationReceived;
  RSSSchemaRSSSiriVocabSyncDataDonationFailed *syncDataDonationFailed;
  RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncRequested *companionSyncPluginSyncRequested;
  RSSSchemaRSSSiriVocabSyncCompanionSyncUploadStarted *companionSyncUploadStarted;
  unint64_t v12;
  RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncObjectAcquisitionStarted *companionSyncPluginSyncObjectAcquisitionStarted;

  v4 = (RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncObjectAcquisitionStarted *)a3;
  syncDataDownloadContext = self->_syncDataDownloadContext;
  self->_syncDataDownloadContext = 0;

  syncTokenReceived = self->_syncTokenReceived;
  self->_syncTokenReceived = 0;

  syncTokenFetchRequestReceived = self->_syncTokenFetchRequestReceived;
  self->_syncTokenFetchRequestReceived = 0;

  syncDataUpdatedNotificationReceived = self->_syncDataUpdatedNotificationReceived;
  self->_syncDataUpdatedNotificationReceived = 0;

  syncDataDonationFailed = self->_syncDataDonationFailed;
  self->_syncDataDonationFailed = 0;

  companionSyncPluginSyncRequested = self->_companionSyncPluginSyncRequested;
  self->_companionSyncPluginSyncRequested = 0;

  companionSyncUploadStarted = self->_companionSyncUploadStarted;
  self->_companionSyncUploadStarted = 0;

  v12 = 107;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  companionSyncPluginSyncObjectAcquisitionStarted = self->_companionSyncPluginSyncObjectAcquisitionStarted;
  self->_companionSyncPluginSyncObjectAcquisitionStarted = v4;

}

- (RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncObjectAcquisitionStarted)companionSyncPluginSyncObjectAcquisitionStarted
{
  if (self->_whichEvent_Type == 107)
    return self->_companionSyncPluginSyncObjectAcquisitionStarted;
  else
    return (RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncObjectAcquisitionStarted *)0;
}

- (void)deleteCompanionSyncPluginSyncObjectAcquisitionStarted
{
  RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncObjectAcquisitionStarted *companionSyncPluginSyncObjectAcquisitionStarted;

  if (self->_whichEvent_Type == 107)
  {
    self->_whichEvent_Type = 0;
    companionSyncPluginSyncObjectAcquisitionStarted = self->_companionSyncPluginSyncObjectAcquisitionStarted;
    self->_companionSyncPluginSyncObjectAcquisitionStarted = 0;

  }
}

- (void)setCompanionSyncUploadStarted:(id)a3
{
  RSSSchemaRSSSiriVocabSyncCompanionSyncUploadStarted *v4;
  RSSSchemaRSSSiriVocabSyncDataDownloadContext *syncDataDownloadContext;
  RSSSchemaRSSSiriVocabSyncTokenReceived *syncTokenReceived;
  RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived *syncTokenFetchRequestReceived;
  RSSSchemaRSSSiriVocabSyncDataUpdatedNotificationReceived *syncDataUpdatedNotificationReceived;
  RSSSchemaRSSSiriVocabSyncDataDonationFailed *syncDataDonationFailed;
  RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncRequested *companionSyncPluginSyncRequested;
  RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncObjectAcquisitionStarted *companionSyncPluginSyncObjectAcquisitionStarted;
  unint64_t v12;
  RSSSchemaRSSSiriVocabSyncCompanionSyncUploadStarted *companionSyncUploadStarted;

  v4 = (RSSSchemaRSSSiriVocabSyncCompanionSyncUploadStarted *)a3;
  syncDataDownloadContext = self->_syncDataDownloadContext;
  self->_syncDataDownloadContext = 0;

  syncTokenReceived = self->_syncTokenReceived;
  self->_syncTokenReceived = 0;

  syncTokenFetchRequestReceived = self->_syncTokenFetchRequestReceived;
  self->_syncTokenFetchRequestReceived = 0;

  syncDataUpdatedNotificationReceived = self->_syncDataUpdatedNotificationReceived;
  self->_syncDataUpdatedNotificationReceived = 0;

  syncDataDonationFailed = self->_syncDataDonationFailed;
  self->_syncDataDonationFailed = 0;

  companionSyncPluginSyncRequested = self->_companionSyncPluginSyncRequested;
  self->_companionSyncPluginSyncRequested = 0;

  companionSyncPluginSyncObjectAcquisitionStarted = self->_companionSyncPluginSyncObjectAcquisitionStarted;
  self->_companionSyncPluginSyncObjectAcquisitionStarted = 0;

  v12 = 108;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  companionSyncUploadStarted = self->_companionSyncUploadStarted;
  self->_companionSyncUploadStarted = v4;

}

- (RSSSchemaRSSSiriVocabSyncCompanionSyncUploadStarted)companionSyncUploadStarted
{
  if (self->_whichEvent_Type == 108)
    return self->_companionSyncUploadStarted;
  else
    return (RSSSchemaRSSSiriVocabSyncCompanionSyncUploadStarted *)0;
}

- (void)deleteCompanionSyncUploadStarted
{
  RSSSchemaRSSSiriVocabSyncCompanionSyncUploadStarted *companionSyncUploadStarted;

  if (self->_whichEvent_Type == 108)
  {
    self->_whichEvent_Type = 0;
    companionSyncUploadStarted = self->_companionSyncUploadStarted;
    self->_companionSyncUploadStarted = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return RSSSchemaRSSClientEventReadFrom(self, (uint64_t)a3);
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
  id v22;

  v22 = a3;
  -[RSSSchemaRSSClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RSSSchemaRSSClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RSSSchemaRSSClientEvent syncDataDownloadContext](self, "syncDataDownloadContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[RSSSchemaRSSClientEvent syncDataDownloadContext](self, "syncDataDownloadContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RSSSchemaRSSClientEvent syncTokenReceived](self, "syncTokenReceived");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[RSSSchemaRSSClientEvent syncTokenReceived](self, "syncTokenReceived");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RSSSchemaRSSClientEvent syncTokenFetchRequestReceived](self, "syncTokenFetchRequestReceived");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[RSSSchemaRSSClientEvent syncTokenFetchRequestReceived](self, "syncTokenFetchRequestReceived");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RSSSchemaRSSClientEvent syncDataUpdatedNotificationReceived](self, "syncDataUpdatedNotificationReceived");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[RSSSchemaRSSClientEvent syncDataUpdatedNotificationReceived](self, "syncDataUpdatedNotificationReceived");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RSSSchemaRSSClientEvent syncDataDonationFailed](self, "syncDataDonationFailed");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[RSSSchemaRSSClientEvent syncDataDonationFailed](self, "syncDataDonationFailed");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RSSSchemaRSSClientEvent companionSyncPluginSyncRequested](self, "companionSyncPluginSyncRequested");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[RSSSchemaRSSClientEvent companionSyncPluginSyncRequested](self, "companionSyncPluginSyncRequested");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RSSSchemaRSSClientEvent companionSyncPluginSyncObjectAcquisitionStarted](self, "companionSyncPluginSyncObjectAcquisitionStarted");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[RSSSchemaRSSClientEvent companionSyncPluginSyncObjectAcquisitionStarted](self, "companionSyncPluginSyncObjectAcquisitionStarted");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RSSSchemaRSSClientEvent companionSyncUploadStarted](self, "companionSyncUploadStarted");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[RSSSchemaRSSClientEvent companionSyncUploadStarted](self, "companionSyncUploadStarted");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v52;
  BOOL v53;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_48;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_48;
  -[RSSSchemaRSSClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_47;
  -[RSSSchemaRSSClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[RSSSchemaRSSClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_48;
  }
  else
  {

  }
  -[RSSSchemaRSSClientEvent syncDataDownloadContext](self, "syncDataDownloadContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "syncDataDownloadContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_47;
  -[RSSSchemaRSSClientEvent syncDataDownloadContext](self, "syncDataDownloadContext");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[RSSSchemaRSSClientEvent syncDataDownloadContext](self, "syncDataDownloadContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "syncDataDownloadContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_48;
  }
  else
  {

  }
  -[RSSSchemaRSSClientEvent syncTokenReceived](self, "syncTokenReceived");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "syncTokenReceived");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_47;
  -[RSSSchemaRSSClientEvent syncTokenReceived](self, "syncTokenReceived");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[RSSSchemaRSSClientEvent syncTokenReceived](self, "syncTokenReceived");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "syncTokenReceived");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_48;
  }
  else
  {

  }
  -[RSSSchemaRSSClientEvent syncTokenFetchRequestReceived](self, "syncTokenFetchRequestReceived");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "syncTokenFetchRequestReceived");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_47;
  -[RSSSchemaRSSClientEvent syncTokenFetchRequestReceived](self, "syncTokenFetchRequestReceived");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[RSSSchemaRSSClientEvent syncTokenFetchRequestReceived](self, "syncTokenFetchRequestReceived");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "syncTokenFetchRequestReceived");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_48;
  }
  else
  {

  }
  -[RSSSchemaRSSClientEvent syncDataUpdatedNotificationReceived](self, "syncDataUpdatedNotificationReceived");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "syncDataUpdatedNotificationReceived");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_47;
  -[RSSSchemaRSSClientEvent syncDataUpdatedNotificationReceived](self, "syncDataUpdatedNotificationReceived");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[RSSSchemaRSSClientEvent syncDataUpdatedNotificationReceived](self, "syncDataUpdatedNotificationReceived");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "syncDataUpdatedNotificationReceived");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_48;
  }
  else
  {

  }
  -[RSSSchemaRSSClientEvent syncDataDonationFailed](self, "syncDataDonationFailed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "syncDataDonationFailed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_47;
  -[RSSSchemaRSSClientEvent syncDataDonationFailed](self, "syncDataDonationFailed");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[RSSSchemaRSSClientEvent syncDataDonationFailed](self, "syncDataDonationFailed");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "syncDataDonationFailed");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_48;
  }
  else
  {

  }
  -[RSSSchemaRSSClientEvent companionSyncPluginSyncRequested](self, "companionSyncPluginSyncRequested");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "companionSyncPluginSyncRequested");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_47;
  -[RSSSchemaRSSClientEvent companionSyncPluginSyncRequested](self, "companionSyncPluginSyncRequested");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[RSSSchemaRSSClientEvent companionSyncPluginSyncRequested](self, "companionSyncPluginSyncRequested");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "companionSyncPluginSyncRequested");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_48;
  }
  else
  {

  }
  -[RSSSchemaRSSClientEvent companionSyncPluginSyncObjectAcquisitionStarted](self, "companionSyncPluginSyncObjectAcquisitionStarted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "companionSyncPluginSyncObjectAcquisitionStarted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_47;
  -[RSSSchemaRSSClientEvent companionSyncPluginSyncObjectAcquisitionStarted](self, "companionSyncPluginSyncObjectAcquisitionStarted");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[RSSSchemaRSSClientEvent companionSyncPluginSyncObjectAcquisitionStarted](self, "companionSyncPluginSyncObjectAcquisitionStarted");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "companionSyncPluginSyncObjectAcquisitionStarted");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_48;
  }
  else
  {

  }
  -[RSSSchemaRSSClientEvent companionSyncUploadStarted](self, "companionSyncUploadStarted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "companionSyncUploadStarted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[RSSSchemaRSSClientEvent companionSyncUploadStarted](self, "companionSyncUploadStarted");
    v48 = objc_claimAutoreleasedReturnValue();
    if (!v48)
    {

LABEL_51:
      v53 = 1;
      goto LABEL_49;
    }
    v49 = (void *)v48;
    -[RSSSchemaRSSClientEvent companionSyncUploadStarted](self, "companionSyncUploadStarted");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "companionSyncUploadStarted");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if ((v52 & 1) != 0)
      goto LABEL_51;
  }
  else
  {
LABEL_47:

  }
LABEL_48:
  v53 = 0;
LABEL_49:

  return v53;
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

  v3 = -[RSSSchemaRSSClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[RSSSchemaRSSSiriVocabSyncDataDownloadContext hash](self->_syncDataDownloadContext, "hash") ^ v3;
  v5 = -[RSSSchemaRSSSiriVocabSyncTokenReceived hash](self->_syncTokenReceived, "hash");
  v6 = v4 ^ v5 ^ -[RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived hash](self->_syncTokenFetchRequestReceived, "hash");
  v7 = -[RSSSchemaRSSSiriVocabSyncDataUpdatedNotificationReceived hash](self->_syncDataUpdatedNotificationReceived, "hash");
  v8 = v7 ^ -[RSSSchemaRSSSiriVocabSyncDataDonationFailed hash](self->_syncDataDonationFailed, "hash");
  v9 = v6 ^ v8 ^ -[RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncRequested hash](self->_companionSyncPluginSyncRequested, "hash");
  v10 = -[RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncObjectAcquisitionStarted hash](self->_companionSyncPluginSyncObjectAcquisitionStarted, "hash");
  return v9 ^ v10 ^ -[RSSSchemaRSSSiriVocabSyncCompanionSyncUploadStarted hash](self->_companionSyncUploadStarted, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_companionSyncPluginSyncObjectAcquisitionStarted)
  {
    -[RSSSchemaRSSClientEvent companionSyncPluginSyncObjectAcquisitionStarted](self, "companionSyncPluginSyncObjectAcquisitionStarted");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("companionSyncPluginSyncObjectAcquisitionStarted"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("companionSyncPluginSyncObjectAcquisitionStarted"));

    }
  }
  if (self->_companionSyncPluginSyncRequested)
  {
    -[RSSSchemaRSSClientEvent companionSyncPluginSyncRequested](self, "companionSyncPluginSyncRequested");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("companionSyncPluginSyncRequested"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("companionSyncPluginSyncRequested"));

    }
  }
  if (self->_companionSyncUploadStarted)
  {
    -[RSSSchemaRSSClientEvent companionSyncUploadStarted](self, "companionSyncUploadStarted");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("companionSyncUploadStarted"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("companionSyncUploadStarted"));

    }
  }
  if (self->_eventMetadata)
  {
    -[RSSSchemaRSSClientEvent eventMetadata](self, "eventMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("eventMetadata"));

    }
  }
  if (self->_syncDataDonationFailed)
  {
    -[RSSSchemaRSSClientEvent syncDataDonationFailed](self, "syncDataDonationFailed");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("syncDataDonationFailed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("syncDataDonationFailed"));

    }
  }
  if (self->_syncDataDownloadContext)
  {
    -[RSSSchemaRSSClientEvent syncDataDownloadContext](self, "syncDataDownloadContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("syncDataDownloadContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("syncDataDownloadContext"));

    }
  }
  if (self->_syncDataUpdatedNotificationReceived)
  {
    -[RSSSchemaRSSClientEvent syncDataUpdatedNotificationReceived](self, "syncDataUpdatedNotificationReceived");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("syncDataUpdatedNotificationReceived"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("syncDataUpdatedNotificationReceived"));

    }
  }
  if (self->_syncTokenFetchRequestReceived)
  {
    -[RSSSchemaRSSClientEvent syncTokenFetchRequestReceived](self, "syncTokenFetchRequestReceived");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("syncTokenFetchRequestReceived"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("syncTokenFetchRequestReceived"));

    }
  }
  if (self->_syncTokenReceived)
  {
    -[RSSSchemaRSSClientEvent syncTokenReceived](self, "syncTokenReceived");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("syncTokenReceived"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("syncTokenReceived"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[RSSSchemaRSSClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (RSSSchemaRSSClientEvent)initWithJSON:(id)a3
{
  void *v4;
  RSSSchemaRSSClientEvent *v5;
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
    self = -[RSSSchemaRSSClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (RSSSchemaRSSClientEvent)initWithDictionary:(id)a3
{
  id v4;
  RSSSchemaRSSClientEvent *v5;
  uint64_t v6;
  RSSSchemaRSSClientEventMetadata *v7;
  uint64_t v8;
  RSSSchemaRSSSiriVocabSyncDataDownloadContext *v9;
  void *v10;
  RSSSchemaRSSSiriVocabSyncTokenReceived *v11;
  void *v12;
  RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived *v13;
  void *v14;
  RSSSchemaRSSSiriVocabSyncDataUpdatedNotificationReceived *v15;
  void *v16;
  RSSSchemaRSSSiriVocabSyncDataDonationFailed *v17;
  void *v18;
  RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncRequested *v19;
  void *v20;
  RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncObjectAcquisitionStarted *v21;
  void *v22;
  RSSSchemaRSSSiriVocabSyncCompanionSyncUploadStarted *v23;
  RSSSchemaRSSClientEvent *v24;
  void *v26;
  void *v27;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)RSSSchemaRSSClientEvent;
  v5 = -[RSSSchemaRSSClientEvent init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[RSSSchemaRSSClientEventMetadata initWithDictionary:]([RSSSchemaRSSClientEventMetadata alloc], "initWithDictionary:", v6);
      -[RSSSchemaRSSClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    v27 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("syncDataDownloadContext"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[RSSSchemaRSSSiriVocabSyncDataDownloadContext initWithDictionary:]([RSSSchemaRSSSiriVocabSyncDataDownloadContext alloc], "initWithDictionary:", v8);
      -[RSSSchemaRSSClientEvent setSyncDataDownloadContext:](v5, "setSyncDataDownloadContext:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("syncTokenReceived"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[RSSSchemaRSSSiriVocabSyncTokenReceived initWithDictionary:]([RSSSchemaRSSSiriVocabSyncTokenReceived alloc], "initWithDictionary:", v10);
      -[RSSSchemaRSSClientEvent setSyncTokenReceived:](v5, "setSyncTokenReceived:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("syncTokenFetchRequestReceived"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived initWithDictionary:]([RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived alloc], "initWithDictionary:", v12);
      -[RSSSchemaRSSClientEvent setSyncTokenFetchRequestReceived:](v5, "setSyncTokenFetchRequestReceived:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("syncDataUpdatedNotificationReceived"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[RSSSchemaRSSSiriVocabSyncDataUpdatedNotificationReceived initWithDictionary:]([RSSSchemaRSSSiriVocabSyncDataUpdatedNotificationReceived alloc], "initWithDictionary:", v14);
      -[RSSSchemaRSSClientEvent setSyncDataUpdatedNotificationReceived:](v5, "setSyncDataUpdatedNotificationReceived:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("syncDataDonationFailed"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[RSSSchemaRSSSiriVocabSyncDataDonationFailed initWithDictionary:]([RSSSchemaRSSSiriVocabSyncDataDonationFailed alloc], "initWithDictionary:", v16);
      -[RSSSchemaRSSClientEvent setSyncDataDonationFailed:](v5, "setSyncDataDonationFailed:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("companionSyncPluginSyncRequested"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncRequested initWithDictionary:]([RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncRequested alloc], "initWithDictionary:", v18);
      -[RSSSchemaRSSClientEvent setCompanionSyncPluginSyncRequested:](v5, "setCompanionSyncPluginSyncRequested:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("companionSyncPluginSyncObjectAcquisitionStarted"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncObjectAcquisitionStarted initWithDictionary:]([RSSSchemaRSSSiriVocabSyncCompanionSyncPluginSyncObjectAcquisitionStarted alloc], "initWithDictionary:", v20);
      -[RSSSchemaRSSClientEvent setCompanionSyncPluginSyncObjectAcquisitionStarted:](v5, "setCompanionSyncPluginSyncObjectAcquisitionStarted:", v21);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("companionSyncUploadStarted"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[RSSSchemaRSSSiriVocabSyncCompanionSyncUploadStarted initWithDictionary:]([RSSSchemaRSSSiriVocabSyncCompanionSyncUploadStarted alloc], "initWithDictionary:", v22);
      -[RSSSchemaRSSClientEvent setCompanionSyncUploadStarted:](v5, "setCompanionSyncUploadStarted:", v23);

    }
    v24 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (RSSSchemaRSSClientEventMetadata)eventMetadata
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

- (BOOL)hasSyncDataDownloadContext
{
  return self->_hasSyncDataDownloadContext;
}

- (void)setHasSyncDataDownloadContext:(BOOL)a3
{
  self->_hasSyncDataDownloadContext = a3;
}

- (BOOL)hasSyncTokenReceived
{
  return self->_hasSyncTokenReceived;
}

- (void)setHasSyncTokenReceived:(BOOL)a3
{
  self->_hasSyncTokenReceived = a3;
}

- (BOOL)hasSyncTokenFetchRequestReceived
{
  return self->_hasSyncTokenFetchRequestReceived;
}

- (void)setHasSyncTokenFetchRequestReceived:(BOOL)a3
{
  self->_hasSyncTokenFetchRequestReceived = a3;
}

- (BOOL)hasSyncDataUpdatedNotificationReceived
{
  return self->_hasSyncDataUpdatedNotificationReceived;
}

- (void)setHasSyncDataUpdatedNotificationReceived:(BOOL)a3
{
  self->_hasSyncDataUpdatedNotificationReceived = a3;
}

- (BOOL)hasSyncDataDonationFailed
{
  return self->_hasSyncDataDonationFailed;
}

- (void)setHasSyncDataDonationFailed:(BOOL)a3
{
  self->_hasSyncDataDonationFailed = a3;
}

- (BOOL)hasCompanionSyncPluginSyncRequested
{
  return self->_hasCompanionSyncPluginSyncRequested;
}

- (void)setHasCompanionSyncPluginSyncRequested:(BOOL)a3
{
  self->_hasCompanionSyncPluginSyncRequested = a3;
}

- (BOOL)hasCompanionSyncPluginSyncObjectAcquisitionStarted
{
  return self->_hasCompanionSyncPluginSyncObjectAcquisitionStarted;
}

- (void)setHasCompanionSyncPluginSyncObjectAcquisitionStarted:(BOOL)a3
{
  self->_hasCompanionSyncPluginSyncObjectAcquisitionStarted = a3;
}

- (BOOL)hasCompanionSyncUploadStarted
{
  return self->_hasCompanionSyncUploadStarted;
}

- (void)setHasCompanionSyncUploadStarted:(BOOL)a3
{
  self->_hasCompanionSyncUploadStarted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionSyncUploadStarted, 0);
  objc_storeStrong((id *)&self->_companionSyncPluginSyncObjectAcquisitionStarted, 0);
  objc_storeStrong((id *)&self->_companionSyncPluginSyncRequested, 0);
  objc_storeStrong((id *)&self->_syncDataDonationFailed, 0);
  objc_storeStrong((id *)&self->_syncDataUpdatedNotificationReceived, 0);
  objc_storeStrong((id *)&self->_syncTokenFetchRequestReceived, 0);
  objc_storeStrong((id *)&self->_syncTokenReceived, 0);
  objc_storeStrong((id *)&self->_syncDataDownloadContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 50;
}

@end
