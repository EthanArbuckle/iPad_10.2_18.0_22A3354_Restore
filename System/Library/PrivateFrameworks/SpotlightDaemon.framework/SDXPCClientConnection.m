@implementation SDXPCClientConnection

- (void)invalidationHandler
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "serviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_213CF1000, a2, OS_LOG_TYPE_ERROR, "##### connection invalidated \"%@\", (uint8_t *)&v4, 0xCu);

}

- (void)handleError:(id)a3
{
  const char *string;
  NSObject *v5;

  string = xpc_dictionary_get_string(a3, (const char *)*MEMORY[0x24BDACF40]);
  logForCSLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[SDXPCClientConnection handleError:].cold.1((uint64_t)string, self, v5);

}

- (SDXPCClientConnection)initWithServiceName:(id)a3 clientType:(int64_t)a4
{
  id v5;
  SDXPCClientConnection *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *clientQueue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SDXPCClientConnection;
  v6 = -[CSXPCConnection initWithMachServiceName:](&v12, sel_initWithMachServiceName_, v5);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_UTILITY, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = dispatch_queue_create((const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"), v8);
    clientQueue = v6->_clientQueue;
    v6->_clientQueue = (OS_dispatch_queue *)v9;

  }
  return v6;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

- (void)handleError:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 136315394;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_213CF1000, a3, OS_LOG_TYPE_ERROR, "### Connection error %s for %@ ####", (uint8_t *)&v6, 0x16u);

}

@end
