@implementation NIExportedObjectForwarder

- (NIExportedObjectForwarder)initWithExportedObject:(id)a3
{
  id v5;
  NIExportedObjectForwarder *v6;
  NIExportedObjectForwarder *v7;
  uint64_t v8;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerConnection.m"), 163, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("object"));

  }
  v11.receiver = self;
  v11.super_class = (Class)NIExportedObjectForwarder;
  v6 = -[NIExportedObjectForwarder init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    -[NIExportedObjectForwarder setExportedObject:](v6, "setExportedObject:", v5);
    -[NIExportedObjectForwarder setExportedObjectClass:](v7, "setExportedObjectClass:", objc_opt_class(v5, v8));
  }

  return v7;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return -[NIExportedObjectForwarder exportedObject](self, "exportedObject", a3);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return -[objc_class instanceMethodSignatureForSelector:](-[NIExportedObjectForwarder exportedObjectClass](self, "exportedObjectClass"), "instanceMethodSignatureForSelector:", a3);
}

- (id)exportedObject
{
  return objc_loadWeakRetained(&self->_exportedObject);
}

- (void)setExportedObject:(id)a3
{
  objc_storeWeak(&self->_exportedObject, a3);
}

- (Class)exportedObjectClass
{
  return self->_exportedObjectClass;
}

- (void)setExportedObjectClass:(Class)a3
{
  objc_storeStrong((id *)&self->_exportedObjectClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportedObjectClass, 0);
  objc_destroyWeak(&self->_exportedObject);
}

@end
