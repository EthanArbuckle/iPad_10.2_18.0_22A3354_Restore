@implementation _LTDSELFLoggingFrameworkRequest

- (_LTDSELFLoggingFrameworkRequest)initWithInvocationId:(id)a3 endpoints:(id)a4 sessionIdProvider:(id)a5 qssSessionId:(id)a6 requestType:(int64_t)a7 requestRoute:(int64_t)a8 requestSize:(unint64_t)a9
{
  id v14;
  id v15;
  id v16;
  _LTDSELFLoggingFrameworkRequest *v17;
  uint64_t v18;
  SISchemaUUID *mtId;
  id v20;
  id v21;
  uint64_t v22;
  SISchemaUUID *frameworkRequestId;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  SISchemaUUID *v29;
  int64_t requestRoute;
  SISchemaUUID *v31;
  void *v32;
  _LTDSELFLoggingFrameworkRequest *v33;
  id v35;
  id v36;
  id v37;
  NSArray *obj;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v40 = a6;
  v45.receiver = self;
  v45.super_class = (Class)_LTDSELFLoggingFrameworkRequest;
  v17 = -[_LTDSELFLoggingFrameworkRequest init](&v45, sel_init);
  if (v17)
  {
    v35 = v16;
    v36 = v15;
    v37 = v14;
    v18 = objc_msgSend(objc_alloc(MEMORY[0x24BE95C78]), "initWithNSUUID:", v14);
    mtId = v17->_mtId;
    v17->_mtId = (SISchemaUUID *)v18;

    objc_storeStrong((id *)&v17->_endpoints, a4);
    objc_storeStrong((id *)&v17->_sessionIdProvider, a5);
    v20 = objc_alloc(MEMORY[0x24BE95C78]);
    v21 = objc_alloc_init(MEMORY[0x24BDD1880]);
    v22 = objc_msgSend(v20, "initWithNSUUID:", v21);
    frameworkRequestId = v17->_frameworkRequestId;
    v17->_frameworkRequestId = (SISchemaUUID *)v22;

    v17->_requestRoute = a8;
    v17->_isResponseReceivedEventSent = 0;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v17->_endpoints;
    v24 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v42 != v26)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          v29 = v17->_frameworkRequestId;
          requestRoute = v17->_requestRoute;
          v31 = v17->_mtId;
          -[_LTDSELFLoggingSessionIdProvider sessionId](v17->_sessionIdProvider, "sessionId");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "frameworkRequestSentWithFrameworkRequestId:qssSessionId:requestType:requestRoute:requestSize:mtId:sessionId:", v29, v40, a7, requestRoute, a9, v31, v32);

        }
        v25 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v25);
    }

    v33 = v17;
    v15 = v36;
    v14 = v37;
    v16 = v35;
  }

  return v17;
}

- (void)responseReceived:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int64_t requestRoute;
  SISchemaUUID *frameworkRequestId;
  SISchemaUUID *mtId;
  void *v13;
  NSArray *obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (!self->_isResponseReceivedEventSent)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    obj = self->_endpoints;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
          frameworkRequestId = self->_frameworkRequestId;
          requestRoute = self->_requestRoute;
          mtId = self->_mtId;
          -[_LTDSELFLoggingSessionIdProvider sessionId](self->_sessionIdProvider, "sessionId");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "frameworkRequestResponseReceivedWithFrameworkRequestId:requestRoute:mtId:sessionId:numberOfSentences:", frameworkRequestId, requestRoute, mtId, v13, a3);

          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
    }

    self->_isResponseReceivedEventSent = 1;
  }
}

- (SISchemaUUID)mtId
{
  return self->_mtId;
}

- (void)setMtId:(id)a3
{
  objc_storeStrong((id *)&self->_mtId, a3);
}

- (NSArray)endpoints
{
  return self->_endpoints;
}

- (void)setEndpoints:(id)a3
{
  objc_storeStrong((id *)&self->_endpoints, a3);
}

- (_LTDSELFLoggingSessionIdProvider)sessionIdProvider
{
  return self->_sessionIdProvider;
}

- (void)setSessionIdProvider:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIdProvider, a3);
}

- (SISchemaUUID)frameworkRequestId
{
  return self->_frameworkRequestId;
}

- (void)setFrameworkRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_frameworkRequestId, a3);
}

- (int64_t)requestRoute
{
  return self->_requestRoute;
}

- (void)setRequestRoute:(int64_t)a3
{
  self->_requestRoute = a3;
}

- (BOOL)isResponseReceivedEventSent
{
  return self->_isResponseReceivedEventSent;
}

- (void)setIsResponseReceivedEventSent:(BOOL)a3
{
  self->_isResponseReceivedEventSent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameworkRequestId, 0);
  objc_storeStrong((id *)&self->_sessionIdProvider, 0);
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_mtId, 0);
}

@end
