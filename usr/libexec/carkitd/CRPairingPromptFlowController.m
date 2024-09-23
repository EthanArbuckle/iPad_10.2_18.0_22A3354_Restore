@implementation CRPairingPromptFlowController

+ (id)_descriptionForStep:(unint64_t)a3
{
  if (a3 - 1 > 0xE)
    return CFSTR("started");
  else
    return off_1000B6898[a3 - 1];
}

+ (BOOL)_isRequiredStep:(unint64_t)a3
{
  return (a3 > 0xF) | (0xCFu >> a3) & 1;
}

- (CRPairingPromptFlowController)init
{
  CRPairingPromptFlowController *v2;
  CRPairingPromptFlowController *v3;
  NSNumber *pairingAccepted;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRPairingPromptFlowController;
  v2 = -[CRPairingPromptFlowController init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_currentStep = 0;
    v2->_bluetoothFailureReason = 0;
    pairingAccepted = v2->_pairingAccepted;
    v2->_pairingAccepted = 0;

    v3->_waitingOnMessagingVehicleTimeout = 30.0;
  }
  return v3;
}

- (void)handleBluetoothPairingStartedForDeviceIdentifier:(id)a3 showBluetoothOnlyOption:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v10[16];

  v4 = a4;
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v8 = CarPairingLogging(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "received Bluetooth pairing started", v10, 2u);
  }

  -[CRPairingPromptFlowController setBluetoothDeviceIdentifier:](self, "setBluetoothDeviceIdentifier:", v6);
  -[CRPairingPromptFlowController setShowBluetoothOnlyOption:](self, "setShowBluetoothOnlyOption:", v4);
}

- (void)handleBluetoothPairingConfirmationRequestForDeviceIdentifier:(id)a3 vehicleName:(id)a4 numericCode:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint8_t v19[16];

  v8 = a4;
  v9 = a5;
  v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v12 = CarPairingLogging(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "received Bluetooth pairing confirmation request, continuing prompt flow", v19, 2u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController bluetoothDeviceIdentifier](self, "bluetoothDeviceIdentifier"));
  v15 = objc_msgSend(v14, "isEqualToString:", v10);

  if ((v15 & 1) != 0)
  {
    -[CRPairingPromptFlowController setVehicleName:](self, "setVehicleName:", v8);
    -[CRPairingPromptFlowController setNumericCode:](self, "setNumericCode:", v9);
    if (!-[CRPairingPromptFlowController currentStep](self, "currentStep"))
      -[CRPairingPromptFlowController _presentNextStepAfterResponse:](self, "_presentNextStepAfterResponse:", 0);
  }
  else
  {
    v17 = CarPairingLogging(v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_10006D474();

  }
}

- (void)handleBluetoothPairingFailedForDeviceIdentifier:(id)a3 vehicleName:(id)a4 isTimeout:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  unint64_t v19;
  uint8_t v20[16];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v11 = CarPairingLogging(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "received Bluetooth failed, adding failed prompt to flow", v20, 2u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController bluetoothDeviceIdentifier](self, "bluetoothDeviceIdentifier"));
  v14 = v13;
  if (v13)
  {
    v15 = objc_msgSend(v13, "isEqualToString:", v8);
    if ((v15 & 1) == 0)
    {
      v16 = CarPairingLogging(v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_10006D4A0();

      goto LABEL_15;
    }
  }
  else
  {
    -[CRPairingPromptFlowController setBluetoothDeviceIdentifier:](self, "setBluetoothDeviceIdentifier:", v8);
  }
  -[CRPairingPromptFlowController setVehicleName:](self, "setVehicleName:", v9);
  if (v5)
    v18 = 2;
  else
    v18 = 1;
  -[CRPairingPromptFlowController setBluetoothFailureReason:](self, "setBluetoothFailureReason:", v18);
  v19 = -[CRPairingPromptFlowController currentStep](self, "currentStep");
  if (v19 <= 5 && ((1 << v19) & 0x25) != 0)
    -[CRPairingPromptFlowController _presentNextStepAfterResponse:](self, "_presentNextStepAfterResponse:", &__kCFBooleanFalse);
LABEL_15:

}

- (void)handleConnectedMessagingVehicle:(id)a3 pairingAccepted:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  unint64_t v12;
  uint8_t v13[16];

  v6 = a4;
  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v9 = CarPairingLogging(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "received messaging connection, continuing prompt flow", v13, 2u);
  }

  -[CRPairingPromptFlowController setMessagingVehicle:](self, "setMessagingVehicle:", v7);
  -[CRPairingPromptFlowController setPairingAccepted:](self, "setPairingAccepted:", v6);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "vehicleName"));
  -[CRPairingPromptFlowController setVehicleName:](self, "setVehicleName:", v11);

  v12 = -[CRPairingPromptFlowController currentStep](self, "currentStep");
  if (v12 == 5 || !v12)
    -[CRPairingPromptFlowController _presentNextStepAfterResponse:](self, "_presentNextStepAfterResponse:", &__kCFBooleanTrue);
}

- (void)handleUnsupportedMessagingConnectionForDeviceIdentifier:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController bluetoothDeviceIdentifier](self, "bluetoothDeviceIdentifier"));
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  v8 = CarPairingLogging(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if ((v6 & 1) != 0)
  {
    if (v10)
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "received unsupported messaging connection for current prompt flow device, finishing flow", v11, 2u);
    }

    if ((id)-[CRPairingPromptFlowController currentStep](self, "currentStep") == (id)5)
      -[CRPairingPromptFlowController _presentNextStepAfterResponse:](self, "_presentNextStepAfterResponse:", &__kCFBooleanFalse);
  }
  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "received unsupported messaging connection for a device other than current prompt flow device, ignoring", buf, 2u);
    }

  }
}

- (void)handleDisconnectedMessagingVehicle:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v6 = CarPairingLogging(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "disconnected messaging connection", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController messagingVehicle](self, "messagingVehicle"));
  v9 = objc_msgSend(v4, "isEqual:", v8);

  if (v9)
  {
    if (objc_msgSend(v4, "transportType") == (id)2)
    {
      v10 = CarPairingLogging(2);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "ignoring disconnection for BT messaging connection", v12, 2u);
      }

    }
    else
    {
      -[CRPairingPromptFlowController cancel](self, "cancel");
    }
  }

}

- (void)handleCarKeyInitiatedConfirmationForDeviceAddress:(id)a3 showBluetoothOnlyOption:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v10[16];

  v4 = a4;
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v8 = CarPairingLogging(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "received car key initiated confirmation", v10, 2u);
  }

  -[CRPairingPromptFlowController setBluetoothDeviceIdentifier:](self, "setBluetoothDeviceIdentifier:", v6);
  -[CRPairingPromptFlowController setShowBluetoothOnlyOption:](self, "setShowBluetoothOnlyOption:", v4);
  -[CRPairingPromptFlowController setStartedFromCarKey:](self, "setStartedFromCarKey:", 1);
  if (!-[CRPairingPromptFlowController currentStep](self, "currentStep"))
    -[CRPairingPromptFlowController _presentNextStepAfterResponse:](self, "_presentNextStepAfterResponse:", 0);
}

- (void)handleCarKeyInitiatedPairingFailed
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  -[CRPairingPromptFlowController setBluetoothFailureReason:](self, "setBluetoothFailureReason:", 1);
  if ((id)-[CRPairingPromptFlowController currentStep](self, "currentStep") == (id)5)
    -[CRPairingPromptFlowController _presentNextStepAfterResponse:](self, "_presentNextStepAfterResponse:", &__kCFBooleanFalse);
}

- (void)cancel
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  -[CRPairingPromptFlowController _cancelWithRequiredStepsRemaining:](self, "_cancelWithRequiredStepsRemaining:", objc_msgSend((id)objc_opt_class(self), "_isRequiredStep:", -[CRPairingPromptFlowController currentStep](self, "currentStep")));
}

- (void)_cancelWithRequiredStepsRemaining:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;

  v3 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController promptDelegate](self, "promptDelegate"));
  v6 = (void *)v5;
  if (v5)
  {
    v8 = (void *)v5;
    v7 = objc_opt_respondsToSelector(v5, "pairingPromptFlow:didCancelWithRequiredStepsRemaining:");
    v6 = v8;
    if ((v7 & 1) != 0)
    {
      objc_msgSend(v8, "pairingPromptFlow:didCancelWithRequiredStepsRemaining:", self, v3);
      v6 = v8;
    }
  }

}

- (BOOL)_isMessagingBluetoothConnected
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController messagingVehicle](self, "messagingVehicle"));
  v3 = (((unint64_t)objc_msgSend(v2, "transportType") - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0;

  return v3;
}

- (BOOL)_supportsUSB
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController messagingVehicle](self, "messagingVehicle"));
  v3 = objc_msgSend(v2, "supportsUSBCarPlay");

  return v3;
}

- (BOOL)_supportsOutOfBandPairing
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController messagingVehicle](self, "messagingVehicle"));
  if (objc_msgSend(v2, "supportsWirelessCarPlay"))
    v3 = objc_msgSend(v2, "supportsWiredBluetoothPairing");
  else
    v3 = 0;

  return v3;
}

- (BOOL)_hasExistingBluetoothPairing
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  int v10;
  const __CFString *v11;

  v3 = objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController promptDelegate](self, "promptDelegate"));
  v4 = (void *)v3;
  if (v3 && (v3 = objc_opt_respondsToSelector(v3, "hasExistingBluetoothPairingForPairingPromptFlow:"), (v3 & 1) != 0))
  {
    v3 = (uint64_t)objc_msgSend(v4, "hasExistingBluetoothPairingForPairingPromptFlow:", self);
    v5 = v3;
  }
  else
  {
    v5 = 0;
  }
  v6 = CarPairingLogging(v3);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = CFSTR("NO");
    if (v5)
      v8 = CFSTR("YES");
    v10 = 138412290;
    v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "has existing Bluetooth pairing: %@", (uint8_t *)&v10, 0xCu);
  }

  return v5;
}

- (BOOL)_supportsEnhancedIntegration
{
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;

  v3 = objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController promptDelegate](self, "promptDelegate"));
  v4 = (void *)v3;
  if (v3 && (objc_opt_respondsToSelector(v3, "enhancedIntegrationSupportedForPairingPromptFlow:") & 1) != 0)
    v5 = objc_msgSend(v4, "enhancedIntegrationSupportedForPairingPromptFlow:", self);
  else
    v5 = 0;

  return v5;
}

- (BOOL)_supportsThemeAssets
{
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;

  v3 = objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController promptDelegate](self, "promptDelegate"));
  v4 = (void *)v3;
  if (v3 && (objc_opt_respondsToSelector(v3, "supportsThemeAssetsForPairingPromptFlow:") & 1) != 0)
    v5 = objc_msgSend(v4, "supportsThemeAssetsForPairingPromptFlow:", self);
  else
    v5 = 0;

  return v5;
}

- (BOOL)_needsBluetoothTurnedOn
{
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;

  v3 = objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController promptDelegate](self, "promptDelegate"));
  v4 = (void *)v3;
  if (v3 && (objc_opt_respondsToSelector(v3, "needsBluetoothTurnedOnForPairingPromptFlow:") & 1) != 0)
    v5 = objc_msgSend(v4, "needsBluetoothTurnedOnForPairingPromptFlow:", self);
  else
    v5 = 0;

  return v5;
}

- (BOOL)_needsWiFiTurnedOn
{
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;

  v3 = objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController promptDelegate](self, "promptDelegate"));
  v4 = (void *)v3;
  if (v3 && (objc_opt_respondsToSelector(v3, "needsWiFiTurnedOnForPairingPromptFlow:") & 1) != 0)
    v5 = objc_msgSend(v4, "needsWiFiTurnedOnForPairingPromptFlow:", self);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)_outOfBandPairingDeclineCount
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  int v9;
  id v10;

  v3 = objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController promptDelegate](self, "promptDelegate"));
  v4 = (void *)v3;
  if (v3 && (objc_opt_respondsToSelector(v3, "outOfBandPairingDeclineCountForPairingPromptFlow:") & 1) != 0)
  {
    v5 = objc_msgSend(v4, "outOfBandPairingDeclineCountForPairingPromptFlow:", self);
    v6 = CarPairingLogging(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = 134217984;
      v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "OOB pairing decline count: %lu", (uint8_t *)&v9, 0xCu);
    }

  }
  else
  {
    v5 = 0;
  }

  return (unint64_t)v5;
}

- (void)_incrementOutOfBandPairingDeclineCount
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController promptDelegate](self, "promptDelegate"));
  v4 = (void *)v3;
  if (v3 && (objc_opt_respondsToSelector(v3, "incrementOutOfBandPairingDeclineCountForPairingPromptFlow:") & 1) != 0)
  {
    v5 = CarPairingLogging(objc_msgSend(v4, "incrementOutOfBandPairingDeclineCountForPairingPromptFlow:", self));
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "incremented OOB pairing decline count", v7, 2u);
    }

  }
}

- (id)_carKeyInfo
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController promptDelegate](self, "promptDelegate"));
  v4 = (void *)v3;
  if (v3 && (objc_opt_respondsToSelector(v3, "carKeyInfoForPairingPromptFlow:") & 1) != 0)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "carKeyInfoForPairingPromptFlow:", self));
  else
    v5 = 0;

  return v5;
}

- (BOOL)_supportsCarKeys
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  int v8;
  const __CFString *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController _carKeyInfo](self, "_carKeyInfo"));

  v4 = CarPairingLogging(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = CFSTR("NO");
    if (v2)
      v6 = CFSTR("YES");
    v8 = 138412290;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "supports car keys: %@", (uint8_t *)&v8, 0xCu);
  }

  return v2 != 0;
}

- (unint64_t)_nextStepAfterResponse:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v16;

  v4 = a3;
  switch(-[CRPairingPromptFlowController currentStep](self, "currentStep"))
  {
    case 0uLL:
      if (-[CRPairingPromptFlowController bluetoothFailureReason](self, "bluetoothFailureReason"))
        goto LABEL_12;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController messagingVehicle](self, "messagingVehicle"));
      if (v6)
      {

      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController numericCode](self, "numericCode"));

        if (v16)
        {
          v5 = 2;
          goto LABEL_35;
        }
      }
      if (-[CRPairingPromptFlowController startedFromCarKey](self, "startedFromCarKey"))
        v5 = 1;
      else
        v5 = 5;
      goto LABEL_35;
    case 1uLL:
      v7 = objc_msgSend(v4, "BOOLValue") == 0;
      v8 = 15;
      v9 = 5;
      goto LABEL_26;
    case 2uLL:
      if (-[CRPairingPromptFlowController bluetoothFailureReason](self, "bluetoothFailureReason"))
      {
LABEL_12:
        v5 = 4;
        goto LABEL_35;
      }
      if (!objc_msgSend(v4, "BOOLValue"))
        goto LABEL_2;
      v7 = !-[CRPairingPromptFlowController showBluetoothOnlyOption](self, "showBluetoothOnlyOption");
      v8 = 5;
      v9 = 3;
      goto LABEL_26;
    case 3uLL:
      v10 = -[CRPairingPromptFlowController bluetoothFailureReason](self, "bluetoothFailureReason") == 0;
      v11 = 4;
      goto LABEL_32;
    case 4uLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
      goto LABEL_2;
    case 5uLL:
      if (objc_msgSend(v4, "BOOLValue"))
      {
        if (-[CRPairingPromptFlowController _isMessagingBluetoothConnected](self, "_isMessagingBluetoothConnected")
          && (v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController pairingAccepted](self, "pairingAccepted")),
              v12,
              !v12))
        {
          v5 = 8;
        }
        else if (-[CRPairingPromptFlowController _supportsUSB](self, "_supportsUSB")
               && (v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController pairingAccepted](self, "pairingAccepted")),
                   v13,
                   !v13))
        {
          v5 = 6;
        }
        else if (-[CRPairingPromptFlowController _supportsOutOfBandPairing](self, "_supportsOutOfBandPairing"))
        {
          v5 = 7;
        }
        else
        {
          v14 = -[CRPairingPromptFlowController startedFromCarKey](self, "startedFromCarKey");
LABEL_25:
          v7 = v14 == 0;
          v8 = 15;
          v9 = 9;
LABEL_26:
          if (v7)
            v5 = v8;
          else
            v5 = v9;
        }
      }
      else if (-[CRPairingPromptFlowController bluetoothFailureReason](self, "bluetoothFailureReason"))
      {
        v5 = 4;
      }
      else
      {
        v5 = 15;
      }
LABEL_35:

      return v5;
    case 6uLL:
      if (!objc_msgSend(v4, "BOOLValue"))
        goto LABEL_2;
      v7 = !-[CRPairingPromptFlowController _supportsOutOfBandPairing](self, "_supportsOutOfBandPairing");
      v8 = 9;
      v9 = 7;
      goto LABEL_26;
    case 7uLL:
      v5 = 9;
      goto LABEL_35;
    case 8uLL:
      v14 = objc_msgSend(v4, "BOOLValue");
      goto LABEL_25;
    case 9uLL:
      if (-[CRPairingPromptFlowController _supportsThemeAssets](self, "_supportsThemeAssets"))
      {
        v5 = 11;
      }
      else if (-[CRPairingPromptFlowController _supportsEnhancedIntegration](self, "_supportsEnhancedIntegration"))
      {
        v5 = 10;
      }
      else
      {
LABEL_41:
        if (!-[CRPairingPromptFlowController _supportsCarKeys](self, "_supportsCarKeys")
          || -[CRPairingPromptFlowController startedFromCarKey](self, "startedFromCarKey"))
        {
LABEL_2:
          v5 = 15;
        }
        else
        {
          v5 = 14;
        }
      }
      goto LABEL_35;
    case 0xAuLL:
      goto LABEL_41;
    case 0xBuLL:
      v10 = objc_msgSend(v4, "BOOLValue") == 0;
      v11 = 12;
LABEL_32:
      if (v10)
        v5 = v11 + 1;
      else
        v5 = v11;
      goto LABEL_35;
    default:
      v5 = 0;
      goto LABEL_35;
  }
}

- (void)_presentNextStepAfterResponse:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  _QWORD *v10;
  void (**v11)(_QWORD, _QWORD);
  uint64_t v12;
  NSObject *v13;
  void *v14;
  BOOL v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;

  v4 = a3;
  v5 = -[CRPairingPromptFlowController _nextStepAfterResponse:](self, "_nextStepAfterResponse:", v4);
  v6 = CarPairingLogging(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend((id)objc_opt_class(self), "_descriptionForStep:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 138543362;
    v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "next pairing step: [%{public}@]", buf, 0xCu);

  }
  -[CRPairingPromptFlowController setCurrentStep:](self, "setCurrentStep:", v5);
  objc_initWeak((id *)buf, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10003DD78;
  v16[3] = &unk_1000B6680;
  objc_copyWeak(&v17, (id *)buf);
  v10 = objc_retainBlock(v16);
  v11 = (void (**)(_QWORD, _QWORD))v10;
  switch(v5)
  {
    case 0uLL:
      v12 = CarPairingLogging(v10);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10006D4CC();

      goto LABEL_7;
    case 1uLL:
      -[CRPairingPromptFlowController _presentConnectCarPlayFromCarKeyPromptWithCompletion:](self, "_presentConnectCarPlayFromCarKeyPromptWithCompletion:", v10);
      break;
    case 2uLL:
      -[CRPairingPromptFlowController _presentBluetoothConfirmationPromptWithCompletion:](self, "_presentBluetoothConfirmationPromptWithCompletion:", v10);
      break;
    case 3uLL:
      -[CRPairingPromptFlowController _presentBluetoothContactsSyncPromptWithCompletion:](self, "_presentBluetoothContactsSyncPromptWithCompletion:", v10);
      break;
    case 4uLL:
      -[CRPairingPromptFlowController _presentBluetoothFailedPromptWithCompletion:](self, "_presentBluetoothFailedPromptWithCompletion:", v10);
      break;
    case 5uLL:
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController messagingVehicle](self, "messagingVehicle"));
      v15 = v14 == 0;

      if (v15)
        -[CRPairingPromptFlowController _presentWaitingPrompt](self, "_presentWaitingPrompt");
      else
        ((void (**)(_QWORD, void *))v11)[2](v11, &__kCFBooleanTrue);
      break;
    case 6uLL:
      -[CRPairingPromptFlowController _presentAllowWhileLockedPromptWithCompletion:](self, "_presentAllowWhileLockedPromptWithCompletion:", v10);
      break;
    case 7uLL:
      -[CRPairingPromptFlowController _presentUseWirelessCarPlayPromptWithCompletion:](self, "_presentUseWirelessCarPlayPromptWithCompletion:", v10);
      break;
    case 8uLL:
      -[CRPairingPromptFlowController _presentConnectCarPlayPromptWithCompletion:](self, "_presentConnectCarPlayPromptWithCompletion:", v10);
      break;
    case 9uLL:
      ((void (*)(_QWORD *, _QWORD))v10[2])(v10, 0);
      break;
    case 0xAuLL:
      -[CRPairingPromptFlowController _presentEnhancedIntegrationPromptWithCompletion:](self, "_presentEnhancedIntegrationPromptWithCompletion:", v10);
      break;
    case 0xBuLL:
      -[CRPairingPromptFlowController _presentAssetProgressPromptWithCompletion:](self, "_presentAssetProgressPromptWithCompletion:", v10);
      break;
    case 0xCuLL:
      -[CRPairingPromptFlowController _presentAssetReadyPromptWithCompletion:](self, "_presentAssetReadyPromptWithCompletion:", v10);
      break;
    case 0xDuLL:
      -[CRPairingPromptFlowController _presentAssetReadySoonPromptWithCompletion:](self, "_presentAssetReadySoonPromptWithCompletion:", v10);
      break;
    case 0xEuLL:
      -[CRPairingPromptFlowController _presentSetupCarKeysWithCompletion:](self, "_presentSetupCarKeysWithCompletion:", v10);
      break;
    case 0xFuLL:
LABEL_7:
      -[CRPairingPromptFlowController _dismiss](self, "_dismiss");
      break;
    default:
      break;
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

- (void)_performPresentationAction:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController promptDelegate](self, "promptDelegate"));
  v5 = (void *)v4;
  if (v4 && (objc_opt_respondsToSelector(v4, "pairingPromptFlow:wantsToPerformPresentation:") & 1) != 0)
    objc_msgSend(v5, "pairingPromptFlow:wantsToPerformPresentation:", self, v6);

}

- (void)_dismiss
{
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;

  v3 = objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController promptDelegate](self, "promptDelegate"));
  v4 = (void *)v3;
  if (v3)
  {
    v6 = (void *)v3;
    v5 = objc_opt_respondsToSelector(v3, "didCompletePairingPromptFlow:");
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "didCompletePairingPromptFlow:", self);
      v4 = v6;
    }
  }

}

- (void)_presentBluetoothConfirmationPromptWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController bluetoothDeviceIdentifier](self, "bluetoothDeviceIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController vehicleName](self, "vehicleName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController numericCode](self, "numericCode"));
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003E074;
  v12[3] = &unk_1000B66A8;
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  objc_copyWeak(&v17, &location);
  v10 = v5;
  v15 = v10;
  v11 = v4;
  v16 = v11;
  -[CRPairingPromptFlowController _performPresentationAction:](self, "_performPresentationAction:", v12);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)_presentBluetoothContactsSyncPromptWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController bluetoothDeviceIdentifier](self, "bluetoothDeviceIdentifier"));
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003E3D4;
  v8[3] = &unk_1000B66D0;
  objc_copyWeak(&v11, &location);
  v6 = v5;
  v9 = v6;
  v7 = v4;
  v10 = v7;
  -[CRPairingPromptFlowController _performPresentationAction:](self, "_performPresentationAction:", v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)_presentBluetoothFailedPromptWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  BOOL v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController vehicleName](self, "vehicleName"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003E6FC;
  v8[3] = &unk_1000B66F8;
  v11 = (id)-[CRPairingPromptFlowController bluetoothFailureReason](self, "bluetoothFailureReason") == (id)2;
  v9 = v5;
  v10 = v4;
  v6 = v4;
  v7 = v5;
  -[CRPairingPromptFlowController _performPresentationAction:](self, "_performPresentationAction:", v8);

}

- (void)_presentWaitingPrompt
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = CarPairingLogging(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "waiting on messaging connection", v5, 2u);
  }

  -[CRPairingPromptFlowController _startWaitingOnMessagingVehicleTimer](self, "_startWaitingOnMessagingVehicleTimer");
  -[CRPairingPromptFlowController _performPresentationAction:](self, "_performPresentationAction:", &stru_1000B6738);
}

- (void)_presentAllowWhileLockedPromptWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController vehicleName](self, "vehicleName"));
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003E978;
  v8[3] = &unk_1000B6788;
  v6 = v5;
  v9 = v6;
  objc_copyWeak(&v11, &location);
  v7 = v4;
  v10 = v7;
  -[CRPairingPromptFlowController _performPresentationAction:](self, "_performPresentationAction:", v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)_presentUseWirelessCarPlayPromptWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  _BOOL8 v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unsigned int v12;
  _BOOL8 v13;
  _BOOL4 v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  _BOOL8 v23;
  _BOOL4 v24;
  uint64_t v25;
  _BOOL4 v26;
  _QWORD v27[5];
  void (**v28)(id, _QWORD);
  id v29[3];
  char v30;
  BOOL v31;
  id buf[2];

  v4 = (void (**)(id, _QWORD))a3;
  v5 = -[CRPairingPromptFlowController _hasExistingBluetoothPairing](self, "_hasExistingBluetoothPairing");
  if (v5)
  {
    v6 = CarPairingLogging(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      v8 = "already paired, will not present OOB prompt";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)buf, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v9 = -[CRPairingPromptFlowController _outOfBandPairingDeclineCount](self, "_outOfBandPairingDeclineCount");
  if (v9 >= 4)
  {
    v10 = CarPairingLogging(v9);
    v7 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      v8 = "at maximum decline count for OOB prompt, will not present";
      goto LABEL_7;
    }
LABEL_8:

    v4[2](v4, 0);
    goto LABEL_30;
  }
  v11 = v9;
  v12 = -[CRPairingPromptFlowController _needsBluetoothTurnedOn](self, "_needsBluetoothTurnedOn");
  v13 = -[CRPairingPromptFlowController _needsWiFiTurnedOn](self, "_needsWiFiTurnedOn");
  v14 = v13;
  if (v12)
  {
    v15 = CarPairingLogging(v13);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "OOB prompt will ask to enable Bluetooth", (uint8_t *)buf, 2u);
    }

    v17 = 1;
    if (!v14)
      goto LABEL_18;
    goto LABEL_15;
  }
  v17 = 0;
  if (v13)
  {
LABEL_15:
    v18 = CarPairingLogging(v13);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "OOB prompt will ask to enable Wi-Fi", (uint8_t *)buf, 2u);
    }

    v17 |= 2uLL;
  }
LABEL_18:
  if (v11 < 3)
  {
    v23 = -[CRPairingPromptFlowController _supportsUSB](self, "_supportsUSB");
    v24 = v23;
    v25 = CarPairingLogging(v23);
    v21 = objc_claimAutoreleasedReturnValue(v25);
    v26 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v24)
    {
      if (v26)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "supports USB - OOB prompt will have USB decline variant", (uint8_t *)buf, 2u);
      }
      v22 = 0;
    }
    else
    {
      if (v26)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "OOB prompt will have not now decline variant", (uint8_t *)buf, 2u);
      }
      v22 = 1;
    }
  }
  else
  {
    v20 = CarPairingLogging(v13);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      v22 = 2;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "OOB prompt will have don't use decline variant", (uint8_t *)buf, 2u);
    }
    else
    {
      v22 = 2;
    }
  }

  objc_initWeak(buf, self);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10003EED0;
  v27[3] = &unk_1000B67D8;
  objc_copyWeak(v29, buf);
  v30 = v12;
  v31 = v14;
  v27[4] = self;
  v28 = v4;
  v29[1] = (id)v17;
  v29[2] = (id)v22;
  -[CRPairingPromptFlowController _performPresentationAction:](self, "_performPresentationAction:", v27);

  objc_destroyWeak(v29);
  objc_destroyWeak(buf);
LABEL_30:

}

- (void)_presentConnectCarPlayPromptWithCompletion:(id)a3
{
  id v4;
  unsigned __int8 v5;
  _BOOL8 v6;
  BOOL v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14[2];
  BOOL v15;
  unsigned __int8 v16;
  id buf[2];

  v4 = a3;
  v5 = -[CRPairingPromptFlowController showBluetoothOnlyOption](self, "showBluetoothOnlyOption");
  v6 = -[CRPairingPromptFlowController _needsWiFiTurnedOn](self, "_needsWiFiTurnedOn");
  v7 = v6;
  if (v6)
  {
    v8 = CarPairingLogging(v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "connect prompt will ask to enable Wi-Fi", (uint8_t *)buf, 2u);
    }

    v10 = 2;
  }
  else
  {
    v10 = 0;
  }
  objc_initWeak(buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003F260;
  v12[3] = &unk_1000B6828;
  objc_copyWeak(v14, buf);
  v15 = v7;
  v11 = v4;
  v12[4] = self;
  v13 = v11;
  v16 = v5;
  v14[1] = (id)v10;
  -[CRPairingPromptFlowController _performPresentationAction:](self, "_performPresentationAction:", v12);

  objc_destroyWeak(v14);
  objc_destroyWeak(buf);

}

- (void)_presentConnectCarPlayFromCarKeyPromptWithCompletion:(id)a3
{
  id v4;
  unsigned __int8 v5;
  _BOOL8 v6;
  BOOL v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14[2];
  BOOL v15;
  unsigned __int8 v16;
  id buf[2];

  v4 = a3;
  v5 = -[CRPairingPromptFlowController showBluetoothOnlyOption](self, "showBluetoothOnlyOption");
  v6 = -[CRPairingPromptFlowController _needsWiFiTurnedOn](self, "_needsWiFiTurnedOn");
  v7 = v6;
  if (v6)
  {
    v8 = CarPairingLogging(v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "connect prompt will ask to enable Wi-Fi", (uint8_t *)buf, 2u);
    }

    v10 = 2;
  }
  else
  {
    v10 = 0;
  }
  objc_initWeak(buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003F618;
  v12[3] = &unk_1000B6828;
  objc_copyWeak(v14, buf);
  v15 = v7;
  v11 = v4;
  v12[4] = self;
  v13 = v11;
  v16 = v5;
  v14[1] = (id)v10;
  -[CRPairingPromptFlowController _performPresentationAction:](self, "_performPresentationAction:", v12);

  objc_destroyWeak(v14);
  objc_destroyWeak(buf);

}

- (void)_presentEnhancedIntegrationPromptWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController vehicleName](self, "vehicleName"));
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003F9B8;
  v8[3] = &unk_1000B6788;
  v6 = v5;
  v9 = v6;
  objc_copyWeak(&v11, &location);
  v7 = v4;
  v10 = v7;
  -[CRPairingPromptFlowController _performPresentationAction:](self, "_performPresentationAction:", v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)_presentAssetProgressPromptWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController vehicleName](self, "vehicleName"));
  v6 = objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController promptDelegate](self, "promptDelegate"));
  v7 = (void *)v6;
  if (v6 && (objc_opt_respondsToSelector(v6, "assetProgressForPairingPromptFlow:") & 1) != 0)
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetProgressForPairingPromptFlow:", self));
  else
    v8 = 0;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003FD14;
  v12[3] = &unk_1000B6850;
  v9 = v5;
  v13 = v9;
  v10 = v8;
  v14 = v10;
  v11 = v4;
  v15 = v11;
  objc_copyWeak(&v16, &location);
  -[CRPairingPromptFlowController _performPresentationAction:](self, "_performPresentationAction:", v12);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
}

- (void)_presentAssetReadyPromptWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100040018;
  v7[3] = &unk_1000B60D8;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController vehicleName](self, "vehicleName"));
  v9 = v4;
  v5 = v4;
  v6 = v8;
  -[CRPairingPromptFlowController _performPresentationAction:](self, "_performPresentationAction:", v7);

}

- (void)_presentAssetReadySoonPromptWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000401AC;
  v7[3] = &unk_1000B60D8;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController vehicleName](self, "vehicleName"));
  v9 = v4;
  v5 = v4;
  v6 = v8;
  -[CRPairingPromptFlowController _performPresentationAction:](self, "_performPresentationAction:", v7);

}

- (void)_presentSetupCarKeysWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100040368;
  v8[3] = &unk_1000B6878;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController vehicleName](self, "vehicleName"));
  v10 = (id)objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController _carKeyInfo](self, "_carKeyInfo"));
  v11 = v4;
  v5 = v4;
  v6 = v10;
  v7 = v9;
  -[CRPairingPromptFlowController _performPresentationAction:](self, "_performPresentationAction:", v8);

}

- (void)_startWaitingOnMessagingVehicleTimer
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = CarPairingLogging(-[CRPairingPromptFlowController _stopWaitingOnMessagingVehicleTimer](self, "_stopWaitingOnMessagingVehicleTimer"));
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "starting waiting on messaging vehicle timer", v6, 2u);
  }

  -[CRPairingPromptFlowController waitingOnMessagingVehicleTimeout](self, "waitingOnMessagingVehicleTimeout");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_handleTimedOutWaitingOnMessagingVehicle:", 0, 0));
  -[CRPairingPromptFlowController setWaitingOnMessagingVehicleTimer:](self, "setWaitingOnMessagingVehicleTimer:", v5);

}

- (void)_stopWaitingOnMessagingVehicleTimer
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRPairingPromptFlowController waitingOnMessagingVehicleTimer](self, "waitingOnMessagingVehicleTimer"));
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "isValid");
    if ((_DWORD)v5)
    {
      v6 = CarPairingLogging(v5);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "stopping waiting on messaging vehicle timer", v8, 2u);
      }

      objc_msgSend(v4, "invalidate");
      -[CRPairingPromptFlowController setWaitingOnMessagingVehicleTimer:](self, "setWaitingOnMessagingVehicleTimer:", 0);
    }
  }

}

- (void)_handleTimedOutWaitingOnMessagingVehicle:(id)a3
{
  uint64_t v4;
  NSObject *v5;

  v4 = CarPairingLogging(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_10006D4F8();

  if ((id)-[CRPairingPromptFlowController currentStep](self, "currentStep") == (id)5)
    -[CRPairingPromptFlowController _presentNextStepAfterResponse:](self, "_presentNextStepAfterResponse:", &__kCFBooleanFalse);
}

- (CRMessagingServiceVehicleRepresenting)messagingVehicle
{
  return self->_messagingVehicle;
}

- (void)setMessagingVehicle:(id)a3
{
  objc_storeStrong((id *)&self->_messagingVehicle, a3);
}

- (NSString)bluetoothDeviceIdentifier
{
  return self->_bluetoothDeviceIdentifier;
}

- (void)setBluetoothDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothDeviceIdentifier, a3);
}

- (CRPairingPromptFlowDelegate)promptDelegate
{
  return (CRPairingPromptFlowDelegate *)objc_loadWeakRetained((id *)&self->_promptDelegate);
}

- (void)setPromptDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_promptDelegate, a3);
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong(&self->_userInfo, a3);
}

- (BOOL)startedFromCarKey
{
  return self->_startedFromCarKey;
}

- (void)setStartedFromCarKey:(BOOL)a3
{
  self->_startedFromCarKey = a3;
}

- (unint64_t)currentStep
{
  return self->_currentStep;
}

- (void)setCurrentStep:(unint64_t)a3
{
  self->_currentStep = a3;
}

- (NSNumber)bluetoothConfirmed
{
  return self->_bluetoothConfirmed;
}

- (void)setBluetoothConfirmed:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothConfirmed, a3);
}

- (NSString)vehicleName
{
  return self->_vehicleName;
}

- (void)setVehicleName:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleName, a3);
}

- (NSString)numericCode
{
  return self->_numericCode;
}

- (void)setNumericCode:(id)a3
{
  objc_storeStrong((id *)&self->_numericCode, a3);
}

- (BOOL)showBluetoothOnlyOption
{
  return self->_showBluetoothOnlyOption;
}

- (void)setShowBluetoothOnlyOption:(BOOL)a3
{
  self->_showBluetoothOnlyOption = a3;
}

- (unint64_t)bluetoothFailureReason
{
  return self->_bluetoothFailureReason;
}

- (void)setBluetoothFailureReason:(unint64_t)a3
{
  self->_bluetoothFailureReason = a3;
}

- (NSTimer)waitingOnMessagingVehicleTimer
{
  return self->_waitingOnMessagingVehicleTimer;
}

- (void)setWaitingOnMessagingVehicleTimer:(id)a3
{
  objc_storeStrong((id *)&self->_waitingOnMessagingVehicleTimer, a3);
}

- (NSNumber)pairingAccepted
{
  return self->_pairingAccepted;
}

- (void)setPairingAccepted:(id)a3
{
  objc_storeStrong((id *)&self->_pairingAccepted, a3);
}

- (double)waitingOnMessagingVehicleTimeout
{
  return self->_waitingOnMessagingVehicleTimeout;
}

- (void)setWaitingOnMessagingVehicleTimeout:(double)a3
{
  self->_waitingOnMessagingVehicleTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingAccepted, 0);
  objc_storeStrong((id *)&self->_waitingOnMessagingVehicleTimer, 0);
  objc_storeStrong((id *)&self->_numericCode, 0);
  objc_storeStrong((id *)&self->_vehicleName, 0);
  objc_storeStrong((id *)&self->_bluetoothConfirmed, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_destroyWeak((id *)&self->_promptDelegate);
  objc_storeStrong((id *)&self->_bluetoothDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_messagingVehicle, 0);
}

@end
