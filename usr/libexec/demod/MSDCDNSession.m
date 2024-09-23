@implementation MSDCDNSession

- (void)authenticate:(id)a3 forTask:(id)a4 completion:(id)a5
{
  void (**v6)(id, _QWORD, void *);
  MSDSessionFileDownloadTrustEvaluate *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = (void (**)(id, _QWORD, void *))a5;
  v7 = objc_alloc_init(MSDSessionFileDownloadTrustEvaluate);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "protectionSpace"));
  v9 = -[MSDSessionFileDownloadTrustEvaluate trustServer:isRedirect:](v7, "trustServer:isRedirect:", objc_msgSend(v8, "serverTrust"), 0);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "protectionSpace"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", objc_msgSend(v10, "serverTrust")));

    v6[2](v6, 0, v11);
  }
  else
  {
    v6[2](v6, 1, 0);
  }

}

- (BOOL)getIsFileDownload
{
  return 1;
}

- (void)collectTimingDataForTask:(id)a3 withNetworkError:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "info"));
  v8 = objc_opt_class(MSDCDNSessionTaskInfo, v7);
  isKindOfClass = objc_opt_isKindOfClass(v6, v8);

  if ((isKindOfClass & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "task"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_timingData"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "info"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "serverType"));

    if (v11)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSessionMetrics sharedInstance](MSDSessionMetrics, "sharedInstance"));
      objc_msgSend(v14, "extractAndUploadTimingData:forServerType:", v11, v13);

    }
    if (v5)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalyticsEventHandler sharedInstance](MSDAnalyticsEventHandler, "sharedInstance"));
      objc_msgSend(v15, "sendNetworkFailureEvent:forServerType:", v5, v13);

    }
  }

}

- (void)collectMetricsData:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MSDSessionMetrics sharedInstance](MSDSessionMetrics, "sharedInstance"));
  objc_msgSend(v4, "saveTransactionMetric:", v3);

}

@end
