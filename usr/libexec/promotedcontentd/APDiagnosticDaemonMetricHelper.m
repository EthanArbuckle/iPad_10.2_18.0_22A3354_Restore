@implementation APDiagnosticDaemonMetricHelper

- (APDiagnosticDaemonMetricHelper)initWithContentData:(id)a3
{
  id v5;
  APDiagnosticDaemonMetricHelper *v6;
  APDiagnosticDaemonMetricHelper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APDiagnosticDaemonMetricHelper;
  v6 = -[APDiagnosticDaemonMetricHelper init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contentData, a3);

  return v7;
}

- (void)recordMetric:(int64_t)a3 forPurpose:(int64_t)a4 properties:(id)a5 internalProperties:(id)a6 order:(int64_t)a7 options:(int64_t)a8
{
  id v13;
  id v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v23;

  v13 = a6;
  v14 = a5;
  v23 = (id)objc_claimAutoreleasedReturnValue(+[MetricsModule storage](MetricsModule, "storage"));
  v15 = +[MetricsModuleClasses metricClass](MetricsModuleClasses, "metricClass");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[APDiagnosticDaemonMetricHelper contentData](self, "contentData"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "contextIdentifier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "UUIDString"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uniqueIdentifier"));
  v21 = objc_msgSend([v15 alloc], "initWithPurpose:metric:contentIdentifier:contextIdentifier:handle:branch:properties:internalProperties:relayData:environment:order:options:", a4, a3, v17, v19, v20, 0, v14, v13, 0, 0, a7, a8);

  objc_msgSend(v23, "receivedMetric:", v21);
}

- (void)validationFailed:(int64_t)a3 reason:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[2];

  v9[0] = CFSTR("code");
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v9[1] = CFSTR("reason");
  v10[0] = v7;
  v10[1] = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));

  -[APDiagnosticDaemonMetricHelper recordMetric:forPurpose:properties:internalProperties:order:options:](self, "recordMetric:forPurpose:properties:internalProperties:order:options:", 77500, -105, v8, 0, 0, 0);
}

- (APContentData)contentData
{
  return self->_contentData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentData, 0);
}

@end
