@implementation PKProvisioningAnalyticsSessionUIReporter

- (PKProvisioningAnalyticsSessionUIReporter)initWithResponder:(id)a3 sessionID:(id)a4 pageTag:(id)a5
{
  id v9;
  PKProvisioningAnalyticsSessionUIReporter *v10;
  PKProvisioningAnalyticsSessionUIReporter *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PKProvisioningAnalyticsSessionUIReporter;
  v10 = -[PKProvisioningAnalyticsSessionReporter initWithResponder:sessionID:](&v13, sel_initWithResponder_sessionID_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_pageTag, a5);

  return v11;
}

- (void)reportEvent:(id)a3
{
  void *v4;
  objc_super v5;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_pageTag, CFSTR("pageTag"));
  v5.receiver = self;
  v5.super_class = (Class)PKProvisioningAnalyticsSessionUIReporter;
  -[PKProvisioningAnalyticsSessionReporter reportEvent:](&v5, sel_reportEvent_, v4);

}

- (void)reportViewAppeared
{
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("eventType");
  v5[0] = CFSTR("viewDidAppear");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProvisioningAnalyticsSessionUIReporter reportEvent:](self, "reportEvent:", v3);

}

- (void)reportViewAppearedWithContext:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("viewDidAppear"), CFSTR("eventType"));
  -[PKProvisioningAnalyticsSessionUIReporter reportEvent:](self, "reportEvent:", v4);

}

- (void)reportButtonPressed:(unint64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("buttonTap");
  v6[0] = CFSTR("eventType");
  v6[1] = CFSTR("buttonTag");
  PKProvisioningAnalyticsButtonTagToString(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKProvisioningAnalyticsSessionUIReporter reportEvent:](self, "reportEvent:", v5);
}

- (void)reportButtonPressed:(unint64_t)a3 context:(id)a4
{
  void *v6;
  id v7;

  v7 = (id)objc_msgSend(a4, "mutableCopy");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("buttonTap"), CFSTR("eventType"));
  PKProvisioningAnalyticsButtonTagToString(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("buttonTag"));

  -[PKProvisioningAnalyticsSessionUIReporter reportEvent:](self, "reportEvent:", v7);
}

- (void)reportOtherButtonPressed:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("eventType");
  v7[1] = CFSTR("buttonTag");
  v8[0] = CFSTR("buttonTap");
  v8[1] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKProvisioningAnalyticsSessionUIReporter reportEvent:](self, "reportEvent:", v6);
}

- (void)reportOtherButtonPressed:(id)a3 context:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_msgSend(a4, "mutableCopy");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("buttonTap"), CFSTR("eventType"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("buttonTag"));

  -[PKProvisioningAnalyticsSessionUIReporter reportEvent:](self, "reportEvent:", v7);
}

- (void)reportPageCompleted:(BOOL)a3 context:(id)a4
{
  _BOOL4 v4;
  id v6;
  __CFString **v7;
  id v8;

  v4 = a3;
  v8 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v8)
    objc_msgSend(v6, "addEntriesFromDictionary:", v8);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("pageTaskFinished"), CFSTR("eventType"));
  v7 = PKAnalyticsReportResultSuccess;
  if (!v4)
    v7 = PKAnalyticsReportResultFailure;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", *v7, CFSTR("result"));
  -[PKProvisioningAnalyticsSessionUIReporter reportEvent:](self, "reportEvent:", v6);

}

- (NSString)pageTag
{
  return self->_pageTag;
}

- (void)setPageTag:(id)a3
{
  objc_storeStrong((id *)&self->_pageTag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageTag, 0);
}

@end
