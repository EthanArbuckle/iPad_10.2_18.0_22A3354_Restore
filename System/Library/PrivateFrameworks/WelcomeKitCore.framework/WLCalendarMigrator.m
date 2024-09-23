@implementation WLCalendarMigrator

- (WLCalendarMigrator)init
{
  WLCalendarMigrator *v2;
  EKEventStore *v3;
  EKEventStore *eventStore;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WLCalendarMigrator;
  v2 = -[WLCalendarMigrator init](&v6, sel_init);
  if (v2)
  {
    v3 = (EKEventStore *)objc_alloc_init(MEMORY[0x24BDC74E8]);
    eventStore = v2->_eventStore;
    v2->_eventStore = v3;

  }
  return v2;
}

- (void)enable
{
  WLFeaturePayload **p_featurePayload;
  id WeakRetained;
  id v4;

  p_featurePayload = &self->_featurePayload;
  WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setEnabled:", 1);

  v4 = objc_loadWeakRetained((id *)p_featurePayload);
  objc_msgSend(v4, "setState:", CFSTR("enabled"));

}

- (void)setState:(id)a3
{
  WLFeaturePayload **p_featurePayload;
  id v4;
  id WeakRetained;

  p_featurePayload = &self->_featurePayload;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_featurePayload);
  objc_msgSend(WeakRetained, "setState:", v4);

}

- (void)setEstimatedDataSize:(unint64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setSize:", a3);

}

- (void)addWorkingTime:(unint64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setElapsedTime:", objc_msgSend(WeakRetained, "elapsedTime") + a3);

}

+ (id)contentType
{
  return CFSTR("calendar");
}

- (id)contentType
{
  return +[WLCalendarMigrator contentType](WLCalendarMigrator, "contentType");
}

- (id)dataType
{
  return +[WLCalendarMigrator contentType](WLCalendarMigrator, "contentType");
}

- (BOOL)accountBased
{
  return 1;
}

- (BOOL)storeRecordDataInDatabase
{
  return 1;
}

- (BOOL)wantsSegmentedDownloads
{
  return 0;
}

- (void)estimateItemSizeForSummary:(id)a3 account:(id)a4
{
  id v4;

  v4 = a3;
  if (!objc_msgSend(v4, "itemSize"))
    objc_msgSend(v4, "setItemSize:", 256);

}

- (id)importWillBegin
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setSize:", 0);

  return 0;
}

- (void)importRecordData:(id)a3 summary:(id)a4 account:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id WeakRetained;
  id v12;
  void *v13;
  id v14;

  v14 = a6;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setCount:", objc_msgSend(WeakRetained, "count") + 1);

  v12 = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(v12, "setSize:", objc_msgSend(v12, "size") + objc_msgSend(v10, "length"));

  -[WLCalendarMigrator _importDataRecord:summary:](self, "_importDataRecord:summary:", v10, v9);
  v13 = v14;
  if (v14)
  {
    (*((void (**)(id, uint64_t, _QWORD))v14 + 2))(v14, 1, 0);
    v13 = v14;
  }

}

- (void)_importDataRecord:(id)a3 summary:(id)a4
{
  EKEventStore *eventStore;
  id v7;
  id v8;
  void *v9;
  id v10;

  eventStore = self->_eventStore;
  v7 = a4;
  v8 = a3;
  -[EKEventStore defaultCalendarForNewEvents](eventStore, "defaultCalendarForNewEvents");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[EKEventStore importICSData:intoCalendar:options:](self->_eventStore, "importICSData:intoCalendar:options:", v8, v10, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKEventStore reset](self->_eventStore, "reset");
  _WLLog();

}

- (WLFeaturePayload)featurePayload
{
  return (WLFeaturePayload *)objc_loadWeakRetained((id *)&self->_featurePayload);
}

- (void)setFeaturePayload:(id)a3
{
  objc_storeWeak((id *)&self->_featurePayload, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_featurePayload);
  objc_storeStrong((id *)&self->_eventStore, 0);
}

@end
