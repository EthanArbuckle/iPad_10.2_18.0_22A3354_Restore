@implementation RCURLFetchOperation

void __52__RCURLFetchOperation_operationWillFinishWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void (**v6)(id, uint64_t, uint64_t, void *, void *, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "configurationDictionaryCompletionHandler");
  v6 = (void (**)(id, uint64_t, uint64_t, void *, void *, _QWORD))objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "maxAge");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "httpResponse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v3, v2, v4, v5, *(_QWORD *)(a1 + 56));

}

void __39__RCURLFetchOperation_performOperation__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  RCSharedLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "shortOperationDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v37 = v11;
    _os_log_impl(&dword_1A1FB5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ finished", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "_reportNetworkEventsForTask:response:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v8, v9);
  v12 = objc_opt_class();
  RCDynamicCast(v12, (uint64_t)v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13
    && (objc_msgSend(v13, "statusCode") < 200 || objc_msgSend(v14, "statusCode") >= 300)
    && objc_msgSend(v14, "statusCode") != 304)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "urlString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("RCErrorHTTPURL"));

    objc_msgSend(v15, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("RCErrorHTTPRequestUUID"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v14, "statusCode"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("RCErrorHTTPStatusCode"));

    objc_msgSend(v14, "allHeaderFields");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v14, "allHeaderFields");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("RCErrorHTTPResponseHeaders"));

    }
    if (objc_msgSend(v14, "statusCode") >= 500 && objc_msgSend(v14, "statusCode") <= 598)
    {
      objc_msgSend(v14, "allHeaderFields");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("Retry-After"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v22 = objc_msgSend(v21, "integerValue");
        if (v22)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v22);
          v23 = objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            v24 = (void *)v23;
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, CFSTR("RCErrorRetryAfter"));
            objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("NSErrorRCAdditionsShouldRetry"));

          }
        }
      }

    }
    v25 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("URL request failed with status code %lu"), objc_msgSend(v14, "statusCode"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "rc_errorWithCode:description:additionalUserInfo:", 3, v26, v15);
    v27 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v27;
  }
  objc_msgSend(v14, "allHeaderFields");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("Cache-Control"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "rc_numberFollowingString:", CFSTR("max-age="));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30 || (objc_msgSend(v30, "doubleValue"), v31 == 0.0))
  {
    RCSharedLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "shortOperationDescription");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "urlString");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v33;
      v38 = 2112;
      v39 = v34;
      _os_log_impl(&dword_1A1FB5000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ max-age missing from Cache-Control header for URL: %@", buf, 0x16u);

    }
    v30 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "setMaxAge:", v30);
  if (!v9)
    objc_msgSend(*(id *)(a1 + 32), "setResponseData:", v7);
  objc_msgSend(*(id *)(a1 + 32), "setHttpResponse:", v14);
  objc_msgSend(*(id *)(a1 + 32), "setResponseSize:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "countOfBytesReceived"));
  objc_msgSend(v8, "MIMEType");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setResponseMIMEType:", v35);

  objc_msgSend(*(id *)(a1 + 32), "setError:", v9);
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v9);

}

- (void)setResponseSize:(unint64_t)a3
{
  self->_responseSize = a3;
}

- (void)setResponseMIMEType:(id)a3
{
  objc_storeStrong((id *)&self->_responseMIMEType, a3);
}

- (void)setResponseData:(id)a3
{
  objc_storeStrong((id *)&self->_responseData, a3);
}

- (void)setMaxAge:(id)a3
{
  objc_storeStrong((id *)&self->_maxAge, a3);
}

- (void)setHttpResponse:(id)a3
{
  objc_storeStrong((id *)&self->_httpResponse, a3);
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSData)responseData
{
  return self->_responseData;
}

- (void)performOperation
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  int64_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  _QWORD v66[5];
  id v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  const __CFString *v84;
  __int16 v85;
  uint64_t v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CB37A8]);
  -[RCURLFetchOperation URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithURL:", v4);

  -[RCURLFetchOperation HTTPMethod](self, "HTTPMethod");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = CFSTR("GET");
  objc_msgSend(v5, "setHTTPMethod:", v8);

  -[RCURLFetchOperation HTTPBody](self, "HTTPBody");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHTTPBody:", v9);

  -[RCURLFetchOperation URL](self, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCURLFetchOperation setUrlString:](self, "setUrlString:", v11);

  -[RCURLFetchOperation backgroundFetchConfiguration](self, "backgroundFetchConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "taskIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "addValue:forHTTPHeaderField:", v15, CFSTR("X-Request-ID"));
  -[RCURLFetchOperation setRequestUUID:](self, "setRequestUUID:", v15);
  RCSharedLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    -[RCOperation shortOperationDescription](self, "shortOperationDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCURLFetchOperation urlString](self, "urlString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCURLFetchOperation requestUUID](self, "requestUUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v76 = v18;
    v77 = 2112;
    v78 = v19;
    v79 = 2112;
    v80 = v20;
    _os_log_impl(&dword_1A1FB5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ will perform operation to fetch config from URL: %@ with X-Request-ID: %@", buf, 0x20u);

  }
  -[RCURLFetchOperation URLRequestTimeoutDuration](self, "URLRequestTimeoutDuration");
  if (v21 > 0.0)
  {
    -[RCURLFetchOperation URLRequestTimeoutDuration](self, "URLRequestTimeoutDuration");
    if (v22 != 1.79769313e308)
    {
      -[RCURLFetchOperation URLRequestTimeoutDuration](self, "URLRequestTimeoutDuration");
      objc_msgSend(v5, "setTimeoutInterval:");
      RCSharedLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        -[RCOperation shortOperationDescription](self, "shortOperationDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[RCURLFetchOperation URLRequestTimeoutDuration](self, "URLRequestTimeoutDuration");
        *(_DWORD *)buf = 138543618;
        v76 = v24;
        v77 = 2048;
        v78 = v25;
        _os_log_impl(&dword_1A1FB5000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ applying URLRequestTimeoutDuration: %.1f", buf, 0x16u);

      }
    }
  }
  objc_msgSend(v5, "setCachePolicy:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCURLFetchOperation additionalRequestHTTPHeaders](self, "additionalRequestHTTPHeaders");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26 == 0;

  if (!v27)
  {
    -[RCURLFetchOperation additionalRequestHTTPHeaders](self, "additionalRequestHTTPHeaders");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "addEntriesFromDictionary:", v28);

  }
  objc_msgSend(v5, "setAllHTTPHeaderFields:", v64);
  v69 = 0;
  v70 = &v69;
  v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__4;
  v73 = __Block_byref_object_dispose__4;
  v74 = 0;
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = __39__RCURLFetchOperation_performOperation__block_invoke;
  v66[3] = &unk_1E470EE10;
  v68 = &v69;
  v66[4] = self;
  v62 = v15;
  v67 = v62;
  v63 = (void *)MEMORY[0x1A85815B4](v66);
  -[RCURLFetchOperation backgroundFetchConfiguration](self, "backgroundFetchConfiguration");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[RCURLFetchOperation backgroundFetchConfiguration](self, "backgroundFetchConfiguration");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = 0;
    +[RCURLSession backgroundSessionForFetchConfig:delegateReference:](RCURLSession, "backgroundSessionForFetchConfig:delegateReference:", v30, &v65);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v65;
    objc_msgSend(v31, "downloadTaskWithRequest:", v5);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)v70[5];
    v70[5] = v33;

    -[RCURLFetchOperation requestUUID](self, "requestUUID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v70[5], "setTaskDescription:", v35);

    objc_msgSend(v30, "earliestBeginDate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v70[5], "setEarliestBeginDate:", v36);

    -[RCURLFetchOperation requestUUID](self, "requestUUID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "observeCompletionOfTaskWithIdentifier:completion:", v37, v63);

  }
  else
  {
    +[RCURLSession sharedForegroundSession](RCURLSession, "sharedForegroundSession");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "dataTaskWithRequest:completionHandler:", v5, v63);
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = (void *)v70[5];
    v70[5] = v39;

    -[RCURLFetchOperation requestUUID](self, "requestUUID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v70[5], "setTaskDescription:", v30);
  }

  -[RCURLFetchOperation setRequestTask:](self, "setRequestTask:", v70[5]);
  v41 = -[RCOperation relativePriority](self, "relativePriority");
  objc_msgSend((id)v70[5], "setRelativePriority:", v41);
  -[RCOperation associateChildOperation:](self, "associateChildOperation:", v70[5]);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  -[RCURLFetchOperation setTaskStartTime:](self, "setTaskStartTime:");
  if (v29)
  {
    RCSharedLog();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      -[RCOperation shortOperationDescription](self, "shortOperationDescription");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[RCURLFetchOperation loggingKey](self, "loggingKey");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[RCURLFetchOperation requestUUID](self, "requestUUID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[RCURLFetchOperation urlString](self, "urlString");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[RCURLFetchOperation backgroundFetchConfiguration](self, "backgroundFetchConfiguration");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "earliestBeginDate");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "rc_stringForLogging");
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = (void *)v47;
      if (v47)
        v49 = (const __CFString *)v47;
      else
        v49 = CFSTR("<nil>");
      -[RCURLFetchOperation backgroundFetchConfiguration](self, "backgroundFetchConfiguration");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "timeout");
      *(_DWORD *)buf = 138544642;
      v76 = v61;
      v77 = 2112;
      v78 = v60;
      v79 = 2112;
      v80 = v43;
      v81 = 2112;
      v82 = v44;
      v83 = 2114;
      v84 = v49;
      v85 = 2048;
      v86 = v51;
      _os_log_impl(&dword_1A1FB5000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ will send background request for configuration: %@ with UUID: %@, URL: %@, earliestBeginDate: %{public}@, timeout: %.2f.", buf, 0x3Eu);

    }
  }
  else
  {
    RCSharedLog();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      -[RCOperation shortOperationDescription](self, "shortOperationDescription");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[RCURLFetchOperation loggingKey](self, "loggingKey");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[RCURLFetchOperation requestUUID](self, "requestUUID");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[RCURLFetchOperation urlString](self, "urlString");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v76 = v52;
      v77 = 2112;
      v78 = v53;
      v79 = 2112;
      v80 = v54;
      v81 = 2112;
      v82 = v55;
      _os_log_impl(&dword_1A1FB5000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ will send foreground request for configuration: %@ with UUID: %@, URL: %@", buf, 0x2Au);

    }
  }

  RCSharedLog();
  v56 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)v70[5], "longOperationDescription");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v76 = v57;
    _os_log_impl(&dword_1A1FB5000, v56, OS_LOG_TYPE_DEFAULT, "%{public}@ started", buf, 0xCu);

  }
  -[RCURLFetchOperation networkActivity](self, "networkActivity");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    objc_msgSend((id)v70[5], "setDelegate:", self);
    -[RCURLFetchOperation networkActivity](self, "networkActivity");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "attachActivityToTask:", v70[5]);

  }
  objc_msgSend((id)v70[5], "resume");

  _Block_object_dispose(&v69, 8);
}

- (double)URLRequestTimeoutDuration
{
  return self->_URLRequestTimeoutDuration;
}

- (NSString)requestUUID
{
  return self->_requestUUID;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (NSURL)URL
{
  return self->_URL;
}

- (RCBackgroundFetchConfiguration)backgroundFetchConfiguration
{
  return self->_backgroundFetchConfiguration;
}

- (NSDictionary)additionalRequestHTTPHeaders
{
  return self->_additionalRequestHTTPHeaders;
}

- (void)setRequestTask:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (NSString)loggingKey
{
  return self->_loggingKey;
}

- (BOOL)validateOperation
{
  void *v2;

  -[RCURLFetchOperation URL](self, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCURLFetchOperation validateOperation].cold.1();
  return v2 != 0;
}

- (void)setUrlString:(id)a3
{
  objc_storeStrong((id *)&self->_urlString, a3);
}

- (void)setTaskStartTime:(double)a3
{
  self->_taskStartTime = a3;
}

- (void)setRequestUUID:(id)a3
{
  objc_storeStrong((id *)&self->_requestUUID, a3);
}

- (void)setRelativePriority:(int64_t)a3
{
  void *v5;
  objc_super v6;

  -[RCURLFetchOperation requestTask](self, "requestTask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRelativePriority:", a3);

  v6.receiver = self;
  v6.super_class = (Class)RCURLFetchOperation;
  -[RCOperation setRelativePriority:](&v6, sel_setRelativePriority_, a3);
}

- (NSURLSessionTask)requestTask
{
  return (NSURLSessionTask *)objc_getProperty(self, a2, 432, 1);
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  NSObject *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  _QWORD block[5];
  id v38;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  double v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[RCURLFetchOperation setRequestTask:](self, "setRequestTask:", 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v6 = v5;
  -[RCURLFetchOperation taskStartTime](self, "taskStartTime");
  if (v4)
  {
    if (objc_msgSend(v4, "rc_isCancellationError"))
    {
      RCSharedLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_14;
      -[RCOperation shortOperationDescription](self, "shortOperationDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[RCURLFetchOperation loggingKey](self, "loggingKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v9;
      v46 = 2112;
      v47 = v10;
      _os_log_impl(&dword_1A1FB5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelled configuration request %@", buf, 0x16u);
    }
    else
    {
      objc_msgSend(v4, "userInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("RCErrorHTTPStatusCode"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      RCSharedLog();
      v8 = objc_claimAutoreleasedReturnValue();
      v17 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      if (v16)
      {
        if (!v17)
          goto LABEL_14;
        -[RCOperation shortOperationDescription](self, "shortOperationDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[RCURLFetchOperation loggingKey](self, "loggingKey");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "userInfo");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("RCErrorHTTPStatusCode"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v45 = v9;
        v46 = 2114;
        v47 = v18;
        v48 = 2114;
        v49 = v20;
        _os_log_impl(&dword_1A1FB5000, v8, OS_LOG_TYPE_ERROR, "%{public}@ failed to request configuration %{public}@ with response status code: %{public}@", buf, 0x20u);

        goto LABEL_13;
      }
      if (!v17)
        goto LABEL_14;
      -[RCOperation shortOperationDescription](self, "shortOperationDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[RCURLFetchOperation loggingKey](self, "loggingKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v45 = v9;
      v46 = 2114;
      v47 = v10;
      v48 = 2114;
      v49 = v21;
      _os_log_impl(&dword_1A1FB5000, v8, OS_LOG_TYPE_ERROR, "%{public}@ failed to request configuration %{public}@ with error: %{public}@", buf, 0x20u);

    }
LABEL_13:

    goto LABEL_14;
  }
  v11 = v7;
  RCSharedLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[RCOperation shortOperationDescription](self, "shortOperationDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCURLFetchOperation loggingKey](self, "loggingKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", -[RCURLFetchOperation responseSize](self, "responseSize"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v45 = v12;
    v46 = 2112;
    v47 = v13;
    v48 = 2112;
    v49 = v14;
    v50 = 2048;
    v51 = v6 - v11;
    _os_log_impl(&dword_1A1FB5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully received configuration %@ with size: %@, total time: %f", buf, 0x2Au);

  }
LABEL_14:

  -[RCURLFetchOperation completionQueue](self, "completionQueue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    v24 = v22;
  }
  else
  {
    RCDispatchQueueForQualityOfService(-[RCURLFetchOperation qualityOfService](self, "qualityOfService"));
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v25 = v24;

  -[RCURLFetchOperation configurationDictionaryCompletionHandler](self, "configurationDictionaryCompletionHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[RCURLFetchOperation responseData](self, "responseData");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "rc_gzipInflate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = v28;
    }
    else
    {
      -[RCURLFetchOperation responseData](self, "responseData");
      v29 = (id)objc_claimAutoreleasedReturnValue();
    }
    v31 = v29;
    v43 = 0;
    objc_msgSend(MEMORY[0x1E0C99D80], "rc_dictionaryFromData:error:", v29, &v43);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v43;
    -[RCURLFetchOperation setResponseData:](self, "setResponseData:", 0);
    if (v33)
    {
      RCSharedLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        -[RCOperation shortOperationDescription](self, "shortOperationDescription");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = v35;
        v46 = 2114;
        v47 = v33;
        _os_log_impl(&dword_1A1FB5000, v34, OS_LOG_TYPE_ERROR, "%{public}@ operationWillFinishWithError - JSON parsing failed with error: %{public}@", buf, 0x16u);

      }
    }
    -[RCURLFetchOperation configurationDictionaryCompletionHandler](self, "configurationDictionaryCompletionHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __52__RCURLFetchOperation_operationWillFinishWithError___block_invoke;
      v39[3] = &unk_1E470EE38;
      v39[4] = self;
      v40 = v32;
      v41 = v33;
      v42 = v4;
      dispatch_async(v25, v39);

    }
  }
  else
  {
    -[RCURLFetchOperation configurationCompletionHandler](self, "configurationCompletionHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __52__RCURLFetchOperation_operationWillFinishWithError___block_invoke_2;
      block[3] = &unk_1E470DE50;
      block[4] = self;
      v38 = v4;
      dispatch_async(v25, block);

    }
  }

}

- (id)configurationCompletionHandler
{
  return self->_configurationCompletionHandler;
}

- (double)taskStartTime
{
  return self->_taskStartTime;
}

- (unint64_t)responseSize
{
  return self->_responseSize;
}

- (NSNumber)maxAge
{
  return self->_maxAge;
}

- (NSHTTPURLResponse)httpResponse
{
  return self->_httpResponse;
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)_reportNetworkEventsForTask:(id)a3 response:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  RCURLFetchOperation *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void (**v25)(_QWORD, _QWORD);
  RCNetworkEvent *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  RCNetworkEvent *v31;
  id v32;
  id v33;
  void *v34;
  RCURLFetchOperation *v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[7];
  _QWORD v42[7];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __66__RCURLFetchOperation__reportNetworkEventsForTask_response_error___block_invoke;
    v42[3] = &unk_1E470EC50;
    v42[4] = self;
    v42[5] = v8;
    v42[6] = v10;
    __66__RCURLFetchOperation__reportNetworkEventsForTask_response_error___block_invoke((uint64_t)v42);
  }
  else
  {
    v35 = self;
    v12 = objc_opt_class();
    RCDynamicCast(v12, (uint64_t)v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = objc_opt_class();
      RCDynamicCast(v14, (uint64_t)v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "statusCode") >= 200 && objc_msgSend(v15, "statusCode") < 300
        || objc_msgSend(v15, "statusCode") == 304)
      {
        v34 = v15;
        v32 = v9;
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        objc_msgSend(v8, "_incompleteTaskMetrics");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "transactionMetrics");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        obj = v17;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
        v19 = v35;
        if (v18)
        {
          v20 = v18;
          v21 = *(_QWORD *)v38;
          v33 = v8;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v38 != v21)
                objc_enumerationMutation(obj);
              v23 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
              if (objc_msgSend(v23, "resourceFetchType") != 3)
              {
                -[RCURLFetchOperation networkEventHandler](v19, "networkEventHandler");
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                if (v24)
                {
                  -[RCURLFetchOperation networkEventHandler](v19, "networkEventHandler");
                  v25 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                  v26 = [RCNetworkEvent alloc];
                  objc_msgSend(v8, "originalRequest");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "fetchStartDate");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  -[RCOperation operationID](v19, "operationID");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  -[RCURLFetchOperation requestUUID](v19, "requestUUID");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = -[RCNetworkEvent initWithResultType:request:startDate:operationID:requestID:response:metrics:error:](v26, "initWithResultType:request:startDate:operationID:requestID:response:metrics:error:", 0, v27, v28, v29, v30, v34, v23, 0);
                  ((void (**)(_QWORD, RCNetworkEvent *))v25)[2](v25, v31);

                  v19 = v35;
                  v8 = v33;

                }
              }
            }
            v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
          }
          while (v20);
        }

        v11 = 0;
        v9 = v32;
        v15 = v34;
      }
      else
      {
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __66__RCURLFetchOperation__reportNetworkEventsForTask_response_error___block_invoke_3;
        v41[3] = &unk_1E470EC50;
        v41[4] = v35;
        v41[5] = v8;
        v41[6] = v15;
        __66__RCURLFetchOperation__reportNetworkEventsForTask_response_error___block_invoke_3((uint64_t)v41);
      }

    }
  }

}

- (id)networkEventHandler
{
  return self->_networkEventHandler;
}

- (NSString)HTTPMethod
{
  return self->_HTTPMethod;
}

- (NSData)HTTPBody
{
  return self->_HTTPBody;
}

- (void)setURLRequestTimeoutDuration:(double)a3
{
  self->_URLRequestTimeoutDuration = a3;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (void)setNetworkEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (void)setLoggingKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (void)setHTTPMethod:(id)a3
{
  objc_storeStrong((id *)&self->_HTTPMethod, a3);
}

- (void)setHTTPBody:(id)a3
{
  objc_storeStrong((id *)&self->_HTTPBody, a3);
}

- (void)setConfigurationCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (void)setBackgroundFetchConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundFetchConfiguration, a3);
}

- (void)setAdditionalRequestHTTPHeaders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxAge, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_httpResponse, 0);
  objc_storeStrong((id *)&self->_responseMIMEType, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
  objc_storeStrong((id *)&self->_responseData, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_requestTask, 0);
  objc_storeStrong((id *)&self->_networkActivity, 0);
  objc_storeStrong(&self->_networkEventHandler, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong(&self->_configurationDictionaryCompletionHandler, 0);
  objc_storeStrong(&self->_configurationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_additionalRequestHTTPHeaders, 0);
  objc_storeStrong((id *)&self->_loggingKey, 0);
  objc_storeStrong((id *)&self->_backgroundFetchConfiguration, 0);
  objc_storeStrong((id *)&self->_HTTPMethod, 0);
  objc_storeStrong((id *)&self->_HTTPBody, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

void __52__RCURLFetchOperation_operationWillFinishWithError___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void (**v5)(id, void *, void *, void *, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "configurationCompletionHandler");
  v5 = (void (**)(id, void *, void *, void *, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "responseData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "maxAge");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "httpResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v2, v3, v4, *(_QWORD *)(a1 + 40));

}

- (void)resetForRetry
{
  -[RCURLFetchOperation setTaskStartTime:](self, "setTaskStartTime:", 0.0);
  -[RCURLFetchOperation setResponseData:](self, "setResponseData:", 0);
  -[RCURLFetchOperation setHttpResponse:](self, "setHttpResponse:", 0);
  -[RCURLFetchOperation setResponseSize:](self, "setResponseSize:", 0);
  -[RCURLFetchOperation setError:](self, "setError:", 0);
  -[RCURLFetchOperation setMaxAge:](self, "setMaxAge:", 0);
}

void __66__RCURLFetchOperation__reportNetworkEventsForTask_response_error___block_invoke(uint64_t a1)
{
  void *v2;
  RCNetworkEvent *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  RCNetworkEvent *v10;
  void (**v11)(id, void *);

  objc_msgSend(*(id *)(a1 + 32), "networkEventHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "networkEventHandler");
    v11 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
    v3 = [RCNetworkEvent alloc];
    objc_msgSend(*(id *)(a1 + 40), "originalRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_incompleteTaskMetrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "taskInterval");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "operationID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "requestUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[RCNetworkEvent initWithResultType:request:startDate:operationID:requestID:response:metrics:error:](v3, "initWithResultType:request:startDate:operationID:requestID:response:metrics:error:", 2, v4, v7, v8, v9, 0, 0, *(_QWORD *)(a1 + 48));
    v11[2](v11, v10);

  }
}

void __66__RCURLFetchOperation__reportNetworkEventsForTask_response_error___block_invoke_3(uint64_t a1)
{
  void *v2;
  RCNetworkEvent *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  RCNetworkEvent *v9;
  void (**v10)(id, void *);

  objc_msgSend(*(id *)(a1 + 32), "networkEventHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "networkEventHandler");
    v10 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
    v3 = [RCNetworkEvent alloc];
    objc_msgSend(*(id *)(a1 + 40), "originalRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_incompleteCurrentTaskTransactionMetrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fetchStartDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "operationID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "requestUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[RCNetworkEvent initWithResultType:request:startDate:operationID:requestID:response:metrics:error:](v3, "initWithResultType:request:startDate:operationID:requestID:response:metrics:error:", 1, v4, v6, v7, v8, *(_QWORD *)(a1 + 48), 0, 0);
    v10[2](v10, v9);

  }
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  int v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[RCURLFetchOperation networkActivity](self, "networkActivity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[RCURLFetchOperation networkActivity](self, "networkActivity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      objc_msgSend(v9, "completeActivityWithSuccess:", 0);

      RCSharedLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[RCURLFetchOperation networkActivity](self, "networkActivity");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 67109120;
        v15 = objc_msgSend(v12, "label");
        v13 = "Did finish network activity with success=NO (label=%d)";
LABEL_7:
        _os_log_impl(&dword_1A1FB5000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v14, 8u);

      }
    }
    else
    {
      objc_msgSend(v9, "completeActivityWithSuccess:", 1);

      RCSharedLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[RCURLFetchOperation networkActivity](self, "networkActivity");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 67109120;
        v15 = objc_msgSend(v12, "label");
        v13 = "Did finish network activity with success=YES (label=%d)";
        goto LABEL_7;
      }
    }

  }
}

- (void)URLSession:(id)a3 didCreateTask:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[RCURLFetchOperation networkActivity](self, "networkActivity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[RCURLFetchOperation networkActivity](self, "networkActivity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attachActivityToTask:", v5);

    RCSharedLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "originalRequest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "URL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_1A1FB5000, v8, OS_LOG_TYPE_DEFAULT, "Did assign network activity to task (%{public}@)", (uint8_t *)&v11, 0xCu);

    }
  }

}

- (id)configurationDictionaryCompletionHandler
{
  return self->_configurationDictionaryCompletionHandler;
}

- (void)setConfigurationDictionaryCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (void)setCompletionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_completionQueue, a3);
}

- (RCNetworkActivity)networkActivity
{
  return self->_networkActivity;
}

- (void)setNetworkActivity:(id)a3
{
  objc_storeStrong((id *)&self->_networkActivity, a3);
}

- (NSString)responseMIMEType
{
  return self->_responseMIMEType;
}

- (NSError)error
{
  return self->_error;
}

- (void)validateOperation
{
  void *v0;
  int v1;
  const char *v2;
  __int16 v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("the fetch operation must have valid URL"));
  v1 = 136315906;
  v2 = "-[RCURLFetchOperation validateOperation]";
  v3 = 2080;
  v4 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/RCURLFetchOperation.m";
  v5 = 1024;
  v6 = 70;
  v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_1A1FB5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);

}

@end
