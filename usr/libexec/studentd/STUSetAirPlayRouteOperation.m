@implementation STUSetAirPlayRouteOperation

- (void)cancel
{
  _QWORD block[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STUSetAirPlayRouteOperation;
  -[STUTaskOperation cancel](&v4, "cancel");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003F258;
  block[3] = &unk_1000C97E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)operationWillFinish
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUSetAirPlayRouteOperation;
  -[STUTaskOperation operationWillFinish](&v3, "operationWillFinish");
  -[STUSetAirPlayRouteOperation setSetOutputDeviceOperation:](self, "setSetOutputDeviceOperation:", 0);
  -[STUSetAirPlayRouteOperation setSearchForOutputDeviceOperation:](self, "setSearchForOutputDeviceOperation:", 0);
}

- (void)endOperationWithError:(id)a3
{
  void *v4;
  objc_super v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetAirPlayRouteOperation DMFErrorByTranslatingCRKErrorIfNeeded:](self, "DMFErrorByTranslatingCRKErrorIfNeeded:", a3));
  v5.receiver = self;
  v5.super_class = (Class)STUSetAirPlayRouteOperation;
  -[STUSetAirPlayRouteOperation endOperationWithError:](&v5, "endOperationWithError:", v4);

}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___STUSetAirPlayRouteOperation;
  if (!objc_msgSendSuper2(&v12, "validateRequest:error:", v6, a4))
    goto LABEL_7;
  v7 = objc_opt_class(DMFSetAirPlayRouteRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    v8 = objc_opt_class(CRKSetAirPlayRouteRequest);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
    {
      if (a4)
      {
        v10 = CATErrorWithCodeAndUserInfo(2, &off_1000D38A8);
        v9 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue(v10);
        goto LABEL_8;
      }
LABEL_7:
      v9 = 0;
      goto LABEL_8;
    }
  }
  v9 = 1;
LABEL_8:

  return v9;
}

- (void)runWithRequest:(id)a3
{
  void *v4;
  void *v5;
  STUScreenObserveFeature *v6;
  void *v7;
  void *v8;
  STUScreenObserveFeature *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context", a3));
  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enrollmentRecord"));

  if (v17)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetAirPlayRouteOperation routeUID](self, "routeUID"));

    if (v5)
    {
      v6 = [STUScreenObserveFeature alloc];
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "configurationManager"));
      v9 = -[STUScreenObserveFeature initWithEnrollmentRecord:configurationManager:](v6, "initWithEnrollmentRecord:configurationManager:", v17, v8);

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[STUAskAlertModelFactory sharedFactory](STUAskAlertModelFactory, "sharedFactory"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation instructorName](self, "instructorName"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "airPlayTextWithInstructorName:", v11));

      -[STUTaskOperation askUserPermissionForFeature:alertModel:](self, "askUserPermissionForFeature:alertModel:", v9, v12);
    }
    else
    {
      v9 = (STUScreenObserveFeature *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[STUScreenObserveFeature primitives](v9, "primitives"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "airPlayPrimitives"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localOutputDevice"));
      -[STUSetAirPlayRouteOperation setOutputDevice:](self, "setOutputDevice:", v16);

    }
  }
  else
  {
    v13 = CRKErrorWithCodeAndUserInfo(16, 0);
    v9 = (STUScreenObserveFeature *)objc_claimAutoreleasedReturnValue(v13);
    -[STUSetAirPlayRouteOperation endOperationWithError:](self, "endOperationWithError:", v9);
  }

}

- (void)askOperationDidFinish:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUSetAirPlayRouteOperation.m"), 101, CFSTR("%@ must be called from the main thread"), v11);

  }
  if (-[STUSetAirPlayRouteOperation isCanceled](self, "isCanceled"))
  {
    v5 = CATErrorWithCodeAndUserInfo(404, 0);
    v6 = objc_claimAutoreleasedReturnValue(v5);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "error"));

    if (!v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetAirPlayRouteOperation makeSearchForOutputDeviceOperation](self, "makeSearchForOutputDeviceOperation"));
      objc_msgSend(v8, "addTarget:selector:forOperationEvents:", self, "searchForOutputDeviceOperationDidFinish:", 6);
      -[STUSetAirPlayRouteOperation setSearchForOutputDeviceOperation:](self, "setSearchForOutputDeviceOperation:", v8);
      -[STUTaskOperation enqueueOperation:](self, "enqueueOperation:", v8);
      goto LABEL_8;
    }
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "error"));
  }
  v8 = (void *)v6;
  -[STUSetAirPlayRouteOperation endOperationWithError:](self, "endOperationWithError:", v6);
LABEL_8:

}

- (void)searchForOutputDeviceOperationDidFinish:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  id v14;

  v14 = a3;
  if (-[STUSetAirPlayRouteOperation isExecuting](self, "isExecuting"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "error"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "error"));
      -[STUSetAirPlayRouteOperation endOperationWithError:](self, "endOperationWithError:", v6);
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "resultObject"));
      v8 = objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___CRKOutputDevice);

      if ((v8 & 1) == 0)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "resultObject"));
        v11 = (objc_class *)objc_opt_class(v10);
        v12 = NSStringFromClass(v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUSetAirPlayRouteOperation.m"), 132, CFSTR("expected view model to conform to %@, “%@” does not"), CFSTR("CRKOutputDevice"), v13);

      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "resultObject"));
      -[STUSetAirPlayRouteOperation setOutputDevice:](self, "setOutputDevice:", v6);
    }

  }
}

- (void)setOutputDeviceOperationDidFinish:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[STUSetAirPlayRouteOperation isExecuting](self, "isExecuting"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "error"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "error"));
      -[STUSetAirPlayRouteOperation endOperationWithError:](self, "endOperationWithError:", v5);

    }
    else
    {
      -[STUSetAirPlayRouteOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
    }
  }

}

- (double)timeoutInterval
{
  void *v2;
  double v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  if (objc_msgSend(v2, "crk_isBeingTested"))
    v3 = 0.100000001;
  else
    v3 = 30.0;

  return v3;
}

- (id)deviceIDForRouteUID:(id)a3
{
  return _objc_msgSend(a3, "crk_stringByRemovingSuffix:", CFSTR("-screen"));
}

- (id)makeSearchForOutputDeviceOperation
{
  void *v3;
  void *v4;
  STUSearchForOutputDeviceOperation *v5;
  void *v6;
  void *v7;
  void *v8;
  STUSearchForOutputDeviceOperation *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetAirPlayRouteOperation routeUID](self, "routeUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetAirPlayRouteOperation deviceIDForRouteUID:](self, "deviceIDForRouteUID:", v3));

  v5 = [STUSearchForOutputDeviceOperation alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "primitives"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "airPlayPrimitives"));
  v9 = -[STUSearchForOutputDeviceOperation initWithDeviceID:airPlayPlayPrimitives:](v5, "initWithDeviceID:airPlayPlayPrimitives:", v4, v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "primitives"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "timerPrimitives"));
  v13 = objc_msgSend((id)objc_opt_class(self), "searchForOutputDeviceTimeoutTimerIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[STUSetAirPlayRouteOperation timeoutInterval](self, "timeoutInterval");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[STUSearchForOutputDeviceOperation crk_timingOutOperationWithTimerPrimitives:operationQueue:timerIdentifier:timeout:](v9, "crk_timingOutOperationWithTimerPrimitives:operationQueue:timerIdentifier:timeout:", v12, self, v14));

  return v15;
}

- (id)makeSetOutputDeviceOperationForDevice:(id)a3
{
  id v4;
  STUSetOutputDeviceOperation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  STUSetOutputDeviceOperation *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = [STUSetOutputDeviceOperation alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "primitives"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "airPlayPrimitives"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetAirPlayRouteOperation password](self, "password"));
  v10 = -[STUSetOutputDeviceOperation initWithOutputDevice:airPlayPrimitives:password:suppressPrompt:](v5, "initWithOutputDevice:airPlayPrimitives:password:suppressPrompt:", v4, v8, v9, -[STUSetAirPlayRouteOperation suppressPasscodePrompt](self, "suppressPasscodePrompt"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "primitives"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "timerPrimitives"));
  v14 = objc_msgSend((id)objc_opt_class(self), "setOutputDeviceTimeoutTimerIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  -[STUSetAirPlayRouteOperation timeoutInterval](self, "timeoutInterval");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetOutputDeviceOperation crk_timingOutOperationWithTimerPrimitives:operationQueue:timerIdentifier:timeout:](v10, "crk_timingOutOperationWithTimerPrimitives:operationQueue:timerIdentifier:timeout:", v13, self, v15));

  return v16;
}

- (void)setOutputDevice:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[STUSetAirPlayRouteOperation makeSetOutputDeviceOperationForDevice:](self, "makeSetOutputDeviceOperationForDevice:", a3));
  objc_msgSend(v4, "addTarget:selector:forOperationEvents:", self, "setOutputDeviceOperationDidFinish:", 6);
  -[STUSetAirPlayRouteOperation setSetOutputDeviceOperation:](self, "setSetOutputDeviceOperation:", v4);
  -[STUTaskOperation enqueueOperation:](self, "enqueueOperation:", v4);

}

+ (id)searchForOutputDeviceTimeoutTimerIdentifier
{
  NSString *v2;
  void *v3;
  void *v4;

  v2 = NSStringFromClass((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-searchForOutputDeviceTimeoutTimer"), v3));

  return v4;
}

+ (id)setOutputDeviceTimeoutTimerIdentifier
{
  NSString *v2;
  void *v3;
  void *v4;

  v2 = NSStringFromClass((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-setOutputDeviceTimeoutTimer"), v3));

  return v4;
}

- (id)routeUID
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetAirPlayRouteOperation request](self, "request"));
  v4 = objc_opt_class(DMFSetAirPlayRouteRequest);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetAirPlayRouteOperation request](self, "request"));
  v8 = objc_opt_class(CRKSetAirPlayRouteRequest);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "routeUID"));
  if (v11)
    v12 = v11;
  else
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeUID"));
  v13 = v12;

  return v13;
}

- (id)password
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetAirPlayRouteOperation request](self, "request"));
  v4 = objc_opt_class(DMFSetAirPlayRouteRequest);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetAirPlayRouteOperation request](self, "request"));
  v8 = objc_opt_class(CRKSetAirPlayRouteRequest);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "password"));
  if (v11)
    v12 = v11;
  else
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "password"));
  v13 = v12;

  return v13;
}

- (BOOL)suppressPasscodePrompt
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  unsigned __int8 v11;
  unsigned __int8 v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetAirPlayRouteOperation request](self, "request"));
  v4 = objc_opt_class(DMFSetAirPlayRouteRequest);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetAirPlayRouteOperation request](self, "request"));
  v8 = objc_opt_class(CRKSetAirPlayRouteRequest);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  v11 = objc_msgSend(v10, "suppressPasscodePrompt");
  if ((v11 & 1) != 0)
    v12 = 1;
  else
    v12 = objc_msgSend(v6, "suppressPasscodePrompt");

  return v12;
}

- (BOOL)isRequestDMF
{
  void *v2;
  uint64_t v3;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetAirPlayRouteOperation request](self, "request"));
  v3 = objc_opt_class(DMFSetAirPlayRouteRequest);
  isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  return isKindOfClass & 1;
}

- (id)DMFErrorByTranslatingCRKErrorIfNeeded:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (-[STUSetAirPlayRouteOperation isRequestDMF](self, "isRequestDMF"))
    v5 = (id)objc_claimAutoreleasedReturnValue(-[STUSetAirPlayRouteOperation DMFErrorByTranslatingCRKError:](self, "DMFErrorByTranslatingCRKError:", v4));
  else
    v5 = v4;
  v6 = v5;

  return v6;
}

- (id)DMFErrorByTranslatingCRKError:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  v5 = objc_msgSend(v4, "isEqualToString:", CRKErrorDomain);

  if (!v5)
    goto LABEL_7;
  if (objc_msgSend(v3, "code") != (id)128)
  {
    if (objc_msgSend(v3, "code") == (id)129)
    {
      v6 = 105;
      goto LABEL_6;
    }
LABEL_7:
    v8 = v3;
    goto LABEL_8;
  }
  v6 = 104;
LABEL_6:
  v7 = DMFErrorWithCodeAndUserInfo(v6, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue(v7);
LABEL_8:
  v9 = v8;

  return v9;
}

- (CATOperation)setOutputDeviceOperation
{
  return self->_setOutputDeviceOperation;
}

- (void)setSetOutputDeviceOperation:(id)a3
{
  objc_storeStrong((id *)&self->_setOutputDeviceOperation, a3);
}

- (CATOperation)searchForOutputDeviceOperation
{
  return self->_searchForOutputDeviceOperation;
}

- (void)setSearchForOutputDeviceOperation:(id)a3
{
  objc_storeStrong((id *)&self->_searchForOutputDeviceOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchForOutputDeviceOperation, 0);
  objc_storeStrong((id *)&self->_setOutputDeviceOperation, 0);
}

@end
