@implementation TUSenderIdentityClient

- (BOOL)isRTTAvailableForSenderIdentityUUID:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[TUSenderIdentityClient isRTTSupportedForSenderIdentityUUID:](self, "isRTTSupportedForSenderIdentityUUID:", v4))
    v5 = -[TUSenderIdentityClient isTTYSoftwareAvailableForSenderIdentityUUID:](self, "isTTYSoftwareAvailableForSenderIdentityUUID:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)isRTTSupportedForSenderIdentityUUID:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[TUSenderIdentityClient client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRTTSupportedForSubscriptionUUID:", v4);

  return v6;
}

- (BOOL)isTTYAvailableForSenderIdentityUUID:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[TUSenderIdentityClient isTTYSupportedForSenderIdentityUUID:](self, "isTTYSupportedForSenderIdentityUUID:", v4))
    v5 = -[TUSenderIdentityClient isTTYHardwareAvailableForSenderIdentityUUID:](self, "isTTYHardwareAvailableForSenderIdentityUUID:", v4)|| -[TUSenderIdentityClient isTTYSoftwareAvailableForSenderIdentityUUID:](self, "isTTYSoftwareAvailableForSenderIdentityUUID:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)isTTYEnabledForSenderIdentityUUID:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[TUSenderIdentityClient client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isTTYEnabledForSubscriptionUUID:", v4);

  return v6;
}

- (BOOL)isTTYSupportedForSenderIdentityUUID:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[TUSenderIdentityClient client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isTTYSupportedForSubscriptionUUID:", v4);

  return v6;
}

- (BOOL)isTTYHardwareAvailableForSenderIdentityUUID:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[TUSenderIdentityClient client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isTTYHardwareAvailableForSubscriptionUUID:", v4);

  return v6;
}

- (BOOL)isTTYHardwareEnabledForSenderIdentityUUID:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[TUSenderIdentityClient client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isTTYHardwareEnabledForSubscriptionUUID:", v4);

  return v6;
}

- (BOOL)isTTYHardwareSupportedForSenderIdentityUUID:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[TUSenderIdentityClient client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isTTYHardwareSupportedForSubscriptionUUID:", v4);

  return v6;
}

- (BOOL)isTTYSoftwareAvailableForSenderIdentityUUID:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[TUSenderIdentityClient client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isTTYSoftwareAvailableForSubscriptionUUID:", v4);

  return v6;
}

- (BOOL)isTTYSoftwareEnabledForSenderIdentityUUID:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[TUSenderIdentityClient client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isTTYSoftwareEnabledForSubscriptionUUID:", v4);

  return v6;
}

- (BOOL)isTTYSoftwareSupportedForSenderIdentityUUID:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[TUSenderIdentityClient client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isTTYSoftwareSupportedForSubscriptionUUID:", v4);

  return v6;
}

- (TUSenderIdentityClient)init
{
  TUSenderIdentityClient *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  TUCoreTelephonyClient *v15;
  TUCoreTelephonyClient *client;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)TUSenderIdentityClient;
  v2 = -[TUSenderIdentityClient init](&v18, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_queue);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = objc_retainAutorelease(v10);
    v13 = dispatch_queue_create((const char *)objc_msgSend(v12, "UTF8String"), v11);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v13;

    v15 = -[TUCoreTelephonyClient initWithQueue:]([TUCoreTelephonyClient alloc], "initWithQueue:", v2->_queue);
    client = v2->_client;
    v2->_client = v15;

  }
  return v2;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (TUCoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)inEmergencyMode
{
  void *v2;
  char v3;

  -[TUSenderIdentityClient client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "inEmergencyMode");

  return v3;
}

- (BOOL)isEmergencyNumberForDigits:(id)a3 senderIdentityUUID:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v13 = 0;
  v8 = -[TUSenderIdentityClient isEmergencyNumberForDigits:senderIdentityUUID:error:](self, "isEmergencyNumberForDigits:senderIdentityUUID:error:", v6, v7, &v13);
  v9 = v13;
  v10 = v9;
  if (!v8 && v9)
  {
    TUDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v15 = v6;
      v16 = 2112;
      v17 = v10;
      v18 = 2112;
      v19 = v7;
      _os_log_error_impl(&dword_19A50D000, v11, OS_LOG_TYPE_ERROR, "Failed to determine whether digits %@ are an emergency number due to error %@ for sender identity UUID %@.", buf, 0x20u);
    }

  }
  return v8;
}

- (BOOL)isEmergencyNumberForDigits:(id)a3 senderIdentityUUID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  -[TUSenderIdentityClient client](self, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v10, "isEmergencyNumberForDigits:subscriptionUUID:error:", v9, v8, a5);

  return (char)a5;
}

- (BOOL)isWhitelistedEmergencyNumberForDigits:(id)a3 senderIdentityUUID:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v13 = 0;
  v8 = -[TUSenderIdentityClient isWhitelistedEmergencyNumberForDigits:senderIdentityUUID:error:](self, "isWhitelistedEmergencyNumberForDigits:senderIdentityUUID:error:", v6, v7, &v13);
  v9 = v13;
  v10 = v9;
  if (!v8 && v9)
  {
    TUDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v15 = v6;
      v16 = 2112;
      v17 = v10;
      v18 = 2112;
      v19 = v7;
      _os_log_error_impl(&dword_19A50D000, v11, OS_LOG_TYPE_ERROR, "Failed to determine whether digits %@ are a whitelisted emergency number due to error %@ for sender identity UUID %@.", buf, 0x20u);
    }

  }
  return v8;
}

- (BOOL)isWhitelistedEmergencyNumberForDigits:(id)a3 senderIdentityUUID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  -[TUSenderIdentityClient client](self, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v10, "isWhitelistedEmergencyNumberForDigits:subscriptionUUID:error:", v9, v8, a5);

  return (char)a5;
}

- (BOOL)shouldShowEmergencyCallbackModeAlertForSenderIdentityUUID:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v10;

  v4 = a3;
  v10 = 0;
  v5 = -[TUSenderIdentityClient shouldShowEmergencyCallbackModeAlertForSenderIdentityUUID:error:](self, "shouldShowEmergencyCallbackModeAlertForSenderIdentityUUID:error:", v4, &v10);
  v6 = v10;
  v7 = v6;
  if (!v5 && v6)
  {
    TUDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[TUSenderIdentityClient(Emergency) shouldShowEmergencyCallbackModeAlertForSenderIdentityUUID:].cold.1((uint64_t)v7, (uint64_t)v4, v8);

  }
  return v5;
}

- (BOOL)shouldShowEmergencyCallbackModeAlertForSenderIdentityUUID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[TUSenderIdentityClient client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "shouldShowEmergencyCallbackModeAlertForSubscriptionUUID:error:", v6, a4);

  return (char)a4;
}

- (id)testEmergencyHandleForAccountUUID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[TUSenderIdentityClient client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "testEmergencyHandleForSubscriptionLabelIdentifier:error:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
