@implementation _PASXPCListener

- (_PASXPCListener)initWithDelegate:(id)a3 serviceName:(id)a4 displayName:(id)a5
{
  id v9;
  id v10;
  id v11;
  _PASXPCListener *v12;
  _PASXPCListener *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_PASXPCListener;
  v12 = -[_PASXPCListener init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_delegate, a3);
    objc_storeStrong((id *)&v13->_serviceName, a4);
    objc_storeStrong((id *)&v13->_displayName, a5);
  }

  return v13;
}

- (NSXPCListenerDelegate)delegate
{
  return self->_delegate;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
