@implementation TPSCallForwardingController

- (TPSCallForwardingController)init
{
  -[TPSCallForwardingController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (TPSCallForwardingController)initWithSubscriptionContext:(id)a3
{
  id v5;
  TPSCallForwardingController *v6;
  TPSCallForwardingController *v7;
  TPSCarrierBundleController *v8;
  TPSCarrierBundleController *carrierBundleController;
  void *v10;
  TPSCallForwardingRequestController *v11;
  TPSCallForwardingRequestController *requestController;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TPSCallForwardingController;
  v6 = -[TPSCallForwardingController init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_subscriptionContext, a3);
    v8 = objc_alloc_init(TPSCarrierBundleController);
    carrierBundleController = v7->_carrierBundleController;
    v7->_carrierBundleController = v8;

    v10 = (void *)MEMORY[0x1E0C80D38];
    -[TPSController addDelegate:queue:](v7->_carrierBundleController, "addDelegate:queue:", v7, MEMORY[0x1E0C80D38]);
    v11 = objc_alloc_init(TPSCallForwardingRequestController);
    requestController = v7->_requestController;
    v7->_requestController = v11;

    -[TPSRequestController addDelegate:queue:](v7->_requestController, "addDelegate:queue:", v7, v10);
    -[TPSCallForwardingController sendServicesRequest](v7, "sendServicesRequest");
  }

  return v7;
}

- (BOOL)isLoading
{
  return -[TPSCallForwardingController isConditionalServiceLoading](self, "isConditionalServiceLoading")
      || -[TPSCallForwardingController isUnconditionalServiceLoading](self, "isUnconditionalServiceLoading");
}

- (NSString)subscriptionISOCountryCode
{
  NSString *subscriptionISOCountryCode;
  void *v4;
  NSString *v5;
  NSString *v6;

  subscriptionISOCountryCode = self->_subscriptionISOCountryCode;
  if (!subscriptionISOCountryCode)
  {
    -[TPSCallForwardingController subscriptionContext](self, "subscriptionContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tps_isoCountryCode");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_subscriptionISOCountryCode;
    self->_subscriptionISOCountryCode = v5;

    subscriptionISOCountryCode = self->_subscriptionISOCountryCode;
  }
  return subscriptionISOCountryCode;
}

- (void)setCurrentServiceType:(int64_t)a3
{
  void *v5;
  char v6;
  id v7;

  if (self->_currentServiceType != a3)
  {
    self->_currentServiceType = a3;
    if (a3 == 1)
      -[TPSCallForwardingController setUnloading:](self, "setUnloading:", 0);
    -[TPSCallForwardingController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[TPSCallForwardingController delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "callForwardingController:didChangeServiceType:", self, a3);

    }
  }
}

- (void)resetPendingServiceType
{
  -[TPSCallForwardingController setPendingServiceType:](self, "setPendingServiceType:", 0);
}

- (void)updateServiceType:(int64_t)a3
{
  int64_t v5;
  int64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = -[TPSCallForwardingController currentServiceType](self, "currentServiceType");
  if (v5 == a3)
    return;
  v6 = v5;
  TPSLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "tps_stringWithTPSCallForwardingServiceType:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "tps_stringWithTPSCallForwardingServiceType:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_1DB4B7000, v7, OS_LOG_TYPE_DEFAULT, "Transitioning call forwarding service from %@ to %@.", (uint8_t *)&v10, 0x16u);

  }
  if (v6 == 2)
  {
    if ((a3 | 2) == 3)
    {
      if (-[TPSCallForwardingController unconditionalServiceState](self, "unconditionalServiceState") == 3)
      {
        -[TPSCallForwardingController setPendingServiceType:](self, "setPendingServiceType:", a3);
        -[TPSCallForwardingController sendSetUnconditionalServiceDisabledRequest](self, "sendSetUnconditionalServiceDisabledRequest");
      }
      else
      {
        -[TPSCallForwardingController setCurrentServiceType:](self, "setCurrentServiceType:", a3);
        if (a3 == 3)
          -[TPSCallForwardingController enableConditionalServiceIfNeeded](self, "enableConditionalServiceIfNeeded");
      }
      return;
    }
    goto LABEL_16;
  }
  if (v6 != 3)
  {
    if (a3 == 2 && v6 == 1)
    {
      -[TPSCallForwardingController setCurrentServiceType:](self, "setCurrentServiceType:", 2);
LABEL_15:
      -[TPSCallForwardingController enableUnconditionalServiceIfNeeded](self, "enableUnconditionalServiceIfNeeded");
      return;
    }
LABEL_16:
    -[TPSCallForwardingController setCurrentServiceType:](self, "setCurrentServiceType:", a3);
    return;
  }
  if ((unint64_t)(a3 - 1) > 1)
    goto LABEL_16;
  if (-[TPSCallForwardingController conditionalServiceState](self, "conditionalServiceState") == 3)
  {
    -[TPSCallForwardingController setPendingServiceType:](self, "setPendingServiceType:", a3);
    -[TPSCallForwardingController sendSetAllServicesDisabledRequest](self, "sendSetAllServicesDisabledRequest");
    return;
  }
  -[TPSCallForwardingController setCurrentServiceType:](self, "setCurrentServiceType:", a3);
  if (a3 == 2)
    goto LABEL_15;
}

- (void)enableConditionalServiceIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[TPSCallForwardingController conditionalServiceBusyValue](self, "conditionalServiceBusyValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[TPSCallForwardingController sendEnableSetRequestForValue:](self, "sendEnableSetRequestForValue:", v3);
  -[TPSCallForwardingController conditionalServiceUnansweredValue](self, "conditionalServiceUnansweredValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[TPSCallForwardingController sendEnableSetRequestForValue:](self, "sendEnableSetRequestForValue:", v4);
  -[TPSCallForwardingController conditionalServiceUnreachableValue](self, "conditionalServiceUnreachableValue");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    -[TPSCallForwardingController sendEnableSetRequestForValue:](self, "sendEnableSetRequestForValue:", v6);
    v5 = v6;
  }

}

- (BOOL)isConditionalServiceAvailable
{
  return -[TPSCallForwardingController conditionalServiceState](self, "conditionalServiceState") != 1;
}

- (BOOL)isConditionalServiceLoading
{
  return -[TPSCallForwardingController conditionalServiceState](self, "conditionalServiceState") == 0;
}

- (NSArray)conditionalServiceRequests
{
  NSArray *conditionalServiceRequests;
  TPSCallForwardingRequest *v4;
  void *v5;
  TPSCallForwardingRequest *v6;
  TPSCallForwardingRequest *v7;
  void *v8;
  TPSCallForwardingRequest *v9;
  TPSCallForwardingRequest *v10;
  void *v11;
  TPSCallForwardingRequest *v12;
  NSArray *v13;
  NSArray *v14;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  conditionalServiceRequests = self->_conditionalServiceRequests;
  if (!conditionalServiceRequests)
  {
    v4 = [TPSCallForwardingRequest alloc];
    -[TPSCallForwardingController subscriptionContext](self, "subscriptionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[TPSCallForwardingRequest initWithSubscriptionContext:reason:](v4, "initWithSubscriptionContext:reason:", v5, 1);
    v7 = [TPSCallForwardingRequest alloc];
    -[TPSCallForwardingController subscriptionContext](self, "subscriptionContext", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[TPSCallForwardingRequest initWithSubscriptionContext:reason:](v7, "initWithSubscriptionContext:reason:", v8, 2);
    v16[1] = v9;
    v10 = [TPSCallForwardingRequest alloc];
    -[TPSCallForwardingController subscriptionContext](self, "subscriptionContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[TPSCallForwardingRequest initWithSubscriptionContext:reason:](v10, "initWithSubscriptionContext:reason:", v11, 3);
    v16[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v14 = self->_conditionalServiceRequests;
    self->_conditionalServiceRequests = v13;

    conditionalServiceRequests = self->_conditionalServiceRequests;
  }
  return conditionalServiceRequests;
}

- (int64_t)conditionalServiceState
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;

  if (!MGGetBoolAnswer())
    return 1;
  -[TPSCallForwardingController conditionalServiceBusyValue](self, "conditionalServiceBusyValue");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[TPSCallForwardingController conditionalServiceUnansweredValue](self, "conditionalServiceUnansweredValue");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v8 = 0;
LABEL_17:

      return v8;
    }
    v6 = (void *)v5;
    -[TPSCallForwardingController conditionalServiceUnreachableValue](self, "conditionalServiceUnreachableValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[TPSCallForwardingController conditionalServiceBusyValue](self, "conditionalServiceBusyValue");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "enabled") & 1) != 0)
      {
        v8 = 3;
      }
      else
      {
        -[TPSCallForwardingController conditionalServiceUnansweredValue](self, "conditionalServiceUnansweredValue");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "enabled") & 1) != 0)
        {
          v8 = 3;
        }
        else
        {
          -[TPSCallForwardingController conditionalServiceUnreachableValue](self, "conditionalServiceUnreachableValue");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "enabled"))
            v8 = 3;
          else
            v8 = 2;

        }
      }
      goto LABEL_17;
    }
  }
  return 0;
}

- (NSString)conditionalServiceBusyPhoneNumber
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[TPSCallForwardingController conditionalServiceBusyValue](self, "conditionalServiceBusyValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "saveNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSCallForwardingController subscriptionISOCountryCode](self, "subscriptionISOCountryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  TPSLocalizedPhoneNumberString(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)setConditionalServiceBusyPhoneNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TPSCallForwardingController conditionalServiceBusyValue](self, "conditionalServiceBusyValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[TPSCallForwardingController subscriptionISOCountryCode](self, "subscriptionISOCountryCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    TPSNormalizedPhoneNumberString(v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "saveNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    if (v9 | v10)
    {
      v11 = (void *)v10;
      if (v10)
      {
        v12 = objc_msgSend((id)v9, "isEqualToString:", v10);

        if ((v12 & 1) != 0)
          goto LABEL_10;
      }
      else
      {

      }
      v13 = (void *)objc_msgSend(v5, "copy");
      objc_msgSend(v13, "setSaveNumber:", v9);
      objc_msgSend(v13, "setEnabled:", objc_msgSend((id)v9, "length") != 0);
      TPSLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412290;
        v16 = v13;
        _os_log_impl(&dword_1DB4B7000, v14, OS_LOG_TYPE_DEFAULT, "Sending set conditional call forwarding service busy phone number request for value %@.", (uint8_t *)&v15, 0xCu);
      }

      -[TPSCallForwardingController sendSetRequestForValue:](self, "sendSetRequestForValue:", v13);
    }
LABEL_10:

  }
}

- (NSString)conditionalServiceUnansweredPhoneNumber
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[TPSCallForwardingController conditionalServiceUnansweredValue](self, "conditionalServiceUnansweredValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "saveNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSCallForwardingController subscriptionISOCountryCode](self, "subscriptionISOCountryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  TPSLocalizedPhoneNumberString(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)setConditionalServiceUnansweredPhoneNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TPSCallForwardingController conditionalServiceUnansweredValue](self, "conditionalServiceUnansweredValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[TPSCallForwardingController subscriptionISOCountryCode](self, "subscriptionISOCountryCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    TPSNormalizedPhoneNumberString(v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "saveNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    if (v9 | v10)
    {
      v11 = (void *)v10;
      if (v10)
      {
        v12 = objc_msgSend((id)v9, "isEqualToString:", v10);

        if ((v12 & 1) != 0)
          goto LABEL_10;
      }
      else
      {

      }
      v13 = (void *)objc_msgSend(v5, "copy");
      objc_msgSend(v13, "setSaveNumber:", v9);
      objc_msgSend(v13, "setEnabled:", objc_msgSend((id)v9, "length") != 0);
      TPSLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412290;
        v16 = v13;
        _os_log_impl(&dword_1DB4B7000, v14, OS_LOG_TYPE_DEFAULT, "Sending set conditional call forwarding service unanswered phone number request for value %@.", (uint8_t *)&v15, 0xCu);
      }

      -[TPSCallForwardingController sendSetRequestForValue:](self, "sendSetRequestForValue:", v13);
    }
LABEL_10:

  }
}

- (NSString)conditionalServiceUnreachablePhoneNumber
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[TPSCallForwardingController conditionalServiceUnreachableValue](self, "conditionalServiceUnreachableValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "saveNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSCallForwardingController subscriptionISOCountryCode](self, "subscriptionISOCountryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  TPSLocalizedPhoneNumberString(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)setConditionalServiceUnreachablePhoneNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TPSCallForwardingController conditionalServiceUnreachableValue](self, "conditionalServiceUnreachableValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[TPSCallForwardingController subscriptionISOCountryCode](self, "subscriptionISOCountryCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    TPSNormalizedPhoneNumberString(v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "saveNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    if (v9 | v10)
    {
      v11 = (void *)v10;
      if (v10)
      {
        v12 = objc_msgSend((id)v9, "isEqualToString:", v10);

        if ((v12 & 1) != 0)
          goto LABEL_10;
      }
      else
      {

      }
      v13 = (void *)objc_msgSend(v5, "copy");
      objc_msgSend(v13, "setSaveNumber:", v9);
      objc_msgSend(v13, "setEnabled:", objc_msgSend((id)v9, "length") != 0);
      TPSLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412290;
        v16 = v13;
        _os_log_impl(&dword_1DB4B7000, v14, OS_LOG_TYPE_DEFAULT, "Sending set conditional call forwarding service unreachable phone number request for value %@.", (uint8_t *)&v15, 0xCu);
      }

      -[TPSCallForwardingController sendSetRequestForValue:](self, "sendSetRequestForValue:", v13);
    }
LABEL_10:

  }
}

- (void)enableUnconditionalServiceIfNeeded
{
  void *v3;
  void *v4;

  -[TPSCallForwardingController unconditionalServiceValue](self, "unconditionalServiceValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[TPSCallForwardingController sendEnableSetRequestForValue:](self, "sendEnableSetRequestForValue:", v3);
    v3 = v4;
  }

}

- (BOOL)isUnconditionalServiceLoading
{
  return -[TPSCallForwardingController unconditionalServiceState](self, "unconditionalServiceState") == 0;
}

- (NSArray)unconditionalServiceRequests
{
  NSArray *unconditionalServiceRequests;
  TPSCallForwardingRequest *v4;
  void *v5;
  TPSCallForwardingRequest *v6;
  NSArray *v7;
  NSArray *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  unconditionalServiceRequests = self->_unconditionalServiceRequests;
  if (!unconditionalServiceRequests)
  {
    v4 = [TPSCallForwardingRequest alloc];
    -[TPSCallForwardingController subscriptionContext](self, "subscriptionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[TPSCallForwardingRequest initWithSubscriptionContext:reason:](v4, "initWithSubscriptionContext:reason:", v5, 0);
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v8 = self->_unconditionalServiceRequests;
    self->_unconditionalServiceRequests = v7;

    unconditionalServiceRequests = self->_unconditionalServiceRequests;
  }
  return unconditionalServiceRequests;
}

- (int64_t)unconditionalServiceState
{
  void *v2;
  void *v3;
  int64_t v4;

  -[TPSCallForwardingController unconditionalServiceValue](self, "unconditionalServiceValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "enabled"))
      v4 = 3;
    else
      v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)unconditionalServicePhoneNumber
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[TPSCallForwardingController unconditionalServiceValue](self, "unconditionalServiceValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "saveNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSCallForwardingController subscriptionISOCountryCode](self, "subscriptionISOCountryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  TPSLocalizedPhoneNumberString(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)setUnconditionalServicePhoneNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TPSCallForwardingController unconditionalServiceValue](self, "unconditionalServiceValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[TPSCallForwardingController subscriptionISOCountryCode](self, "subscriptionISOCountryCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    TPSNormalizedPhoneNumberString(v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "saveNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    if (v9 | v10)
    {
      v11 = (void *)v10;
      if (v10)
      {
        v12 = objc_msgSend((id)v9, "isEqualToString:", v10);

        if ((v12 & 1) != 0)
          goto LABEL_10;
      }
      else
      {

      }
      v13 = (void *)objc_msgSend(v5, "copy");
      objc_msgSend(v13, "setSaveNumber:", v9);
      objc_msgSend(v13, "setEnabled:", objc_msgSend((id)v9, "length") != 0);
      TPSLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412290;
        v16 = v13;
        _os_log_impl(&dword_1DB4B7000, v14, OS_LOG_TYPE_DEFAULT, "Sending set unconditional call forwarding service phone number request for value %@.", (uint8_t *)&v15, 0xCu);
      }

      -[TPSCallForwardingController sendSetRequestForValue:](self, "sendSetRequestForValue:", v13);
    }
LABEL_10:

  }
}

- (NSDictionary)carrierBundleLocalizedStringKeys
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[TPSCallForwardingController carrierBundleController](self, "carrierBundleController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSCallForwardingController subscriptionContext](self, "subscriptionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:subscriptionContext:", CFSTR("CallForwardingCustomLabels"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  return (NSDictionary *)v6;
}

- (id)localizedCarrierBundleStringForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[TPSCallForwardingController carrierBundleLocalizedStringKeys](self, "carrierBundleLocalizedStringKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_CALL_FORWARDING_CUSTOM_LABEL"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[TPSCallForwardingController carrierBundleController](self, "carrierBundleController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSCallForwardingController subscriptionContext](self, "subscriptionContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:subscriptionContext:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
    v7 = 0;
  }

  return v10;
}

- (NSString)localizedConditionalBusyTitle
{
  void *v2;

  -[TPSCallForwardingController localizedCarrierBundleStringForKey:](self, "localizedCarrierBundleStringForKey:", CFSTR("Busy"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[TPSLocalizedString localizedStringForKey:](TPSLocalizedString, "localizedStringForKey:", CFSTR("CONDITIONAL_SERVICE_BUSY_SPECIFIER_TITLE"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v2;
}

- (NSString)localizedConditionalUnansweredTitle
{
  void *v2;

  -[TPSCallForwardingController localizedCarrierBundleStringForKey:](self, "localizedCarrierBundleStringForKey:", CFSTR("NoAnswer"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[TPSLocalizedString localizedStringForKey:](TPSLocalizedString, "localizedStringForKey:", CFSTR("CONDITIONAL_SERVICE_UNANSWERED_SPECIFIER_TITLE"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v2;
}

- (NSString)localizedConditionalUnreachableTitle
{
  void *v2;

  -[TPSCallForwardingController localizedCarrierBundleStringForKey:](self, "localizedCarrierBundleStringForKey:", CFSTR("Unreachable"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[TPSLocalizedString localizedStringForKey:](TPSLocalizedString, "localizedStringForKey:", CFSTR("CONDITIONAL_SERVICE_UNREACHABLE_SPECIFIER_TITLE"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v2;
}

- (void)sendConditionalServicesRequest
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[TPSCallForwardingController conditionalServiceRequests](self, "conditionalServiceRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        TPSLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v16 = v8;
          _os_log_impl(&dword_1DB4B7000, v9, OS_LOG_TYPE_DEFAULT, "Sending conditional call forwarding services request for %@.", buf, 0xCu);
        }

        -[TPSCallForwardingController requestController](self, "requestController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addRequest:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v5);
  }

}

- (void)sendUnconditionalServicesRequest
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[TPSCallForwardingController unconditionalServiceRequests](self, "unconditionalServiceRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        TPSLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v16 = v8;
          _os_log_impl(&dword_1DB4B7000, v9, OS_LOG_TYPE_DEFAULT, "Sending unconditional call forwarding services request for %@.", buf, 0xCu);
        }

        -[TPSCallForwardingController requestController](self, "requestController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addRequest:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v5);
  }

}

- (void)sendServicesRequest
{
  NSObject *v3;
  uint8_t v4[16];

  TPSLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB4B7000, v3, OS_LOG_TYPE_DEFAULT, "Sending initial request for call forwarding services.", v4, 2u);
  }

  if (-[TPSCallForwardingController isConditionalServiceAvailable](self, "isConditionalServiceAvailable"))
    -[TPSCallForwardingController sendConditionalServicesRequest](self, "sendConditionalServicesRequest");
  -[TPSCallForwardingController sendUnconditionalServicesRequest](self, "sendUnconditionalServicesRequest");
}

- (void)sendSetAllServicesDisabledRequest
{
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (-[TPSCallForwardingController isConditionalServiceAvailable](self, "isConditionalServiceAvailable"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CA6D08]);
    objc_msgSend(v3, "setClss:", 1);
    objc_msgSend(v3, "setEnabled:", 0);
    objc_msgSend(v3, "setReason:", 4);
  }
  else
  {
    -[TPSCallForwardingController unconditionalServiceValue](self, "unconditionalServiceValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v4, "copy");

    objc_msgSend(v3, "setEnabled:", 0);
  }
  TPSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1DB4B7000, v5, OS_LOG_TYPE_DEFAULT, "Sending disable call forwarding services request for value %@.", (uint8_t *)&v6, 0xCu);
  }

  -[TPSCallForwardingController sendSetRequestForValue:](self, "sendSetRequestForValue:", v3);
}

- (void)sendSetUnconditionalServiceDisabledRequest
{
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[TPSCallForwardingController unconditionalServiceValue](self, "unconditionalServiceValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_msgSend(v4, "setEnabled:", 0);
  TPSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1DB4B7000, v5, OS_LOG_TYPE_DEFAULT, "Sending disable all unconditional call forwarding services request for value %@.", (uint8_t *)&v6, 0xCu);
  }

  -[TPSCallForwardingController sendSetRequestForValue:](self, "sendSetRequestForValue:", v4);
}

- (void)sendSetRequestForValue:(id)a3
{
  id v4;
  TPSSetCallForwardingRequest *v5;
  void *v6;
  void *v7;
  TPSSetCallForwardingRequest *v8;

  v4 = a3;
  v5 = [TPSSetCallForwardingRequest alloc];
  -[TPSCallForwardingController subscriptionContext](self, "subscriptionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TPSSetCallForwardingRequest initWithSubscriptionContext:value:](v5, "initWithSubscriptionContext:value:", v6, v4);

  -[TPSCallForwardingController requestController](self, "requestController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addRequest:", v8);

}

- (void)sendEnableSetRequestForValue:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "enabled") & 1) == 0)
  {
    objc_msgSend(v4, "saveNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      v7 = (void *)objc_msgSend(v4, "copy");
      objc_msgSend(v7, "setEnabled:", 1);
      TPSLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138412290;
        v10 = v7;
        _os_log_impl(&dword_1DB4B7000, v8, OS_LOG_TYPE_DEFAULT, "Sending enable call forwarding service request for value %@.", (uint8_t *)&v9, 0xCu);
      }

      -[TPSCallForwardingController sendSetRequestForValue:](self, "sendSetRequestForValue:", v7);
    }
  }

}

- (void)requestController:(id)a3 didReceiveResponse:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int64_t v18;
  int64_t v19;
  NSObject *v20;
  int64_t v21;
  unint64_t v22;
  _BOOL4 v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  _BYTE v28[24];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  TPSLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v28 = 138412546;
    *(_QWORD *)&v28[4] = objc_opt_class();
    *(_WORD *)&v28[12] = 2112;
    *(_QWORD *)&v28[14] = v5;
    v7 = *(id *)&v28[4];
    _os_log_impl(&dword_1DB4B7000, v6, OS_LOG_TYPE_DEFAULT, "%@ received response %@.", v28, 0x16u);

  }
  objc_msgSend(v5, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    goto LABEL_21;
  switch(objc_msgSend(v8, "reason"))
  {
    case 0u:
      -[TPSCallForwardingController unconditionalServiceValue](self, "unconditionalServiceValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v10, "setEnabled:", objc_msgSend(v9, "enabled"));
        objc_msgSend(v9, "saveNumber");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setSaveNumber:", v11);

        if (objc_msgSend(v10, "enabled"))
        {
          TPSLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v28 = 138412290;
            *(_QWORD *)&v28[4] = v10;
            _os_log_impl(&dword_1DB4B7000, v12, OS_LOG_TYPE_DEFAULT, "Setting service type to Unconditional for value %@.", v28, 0xCu);
          }

          v13 = 2;
        }
        else if (-[TPSCallForwardingController isConditionalServiceAvailable](self, "isConditionalServiceAvailable"))
        {
          TPSLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v28 = 0;
            _os_log_impl(&dword_1DB4B7000, v17, OS_LOG_TYPE_DEFAULT, "Conditional service is available; settings service type to Conditional.",
              v28,
              2u);
          }

          v13 = 3;
        }
        else
        {
          v13 = 1;
        }
      }
      else
      {
        -[TPSCallForwardingController setUnconditionalServiceValue:](self, "setUnconditionalServiceValue:", v9);
        v13 = 0;
      }
      break;
    case 1u:
      -[TPSCallForwardingController setConditionalServiceBusyValue:](self, "setConditionalServiceBusyValue:", v9);
      goto LABEL_21;
    case 2u:
      -[TPSCallForwardingController setConditionalServiceUnansweredValue:](self, "setConditionalServiceUnansweredValue:", v9);
      goto LABEL_21;
    case 3u:
      -[TPSCallForwardingController setConditionalServiceUnreachableValue:](self, "setConditionalServiceUnreachableValue:", v9);
      goto LABEL_21;
    case 4u:
      -[TPSCallForwardingController conditionalServiceBusyValue](self, "conditionalServiceBusyValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setEnabled:", objc_msgSend(v9, "enabled"));
      -[TPSCallForwardingController conditionalServiceUnansweredValue](self, "conditionalServiceUnansweredValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "setEnabled:", objc_msgSend(v9, "enabled"));
      -[TPSCallForwardingController conditionalServiceUnreachableValue](self, "conditionalServiceUnreachableValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "setEnabled:", objc_msgSend(v9, "enabled"));
      -[TPSCallForwardingController unconditionalServiceValue](self, "unconditionalServiceValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setEnabled:", objc_msgSend(v9, "enabled"));
      v13 = -[TPSCallForwardingController pendingServiceType](self, "pendingServiceType");
      break;
    default:
      goto LABEL_21;
  }
  -[TPSCallForwardingController resetPendingServiceType](self, "resetPendingServiceType", *(_OWORD *)v28, *(_QWORD *)&v28[16], v29);

  if (!v13)
  {
LABEL_21:
    if (-[TPSCallForwardingController isLoading](self, "isLoading", *(_QWORD *)v28))
    {
      v13 = 0;
    }
    else
    {
      v18 = -[TPSCallForwardingController conditionalServiceState](self, "conditionalServiceState");
      v19 = -[TPSCallForwardingController unconditionalServiceState](self, "unconditionalServiceState");
      if (v18 == 3)
      {
        TPSLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v28 = 0;
          _os_log_impl(&dword_1DB4B7000, v20, OS_LOG_TYPE_DEFAULT, "Conditional service is enabled; setting service type to Conditional.",
            v28,
            2u);
        }
        v13 = 3;
      }
      else
      {
        v21 = v19;
        v22 = v18 - 1;
        TPSLog();
        v20 = objc_claimAutoreleasedReturnValue();
        v23 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
        if (v22 <= 1 && v21 == 2)
        {
          if (v23)
          {
            *(_WORD *)v28 = 0;
            _os_log_impl(&dword_1DB4B7000, v20, OS_LOG_TYPE_DEFAULT, "Conditional service is unavailable/disabled and Unconditional service is disabled; setting service type to None.",
              v28,
              2u);
          }
          v13 = 1;
        }
        else if (v23)
        {
          *(_WORD *)v28 = 0;
          v13 = 2;
          _os_log_impl(&dword_1DB4B7000, v20, OS_LOG_TYPE_DEFAULT, "Unconditional service is enabled; setting service type to Unconditional.",
            v28,
            2u);
        }
        else
        {
          v13 = 2;
        }
      }

    }
  }
  if (-[TPSCallForwardingController currentServiceType](self, "currentServiceType") == v13)
  {
    -[TPSCallForwardingController delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_opt_respondsToSelector();

    if ((v25 & 1) != 0)
    {
      -[TPSCallForwardingController delegate](self, "delegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "error");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "callForwardingController:didChangeValue:error:", self, v9, v27);

    }
  }
  else
  {
    -[TPSCallForwardingController setCurrentServiceType:](self, "setCurrentServiceType:", v13);
  }

}

- (BOOL)isUnloading
{
  return self->_unloading;
}

- (void)setUnloading:(BOOL)a3
{
  self->_unloading = a3;
}

- (TPSCallForwardingControllerDelegate)delegate
{
  return (TPSCallForwardingControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TPSCarrierBundleController)carrierBundleController
{
  return self->_carrierBundleController;
}

- (TPSCallForwardingRequestController)requestController
{
  return self->_requestController;
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (int64_t)currentServiceType
{
  return self->_currentServiceType;
}

- (int64_t)pendingServiceType
{
  return self->_pendingServiceType;
}

- (void)setPendingServiceType:(int64_t)a3
{
  self->_pendingServiceType = a3;
}

- (CTCallForwardingValue)conditionalServiceBusyValue
{
  return self->_conditionalServiceBusyValue;
}

- (void)setConditionalServiceBusyValue:(id)a3
{
  objc_storeStrong((id *)&self->_conditionalServiceBusyValue, a3);
}

- (CTCallForwardingValue)conditionalServiceUnansweredValue
{
  return self->_conditionalServiceUnansweredValue;
}

- (void)setConditionalServiceUnansweredValue:(id)a3
{
  objc_storeStrong((id *)&self->_conditionalServiceUnansweredValue, a3);
}

- (CTCallForwardingValue)conditionalServiceUnreachableValue
{
  return self->_conditionalServiceUnreachableValue;
}

- (void)setConditionalServiceUnreachableValue:(id)a3
{
  objc_storeStrong((id *)&self->_conditionalServiceUnreachableValue, a3);
}

- (CTCallForwardingValue)unconditionalServiceValue
{
  return self->_unconditionalServiceValue;
}

- (void)setUnconditionalServiceValue:(id)a3
{
  objc_storeStrong((id *)&self->_unconditionalServiceValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unconditionalServiceValue, 0);
  objc_storeStrong((id *)&self->_conditionalServiceUnreachableValue, 0);
  objc_storeStrong((id *)&self->_conditionalServiceUnansweredValue, 0);
  objc_storeStrong((id *)&self->_conditionalServiceBusyValue, 0);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_storeStrong((id *)&self->_requestController, 0);
  objc_storeStrong((id *)&self->_carrierBundleController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_unconditionalServiceRequests, 0);
  objc_storeStrong((id *)&self->_subscriptionISOCountryCode, 0);
  objc_storeStrong((id *)&self->_conditionalServiceRequests, 0);
}

@end
