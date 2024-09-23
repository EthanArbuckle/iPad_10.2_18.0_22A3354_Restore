@implementation MediaService

- (MediaService)init
{
  MediaService *v2;
  id v3;
  void *v4;
  CBMutableCharacteristic *v5;
  CBMutableCharacteristic *remoteCommandCharacteristic;
  id v7;
  void *v8;
  CBMutableCharacteristic *v9;
  CBMutableCharacteristic *entityUpdateCharacteristic;
  id v11;
  void *v12;
  CBMutableCharacteristic *v13;
  CBMutableCharacteristic *entityAttributeCharacteristic;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  objc_super v21;
  _QWORD v22[3];

  v21.receiver = self;
  v21.super_class = (Class)MediaService;
  v2 = -[MediaService init](&v21, "init");
  if (v2)
  {
    v3 = objc_alloc((Class)CBMutableCharacteristic);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDAMSRemoteCommandCharacteristicString));
    v5 = (CBMutableCharacteristic *)objc_msgSend(v3, "initWithType:properties:value:permissions:", v4, 1048, 0, 34);
    remoteCommandCharacteristic = v2->_remoteCommandCharacteristic;
    v2->_remoteCommandCharacteristic = v5;

    v7 = objc_alloc((Class)CBMutableCharacteristic);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDAMSEntityUpdateCharacteristicString));
    v9 = (CBMutableCharacteristic *)objc_msgSend(v7, "initWithType:properties:value:permissions:", v8, 1048, 0, 34);
    entityUpdateCharacteristic = v2->_entityUpdateCharacteristic;
    v2->_entityUpdateCharacteristic = v9;

    v11 = objc_alloc((Class)CBMutableCharacteristic);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDAMSEntityAttributeCharacteristicString));
    v13 = (CBMutableCharacteristic *)objc_msgSend(v11, "initWithType:properties:value:permissions:", v12, 10, 0, 51);
    entityAttributeCharacteristic = v2->_entityAttributeCharacteristic;
    v2->_entityAttributeCharacteristic = v13;

    v15 = objc_alloc((Class)CBMutableService);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDAppleMediaServiceString));
    v17 = objc_msgSend(v15, "initWithType:primary:", v16, 1);
    -[ServerService setService:](v2, "setService:", v17);

    v22[0] = v2->_remoteCommandCharacteristic;
    v22[1] = v2->_entityUpdateCharacteristic;
    v22[2] = v2->_entityAttributeCharacteristic;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 3));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ServerService service](v2, "service"));
    objc_msgSend(v19, "setCharacteristics:", v18);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[MediaService stopNotifications](self, "stopNotifications");
  v3.receiver = self;
  v3.super_class = (Class)MediaService;
  -[MediaService dealloc](&v3, "dealloc");
}

- (int64_t)handleRemoteCommandWrite:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int64_t v11;
  unsigned __int8 v13;
  uint8_t buf[4];
  void *v15;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DataInputStream inputStreamWithData:](DataInputStream, "inputStreamWithData:", v4));

  v13 = 0;
  if (objc_msgSend(v5, "readUint8:", &v13))
  {
    v6 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v13;
      v8 = v6;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService remoteCommandIDToString:](self, "remoteCommandIDToString:", v7));
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received \"%@\" remote command", buf, 0xCu);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService info](self, "info"));
    objc_msgSend(v10, "sendCommand:", v13);

    v11 = 0;
  }
  else
  {
    v11 = 161;
  }

  return v11;
}

- (int64_t)handleEntityUpdateWrite:(id)a3 action:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int64_t v15;
  unsigned __int8 v17;
  unsigned __int8 v18;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "central"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService sessionForCentral:](self, "sessionForCentral:", v7));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "value"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[DataInputStream inputStreamWithData:](DataInputStream, "inputStreamWithData:", v9));

    v18 = 0;
    if (objc_msgSend(v10, "readUint8:", &v18))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v17 = 0;
      if (objc_msgSend(v10, "readUint8:", &v17))
      {
        do
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v17));
          objc_msgSend(v11, "addObject:", v12);

        }
        while ((objc_msgSend(v10, "readUint8:", &v17) & 1) != 0);
      }
      objc_msgSend(v8, "setRegisteredAttributeIDs:entityID:", v11, v18);
      v13 = v18;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "central"));
      *a4 = (id)objc_claimAutoreleasedReturnValue(-[MediaService invocationForNotifyAttributeIDs:entityID:central:](self, "invocationForNotifyAttributeIDs:entityID:central:", v11, v13, v14));

      v15 = 0;
    }
    else
    {
      v15 = 161;
    }

  }
  else
  {
    v15 = 160;
  }

  return v15;
}

- (int64_t)handleEntityAttributeRead:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int64_t v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "central"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService sessionForCentral:](self, "sessionForCentral:", v5));

  if (v6)
  {
    v7 = objc_msgSend(v6, "loadedEntityID");
    v8 = objc_msgSend(v6, "loadedAttributeID");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService currentAttributeValueForAttributeID:entityID:](self, "currentAttributeValueForAttributeID:entityID:", v8, v7));
    objc_msgSend(v6, "setLastKnownAttributeValue:attributeID:entityID:", v9, v8, v7);
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataUsingEncoding:", 4));
      objc_msgSend(v4, "setValue:", v10);

      v11 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v11;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService attributeIDToString:entityID:](self, "attributeIDToString:entityID:", v8, v7));
        v16 = 138412546;
        v17 = v13;
        v18 = 2112;
        v19 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Sending value for attribute %@: \"%@\", (uint8_t *)&v16, 0x16u);

      }
      v14 = 0;
    }
    else
    {
      v14 = 162;
    }

  }
  else
  {
    v14 = 160;
  }

  return v14;
}

- (int64_t)handleEntityAttributeWrite:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int64_t v14;
  __int16 v16;
  uint8_t buf[4];
  void *v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "central"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService sessionForCentral:](self, "sessionForCentral:", v5));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "value"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[DataInputStream inputStreamWithData:](DataInputStream, "inputStreamWithData:", v7));

    v16 = 0;
    if (objc_msgSend(v8, "readUint8:", (char *)&v16 + 1)
      && objc_msgSend(v8, "readUint8:", &v16))
    {
      if (objc_msgSend(v6, "isRegisteredForAttributeID:entityID:", v16, HIBYTE(v16)))
      {
        objc_msgSend(v6, "setLoadedEntityID:", HIBYTE(v16));
        objc_msgSend(v6, "setLoadedAttributeID:", v16);
        v9 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
        {
          v10 = v16;
          v11 = HIBYTE(v16);
          v12 = v9;
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService attributeIDToString:entityID:](self, "attributeIDToString:entityID:", v10, v11));
          *(_DWORD *)buf = 138412290;
          v18 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Loading value for attribute %@", buf, 0xCu);

        }
        v14 = 0;
      }
      else
      {
        v14 = 160;
      }
    }
    else
    {
      v14 = 161;
    }

  }
  else
  {
    v14 = 160;
  }

  return v14;
}

- (void)notifySupportedCommandsValue:(id)a3 central:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  _BYTE v27[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DataOutputStream outputStream](DataOutputStream, "outputStream"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "writeUint8:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v13), "unsignedCharValue", (_QWORD)v20));
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
    }
    while (v11);
  }

  v14 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "data"));
    *(_DWORD *)buf = 138412290;
    v26 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Notifying value for supported commands: %@", buf, 0xCu);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "data", (_QWORD)v20));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService remoteCommandCharacteristic](self, "remoteCommandCharacteristic"));
  v24 = v7;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
  -[ServerService updateValue:forCharacteristic:onSubscribedCentrals:](self, "updateValue:forCharacteristic:onSubscribedCentrals:", v17, v18, v19);

}

- (void)notifyAttributeValue:(id)a3 attributeID:(unsigned __int8)a4 entityID:(unsigned __int8)a5 central:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[DataOutputStream outputStream](DataOutputStream, "outputStream"));
  buf[0] = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UTF8DataWithMaxLength:ellipsis:isTruncated:", (char *)objc_msgSend(v11, "maximumUpdateValueLength") - 3, 0, buf));
  v14 = buf[0];
  objc_msgSend(v12, "writeUint8:", v7);
  objc_msgSend(v12, "writeUint8:", v8);
  objc_msgSend(v12, "writeUint8:", v14);
  v15 = objc_retainAutorelease(v13);
  objc_msgSend(v12, "writeBytes:length:", objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"));
  v16 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService attributeIDToString:entityID:](self, "attributeIDToString:entityID:", v8, v7));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService entityUpdateFlagsToString:](self, "entityUpdateFlagsToString:", v14));
    *(_DWORD *)buf = 138412802;
    v25 = v18;
    v26 = 2112;
    v27 = v19;
    v28 = 2112;
    v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Notifying value for attribute %@ (%@): \"%@\", buf, 0x20u);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "data"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService entityUpdateCharacteristic](self, "entityUpdateCharacteristic"));
  v23 = v11;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
  -[ServerService updateValue:forCharacteristic:onSubscribedCentrals:](self, "updateValue:forCharacteristic:onSubscribedCentrals:", v20, v21, v22);

}

- (void)notifySupportedCommands:(id)a3 central:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService sessions](self, "sessions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastKnownSupportedCommands"));
  v10 = objc_msgSend(v9, "isEqualToSet:", v11);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(v8, "setLastKnownSupportedCommands:", v11);
    -[MediaService notifySupportedCommandsValue:central:](self, "notifySupportedCommandsValue:central:", v11, v6);
  }

}

- (void)notifyAttributeIDs:(id)a3 entityID:(unsigned __int8)a4 central:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  unsigned __int8 v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService sessions](self, "sessions"));
  v24 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));

  v23 = v8;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "notifiableAttributeIDs:entityID:", v8, v6));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v12);
        v17 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i), "unsignedCharValue");
        v18 = objc_claimAutoreleasedReturnValue(-[MediaService currentAttributeValueForAttributeID:entityID:](self, "currentAttributeValueForAttributeID:entityID:", v17, v6));
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastKnownAttributeValueForAttributeID:entityID:", v17, v6));
        v20 = (void *)v19;
        if (v18)
          v21 = v19 == 0;
        else
          v21 = 1;
        if (v21)
        {
          if (v18 | v19)
            goto LABEL_14;
        }
        else
        {
          v22 = objc_msgSend((id)v18, "isEqualToString:", v19);
          if ((v22 & 1) == 0)
          {
LABEL_14:
            objc_msgSend(v11, "setLastKnownAttributeValue:attributeID:entityID:", v18, v17, v6);
            -[MediaService notifyAttributeValue:attributeID:entityID:central:](self, "notifyAttributeValue:attributeID:entityID:central:", v18, v17, v6, v24);
          }
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v14);
  }

}

- (void)supportedCommandsDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService remoteCommandCharacteristic](self, "remoteCommandCharacteristic", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subscribedCentrals"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[MediaService notifySupportedCommands:central:](self, "notifySupportedCommands:central:", v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)attributeIDsDidChange:(id)a3 entityID:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a4;
  v6 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService entityUpdateCharacteristic](self, "entityUpdateCharacteristic", 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subscribedCentrals"));

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[MediaService notifyAttributeIDs:entityID:central:](self, "notifyAttributeIDs:entityID:central:", v6, v4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12));
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)startNotifications
{
  void *v3;
  MediaInfo *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[MediaService setSessions:](self, "setSessions:", v3);

  v4 = objc_alloc_init(MediaInfo);
  -[MediaService setInfo:](self, "setInfo:", v4);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MediaService info](self, "info"));
  objc_msgSend(v5, "setDelegate:", self);

}

- (void)stopNotifications
{
  void *v3;
  NSObject *v4;
  void *v5;
  _DWORD v6[2];

  v3 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v6[0] = 67109120;
    v6[1] = -[ServerService restrictedMode](self, "restrictedMode");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "restrictedMode : %d", (uint8_t *)v6, 8u);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService info](self, "info"));
  objc_msgSend(v5, "setDelegate:", 0);

  -[MediaService setInfo:](self, "setInfo:", 0);
  -[MediaService setSessions:](self, "setSessions:", 0);
}

- (void)peripheralManager:(id)a3 didReceiveReadRequest:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "characteristic"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService entityAttributeCharacteristic](self, "entityAttributeCharacteristic"));

  if (v7 == v8)
    v9 = -[MediaService handleEntityAttributeRead:](self, "handleEntityAttributeRead:", v6);
  else
    v9 = 10;
  objc_msgSend(v10, "respondToRequest:withResult:", v6, v9);

}

- (void)peripheralManager:(id)a3 didReceiveWriteRequests:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int64_t v13;
  int64_t v14;
  id v15;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "firstObject", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "characteristic"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService remoteCommandCharacteristic](self, "remoteCommandCharacteristic"));

  if (v6 == v7)
  {
    v14 = -[MediaService handleRemoteCommandWrite:](self, "handleRemoteCommandWrite:", v5);
LABEL_8:
    v13 = v14;
    v12 = 0;
    goto LABEL_9;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "characteristic"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService entityUpdateCharacteristic](self, "entityUpdateCharacteristic"));

  if (v8 == v9)
  {
    v15 = 0;
    v13 = -[MediaService handleEntityUpdateWrite:action:](self, "handleEntityUpdateWrite:action:", v5, &v15);
    v12 = v15;
    goto LABEL_9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "characteristic"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService entityAttributeCharacteristic](self, "entityAttributeCharacteristic"));

  if (v10 == v11)
  {
    v14 = -[MediaService handleEntityAttributeWrite:](self, "handleEntityAttributeWrite:", v5);
    goto LABEL_8;
  }
  v12 = 0;
  v13 = 10;
LABEL_9:
  -[ServerService respondToRequest:withResult:](self, "respondToRequest:withResult:", v5, v13);
  objc_msgSend(v12, "invokeWithTarget:", self);

}

- (void)peripheralManager:(id)a3 central:(id)a4 didSubscribeToCharacteristic:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  MediaSession *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a4;
  v7 = a5;
  v8 = objc_claimAutoreleasedReturnValue(-[MediaService remoteCommandCharacteristic](self, "remoteCommandCharacteristic"));
  if ((id)v8 == v7)
  {

  }
  else
  {
    v9 = (void *)v8;
    v10 = (id)objc_claimAutoreleasedReturnValue(-[MediaService entityUpdateCharacteristic](self, "entityUpdateCharacteristic"));

    if (v10 != v7)
      goto LABEL_13;
  }
  if ((id)-[MediaService subscriptionCount](self, "subscriptionCount") == (id)1)
    -[MediaService startNotifications](self, "startNotifications");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService sessions](self, "sessions"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v19));

  if (!v12)
  {
    v13 = objc_alloc_init(MediaSession);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService sessions](self, "sessions"));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v19);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v15, "postNotificationName:object:", CFSTR("PeerIsUsingBuiltinServiceNotification"), v19);

  }
  v16 = (id)objc_claimAutoreleasedReturnValue(-[MediaService remoteCommandCharacteristic](self, "remoteCommandCharacteristic"));

  if (v16 == v7)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService info](self, "info"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "supportedCommands"));

    if (v18)
      -[MediaService notifySupportedCommands:central:](self, "notifySupportedCommands:central:", v18, v19);

  }
LABEL_13:

}

- (void)peripheralManager:(id)a3 central:(id)a4 didUnsubscribeFromCharacteristic:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;

  v16 = a4;
  v7 = a5;
  v8 = objc_claimAutoreleasedReturnValue(-[MediaService remoteCommandCharacteristic](self, "remoteCommandCharacteristic"));
  if ((id)v8 == v7)
  {

  }
  else
  {
    v9 = (void *)v8;
    v10 = (id)objc_claimAutoreleasedReturnValue(-[MediaService entityUpdateCharacteristic](self, "entityUpdateCharacteristic"));

    if (v10 != v7)
      goto LABEL_12;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService remoteCommandCharacteristic](self, "remoteCommandCharacteristic"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subscribedCentrals"));
  if (objc_msgSend(v12, "containsObject:", v16))
  {

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService entityUpdateCharacteristic](self, "entityUpdateCharacteristic"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "subscribedCentrals"));
    v15 = objc_msgSend(v14, "containsObject:", v16);

    if ((v15 & 1) != 0)
      goto LABEL_10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService sessions](self, "sessions"));
    objc_msgSend(v11, "removeObjectForKey:", v16);
  }

LABEL_10:
  if (!-[MediaService subscriptionCount](self, "subscriptionCount"))
    -[MediaService stopNotifications](self, "stopNotifications");
LABEL_12:

}

- (void)supportedCommandsDidChange
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService remoteCommandCharacteristic](self, "remoteCommandCharacteristic"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subscribedCentrals"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MediaService info](self, "info"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "supportedCommands"));
    -[MediaService supportedCommandsDidChange:](self, "supportedCommandsDidChange:", v6);

  }
}

- (void)mediaPlayerDidChange
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService entityUpdateCharacteristic](self, "entityUpdateCharacteristic"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subscribedCentrals"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1000B3648, &off_1000B3660, 0));
    -[MediaService attributeIDsDidChange:entityID:](self, "attributeIDsDidChange:entityID:", v6, 0);

  }
}

- (void)mediaStateDidChange
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService entityUpdateCharacteristic](self, "entityUpdateCharacteristic"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subscribedCentrals"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1000B3678, 0));
    -[MediaService attributeIDsDidChange:entityID:](self, "attributeIDsDidChange:entityID:", v6, 0);

  }
}

- (void)mediaInfoDidChange
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService entityUpdateCharacteristic](self, "entityUpdateCharacteristic"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subscribedCentrals"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1000B3678, 0));
    -[MediaService attributeIDsDidChange:entityID:](self, "attributeIDsDidChange:entityID:", v8, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1000B3648, &off_1000B3678, &off_1000B3690, &off_1000B3660, 0));
    -[MediaService attributeIDsDidChange:entityID:](self, "attributeIDsDidChange:entityID:", v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1000B3678, &off_1000B3648, &off_1000B3690, &off_1000B3660, 0));
    -[MediaService attributeIDsDidChange:entityID:](self, "attributeIDsDidChange:entityID:", v7, 2);

  }
}

- (void)mediaVolumeDidChange
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService entityUpdateCharacteristic](self, "entityUpdateCharacteristic"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subscribedCentrals"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1000B3690, 0));
    -[MediaService attributeIDsDidChange:entityID:](self, "attributeIDsDidChange:entityID:", v6, 0);

  }
}

- (unint64_t)subscriptionCount
{
  void *v3;
  void *v4;
  char *v5;
  void *v6;
  void *v7;
  char *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService remoteCommandCharacteristic](self, "remoteCommandCharacteristic"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subscribedCentrals"));
  v5 = (char *)objc_msgSend(v4, "count");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService entityUpdateCharacteristic](self, "entityUpdateCharacteristic"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subscribedCentrals"));
  v8 = &v5[(_QWORD)objc_msgSend(v7, "count")];

  return (unint64_t)v8;
}

- (id)sessionForCentral:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService sessions](self, "sessions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (id)currentAttributeValueForAttributeID:(unsigned __int8)a3 entityID:(unsigned __int8)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  double v17;
  double v18;
  void *v19;
  float v20;
  uint64_t v21;

  switch(a4)
  {
    case 2u:
      switch(a3)
      {
        case 0u:
          v5 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService info](self, "info"));
          v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trackArtist"));
          goto LABEL_32;
        case 1u:
          v5 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService info](self, "info"));
          v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trackAlbum"));
          goto LABEL_32;
        case 2u:
          v5 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService info](self, "info"));
          v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trackTitle"));
          goto LABEL_32;
        case 3u:
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService info](self, "info"));
          v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trackDuration"));

          if (v5
            && (v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber notANumber](NSDecimalNumber, "notANumber")),
                v16 = objc_msgSend(v5, "isEqualToNumber:", v15),
                v15,
                (v16 & 1) == 0))
          {
            objc_msgSend(v5, "doubleValue");
            v6 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%0.3f"), v21));
LABEL_32:
            v8 = (void *)v6;
          }
          else
          {
            v8 = 0;
          }
          break;
        default:
          goto LABEL_10;
      }
      goto LABEL_33;
    case 1u:
      switch(a3)
      {
        case 0u:
          v5 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService info](self, "info"));
          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "queueIndex"));
          break;
        case 1u:
          v5 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService info](self, "info"));
          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "queueCount"));
          break;
        case 2u:
          v5 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService info](self, "info"));
          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "queueShuffleMode"));
          break;
        case 3u:
          v5 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService info](self, "info"));
          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "queueRepeatMode"));
          break;
        default:
          goto LABEL_10;
      }
LABEL_19:
      v12 = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));
LABEL_20:

LABEL_33:
      return v8;
    case 0u:
      switch(a3)
      {
        case 0u:
          v5 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService info](self, "info"));
          v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "playerName"));
          goto LABEL_32;
        case 1u:
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService info](self, "info"));
          v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "playerElapsedTime"));

          if (v5
            && (v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber notANumber](NSDecimalNumber, "notANumber")),
                v11 = objc_msgSend(v5, "isEqualToNumber:", v10),
                v10,
                (v11 & 1) == 0))
          {
            objc_msgSend(v5, "doubleValue");
            if (v17 >= 0.0)
              v18 = v17;
            else
              v18 = 0.0;
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService info](self, "info"));
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "playerPlaybackState"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService info](self, "info"));
            objc_msgSend(v19, "playerPlaybackRate");
            v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@,%.1f,%.3f"), v13, v20, *(_QWORD *)&v18));

          }
          else
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService info](self, "info"));
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "playerPlaybackState"));
            v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@,,"), v13));
          }

          goto LABEL_20;
        case 2u:
          v5 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService info](self, "info"));
          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "playerVolume"));
          goto LABEL_19;
        case 3u:
          v5 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService info](self, "info"));
          v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "playerBundleID"));
          goto LABEL_32;
        default:
          goto LABEL_10;
      }
  }
LABEL_10:
  v8 = 0;
  return v8;
}

- (id)invocationForNotifyAttributeIDs:(id)a3 entityID:(unsigned __int8)a4 central:(id)a5
{
  void *v8;
  void *v9;
  id v11;
  unsigned __int8 v12;
  id v13;

  v13 = a3;
  v12 = a4;
  v11 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService methodSignatureForSelector:](self, "methodSignatureForSelector:", "notifyAttributeIDs:entityID:central:"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSInvocation invocationWithMethodSignature:](NSInvocation, "invocationWithMethodSignature:", v8));
  objc_msgSend(v9, "retainArguments");
  objc_msgSend(v9, "setSelector:", "notifyAttributeIDs:entityID:central:");
  objc_msgSend(v9, "setArgument:atIndex:", &v13, 2);
  objc_msgSend(v9, "setArgument:atIndex:", &v12, 3);
  objc_msgSend(v9, "setArgument:atIndex:", &v11, 4);

  return v9;
}

- (id)remoteCommandIDToString:(unsigned __int8)a3
{
  if (a3 > 0xDu)
    return CFSTR("Unknown");
  else
    return off_1000ADC10[(char)a3];
}

- (id)attributeIDToString:(unsigned __int8)a3 entityID:(unsigned __int8)a4
{
  const __CFString *v4;
  __CFString **v5;
  const __CFString *v6;

  if (a4 == 2)
  {
    v4 = CFSTR("Track");
    if (a3 <= 3u)
    {
      v5 = off_1000ADCC0;
      goto LABEL_10;
    }
LABEL_11:
    v6 = CFSTR("Unknown");
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v4, v6);
  }
  if (a4 == 1)
  {
    v4 = CFSTR("Queue");
    if (a3 < 4u)
    {
      v5 = off_1000ADCA0;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (a4)
  {
    v4 = CFSTR("Unknown");
    v6 = CFSTR("Unknown");
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v4, v6);
  }
  v4 = CFSTR("Player");
  if (a3 >= 4u)
    goto LABEL_11;
  v5 = off_1000ADC80;
LABEL_10:
  v6 = v5[(char)a3];
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v4, v6);
}

- (id)entityUpdateFlagsToString:(unsigned __int8)a3
{
  unsigned int v3;
  void *v4;
  int i;
  const __CFString *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  for (i = 0; i != 8; ++i)
  {
    if (((v3 >> i) & 1) != 0)
    {
      if (i)
        v6 = 0;
      else
        v6 = CFSTR("T");
      if (objc_msgSend(v4, "length"))
        objc_msgSend(v4, "appendString:", CFSTR("|"));
      objc_msgSend(v4, "appendString:", v6);
    }
  }
  return v4;
}

- (CBMutableCharacteristic)remoteCommandCharacteristic
{
  return self->_remoteCommandCharacteristic;
}

- (void)setRemoteCommandCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_remoteCommandCharacteristic, a3);
}

- (CBMutableCharacteristic)entityUpdateCharacteristic
{
  return self->_entityUpdateCharacteristic;
}

- (void)setEntityUpdateCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_entityUpdateCharacteristic, a3);
}

- (CBMutableCharacteristic)entityAttributeCharacteristic
{
  return self->_entityAttributeCharacteristic;
}

- (void)setEntityAttributeCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_entityAttributeCharacteristic, a3);
}

- (NSMutableDictionary)sessions
{
  return self->_sessions;
}

- (void)setSessions:(id)a3
{
  objc_storeStrong((id *)&self->_sessions, a3);
}

- (MediaInfo)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
  objc_storeStrong((id *)&self->_info, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_entityAttributeCharacteristic, 0);
  objc_storeStrong((id *)&self->_entityUpdateCharacteristic, 0);
  objc_storeStrong((id *)&self->_remoteCommandCharacteristic, 0);
}

@end
