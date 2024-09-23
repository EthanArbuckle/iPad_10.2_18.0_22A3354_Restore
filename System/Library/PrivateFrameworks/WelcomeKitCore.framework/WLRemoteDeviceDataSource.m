@implementation WLRemoteDeviceDataSource

- (WLRemoteDeviceDataSource)initWithHost:(id)a3 port:(unsigned __int16)a4 session:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  WLRemoteDeviceDataSource *v10;
  WLRemoteDeviceDataSource *v11;
  NSOperationQueue *v12;
  NSOperationQueue *queue;
  NSOperationQueue *v14;
  void *v15;
  objc_super v17;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)WLRemoteDeviceDataSource;
  v10 = -[WLRemoteDeviceDataSource init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    -[WLRemoteDeviceDataSource setPort:](v10, "setPort:", v6);
    -[WLRemoteDeviceDataSource setHost:](v11, "setHost:", v8);
    -[WLRemoteDeviceDataSource setSession:](v11, "setSession:", v9);
    v12 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    queue = v11->_queue;
    v11->_queue = v12;

    v14 = v11->_queue;
    +[WLRemoteDeviceDataSource _requestSerialQueue](WLRemoteDeviceDataSource, "_requestSerialQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setUnderlyingQueue:](v14, "setUnderlyingQueue:", v15);

    -[NSOperationQueue setMaxConcurrentOperationCount:](v11->_queue, "setMaxConcurrentOperationCount:", 1);
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[WLRemoteDeviceDataSource cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)WLRemoteDeviceDataSource;
  -[WLRemoteDeviceDataSource dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  -[NSOperationQueue setSuspended:](self->_queue, "setSuspended:", 1);
  -[NSOperationQueue cancelAllOperations](self->_queue, "cancelAllOperations");
  -[NSOperationQueue waitUntilAllOperationsAreFinished](self->_queue, "waitUntilAllOperationsAreFinished");
}

- (void)accountsDataForMigrator:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v6 = a4;
  -[WLRemoteDeviceDataSource _urlForAccountsWithMigrator:](self, "_urlForAccountsWithMigrator:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD1840];
  -[WLRemoteDeviceDataSource _urlRequestTimeout](self, "_urlRequestTimeout");
  objc_msgSend(v8, "requestWithURL:cachePolicy:timeoutInterval:", v7, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLRemoteDeviceDataSource _maximumRetriableTaskDurationForLongServerOperations](self, "_maximumRetriableTaskDurationForLongServerOperations");
  v11 = v10;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __63__WLRemoteDeviceDataSource_accountsDataForMigrator_completion___block_invoke;
  v13[3] = &unk_24E3760A8;
  v13[4] = self;
  v14 = v6;
  v12 = v6;
  -[WLRemoteDeviceDataSource _performRequest:expectedContentLength:numberOfRetriesAllowed:preventRetriesAfterTaskExceedsDuration:taskDurationLimit:startDate:completionHandler:](self, "_performRequest:expectedContentLength:numberOfRetriesAllowed:preventRetriesAfterTaskExceedsDuration:taskDurationLimit:startDate:completionHandler:", v9, 0, 6, 1, 0, v13, v11);

}

void __63__WLRemoteDeviceDataSource_accountsDataForMigrator_completion___block_invoke(uint64_t a1, void *a2, double a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v8 = a2;
  v9 = a5;
  if (v8)
  {
    v19 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v8, 0, &v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v19;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v10;
      v13 = *(_QWORD *)(a1 + 40);
      if (v13)
        (*(void (**)(uint64_t, id, uint64_t, _QWORD, double))(v13 + 16))(v13, v12, objc_msgSend(v8, "length"), 0, a3);

    }
    else
    {
      v15 = *(_QWORD *)(a1 + 32);
      v17 = objc_msgSend(v8, "length");
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v8, 4);
      _WLLog();

      v16 = *(_QWORD *)(a1 + 40);
      if (v16)
        (*(void (**)(uint64_t, _QWORD, uint64_t, id, double))(v16 + 16))(v16, 0, objc_msgSend(v8, "length", v15, v17, v18), v11, a3);
    }

  }
  else
  {
    _WLLog();
    v14 = *(_QWORD *)(a1 + 40);
    if (v14)
      (*(void (**)(uint64_t, _QWORD, _QWORD, id, double))(v14 + 16))(v14, 0, 0, v9, a3);
  }

}

- (id)_urlForAccountsWithMigrator:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSString *host;
  uint64_t port;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a3;
  -[WLRemoteDeviceDataSource _urlScheme](self, "_urlScheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  host = self->_host;
  port = self->_port;
  objc_msgSend(v5, "contentType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@://%@:%u/remote_data_access/v1/%@/accounts"), v6, host, port, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)summariesDataForAccount:(id)a3 migrator:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLRemoteDeviceDataSource _urlForRecordSummariesForMigrator:withAccountIdentifier:](self, "_urlForRecordSummariesForMigrator:withAccountIdentifier:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDD1840];
  -[WLRemoteDeviceDataSource _urlRequestTimeout](self, "_urlRequestTimeout");
  objc_msgSend(v12, "requestWithURL:cachePolicy:timeoutInterval:", v11, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLRemoteDeviceDataSource _maximumRetriableTaskDurationForLongServerOperations](self, "_maximumRetriableTaskDurationForLongServerOperations");
  v15 = v14;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __72__WLRemoteDeviceDataSource_summariesDataForAccount_migrator_completion___block_invoke;
  v17[3] = &unk_24E3760A8;
  v17[4] = self;
  v18 = v8;
  v16 = v8;
  -[WLRemoteDeviceDataSource _performRequest:expectedContentLength:numberOfRetriesAllowed:preventRetriesAfterTaskExceedsDuration:taskDurationLimit:startDate:completionHandler:](self, "_performRequest:expectedContentLength:numberOfRetriesAllowed:preventRetriesAfterTaskExceedsDuration:taskDurationLimit:startDate:completionHandler:", v13, 0, 6, 1, 0, v17, v15);

}

void __72__WLRemoteDeviceDataSource_summariesDataForAccount_migrator_completion___block_invoke(uint64_t a1, void *a2, double a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v8 = a2;
  v9 = a5;
  if (v8)
  {
    v19 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v8, 0, &v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v19;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v12 = v10;
      v13 = *(_QWORD *)(a1 + 40);
      if (v13)
        (*(void (**)(uint64_t, id, uint64_t, _QWORD, double))(v13 + 16))(v13, v12, objc_msgSend(v8, "length"), 0, a3);

    }
    else
    {
      v14 = *(_QWORD *)(a1 + 32);
      v17 = objc_msgSend(v8, "length");
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v8, 4);
      _WLLog();

      v15 = *(_QWORD *)(a1 + 40);
      if (v15)
        (*(void (**)(uint64_t, _QWORD, uint64_t, id, double))(v15 + 16))(v15, 0, objc_msgSend(v8, "length", v14, v17, v18), v11, a3);
    }

  }
  else
  {
    _WLLog();
    v16 = *(_QWORD *)(a1 + 40);
    if (v16)
      (*(void (**)(uint64_t, _QWORD, _QWORD, id, double))(v16 + 16))(v16, 0, 0, v9, a3);
  }

}

- (id)_urlForRecordSummariesForMigrator:(id)a3 withAccountIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *host;
  uint64_t port;
  void *v14;
  void *v15;
  void *v16;
  NSString *v17;
  uint64_t v18;
  void *v19;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v7, "accountBased"))
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "URLPathAllowedCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x24BDD17C8];
    -[WLRemoteDeviceDataSource _urlScheme](self, "_urlScheme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    host = self->_host;
    port = self->_port;
    objc_msgSend(v7, "contentType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@://%@:%u/remote_data_access/v1/%@/accounts/%@"), v11, host, port, v14, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    -[WLRemoteDeviceDataSource _urlScheme](self, "_urlScheme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = self->_host;
    v18 = self->_port;
    objc_msgSend(v7, "contentType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@://%@:%u/remote_data_access/v1/%@"), v9, v17, v18, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)itemSizeForSummary:(id)a3 migrator:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[2];

  v8 = a5;
  v20[0] = 0;
  v20[1] = 0;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLRemoteDeviceDataSource _urlForRecordForMigrator:withSummaryIdentifier:accountIdentifier:segmentByteRange:](self, "_urlForRecordForMigrator:withSummaryIdentifier:accountIdentifier:segmentByteRange:", v9, v11, v13, v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BDD1840];
  -[WLRemoteDeviceDataSource _urlRequestTimeout](self, "_urlRequestTimeout");
  objc_msgSend(v15, "requestWithURL:cachePolicy:timeoutInterval:", v14, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __67__WLRemoteDeviceDataSource_itemSizeForSummary_migrator_completion___block_invoke;
  v18[3] = &unk_24E3760D0;
  v18[4] = self;
  v19 = v8;
  v17 = v8;
  -[WLRemoteDeviceDataSource _performRequest:expectedContentLength:numberOfRetriesAllowed:preventRetriesAfterTaskExceedsDuration:taskDurationLimit:startDate:completionHandler:](self, "_performRequest:expectedContentLength:numberOfRetriesAllowed:preventRetriesAfterTaskExceedsDuration:taskDurationLimit:startDate:completionHandler:", v16, 0, 6, 0, 0, v18, 0.0);

}

void __67__WLRemoteDeviceDataSource_itemSizeForSummary_migrator_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = v8;
LABEL_3:
    _WLLog();
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "valueForHTTPHeaderField:", CFSTR("file-length"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v12 = *(_QWORD *)(a1 + 32);
  _WLLog();
  if (objc_msgSend(v11, "length", v12, v11))
  {
    v10 = objc_msgSend(v11, "integerValue");

    v9 = 0;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC2878], 5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    goto LABEL_3;
LABEL_4:
  v10 = 0;
LABEL_10:
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v10);

}

- (void)fileForSummary:(id)a3 migrator:(id)a4 fileAccessor:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  _QWORD v22[5];
  id v23;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "account");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLRemoteDeviceDataSource _urlForRecordForMigrator:withSummaryIdentifier:accountIdentifier:segmentByteRange:](self, "_urlForRecordForMigrator:withSummaryIdentifier:accountIdentifier:segmentByteRange:", v12, v14, v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x24BDD1840];
  -[WLRemoteDeviceDataSource _urlRequestTimeout](self, "_urlRequestTimeout");
  objc_msgSend(v18, "requestWithURL:cachePolicy:timeoutInterval:", v17, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v13, "itemSize");

  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __76__WLRemoteDeviceDataSource_fileForSummary_migrator_fileAccessor_completion___block_invoke;
  v22[3] = &unk_24E3760F8;
  v22[4] = self;
  v23 = v10;
  v21 = v10;
  -[WLRemoteDeviceDataSource _performDownloadRequest:expectedContentLength:numberOfRetriesAllowed:startDate:fileAccessor:completion:](self, "_performDownloadRequest:expectedContentLength:numberOfRetriesAllowed:startDate:fileAccessor:completion:", v19, v20, 6, 0, v11, v22);

}

void __76__WLRemoteDeviceDataSource_fileForSummary_migrator_fileAccessor_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  _WLLog();
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3);

}

- (id)_urlForRecordForMigrator:(id)a3 withSummaryIdentifier:(id)a4 accountIdentifier:(id)a5 segmentByteRange:(_NSRange *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSString *host;
  uint64_t port;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSString *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v36;

  v10 = a3;
  v11 = a5;
  v12 = (void *)MEMORY[0x24BDD14A8];
  v13 = a4;
  objc_msgSend(v12, "URLPathAllowedCharacterSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAddingPercentEncodingWithAllowedCharacters:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "accountBased"))
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "URLPathAllowedCharacterSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v11;
    objc_msgSend(v11, "stringByAddingPercentEncodingWithAllowedCharacters:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x24BDD17C8];
    -[WLRemoteDeviceDataSource _urlScheme](self, "_urlScheme");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    host = self->_host;
    port = self->_port;
    objc_msgSend(v10, "contentType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%@://%@:%u/remote_data_access/v1/%@/accounts/%@/%@"), v19, host, port, v22, v17, v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a6)
    {
      v11 = v36;
      goto LABEL_8;
    }
    v24 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6->location);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6->length);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("%@?start=%@&length=%@"), v23, v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)v27;
    v11 = v36;
LABEL_6:

LABEL_8:
    v26 = v23;
    goto LABEL_9;
  }
  v28 = (void *)MEMORY[0x24BDD17C8];
  -[WLRemoteDeviceDataSource _urlScheme](self, "_urlScheme");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = self->_host;
  v31 = self->_port;
  objc_msgSend(v10, "contentType");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringWithFormat:", CFSTR("%@://%@:%u/remote_data_access/v1/%@/%@"), v29, v30, v31, v32, v15);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (a6)
  {
    v33 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6->location);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6->length);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringWithFormat:", CFSTR("%@?start=%@&length=%@"), v26, v17, v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
LABEL_9:
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v26);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

- (void)_performDownloadRequest:(id)a3 expectedContentLength:(unint64_t)a4 numberOfRetriesAllowed:(unint64_t)a5 startDate:(id)a6 fileAccessor:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31[3];
  id location;

  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v14, "URL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "absoluteString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  objc_initWeak(&location, self);
  v19 = (void *)MEMORY[0x24BDD1478];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __131__WLRemoteDeviceDataSource__performDownloadRequest_expectedContentLength_numberOfRetriesAllowed_startDate_fileAccessor_completion___block_invoke;
  v26[3] = &unk_24E376120;
  objc_copyWeak(v31, &location);
  v20 = v17;
  v29 = v20;
  v21 = v14;
  v27 = v21;
  v31[1] = (id)a4;
  v31[2] = (id)a5;
  v22 = v15;
  v28 = v22;
  v23 = v16;
  v30 = v23;
  objc_msgSend(v19, "blockOperationWithBlock:", v26, self, v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSOperationQueue addOperation:](self->_queue, "addOperation:", v24);

  objc_destroyWeak(v31);
  objc_destroyWeak(&location);

}

void __131__WLRemoteDeviceDataSource__performDownloadRequest_expectedContentLength_numberOfRetriesAllowed_startDate_fileAccessor_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_downloadTaskWithRequest:expectedContentLength:numberOfRetriesAllowed:startDate:fileAccessor:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  }
  else if (*(_QWORD *)(a1 + 48))
  {
    v4 = (void *)MEMORY[0x24BDD1540];
    v5 = *MEMORY[0x24BEC2878];
    v8 = *MEMORY[0x24BDD0FC8];
    v9[0] = CFSTR("WLRemoteDeviceDataSource was deallocated.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)_downloadTaskWithRequest:(id)a3 expectedContentLength:(unint64_t)a4 numberOfRetriesAllowed:(unint64_t)a5 startDate:(id)a6 fileAccessor:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSURLSession *session;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, void *, void *);
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32[3];
  id location;

  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  objc_initWeak(&location, self);
  session = self->_session;
  v24 = MEMORY[0x24BDAC760];
  v25 = 3221225472;
  v26 = __132__WLRemoteDeviceDataSource__downloadTaskWithRequest_expectedContentLength_numberOfRetriesAllowed_startDate_fileAccessor_completion___block_invoke;
  v27 = &unk_24E3761C0;
  objc_copyWeak(v32, &location);
  v19 = v17;
  v30 = v19;
  v20 = v14;
  v28 = v20;
  v32[1] = (id)a4;
  v32[2] = (id)a5;
  v21 = v15;
  v29 = v21;
  v22 = v16;
  v31 = v22;
  -[NSURLSession downloadTaskWithRequest:completionHandler:](session, "downloadTaskWithRequest:completionHandler:", v20, &v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "resume", v24, v25, v26, v27);

  objc_destroyWeak(v32);
  objc_destroyWeak(&location);

}

void __132__WLRemoteDeviceDataSource__downloadTaskWithRequest_expectedContentLength_numberOfRetriesAllowed_startDate_fileAccessor_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  int v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  dispatch_time_t v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  __int128 v49;
  _QWORD block[4];
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "absoluteString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    _WLLog();

    v12 = *(_QWORD *)(a1 + 72);
    v53 = v9;
    v13 = objc_msgSend(WeakRetained, "_shouldHandleHTTPErrorWithResponse:expectedContentLength:error:", v8, v12, &v53, WeakRetained, v28, v9);
    v14 = v53;

    if (v13)
    {
      dispatch_get_global_queue(25, 0);
      v15 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __132__WLRemoteDeviceDataSource__downloadTaskWithRequest_expectedContentLength_numberOfRetriesAllowed_startDate_fileAccessor_completion___block_invoke_2;
      block[3] = &unk_24E376148;
      v52 = *(id *)(a1 + 48);
      v9 = v14;
      v51 = v9;
      dispatch_async(v15, block);

      v16 = v52;
    }
    else if (objc_msgSend(WeakRetained, "_shouldRetryLaterWithResponse:error:", v8, v14))
    {
      objc_msgSend(*(id *)(a1 + 32), "URL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "absoluteString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      _WLLog();

      v21 = dispatch_time(0, 1000000000 * objc_msgSend(WeakRetained, "_retryLaterDelayInSeconds", WeakRetained, v29));
      dispatch_get_global_queue(25, 0);
      v22 = objc_claimAutoreleasedReturnValue();
      v43[0] = MEMORY[0x24BDAC760];
      v43[1] = 3221225472;
      v43[2] = __132__WLRemoteDeviceDataSource__downloadTaskWithRequest_expectedContentLength_numberOfRetriesAllowed_startDate_fileAccessor_completion___block_invoke_3;
      v43[3] = &unk_24E376170;
      v44 = WeakRetained;
      v45 = *(id *)(a1 + 32);
      v49 = *(_OWORD *)(a1 + 72);
      v46 = *(id *)(a1 + 40);
      v47 = *(id *)(a1 + 56);
      v48 = *(id *)(a1 + 48);
      dispatch_after(v21, v22, v43);

      v16 = v44;
      v9 = v14;
    }
    else if (!v7 || v14)
    {
      dispatch_get_global_queue(25, 0);
      v25 = objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __132__WLRemoteDeviceDataSource__downloadTaskWithRequest_expectedContentLength_numberOfRetriesAllowed_startDate_fileAccessor_completion___block_invoke_5;
      v30[3] = &unk_24E376198;
      v38 = *(_QWORD *)(a1 + 80);
      v31 = WeakRetained;
      v32 = v8;
      v9 = v14;
      v33 = v9;
      v34 = *(id *)(a1 + 32);
      v26 = *(id *)(a1 + 40);
      v27 = *(_QWORD *)(a1 + 72);
      v35 = v26;
      v39 = v27;
      v36 = *(id *)(a1 + 56);
      v37 = *(id *)(a1 + 48);
      dispatch_async(v25, v30);

      v16 = v31;
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_get_global_queue(25, 0);
      v24 = objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x24BDAC760];
      v40[1] = 3221225472;
      v40[2] = __132__WLRemoteDeviceDataSource__downloadTaskWithRequest_expectedContentLength_numberOfRetriesAllowed_startDate_fileAccessor_completion___block_invoke_4;
      v40[3] = &unk_24E376148;
      v42 = *(id *)(a1 + 48);
      v9 = v23;
      v41 = v9;
      dispatch_async(v24, v40);

      v16 = v42;
    }
    goto LABEL_12;
  }
  if (*(_QWORD *)(a1 + 48))
  {
    v17 = (void *)MEMORY[0x24BDD1540];
    v18 = *MEMORY[0x24BEC2878];
    v54 = *MEMORY[0x24BDD0FC8];
    v55[0] = CFSTR("WLRemoteDeviceDataSource was deallocated.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 1, v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_12:

  }
}

uint64_t __132__WLRemoteDeviceDataSource__downloadTaskWithRequest_expectedContentLength_numberOfRetriesAllowed_startDate_fileAccessor_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __132__WLRemoteDeviceDataSource__downloadTaskWithRequest_expectedContentLength_numberOfRetriesAllowed_startDate_fileAccessor_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performDownloadRequest:expectedContentLength:numberOfRetriesAllowed:startDate:fileAccessor:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __132__WLRemoteDeviceDataSource__downloadTaskWithRequest_expectedContentLength_numberOfRetriesAllowed_startDate_fileAccessor_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __132__WLRemoteDeviceDataSource__downloadTaskWithRequest_expectedContentLength_numberOfRetriesAllowed_startDate_fileAccessor_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v5;
  uint64_t v6;

  if (!*(_QWORD *)(a1 + 88)
    || !objc_msgSend(*(id *)(a1 + 32), "_shouldRetryWithData:response:error:", 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)))
  {
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 56), "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 48);
  _WLLog();

  return objc_msgSend(*(id *)(a1 + 32), "_performDownloadRequest:expectedContentLength:numberOfRetriesAllowed:startDate:fileAccessor:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 96), objc_msgSend(*(id *)(a1 + 32), "_newNumberOfRetriesAllowed:startDate:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 64), v2, v5, v6), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
}

- (void)dataSegmentForSummary:(id)a3 byteRange:(_NSRange)a4 migrator:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSUInteger length;
  id v19;
  _QWORD v20[5];
  id v21;
  _NSRange v22;

  v22 = a4;
  v9 = a6;
  v10 = a5;
  v11 = a3;
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLRemoteDeviceDataSource _urlForRecordForMigrator:withSummaryIdentifier:accountIdentifier:segmentByteRange:](self, "_urlForRecordForMigrator:withSummaryIdentifier:accountIdentifier:segmentByteRange:", v10, v12, v14, &v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x24BDD1840];
  -[WLRemoteDeviceDataSource _urlRequestTimeout](self, "_urlRequestTimeout");
  objc_msgSend(v16, "requestWithURL:cachePolicy:timeoutInterval:", v15, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  length = v22.length;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __80__WLRemoteDeviceDataSource_dataSegmentForSummary_byteRange_migrator_completion___block_invoke;
  v20[3] = &unk_24E3760D0;
  v20[4] = self;
  v21 = v9;
  v19 = v9;
  -[WLRemoteDeviceDataSource _performRequest:expectedContentLength:numberOfRetriesAllowed:preventRetriesAfterTaskExceedsDuration:taskDurationLimit:startDate:completionHandler:](self, "_performRequest:expectedContentLength:numberOfRetriesAllowed:preventRetriesAfterTaskExceedsDuration:taskDurationLimit:startDate:completionHandler:", v17, length, 6, 0, 0, v20, 0.0);

}

void __80__WLRemoteDeviceDataSource_dataSegmentForSummary_byteRange_migrator_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v9 = a2;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  if (v6)
  {
    _WLLog();

    v7 = 0;
  }
  else
  {
    v7 = v9;
  }
  v10 = v7;
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v7);

}

- (void)dataForSummary:(id)a3 migrator:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLRemoteDeviceDataSource _urlForRecordForMigrator:withSummaryIdentifier:accountIdentifier:segmentByteRange:](self, "_urlForRecordForMigrator:withSummaryIdentifier:accountIdentifier:segmentByteRange:", v9, v11, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BDD1840];
  -[WLRemoteDeviceDataSource _urlRequestTimeout](self, "_urlRequestTimeout");
  objc_msgSend(v15, "requestWithURL:cachePolicy:timeoutInterval:", v14, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __63__WLRemoteDeviceDataSource_dataForSummary_migrator_completion___block_invoke;
  v18[3] = &unk_24E3760D0;
  v18[4] = self;
  v19 = v8;
  v17 = v8;
  -[WLRemoteDeviceDataSource _performRequest:expectedContentLength:numberOfRetriesAllowed:preventRetriesAfterTaskExceedsDuration:taskDurationLimit:startDate:completionHandler:](self, "_performRequest:expectedContentLength:numberOfRetriesAllowed:preventRetriesAfterTaskExceedsDuration:taskDurationLimit:startDate:completionHandler:", v16, 0, 6, 0, 0, v18, 0.0);

}

void __63__WLRemoteDeviceDataSource_dataForSummary_migrator_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v9 = a2;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  if (v6)
  {
    _WLLog();

    v7 = 0;
  }
  else
  {
    v7 = v9;
  }
  v10 = v7;
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v7);

}

- (void)updateUIWithProgress:(double)a3 remainingTime:(double)a4 logString:(id)a5 completion:(id)a6
{
  uint64_t v6;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;

  v10 = a6;
  if (a3 >= 1.0)
  {
    v13 = (void *)MEMORY[0x24BDD17C8];
    -[WLRemoteDeviceDataSource _urlScheme](self, "_urlScheme");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@://%@:%u/transfer?status=done"), v12, self->_host, self->_port, v18, v19);
  }
  else
  {
    LODWORD(v6) = vcvtmd_s64_f64(a3 * 100.0);
    v11 = (void *)MEMORY[0x24BDD17C8];
    -[WLRemoteDeviceDataSource _urlScheme](self, "_urlScheme");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@://%@:%u/transfer?status=active&progress=%d&remaining_time=%ld"), v12, self->_host, self->_port, v6, (uint64_t)a4);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16B0], "requestWithURL:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHTTPMethod:", CFSTR("PUT"));
  objc_msgSend(v16, "setTimeoutInterval:", 2.0);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __84__WLRemoteDeviceDataSource_updateUIWithProgress_remainingTime_logString_completion___block_invoke;
  v20[3] = &unk_24E3761E8;
  v21 = v10;
  v17 = v10;
  -[WLRemoteDeviceDataSource _performRequest:expectedContentLength:numberOfRetriesAllowed:preventRetriesAfterTaskExceedsDuration:taskDurationLimit:startDate:completionHandler:](self, "_performRequest:expectedContentLength:numberOfRetriesAllowed:preventRetriesAfterTaskExceedsDuration:taskDurationLimit:startDate:completionHandler:", v16, 0, 0, 0, 0, v20, 0.0);

}

uint64_t __84__WLRemoteDeviceDataSource_updateUIWithProgress_remainingTime_logString_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a4);
  return result;
}

- (id)_urlScheme
{
  if (_urlScheme_onceToken != -1)
    dispatch_once(&_urlScheme_onceToken, &__block_literal_global_6);
  return (id)_urlScheme_scheme;
}

void __38__WLRemoteDeviceDataSource__urlScheme__block_invoke()
{
  const __CFString *v0;
  void *v1;

  if (objc_msgSend(MEMORY[0x24BEC2810], "isInternal")
    && objc_msgSend(MEMORY[0x24BEC2830], "BOOLForKey:", CFSTR("UseHTTP")) == 1)
  {
    v0 = CFSTR("http");
  }
  else
  {
    v0 = CFSTR("https");
  }
  v1 = (void *)_urlScheme_scheme;
  _urlScheme_scheme = (uint64_t)v0;

}

- (double)_urlRequestTimeout
{
  return 60.0;
}

- (double)_maximumRetriableTaskDurationForLongServerOperations
{
  return 60.0;
}

+ (id)_requestSerialQueue
{
  if (_requestSerialQueue_onceToken != -1)
    dispatch_once(&_requestSerialQueue_onceToken, &__block_literal_global_80);
  return (id)_requestSerialQueue__requestQueue;
}

void __47__WLRemoteDeviceDataSource__requestSerialQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.welcomekitcore.WLMigrationDataCoordinator.requestSerialQueue", v2);
  v1 = (void *)_requestSerialQueue__requestQueue;
  _requestSerialQueue__requestQueue = (uint64_t)v0;

}

- (void)_performRequest:(id)a3 expectedContentLength:(unint64_t)a4 numberOfRetriesAllowed:(unint64_t)a5 preventRetriesAfterTaskExceedsDuration:(BOOL)a6 taskDurationLimit:(double)a7 startDate:(id)a8 completionHandler:(id)a9
{
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28[4];
  BOOL v29;
  id location;

  v16 = a3;
  v17 = a8;
  v18 = a9;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_initWeak(&location, self);
  v19 = (void *)MEMORY[0x24BDD1478];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __174__WLRemoteDeviceDataSource__performRequest_expectedContentLength_numberOfRetriesAllowed_preventRetriesAfterTaskExceedsDuration_taskDurationLimit_startDate_completionHandler___block_invoke;
  v24[3] = &unk_24E376250;
  objc_copyWeak(v28, &location);
  v20 = v18;
  v27 = v20;
  v21 = v17;
  v25 = v21;
  v22 = v16;
  v26 = v22;
  v28[1] = (id)a4;
  v28[2] = (id)a5;
  v29 = a6;
  v28[3] = *(id *)&a7;
  objc_msgSend(v19, "blockOperationWithBlock:", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSOperationQueue addOperation:](self->_queue, "addOperation:", v23);

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);

}

void __174__WLRemoteDeviceDataSource__performRequest_expectedContentLength_numberOfRetriesAllowed_preventRetriesAfterTaskExceedsDuration_taskDurationLimit_startDate_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_runTaskWithRequest:expectedContentLength:numberOfRetriesAllowed:preventRetriesAfterTaskExceedsDuration:taskDurationLimit:startDate:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(unsigned __int8 *)(a1 + 88), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(double *)(a1 + 80));
  }
  else if (*(_QWORD *)(a1 + 48))
  {
    v4 = (void *)MEMORY[0x24BDD1540];
    v5 = *MEMORY[0x24BEC2878];
    v10 = *MEMORY[0x24BDD0FC8];
    v11[0] = CFSTR("WLRemoteDeviceDataSource was deallocated.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v8 + 16))(v8, 0, 0, v7);

  }
}

- (void)_runTaskWithRequest:(id)a3 expectedContentLength:(unint64_t)a4 numberOfRetriesAllowed:(unint64_t)a5 preventRetriesAfterTaskExceedsDuration:(BOOL)a6 taskDurationLimit:(double)a7 startDate:(id)a8 completionHandler:(id)a9
{
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  NSURLSession *session;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  WLRemoteDeviceDataSource *v32;
  id v33;
  id v34[4];
  BOOL v35;
  id location[2];

  v16 = a3;
  v17 = a8;
  v18 = a9;
  objc_initWeak(location, self);
  objc_msgSend(v16, "URL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "absoluteString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  objc_msgSend(MEMORY[0x24BDBCE60], "date", self, v27);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  session = self->_session;
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __178__WLRemoteDeviceDataSource__runTaskWithRequest_expectedContentLength_numberOfRetriesAllowed_preventRetriesAfterTaskExceedsDuration_taskDurationLimit_startDate_completionHandler___block_invoke;
  v28[3] = &unk_24E3762C8;
  objc_copyWeak(v34, location);
  v22 = v18;
  v33 = v22;
  v23 = v17;
  v29 = v23;
  v24 = v20;
  v30 = v24;
  v25 = v16;
  v31 = v25;
  v32 = self;
  v34[1] = (id)a4;
  v34[2] = (id)a5;
  v35 = a6;
  v34[3] = *(id *)&a7;
  -[NSURLSession dataTaskWithRequest:completionHandler:](session, "dataTaskWithRequest:completionHandler:", v25, v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "resume");

  objc_destroyWeak(v34);
  objc_destroyWeak(location);

}

void __178__WLRemoteDeviceDataSource__runTaskWithRequest_expectedContentLength_numberOfRetriesAllowed_preventRetriesAfterTaskExceedsDuration_taskDurationLimit_startDate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _QWORD block[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_taskDurationSinceStartDate:", *(_QWORD *)(a1 + 40));
    v13 = v12;
    objc_msgSend(*(id *)(a1 + 48), "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "absoluteString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    _WLLog();

    dispatch_get_global_queue(25, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __178__WLRemoteDeviceDataSource__runTaskWithRequest_expectedContentLength_numberOfRetriesAllowed_preventRetriesAfterTaskExceedsDuration_taskDurationLimit_startDate_completionHandler___block_invoke_2;
    block[3] = &unk_24E3762A0;
    v28 = v11;
    v16 = v8;
    v17 = *(_QWORD *)(a1 + 80);
    v29 = v16;
    v36 = v17;
    v35 = *(id *)(a1 + 64);
    v30 = v7;
    v37 = v13;
    v31 = v9;
    v18 = *(id *)(a1 + 48);
    v19 = *(_QWORD *)(a1 + 56);
    v32 = v18;
    v33 = v19;
    v38 = *(_QWORD *)(a1 + 88);
    v40 = *(_BYTE *)(a1 + 104);
    v39 = *(_QWORD *)(a1 + 96);
    v34 = *(id *)(a1 + 32);
    dispatch_async(v15, block);

    v20 = v28;
LABEL_5:

    goto LABEL_6;
  }
  if (*(_QWORD *)(a1 + 64))
  {
    v21 = (void *)MEMORY[0x24BDD1540];
    v22 = *MEMORY[0x24BEC2878];
    v41 = *MEMORY[0x24BDD0FC8];
    v42[0] = CFSTR("WLRemoteDeviceDataSource was deallocated.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 1, v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    (*(void (**)(uint64_t, id, id, void *))(v24 + 16))(v24, v7, v8, v20);

    goto LABEL_5;
  }
LABEL_6:

}

void __178__WLRemoteDeviceDataSource__runTaskWithRequest_expectedContentLength_numberOfRetriesAllowed_preventRetriesAfterTaskExceedsDuration_taskDurationLimit_startDate_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  id v6;
  __n128 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  dispatch_time_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int8x16_t v20;
  _QWORD block[4];
  int8x16_t v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  id v29;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 96);
  v29 = 0;
  v5 = objc_msgSend(v2, "_shouldHandleHTTPErrorWithResponse:expectedContentLength:error:", v3, v4, &v29);
  v6 = v29;
  if (v5)
  {
    v8 = *(_QWORD *)(a1 + 88);
    if (v8)
      goto LABEL_11;
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "_shouldRetryLaterWithResponse:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56)))
  {
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 64), "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "absoluteString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _WLLog();

    v11 = dispatch_time(0, 1000000000 * objc_msgSend(*(id *)(a1 + 32), "_retryLaterDelayInSeconds", v9, v17));
    dispatch_get_global_queue(25, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __178__WLRemoteDeviceDataSource__runTaskWithRequest_expectedContentLength_numberOfRetriesAllowed_preventRetriesAfterTaskExceedsDuration_taskDurationLimit_startDate_completionHandler___block_invoke_3;
    block[3] = &unk_24E376278;
    v20 = *(int8x16_t *)(a1 + 64);
    v13 = (id)v20.i64[0];
    v22 = vextq_s8(v20, v20, 8uLL);
    v14 = *(_QWORD *)(a1 + 112);
    v25 = *(_QWORD *)(a1 + 96);
    v26 = v14;
    v28 = *(_BYTE *)(a1 + 128);
    v27 = *(_QWORD *)(a1 + 120);
    v23 = *(id *)(a1 + 80);
    v24 = *(id *)(a1 + 88);
    dispatch_after(v11, v12, block);

  }
  else if (*(_QWORD *)(a1 + 112)
         && objc_msgSend(*(id *)(a1 + 32), "_shouldRetryWithData:response:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56))&& objc_msgSend(*(id *)(a1 + 32), "_shouldRetryWithPreventRetriesAfterTaskExceedsDuration:taskDurationLimit:taskDuration:", *(unsigned __int8 *)(a1 + 128), *(double *)(a1 + 120), *(double *)(a1 + 104)))
  {
    v15 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 64), "URL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "absoluteString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1 + 56);
    _WLLog();

    objc_msgSend(*(id *)(a1 + 32), "_willRetryPerformRequest", v15, v18, v19);
    objc_msgSend(*(id *)(a1 + 32), "_performRequest:expectedContentLength:numberOfRetriesAllowed:preventRetriesAfterTaskExceedsDuration:taskDurationLimit:startDate:completionHandler:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 96), objc_msgSend(*(id *)(a1 + 32), "_newNumberOfRetriesAllowed:startDate:", *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 80)), *(unsigned __int8 *)(a1 + 128), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(double *)(a1 + 120));
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 88);
    if (v8)
    {
LABEL_11:
      v7.n128_u64[0] = *(_QWORD *)(a1 + 104);
      (*(void (**)(__n128))(v8 + 16))(v7);
    }
  }

}

uint64_t __178__WLRemoteDeviceDataSource__runTaskWithRequest_expectedContentLength_numberOfRetriesAllowed_preventRetriesAfterTaskExceedsDuration_taskDurationLimit_startDate_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performRequest:expectedContentLength:numberOfRetriesAllowed:preventRetriesAfterTaskExceedsDuration:taskDurationLimit:startDate:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(unsigned __int8 *)(a1 + 88), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(double *)(a1 + 80));
}

- (double)_taskDurationSinceStartDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;

  v3 = (void *)MEMORY[0x24BDBCE60];
  v4 = a3;
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v4);
  v7 = v6;

  return v7;
}

- (BOOL)_shouldRetryLaterWithResponse:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;

  v5 = a3;
  if (a4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v8 = 0;
  }
  else
  {
    v6 = v5;
    if (objc_msgSend(v6, "statusCode") == 200)
    {
      objc_msgSend(v6, "valueForHTTPHeaderField:", CFSTR("Retry-After"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7 != 0;

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (int64_t)_retryLaterDelayInSeconds
{
  return 3;
}

- (BOOL)_shouldRetryWithData:(id)a3 response:(id)a4 error:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  BOOL v9;
  void *v11;

  v6 = a4;
  if (a5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v9 = 1;
  }
  else
  {
    v7 = v6;
    v8 = objc_msgSend(v7, "statusCode");
    v9 = v8 != 200;
    if (v8 != 200)
    {
      objc_msgSend(v7, "URL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "statusCode");
      _WLLog();

    }
  }

  return v9;
}

- (BOOL)_shouldRetryWithPreventRetriesAfterTaskExceedsDuration:(BOOL)a3 taskDurationLimit:(double)a4 taskDuration:(double)a5
{
  return a5 <= a4 || !a3;
}

- (unint64_t)_newNumberOfRetriesAllowed:(unint64_t)a3 startDate:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v11;

  v5 = (void *)MEMORY[0x24BDBCE60];
  v6 = a4;
  objc_msgSend(v5, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v6);
  v9 = v8;

  if (v9 <= 5.0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _WLLog();

  }
  else
  {
    --a3;
  }
  return a3;
}

- (BOOL)_shouldHandleHTTPErrorWithResponse:(id)a3 expectedContentLength:(unint64_t)a4 error:(id *)a5
{
  id v5;

  v5 = a3;
  objc_opt_class();
  objc_opt_isKindOfClass();

  return 0;
}

- (unsigned)port
{
  return self->_port;
}

- (void)setPort:(unsigned __int16)a3
{
  self->_port = a3;
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
