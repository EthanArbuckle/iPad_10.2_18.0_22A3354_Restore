@implementation STUDevicePropertyObservationGatekeeper

- (STUDevicePropertyObservationGatekeeper)initWithXPCPrimitives:(id)a3 device:(id)a4
{
  id v7;
  id v8;
  STUDevicePropertyObservationGatekeeper *v9;
  STUDevicePropertyObservationGatekeeper *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)STUDevicePropertyObservationGatekeeper;
  v9 = -[STUDevicePropertyObservationGatekeeper init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_XPCPrimitives, a3);
    objc_storeStrong((id *)&v10->_device, a4);
  }

  return v10;
}

- (void)beginObservationForSession:(id)a3
{
  id AssociatedObject;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  void *v12;
  id object;

  object = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUDevicePropertyObservationGatekeeper.m"), 28, CFSTR("%@ must be called from the main thread"), v12);

  }
  AssociatedObject = objc_getAssociatedObject(object, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(object, "transport"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevicePropertyObservationGatekeeper XPCPrimitives](self, "XPCPrimitives"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevicePropertyObservationGatekeeper device](self, "device"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[STUDevicePropertyObservationToken tokenForTransport:XPCPrimitives:device:](STUDevicePropertyObservationToken, "tokenForTransport:XPCPrimitives:device:", v7, v8, v9));

    if (v6)
      objc_setAssociatedObject(object, a2, v6, (void *)0x301);
  }

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
}

@end
