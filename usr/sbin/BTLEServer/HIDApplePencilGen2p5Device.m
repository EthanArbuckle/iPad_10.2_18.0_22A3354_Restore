@implementation HIDApplePencilGen2p5Device

+ (BOOL)hasWirelessCharging
{
  return 0;
}

- (HIDApplePencilGen2p5Device)initWithProperties:(id)a3 reports:(id)a4
{
  return -[HIDApplePencilGen2Device initWithProperties:reports:loggingIdentifier:](self, "initWithProperties:reports:loggingIdentifier:", a3, a4, CFSTR("Pencil2.5"));
}

- (id)newUserDevices:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  _QWORD v15[4];

  v4 = a3;
  v5 = -[HIDApplePencilGen2Device newDeviceMgntDevice:keyholeID:](self, "newDeviceMgntDevice:keyholeID:", v4, 0);
  v6 = -[HIDApplePencilGen2Device newWakeDevice:keyholeID:](self, "newWakeDevice:keyholeID:", v4, 4);
  v7 = -[HIDApplePencilGen2p5Device newFwUpgradeDevice:keyholeID:](self, "newFwUpgradeDevice:keyholeID:", v4, 5);
  v8 = -[HIDApplePencilGen2Device newForceDevice:keyholeID:](self, "newForceDevice:keyholeID:", v4, 8);

  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006AD6C();
    goto LABEL_15;
  }
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006C6C4();
    goto LABEL_15;
  }
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006C6F0();
    goto LABEL_15;
  }
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006C71C();
LABEL_15:
    v12 = 0;
    goto LABEL_6;
  }
  v14[0] = &off_1000B35E8;
  v14[1] = &off_1000B3600;
  v15[0] = v5;
  v15[1] = v6;
  v14[2] = &off_1000B3618;
  v14[3] = &off_1000B3630;
  v15[2] = v7;
  v15[3] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 4));
  -[HIDApplePencilGen2Device setUserDevices:](self, "setUserDevices:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilGen2Device userDevices](self, "userDevices"));
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", &stru_1000AD900);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilGen2Device userDevices](self, "userDevices"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allValues"));

LABEL_6:
  return v12;
}

- (id)newFwUpgradeDevice:(id)a3 keyholeID:(unsigned __int8)a4
{
  __int128 v5;
  _BYTE v6[19];

  v5 = xmmword_1000864F8;
  *(_OWORD *)v6 = unk_100086508;
  *(_DWORD *)&v6[15] = -1073573632;
  return -[HIDApplePencilDevice newUserDevice:descriptor:descriptorLength:keyholeID:](self, "newUserDevice:descriptor:descriptorLength:keyholeID:", a3, &v5, 35, a4);
}

@end
