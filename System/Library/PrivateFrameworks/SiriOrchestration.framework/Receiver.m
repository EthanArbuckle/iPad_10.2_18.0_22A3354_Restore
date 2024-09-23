@implementation Receiver

- (Receiver)initWithWrappedObject:(id)a3
{
  id v4;
  Receiver *v5;
  Receiver *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)Receiver;
  v5 = -[Receiver init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak(&v5->_wrappedObject, v4);

  return v6;
}

- (id)wrappedObject
{
  return objc_loadWeakRetained(&self->_wrappedObject);
}

- (void)setWrappedObject:(id)a3
{
  objc_storeWeak(&self->_wrappedObject, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_wrappedObject);
}

@end
