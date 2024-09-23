@implementation LDXPCListener

+ (id)listenerForMachService:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_new(a1);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", v4);
    objc_msgSend(v5, "setListener:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "listener"));
    objc_msgSend(v7, "setDelegate:", v5);

  }
  return v5;
}

- (void)resume
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[LDXPCListener listener](self, "listener"));
  objc_msgSend(v2, "resume");

}

- (void)suspend
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[LDXPCListener listener](self, "listener"));
  objc_msgSend(v2, "suspend");

}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
