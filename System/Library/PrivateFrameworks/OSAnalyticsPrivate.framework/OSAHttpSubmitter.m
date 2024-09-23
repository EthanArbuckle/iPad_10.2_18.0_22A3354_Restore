@implementation OSAHttpSubmitter

- (OSAHttpSubmitter)initWithEndpoint:(int)a3
{
  OSAHttpSubmitter *v4;
  void *v5;
  int v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  NSURL *submissionURL;
  dispatch_semaphore_t v11;
  OS_dispatch_semaphore *submissionSem;
  objc_super v14;
  uint8_t buf[4];
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)OSAHttpSubmitter;
  v4 = -[OSASubmitter init](&v14, sel_init);
  if (v4)
  {
    if (a3 == 1
      && (objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "appleInternal"),
          v5,
          v6))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = CFSTR("https://iphonesubmissions-uat.corp.apple.com/convert.jsp");
        _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Using debug/UAT submission URL: '%@'", buf, 0xCu);
      }
      v7 = (void *)MEMORY[0x1E0C99E98];
      v8 = CFSTR("https://iphonesubmissions-uat.corp.apple.com/convert.jsp");
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0C99E98];
      v8 = CFSTR("https://iphonesubmissions.apple.com/convert.jsp");
    }
    objc_msgSend(v7, "URLWithString:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    submissionURL = v4->_submissionURL;
    v4->_submissionURL = (NSURL *)v9;

    v11 = dispatch_semaphore_create(0);
    submissionSem = v4->_submissionSem;
    v4->_submissionSem = (OS_dispatch_semaphore *)v11;

  }
  return v4;
}

- (id)submissionURL
{
  return self->_submissionURL;
}

- (void)postContent:(id)a3 withHeaders:(id)a4
{
  id v6;
  NSHTTPURLResponse *response;
  NSMutableData *v8;
  NSMutableData *payload;
  NSError *responseError;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  NSHTTPURLResponse *v19;
  NSDictionary *v20;
  NSDictionary *responseHeaders;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v6 = a4;
  response = self->_response;
  self->_response = 0;

  v8 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
  payload = self->_payload;
  self->_payload = v8;

  self->_thoughput_warnings = 0;
  self->_last_thoughput_check = 0.0;
  responseError = self->super._responseError;
  self->super._responseError = 0;

  objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:cachePolicy:timeoutInterval:", self->_submissionURL, 1, 60.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNetworkServiceType:", 5);
  objc_msgSend(v11, "setHTTPShouldHandleCookies:", 0);
  objc_msgSend(v11, "setHTTPMethod:", CFSTR("POST"));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setValue:forHTTPHeaderField:", v18, v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v14);
  }

  objc_msgSend(v11, "setHTTPBody:", v22);
  -[OSAHttpSubmitter performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_startConnection_, v11, 1);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_submissionSem, 0xFFFFFFFFFFFFFFFFLL);
  objc_storeStrong((id *)&self->super._responseData, self->_payload);
  v19 = self->_response;
  if (v19)
  {
    self->super._responseCode = -[NSHTTPURLResponse statusCode](v19, "statusCode");
    -[NSHTTPURLResponse allHeaderFields](self->_response, "allHeaderFields");
    v20 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    responseHeaders = self->super._responseHeaders;
    self->super._responseHeaders = v20;

  }
}

- (void)abort
{
  -[OSAHttpSubmitter performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_cleanupConnectionAndDisable_, MEMORY[0x1E0C9AAB0], 1);
}

- (void)startConnection:(id)a3
{
  objc_class *v4;
  id v5;
  NSURLConnection *v6;
  NSURLConnection *connection;

  v4 = (objc_class *)MEMORY[0x1E0CB39A0];
  v5 = a3;
  v6 = (NSURLConnection *)objc_msgSend([v4 alloc], "_initWithRequest:delegate:usesCache:maxContentLength:startImmediately:connectionProperties:", v5, self, 0, 0, 0, 0);

  connection = self->_connection;
  self->_connection = v6;

  -[NSURLConnection start](self->_connection, "start");
}

- (void)cleanupConnectionAndDisable:(id)a3
{
  NSURLConnection *connection;
  NSURLConnection *v5;

  connection = self->_connection;
  if (connection)
  {
    -[NSURLConnection cancel](connection, "cancel", a3);
    v5 = self->_connection;
    self->_connection = 0;

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_submissionSem);
  }
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  objc_storeStrong((id *)&self->_response, a4);
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  -[NSMutableData appendData:](self->_payload, "appendData:", a4);
}

- (void)connectionDidFinishLoading:(id)a3
{
  -[OSAHttpSubmitter cleanupConnectionAndDisable:](self, "cleanupConnectionAndDisable:", 0);
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  id v5;
  NSError *v6;
  NSError *responseError;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (NSError *)objc_msgSend(v5, "copy");
  responseError = self->super._responseError;
  self->super._responseError = v6;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Connection failed: %@", (uint8_t *)&v9, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[OSAHttpSubmitter cleanupConnectionAndDisable:](self, "cleanupConnectionAndDisable:", v8);

}

- (void)connection:(id)a3 didSendBodyData:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6
{
  int v7;
  double v10;
  double v11;
  double last_thoughput_check;
  double v13;
  double v14;
  unsigned int v15;
  void *v16;
  void *v17;
  NSError *v18;
  NSError *responseError;
  double v20;
  unsigned int thoughput_warnings;
  uint64_t v22;
  const __CFString *v23;
  uint8_t buf[4];
  double v25;
  __int16 v26;
  double v27;
  __int16 v28;
  unsigned int v29;
  uint64_t v30;

  v7 = a5;
  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate", a3);
  v11 = v10;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[OSAHttpSubmitter connection:didSendBodyData:totalBytesWritten:totalBytesExpectedToWrite:].cold.1(a4, v7, a6);
  last_thoughput_check = self->_last_thoughput_check;
  if (last_thoughput_check != 0.0)
  {
    v13 = v11 - last_thoughput_check;
    v14 = (double)a4 * 0.0009765625 / (pow((double)a6 * 0.0009765625, 0.4) * 0.5);
    v15 = v13 <= v14 ? 0 : self->_thoughput_warnings + 1;
    self->_thoughput_warnings = v15;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v20 = v11 - self->_last_thoughput_check;
      thoughput_warnings = self->_thoughput_warnings;
      *(_DWORD *)buf = 134218496;
      v25 = v20;
      v26 = 2048;
      v27 = v14;
      v28 = 1024;
      v29 = thoughput_warnings;
      _os_log_debug_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "  deltat: %.5f, threshold: %.1f (warnings %d)", buf, 0x1Cu);
    }
  }
  self->_last_thoughput_check = v11;
  if (self->_thoughput_warnings >= 2)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2D50];
    v23 = CFSTR("Throughput threshold violation");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("OSAHttpSubmitter"), 1, v17);
    v18 = (NSError *)objc_claimAutoreleasedReturnValue();
    responseError = self->super._responseError;
    self->super._responseError = v18;

    -[OSAHttpSubmitter abort](self, "abort");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submissionSem, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_submissionURL, 0);
}

- (void)connection:(int)a3 didSendBodyData:totalBytesWritten:totalBytesExpectedToWrite:.cold.1(int a1, int a2, int a3)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109632;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  v6 = 1024;
  v7 = a3;
  _os_log_debug_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "didSendBodyData %d (total %d of %d)", (uint8_t *)v3, 0x14u);
}

@end
