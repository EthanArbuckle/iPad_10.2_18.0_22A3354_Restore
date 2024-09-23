@implementation SCLTransportService

- (SCLTransportService)initWithTargetQueue:(id)a3 service:(id)a4
{
  NSObject *v7;
  id v8;
  SCLTransportService *v9;
  uint64_t v10;
  NSHashTable *transportControllers;
  NSObject *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SCLTransportService;
  v9 = -[SCLTransportService init](&v17, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v10 = objc_claimAutoreleasedReturnValue();
    transportControllers = v9->_transportControllers;
    v9->_transportControllers = (NSHashTable *)v10;

    objc_storeStrong((id *)&v9->_targetQueue, a3);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_initially_inactive(v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = dispatch_queue_create_with_target_V2("com.apple.schooltimed.SCLTransportService", v13, v7);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v9->_service, a4);
  }

  return v9;
}

- (void)start
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;

  -[SCLTransportService targetQueue](self, "targetQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v7 = objc_alloc_init(MEMORY[0x24BE4FCC8]);
  objc_msgSend(v7, "setWantsCrossAccountMessaging:", 1);
  -[SCLTransportService service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLTransportService queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addDelegate:withDelegateProperties:queue:", self, v7, v5);

  -[SCLTransportService queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_activate(v6);

}

- (void)addTransportController:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SCLTransportService targetQueue](self, "targetQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[SCLTransportService transportControllers](self, "transportControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  objc_msgSend(v6, "setTransportService:", self);
}

- (void)removeTransportController:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  -[SCLTransportService targetQueue](self, "targetQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "setTransportService:", 0);
  -[SCLTransportService transportControllers](self, "transportControllers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

}

- (id)transportControllerForDevice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  -[SCLTransportService targetQueue](self, "targetQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x24BDD1758];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __52__SCLTransportService_transportControllerForDevice___block_invoke;
  v14[3] = &unk_24E29B898;
  v15 = v4;
  v7 = v4;
  objc_msgSend(v6, "predicateWithBlock:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLTransportService transportControllers](self, "transportControllers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "filteredArrayUsingPredicate:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __52__SCLTransportService_transportControllerForDevice___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "IDSDeviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIDOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (BOOL)sendProtobuf:(id)a3 toDevice:(id)a4 options:(id)a5 identifier:(id *)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void *)IDSCopyIDForDevice();
  if (v15)
  {
    if (!v14)
      v14 = (id)MEMORY[0x24BDBD1B8];
    -[SCLTransportService service](self, "service");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(a7) = objc_msgSend(v16, "sendProtobuf:toDestinations:priority:options:identifier:error:", v12, v17, 300, v14, a6, a7);

  }
  else if (a7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("IDSCopyIDForDevice returned nil for device %@"), v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x24BDD1540];
    v22 = *MEMORY[0x24BDD0FC8];
    v23[0] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.schooltime"), 4, v20);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a7) = 0;
  }

  return (char)a7;
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  v12 = a7;
  scl_transport_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v13))
  {
    v20 = 67109120;
    v21 = objc_msgSend(v10, "type");
    _os_signpost_emit_with_name_impl(&dword_21E4AD000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Incoming Protobuf", "Type: %d", (uint8_t *)&v20, 8u);
  }

  -[SCLTransportService service](self, "service");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "linkedDeviceForFromID:withRelationship:", v11, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCLTransportService transportControllerForDevice:](self, "transportControllerForDevice:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "service:incomingProtobuf:fromID:context:", self, v10, v11, v12);
    scl_transport_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v18))
    {
      v19 = objc_msgSend(v10, "type");
      v20 = 67109120;
      v21 = v19;
      _os_signpost_emit_with_name_impl(&dword_21E4AD000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Incoming Protobuf", "Type: %d", (uint8_t *)&v20, 8u);
    }
  }
  else
  {
    scl_transport_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[SCLTransportService service:account:incomingUnhandledProtobuf:fromID:context:].cold.1();
  }

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  id v33;
  __int16 v34;
  int v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v10 = a6;
  v38 = *MEMORY[0x24BDAC8D0];
  v26 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  scl_transport_log();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v10)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v33 = v15;
      v34 = 1024;
      v35 = 1;
      v36 = 2112;
      v37 = v16;
      _os_log_impl(&dword_21E4AD000, v19, OS_LOG_TYPE_DEFAULT, "Service message with identifier %@ did send with success %{BOOL}u error: %@", buf, 0x1Cu);
    }
  }
  else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    -[SCLTransportService service:account:identifier:didSendWithSuccess:error:context:].cold.1();
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[SCLTransportService transportControllers](self, "transportControllers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "allObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v28;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v28 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v25++), "service:identifier:didSendWithSuccess:error:", self, v15, v10, v16);
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v23);
  }

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 fromID:(id)a6 hasBeenDeliveredWithContext:(id)a7
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a6;
  scl_transport_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v9;
    _os_log_impl(&dword_21E4AD000, v11, OS_LOG_TYPE_DEFAULT, "Service message %@ hasBeenDelivered", (uint8_t *)&v17, 0xCu);
  }

  -[SCLTransportService service](self, "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "linkedDeviceForFromID:withRelationship:", v10, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCLTransportService transportControllerForDevice:](self, "transportControllerForDevice:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "service:didDeliverMessageWithIdentifier:", self, v9);
  }
  else
  {
    scl_transport_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SCLTransportService service:account:incomingUnhandledProtobuf:fromID:context:].cold.1();

  }
}

- (IDSService)service
{
  return self->_service;
}

- (NSHashTable)transportControllers
{
  return self->_transportControllers;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_transportControllers, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

- (void)service:account:incomingUnhandledProtobuf:fromID:context:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21E4AD000, v0, v1, "No transport controller for incoming message from %@; %@");
  OUTLINED_FUNCTION_2();
}

- (void)service:account:identifier:didSendWithSuccess:error:context:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21E4AD000, v0, v1, "Service message with identifier %@ failed to send with error %@");
  OUTLINED_FUNCTION_2();
}

@end
