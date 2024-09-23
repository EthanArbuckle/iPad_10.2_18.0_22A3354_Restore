@implementation _TPSXPCExportedObjectProxy

- (void)setWeakExportedObjectClass:(Class)a3
{
  objc_storeStrong((id *)&self->_weakExportedObjectClass, a3);
}

- (void)setWeakExportedObject:(id)a3
{
  id *p_weakExportedObject;
  id v5;
  uint64_t v6;

  p_weakExportedObject = &self->_weakExportedObject;
  v5 = a3;
  objc_storeWeak(p_weakExportedObject, v5);
  v6 = objc_opt_class();

  -[_TPSXPCExportedObjectProxy setWeakExportedObjectClass:](self, "setWeakExportedObjectClass:", v6);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;

  -[_TPSXPCExportedObjectProxy weakExportedObject](self, "weakExportedObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "methodSignatureForSelector:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[objc_class instanceMethodSignatureForSelector:](-[_TPSXPCExportedObjectProxy weakExportedObjectClass](self, "weakExportedObjectClass"), "instanceMethodSignatureForSelector:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)forwardInvocation:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_TPSXPCExportedObjectProxy weakExportedObject](self, "weakExportedObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v5, "invokeWithTarget:", v4);

}

- (id)weakExportedObject
{
  return objc_loadWeakRetained(&self->_weakExportedObject);
}

- (Class)weakExportedObjectClass
{
  return self->_weakExportedObjectClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weakExportedObjectClass, 0);
  objc_destroyWeak(&self->_weakExportedObject);
}

@end
