@implementation RETrainingSimulator

- (RETrainingSimulator)initWithTargetProcess:(id)a3 relevanceEngine:(id)a4
{
  id v7;
  id v8;
  RETrainingSimulator *v9;
  RETrainingSimulator *v10;
  RETrainingSimulationClient *v11;
  RETrainingSimulationClient *client;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RETrainingSimulator;
  v9 = -[RETrainingSimulator init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_targetProcessName, a3);
    objc_storeStrong((id *)&v10->_relevanceEngineName, a4);
    v11 = -[RETrainingSimulationClient initWithTargetProcessName:delegate:]([RETrainingSimulationClient alloc], "initWithTargetProcessName:delegate:", v7, v10);
    client = v10->_client;
    v10->_client = v11;

  }
  return v10;
}

- (void)trainingSimulationClientWasInterrupted:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  RELogForDomain(10);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[RETrainingSimulator trainingSimulationClientWasInterrupted:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

}

- (void)trainingSimulationClientWasInvalidated:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  RELogForDomain(10);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[RETrainingSimulator trainingSimulationClientWasInvalidated:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

}

- (void)createElementFromDescription:(id)a3
{
  -[RETrainingSimulationClient relevanceEngine:createElementFromDescription:](self->_client, "relevanceEngine:createElementFromDescription:", self->_relevanceEngineName, a3);
}

- (BOOL)performCommand:(id)a3 withOptions:(id)a4
{
  return -[RETrainingSimulationClient relevanceEngine:performCommand:withOptions:](self->_client, "relevanceEngine:performCommand:withOptions:", self->_relevanceEngineName, a3, a4);
}

- (id)allElementIdentifiers
{
  return -[RETrainingSimulationClient fetchAllElementIdentifiersInRelevanceEngine:](self->_client, "fetchAllElementIdentifiersInRelevanceEngine:", self->_relevanceEngineName);
}

- (id)allElements
{
  return -[RETrainingSimulationClient fetchAllElementsInRelevanceEngine:](self->_client, "fetchAllElementsInRelevanceEngine:", self->_relevanceEngineName);
}

- (id)availableRelevanceEngines
{
  return -[RETrainingSimulationClient availableRelevanceEngines](self->_client, "availableRelevanceEngines");
}

- (BOOL)runActionOfElementWithDescription1:(id)a3
{
  return -[RETrainingSimulationClient relevanceEngine:runActionOfElementWithDescription1:](self->_client, "relevanceEngine:runActionOfElementWithDescription1:", self->_relevanceEngineName, a3);
}

- (id)storedDiagnosticLogsURL
{
  return -[RETrainingSimulationClient diagnosticLogFileForRelevanceEngine:](self->_client, "diagnosticLogFileForRelevanceEngine:", self->_relevanceEngineName);
}

- (id)encodedObjectAtPath:(id)a3
{
  return -[RETrainingSimulationClient relevanceEngine:encodedObjectAtPath:](self->_client, "relevanceEngine:encodedObjectAtPath:", self->_relevanceEngineName, a3);
}

- (NSString)targetProcessName
{
  return self->_targetProcessName;
}

- (NSString)relevanceEngineName
{
  return self->_relevanceEngineName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relevanceEngineName, 0);
  objc_storeStrong((id *)&self->_targetProcessName, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (void)trainingSimulationClientWasInterrupted:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2132F7000, a1, a3, "Connect to relevance engine was interrupted", a5, a6, a7, a8, 0);
}

- (void)trainingSimulationClientWasInvalidated:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2132F7000, a1, a3, "Connect to relevance engine was invalidated", a5, a6, a7, a8, 0);
}

@end
