@implementation SDHeadphoneFeatureManager

- (SDHeadphoneFeatureManager)initWithBluetoothAddress:(id)a3 productID:(unsigned int)a4
{
  id v6;
  SDHeadphoneFeatureManager *v7;
  NSString *v8;
  NSString *bluetoothAddressString;
  uint64_t v10;
  BluetoothManager *btManager;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  unsigned int v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];

  v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SDHeadphoneFeatureManager;
  v7 = -[SDHeadphoneFeatureManager init](&v26, "init");
  v8 = (NSString *)objc_msgSend(v6, "copy");
  bluetoothAddressString = v7->_bluetoothAddressString;
  v7->_bluetoothAddressString = v8;

  v7->_productID = a4;
  if (dword_1007B1570 <= 30 && (dword_1007B1570 != -1 || _LogCategory_Initialize(&dword_1007B1570, 30)))
    LogPrintF(&dword_1007B1570, "-[SDHeadphoneFeatureManager initWithBluetoothAddress:productID:]", 30, "starting SDHeadphoneFeatureManager for device with address:%@", v7->_bluetoothAddressString);
  v10 = objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
  btManager = v7->_btManager;
  v7->_btManager = (BluetoothManager *)v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BluetoothManager pairedDevices](v7->_btManager, "pairedDevices"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "address"));
        v20 = objc_msgSend(v19, "isEqualToString:", v7->_bluetoothAddressString);

        if (v20)
        {
          objc_storeStrong((id *)&v7->_bluetoothDevice, v18);
          if (dword_1007B1570 <= 30
            && (dword_1007B1570 != -1 || _LogCategory_Initialize(&dword_1007B1570, 30)))
          {
            LogPrintF(&dword_1007B1570, "-[SDHeadphoneFeatureManager initWithBluetoothAddress:productID:]", 30, "SD Headphone Feature Manager with device:%@", v7->_bluetoothDevice);
          }
          goto LABEL_18;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v15)
        continue;
      break;
    }
  }
LABEL_18:

  return v7;
}

- (BOOL)shouldShowProxCardForFeature:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;

  v3 = *(_QWORD *)&a3;
  if (!a3)
  {
    v5 = 1;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v5 = 2;
LABEL_5:
    v6 = -[BluetoothDevice isProxCardShowedForFeature:](self->_bluetoothDevice, "isProxCardShowedForFeature:", v5);
    v7 = -[BluetoothDevice isProxCardSupportedForFeature:](self->_bluetoothDevice, "isProxCardSupportedForFeature:", v5);
    v8 = -[SDHeadphoneFeatureManager isProxCardSupportedByProductID:](self, "isProxCardSupportedByProductID:", v3);
    v9 = v7 & ~v6 & v8;
    if (dword_1007B1570 <= 115)
    {
      v10 = v8;
      if (dword_1007B1570 != -1 || _LogCategory_Initialize(&dword_1007B1570, 115))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDHeadphoneFeatureManager getFeatureName:](self, "getFeatureName:", v3));
        v12 = CFSTR("NO");
        if (v9)
          v13 = CFSTR("YES");
        else
          v13 = CFSTR("NO");
        if (v6)
          v14 = CFSTR("YES");
        else
          v14 = CFSTR("NO");
        if (v7)
          v15 = CFSTR("YES");
        else
          v15 = CFSTR("NO");
        if (v10)
          v12 = CFSTR("YES");
        LogPrintF(&dword_1007B1570, "-[SDHeadphoneFeatureManager shouldShowProxCardForFeature:]", 115, "Should show Prox Card for %@ -- should prompt: %@, isProxCardShowed: %@, isProxCardSupportedByDevice: %@, isProxCardSupportedByProductID: %@, inDevice: %@", v11, v13, v14, v15, v12, self->_bluetoothAddressString);

      }
    }
    return v9;
  }
  if (dword_1007B1570 <= 115
    && (dword_1007B1570 != -1 || _LogCategory_Initialize(&dword_1007B1570, 115)))
  {
    LogPrintF(&dword_1007B1570, "-[SDHeadphoneFeatureManager shouldShowProxCardForFeature:]", 115, "Invalid Apple Headphone Feature: %d", v3);
  }
  LOBYTE(v9) = 0;
  return v9;
}

- (BOOL)isProxCardSupportedByProductID:(int)a3
{
  id v3;
  unsigned __int8 v4;
  BOOL v5;

  if (a3 == 1)
  {
    v3 = objc_msgSend(objc_alloc((Class)SFHeadphoneProduct), "initWithProductID:", self->_productID);
    v4 = objc_msgSend(v3, "supportsAdaptiveControlsProx");
  }
  else
  {
    if (a3)
      return 0;
    v3 = objc_msgSend(objc_alloc((Class)SFHeadphoneProduct), "initWithProductID:", self->_productID);
    v4 = objc_msgSend(v3, "supportsMuteCallProx");
  }
  v5 = v4;

  return v5;
}

- (id)getFeatureName:(int)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 1)
    v3 = CFSTR("Adaptive Controls");
  if (a3)
    return (id)v3;
  else
    return CFSTR("Mute Call");
}

- (NSString)bluetoothAddressString
{
  return self->_bluetoothAddressString;
}

- (BluetoothDevice)bluetoothDevice
{
  return self->_bluetoothDevice;
}

- (void)setBluetoothDevice:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothDevice, a3);
}

- (BluetoothManager)btManager
{
  return self->_btManager;
}

- (void)setBtManager:(id)a3
{
  objc_storeStrong((id *)&self->_btManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_btManager, 0);
  objc_storeStrong((id *)&self->_bluetoothDevice, 0);
  objc_storeStrong((id *)&self->_bluetoothAddressString, 0);
}

@end
