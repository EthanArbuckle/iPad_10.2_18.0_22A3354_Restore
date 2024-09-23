@implementation PKProvisioningAnalyticsSessionReporter

- (PKProvisioningAnalyticsSessionReporter)initWithResponder:(id)a3 sessionID:(id)a4
{
  id v6;
  PKProvisioningAnalyticsSessionReporter *v7;
  PKProvisioningAnalyticsSessionReporter *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKProvisioningAnalyticsSessionReporter;
  v7 = -[PKProvisioningAnalyticsSessionReporter init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_responder, v6);
    v8->_sessionID = (NSString *)a4;
  }

  return v8;
}

- (void)_populateDictionary:(id)a3 withError:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  if (a4)
  {
    v12 = a4;
    v5 = a3;
    objc_msgSend(v12, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = v7;
    else
      v8 = v12;
    v9 = v8;

    v10 = objc_msgSend(v9, "code");
    +[PKAnalyticsReporter analyticsErrorTextForError:](PKAnalyticsReporter, "analyticsErrorTextForError:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("errorText"));

  }
}

- (void)reportEvent:(id)a3
{
  PKProvisioningAnalyticsSessionReportingResponder **p_responder;
  id v4;
  id WeakRetained;

  p_responder = &self->_responder;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_responder);
  objc_msgSend(WeakRetained, "didReceiveEvent:", v4);

}

- (void)reportError:(id)a3 context:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id WeakRetained;
  id v10;

  v10 = a4;
  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  if (v10)
    objc_msgSend(v8, "addEntriesFromDictionary:", v10);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("pageError"), CFSTR("eventType"));
  -[PKProvisioningAnalyticsSessionReporter _populateDictionary:withError:](self, "_populateDictionary:withError:", v8, v7);

  WeakRetained = objc_loadWeakRetained((id *)&self->_responder);
  objc_msgSend(WeakRetained, "didReceiveEvent:", v8);

}

- (void)reportOtherError:(id)a3 context:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id WeakRetained;
  id v10;

  v10 = a4;
  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  if (v10)
    objc_msgSend(v8, "addEntriesFromDictionary:", v10);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("pageError"), CFSTR("eventType"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("errorText"));

  WeakRetained = objc_loadWeakRetained((id *)&self->_responder);
  objc_msgSend(WeakRetained, "didReceiveEvent:", v8);

}

- (void)setProductType:(id)a3 subtype:(id)a4
{
  PKProvisioningAnalyticsSessionReportingResponder **p_responder;
  id v6;
  id v7;
  id WeakRetained;

  p_responder = &self->_responder;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_responder);
  objc_msgSend(WeakRetained, "setProductType:subtype:", v7, v6);

}

- (void)resetProductTypes
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_responder);
  objc_msgSend(WeakRetained, "resetProductTypes");

}

- (void)setSetupProduct:(id)a3
{
  PKProvisioningAnalyticsSessionReportingResponder **p_responder;
  id v4;
  id WeakRetained;

  p_responder = &self->_responder;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_responder);
  objc_msgSend(WeakRetained, "setSetupProduct:", v4);

}

- (PKProvisioningAnalyticsSessionReportingResponder)responder
{
  return (PKProvisioningAnalyticsSessionReportingResponder *)objc_loadWeakRetained((id *)&self->_responder);
}

- (void)setResponder:(id)a3
{
  objc_storeWeak((id *)&self->_responder, a3);
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  self->_sessionID = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_responder);
}

@end
