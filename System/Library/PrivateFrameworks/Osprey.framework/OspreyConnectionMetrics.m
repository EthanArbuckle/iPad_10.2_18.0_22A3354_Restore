@implementation OspreyConnectionMetrics

- (OspreyConnectionMetrics)initWithMetrics:(id)a3
{
  id v4;
  OspreyConnectionMetrics *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)OspreyConnectionMetrics;
  v5 = -[OspreyConnectionMetrics init](&v17, sel_init);
  if (v5)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v4, "transactionMetrics", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(v11, "_localCache") & 1) == 0)
          {
            objc_storeStrong((id *)&v5->_metrics, v11);
            v5->_connectionState = -[NSURLSessionTaskTransactionMetrics isReusedConnection](v5->_metrics, "isReusedConnection");
            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
  return v5;
}

- (double)fetchStartToDomainLookupStartTime
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  -[NSURLSessionTaskTransactionMetrics fetchStartDate](self->_metrics, "fetchStartDate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0.0;
  v4 = (void *)v3;
  -[NSURLSessionTaskTransactionMetrics domainLookupStartDate](self->_metrics, "domainLookupStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 0.0;
  -[NSURLSessionTaskTransactionMetrics domainLookupStartDate](self->_metrics, "domainLookupStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURLSessionTaskTransactionMetrics fetchStartDate](self->_metrics, "fetchStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;

  return v9;
}

- (double)dnsResolutionTime
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  -[NSURLSessionTaskTransactionMetrics domainLookupStartDate](self->_metrics, "domainLookupStartDate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0.0;
  v4 = (void *)v3;
  -[NSURLSessionTaskTransactionMetrics domainLookupEndDate](self->_metrics, "domainLookupEndDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 0.0;
  -[NSURLSessionTaskTransactionMetrics domainLookupEndDate](self->_metrics, "domainLookupEndDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURLSessionTaskTransactionMetrics domainLookupStartDate](self->_metrics, "domainLookupStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;

  return v9;
}

- (double)connectionEstablishmentTime
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  -[NSURLSessionTaskTransactionMetrics connectStartDate](self->_metrics, "connectStartDate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0.0;
  v4 = (void *)v3;
  -[NSURLSessionTaskTransactionMetrics connectEndDate](self->_metrics, "connectEndDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 0.0;
  -[NSURLSessionTaskTransactionMetrics connectEndDate](self->_metrics, "connectEndDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURLSessionTaskTransactionMetrics connectStartDate](self->_metrics, "connectStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;

  return v9;
}

- (double)tcpConnectTime
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  -[NSURLSessionTaskTransactionMetrics connectStartDate](self->_metrics, "connectStartDate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0.0;
  v4 = (void *)v3;
  -[NSURLSessionTaskTransactionMetrics secureConnectionStartDate](self->_metrics, "secureConnectionStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 0.0;
  -[NSURLSessionTaskTransactionMetrics secureConnectionStartDate](self->_metrics, "secureConnectionStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURLSessionTaskTransactionMetrics connectStartDate](self->_metrics, "connectStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;

  return v9;
}

- (double)secureConnectionTime
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  -[NSURLSessionTaskTransactionMetrics secureConnectionStartDate](self->_metrics, "secureConnectionStartDate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0.0;
  v4 = (void *)v3;
  -[NSURLSessionTaskTransactionMetrics secureConnectionEndDate](self->_metrics, "secureConnectionEndDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 0.0;
  -[NSURLSessionTaskTransactionMetrics secureConnectionEndDate](self->_metrics, "secureConnectionEndDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURLSessionTaskTransactionMetrics secureConnectionStartDate](self->_metrics, "secureConnectionStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;

  return v9;
}

- (double)fetchStartToFirstByteTime
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  -[NSURLSessionTaskTransactionMetrics fetchStartDate](self->_metrics, "fetchStartDate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0.0;
  v4 = (void *)v3;
  -[NSURLSessionTaskTransactionMetrics _firstByteReceivedDate](self->_metrics, "_firstByteReceivedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 0.0;
  -[NSURLSessionTaskTransactionMetrics _firstByteReceivedDate](self->_metrics, "_firstByteReceivedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURLSessionTaskTransactionMetrics fetchStartDate](self->_metrics, "fetchStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;

  return v9;
}

- (NSString)connectionMethod
{
  if (-[NSURLSessionTaskTransactionMetrics isCellular](self->_metrics, "isCellular"))
    return (NSString *)CFSTR("Cellular");
  else
    return (NSString *)CFSTR("Wifi");
}

- (NSURL)requestURL
{
  void *v2;
  void *v3;

  -[NSURLSessionTaskTransactionMetrics request](self->_metrics, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (unint64_t)connectionState
{
  return self->_connectionState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end
