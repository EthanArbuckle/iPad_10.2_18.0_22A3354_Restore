@implementation ICURLPerformanceMetrics

- (ICURLPerformanceMetrics)initWithTransactionMetrics:(id)a3 request:(id)a4 taskIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICURLPerformanceMetrics *v11;
  ICURLPerformanceMetrics *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSString *requestUrl;
  void *v40;
  id v41;
  uint64_t v42;
  NSString *appleTimingApp;
  uint64_t v44;
  NSString *connectionType;
  uint64_t v46;
  NSString *edgeNodeCacheStatus;
  uint64_t v48;
  NSString *environmentDataCenter;
  uint64_t v50;
  NSString *jingleCorrelationKey;
  uint64_t v52;
  NSString *responseDate;
  uint64_t v54;
  const __CFData *v55;
  const __CFData *v56;
  const UInt8 *BytePtr;
  socklen_t v58;
  char *v59;
  uint64_t v60;
  NSString *resolvedIPAddress;
  uint64_t v63;
  objc_super v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v64.receiver = self;
  v64.super_class = (Class)ICURLPerformanceMetrics;
  v11 = -[ICURLPerformanceMetrics init](&v64, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_taskIdentifier, a5);
    objc_msgSend(v8, "connectStartDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSince1970");
    v12->_connectionStartTime = v14;

    objc_msgSend(v8, "connectEndDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSince1970");
    v12->_connectionEndTime = v16;

    objc_msgSend(v8, "domainLookupStartDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSince1970");
    v12->_domainLookupStartTime = v18;

    objc_msgSend(v8, "domainLookupEndDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSince1970");
    v12->_domainLookupEndTime = v20;

    objc_msgSend(v8, "fetchStartDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "timeIntervalSince1970");
    v12->_fetchStartTime = v22;

    objc_msgSend(v8, "requestStartDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "timeIntervalSince1970");
    v12->_requestStartTime = v24;

    objc_msgSend(v8, "responseStartDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "timeIntervalSince1970");
    v12->_responseStartTime = v26;

    objc_msgSend(v8, "responseEndDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "timeIntervalSince1970");
    v12->_responseEndTime = v28;

    objc_msgSend(v8, "secureConnectionStartDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "timeIntervalSince1970");
    v12->_secureConnectionStartTime = v30;

    v12->_cachedResponse = objc_msgSend(v8, "resourceFetchType") == 3;
    v12->_connectionReused = objc_msgSend(v8, "isReusedConnection");
    v12->_redirectCount = objc_msgSend(v9, "redirectCount");
    objc_msgSend(v9, "urlRequest");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "HTTPBody");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_requestMessageSize = objc_msgSend(v32, "length");

    v33 = objc_msgSend(v8, "countOfRequestHeaderBytesSent");
    v12->_requestBytesSent = objc_msgSend(v8, "countOfRequestBodyBytesSent") + v33;
    objc_msgSend(v9, "responseData");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_responseMessageSize = objc_msgSend(v34, "length");

    v35 = objc_msgSend(v8, "countOfResponseBodyBytesReceived");
    v12->_responseBytesReceived = objc_msgSend(v8, "countOfResponseHeaderBytesReceived") + v35;
    objc_msgSend(v9, "urlRequest");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "URL");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "absoluteString");
    v38 = objc_claimAutoreleasedReturnValue();
    requestUrl = v12->_requestUrl;
    v12->_requestUrl = (NSString *)v38;

    objc_msgSend(v8, "response");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = v40;
      objc_msgSend(v41, "valueForHTTPHeaderField:", CFSTR("apple-timing-app"));
      v42 = objc_claimAutoreleasedReturnValue();
      appleTimingApp = v12->_appleTimingApp;
      v12->_appleTimingApp = (NSString *)v42;

      objc_msgSend(v41, "valueForHTTPHeaderField:", CFSTR("X-Apple-Connection-Type"));
      v44 = objc_claimAutoreleasedReturnValue();
      connectionType = v12->_connectionType;
      v12->_connectionType = (NSString *)v44;

      objc_msgSend(v41, "valueForHTTPHeaderField:", CFSTR("X-Cache"));
      v46 = objc_claimAutoreleasedReturnValue();
      edgeNodeCacheStatus = v12->_edgeNodeCacheStatus;
      v12->_edgeNodeCacheStatus = (NSString *)v46;

      objc_msgSend(v41, "valueForHTTPHeaderField:", CFSTR("X-Apple-Application-Site"));
      v48 = objc_claimAutoreleasedReturnValue();
      environmentDataCenter = v12->_environmentDataCenter;
      v12->_environmentDataCenter = (NSString *)v48;

      objc_msgSend(v41, "ic_valueForHTTPHeaderField:", CFSTR("x-apple-jingle-correlation-key"));
      v50 = objc_claimAutoreleasedReturnValue();
      jingleCorrelationKey = v12->_jingleCorrelationKey;
      v12->_jingleCorrelationKey = (NSString *)v50;

      objc_msgSend(v41, "valueForHTTPHeaderField:", CFSTR("date"));
      v52 = objc_claimAutoreleasedReturnValue();
      responseDate = v12->_responseDate;
      v12->_responseDate = (NSString *)v52;

      v54 = objc_msgSend(v41, "statusCode");
      v12->_statusCode = v54;
    }
    if (objc_msgSend(v40, "_CFURLResponse"))
    {
      objc_msgSend(v40, "_CFURLResponse");
      v55 = (const __CFData *)CFURLResponseCopyPeerAddress();
      if (v55)
      {
        v56 = v55;
        BytePtr = CFDataGetBytePtr(v55);
        v58 = *BytePtr;
        v59 = (char *)&v63 - (((_WORD)v58 + 15) & 0x1F0);
        inet_ntop(BytePtr[1], BytePtr + 4, v59, v58);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v59, 1);
        v60 = objc_claimAutoreleasedReturnValue();
        resolvedIPAddress = v12->_resolvedIPAddress;
        v12->_resolvedIPAddress = (NSString *)v60;

        CFRelease(v56);
      }
    }

  }
  return v12;
}

- (double)requestStartTime
{
  return self->_requestStartTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedIPAddress, 0);
  objc_storeStrong((id *)&self->_requestUrl, 0);
  objc_storeStrong((id *)&self->_responseDate, 0);
  objc_storeStrong((id *)&self->_environmentDataCenter, 0);
  objc_storeStrong((id *)&self->_edgeNodeCacheStatus, 0);
  objc_storeStrong((id *)&self->_connectionType, 0);
  objc_storeStrong((id *)&self->_appleTimingApp, 0);
  objc_storeStrong((id *)&self->_jingleCorrelationKey, 0);
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
}

- (ICURLPerformanceMetrics)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  ICURLPerformanceMetrics *v5;
  uint64_t v6;
  NSString *taskIdentifier;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSString *requestUrl;
  uint64_t v35;
  NSString *appleTimingApp;
  uint64_t v37;
  NSString *connectionType;
  uint64_t v39;
  NSString *edgeNodeCacheStatus;
  uint64_t v41;
  NSString *environmentDataCenter;
  uint64_t v43;
  NSString *jingleCorrelationKey;
  uint64_t v45;
  NSString *responseDate;
  void *v47;
  uint64_t v48;
  NSString *resolvedIPAddress;
  objc_super v51;

  v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)ICURLPerformanceMetrics;
  v5 = -[ICURLPerformanceMetrics init](&v51, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    taskIdentifier = v5->_taskIdentifier;
    v5->_taskIdentifier = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("connectionStartTime"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v5->_connectionStartTime = v9;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("connectionEndTime"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v5->_connectionEndTime = v11;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("domainLookupStartTime"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v5->_domainLookupStartTime = v13;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("domainLookupEndTime"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v5->_domainLookupEndTime = v15;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fetchStartTime"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v5->_fetchStartTime = v17;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestStartTime"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v5->_requestStartTime = v19;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseStartTime"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    v5->_responseStartTime = v21;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseEndTime"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    v5->_responseEndTime = v23;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secureConnectionStartTime"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValue");
    v5->_secureConnectionStartTime = v25;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cachedResponse"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_cachedResponse = objc_msgSend(v26, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("connectionReused"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_connectionReused = objc_msgSend(v27, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("redirectCount"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_redirectCount = objc_msgSend(v28, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestMessageSize"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_requestMessageSize = objc_msgSend(v29, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestBytesSent"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_requestBytesSent = objc_msgSend(v30, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseMessageSize"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_responseMessageSize = objc_msgSend(v31, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseBytesReceived"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_responseBytesReceived = objc_msgSend(v32, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestUrl"));
    v33 = objc_claimAutoreleasedReturnValue();
    requestUrl = v5->_requestUrl;
    v5->_requestUrl = (NSString *)v33;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appleTimingApp"));
    v35 = objc_claimAutoreleasedReturnValue();
    appleTimingApp = v5->_appleTimingApp;
    v5->_appleTimingApp = (NSString *)v35;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("connectionType"));
    v37 = objc_claimAutoreleasedReturnValue();
    connectionType = v5->_connectionType;
    v5->_connectionType = (NSString *)v37;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("edgeNodeCacheStatus"));
    v39 = objc_claimAutoreleasedReturnValue();
    edgeNodeCacheStatus = v5->_edgeNodeCacheStatus;
    v5->_edgeNodeCacheStatus = (NSString *)v39;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("environmentDataCenter"));
    v41 = objc_claimAutoreleasedReturnValue();
    environmentDataCenter = v5->_environmentDataCenter;
    v5->_environmentDataCenter = (NSString *)v41;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("jingleCorrelationKey"));
    v43 = objc_claimAutoreleasedReturnValue();
    jingleCorrelationKey = v5->_jingleCorrelationKey;
    v5->_jingleCorrelationKey = (NSString *)v43;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseDate"));
    v45 = objc_claimAutoreleasedReturnValue();
    responseDate = v5->_responseDate;
    v5->_responseDate = (NSString *)v45;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("statusCode"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_statusCode = objc_msgSend(v47, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resolvedIPAddress"));
    v48 = objc_claimAutoreleasedReturnValue();
    resolvedIPAddress = v5->_resolvedIPAddress;
    v5->_resolvedIPAddress = (NSString *)v48;

  }
  return v5;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_taskIdentifier, CFSTR("taskIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_connectionStartTime);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("connectionStartTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_connectionEndTime);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("connectionEndTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_domainLookupStartTime);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("domainLookupStartTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_domainLookupEndTime);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("domainLookupEndTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_fetchStartTime);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("fetchStartTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_requestStartTime);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("requestStartTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_responseStartTime);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("responseStartTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_responseEndTime);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("responseEndTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_secureConnectionStartTime);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("secureConnectionStartTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_cachedResponse);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("cachedResponse"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_connectionReused);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("connectionReused"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_redirectCount);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("redirectCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_requestMessageSize);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("requestMessageSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_requestBytesSent);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("requestBytesSent"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_responseMessageSize);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("responseMessageSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_responseBytesReceived);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("responseBytesReceived"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_requestUrl, CFSTR("requestUrl"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_appleTimingApp, CFSTR("appleTimingApp"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_connectionType, CFSTR("connectionType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_edgeNodeCacheStatus, CFSTR("edgeNodeCacheStatus"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_environmentDataCenter, CFSTR("environmentDataCenter"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_jingleCorrelationKey, CFSTR("jingleCorrelationKey"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_responseDate, CFSTR("responseDate"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_statusCode);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("statusCode"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_resolvedIPAddress, CFSTR("resolvedIPAddress"));
  return v3;
}

- (id)humanDescription
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  double v6;
  const __CFString *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", self->_taskIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ICURLPerformanceMetrics statusCode](self, "statusCode");
  v5 = -[ICURLPerformanceMetrics responseMessageSize](self, "responseMessageSize") / 0x3E8;
  -[ICURLPerformanceMetrics totalTime](self, "totalTime");
  objc_msgSend(v3, "appendFormat:", CFSTR(" %ld %ldkB total:%.0fms"), v4, v5, v6 * 1000.0);
  if (-[ICURLPerformanceMetrics cachedResponse](self, "cachedResponse"))
  {
    v7 = CFSTR(" cached:YES");
LABEL_5:
    objc_msgSend(v3, "appendString:", v7);
    goto LABEL_7;
  }
  if (-[ICURLPerformanceMetrics connectionReused](self, "connectionReused"))
  {
    v7 = CFSTR(" connReused:YES");
    goto LABEL_5;
  }
  -[ICURLPerformanceMetrics connectionTime](self, "connectionTime");
  v9 = v8 * 1000.0;
  -[ICURLPerformanceMetrics dnsTime](self, "dnsTime");
  objc_msgSend(v3, "appendFormat:", CFSTR(" conn:%.0fms dns:%.0fms"), *(_QWORD *)&v9, v10 * 1000.0);
LABEL_7:
  -[ICURLPerformanceMetrics jingleCorrelationKey](self, "jingleCorrelationKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v3, "appendString:", CFSTR(" jingleCorrelationKey:"));
    -[ICURLPerformanceMetrics jingleCorrelationKey](self, "jingleCorrelationKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v12);

  }
  -[ICURLPerformanceMetrics requestUrl](self, "requestUrl");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@"), v13);

  return v3;
}

- (double)endTime
{
  double result;

  result = self->_responseEndTime;
  if (result <= 0.0)
  {
    result = self->_responseStartTime;
    if (result <= 0.0)
    {
      result = self->_requestStartTime;
      if (result <= 0.0)
      {
        result = self->_connectionEndTime;
        if (result <= 0.0)
        {
          result = self->_secureConnectionStartTime;
          if (result <= 0.0)
          {
            result = self->_connectionStartTime;
            if (result <= 0.0)
            {
              result = self->_domainLookupEndTime;
              if (result <= 0.0)
              {
                result = self->_domainLookupStartTime;
                if (result <= 0.0)
                  return self->_fetchStartTime;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

- (double)connectionTime
{
  double v3;
  double v4;
  double v5;
  double v6;
  double result;
  double v8;
  double v9;
  double v10;

  -[ICURLPerformanceMetrics connectionEndTime](self, "connectionEndTime");
  v4 = v3;
  -[ICURLPerformanceMetrics connectionStartTime](self, "connectionStartTime");
  v6 = v5;
  result = 0.0;
  if (v4 > v6)
  {
    -[ICURLPerformanceMetrics connectionEndTime](self, "connectionEndTime", 0.0);
    v9 = v8;
    -[ICURLPerformanceMetrics connectionStartTime](self, "connectionStartTime");
    return v9 - v10;
  }
  return result;
}

- (double)dnsTime
{
  double v3;
  double v4;
  double v5;
  double v6;
  double result;
  double v8;
  double v9;
  double v10;

  -[ICURLPerformanceMetrics domainLookupEndTime](self, "domainLookupEndTime");
  v4 = v3;
  -[ICURLPerformanceMetrics domainLookupStartTime](self, "domainLookupStartTime");
  v6 = v5;
  result = 0.0;
  if (v4 > v6)
  {
    -[ICURLPerformanceMetrics domainLookupEndTime](self, "domainLookupEndTime", 0.0);
    v9 = v8;
    -[ICURLPerformanceMetrics domainLookupStartTime](self, "domainLookupStartTime");
    return v9 - v10;
  }
  return result;
}

- (double)requestTime
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[ICURLPerformanceMetrics requestStartTime](self, "requestStartTime");
  v3 = 0.0;
  if (v4 > 0.0)
  {
    -[ICURLPerformanceMetrics responseStartTime](self, "responseStartTime");
    v6 = v5;
    -[ICURLPerformanceMetrics requestStartTime](self, "requestStartTime");
    if (v6 > v7)
    {
      -[ICURLPerformanceMetrics responseStartTime](self, "responseStartTime");
      v9 = v8;
      -[ICURLPerformanceMetrics requestStartTime](self, "requestStartTime");
      return v9 - v10;
    }
  }
  return v3;
}

- (double)responseTime
{
  double v3;
  double v4;
  double v5;
  double v6;
  double result;
  double v8;
  double v9;
  double v10;

  -[ICURLPerformanceMetrics responseEndTime](self, "responseEndTime");
  v4 = v3;
  -[ICURLPerformanceMetrics responseStartTime](self, "responseStartTime");
  v6 = v5;
  result = 0.0;
  if (v4 > v6)
  {
    -[ICURLPerformanceMetrics responseEndTime](self, "responseEndTime", 0.0);
    v9 = v8;
    -[ICURLPerformanceMetrics responseStartTime](self, "responseStartTime");
    return v9 - v10;
  }
  return result;
}

- (double)totalTime
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[ICURLPerformanceMetrics endTime](self, "endTime");
  v4 = v3;
  -[ICURLPerformanceMetrics fetchStartTime](self, "fetchStartTime");
  v5 = 0.0;
  if (v6 > 0.0)
  {
    -[ICURLPerformanceMetrics fetchStartTime](self, "fetchStartTime");
    if (v4 > v7)
    {
      -[ICURLPerformanceMetrics fetchStartTime](self, "fetchStartTime");
      return v4 - v8;
    }
  }
  return v5;
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (NSString)jingleCorrelationKey
{
  return self->_jingleCorrelationKey;
}

- (double)connectionStartTime
{
  return self->_connectionStartTime;
}

- (double)connectionEndTime
{
  return self->_connectionEndTime;
}

- (double)domainLookupStartTime
{
  return self->_domainLookupStartTime;
}

- (double)domainLookupEndTime
{
  return self->_domainLookupEndTime;
}

- (double)fetchStartTime
{
  return self->_fetchStartTime;
}

- (double)responseStartTime
{
  return self->_responseStartTime;
}

- (double)responseEndTime
{
  return self->_responseEndTime;
}

- (double)secureConnectionStartTime
{
  return self->_secureConnectionStartTime;
}

- (BOOL)cachedResponse
{
  return self->_cachedResponse;
}

- (BOOL)connectionReused
{
  return self->_connectionReused;
}

- (NSString)appleTimingApp
{
  return self->_appleTimingApp;
}

- (NSString)connectionType
{
  return self->_connectionType;
}

- (NSString)edgeNodeCacheStatus
{
  return self->_edgeNodeCacheStatus;
}

- (NSString)environmentDataCenter
{
  return self->_environmentDataCenter;
}

- (NSString)responseDate
{
  return self->_responseDate;
}

- (unint64_t)statusCode
{
  return self->_statusCode;
}

- (unint64_t)redirectCount
{
  return self->_redirectCount;
}

- (unint64_t)requestMessageSize
{
  return self->_requestMessageSize;
}

- (unint64_t)requestBytesSent
{
  return self->_requestBytesSent;
}

- (NSString)requestUrl
{
  return self->_requestUrl;
}

- (NSString)resolvedIPAddress
{
  return self->_resolvedIPAddress;
}

- (unint64_t)responseMessageSize
{
  return self->_responseMessageSize;
}

- (unint64_t)responseBytesReceived
{
  return self->_responseBytesReceived;
}

@end
