@implementation DMDConfigurationSourceController

- (DMDConfigurationSourceController)initWithConfigurationSource:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  DMDConfigurationSourceController *v10;
  uint64_t v11;
  NSString *identifier;
  CATSerialOperationQueue *v13;
  CATSerialOperationQueue *queue;
  void *v16;
  void *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDConfigurationSourceController.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("source"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));

  if (!v9)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDConfigurationSourceController.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("source.identifier"));

  }
  v18.receiver = self;
  v18.super_class = (Class)DMDConfigurationSourceController;
  v10 = -[DMDConfigurationSourceController init](&v18, "init");
  if (v10)
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    objc_storeWeak((id *)&v10->_delegate, v8);
    v13 = objc_opt_new(CATSerialOperationQueue);
    queue = v10->_queue;
    v10->_queue = v13;

    -[DMDConfigurationSourceController updateWithConfigurationSource:](v10, "updateWithConfigurationSource:", v7);
  }

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[2];

  v7[0] = CFSTR("identifier");
  v7[1] = CFSTR("displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2));
  v4 = DMFObjectDescriptionWithProperties(self, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[2];

  v7[0] = CFSTR("source");
  v7[1] = CFSTR("queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2));
  v4 = DMFObjectDescriptionWithProperties(self, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (NSString)organizationIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceController source](self, "source"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "organizationIdentifier"));

  return (NSString *)v3;
}

- (NSString)displayName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceController source](self, "source"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "displayName"));

  return (NSString *)v3;
}

- (void)updateWithConfigurationSource:(id)a3
{
  void *v5;
  void *v6;
  unsigned __int8 v7;
  DMDConfigurationSourceRepresentation *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceController identifier](self, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDConfigurationSourceController.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self.identifier isEqualToString:source.identifier]"));

  }
  v8 = -[DMDConfigurationSourceRepresentation initWithConfigurationSource:]([DMDConfigurationSourceRepresentation alloc], "initWithConfigurationSource:", v10);
  -[DMDConfigurationSourceController setSource:](self, "setSource:", v8);

  -[DMDConfigurationSourceController updateStatusChangeListener](self, "updateStatusChangeListener");
  -[DMDConfigurationSourceController statusForSourceDidChange:](self, "statusForSourceDidChange:", 0);

}

- (DMFConfigurationSource)configurationSource
{
  DMFConfigurationSource *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_opt_new(DMFConfigurationSource);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceController source](self, "source"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  -[DMFConfigurationSource setIdentifier:](v3, "setIdentifier:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceController source](self, "source"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));
  -[DMFConfigurationSource setDisplayName:](v3, "setDisplayName:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceController source](self, "source"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "machServiceName"));
  -[DMFConfigurationSource setMachServiceName:](v3, "setMachServiceName:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceController source](self, "source"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "reportingRequirements"));
  -[DMFConfigurationSource setReportingRequirements:](v3, "setReportingRequirements:", v11);

  return v3;
}

- (void)updateStatusChangeListener
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "statusForSourceDidChange:", CFSTR("DMDConfigurationSourceStatusDidChange"), 0);

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "eventsForSourceDidChange:", CFSTR("DMDConfigurationSourceEventsDidChange"), 0);

}

- (void)statusForSourceDidChange:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v15 = a3;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    if (v15)
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "object"));
    else
      v5 = objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceController organizationIdentifier](self, "organizationIdentifier"));
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceController organizationIdentifier](self, "organizationIdentifier"));
    v8 = objc_msgSend(v7, "isEqualToString:", v6);

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceController source](self, "source"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "reportingRequirements"));

      v11 = 10.0;
      v12 = 3.0;
      if (v10)
      {
        objc_msgSend(v10, "updateCoalescenceInterval");
        if (v13 > DMFReportingRequirementsUpdateCoalescenceIntervalDefault)
        {
          objc_msgSend(v10, "updateCoalescenceInterval");
          v12 = v14;
          v11 = v14;
        }
      }
      +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "reportStatus", 0);
      -[DMDConfigurationSourceController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "reportStatus", 0, v12);
      if (v11 > v12)
        -[DMDConfigurationSourceController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "reportStatusTimeout", 0, v11);

    }
  }
  else
  {
    -[DMDConfigurationSourceController performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, v15, 0);
  }

}

- (void)reportStatusTimeout
{
  -[DMDConfigurationSourceController reportStatus](self, "reportStatus");
}

- (void)reportStatus
{
  uint64_t v3;
  NSObject *v4;
  DMDConfigurationSourceStatusUpdateOperation *v5;
  void *v6;

  v3 = DMFConfigurationEngineLog(+[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "reportStatusTimeout", 0));
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_1000745BC(self);

  v5 = -[DMDConfigurationSourceTaskOperation initWithController:]([DMDConfigurationSourceStatusUpdateOperation alloc], "initWithController:", self);
  -[DMDConfigurationSourceTaskOperation setController:](v5, "setController:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceController queue](self, "queue"));
  objc_msgSend(v6, "addOperation:", v5);

}

- (void)eventsForSourceDidChange:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v15 = a3;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    if (v15)
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "object"));
    else
      v5 = objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceController organizationIdentifier](self, "organizationIdentifier"));
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceController organizationIdentifier](self, "organizationIdentifier"));
    v8 = objc_msgSend(v7, "isEqualToString:", v6);

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceController source](self, "source"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "reportingRequirements"));

      v11 = 10.0;
      v12 = 3.0;
      if (v10)
      {
        objc_msgSend(v10, "updateCoalescenceInterval");
        if (v13 > DMFReportingRequirementsUpdateCoalescenceIntervalDefault)
        {
          objc_msgSend(v10, "updateCoalescenceInterval");
          v12 = v14;
          v11 = v14;
        }
      }
      +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "reportEvents", 0);
      -[DMDConfigurationSourceController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "reportEvents", 0, 3.0);
      if (v11 > v12)
        -[DMDConfigurationSourceController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "reportEventsTimeout", 0, 10.0);

    }
  }
  else
  {
    -[DMDConfigurationSourceController performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, v15, 0);
  }

}

- (void)reportEventsTimeout
{
  -[DMDConfigurationSourceController reportEvents](self, "reportEvents");
}

- (void)reportEvents
{
  uint64_t v3;
  NSObject *v4;
  DMDConfigurationSourceEventsOperation *v5;
  void *v6;

  v3 = DMFConfigurationEngineLog(+[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "reportEventsTimeout", 0));
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100074638(self);

  v5 = -[DMDConfigurationSourceTaskOperation initWithController:]([DMDConfigurationSourceEventsOperation alloc], "initWithController:", self);
  -[DMDConfigurationSourceTaskOperation setController:](v5, "setController:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceController queue](self, "queue"));
  objc_msgSend(v6, "addOperation:", v5);

}

- (void)resolveAssetWithContext:(id)a3
{
  id v4;
  void *v5;
  DMDConfigurationSourceAssetResolveOperation *v6;

  v4 = a3;
  v6 = -[DMDConfigurationSourceTaskOperation initWithController:]([DMDConfigurationSourceAssetResolveOperation alloc], "initWithController:", self);
  -[DMDConfigurationSourceAssetResolveOperation setContext:](v6, "setContext:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceController queue](self, "queue"));
  objc_msgSend(v5, "addOperation:", v6);

}

- (DMDConfigurationSourceControllerDelegate)delegate
{
  return (DMDConfigurationSourceControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (CATSerialOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (DMDConfigurationSourceRepresentation)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
