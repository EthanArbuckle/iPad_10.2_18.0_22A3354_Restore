@implementation MBDeviceManager

+ (id)deviceManagerWithCheckinMethod:(int)a3
{
  return -[MBDeviceManager initWithCheckinMethod:]([MBDeviceManager alloc], "initWithCheckinMethod:", *(_QWORD *)&a3);
}

- (MBDeviceManager)initWithCheckinMethod:(int)a3
{
  MBDeviceManager *v4;
  MBDeviceManager *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MBDeviceManager;
  v4 = -[MBDeviceManager init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    v4->_checkinMethod = a3;
    objc_msgSend(+[MBPersona personalPersonaWithError:](MBPersona, "personalPersonaWithError:", 0), "setPreferencesValue:forKey:", 0, CFSTR("DriveRestoreInProgress"));
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBDeviceManager;
  -[MBDeviceManager dealloc](&v3, "dealloc");
}

- (id)open
{
  NSMutableDictionary *v3;
  id result;

  v3 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0);
  result = -[MBDeviceManager _checkinWithConnectionInfo:](self, "_checkinWithConnectionInfo:", v3);
  if (!result)
    return -[MBDeviceManager _acceptConnectionWithInfo:](self, "_acceptConnectionWithInfo:", v3);
  return result;
}

- (id)_checkinWithConnectionInfo:(id)a3
{
  id v5;
  uint64_t v6;
  int checkinMethod;
  NSObject *v8;
  const __CFString *v9;
  NSObject *v10;
  NSNumber *v11;
  const __CFString *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v19;
  uint8_t buf[4];
  int v21;

  v5 = objc_msgSend(a3, "setValue:forKey:", CFSTR("DLInfoStreamTypeTCP"), CFSTR("DLInfoStreamTypeKey"));
  checkinMethod = self->_checkinMethod;
  if (checkinMethod == 2)
  {
    v10 = MBGetDefaultLog(v5, v6);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v21 = 6599;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Listening on port %d", buf, 8u);
      _MBLog(CFSTR("DEFAULT"), "Listening on port %d", 6599);
    }
    v11 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 6599);
    v12 = CFSTR("DLInfoPortKey");
LABEL_17:
    objc_msgSend(a3, "setValue:forKey:", v11, v12);
    return 0;
  }
  if (checkinMethod == 1)
  {
    v13 = MBGetDefaultLog(v5, v6);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Checking in with launchd", buf, 2u);
      _MBLog(CFSTR("INFO"), "Checking in with launchd");
    }
    v14 = DLGetListenerSocketFromLaunchd(60);
    if (!(_DWORD)v14)
    {
      v9 = CFSTR("Could not check-in with launchd");
      return +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 100, v9, v19);
    }
    v16 = v14;
    v17 = MBGetDefaultLog(v14, v15);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v21 = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Listening on launchd socket: %d", buf, 8u);
      _MBLog(CFSTR("INFO"), "Listening on launchd socket: %d", v16);
    }
    v11 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v16);
    v12 = CFSTR("DLInfoSocketKey");
    goto LABEL_17;
  }
  if (checkinMethod)
    return +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Unknown checkin method: %d"), self->_checkinMethod);
  v8 = MBGetDefaultLog(v5, v6);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Checking in with lockdown", buf, 2u);
    _MBLog(CFSTR("INFO"), "Checking in with lockdown");
  }
  if (!DLLockdownXPCCheckin("com.apple.lockdown.mobilebackup2", a3))
    return 0;
  v9 = CFSTR("Could not check-in with lockdown");
  return +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 100, v9, v19);
}

- (id)_acceptConnectionWithInfo:(id)a3
{
  NSObject *v5;
  void **p_connection;
  uint64_t v7;
  uint64_t v8;
  NSObject *v10;
  uint64_t v11;
  uint8_t v12[16];
  uint8_t buf[8];
  uint64_t v14;

  v14 = 0;
  v5 = MBGetDefaultLog(self, a2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Creating device connection", buf, 2u);
    _MBLog(CFSTR("INFO"), "Creating device connection");
  }
  p_connection = &self->super._connection;
  v7 = DLCreateDeviceLinkConnectionForDevice(1, &unk_1000F9860, self, &self->super._connection, &v14);
  if ((_DWORD)v7)
    return +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 100, CFSTR("Error creating connection: %d %@"), v7, v14);
  v10 = MBGetDefaultLog(v7, v8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Waiting for connection from computer", v12, 2u);
    _MBLog(CFSTR("INFO"), "Waiting for connection from computer");
  }
  v11 = DLWaitForConnection(*p_connection, a3, &v14);
  if ((_DWORD)v11)
    return +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 100, CFSTR("Error accepting connection: %d %@"), v11, v14);
  else
    return 0;
}

- (id)run
{
  NSObject *v3;
  uint8_t v5[16];

  v3 = MBGetDefaultLog(self, a2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Running connection", v5, 2u);
    _MBLog(CFSTR("INFO"), "Running connection");
  }
  CFRunLoopRun();
  return self->_error;
}

- (id)close
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSError *error;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint8_t buf[8];
  uint64_t v18;

  v18 = 0;
  v3 = MBGetDefaultLog(self, a2);
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if ((_DWORD)v4)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Closing connection", buf, 2u);
    v4 = _MBLog(CFSTR("INFO"), "Closing connection");
  }
  v6 = MBGetDefaultLog(v4, v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Disconnecting connection", buf, 2u);
    _MBLog(CFSTR("INFO"), "Disconnecting connection");
  }
  error = self->_error;
  if (error)
    v8 = (const __CFString *)-[NSError description](error, "description");
  else
    v8 = CFSTR("Session complete");
  v9 = DLDisconnect(self->super._connection, v8, &v18);
  if ((_DWORD)v9)
  {
    v11 = v9;
    DLDeleteDeviceLinkConnection(self->super._connection, 0);
    return +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 100, CFSTR("Error disconnecting connection: %d %@"), v11, v18);
  }
  else
  {
    v13 = MBGetDefaultLog(v9, v10);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Deleting connection", buf, 2u);
      _MBLog(CFSTR("INFO"), "Deleting connection");
    }
    v14 = DLDeleteDeviceLinkConnection(self->super._connection, &v18);
    if ((_DWORD)v14)
    {
      return +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 100, CFSTR("Error deleting connection: %d %@"), v14, v18);
    }
    else
    {
      v16 = MBGetDefaultLog(v14, v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Connection closed", buf, 2u);
        _MBLog(CFSTR("INFO"), "Connection closed");
      }
      return 0;
    }
  }
}

- (id)_settingsContextWithSourceIdentifier:(id)a3 targetIdentifier:(id)a4 applicationIDs:(id)a5 options:(id)a6
{
  id v11;
  NSSet *v12;

  v11 = +[MBDriveSettingsContext defaultSettingsContext](MBDriveSettingsContext, "defaultSettingsContext");
  objc_msgSend(v11, "setProtocolVersion:", self->_protocolVersion);
  objc_msgSend(v11, "setSourceIdentifier:", a3);
  objc_msgSend(v11, "setTargetIdentifier:", a4);
  if (a5)
    v12 = +[NSSet setWithArray:](NSSet, "setWithArray:", a5);
  else
    v12 = 0;
  objc_msgSend(v11, "setApplicationIDs:", v12);
  objc_msgSend(objc_msgSend(v11, "options"), "addEntriesFromDictionary:", a6);
  objc_msgSend(v11, "setDrive:", +[MBDeviceLinkDrive deviceLinkDriveWithConnection:](MBDeviceLinkDrive, "deviceLinkDriveWithConnection:", self->super._connection));
  return v11;
}

- (void)_stop
{
  __CFRunLoop *Current;

  Current = CFRunLoopGetCurrent();
  CFRunLoopStop(Current);
}

- (void)_stopWithError:(id)a3
{
  NSObject *v5;
  uint8_t buf[4];
  id v7;

  v5 = MBGetDefaultLog(self, a2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v7 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "_stopWithError: %@", buf, 0xCu);
    _MBLog(CFSTR("ERROR"), "_stopWithError: %@", a3);
  }
  if (!self->_error)
    self->_error = (NSError *)a3;
  -[MBDeviceManager _stop](self, "_stop");
}

- (void)_sendResponseMessage:(id)a3
{
  NSObject *v5;
  _BYTE buf[12];
  __int16 v7;
  id v8;

  v5 = MBGetDefaultLog(self, a2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ErrorCode"));
    v7 = 2112;
    v8 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ErrorDescription"));
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Sending response message: %@ %@", buf, 0x16u);
    _MBLog(CFSTR("INFO"), "Sending response message: %@ %@", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ErrorCode")), objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ErrorDescription")));
  }
  *(_QWORD *)buf = 0;
  if (DLProcessMessage(self->super._connection, a3, buf))
    -[MBDeviceManager _stopWithError:](self, "_stopWithError:", +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 100, CFSTR("Error sending message: %@"), *(_QWORD *)buf));
}

- (void)_sendSuccessResponseMessageWithProperties:(id)a3
{
  id v5;
  _QWORD v6[2];
  _QWORD v7[2];

  v6[0] = CFSTR("MessageName");
  v6[1] = CFSTR("ErrorCode");
  v7[0] = CFSTR("Response");
  v7[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0);
  v5 = -[NSDictionary mutableCopy](+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 2), "mutableCopy");
  objc_msgSend(v5, "addEntriesFromDictionary:", a3);
  -[MBDeviceManager _sendResponseMessage:](self, "_sendResponseMessage:", v5);

}

- (void)_sendSuccessResponseMessage
{
  -[MBDeviceManager _sendSuccessResponseMessageWithProperties:](self, "_sendSuccessResponseMessageWithProperties:", &__NSDictionary0__struct);
}

- (void)_sendResponseMessageWithCode:(int64_t)a3 description:(id)a4
{
  _QWORD v6[3];
  _QWORD v7[3];

  v7[0] = CFSTR("Response");
  v6[0] = CFSTR("MessageName");
  v6[1] = CFSTR("ErrorCode");
  v6[2] = CFSTR("ErrorDescription");
  v7[1] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3);
  v7[2] = a4;
  -[MBDeviceManager _sendResponseMessage:](self, "_sendResponseMessage:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 3));
}

- (void)_sendResponseMessageWithError:(id)a3
{
  uint64_t v5;

  if (objc_msgSend(objc_msgSend(a3, "domain"), "isEqualToString:", CFSTR("MBErrorDomain")))
    v5 = (uint64_t)objc_msgSend(a3, "code");
  else
    v5 = 1;
  -[MBDeviceManager _sendResponseMessageWithCode:description:](self, "_sendResponseMessageWithCode:description:", v5, +[MBError descriptionForError:](MBError, "descriptionForError:", a3));
}

- (void)_acceptFailedCallback:(id)a3
{
  -[MBDeviceManager _stopWithError:](self, "_stopWithError:", +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 100, CFSTR("Accepting connection failed: %@"), a3));
}

- (void)_disconnectCallback:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t buf[4];
  id v8;

  v4 = MBGetDefaultLog(self, a2);
  v5 = v4;
  if (a3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v8 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Computer disconnected: %@", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), "Computer disconnected: %@", a3);
    }
    v6 = 1;
  }
  else
  {
    v6 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Computer disconnected", buf, 2u);
      _MBLog(CFSTR("INFO"), "Computer disconnected");
      v6 = 0;
    }
  }
  sub_100004444(v6);
}

- (void)_processMessageCallback:(id)a3
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t buf[4];
  id v9;

  v5 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MessageName"));
  v7 = MBGetDefaultLog(v5, v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Received message: %@", buf, 0xCu);
    _MBLog(CFSTR("INFO"), "Received message: %@", v5);
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("Hello")))
  {
    -[MBDeviceManager _handleHelloMessage:](self, "_handleHelloMessage:", a3);
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("Backup")))
  {
    -[MBDeviceManager _handleBackupMessage:](self, "_handleBackupMessage:", a3);
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("Restore")))
  {
    -[MBDeviceManager _handleRestoreMessage:](self, "_handleRestoreMessage:", a3);
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("ChangePassword")))
  {
    -[MBDeviceManager _handleChangePasswordMessage:](self, "_handleChangePasswordMessage:", a3);
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("Extract")))
  {
    -[MBDeviceManager _handleExtractMessage:](self, "_handleExtractMessage:", a3);
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("Remove")))
  {
    -[MBDeviceManager _handleRemoveMessage:](self, "_handleRemoveMessage:", a3);
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("Info")))
  {
    -[MBDeviceManager _handleInfoMessage:](self, "_handleInfoMessage:", a3);
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("List")))
  {
    -[MBDeviceManager _handleListMessage:](self, "_handleListMessage:", a3);
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("Unback")))
  {
    -[MBDeviceManager _handleUnbackMessage:](self, "_handleUnbackMessage:", a3);
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("EnableCloudBackup")))
  {
    -[MBDeviceManager _enableCloudBackupMessage:](self, "_enableCloudBackupMessage:", a3);
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("EraseDevice")))
  {
    -[MBDeviceManager _eraseDeviceMessage:](self, "_eraseDeviceMessage:", a3);
  }
  else
  {
    -[MBDeviceManager _stopWithError:](self, "_stopWithError:", +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Unknown message name received: %@"), v5));
  }
}

- (void)_handleHelloMessage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double protocolVersion;
  NSObject *v15;
  NSObject *v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  const __CFString *v22;
  NSNumber *v23;
  uint8_t buf[4];
  double v25;
  _BYTE v26[128];

  v4 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SupportedProtocolVersions"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = (void *)MBSupportedProtocolVersions();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v10);
        if (objc_msgSend(v4, "containsObject:", v11))
        {
          objc_msgSend(v11, "doubleValue");
          if (v12 > self->_protocolVersion)
          {
            objc_msgSend(v11, "doubleValue");
            self->_protocolVersion = v13;
          }
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      v8 = v6;
    }
    while (v6);
  }
  protocolVersion = self->_protocolVersion;
  v15 = MBGetDefaultLog(v6, v7);
  v16 = v15;
  if (protocolVersion <= 0.0)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "No common supported protocol version", buf, 2u);
      _MBLog(CFSTR("ERROR"), "No common supported protocol version");
    }
    -[MBDeviceManager _sendResponseMessageWithCode:description:](self, "_sendResponseMessageWithCode:description:", 1, CFSTR("No common supported protocol version"));
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v17 = self->_protocolVersion;
      *(_DWORD *)buf = 134217984;
      v25 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Using protocol version %0.1f", buf, 0xCu);
      _MBLog(CFSTR("INFO"), "Using protocol version %0.1f", self->_protocolVersion);
    }
    v22 = CFSTR("ProtocolVersion");
    v23 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_protocolVersion);
    -[MBDeviceManager _sendSuccessResponseMessageWithProperties:](self, "_sendSuccessResponseMessageWithProperties:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
  }
}

- (void)_handleBackupMessage:(id)a3
{
  id v4;
  MBDriveBackupEngine *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint8_t v10[16];

  v4 = -[MBDeviceManager _settingsContextWithSourceIdentifier:targetIdentifier:applicationIDs:options:](self, "_settingsContextWithSourceIdentifier:targetIdentifier:applicationIDs:options:", 0, objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TargetIdentifier")), 0, objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Options")));
  v5 = +[MBDriveBackupEngine backupEngineWithSettingsContext:debugContext:](MBDriveBackupEngine, "backupEngineWithSettingsContext:debugContext:", v4, +[MBDebugContext defaultDebugContext](MBDebugContext, "defaultDebugContext"));
  objc_msgSend(v4, "setPlugins:", sub_1000854A8());
  v6 = -[MBProgress setDelegate:](-[MBDriveBackupEngine progress](v5, "progress"), "setDelegate:", objc_msgSend(v4, "drive"));
  v8 = MBGetDefaultLog(v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Action: Backup", v10, 2u);
    _MBLog(CFSTR("DEFAULT"), "Action: Backup");
  }
  v9 = -[MBDriveBackupEngine backup](v5, "backup");
  if (v9)
    -[MBDeviceManager _sendResponseMessageWithError:](self, "_sendResponseMessageWithError:", v9);
  else
    -[MBDeviceManager _sendSuccessResponseMessage](self, "_sendSuccessResponseMessage");
  -[MBDriveBackupEngine endWithError:](v5, "endWithError:", v9);
}

- (void)_handleRestoreMessage:(id)a3
{
  id v4;
  MBDriveRestoreEngine *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint8_t v10[16];

  v4 = -[MBDeviceManager _settingsContextWithSourceIdentifier:targetIdentifier:applicationIDs:options:](self, "_settingsContextWithSourceIdentifier:targetIdentifier:applicationIDs:options:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SourceIdentifier")), objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TargetIdentifier")), objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ApplicationIDs")), objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Options")));
  v5 = +[MBDriveRestoreEngine restoreEngineWithSettingsContext:debugContext:](MBDriveRestoreEngine, "restoreEngineWithSettingsContext:debugContext:", v4, +[MBDebugContext defaultDebugContext](MBDebugContext, "defaultDebugContext"));
  objc_msgSend(v4, "setPlugins:", sub_1000854A8());
  v6 = -[MBProgress setDelegate:](-[MBDriveRestoreEngine progress](v5, "progress"), "setDelegate:", objc_msgSend(v4, "drive"));
  v8 = MBGetDefaultLog(v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Action: Restore", v10, 2u);
    _MBLog(CFSTR("DEFAULT"), "Action: Restore");
  }
  v9 = -[MBDriveRestoreEngine restore](v5, "restore");
  if (v9)
    -[MBDeviceManager _sendResponseMessageWithError:](self, "_sendResponseMessageWithError:", v9);
  else
    -[MBDeviceManager _sendSuccessResponseMessage](self, "_sendSuccessResponseMessage");
  -[MBDriveRestoreEngine endWithError:](v5, "endWithError:", v9);
}

- (void)_handleChangePasswordMessage:(id)a3
{
  uint64_t v4;

  v4 = 0;
  if (objc_msgSend(objc_msgSend(-[MBDeviceManager _settingsContextWithSourceIdentifier:targetIdentifier:applicationIDs:options:](self, "_settingsContextWithSourceIdentifier:targetIdentifier:applicationIDs:options:", 0, objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TargetIdentifier")), 0, 0), "encryptionManager"), "changePasswordFrom:toPassword:error:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("OldPassword")), objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NewPassword")), &v4))-[MBDeviceManager _sendSuccessResponseMessage](self, "_sendSuccessResponseMessage");
  else
    -[MBDeviceManager _sendResponseMessageWithError:](self, "_sendResponseMessageWithError:", v4);
}

- (void)_handleExtractMessage:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  NSDictionary *v10;
  MBDeviceTools *v11;
  uint64_t v12;
  NSObject *v13;
  uint8_t v14[16];
  uint64_t v15;
  const __CFString *v16;
  id v17;

  v15 = 0;
  v5 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SourceIdentifier"));
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TargetIdentifier"));
  v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("DomainName"));
  v8 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RelativePath"));
  v9 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Password"));
  if (v9)
  {
    v16 = CFSTR("Password");
    v17 = v9;
    v10 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  }
  else
  {
    v10 = 0;
  }
  v11 = +[MBDeviceTools toolsWithSettingsContext:error:](MBDeviceTools, "toolsWithSettingsContext:error:", -[MBDeviceManager _settingsContextWithSourceIdentifier:targetIdentifier:applicationIDs:options:](self, "_settingsContextWithSourceIdentifier:targetIdentifier:applicationIDs:options:", v5, v6, 0, v10), &v15);
  v13 = MBGetDefaultLog(v11, v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Action: Extract", v14, 2u);
    _MBLog(CFSTR("DEFAULT"), "Action: Extract");
  }
  if (-[MBDeviceTools extractWithDomainName:relativePath:error:](v11, "extractWithDomainName:relativePath:error:", v7, v8, &v15))
  {
    -[MBDeviceManager _sendSuccessResponseMessage](self, "_sendSuccessResponseMessage");
  }
  else
  {
    -[MBDeviceManager _sendResponseMessageWithError:](self, "_sendResponseMessageWithError:", v15);
  }
}

- (void)_handleRemoveMessage:(id)a3
{
  -[MBDeviceManager _sendResponseMessageWithError:](self, "_sendResponseMessageWithError:", +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Remove action is no longer supported")));
}

- (void)_handleInfoMessage:(id)a3
{
  MBDeviceTools *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  uint8_t v8[16];
  uint64_t v9;
  const __CFString *v10;
  id v11;

  v9 = 0;
  v4 = +[MBDeviceTools toolsWithSettingsContext:error:](MBDeviceTools, "toolsWithSettingsContext:error:", -[MBDeviceManager _settingsContextWithSourceIdentifier:targetIdentifier:applicationIDs:options:](self, "_settingsContextWithSourceIdentifier:targetIdentifier:applicationIDs:options:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SourceIdentifier")), objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TargetIdentifier")), 0, 0), &v9);
  v6 = MBGetDefaultLog(v4, v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Action: Info", v8, 2u);
    _MBLog(CFSTR("DEFAULT"), "Action: Info");
  }
  v7 = -[MBDeviceTools infoWithError:](v4, "infoWithError:", &v9);
  if (v7)
  {
    v10 = CFSTR("Content");
    v11 = v7;
    -[MBDeviceManager _sendSuccessResponseMessageWithProperties:](self, "_sendSuccessResponseMessageWithProperties:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  }
  else
  {
    -[MBDeviceManager _sendResponseMessageWithError:](self, "_sendResponseMessageWithError:", v9);
  }
}

- (void)_handleListMessage:(id)a3
{
  MBDeviceTools *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  uint8_t v8[16];
  uint64_t v9;
  const __CFString *v10;
  id v11;

  v9 = 0;
  v4 = +[MBDeviceTools toolsWithSettingsContext:error:](MBDeviceTools, "toolsWithSettingsContext:error:", -[MBDeviceManager _settingsContextWithSourceIdentifier:targetIdentifier:applicationIDs:options:](self, "_settingsContextWithSourceIdentifier:targetIdentifier:applicationIDs:options:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SourceIdentifier")), objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TargetIdentifier")), 0, 0), &v9);
  v6 = MBGetDefaultLog(v4, v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Action: List", v8, 2u);
    _MBLog(CFSTR("DEFAULT"), "Action: List");
  }
  v7 = -[MBDeviceTools listWithError:](v4, "listWithError:", &v9);
  if (v7)
  {
    v10 = CFSTR("Content");
    v11 = v7;
    -[MBDeviceManager _sendSuccessResponseMessageWithProperties:](self, "_sendSuccessResponseMessageWithProperties:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  }
  else
  {
    -[MBDeviceManager _sendResponseMessageWithError:](self, "_sendResponseMessageWithError:", v9);
  }
}

- (void)_handleUnbackMessage:(id)a3
{
  id v5;
  id v6;
  id v7;
  NSDictionary *v8;
  MBDeviceTools *v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v12[16];
  uint64_t v13;
  const __CFString *v14;
  id v15;

  v13 = 0;
  v5 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SourceIdentifier"));
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TargetIdentifier"));
  v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Password"));
  if (v7)
  {
    v14 = CFSTR("Password");
    v15 = v7;
    v8 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  }
  else
  {
    v8 = 0;
  }
  v9 = +[MBDeviceTools toolsWithSettingsContext:error:](MBDeviceTools, "toolsWithSettingsContext:error:", -[MBDeviceManager _settingsContextWithSourceIdentifier:targetIdentifier:applicationIDs:options:](self, "_settingsContextWithSourceIdentifier:targetIdentifier:applicationIDs:options:", v5, v6, 0, v8), &v13);
  v11 = MBGetDefaultLog(v9, v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Action: Unback", v12, 2u);
    _MBLog(CFSTR("DEFAULT"), "Action: Unback");
  }
  if (-[MBDeviceTools unbackWithError:](v9, "unbackWithError:", &v13))
    -[MBDeviceManager _sendSuccessResponseMessage](self, "_sendSuccessResponseMessage");
  else
    -[MBDeviceManager _sendResponseMessageWithError:](self, "_sendResponseMessageWithError:", v13);
}

- (void)_enableCloudBackupMessage:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  MBError *v9;
  MBDeviceManager *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  const __CFString *v21;
  NSObject *v22;
  MBError *v23;
  NSObject *v24;
  uint8_t buf[4];
  const __CFString *v26;
  __int16 v27;
  id v28;

  v4 = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CloudBackupState")), "BOOLValue");
  if ((_DWORD)v4)
  {
    v5 = +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection");
    v6 = objc_msgSend(v5, "isSettingLockedDownByRestrictions:", MCFeatureCloudBackupAllowed);
    if ((v6 & 1) != 0
      || (v6 = (id)-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", CFSTR("/var/tmp/MDMRefuseToEnableCloudBackups")), (_DWORD)v6))
    {
      v8 = MBGetDefaultLog(v6, v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Cloud backups are disabled via management for this device", buf, 2u);
        _MBLog(CFSTR("DEFAULT"), "Cloud backups are disabled via management for this device");
      }
      v9 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 22, CFSTR("Cloud backups are disabled via management for this device"));
      v10 = self;
      goto LABEL_22;
    }
  }
  v11 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
  v12 = objc_msgSend(v11, "aa_primaryAppleAccount");
  if (!v12)
  {
    v22 = MBGetDefaultLog(0, v13);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "No Apple acount exists", buf, 2u);
      _MBLog(CFSTR("DEFAULT"), "No Apple acount exists");
    }
    v23 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("No account exists"));
    goto LABEL_21;
  }
  v14 = v12;
  v15 = kAccountDataclassBackup;
  v16 = objc_msgSend(v12, "isProvisionedForDataclass:", kAccountDataclassBackup);
  if (!(_DWORD)v16)
  {
    v24 = MBGetDefaultLog(v16, v17);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v26 = (const __CFString *)objc_msgSend(v14, "accountDescription");
      v27 = 2112;
      v28 = objc_msgSend(v14, "provisionedDataclasses");
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "The account \"%@\" is not provisioned for cloud backup. %@", buf, 0x16u);
      _MBLog(CFSTR("DEFAULT"), "The account \"%@\" is not provisioned for cloud backup. %@", objc_msgSend(v14, "accountDescription"), objc_msgSend(v14, "provisionedDataclasses"));
    }
    v23 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("The primary account is not provisioned for cloud backup"));
    objc_msgSend(v11, "saveAccount:withCompletionHandler:", v14, &stru_1000D9690);
LABEL_21:
    v10 = self;
    v9 = v23;
LABEL_22:
    -[MBDeviceManager _sendResponseMessageWithError:](v10, "_sendResponseMessageWithError:", v9);
    return;
  }
  v18 = objc_msgSend(v14, "setEnabled:forDataclass:", v4, v15);
  v20 = MBGetDefaultLog(v18, v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    if ((_DWORD)v4)
      v21 = CFSTR("En");
    else
      v21 = CFSTR("Dis");
    *(_DWORD *)buf = 138412546;
    v26 = v21;
    v27 = 2112;
    v28 = objc_msgSend(v14, "accountDescription");
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%@abled account \"%@\" for cloud backup", buf, 0x16u);
    _MBLog(CFSTR("INFO"), "%@abled account \"%@\" for cloud backup", v21, objc_msgSend(v14, "accountDescription"));
  }
  objc_msgSend(v11, "saveAccount:withCompletionHandler:", v14, &stru_1000D9690);
  -[MBDeviceManager _sendSuccessResponseMessage](self, "_sendSuccessResponseMessage");
}

- (void)_eraseDeviceMessage:(id)a3
{
  NSObject *v4;
  uint8_t v5[8];
  _QWORD v6[2];
  _QWORD v7[2];

  v4 = MBGetDefaultLog(self, a2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Erasing device per request from iTunes", v5, 2u);
    _MBLog(CFSTR("DEFAULT"), "Erasing device per request from iTunes");
  }
  v6[0] = kObliterationTypeKey;
  v6[1] = kObliterationMessageKey;
  v7[0] = kObliterateDataPartition;
  v7[1] = CFSTR("BackupRestore");
  if (Mobile_Obliterate(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 2)))-[MBDeviceManager _sendResponseMessageWithCode:description:](self, "_sendResponseMessageWithCode:description:", 1, CFSTR("Failed to erase device"));
  else
    -[MBDeviceManager _sendSuccessResponseMessage](self, "_sendSuccessResponseMessage");
}

@end
