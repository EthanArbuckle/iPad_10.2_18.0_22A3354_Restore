@implementation AccessoryPairingWizard

+ (void)initialize
{
  uint64_t v2;
  id v3;

  v3 = (id)CFPreferencesCopyValue(CFSTR("PairedAccessories"), kCFPreferencesCurrentApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (objc_msgSend(v3, "count"))
  {
    v2 = sub_10000469C();
    _CFPreferencesSetAppValueWithContainer(CFSTR("PairedAccessories"), v3, kCFPreferencesCurrentApplication, v2);
    CFPreferencesSetValue(CFSTR("PairedAccessories"), 0, kCFPreferencesCurrentApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  }

}

- (AccessoryPairingWizard)initWithAccessoryInfo:(id)a3 pairingMethod:(int)a4 delegate:(id)a5
{
  id v8;
  id v9;
  AccessoryPairingWizard *v10;
  void *v11;
  uint64_t v12;
  NSData *accessoryID;
  uint64_t v14;
  NSString *discoveryName;
  void *v16;
  void *v17;
  unsigned int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;
  uint8_t buf[4];
  const __CFString *v27;

  v8 = a3;
  v9 = a5;
  v25.receiver = self;
  v25.super_class = (Class)AccessoryPairingWizard;
  v10 = -[AccessoryPairingWizard init](&v25, "init");
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", IAPAppBTPairingConnectionIDKey));
    v10->_connectionID = (unint64_t)objc_msgSend(v11, "unsignedLongLongValue");

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", IAPAppBTPairingUUIDKey));
    accessoryID = v10->_accessoryID;
    v10->_accessoryID = (NSData *)v12;

    v14 = objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard discoveryNameForAccessoryID:](v10, "discoveryNameForAccessoryID:", v10->_accessoryID));
    discoveryName = v10->_discoveryName;
    v10->_discoveryName = (NSString *)v14;

    v10->_pairingMethod = a4;
    objc_storeStrong((id *)&v10->_delegate, a5);
    v10->_accessoryType = 0;
    v10->_state = 0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", IAPAppBTPairingAccManufacturer));
    if ((objc_msgSend(v16, "isEqualToString:", CFSTR("Apple Inc.")) & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", IAPAppBTPairingAccModel));
      v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("A1603"));

      if (v18)
      {
        v19 = qword_100015A68;
        if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v27 = CFSTR("A1603");
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Accessory \"%@\" is an Apple device", buf, 0xCu);
        }
        v10->_accessoryType = 1;
      }
    }
    else
    {

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v20, "addObserver:selector:name:object:", v10, "handleAccessoryDidUpdateStateNotification:", IAPAppBTPairingDidUpdateStateKey, 0);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v21, "addObserver:selector:name:object:", v10, "handleAccessoryPairInfoNotification:", IAPAppBTPairingDidSendPairInfoKey, 0);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v22, "addObserver:selector:name:object:", v10, "handleAccessoryPairDataNotification:", IAPAppBTPairingDidSendPairDataKey, 0);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[CPDistributedNotificationCenter centerNamed:](CPDistributedNotificationCenter, "centerNamed:", IAP2GeneralDistributedNotificationServerName));
    objc_msgSend(v23, "startDeliveringNotificationsToMainThread");

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CPDistributedNotificationCenter centerNamed:](CPDistributedNotificationCenter, "centerNamed:", IAP2GeneralDistributedNotificationServerName));
  objc_msgSend(v3, "stopDeliveringNotifications");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)AccessoryPairingWizard;
  -[AccessoryPairingWizard dealloc](&v5, "dealloc");
}

- (NSString)description
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  unsigned int v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;

  v3 = objc_opt_class(self);
  v4 = -[AccessoryPairingWizard state](self, "state");
  v5 = -[AccessoryPairingWizard connectionID](self, "connectionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard accessoryID](self, "accessoryID"));
  v7 = -[AccessoryPairingWizard pairingMethod](self, "pairingMethod");
  v8 = CFSTR("unknown");
  if (v7 == 1)
    v8 = CFSTR("out-of-band");
  if (!v7)
    v8 = CFSTR("passkey");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard peripheral](self, "peripheral"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p state = %lu, connectionID = 0x%llx, accessoryID = %@, pairingMethod = %@, peripheral = %@>"), v3, self, v4, v5, v6, v9, v10));

  return (NSString *)v11;
}

- (id)discoveryNameForAccessoryID:(id)a3
{
  id v3;
  id v4;
  unint64_t v5;
  id v6;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableString);
  if ((unint64_t)objc_msgSend(v3, "length") >= 4)
  {
    v5 = 3;
    do
    {
      v6 = objc_retainAutorelease(v3);
      objc_msgSend(v4, "appendFormat:", CFSTR("%02X"), *((unsigned __int8 *)objc_msgSend(v6, "bytes") + v5++));
    }
    while (v5 < (unint64_t)objc_msgSend(v6, "length"));
  }

  return v4;
}

- (id)pairedAccessories
{
  uint64_t v2;

  v2 = sub_10000469C();
  return (id)_CFPreferencesCopyAppValueWithContainer(CFSTR("PairedAccessories"), kCFPreferencesCurrentApplication, v2);
}

- (void)setPairedAccessories:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a3;
  v4 = sub_10000469C();
  _CFPreferencesSetAppValueWithContainer(CFSTR("PairedAccessories"), v3, kCFPreferencesCurrentApplication, v4);

  v5 = sub_10000469C();
  _CFPreferencesSynchronizeWithContainer(kCFPreferencesCurrentApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost, v5);
}

- (void)startPairing
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[AccessoryPairingWizard state](self, "state"))
  {
    v3 = qword_100015A68;
    if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Ignoring start command as wizard is already running", v4, 2u);
    }
  }
  else
  {
    -[AccessoryPairingWizard advanceState](self, "advanceState");
  }
}

- (void)finishPairing
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  -[AccessoryPairingWizard setState:](self, "setState:", 16);
  v3 = (void *)qword_100015A68;
  if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard accessoryID](self, "accessoryID"));
    v7 = 138412290;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping updates from accessory \"%@\", (uint8_t *)&v7, 0xCu);

  }
  IAPBluetoothDeviceStopBLEUpdates(-[AccessoryPairingWizard connectionID](self, "connectionID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard delegate](self, "delegate"));
  objc_msgSend(v6, "accessoryPairingWizardDidFinish:success:", self, 1);

}

- (void)failPairing
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;

  v3 = (void *)qword_100015A68;
  if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard accessoryID](self, "accessoryID"));
    v13 = 138412290;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping updates from accessory \"%@\", (uint8_t *)&v13, 0xCu);

  }
  IAPBluetoothDeviceStopBLEUpdates(-[AccessoryPairingWizard connectionID](self, "connectionID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard centralManager](self, "centralManager"));
  objc_msgSend(v6, "stopScan");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard userAlert](self, "userAlert"));
  objc_msgSend(v7, "cancel");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard peripheral](self, "peripheral"));
  if (v8)
  {
    if (-[AccessoryPairingWizard state](self, "state") < 0xD)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard centralManager](self, "centralManager"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard peripheral](self, "peripheral"));
      objc_msgSend(v10, "cancelPeripheralConnection:force:", v11, 1);
    }
    else
    {
      v9 = (void *)qword_100015A68;
      if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
        sub_100009430(v9, self);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard pairingAgent](self, "pairingAgent"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard peripheral](self, "peripheral"));
      objc_msgSend(v10, "unpairPeer:", v11);
    }

  }
  -[AccessoryPairingWizard setState:](self, "setState:", 17);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard delegate](self, "delegate"));
  objc_msgSend(v12, "accessoryPairingWizardDidFinish:success:", self, 0);

}

- (void)advanceState
{
  unsigned int v3;
  _BOOL4 v4;
  unsigned int v5;
  _BOOL4 v6;

  if (byte_100015A60)
    kdebug_trace(730006308, -[AccessoryPairingWizard state](self, "state"), 0, 0, 0);
  switch(-[AccessoryPairingWizard state](self, "state"))
  {
    case 0uLL:
      if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEBUG))
        sub_1000094BC();
      -[AccessoryPairingWizard setState:](self, "setState:", 1);
      -[AccessoryPairingWizard establishLECommunication](self, "establishLECommunication");
      break;
    case 1uLL:
      if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEBUG))
        sub_1000094E8();
      -[AccessoryPairingWizard setState:](self, "setState:", 2);
      -[AccessoryPairingWizard exchangeInitialState](self, "exchangeInitialState");
      break;
    case 2uLL:
      if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEBUG))
        sub_100009514();
      -[AccessoryPairingWizard setState:](self, "setState:", 3);
      -[AccessoryPairingWizard turnOnBluetooth](self, "turnOnBluetooth");
      break;
    case 3uLL:
      if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEBUG))
        sub_100009540();
      -[AccessoryPairingWizard setState:](self, "setState:", 4);
      -[AccessoryPairingWizard determinePairStatus](self, "determinePairStatus");
      break;
    case 4uLL:
      if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEBUG))
        sub_10000956C();
      -[AccessoryPairingWizard setState:](self, "setState:", 5);
      -[AccessoryPairingWizard eraseExistingKeys](self, "eraseExistingKeys");
      break;
    case 5uLL:
      v3 = -[AccessoryPairingWizard pairingMethod](self, "pairingMethod");
      v4 = os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEBUG);
      if (v3 != 1)
      {
        if (v4)
          sub_1000095C4();
        goto LABEL_54;
      }
      if (v4)
        sub_100009598();
      -[AccessoryPairingWizard setState:](self, "setState:", 6);
      -[AccessoryPairingWizard exchangeOOBData](self, "exchangeOOBData");
      break;
    case 6uLL:
      if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEBUG))
        sub_1000095F0();
LABEL_54:
      -[AccessoryPairingWizard setState:](self, "setState:", 7);
      -[AccessoryPairingWizard enterPairingMode](self, "enterPairingMode");
      break;
    case 7uLL:
      if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEBUG))
        sub_10000961C();
      -[AccessoryPairingWizard setState:](self, "setState:", 8);
      -[AccessoryPairingWizard discoverPeripheral](self, "discoverPeripheral");
      break;
    case 8uLL:
      if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEBUG))
        sub_100009648();
      -[AccessoryPairingWizard setState:](self, "setState:", 9);
      -[AccessoryPairingWizard connectPeripheral](self, "connectPeripheral");
      break;
    case 9uLL:
      if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEBUG))
        sub_100009674();
      -[AccessoryPairingWizard setState:](self, "setState:", 10);
      -[AccessoryPairingWizard initiatePairing](self, "initiatePairing");
      break;
    case 0xAuLL:
      v5 = -[AccessoryPairingWizard pairingMethod](self, "pairingMethod");
      v6 = os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEBUG);
      if (v5)
      {
        if (v6)
          sub_1000096CC();
        goto LABEL_39;
      }
      if (v6)
        sub_1000096A0();
      -[AccessoryPairingWizard setState:](self, "setState:", 11);
      -[AccessoryPairingWizard exchangePasskeyData](self, "exchangePasskeyData");
      break;
    case 0xBuLL:
      if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEBUG))
        sub_1000096F8();
LABEL_39:
      -[AccessoryPairingWizard setState:](self, "setState:", 12);
      -[AccessoryPairingWizard askUserApproval](self, "askUserApproval");
      break;
    case 0xCuLL:
      if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEBUG))
        sub_100009724();
      -[AccessoryPairingWizard setState:](self, "setState:", 13);
      -[AccessoryPairingWizard acceptPairing](self, "acceptPairing");
      break;
    case 0xDuLL:
      -[AccessoryPairingWizard setState:](self, "setState:", 14);
      if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEBUG))
        sub_100009750();
      -[AccessoryPairingWizard sendPairingInfo](self, "sendPairingInfo");
      break;
    case 0xEuLL:
      if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEBUG))
        sub_10000977C();
      -[AccessoryPairingWizard setState:](self, "setState:", 15);
      -[AccessoryPairingWizard storePairingInfo](self, "storePairingInfo");
      break;
    case 0xFuLL:
      if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEBUG))
        sub_1000097A8();
      -[AccessoryPairingWizard setState:](self, "setState:", 16);
      -[AccessoryPairingWizard finishPairing](self, "finishPairing");
      break;
    default:
      return;
  }
}

- (void)establishLECommunication
{
  NSObject *v3;
  id v4;
  void *v5;
  id v6;
  uint8_t v7[8];
  uint64_t v8;
  void *v9;

  v3 = qword_100015A68;
  if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Establishing communication with CoreBluetooth", v7, 2u);
  }
  v4 = objc_alloc((Class)CBCentralManager);
  v8 = CBManagerNeedsRestrictedStateOperation;
  v9 = &__kCFBooleanTrue;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  v6 = objc_msgSend(v4, "initWithDelegate:queue:options:", self, 0, v5);
  -[AccessoryPairingWizard setCentralManager:](self, "setCentralManager:", v6);

}

- (void)exchangeInitialState
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = (void *)qword_100015A68;
  if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard accessoryID](self, "accessoryID"));
    v7 = 138412290;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Sending initial state to accessory \"%@\", (uint8_t *)&v7, 0xCu);

  }
  if (IAPBluetoothDeviceStartBLEUpdates(-[AccessoryPairingWizard connectionID](self, "connectionID"), -[AccessoryPairingWizard pairingMethod](self, "pairingMethod"), 1, 1))
  {
    v6 = (void *)qword_100015A68;
    if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
      sub_1000097D4(v6);
    -[AccessoryPairingWizard failPairing](self, "failPairing");
  }
  else
  {
    -[AccessoryPairingWizard startExpirationTimer:](self, "startExpirationTimer:", 10);
  }
}

- (void)turnOnBluetooth
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard centralManager](self, "centralManager"));
  if (objc_msgSend(v3, "state") == (id)5)
  {

LABEL_4:
    v6 = qword_100015A68;
    if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Bluetooth is already powered on - proceeding with pairing process", buf, 2u);
    }
    -[AccessoryPairingWizard advanceState](self, "advanceState");
    return;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard centralManager](self, "centralManager"));
  v5 = objc_msgSend(v4, "state");

  if (v5 == (id)10)
    goto LABEL_4;
  v7 = qword_100015A68;
  if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Bluetooth needs to be powered on before proceeding - asking user to toggle power state", buf, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mobileBluetoothBundle](NSBundle, "mobileBluetoothBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("POWER_ALERT_TITLE"), &stru_1000108A8, 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("POWER_ALERT_BODY"), &stru_1000108A8, 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("TURN_ON"), &stru_1000108A8, 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1000108A8, 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[BTDaemonAlert alertWithTitle:message:defaultButton:alternateButton:](BTDaemonAlert, "alertWithTitle:message:defaultButton:alternateButton:", v9, v10, v12, v11));
  -[AccessoryPairingWizard setUserAlert:](self, "setUserAlert:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard userAlert](self, "userAlert"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100005A34;
  v15[3] = &unk_100010590;
  v15[4] = self;
  objc_msgSend(v14, "presentAlert:", v15);

}

- (void)determinePairStatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  void *v22;
  _BOOL4 v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  unsigned int v34;
  void *v35;
  _BOOL4 v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  AccessoryPairingWizard *v46;
  id obj;
  _QWORD v48[4];
  id v49;
  _QWORD v50[5];
  _QWORD v51[5];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard centralManager](self, "centralManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sharedPairingAgent"));
  -[AccessoryPairingWizard setPairingAgent:](self, "setPairingAgent:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard pairingAgent](self, "pairingAgent"));
  objc_msgSend(v5, "setDelegate:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard pairedAccessories](self, "pairedAccessories"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v46 = self;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard pairingAgent](self, "pairingAgent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "retrievePairedPeers"));

  v54 = 0u;
  v55 = 0u;
  v53 = 0u;
  v52 = 0u;
  obj = v6;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v53 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
        v51[0] = _NSConcreteStackBlock;
        v51[1] = 3221225472;
        v51[2] = sub_1000061AC;
        v51[3] = &unk_1000105B8;
        v51[4] = v14;
        if (objc_msgSend(v9, "indexOfObjectPassingTest:", v51) == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v15 = (void *)qword_100015A68;
          if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
          {
            v16 = v15;
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("PairedAccessoryLocalIdentifier")));
            *(_DWORD *)buf = 138412290;
            v57 = v17;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Accessory \"%@\" is no longer paired via CoreBluetooth", buf, 0xCu);

          }
        }
        else
        {
          objc_msgSend(v7, "addObject:", v14);
        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    }
    while (v11);
  }

  -[AccessoryPairingWizard setPairedAccessories:](v46, "setPairedAccessories:", v7);
  v18 = (void *)qword_100015A68;
  if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
  {
    v19 = v18;
    v20 = objc_msgSend(v7, "count");
    *(_DWORD *)buf = 134217984;
    v57 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Loaded %lu paired accessories from cache", buf, 0xCu);

  }
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_100006224;
  v50[3] = &unk_1000105E0;
  v50[4] = v46;
  v21 = objc_msgSend(v7, "indexOfObjectPassingTest:", v50);
  v22 = (void *)qword_100015A68;
  v23 = os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT);
  if (v21 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (v23)
    {
      v24 = v22;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard accessoryID](v46, "accessoryID"));
      *(_DWORD *)buf = 138412290;
      v57 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Could not find local pairing information for accessory \"%@\", buf, 0xCu);

    }
    if ((id)-[AccessoryPairingWizard accessoryType](v46, "accessoryType") != (id)1)
      goto LABEL_34;
    v26 = objc_msgSend(v9, "indexOfObjectPassingTest:", &stru_100010620);
    if (v26 == (id)0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_34;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v26));
    -[AccessoryPairingWizard setOldPeripheral:](v46, "setOldPeripheral:", v27);
LABEL_33:

LABEL_34:
    -[AccessoryPairingWizard advanceState](v46, "advanceState");
    goto LABEL_35;
  }
  if (v23)
  {
    v28 = v22;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard accessoryID](v46, "accessoryID"));
    *(_DWORD *)buf = 138412290;
    v57 = v29;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Found pairing information for accessory \"%@\", buf, 0xCu);

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v21));
  v30 = objc_alloc((Class)NSUUID);
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("PairedAccessoryLocalIdentifier")));
  v32 = objc_msgSend(v30, "initWithUUIDString:", v31);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard accessoryCookies](v46, "accessoryCookies"));
  v34 = objc_msgSend(v33, "containsObject:", v32);

  v35 = (void *)qword_100015A68;
  v36 = os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT);
  if (!v34)
  {
    if (v36)
    {
      v39 = v35;
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard accessoryID](v46, "accessoryID"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("PairedAccessoryLocalIdentifier")));
      *(_DWORD *)buf = 138412546;
      v57 = v40;
      v58 = 2112;
      v59 = v41;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Accessory \"%@\" is paired locally but no longer has our pairing token (%@)", buf, 0x16u);

    }
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_100006298;
    v48[3] = &unk_1000105B8;
    v42 = v32;
    v49 = v42;
    v43 = objc_msgSend(v9, "indexOfObjectPassingTest:", v48);
    if (v43 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v44 = (void *)qword_100015A68;
      if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
        sub_100009888(v44, v42);
    }
    else
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v43));
      -[AccessoryPairingWizard setOldPeripheral:](v46, "setOldPeripheral:", v45);

    }
    goto LABEL_33;
  }
  if (v36)
  {
    v37 = v35;
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("PairedAccessoryLocalIdentifier")));
    *(_DWORD *)buf = 138412290;
    v57 = v38;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Accessory \"%@\" is already paired via CoreBluetooth", buf, 0xCu);

  }
  -[AccessoryPairingWizard finishPairing](v46, "finishPairing");

LABEL_35:
}

- (void)eraseExistingKeys
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard oldPeripheral](self, "oldPeripheral"));

  v4 = qword_100015A68;
  v5 = os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = v4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard oldPeripheral](self, "oldPeripheral"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
      v12 = 138412290;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unpairing existing paired peripheral \"%@\", (uint8_t *)&v12, 0xCu);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard pairingAgent](self, "pairingAgent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard oldPeripheral](self, "oldPeripheral"));
    objc_msgSend(v10, "unpairPeer:", v11);

    -[AccessoryPairingWizard startExpirationTimer:](self, "startExpirationTimer:", 5);
  }
  else
  {
    if (v5)
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "No need to erase existing keys", (uint8_t *)&v12, 2u);
    }
    -[AccessoryPairingWizard advanceState](self, "advanceState");
  }
}

- (void)exchangeOOBData
{
  -[AccessoryPairingWizard startExpirationTimer:](self, "startExpirationTimer:", 10);
}

- (void)enterPairingMode
{
  void *v3;
  NSObject *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v3 = (void *)qword_100015A68;
  if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard accessoryID](self, "accessoryID"));
    v11 = 138412290;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Sending pairing mode 'on' to accessory \"%@\", (uint8_t *)&v11, 0xCu);

  }
  v6 = -[AccessoryPairingWizard connectionID](self, "connectionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard centralManager](self, "centralManager"));
  if (objc_msgSend(v7, "state") == (id)5)
  {
    v8 = IAPBluetoothDeviceStateUpdate(v6, 1, 3, 1, 0);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard centralManager](self, "centralManager"));
    v8 = IAPBluetoothDeviceStateUpdate(v6, objc_msgSend(v9, "state") == (id)10, 3, 1, 0);

  }
  if (v8)
  {
    v10 = (void *)qword_100015A68;
    if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
      sub_100009914(v10);
    -[AccessoryPairingWizard failPairing](self, "failPairing");
  }
  else
  {
    -[AccessoryPairingWizard startExpirationTimer:](self, "startExpirationTimer:", 10);
  }
}

- (void)discoverPeripheral
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _UNKNOWN **v9;
  uint8_t buf[4];
  void *v11;

  v3 = (void *)qword_100015A68;
  if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard discoveryName](self, "discoveryName"));
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting LE peripheral discovery, looking for \"%@\", buf, 0xCu);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard centralManager](self, "centralManager"));
  v8 = CBManagerIsPrivilegedDaemonKey;
  v9 = &off_100010A08;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  objc_msgSend(v6, "scanForPeripheralsWithServices:options:", 0, v7);

  -[AccessoryPairingWizard startExpirationTimer:](self, "startExpirationTimer:", 30);
}

- (void)connectPeripheral
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v3 = (void *)qword_100015A68;
  if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard peripheral](self, "peripheral"));
    v9 = 138412290;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Connecting LE peripheral \"%@\", (uint8_t *)&v9, 0xCu);

  }
  if ((id)-[AccessoryPairingWizard accessoryType](self, "accessoryType") == (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard peripheral](self, "peripheral"));
    objc_msgSend(v6, "tag:", CFSTR("FastConnection"));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard centralManager](self, "centralManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard peripheral](self, "peripheral"));
  objc_msgSend(v7, "connectPeripheral:options:", v8, 0);

  -[AccessoryPairingWizard startExpirationTimer:](self, "startExpirationTimer:", 30);
}

- (void)initiatePairing
{
  -[AccessoryPairingWizard startExpirationTimer:](self, "startExpirationTimer:", 30);
}

- (void)exchangePasskeyData
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  unsigned int v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard passkey](self, "passkey"));
  v4 = objc_msgSend(v3, "unsignedIntValue");

  v14 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard passkey](self, "passkey"));
  if (v5)
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v14, 4));
  else
    v6 = 0;

  v7 = (void *)qword_100015A68;
  if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard passkey](self, "passkey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard accessoryID](self, "accessoryID"));
    *(_DWORD *)buf = 138412546;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending passkey %@ to accessory \"%@\", buf, 0x16u);

  }
  v11 = IAPBluetoothDevicePairingData(-[AccessoryPairingWizard connectionID](self, "connectionID"), v6);
  if (v11)
  {
    v12 = v11;
    v13 = (void *)qword_100015A68;
    if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
      sub_10000999C(v13, self, v12);
    -[AccessoryPairingWizard failPairing](self, "failPairing");
  }
  else
  {
    -[AccessoryPairingWizard startExpirationTimer:](self, "startExpirationTimer:", 10);
  }

}

- (void)askUserApproval
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  uint8_t buf[4];
  void *v19;

  v3 = (void *)qword_100015A68;
  if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard accessoryID](self, "accessoryID"));
    *(_DWORD *)buf = 138412290;
    v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Prompting user to accept pairing to accessory \"%@\", buf, 0xCu);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mobileBluetoothBundle](NSBundle, "mobileBluetoothBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PAIRING_TITLE"), &stru_1000108A8, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("JUST_WORKS_MESSAGE"), &stru_1000108A8, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard peripheral](self, "peripheral"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
  v11 = (void *)MGCopyAnswer(CFSTR("DeviceName"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v10, v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PAIR"), &stru_1000108A8, 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1000108A8, 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[BTDaemonAlert alertWithTitle:message:defaultButton:alternateButton:](BTDaemonAlert, "alertWithTitle:message:defaultButton:alternateButton:", v7, v12, v14, v13));
  -[AccessoryPairingWizard setUserAlert:](self, "setUserAlert:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard userAlert](self, "userAlert"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100006CD0;
  v17[3] = &unk_100010590;
  v17[4] = self;
  objc_msgSend(v16, "presentAlert:", v17);

}

- (void)acceptPairing
{
  void *v3;
  void **v4;
  uint64_t *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  unsigned int v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  __CFString *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;

  if (!-[AccessoryPairingWizard pairingMethod](self, "pairingMethod"))
  {
    v21 = CBPairingAgentPairingDataPasskeyKey;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard passkey](self, "passkey"));
    v22 = v3;
    v4 = &v22;
    v5 = &v21;
    goto LABEL_5;
  }
  if (-[AccessoryPairingWizard pairingMethod](self, "pairingMethod") == 1)
  {
    v19 = CBPairingAgentPairingDataOOBTKKey;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v20 = v3;
    v4 = &v20;
    v5 = &v19;
LABEL_5:
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v5, 1));

    goto LABEL_7;
  }
  v6 = 0;
LABEL_7:
  v7 = (void *)qword_100015A68;
  if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = -[AccessoryPairingWizard pairingMethod](self, "pairingMethod");
    v10 = CFSTR("unknown");
    if (v9 == 1)
      v10 = CFSTR("out-of-band");
    if (!v9)
      v10 = CFSTR("passkey");
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard peripheral](self, "peripheral"));
    v15 = 138412546;
    v16 = v11;
    v17 = 2112;
    v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Accepting %@ pairing request for peripheral \"%@\", (uint8_t *)&v15, 0x16u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard pairingAgent](self, "pairingAgent"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard peripheral](self, "peripheral"));
  objc_msgSend(v13, "respondToPairingRequest:type:accept:data:", v14, -[AccessoryPairingWizard pairingType](self, "pairingType"), 1, v6);

}

- (void)sendPairingInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  NSObject *v14;
  void *v15;
  unint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  int v24;
  _QWORD v25[2];

  v25[0] = 0;
  v25[1] = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard peripheral](self, "peripheral"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  objc_msgSend(v4, "getUUIDBytes:", v25);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v25, 16));
  v6 = (void *)qword_100015A68;
  if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard peripheral](self, "peripheral"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard accessoryID](self, "accessoryID"));
    v17 = 138412546;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Sending pairing token %@ to accessory \"%@\", (uint8_t *)&v17, 0x16u);

  }
  v11 = IAPBluetoothDevicePairingInfoUpdate(-[AccessoryPairingWizard connectionID](self, "connectionID"), v5);
  if (v11)
  {
    v12 = v11;
    v13 = (void *)qword_100015A68;
    if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
    {
      v14 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard accessoryID](self, "accessoryID"));
      v16 = -[AccessoryPairingWizard connectionID](self, "connectionID");
      v17 = 138413058;
      v18 = v5;
      v19 = 2112;
      v20 = v15;
      v21 = 2048;
      v22 = v16;
      v23 = 1024;
      v24 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to send DevicePairingInfoUpdate message with pairing token %@ to accessory \"%@\" (%llu) with result %d", (uint8_t *)&v17, 0x26u);

    }
    -[AccessoryPairingWizard failPairing](self, "failPairing");
  }
  else
  {
    -[AccessoryPairingWizard startExpirationTimer:](self, "startExpirationTimer:", 10);
  }

}

- (void)storePairingInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  const __CFString *v17;
  __int16 v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard pairedAccessories](self, "pairedAccessories"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v3));

  v20[0] = CFSTR("PairedAccessoryLocalIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard peripheral](self, "peripheral"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
  v20[1] = CFSTR("PairedAccessoryRemoteIdentifier");
  v21[0] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard accessoryID](self, "accessoryID"));
  v21[1] = v8;
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));

  objc_msgSend(v4, "addObject:", v9);
  v10 = qword_100015A68;
  if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Storing new paired accessory info %@ into cache", (uint8_t *)&v16, 0xCu);
  }
  -[AccessoryPairingWizard setPairedAccessories:](self, "setPairedAccessories:", v4);
  if ((id)-[AccessoryPairingWizard accessoryType](self, "accessoryType") == (id)1)
  {
    v11 = (void *)qword_100015A68;
    if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard peripheral](self, "peripheral"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
      v16 = 138412546;
      v17 = CFSTR("A1603");
      v18 = 2112;
      v19 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Adding tag \"%@\" to peripheral \"%@\", (uint8_t *)&v16, 0x16u);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard peripheral](self, "peripheral"));
    objc_msgSend(v15, "tag:", CFSTR("A1603"));

  }
  -[AccessoryPairingWizard advanceState](self, "advanceState");

}

- (void)handleAccessoryDidUpdateStateNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unsigned int v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  _BYTE v20[24];

  v4 = a3;
  v5 = (void *)qword_100015A68;
  if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    *(_DWORD *)v20 = 138412290;
    *(_QWORD *)&v20[4] = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received state update notification with data %@", v20, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", IAPAppBTPairingConnectionIDKey));
  v10 = objc_msgSend(v9, "unsignedLongLongValue");
  v11 = -[AccessoryPairingWizard connectionID](self, "connectionID");

  if (v10 == (id)v11)
  {
    if ((id)-[AccessoryPairingWizard state](self, "state") == (id)7)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", IAPAppBTPairingPairModeKey));
      v14 = objc_msgSend(v13, "BOOLValue");

      v15 = qword_100015A68;
      if (v14)
      {
        if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v20 = 0;
          v16 = "Received state update with pairing mode enabled";
LABEL_19:
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v16, v20, 2u);
          goto LABEL_20;
        }
        goto LABEL_20;
      }
      if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
        sub_100009ABC();
LABEL_16:
      -[AccessoryPairingWizard failPairing](self, "failPairing");
      goto LABEL_21;
    }
    if ((id)-[AccessoryPairingWizard state](self, "state") == (id)14)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", IAPAppBTPairingPairStateKey));
      v19 = objc_msgSend(v18, "intValue");

      v15 = qword_100015A68;
      if (!v19)
      {
        if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v20 = 0;
          v16 = "Received state update with pairing state success";
          goto LABEL_19;
        }
LABEL_20:
        -[AccessoryPairingWizard advanceState](self, "advanceState", *(_QWORD *)v20);
        goto LABEL_21;
      }
      if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
        sub_100009AE8();
      goto LABEL_16;
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
  {
    sub_100009B14();
  }
LABEL_21:

}

- (void)handleAccessoryPairInfoNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  id v22;
  void *v23;
  NSObject *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];

  v4 = a3;
  v5 = (void *)qword_100015A68;
  if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    *(_DWORD *)buf = 138412290;
    v31 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received pair info notification with data %@", buf, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", IAPAppBTPairingConnectionIDKey));
  v10 = objc_msgSend(v9, "unsignedLongLongValue");
  v11 = -[AccessoryPairingWizard connectionID](self, "connectionID");

  if (v10 == (id)v11)
  {
    if ((id)-[AccessoryPairingWizard state](self, "state") == (id)2)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", IAPAppBTPairingPairModeKey));

      LODWORD(v12) = objc_msgSend(v13, "intValue");
      if ((_DWORD)v12 == -[AccessoryPairingWizard pairingMethod](self, "pairingMethod"))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", IAPAppBTPairingPairInfoArrayKey));

        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v17 = v15;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v19; i = (char *)i + 1)
            {
              if (*(_QWORD *)v27 != v20)
                objc_enumerationMutation(v17);
              v22 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i)), "bytes"));
              objc_msgSend(v16, "addObject:", v22);

            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          }
          while (v19);
        }

        v23 = (void *)qword_100015A68;
        if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
        {
          v24 = v23;
          v25 = objc_msgSend(v16, "count");
          *(_DWORD *)buf = 134218242;
          v31 = v25;
          v32 = 2112;
          v33 = v16;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Received %lu pairing token(s): %@", buf, 0x16u);

        }
        -[AccessoryPairingWizard setAccessoryCookies:](self, "setAccessoryCookies:", v16);
        -[AccessoryPairingWizard advanceState](self, "advanceState");

      }
      else
      {
        if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
          sub_100009BB4();
        -[AccessoryPairingWizard failPairing](self, "failPairing");
      }

    }
    else if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
    {
      sub_100009C68();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
  {
    sub_100009C94();
  }

}

- (void)handleAccessoryPairDataNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  unsigned int v17;
  int v18;
  void *v19;
  NSObject *v20;
  int v21;
  uint8_t buf[4];
  void *v23;

  v4 = a3;
  v5 = (void *)qword_100015A68;
  if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    *(_DWORD *)buf = 138412290;
    v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received pair data notification with data %@", buf, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", IAPAppBTPairingConnectionIDKey));
  v10 = objc_msgSend(v9, "unsignedLongLongValue");
  v11 = -[AccessoryPairingWizard connectionID](self, "connectionID");

  if (v10 == (id)v11)
  {
    if ((id)-[AccessoryPairingWizard state](self, "state") == (id)11)
    {
      v21 = 0;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", IAPAppBTPairingPairDataKey));
      objc_msgSend(v13, "getBytes:length:", &v21, 4);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard passkey](self, "passkey"));
      v15 = objc_msgSend(v14, "intValue");
      LODWORD(v13) = v15 | v21;

      if (!(_DWORD)v13)
      {
        if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
          sub_100009D34();
LABEL_17:
        -[AccessoryPairingWizard failPairing](self, "failPairing");
        goto LABEL_23;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard passkey](self, "passkey"));
      v17 = objc_msgSend(v16, "intValue");
      v18 = v21;

      if (v17 && v18)
      {
        if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
          sub_100009D60();
        goto LABEL_17;
      }
      if (v21)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:"));
        -[AccessoryPairingWizard setPasskey:](self, "setPasskey:", v19);

      }
      v20 = qword_100015A68;
      if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v23) = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Received pair data notification with passkey %u", buf, 8u);
      }
      -[AccessoryPairingWizard advanceState](self, "advanceState");
    }
    else if ((id)-[AccessoryPairingWizard state](self, "state") != (id)6
           && os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
    {
      sub_100009D8C();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
  {
    sub_100009DB8();
  }
LABEL_23:

}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  if ((id)-[AccessoryPairingWizard state](self, "state") == (id)1)
  {
    if ((uint64_t)objc_msgSend(v4, "state") >= 4)
    {
LABEL_3:
      -[AccessoryPairingWizard advanceState](self, "advanceState");
      goto LABEL_15;
    }
    v7 = (void *)qword_100015A68;
    if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
      sub_100009E58(v7);
LABEL_14:
    -[AccessoryPairingWizard failPairing](self, "failPairing");
    goto LABEL_15;
  }
  if ((id)-[AccessoryPairingWizard state](self, "state") == (id)3 && objc_msgSend(v4, "state") == (id)5)
  {
    v5 = qword_100015A68;
    if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Bluetooth power is now ON", v8, 2u);
    }
    goto LABEL_3;
  }
  if (-[AccessoryPairingWizard state](self, "state") >= 8 && (uint64_t)objc_msgSend(v4, "state") <= 4)
  {
    v6 = (void *)qword_100015A68;
    if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
      sub_100009ED0(v6);
    goto LABEL_14;
  }
LABEL_15:

}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v8;
  id v9;
  unint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;

  v8 = a4;
  v9 = a5;
  v10 = -[AccessoryPairingWizard state](self, "state");
  v11 = qword_100015A68;
  v12 = os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT);
  if (v10 == 8)
  {
    if (v12)
    {
      v20 = 138412290;
      v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Discovered peripheral %@", (uint8_t *)&v20, 0xCu);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CBAdvertisementDataLocalNameKey));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard discoveryName](self, "discoveryName"));
    v15 = objc_msgSend(v13, "isEqualToString:", v14);

    if (v15)
    {
      v16 = (void *)qword_100015A68;
      if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v16;
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard discoveryName](self, "discoveryName"));
        v20 = 138412546;
        v21 = v18;
        v22 = 2112;
        v23 = v8;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Found \"%@\" advertised by peripheral \"%@\", (uint8_t *)&v20, 0x16u);

      }
      -[AccessoryPairingWizard setPeripheral:](self, "setPeripheral:", v8);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard centralManager](self, "centralManager"));
      objc_msgSend(v19, "stopScan");

      -[AccessoryPairingWizard advanceState](self, "advanceState");
    }
  }
  else if (v12)
  {
    LOWORD(v20) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Ignoring discovery event outside of discovery state", (uint8_t *)&v20, 2u);
  }

}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;

  v5 = a4;
  v6 = qword_100015A68;
  if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Successfully connected peripheral \"%@\", (uint8_t *)&v7, 0xCu);
  }
  -[AccessoryPairingWizard advanceState](self, "advanceState");

}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v7;
  id v8;

  v7 = a4;
  v8 = a5;
  if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
    sub_100009F64();
  -[AccessoryPairingWizard failPairing](self, "failPairing");

}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  unint64_t v9;
  NSObject *v10;
  unint64_t v11;
  int v12;
  id v13;

  v7 = a4;
  v8 = a5;
  v9 = -[AccessoryPairingWizard state](self, "state");
  v10 = qword_100015A68;
  if (v9 > 0xF)
  {
    if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Disconnected peripheral \"%@\", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
      sub_100009FCC();
    if ((id)-[AccessoryPairingWizard state](self, "state") == (id)10
      && (v11 = -[AccessoryPairingWizard connectionTryCount](self, "connectionTryCount"),
          -[AccessoryPairingWizard setConnectionTryCount:](self, "setConnectionTryCount:", v11 + 1),
          v11 <= 4))
    {
      -[AccessoryPairingWizard setState:](self, "setState:", 9);
      -[AccessoryPairingWizard connectPeripheral](self, "connectPeripheral");
    }
    else
    {
      -[AccessoryPairingWizard failPairing](self, "failPairing");
    }
  }

}

- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  __CFString *v20;
  void *v21;
  int v22;
  const char *v23;
  __int16 v24;
  int64_t v25;
  __int16 v26;
  void *v27;

  v9 = a4;
  v10 = a6;
  if ((id)-[AccessoryPairingWizard state](self, "state") != (id)10)
  {
    if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
      sub_10000A098();
    goto LABEL_23;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard peripheral](self, "peripheral"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
  v14 = objc_msgSend(v11, "isEqual:", v13);

  if ((v14 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
      sub_10000A034();
    goto LABEL_23;
  }
  if ((unint64_t)(a5 - 1) > 1)
  {
    if (a5 == 5 && -[AccessoryPairingWizard pairingMethod](self, "pairingMethod") == 1)
      goto LABEL_12;
    goto LABEL_21;
  }
  if (-[AccessoryPairingWizard pairingMethod](self, "pairingMethod"))
  {
LABEL_21:
    v17 = (void *)qword_100015A68;
    if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
    {
      v19 = v17;
      v20 = sub_1000045C4(-[AccessoryPairingWizard pairingMethod](self, "pairingMethod"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = 138412802;
      v23 = (const char *)v9;
      v24 = 2048;
      v25 = a5;
      v26 = 2112;
      v27 = v21;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failing pairing request from peripheral \"%@\" as type (%ld) doesn't match what we negotiated (%@)", (uint8_t *)&v22, 0x20u);

    }
LABEL_23:
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard pairingAgent](self, "pairingAgent"));
    objc_msgSend(v18, "respondToPairingRequest:type:accept:data:", v9, a5, 0, 0);

    goto LABEL_24;
  }
LABEL_12:
  v15 = qword_100015A68;
  if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
  {
    v16 = "passkey entry";
    if (a5 == 1)
      v16 = "passkey display";
    if (a5 == 5)
      v16 = "out-of-band";
    v22 = 136315394;
    v23 = v16;
    v24 = 2112;
    v25 = (int64_t)v9;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Received \"%s\" pairing request from peripheral \"%@\", (uint8_t *)&v22, 0x16u);
  }
  -[AccessoryPairingWizard setPairingType:](self, "setPairingType:", a5);
  if (a5 == 1)
    -[AccessoryPairingWizard setPasskey:](self, "setPasskey:", v10);
  -[AccessoryPairingWizard advanceState](self, "advanceState");
LABEL_24:

}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;

  v5 = a4;
  v6 = qword_100015A68;
  if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Successfully paired peripheral \"%@\", (uint8_t *)&v7, 0xCu);
  }
  -[AccessoryPairingWizard advanceState](self, "advanceState");

}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  id v7;
  id v8;

  v7 = a4;
  v8 = a5;
  if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
    sub_10000A0FC();
  -[AccessoryPairingWizard failPairing](self, "failPairing");

}

- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;

  v5 = a4;
  if ((id)-[AccessoryPairingWizard state](self, "state") == (id)5
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPairingWizard oldPeripheral](self, "oldPeripheral")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier")),
        v9 = objc_msgSend(v7, "isEqual:", v8),
        v8,
        v7,
        v6,
        v9))
  {
    v10 = (void *)qword_100015A68;
    if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
      v18 = 138412290;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Successfully unpaired old peripheral \"%@\", (uint8_t *)&v18, 0xCu);

    }
    -[AccessoryPairingWizard advanceState](self, "advanceState");
  }
  else
  {
    v14 = (void *)qword_100015A68;
    if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUIDString"));
      v18 = 138412290;
      v19 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Received CoreBluetooth unpair event for peripheral \"%@\", (uint8_t *)&v18, 0xCu);

    }
  }

}

- (void)startExpirationTimer:(unint64_t)a3
{
  void *v5;
  dispatch_time_t v6;
  _QWORD v7[4];
  id v8[3];
  id location;

  v5 = -[AccessoryPairingWizard state](self, "state");
  location = 0;
  objc_initWeak(&location, self);
  v6 = dispatch_time(0, 1000000000 * a3);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008A00;
  v7[3] = &unk_100010648;
  objc_copyWeak(v8, &location);
  v8[1] = v5;
  v8[2] = (id)a3;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v7);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

- (void)timerExpiredWithState:(unint64_t)a3 after:(unint64_t)a4
{
  unint64_t v6;
  _BOOL4 v7;

  if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEBUG))
    sub_10000A61C();
  if (-[AccessoryPairingWizard state](self, "state") == a3)
  {
    if ((id)-[AccessoryPairingWizard state](self, "state") == (id)2)
    {
      if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
        sub_10000A164();
LABEL_34:
      -[AccessoryPairingWizard failPairing](self, "failPairing");
      return;
    }
    if ((id)-[AccessoryPairingWizard state](self, "state") == (id)3)
    {
      if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
        sub_10000A1E8();
      goto LABEL_34;
    }
    if ((id)-[AccessoryPairingWizard state](self, "state") != (id)5)
    {
      if ((id)-[AccessoryPairingWizard state](self, "state") == (id)6)
      {
        if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
          sub_10000A2B0();
      }
      else if ((id)-[AccessoryPairingWizard state](self, "state") == (id)8)
      {
        if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
          sub_10000A334();
      }
      else if ((id)-[AccessoryPairingWizard state](self, "state") == (id)9)
      {
        if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
          sub_10000A398();
      }
      else if ((id)-[AccessoryPairingWizard state](self, "state") == (id)10)
      {
        if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
          sub_10000A41C();
      }
      else if ((id)-[AccessoryPairingWizard state](self, "state") == (id)11)
      {
        if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
          sub_10000A4A0();
      }
      else
      {
        v6 = -[AccessoryPairingWizard state](self, "state");
        v7 = os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR);
        if (v6 == 14)
        {
          if (v7)
            sub_10000A524();
        }
        else if (v7)
        {
          sub_10000A5A8();
        }
      }
      goto LABEL_34;
    }
    if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
      sub_10000A24C();
    -[AccessoryPairingWizard advanceState](self, "advanceState");
  }
}

- (unint64_t)connectionID
{
  return self->_connectionID;
}

- (void)setConnectionID:(unint64_t)a3
{
  self->_connectionID = a3;
}

- (AccessoryPairingWizardDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
  objc_storeStrong((id *)&self->_centralManager, a3);
}

- (CBPairingAgent)pairingAgent
{
  return self->_pairingAgent;
}

- (void)setPairingAgent:(id)a3
{
  objc_storeStrong((id *)&self->_pairingAgent, a3);
}

- (NSData)accessoryID
{
  return self->_accessoryID;
}

- (void)setAccessoryID:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryID, a3);
}

- (NSString)discoveryName
{
  return self->_discoveryName;
}

- (void)setDiscoveryName:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryName, a3);
}

- (unint64_t)accessoryType
{
  return self->_accessoryType;
}

- (void)setAccessoryType:(unint64_t)a3
{
  self->_accessoryType = a3;
}

- (int)pairingMethod
{
  return self->_pairingMethod;
}

- (void)setPairingMethod:(int)a3
{
  self->_pairingMethod = a3;
}

- (NSSet)accessoryCookies
{
  return self->_accessoryCookies;
}

- (void)setAccessoryCookies:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryCookies, a3);
}

- (BTDaemonAlert)userAlert
{
  return self->_userAlert;
}

- (void)setUserAlert:(id)a3
{
  objc_storeStrong((id *)&self->_userAlert, a3);
}

- (CBPeer)oldPeripheral
{
  return self->_oldPeripheral;
}

- (void)setOldPeripheral:(id)a3
{
  objc_storeStrong((id *)&self->_oldPeripheral, a3);
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (void)setPeripheral:(id)a3
{
  objc_storeStrong((id *)&self->_peripheral, a3);
}

- (unint64_t)connectionTryCount
{
  return self->_connectionTryCount;
}

- (void)setConnectionTryCount:(unint64_t)a3
{
  self->_connectionTryCount = a3;
}

- (int64_t)pairingType
{
  return self->_pairingType;
}

- (void)setPairingType:(int64_t)a3
{
  self->_pairingType = a3;
}

- (NSNumber)passkey
{
  return self->_passkey;
}

- (void)setPasskey:(id)a3
{
  objc_storeStrong((id *)&self->_passkey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passkey, 0);
  objc_storeStrong((id *)&self->_peripheral, 0);
  objc_storeStrong((id *)&self->_oldPeripheral, 0);
  objc_storeStrong((id *)&self->_userAlert, 0);
  objc_storeStrong((id *)&self->_accessoryCookies, 0);
  objc_storeStrong((id *)&self->_discoveryName, 0);
  objc_storeStrong((id *)&self->_accessoryID, 0);
  objc_storeStrong((id *)&self->_pairingAgent, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
