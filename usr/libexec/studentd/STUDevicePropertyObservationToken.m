@implementation STUDevicePropertyObservationToken

+ (id)tokenForTransport:(id)a3 XPCPrimitives:(id)a4 device:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(objc_alloc((Class)a1), "initWithTransport:XPCPrimitives:device:", v10, v9, v8);

  if (objc_msgSend(v11, "isObserving"))
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  return v13;
}

- (void)dealloc
{
  id v3;
  objc_super v4;
  _QWORD block[4];
  id v6;

  if (self->_observing)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100069B80;
    block[3] = &unk_1000C97E8;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[STUDevicePropertyObservationToken device](self, "device"));
    v3 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  v4.receiver = self;
  v4.super_class = (Class)STUDevicePropertyObservationToken;
  -[STUDevicePropertyObservationToken dealloc](&v4, "dealloc");
}

- (STUDevicePropertyObservationToken)initWithTransport:(id)a3 XPCPrimitives:(id)a4 device:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  STUDevicePropertyObservationToken *v12;
  STUDevicePropertyObservationToken *v13;
  STUDevicePropertyObservationToken *v14;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = objc_opt_class(STUXPCTransport);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    v12 = -[STUDevicePropertyObservationToken initWithXPCTransport:XPCPrimitives:device:](self, "initWithXPCTransport:XPCPrimitives:device:", v10, v8, v9);
  else
    v12 = -[STUDevicePropertyObservationToken initWithNonXPCTransport:device:](self, "initWithNonXPCTransport:device:", v10, v9);
  v13 = v12;

  v14 = v13;
  return v14;
}

- (STUDevicePropertyObservationToken)initWithXPCTransport:(id)a3 XPCPrimitives:(id)a4 device:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  STUDevicePropertyObservationToken *v17;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "XPCConnection"));
  v12 = -[STUDevicePropertyObservationToken BOOLValueForEntitlement:onConnection:XPCPrimitives:](self, "BOOLValueForEntitlement:onConnection:XPCPrimitives:", CFSTR("com.apple.studentd.device-property-access"), v11, v10);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v8, "processIdentifier")));
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("pid %@"), v16));

  }
  v17 = -[STUDevicePropertyObservationToken initWithName:hasAccess:device:](self, "initWithName:hasAccess:device:", v15, v12, v9);

  return v17;
}

- (BOOL)BOOLValueForEntitlement:(id)a3 onConnection:(id)a4 XPCPrimitives:(id)a5
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  unsigned __int8 v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "valueForEntitlement:onConnection:", a3, a4));
  v6 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;
  v9 = objc_msgSend(v8, "BOOLValue");

  return v9;
}

- (STUDevicePropertyObservationToken)initWithNonXPCTransport:(id)a3 device:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  STUDevicePropertyObservationToken *v11;

  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "name"));
  v8 = (void *)v7;
  v9 = CFSTR("non-XPC transport");
  if (v7)
    v9 = (__CFString *)v7;
  v10 = v9;

  v11 = -[STUDevicePropertyObservationToken initWithName:hasAccess:device:](self, "initWithName:hasAccess:device:", v10, 1, v6);
  return v11;
}

- (STUDevicePropertyObservationToken)initWithName:(id)a3 hasAccess:(BOOL)a4 device:(id)a5
{
  id v8;
  id v9;
  STUDevicePropertyObservationToken *v10;
  NSString *v11;
  NSString *name;
  objc_super v14;

  v8 = a3;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)STUDevicePropertyObservationToken;
  v10 = -[STUDevicePropertyObservationToken init](&v14, "init");
  if (v10)
  {
    v11 = (NSString *)objc_msgSend(v8, "copy");
    name = v10->_name;
    v10->_name = v11;

    v10->_observing = a4;
    objc_storeStrong((id *)&v10->_device, a5);
    if (v10->_observing)
      -[STUDevice startObservingChanges](v10->_device, "startObservingChanges");
  }

  return v10;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  unsigned int v5;
  const __CFString *v6;
  void *v7;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevicePropertyObservationToken name](self, "name"));
  v5 = -[STUDevicePropertyObservationToken isObserving](self, "isObserving");
  v6 = CFSTR("NO");
  if (v5)
    v6 = CFSTR("YES");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p { name = %@, observing = %@ }>"), v3, self, v4, v6));

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isObserving
{
  return self->_observing;
}

- (void)setObserving:(BOOL)a3
{
  self->_observing = a3;
}

- (STUXPCPrimitives)XPCPrimitives
{
  return self->_XPCPrimitives;
}

- (STUDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_XPCPrimitives, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
