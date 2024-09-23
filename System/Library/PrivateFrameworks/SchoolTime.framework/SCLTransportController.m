@implementation SCLTransportController

- (SCLTransportController)initWithNRDevice:(id)a3 deviceRegistry:(id)a4 service:(id)a5 deviceIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SCLTransportController *v15;
  SCLTransportController *v16;
  uint64_t v17;
  NSString *IDSDeviceIdentifier;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SCLTransportController;
  v15 = -[SCLTransportController init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_NRDevice, a3);
    objc_storeStrong((id *)&v16->_deviceRegistry, a4);
    objc_storeStrong((id *)&v16->_service, a5);
    v17 = objc_msgSend(v14, "copy");
    IDSDeviceIdentifier = v16->_IDSDeviceIdentifier;
    v16->_IDSDeviceIdentifier = (NSString *)v17;

  }
  return v16;
}

- (IDSDevice)device
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;

  -[SCLTransportController service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "linkedDevicesWithRelationship:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCLTransportController deviceRegistry](self, "deviceRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLTransportController NRDevice](self, "NRDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceForNRDevice:fromIDSDevices:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    scl_pairing_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[SCLTransportController device].cold.2(self, (uint64_t)v4, v8);

  }
  scl_pairing_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[SCLTransportController device].cold.1();

  return (IDSDevice *)v7;
}

- (void)service:(id)a3 incomingProtobuf:(id)a4 fromID:(id)a5 context:(id)a6
{
  id v7;
  void *v8;
  NSObject *v9;
  SCLPBScheduleSettings *v10;
  void *v11;
  SCLPBScheduleSettings *v12;
  NSObject *v13;
  SCLPBUnlockHistoryItem *v14;
  void *v15;
  SCLPBScheduleRequestResponse *v16;
  void *v17;
  void *v18;

  v7 = a4;
  -[SCLTransportController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    scl_transport_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[SCLTransportController service:incomingProtobuf:fromID:context:].cold.2(self, v9);

  }
  switch(objc_msgSend(v7, "type"))
  {
    case 1u:
      v10 = [SCLPBScheduleSettings alloc];
      objc_msgSend(v7, "data");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[SCLPBScheduleSettings initWithData:](v10, "initWithData:", v11);

      -[SCLTransportController handleIncomingSchedule:forType:](self, "handleIncomingSchedule:forType:", v12, objc_msgSend(v7, "type"));
      goto LABEL_14;
    case 2u:
      v14 = [SCLPBUnlockHistoryItem alloc];
      objc_msgSend(v7, "data");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[SCLPBUnlockHistoryItem initWithData:](v14, "initWithData:", v15);

      -[SCLTransportController handleIncomingHistoryItem:](self, "handleIncomingHistoryItem:", v12);
      goto LABEL_14;
    case 3u:
      -[SCLTransportController handleRemoteScheduleSettingsRequest](self, "handleRemoteScheduleSettingsRequest");
      break;
    case 4u:
      v16 = [SCLPBScheduleRequestResponse alloc];
      objc_msgSend(v7, "data");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[SCLPBScheduleRequestResponse initWithData:](v16, "initWithData:", v17);

      if (-[SCLPBScheduleSettings hasScheduleSettings](v12, "hasScheduleSettings"))
      {
        -[SCLPBScheduleSettings scheduleSettings](v12, "scheduleSettings");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SCLTransportController handleIncomingSchedule:forType:](self, "handleIncomingSchedule:forType:", v18, objc_msgSend(v7, "type"));

      }
LABEL_14:

      break;
    default:
      scl_transport_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[SCLTransportController service:incomingProtobuf:fromID:context:].cold.1(v7, v13);

      break;
  }

}

- (void)service:(id)a3 didDeliverMessageWithIdentifier:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SCLTransportController settingsSyncCoordinator](self, "settingsSyncCoordinator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didDeliverMessageWithIdentifier:", v5);

}

- (void)service:(id)a3 identifier:(id)a4 didSendWithSuccess:(BOOL)a5 error:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;

  v6 = a5;
  v9 = a6;
  v10 = a4;
  -[SCLTransportController settingsSyncCoordinator](self, "settingsSyncCoordinator");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier:didSendWithSuccess:error:", v10, v6, v9);

}

- (void)addUnlockHistoryItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  SCLPBUnlockHistoryItemFromSCLUnlockHistoryItem(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4FC88]), "initWithProtobufData:type:isResponse:", v5, 2, 0);
  -[SCLTransportController transportService](self, "transportService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLTransportController device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = 0;
  v9 = objc_msgSend(v7, "sendProtobuf:toDevice:options:identifier:error:", v6, v8, 0, &v15, &v14);
  v10 = v15;
  v11 = v14;

  scl_transport_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((v9 & 1) != 0)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v10;
      _os_log_impl(&dword_21E4AD000, v13, OS_LOG_TYPE_DEFAULT, "Sent history item with identifier %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    -[SCLTransportController addUnlockHistoryItem:].cold.1();
  }

}

- (void)handleIncomingSchedule:(id)a3 forType:(int)a4
{
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  SCLScheduleSettingsFromSCLPBScheduleSettings(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  scl_transport_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 1024;
    v12 = a4 == 4;
    _os_log_impl(&dword_21E4AD000, v7, OS_LOG_TYPE_DEFAULT, "Received incoming schedule: %@ forInitialSync: %{BOOL}u", (uint8_t *)&v9, 0x12u);
  }

  -[SCLTransportController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transportController:didReceiveSchedule:forInitialSync:", self, v6, a4 == 4);

}

- (void)handleIncomingHistoryItem:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  SCLUnlockHistoryItemFromSCLPBUnlockHistoryItem(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  scl_transport_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_21E4AD000, v5, OS_LOG_TYPE_INFO, "Handle incoming history item %@", (uint8_t *)&v7, 0xCu);
  }

  -[SCLTransportController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transportController:didReceiveUnlockHistoryItem:", self, v4);

}

- (void)handleRemoteScheduleSettingsRequest
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21E4AD000, v0, v1, "Failed to send remote schedule response: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (BOOL)sendSchedule:(id)a3 identifier:(id *)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  SCLPBScheduleSettingsFromSCLScheduleSettings(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4FC88]), "initWithProtobufData:type:isResponse:", v9, 1, 0);
  v15 = *MEMORY[0x24BE4FB48];
  v16[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLTransportController transportService](self, "transportService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLTransportController device](self, "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v12, "sendProtobuf:toDevice:options:identifier:error:", v10, v13, v11, a4, a5);

  return (char)a5;
}

- (void)applySchedule:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  SCLPBScheduleSettingsFromSCLScheduleSettings(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4FC88]), "initWithProtobufData:type:isResponse:", v5, 1, 0);
  v19 = *MEMORY[0x24BE4FB48];
  v20[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLTransportController transportService](self, "transportService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLTransportController device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = 0;
  v10 = objc_msgSend(v8, "sendProtobuf:toDevice:options:identifier:error:", v6, v9, v7, &v16, &v15);
  v11 = v16;
  v12 = v15;

  scl_transport_log();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((v10 & 1) != 0)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v11;
      _os_log_impl(&dword_21E4AD000, v14, OS_LOG_TYPE_DEFAULT, "Sent schedule with identifier %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    -[SCLTransportController applySchedule:].cold.1();
  }

}

- (void)requestRemoteSettings
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21E4AD000, v0, v1, "Failed to send remote schedule request: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (NRDevice)NRDevice
{
  return self->_NRDevice;
}

- (NRPairedDeviceRegistry)deviceRegistry
{
  return self->_deviceRegistry;
}

- (IDSService)service
{
  return self->_service;
}

- (NSString)IDSDeviceIdentifier
{
  return self->_IDSDeviceIdentifier;
}

- (SCLTransportService)transportService
{
  return (SCLTransportService *)objc_loadWeakRetained((id *)&self->_transportService);
}

- (void)setTransportService:(id)a3
{
  objc_storeWeak((id *)&self->_transportService, a3);
}

- (SCLTransportControllerDelegate)delegate
{
  return (SCLTransportControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SCLSettingsSyncCoordinator)settingsSyncCoordinator
{
  return (SCLSettingsSyncCoordinator *)objc_loadWeakRetained((id *)&self->_settingsSyncCoordinator);
}

- (void)setSettingsSyncCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_settingsSyncCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_settingsSyncCoordinator);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_transportService);
  objc_storeStrong((id *)&self->_IDSDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_deviceRegistry, 0);
  objc_storeStrong((id *)&self->_NRDevice, 0);
}

- (void)device
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "NRDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pairingID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "IDSDeviceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412802;
  v10 = v7;
  v11 = 2112;
  v12 = v8;
  v13 = 2112;
  v14 = a2;
  _os_log_fault_impl(&dword_21E4AD000, a3, OS_LOG_TYPE_FAULT, "No linked IDS device for NRDevice with pairingID %@; deviceIdentifier: %@; devices: %@ ",
    (uint8_t *)&v9,
    0x20u);

}

- (void)service:(void *)a1 incomingProtobuf:(NSObject *)a2 fromID:context:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(a1, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_21E4AD000, a2, OS_LOG_TYPE_ERROR, "Unhandled protobuf message %@", v4, 0xCu);

  OUTLINED_FUNCTION_3_0();
}

- (void)service:(void *)a1 incomingProtobuf:(NSObject *)a2 fromID:context:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_21E4AD000, a2, OS_LOG_TYPE_FAULT, "No delegate for handling incoming protobuf for %@", v4, 0xCu);

  OUTLINED_FUNCTION_3_0();
}

- (void)addUnlockHistoryItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21E4AD000, v0, v1, "Failed to send history item: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)applySchedule:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21E4AD000, v0, v1, "Failed to apply schedule: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
