@implementation TVRMSPairingServer

- (BOOL)startServerWithExpectedPasscodeHash:(id)a3 advertisedDeviceName:(id)a4 advertisedDeviceModel:(id)a5
{
  id v9;
  id v10;
  id v11;
  const __CFAllocator *v12;
  _CFHTTPServer *Service;
  OS_dispatch_queue *v14;
  OS_dispatch_queue *HTTPServerQueue;
  NSObject *v16;
  NSObject *v17;
  int port;
  uint64_t (*v20)(_QWORD);
  uint64_t (*v21)(_QWORD);
  uint8_t buf[4];
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_storeStrong((id *)&self->_expectedPasscodeHash, a3);
  objc_storeStrong((id *)&self->_advertisedDeviceName, a4);
  objc_storeStrong((id *)&self->_advertisedDeviceModel, a5);
  v20 = MEMORY[0x24BDBC2A8];
  v21 = MEMORY[0x24BDBC298];
  v12 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Service = (_CFHTTPServer *)_CFHTTPServerCreateService();
  self->_HTTPServer = Service;
  if (Service)
  {
    v14 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.TVRemoteMediaServices.DAAPPairing", MEMORY[0x24BDAC9C0]);
    HTTPServerQueue = self->_HTTPServerQueue;
    self->_HTTPServerQueue = v14;

    _CFHTTPServerSetDispatchQueue();
    v16 = _CFHTTPServerCopyProperty();
    self->_port = -[NSObject unsignedShortValue](v16, "unsignedShortValue", 1, 0x21A5458DCLL, _HTTPServerCallback_didReceiveError, _HTTPServerCallback_didOpenConnection, _HTTPServerCallback_didCloseConnection, 0, self, v20, v21, 0);
    self->_HTTPServerConnections = CFDictionaryCreateMutable(v12, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    _TVRCRMSLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      port = self->_port;
      *(_DWORD *)buf = 67109120;
      v23 = port;
      _os_log_impl(&dword_21A51B000, v17, OS_LOG_TYPE_DEFAULT, "HTTP server for pin-pairing exchange started on port %u", buf, 8u);
    }

  }
  else
  {
    _TVRCRMSLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A51B000, v16, OS_LOG_TYPE_DEFAULT, "Failed to start HTTP server for pin-pairing exchange", buf, 2u);
    }
  }

  return Service != 0;
}

- (void)stopServer
{
  NSObject *v3;
  __CFDictionary *HTTPServerConnections;
  OS_dispatch_queue *HTTPServerQueue;
  uint8_t v6[16];

  _TVRCRMSLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Stopping HTTP server", v6, 2u);
  }

  -[__CFDictionary enumerateKeysAndObjectsUsingBlock:](self->_HTTPServerConnections, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_4);
  HTTPServerConnections = self->_HTTPServerConnections;
  if (HTTPServerConnections)
  {
    CFRelease(HTTPServerConnections);
    self->_HTTPServerConnections = 0;
  }
  if (self->_HTTPServer)
  {
    _CFHTTPServerInvalidate();
    CFRelease(self->_HTTPServer);
    self->_HTTPServer = 0;
  }
  HTTPServerQueue = self->_HTTPServerQueue;
  self->_HTTPServerQueue = 0;

}

uint64_t __32__TVRMSPairingServer_stopServer__block_invoke()
{
  return _CFHTTPServerConnectionInvalidate();
}

- (void)handleHTTPServerInvalidated
{
  NSObject *v2;
  uint8_t v3[16];

  _TVRCRMSLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21A51B000, v2, OS_LOG_TYPE_DEFAULT, "HTTP server invalidated", v3, 2u);
  }

}

- (void)handleHTTPServerDidReceiveError:(__CFError *)a3
{
  NSObject *v5;
  id WeakRetained;
  int v7;
  __CFError *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _TVRCRMSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = a3;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "HTTP server error: %@", (uint8_t *)&v7, 0xCu);
  }

  -[TVRMSPairingServer stopServer](self, "stopServer");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pairingServerDidFail:", self);

}

- (void)handleHTTPServerDidOpenConnection:(_CFHTTPServerConnection *)a3
{
  NSObject *v5;
  _OWORD v6[3];
  uint64_t v7;
  TVRMSPairingServer *v8;
  uint64_t (*v9)(_QWORD);
  uint64_t (*v10)(_QWORD);
  uint64_t v11;

  _TVRCRMSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6[0]) = 0;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "HTTP server opened connection", (uint8_t *)v6, 2u);
  }

  CFDictionarySetValue(self->_HTTPServerConnections, a3, a3);
  v7 = 0;
  v8 = self;
  v9 = MEMORY[0x24BDBC2A8];
  v10 = MEMORY[0x24BDBC298];
  v11 = 0;
  v6[0] = xmmword_24DCD7A10;
  v6[1] = *(_OWORD *)&off_24DCD7A20;
  v6[2] = xmmword_24DCD7A30;
  _CFHTTPServerConnectionSetClient();
  _CFHTTPServerConnectionSetDispatchQueue();
}

- (void)handleHTTPServerDidCloseConnection:(_CFHTTPServerConnection *)a3
{
  __CFDictionary *HTTPServerConnections;

  HTTPServerConnections = self->_HTTPServerConnections;
  if (HTTPServerConnections)
    CFDictionaryRemoveValue(HTTPServerConnections, a3);
}

- (void)handleHTTPServerConnectionInvalidated
{
  NSObject *v2;
  uint8_t v3[16];

  _TVRCRMSLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21A51B000, v2, OS_LOG_TYPE_DEFAULT, "HTTP connection invalidated", v3, 2u);
  }

}

- (void)handleHTTPServerConnectionDidReceiveError:(__CFError *)a3
{
  NSObject *v4;
  int v5;
  __CFError *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _TVRCRMSLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = a3;
    _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "HTTP connection error: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (id)_parsedQueryParametersWithQueryString:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v16 = v3;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("&"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v8), "componentsSeparatedByString:", CFSTR("="));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "count") == 2)
        {
          objc_msgSend(v9, "firstObject");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "lastObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(","));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v12, "count") <= 1)
            v13 = v11;
          else
            v13 = v12;
          v14 = v13;
          objc_msgSend(v17, "setValue:forKey:", v14, v10);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  return v17;
}

- (void)handleHTTPServerConnectionDidReceiveRequest:(_CFHTTPServerRequest *)a3
{
  void *v5;
  NSObject *v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  NSString *v21;
  NSString *successfulPairingGUID;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSString *v27;
  NSObject *v28;
  NSString *expectedPasscodeHash;
  id WeakRetained;
  char v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  _CFHTTPServerRequest *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  NSString *v42;
  __int16 v43;
  NSString *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)_CFHTTPServerRequestCopyProperty();
  _TVRCRMSLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "HTTP server received pairing request", buf, 2u);
  }

  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __66__TVRMSPairingServer_handleHTTPServerConnectionDidReceiveRequest___block_invoke;
  v36[3] = &unk_24DCD7A48;
  v38 = a3;
  v7 = v5;
  v37 = v7;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x220746068](v36);
  v9 = (void *)_CFHTTPServerRequestCopyProperty();
  if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDB7698]) & 1) != 0)
  {
    if (!v7)
    {
      v8[2](v8, 400, 0);
      goto LABEL_25;
    }
    v10 = (void *)_CFHTTPServerRequestCopyProperty();
    objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("/pair")))
    {
      v13 = objc_msgSend(v7, "isEqualToString:", CFSTR("GET"));

      if ((v13 & 1) != 0)
      {
        objc_msgSend(v11, "query");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVRMSPairingServer _parsedQueryParametersWithQueryString:](self, "_parsedQueryParametersWithQueryString:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "valueForKey:", CFSTR("pairingcode"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v15;
        objc_msgSend(v15, "valueForKey:", CFSTR("servicename"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v16;
        if (objc_msgSend(v17, "length")
          && objc_msgSend(v16, "isEqualToString:", self->_expectedPasscodeHash))
        {
          v18 = time(0);
          srandom(v18);
          v19 = random();
          v20 = random() | (v19 << 32);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("0x%.16llX"), v20);
          v21 = (NSString *)objc_claimAutoreleasedReturnValue();
          successfulPairingGUID = self->_successfulPairingGUID;
          self->_successfulPairingGUID = v21;

          objc_storeStrong((id *)&self->_successfulPairingServiceName, v17);
          v23 = (void *)objc_opt_new();
          objc_msgSend(v23, "encodeInt64:forCode:", v20, 1668116583);
          objc_msgSend(v23, "encodeString:forCode:", self->_advertisedDeviceName, 1668116077);
          objc_msgSend(v23, "encodeString:forCode:", self->_advertisedDeviceModel, 1668117625);
          objc_msgSend(v23, "data");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)objc_opt_new();

          objc_msgSend(v25, "encodeData:forCode:", v24, 1668116577);
          objc_msgSend(v25, "data");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          _TVRCRMSLog();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v27 = self->_successfulPairingGUID;
            *(_DWORD *)buf = 138412546;
            v40 = v17;
            v41 = 2112;
            v42 = v27;
            _os_log_impl(&dword_21A51B000, v26, OS_LOG_TYPE_DEFAULT, "Received successful pairing request from %@; pairing GUID is %@.",
              buf,
              0x16u);
          }

          if (v33)
          {
            ((void (**)(_QWORD, uint64_t, void *))v8)[2](v8, 200, v33);

LABEL_23:
            goto LABEL_24;
          }
        }
        else
        {
          _TVRCRMSLog();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            expectedPasscodeHash = self->_expectedPasscodeHash;
            *(_DWORD *)buf = 138412802;
            v40 = v17;
            v41 = 2112;
            v42 = (NSString *)v16;
            v43 = 2112;
            v44 = expectedPasscodeHash;
            _os_log_impl(&dword_21A51B000, v28, OS_LOG_TYPE_DEFAULT, "Received unsuccessful pairing request from %@; received passcode hash %@ but expected %@.",
              buf,
              0x20u);
          }

          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          v31 = objc_opt_respondsToSelector();

          if ((v31 & 1) != 0)
          {
            v32 = objc_loadWeakRetained((id *)&self->_delegate);
            objc_msgSend(v32, "pairingServer:didFailToPairWithService:", self, v17);

          }
        }
        v8[2](v8, 404, 0);
        goto LABEL_23;
      }
    }
    else
    {

    }
    v8[2](v8, 404, 0);
LABEL_24:

    goto LABEL_25;
  }
  v8[2](v8, 505, 0);
LABEL_25:

}

void __66__TVRMSPairingServer_handleHTTPServerConnectionDidReceiveRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  __CFHTTPMessage *ResponseMessage;
  void *v6;
  const void *v7;

  v4 = a3;
  ResponseMessage = (__CFHTTPMessage *)_CFHTTPServerRequestCreateResponseMessage();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CFHTTPMessageSetHeaderFieldValue(ResponseMessage, CFSTR("Content-Length"), (CFStringRef)objc_msgSend(v6, "stringValue"));

  CFHTTPMessageSetHeaderFieldValue(ResponseMessage, CFSTR("Connection"), CFSTR("close"));
  objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("HEAD"));
  v7 = (const void *)_CFHTTPServerResponseCreateWithData();

  _CFHTTPServerResponseEnqueue();
  CFRelease(v7);
  CFRelease(ResponseMessage);
}

- (void)handleHTTPServerConnectionDidReplyToRequest:(_CFHTTPServerRequest *)a3 withResponse:(_CFHTTPServerResponse *)a4
{
  NSObject *v5;
  __CFHTTPMessage *v6;
  id WeakRetained;
  uint8_t v8[16];

  _TVRCRMSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "HTTP server did reply to request", v8, 2u);
  }

  v6 = (__CFHTTPMessage *)_CFHTTPServerResponseCopyProperty();
  if (CFHTTPMessageGetResponseStatusCode(v6) == 200)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "pairingServer:didPairWithService:pairingGUID:", self, self->_successfulPairingServiceName, self->_successfulPairingGUID);

    -[TVRMSPairingServer stopServer](self, "stopServer");
  }
  if (v6)
    CFRelease(v6);
}

- (void)handleHTTPServerConnectionDidFailToReplyToRequest:(_CFHTTPServerRequest *)a3 withResponse:(_CFHTTPServerResponse *)a4
{
  NSObject *v4;
  uint8_t v5[16];

  _TVRCRMSLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "HTTP server failed to reply to request", v5, 2u);
  }

}

- (TVRMSPairingServerDelegate)delegate
{
  return (TVRMSPairingServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unsigned)port
{
  return self->_port;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_advertisedDeviceModel, 0);
  objc_storeStrong((id *)&self->_advertisedDeviceName, 0);
  objc_storeStrong((id *)&self->_successfulPairingServiceName, 0);
  objc_storeStrong((id *)&self->_successfulPairingGUID, 0);
  objc_storeStrong((id *)&self->_expectedPasscodeHash, 0);
  objc_storeStrong((id *)&self->_HTTPServerQueue, 0);
}

@end
