@implementation BluetoothHCEAndTransactionSession

- (BluetoothHCEAndTransactionSession)initWithDelegate:(id)a3
{
  id v5;
  BluetoothHCEAndTransactionSession *v6;
  BluetoothHCEAndTransactionSession *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BluetoothHCEAndTransactionSession;
  v6 = -[BluetoothHCEAndTransactionSession init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->delegate, a3);

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AlishaPairingExternal shared](_TtC10seserviced21AlishaPairingExternal, "shared"));
  objc_msgSend(v3, "stopOwnerPairing");

  v4.receiver = self;
  v4.super_class = (Class)BluetoothHCEAndTransactionSession;
  -[BluetoothHCEAndTransactionSession dealloc](&v4, "dealloc");
}

- (void)startHceEmulation
{
  int64_t *p_token;
  int64_t token;
  void *v5;
  _QWORD block[5];

  token = self->token;
  p_token = &self->token;
  block[4] = self;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005AEC4;
  block[3] = &unk_100302AA0;
  if (token != -1)
    dispatch_once(p_token, block);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AlishaPairingExternal shared](_TtC10seserviced21AlishaPairingExternal, "shared"));
  objc_msgSend(v5, "startHceEmulation");

}

- (void)stopHceEmulation
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[AlishaPairingExternal shared](_TtC10seserviced21AlishaPairingExternal, "shared"));
  objc_msgSend(v2, "stopHceEmulation");

}

- (void)startTransactionEmulationForKeyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[AlishaPairingExternal shared](_TtC10seserviced21AlishaPairingExternal, "shared"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hexStringAsData"));

  objc_msgSend(v5, "startTransactionEmulationFor:", v4);
}

- (void)stopTransactionEmulation
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[AlishaPairingExternal shared](_TtC10seserviced21AlishaPairingExternal, "shared"));
  objc_msgSend(v2, "stopTransactionEmulation");

}

- (void)pairingEndedWithResult:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[AlishaPairingExternal shared](_TtC10seserviced21AlishaPairingExternal, "shared"));
  objc_msgSend(v4, "pairingEndedWithError:", v3);

}

- (void)endSession
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[AlishaPairingExternal shared](_TtC10seserviced21AlishaPairingExternal, "shared"));
  objc_msgSend(v2, "endSession");

}

- (id)readAPDU
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AlishaPairingExternal shared](_TtC10seserviced21AlishaPairingExternal, "shared"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "readAPDU"));

  return v3;
}

- (id)sendAPDU:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AlishaPairingExternal shared](_TtC10seserviced21AlishaPairingExternal, "shared"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sendAPDU:", v3));

  return v5;
}

+ (void)startFirstApproachForKeyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[AlishaPairingExternal shared](_TtC10seserviced21AlishaPairingExternal, "shared"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hexStringAsData"));

  objc_msgSend(v5, "startFirstApproachFor:", v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->delegate, 0);
}

@end
