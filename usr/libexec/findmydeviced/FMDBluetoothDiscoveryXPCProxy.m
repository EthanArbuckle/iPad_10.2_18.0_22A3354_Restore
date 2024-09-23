@implementation FMDBluetoothDiscoveryXPCProxy

- (void)startDiscovery
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryXPCProxy connection](self, "connection"));
  v4 = v3;
  if (v3 && objc_msgSend(v3, "state") == (id)1)
  {
    v5 = v4;
  }
  else
  {
    v6 = objc_alloc((Class)FMNSXPCConnection);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMNSXPCConnectionConfiguration btDiscoveryConfiguration](FMNSXPCConnectionConfiguration, "btDiscoveryConfiguration"));
    v5 = objc_msgSend(v6, "initWithConfiguration:exportedObject:", v7, self);

    objc_initWeak(&location, self);
    v9 = _NSConcreteStackBlock;
    v10 = 3221225472;
    v11 = sub_1000A6F2C;
    v12 = &unk_1002C4BB8;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v5, "addFailureBlock:", &v9);
    -[FMDBluetoothDiscoveryXPCProxy setConnection:](self, "setConnection:", v5, v9, v10, v11, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxy"));
  objc_msgSend(v8, "startDiscovery");

}

- (void)stopDiscovery
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryXPCProxy connection](self, "connection"));
  if (v2)
  {
    v4 = v2;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "remoteObjectProxy"));
    objc_msgSend(v3, "stopDiscovery");

    v2 = v4;
  }

}

- (void)didEndDiscoveryWithError:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  if (v4)
  {
    v5 = sub_1000031B8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10022CCC4((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);

  }
  -[FMDBluetoothDiscoveryXPCProxy _didEndDiscoveryWithError:](self, "_didEndDiscoveryWithError:", v4);

}

- (void)didDiscoverDevice:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryXPCProxy didDiscoverDevice](self, "didDiscoverDevice"));

  if (v4)
  {
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryXPCProxy didDiscoverDevice](self, "didDiscoverDevice"));
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (void)didLoseDevice:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryXPCProxy didLoseDevice](self, "didLoseDevice"));

  if (v4)
  {
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryXPCProxy didLoseDevice](self, "didLoseDevice"));
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (void)_didEndDiscoveryWithError:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryXPCProxy didEndDiscovery](self, "didEndDiscovery"));
  v5 = (void *)v4;
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);

}

- (id)didEndDiscovery
{
  return self->_didEndDiscovery;
}

- (void)setDidEndDiscovery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)didDiscoverDevice
{
  return self->_didDiscoverDevice;
}

- (void)setDidDiscoverDevice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)didLoseDevice
{
  return self->_didLoseDevice;
}

- (void)setDidLoseDevice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (FMNSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_didLoseDevice, 0);
  objc_storeStrong(&self->_didDiscoverDevice, 0);
  objc_storeStrong(&self->_didEndDiscovery, 0);
}

@end
