@implementation WiFiP2PXPCExportedObjectProxy

- (void)setExportedObject:(id)a3
{
  id *p_exportedObject;
  id v5;
  objc_class *v6;

  p_exportedObject = &self->_exportedObject;
  v5 = a3;
  objc_storeWeak(p_exportedObject, v5);
  v6 = (objc_class *)objc_opt_class();

  self->_exportedObjectClass = v6;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;

  -[WiFiP2PXPCExportedObjectProxy exportedObject](self, "exportedObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "methodSignatureForSelector:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[objc_class instanceMethodSignatureForSelector:](self->_exportedObjectClass, "instanceMethodSignatureForSelector:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)forwardInvocation:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[WiFiP2PXPCExportedObjectProxy exportedObject](self, "exportedObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v5, "invokeWithTarget:", v4);

}

- (id)exportedObject
{
  return objc_loadWeakRetained(&self->_exportedObject);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_exportedObject);
}

@end
