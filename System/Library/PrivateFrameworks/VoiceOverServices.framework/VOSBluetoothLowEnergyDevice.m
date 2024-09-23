@implementation VOSBluetoothLowEnergyDevice

- (VOSBluetoothLowEnergyDevice)initWithPeripheral:(id)a3 manager:(id)a4
{
  id v7;
  id v8;
  VOSBluetoothLowEnergyDevice *v9;
  VOSBluetoothLowEnergyDevice *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VOSBluetoothLowEnergyDevice;
  v9 = -[VOSBluetoothLowEnergyDevice init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_peripheral, a3);
    objc_storeStrong((id *)&v10->_centralManager, a4);
  }

  return v10;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[VOSBluetoothLowEnergyDevice name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[VOSBluetoothLowEnergyDevice identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqualToString:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VOSBluetoothLowEnergyDevice name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VOSBluetoothLowEnergyDevice identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VOSBluetoothLowEnergyDevice peripheral](self, "peripheral");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VOSBluetoothLowEnergyDevice centralManager](self, "centralManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%p>: name:'%@' identifier:'%@' CBPeripheral:'%@', CBCentralManager: '%@'"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)identifier
{
  void *v2;
  void *v3;
  void *v4;

  -[VOSBluetoothLowEnergyDevice peripheral](self, "peripheral");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)name
{
  void *v2;
  void *v3;

  -[VOSBluetoothLowEnergyDevice peripheral](self, "peripheral");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)connected
{
  void *v2;
  char v3;

  -[VOSBluetoothLowEnergyDevice peripheral](self, "peripheral");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isConnectedToSystem");

  return v3;
}

- (BOOL)connecting
{
  void *v2;
  BOOL v3;

  -[VOSBluetoothLowEnergyDevice peripheral](self, "peripheral");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state") == 1;

  return v3;
}

- (BOOL)paired
{
  void *v3;

  +[VOSBluetoothManager sharedInstance](VOSBluetoothManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "btleDeviceIsPaired:", self);

  return (char)self;
}

- (void)connect
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  AXLogBrailleHW();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[VOSBluetoothLowEnergyDevice peripheral](self, "peripheral");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v4;
    _os_log_impl(&dword_211371000, v3, OS_LOG_TYPE_DEFAULT, "Attempt connect: Current peripheral state: %@", (uint8_t *)&v11, 0xCu);

  }
  -[VOSBluetoothLowEnergyDevice peripheral](self, "peripheral");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isConnectedToSystem");

  if ((v6 & 1) == 0)
  {
    AXLogBrailleHW();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[VOSBluetoothLowEnergyDevice peripheral](self, "peripheral");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v8;
      _os_log_impl(&dword_211371000, v7, OS_LOG_TYPE_DEFAULT, "Connecting: %@", (uint8_t *)&v11, 0xCu);

    }
    -[VOSBluetoothLowEnergyDevice centralManager](self, "centralManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VOSBluetoothLowEnergyDevice peripheral](self, "peripheral");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "connectPeripheral:options:", v10, 0);

  }
}

- (void)disconnect
{
  void *v3;
  id v4;

  -[VOSBluetoothLowEnergyDevice centralManager](self, "centralManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[VOSBluetoothLowEnergyDevice peripheral](self, "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelPeripheralConnection:options:", v3, 0);

}

- (void)unpair
{
  id v3;

  +[VOSBluetoothManager sharedInstance](VOSBluetoothManager, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unpairBTLEDevice:", self);

}

- (id)address
{
  void *v2;
  void *v3;
  void *v4;

  -[VOSBluetoothLowEnergyDevice peripheral](self, "peripheral");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)peripheral
{
  return self->_peripheral;
}

- (void)setPeripheral:(id)a3
{
  objc_storeStrong((id *)&self->_peripheral, a3);
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_peripheral, 0);
}

@end
