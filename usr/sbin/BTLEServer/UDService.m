@implementation UDService

+ (id)UUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDUserDataServiceString);
}

- (UDService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5
{
  UDService *v5;
  UDService *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UDService;
  v5 = -[ClientService initWithManager:peripheral:service:](&v8, "initWithManager:peripheral:service:", a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[ClientService setPriority:](v5, "setPriority:", 6);
    -[ClientService setStartTimeout:](v6, "setStartTimeout:", 0.0);
    v6->_isConsentInitiated = 0;
  }
  return v6;
}

- (void)start
{
  NSMutableData *v3;
  NSMutableData *registeredUserData;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  _QWORD v13[4];

  v12.receiver = self;
  v12.super_class = (Class)UDService;
  -[ClientService start](&v12, "start");
  self->_userIndex = -1;
  self->_consentCode = -1;
  self->_isControlPointOpInProgress = 0;
  self->_currentRequestedOpCode = -1;
  v3 = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
  registeredUserData = self->_registeredUserData;
  self->_registeredUserData = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDUserControlPointCharacteristicString));
  v13[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDDatabaseChangeIncrementCharacteristicString));
  v13[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDUserIndexCharacteristicString));
  v13[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDRegisteredUserCharacteristicString));
  v13[3] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 4));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService service](self, "service"));
  objc_msgSend(v10, "discoverCharacteristics:forService:", v9, v11);

  -[UDService setControlPointTimer:](self, "setControlPointTimer:", 0);
}

- (void)stop
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UDService controlPointTimer](self, "controlPointTimer"));
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)UDService;
  -[ClientService stop](&v4, "stop");
}

- (BOOL)registerNewUser
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  unsigned __int16 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char v16;
  unsigned __int16 v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;

  if (self->_isControlPointOpInProgress
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[UDService userControlPointCharacteristic](self, "userControlPointCharacteristic")),
        v5,
        !v5))
  {
    v3 = (void *)qword_1000C9178;
    v4 = os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      sub_100069218(v3);
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    v6 = arc4random_uniform(0x270Fu);
    v16 = 1;
    v17 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", &v16, 3, 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UDService userControlPointCharacteristic](self, "userControlPointCharacteristic"));
    objc_msgSend(v8, "writeValue:forCharacteristic:type:", v7, v9, 0);

    self->_consentCode = v6;
    self->_isControlPointOpInProgress = 1;
    self->_currentRequestedOpCode = 1;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "controlPointTimeout", 0, 0, 30.0));
    -[UDService setControlPointTimer:](self, "setControlPointTimer:", v10);

    v11 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
      *(_DWORD *)buf = 141558275;
      v19 = 1752392040;
      v20 = 2113;
      v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "UDS register new user request sent for peripheral \"%{private, mask.hash}@\", buf, 0x16u);

    }
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (BOOL)consentForUserIndex:(unsigned __int8)a3 withConsentCode:(unsigned __int16)a4
{
  void *v5;
  _BOOL4 v6;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;

  if (self->_isControlPointOpInProgress
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[UDService userControlPointCharacteristic](self, "userControlPointCharacteristic")),
        v9,
        !v9))
  {
    v5 = (void *)qword_1000C9178;
    v6 = os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      sub_1000692AC(v5);
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    self->_userIndex = a3;
    self->_consentCode = a4;
    v19 = 2;
    BYTE1(v19) = self->_userIndex;
    HIWORD(v19) = a4;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", &v19, 4, 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UDService userControlPointCharacteristic](self, "userControlPointCharacteristic"));
    objc_msgSend(v11, "writeValue:forCharacteristic:type:", v10, v12, 0);

    self->_isControlPointOpInProgress = 1;
    self->_currentRequestedOpCode = 2;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "controlPointTimeout", 0, 0, 30.0));
    -[UDService setControlPointTimer:](self, "setControlPointTimer:", v13);

    v14 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "name"));
      *(_DWORD *)buf = 141558275;
      v21 = 1752392040;
      v22 = 2113;
      v23 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "UDS consent request sent for peripheral \"%{private, mask.hash}@\", buf, 0x16u);

    }
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (BOOL)deleteCurrentUser
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  char v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;

  if (self->_isControlPointOpInProgress
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[UDService userControlPointCharacteristic](self, "userControlPointCharacteristic")),
        v5,
        !v5))
  {
    v3 = (void *)qword_1000C9178;
    v4 = os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      sub_100069340(v3);
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    v15 = 3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", &v15, 1, 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UDService userControlPointCharacteristic](self, "userControlPointCharacteristic"));
    objc_msgSend(v7, "writeValue:forCharacteristic:type:", v6, v8, 0);

    self->_isControlPointOpInProgress = 1;
    self->_currentRequestedOpCode = 3;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "controlPointTimeout", 0, 0, 30.0));
    -[UDService setControlPointTimer:](self, "setControlPointTimer:", v9);

    v10 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
      *(_DWORD *)buf = 141558275;
      v17 = 1752392040;
      v18 = 2113;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "UDS delete user data request sent for peripheral \"%{private, mask.hash}@\", buf, 0x16u);

    }
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (void)controlPointTimeout
{
  void *v3;
  void *v4;
  void *v5;

  if (self->_isControlPointOpInProgress)
  {
    v3 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_1000693D4(v3);
    if (self->_currentRequestedOpCode - 1 <= 1)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("UserDataServiceConsentDidFailNotification"), v5, 0);

    }
  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];

  v33 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100069484();
  }
  else
  {
    v32 = v8;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "characteristics"));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v39;
      v37 = CBUUIDDatabaseChangeIncrementCharacteristicString;
      v35 = CBUUIDUserControlPointCharacteristicString;
      v36 = CBUUIDUserIndexCharacteristicString;
      v34 = CBUUIDRegisteredUserCharacteristicString;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v39 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[UDService databaseChangeIncrementCharacteristic](self, "databaseChangeIncrementCharacteristic"));
          if (v16)
          {

          }
          else
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUID"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v37));
            v19 = objc_msgSend(v17, "isEqual:", v18);

            if (v19)
              -[UDService setDatabaseChangeIncrementCharacteristic:](self, "setDatabaseChangeIncrementCharacteristic:", v15);
          }
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[UDService userIndexCharacteristic](self, "userIndexCharacteristic"));
          if (v20)
          {

          }
          else
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUID"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v36));
            v23 = objc_msgSend(v21, "isEqual:", v22);

            if (v23)
              -[UDService setUserIndexCharacteristic:](self, "setUserIndexCharacteristic:", v15);
          }
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[UDService userControlPointCharacteristic](self, "userControlPointCharacteristic"));
          if (v24)
          {

          }
          else
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUID"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v35));
            v27 = objc_msgSend(v25, "isEqual:", v26);

            if (v27)
            {
              -[UDService setUserControlPointCharacteristic:](self, "setUserControlPointCharacteristic:", v15);
              if ((objc_msgSend(v15, "properties") & 0x20) != 0)
                objc_msgSend(v33, "setNotifyValue:forCharacteristic:", 1, v15);
            }
          }
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[UDService registeredUserCharacteristic](self, "registeredUserCharacteristic"));
          if (v28)
          {

          }
          else
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUID"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v34));
            v31 = objc_msgSend(v29, "isEqual:", v30);

            if (v31)
            {
              -[UDService setRegisteredUserCharacteristic:](self, "setRegisteredUserCharacteristic:", v15);
              if ((objc_msgSend(v15, "properties") & 0x20) != 0)
                objc_msgSend(v33, "setNotifyValue:forCharacteristic:", 1, v15);
            }
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v12);
    }

    v9 = 0;
    v8 = v32;
  }

}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100069518();
  }
  else
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[UDService databaseChangeIncrementCharacteristic](self, "databaseChangeIncrementCharacteristic"));

    if (v11 == v9)
    {
      -[UDService extractDatabaseChangeIncrement](self, "extractDatabaseChangeIncrement");
    }
    else
    {
      v12 = (id)objc_claimAutoreleasedReturnValue(-[UDService userIndexCharacteristic](self, "userIndexCharacteristic"));

      if (v12 == v9)
      {
        -[UDService extractUserIndex](self, "extractUserIndex");
      }
      else
      {
        v13 = (id)objc_claimAutoreleasedReturnValue(-[UDService userControlPointCharacteristic](self, "userControlPointCharacteristic"));

        if (v13 == v9)
        {
          -[UDService extractControlPointResponse](self, "extractControlPointResponse");
        }
        else
        {
          v14 = (id)objc_claimAutoreleasedReturnValue(-[UDService registeredUserCharacteristic](self, "registeredUserCharacteristic"));

          if (v14 == v9)
            -[UDService extractRegisteredUserData](self, "extractRegisteredUserData");
        }
      }
    }
  }

}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _BOOL4 isConsentInitiated;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int userIndex;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_1000695AC();
  }
  else
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[UDService userControlPointCharacteristic](self, "userControlPointCharacteristic"));
    if (v11 == v9)
    {
      isConsentInitiated = self->_isConsentInitiated;

      if (!isConsentInitiated)
      {
        v13 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
        {
          v14 = v13;
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
          userIndex = self->_userIndex;
          *(_DWORD *)buf = 138412546;
          v31 = (uint64_t)v16;
          v32 = 1024;
          LODWORD(v33) = userIndex;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "UDS didUpdateNotificationStateForCharacteristic for peripheral \"%@\": %u%%", buf, 0x12u);

        }
        self->_isConsentInitiated = 1;
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "customProperty:", CFSTR("UserDataServiceUserIndex")));

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "customProperty:", CFSTR("UserDataServiceConsentCode")));

        if (v19 && v21)
        {
          v22 = objc_alloc_init((Class)NSNumberFormatter);
          objc_msgSend(v22, "setNumberStyle:", 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "numberFromString:", v19));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "numberFromString:", v21));
          v25 = v24;
          if (v23 && v24)
          {
            -[UDService consentForUserIndex:withConsentCode:](self, "consentForUserIndex:withConsentCode:", objc_msgSend(v23, "unsignedIntValue"), (unsigned __int16)objc_msgSend(v24, "unsignedIntValue"));
          }
          else
          {
            v26 = (void *)qword_1000C9178;
            if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
            {
              v27 = v26;
              v29 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "name"));
              *(_DWORD *)buf = 141558787;
              v31 = 1752392040;
              v32 = 2113;
              v33 = v28;
              v34 = 2112;
              v35 = v19;
              v36 = 2112;
              v37 = v21;
              _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "UDS consent procedure failed for peripheral \"%{private, mask.hash}@\" due to failed convert %@ or %@ to number", buf, 0x2Au);

            }
          }

        }
        else
        {
          -[UDService registerNewUser](self, "registerNewUser");
        }

      }
    }
    else
    {

    }
    -[ClientService notifyDidStart](self, "notifyDidStart", v28);
  }

}

- (void)extractDatabaseChangeIncrement
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int userIndex;
  int v11;
  void *v12;
  __int16 v13;
  int v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UDService databaseChangeIncrementCharacteristic](self, "databaseChangeIncrementCharacteristic"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DataInputStream inputStreamWithData:](DataInputStream, "inputStreamWithData:", v4));

  v6 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
    userIndex = self->_userIndex;
    v11 = 138412546;
    v12 = v9;
    v13 = 1024;
    v14 = userIndex;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "UDS database change incremented for peripheral \"%@\": %u%%", (uint8_t *)&v11, 0x12u);

  }
}

- (void)extractUserIndex
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 *p_userIndex;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  __int16 v14;
  int v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UDService userIndexCharacteristic](self, "userIndexCharacteristic"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DataInputStream inputStreamWithData:](DataInputStream, "inputStreamWithData:", v4));

  p_userIndex = &self->_userIndex;
  if (objc_msgSend(v5, "readUint8:", &self->_userIndex))
  {
    v7 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
      v11 = *p_userIndex;
      v12 = 138412546;
      v13 = v10;
      v14 = 1024;
      v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "User index for peripheral \"%@\": %u%%", (uint8_t *)&v12, 0x12u);

    }
  }

}

- (void)extractRegisteredUserData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int userIndex;
  NSString *v27;
  NSString *registeredUserName;
  unsigned __int8 v29;
  unsigned __int8 v30;
  unsigned __int8 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  unsigned int v43;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UDService registeredUserCharacteristic](self, "registeredUserCharacteristic"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DataInputStream inputStreamWithData:](DataInputStream, "inputStreamWithData:", v4));

  v31 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UDService registeredUserCharacteristic](self, "registeredUserCharacteristic"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "value"));
  v8 = objc_msgSend(v7, "length");

  if (objc_msgSend(v5, "readUint8:", &v31))
  {
    v9 = v31;
    v10 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
      v14 = (void *)v13;
      v15 = "Y";
      *(_DWORD *)buf = 141559299;
      v33 = 1752392040;
      v34 = 2113;
      if ((v9 & 1) != 0)
        v16 = "Y";
      else
        v16 = "N";
      v35 = v13;
      if ((v9 & 2) == 0)
        v15 = "N";
      v36 = 1024;
      v37 = v31;
      v38 = 2080;
      v39 = v16;
      v40 = 2080;
      v41 = v15;
      v42 = 1024;
      v43 = v9 >> 2;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Registered user data for peripheral \"%{private, mask.hash}@\": header %u, firstSeg %s, lastSeg %s, segNum %u", buf, 0x36u);

    }
    if ((v9 & 1) != 0)
    {
      v30 = 0;
      v29 = -1;
      if (objc_msgSend(v5, "readUint8:", &v30))
      {
        v18 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
        {
          v19 = v18;
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name"));
          *(_DWORD *)buf = 141558531;
          v33 = 1752392040;
          v34 = 2113;
          v35 = (uint64_t)v21;
          v36 = 1024;
          v37 = v30;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Stored Health Observation for peripheral \"%{private, mask.hash}@\": flags %u", buf, 0x1Cu);

        }
      }
      if (objc_msgSend(v5, "readUint8:", &v29))
      {
        self->_userIndex = v29;
        v22 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
        {
          v23 = v22;
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "name"));
          userIndex = self->_userIndex;
          *(_DWORD *)buf = 138412546;
          v33 = (uint64_t)v25;
          v34 = 1024;
          LODWORD(v35) = userIndex;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "User index for peripheral \"%@\": %u%%", buf, 0x12u);

        }
      }
      -[NSMutableData setLength:](self->_registeredUserData, "setLength:", 0);
      v17 = v8 - 3;
    }
    else
    {
      v17 = v8 - 1;
    }
    objc_msgSend(v5, "readNumBytes:toData:", v17, self->_registeredUserData);
    if ((v9 & 2) != 0)
    {
      v27 = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", self->_registeredUserData, 4);
      registeredUserName = self->_registeredUserName;
      self->_registeredUserName = v27;

      -[NSMutableData setLength:](self->_registeredUserData, "setLength:", 0);
    }
  }

}

- (id)getDescriptionForResponseValue:(unsigned __int8)a3
{
  void *v4;

  if ((a3 - 1) < 5)
    return *(&off_1000AD108 + (char)(a3 - 1));
  v4 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_100069640(v4);
  return CFSTR("Invalid Response");
}

- (void)extractControlPointResponse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int currentRequestedOpCode;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  unsigned __int8 *p_userIndex;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  int v26;
  NSObject *v27;
  int userIndex;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  int v34;
  NSObject *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  unsigned __int8 v40;
  __int16 v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  void *v49;

  if (!self->_isControlPointOpInProgress)
  {
    v3 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_1000699D0(v3);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UDService controlPointTimer](self, "controlPointTimer"));
  objc_msgSend(v4, "invalidate");

  -[UDService setControlPointTimer:](self, "setControlPointTimer:", 0);
  v41 = 0;
  v40 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UDService userControlPointCharacteristic](self, "userControlPointCharacteristic"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[DataInputStream inputStreamWithData:byteOrder:](DataInputStream, "inputStreamWithData:byteOrder:", v6, 1));

  if ((objc_msgSend(v7, "readUint8:", (char *)&v41 + 1) & 1) == 0)
  {
    v8 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006993C(v8);
  }
  if (HIBYTE(v41) == 32)
  {
    if ((objc_msgSend(v7, "readUint8:", &v41) & 1) == 0)
    {
      v9 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_100069810(v9);
    }
    if (v41 == self->_currentRequestedOpCode)
    {
      self->_isControlPointOpInProgress = 0;
      self->_currentRequestedOpCode = -1;
      if ((objc_msgSend(v7, "readUint8:", &v40) & 1) == 0)
      {
        v10 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          sub_10006977C(v10);
      }
      if (v40 == 1)
      {
        switch((char)v41)
        {
          case 1:
            p_userIndex = &self->_userIndex;
            if (objc_msgSend(v7, "readUint8:", &self->_userIndex))
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
              v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), *p_userIndex));
              objc_msgSend(v21, "setCustomProperty:value:", CFSTR("UserDataServiceUserIndex"), v22);

              v23 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
              v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), self->_consentCode));
              objc_msgSend(v23, "setCustomProperty:value:", CFSTR("UserDataServiceConsentCode"), v24);

            }
            v25 = qword_1000C9178;
            if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
            {
              v26 = *p_userIndex;
              *(_DWORD *)buf = 67109120;
              LODWORD(v43) = v26;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "UDS register new user completed successfully, index =%d", buf, 8u);
            }
            goto LABEL_34;
          case 2:
            v27 = qword_1000C9178;
            if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
            {
              userIndex = self->_userIndex;
              *(_DWORD *)buf = 67109120;
              LODWORD(v43) = userIndex;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "UDS consent completed successfully, index =%d", buf, 8u);
            }
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[UDService databaseChangeIncrementCharacteristic](self, "databaseChangeIncrementCharacteristic"));
            objc_msgSend(v29, "readValueForCharacteristic:", v30);

            v31 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(-[UDService userIndexCharacteristic](self, "userIndexCharacteristic"));
            objc_msgSend(v31, "readValueForCharacteristic:", v32);

LABEL_34:
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
            v19 = CFSTR("UserDataServiceConsentDidSucceedNotification");
            goto LABEL_35;
          case 3:
            v33 = qword_1000C9178;
            if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
            {
              v34 = self->_userIndex;
              *(_DWORD *)buf = 67109120;
              LODWORD(v43) = v34;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "UDS user data deleted successfully, index =%d", buf, 8u);
            }
            goto LABEL_36;
          case 4:
          case 5:
            if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
              sub_1000696E4();
            goto LABEL_36;
          default:
            goto LABEL_36;
        }
      }
      v16 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      {
        v35 = v16;
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "name"));
        v38 = v41;
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[UDService getDescriptionForResponseValue:](self, "getDescriptionForResponseValue:", v40));
        *(_DWORD *)buf = 141558787;
        v43 = 1752392040;
        v44 = 2113;
        v45 = v37;
        v46 = 1024;
        v47 = v38;
        v48 = 2112;
        v49 = v39;
        _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "UDS CP response for peripheral \"%{private, mask.hash}@\": requestedOpCode %u, response %@", buf, 0x26u);

      }
      if (v41 - 1 <= 1)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        v19 = CFSTR("UserDataServiceConsentDidFailNotification");
LABEL_35:
        objc_msgSend(v17, "postNotificationName:object:userInfo:", v19, v18, 0);

      }
    }
    else
    {
      v11 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      {
        v12 = v11;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
        currentRequestedOpCode = self->_currentRequestedOpCode;
        *(_DWORD *)buf = 141558787;
        v43 = 1752392040;
        v44 = 2113;
        v45 = v14;
        v46 = 1024;
        v47 = v41;
        v48 = 1024;
        LODWORD(v49) = currentRequestedOpCode;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "UDS CP response for peripheral \"%{private, mask.hash}@\": invalid requestedOpCode %u, expectedOpCode %u", buf, 0x22u);

      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
  {
    sub_1000698A4();
  }
LABEL_36:

}

- (CBCharacteristic)udsCharacteristic
{
  return self->_udsCharacteristic;
}

- (void)setUdsCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_udsCharacteristic, a3);
}

- (CBCharacteristic)databaseChangeIncrementCharacteristic
{
  return self->_databaseChangeIncrementCharacteristic;
}

- (void)setDatabaseChangeIncrementCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_databaseChangeIncrementCharacteristic, a3);
}

- (CBCharacteristic)userIndexCharacteristic
{
  return self->_userIndexCharacteristic;
}

- (void)setUserIndexCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_userIndexCharacteristic, a3);
}

- (CBCharacteristic)userControlPointCharacteristic
{
  return self->_userControlPointCharacteristic;
}

- (void)setUserControlPointCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_userControlPointCharacteristic, a3);
}

- (CBCharacteristic)registeredUserCharacteristic
{
  return self->_registeredUserCharacteristic;
}

- (void)setRegisteredUserCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_registeredUserCharacteristic, a3);
}

- (NSTimer)controlPointTimer
{
  return self->_controlPointTimer;
}

- (void)setControlPointTimer:(id)a3
{
  objc_storeStrong((id *)&self->_controlPointTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlPointTimer, 0);
  objc_storeStrong((id *)&self->_registeredUserCharacteristic, 0);
  objc_storeStrong((id *)&self->_userControlPointCharacteristic, 0);
  objc_storeStrong((id *)&self->_userIndexCharacteristic, 0);
  objc_storeStrong((id *)&self->_databaseChangeIncrementCharacteristic, 0);
  objc_storeStrong((id *)&self->_udsCharacteristic, 0);
  objc_storeStrong((id *)&self->_registeredUserData, 0);
  objc_storeStrong((id *)&self->_registeredUserName, 0);
}

@end
