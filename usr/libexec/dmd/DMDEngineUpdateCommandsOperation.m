@implementation DMDEngineUpdateCommandsOperation

- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  unsigned __int8 v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  id v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineUpdateCommandsOperation request](self, "request"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addCommands"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineUpdateCommandsOperation request](self, "request"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "organizationIdentifier"));
  v21 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[DMDCommandPayloadMetadata commandsWithPayloadDictionaries:organizationIdentifier:context:error:](DMDCommandPayloadMetadata, "commandsWithPayloadDictionaries:organizationIdentifier:context:error:", v6, v8, v4, &v21));
  v10 = v21;

  if (v9)
  {
    v20 = v10;
    v12 = objc_msgSend(v4, "save:", &v20);
    v13 = v20;

    if ((v12 & 1) != 0)
    {
      -[DMDEngineUpdateCommandsOperation setResultObject:](self, "setResultObject:", 0);
    }
    else
    {
      v18 = DMFConfigurationEngineLog(v14);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_100076E18(v13, v19);

      -[DMDEngineUpdateCommandsOperation setError:](self, "setError:", v13);
    }
    v10 = v13;
  }
  else
  {
    v15 = DMFConfigurationEngineLog(v11);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_100076DAC((uint64_t)v10, v16, v17);

    -[DMDEngineUpdateCommandsOperation setError:](self, "setError:", v10);
  }

}

- (DMFUpdateEnqueuedCommandsRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

@end
