@implementation MSDSessionTransactionData

- (MSDSessionTransactionData)initWithData:(id)a3
{
  id v4;
  MSDSessionTransactionData *v5;
  id v6;
  MSDSessionTimeIntervalDataPoint *v7;
  void *v8;
  void *v9;
  void *v10;
  MSDSessionTimeIntervalDataPoint *v11;
  void *v12;
  void *v13;
  MSDSessionTimeIntervalDataPoint *v14;
  void *v15;
  MSDSessionTimeIntervalDataPoint *v16;
  void *v17;
  void *v18;
  MSDSessionTimeIntervalDataPoint *v19;
  void *v20;
  MSDSessionTimeIntervalDataPoint *v21;
  void *v22;
  void *v23;
  MSDSessionTimeIntervalDataPoint *v24;
  void *v25;
  MSDSessionTimeIntervalDataPoint *v26;
  void *v27;
  void *v28;
  MSDSessionTimeIntervalDataPoint *v29;
  void *v30;
  MSDSessionTimeIntervalDataPoint *v31;
  void *v32;
  void *v33;
  MSDSessionTimeIntervalDataPoint *v34;
  void *v35;
  char *v36;
  char *v37;
  char *v38;
  char *v39;
  MSDSessionCountDataPoint *v40;
  MSDSessionCountDataPoint *v41;
  void *v42;
  void *v43;
  MSDSessionTimeIntervalDataPoint *v45;
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)MSDSessionTransactionData;
  v5 = -[MSDSessionTransactionData init](&v46, "init");
  if (v5)
  {
    v6 = objc_alloc_init((Class)NSMutableDictionary);
    -[MSDSessionTransactionData setData:](v5, "setData:", v6);

    v7 = [MSDSessionTimeIntervalDataPoint alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domainLookupStartDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domainLookupEndDate"));
    v45 = -[MSDSessionTimeIntervalDataPoint initWithStartTime:endTime:](v7, "initWithStartTime:endTime:", v8, v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTransactionData data](v5, "data"));
    objc_msgSend(v10, "setObject:forKey:", v45, CFSTR("DNSResolutionTime"));

    v11 = [MSDSessionTimeIntervalDataPoint alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectStartDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectEndDate"));
    v14 = -[MSDSessionTimeIntervalDataPoint initWithStartTime:endTime:](v11, "initWithStartTime:endTime:", v12, v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTransactionData data](v5, "data"));
    objc_msgSend(v15, "setObject:forKey:", v14, CFSTR("ConectionEstablishmentTime"));

    v16 = [MSDSessionTimeIntervalDataPoint alloc];
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectStartDate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "secureConnectionStartDate"));
    v19 = -[MSDSessionTimeIntervalDataPoint initWithStartTime:endTime:](v16, "initWithStartTime:endTime:", v17, v18);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTransactionData data](v5, "data"));
    objc_msgSend(v20, "setObject:forKey:", v19, CFSTR("TCPConnectionTime"));

    v21 = [MSDSessionTimeIntervalDataPoint alloc];
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "secureConnectionStartDate"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "secureConnectionEndDate"));
    v24 = -[MSDSessionTimeIntervalDataPoint initWithStartTime:endTime:](v21, "initWithStartTime:endTime:", v22, v23);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTransactionData data](v5, "data"));
    objc_msgSend(v25, "setObject:forKey:", v24, CFSTR("SecureConnectionTime"));

    v26 = [MSDSessionTimeIntervalDataPoint alloc];
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestStartDate"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestEndDate"));
    v29 = -[MSDSessionTimeIntervalDataPoint initWithStartTime:endTime:](v26, "initWithStartTime:endTime:", v27, v28);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTransactionData data](v5, "data"));
    objc_msgSend(v30, "setObject:forKey:", v29, CFSTR("RequestTime"));

    v31 = [MSDSessionTimeIntervalDataPoint alloc];
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "responseStartDate"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "responseEndDate"));
    v34 = -[MSDSessionTimeIntervalDataPoint initWithStartTime:endTime:](v31, "initWithStartTime:endTime:", v32, v33);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTransactionData data](v5, "data"));
    objc_msgSend(v35, "setObject:forKey:", v34, CFSTR("ResponseTime"));

    v36 = (char *)objc_msgSend(v4, "countOfRequestHeaderBytesSent");
    v37 = &v36[(_QWORD)objc_msgSend(v4, "countOfRequestBodyBytesSent")];
    v38 = (char *)objc_msgSend(v4, "countOfResponseHeaderBytesReceived");
    v39 = &v38[(_QWORD)objc_msgSend(v4, "countOfResponseBodyBytesReceived")];
    v40 = -[MSDSessionCountDataPoint initWithCount:]([MSDSessionCountDataPoint alloc], "initWithCount:", v37);
    v41 = -[MSDSessionCountDataPoint initWithCount:]([MSDSessionCountDataPoint alloc], "initWithCount:", v39);
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTransactionData data](v5, "data"));
    objc_msgSend(v42, "setObject:forKey:", v40, CFSTR("RequestBytesSent"));

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTransactionData data](v5, "data"));
    objc_msgSend(v43, "setObject:forKey:", v41, CFSTR("ResponseBytesReceived"));

  }
  return v5;
}

- (void)saveToFile:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];

  v21.receiver = self;
  v21.super_class = (Class)MSDSessionTransactionData;
  v16 = a3;
  -[MSDSessionMetricsData saveToFile:](&v21, "saveToFile:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("DNSResolutionTime"), CFSTR("ConectionEstablishmentTime"), CFSTR("TCPConnectionTime"), CFSTR("SecureConnectionTime"), CFSTR("RequestTime"), CFSTR("ResponseTime"), CFSTR("RequestBytesSent"), CFSTR("ResponseBytesReceived"), 0));
  v5 = objc_alloc_init((Class)NSMutableString);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTransactionData data](self, "data"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v11));

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "print"));
          objc_msgSend(v5, "appendFormat:", CFSTR("%@,"), v14);

        }
        else
        {
          objc_msgSend(v5, "appendString:", CFSTR(" ,"));
        }

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "appendString:", CFSTR("\n"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataUsingEncoding:", 4));
  objc_msgSend(v16, "writeData:", v15);

}

- (NSMutableDictionary)data
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
