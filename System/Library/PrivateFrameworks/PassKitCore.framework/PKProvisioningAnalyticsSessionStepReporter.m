@implementation PKProvisioningAnalyticsSessionStepReporter

- (void)reportProvisioningStep:(id)a3 finishedWithStatus:(BOOL)a4
{
  _BOOL4 v4;
  objc_class *v6;
  id v7;
  __CFString **v8;
  id v9;

  v4 = a4;
  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("provisioningStatus"), CFSTR("eventType"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("provisioningStep"));

  v8 = PKAnalyticsReportResultSuccess;
  if (!v4)
    v8 = PKAnalyticsReportResultFailure;
  objc_msgSend(v9, "setObject:forKeyedSubscript:", *v8, CFSTR("result"));
  -[PKProvisioningAnalyticsSessionReporter reportEvent:](self, "reportEvent:", v9);

}

- (void)reportProvisioningStep:(id)a3 finishedWithStatus:(BOOL)a4 error:(id)a5
{
  _BOOL4 v5;
  objc_class *v8;
  id v9;
  id v10;
  __CFString **v11;
  id v12;

  v5 = a4;
  v8 = (objc_class *)MEMORY[0x1E0C99E08];
  v9 = a5;
  v10 = a3;
  v12 = objc_alloc_init(v8);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("provisioningStatus"), CFSTR("eventType"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("provisioningStep"));

  v11 = PKAnalyticsReportResultSuccess;
  if (!v5)
    v11 = PKAnalyticsReportResultFailure;
  objc_msgSend(v12, "setObject:forKeyedSubscript:", *v11, CFSTR("result"));
  -[PKProvisioningAnalyticsSessionReporter _populateDictionary:withError:](self, "_populateDictionary:withError:", v12, v9);

  -[PKProvisioningAnalyticsSessionReporter reportEvent:](self, "reportEvent:", v12);
}

- (void)setProvisionedPass:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKProvisioningAnalyticsSessionReporter responder](self, "responder");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPass:", v4);

}

@end
