@implementation _RETrainingProxy

- (_RETrainingProxy)initWithServiceName:(id)a3
{
  id v5;
  _RETrainingProxy *v6;
  _RETrainingProxy *v7;
  RETrainingSimulationClient *v8;
  RETrainingSimulationClient *client;
  uint64_t v10;
  RETrainingSimulationServer *server;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_RETrainingProxy;
  v6 = -[_RETrainingProxy init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serviceName, a3);
    v8 = -[RETrainingSimulationClient initWithServiceName:delegate:]([RETrainingSimulationClient alloc], "initWithServiceName:delegate:", v5, v7);
    client = v7->_client;
    v7->_client = v8;

    +[RETrainingSimulationServer sharedServer](RETrainingSimulationServer, "sharedServer");
    v10 = objc_claimAutoreleasedReturnValue();
    server = v7->_server;
    v7->_server = (RETrainingSimulationServer *)v10;

    -[RETrainingSimulationServer addObserver:](v7->_server, "addObserver:", v7);
  }

  return v7;
}

- (void)availableRelevanceEngines:(id)a3
{
  RETrainingSimulationClient *client;
  void (**v4)(id, id, _QWORD);
  id v5;

  client = self->_client;
  v4 = (void (**)(id, id, _QWORD))a3;
  -[RETrainingSimulationClient availableRelevanceEngines](client, "availableRelevanceEngines");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5, 0);

}

- (void)fetchAllElementIdentifiersInRelevanceEngine:(id)a3 completion:(id)a4
{
  RETrainingSimulationClient *client;
  void (**v6)(id, id, _QWORD);
  id v7;

  client = self->_client;
  v6 = (void (**)(id, id, _QWORD))a4;
  -[RETrainingSimulationClient fetchAllElementIdentifiersInRelevanceEngine:](client, "fetchAllElementIdentifiersInRelevanceEngine:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7, 0);

}

- (void)fetchAllElementsInRelevanceEngine:(id)a3 completion:(id)a4
{
  RETrainingSimulationClient *client;
  void (**v6)(id, id, _QWORD);
  id v7;

  client = self->_client;
  v6 = (void (**)(id, id, _QWORD))a4;
  -[RETrainingSimulationClient fetchAllElementsInRelevanceEngine:](client, "fetchAllElementsInRelevanceEngine:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7, 0);

}

- (void)gatherDiagnosticLogsForRelevanceEngine:(id)a3 completion:(id)a4
{
  RETrainingSimulationClient *client;
  void (**v6)(id, void *, id);
  void *v7;
  void *v8;
  id v9;
  id v10;

  client = self->_client;
  v6 = (void (**)(id, void *, id))a4;
  -[RETrainingSimulationClient diagnosticLogFileForRelevanceEngine:](client, "diagnosticLogFileForRelevanceEngine:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v7, "bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:", 0, 0, 0, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v10;
  v6[2](v6, v8, v9);

}

- (void)relevanceEngine:(id)a3 createElementFromDescription:(id)a4 completion:(id)a5
{
  RETrainingSimulationClient *client;
  void (**v8)(id, _QWORD);

  client = self->_client;
  v8 = (void (**)(id, _QWORD))a5;
  -[RETrainingSimulationClient relevanceEngine:createElementFromDescription:](client, "relevanceEngine:createElementFromDescription:", a3, a4);
  v8[2](v8, 0);

}

- (void)relevanceEngine:(id)a3 encodedObjectAtPath:(id)a4 completion:(id)a5
{
  RETrainingSimulationClient *client;
  void (**v8)(id, id);
  id v9;

  client = self->_client;
  v8 = (void (**)(id, id))a5;
  -[RETrainingSimulationClient relevanceEngine:encodedObjectAtPath:](client, "relevanceEngine:encodedObjectAtPath:", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v9);

}

- (void)relevanceEngine:(id)a3 performCommand:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  RETrainingSimulationClient *client;
  void (**v10)(id, _QWORD);

  client = self->_client;
  v10 = (void (**)(id, _QWORD))a6;
  -[RETrainingSimulationClient relevanceEngine:performCommand:withOptions:](client, "relevanceEngine:performCommand:withOptions:", a3, a4, a5);
  v10[2](v10, 0);

}

- (void)relevanceEngine:(id)a3 runActionOfElementWithDescription1:(id)a4 completion:(id)a5
{
  RETrainingSimulationClient *client;
  void (**v8)(id, uint64_t, _QWORD);

  client = self->_client;
  v8 = (void (**)(id, uint64_t, _QWORD))a5;
  v8[2](v8, -[RETrainingSimulationClient relevanceEngine:runActionOfElementWithDescription1:](client, "relevanceEngine:runActionOfElementWithDescription1:", a3, a4), 0);

}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (RETrainingSimulationServer)server
{
  return self->_server;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
