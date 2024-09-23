@implementation SAAudioAccessory

- (SAAudioAccessory)initWithQueue:(id)a3
{
  id v4;
  SAAudioAccessory *v5;
  SAAudioAccessory *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SAAudioAccessory;
  v5 = -[SAAudioAccessory init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SAAudioAccessory setQueue:](v5, "setQueue:", v4);
    -[SAAudioAccessory setFBTAddress:](v6, "setFBTAddress:", &stru_1E83D18B8);
    -[SAAudioAccessory attachBTSession](v6, "attachBTSession");
  }

  return v6;
}

- (void)attachBTSession
{
  void *v2;
  int v3;
  NSObject *v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[SAAudioAccessory queue](self, "queue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = BTSessionAttachWithQueue();

  if (v3)
  {
    v4 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      v5[0] = 68289026;
      v5[1] = 0;
      v6 = 2082;
      v7 = "";
      _os_log_impl(&dword_1CA04F000, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SAAudioAccessory failed to register BT session callback\"}", (uint8_t *)v5, 0x12u);
    }
  }
}

- (void)setBTAddress:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  int v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[SAAudioAccessory setFBTAddress:](self, "setFBTAddress:");
    v4 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      -[SAAudioAccessory fBTAddress](self, "fBTAddress");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 68289283;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      v12 = 2113;
      v13 = v6;
      _os_log_impl(&dword_1CA04F000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"SAAudioAccessory set BT address of the current device\", \"address\":\"%{private}@\"}", (uint8_t *)&v8, 0x1Cu);

    }
    -[SAAudioAccessory refreshBTDevice](self, "refreshBTDevice");
  }
  else
  {
    -[SAAudioAccessory setFBTAddress:](self, "setFBTAddress:", &stru_1E83D18B8);
    v7 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      v8 = 68289026;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      _os_log_impl(&dword_1CA04F000, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SAAudioAccessory received unknown BT address\"}", (uint8_t *)&v8, 0x12u);
    }
    -[SAAudioAccessory setFBTDevice:](self, "setFBTDevice:", 0);
  }
}

- (void)refreshBTDevice
{
  void *v3;
  uint64_t v4;
  id v5;
  int v6;
  void *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!-[SAAudioAccessory fBTSession](self, "fBTSession"))
  {
    v11 = TASALog;
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      return;
    *(_DWORD *)buf = 68289026;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    v12 = "{\"msg%{public}.0s\":\"SAAudioAccessory refresh device failed - invalid BT session\"}";
    goto LABEL_8;
  }
  -[SAAudioAccessory fBTAddress](self, "fBTAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4 != 17)
  {
    v13 = (void *)TASALog;
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      return;
    v8 = v13;
    -[SAAudioAccessory fBTAddress](self, "fBTAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 68289283;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2113;
    v20 = v9;
    v10 = "{\"msg%{public}.0s\":\"SAAudioAccessory refresh device failed - invalid BT address\", \"address\":\"%{private}@\"}";
    goto LABEL_11;
  }
  -[SAAudioAccessory fBTAddress](self, "fBTAddress");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "UTF8String");
  v6 = BTDeviceAddressFromString();

  if (v6)
  {
    v7 = (void *)TASALog;
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      return;
    v8 = v7;
    -[SAAudioAccessory fBTAddress](self, "fBTAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 68289283;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2113;
    v20 = v9;
    v10 = "{\"msg%{public}.0s\":\"SAAudioAccessory refresh device failed - failed to convert address into a valid BT addr"
          "ess\", \"address\":\"%{private}@\"}";
    goto LABEL_11;
  }
  -[SAAudioAccessory fBTSession](self, "fBTSession");
  if (!BTDeviceFromAddress())
  {
    -[SAAudioAccessory fBTDevice](self, "fBTDevice");
    if (!BTDeviceGetDeviceId())
      return;
    -[SAAudioAccessory setFProductID:](self, "setFProductID:", 0);
    v11 = TASALog;
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      return;
    *(_DWORD *)buf = 68289026;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    v12 = "{\"msg%{public}.0s\":\"SAAudioAccessory refresh device failed - Failed to get the product ID\"}";
LABEL_8:
    _os_log_impl(&dword_1CA04F000, v11, OS_LOG_TYPE_ERROR, v12, buf, 0x12u);
    return;
  }
  -[SAAudioAccessory reset](self, "reset");
  v14 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
  {
    v8 = v14;
    -[SAAudioAccessory fBTAddress](self, "fBTAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 68289283;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2113;
    v20 = v9;
    v10 = "{\"msg%{public}.0s\":\"SAAudioAccessory refresh device failed - Failed to get the device handle with BT addres"
          "s\", \"address\":\"%{private}@\"}";
LABEL_11:
    _os_log_impl(&dword_1CA04F000, v8, OS_LOG_TYPE_ERROR, v10, buf, 0x1Cu);

  }
}

- (void)reset
{
  -[SAAudioAccessory setFBTDevice:](self, "setFBTDevice:", 0);
  -[SAAudioAccessory setFProductID:](self, "setFProductID:", 0);
  -[SAAudioAccessory setFBTAddress:](self, "setFBTAddress:", &stru_1E83D18B8);
}

- (int64_t)convertToSAInEarStatus:(int)a3
{
  if (a3 >= 3)
    return 3;
  else
    return a3;
}

- (void)getInEarStatus:(int64_t *)a3 secondary:(int64_t *)a4
{
  void *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  int64_t v15;
  NSObject *v16;
  int64_t v17;
  int64_t v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int64_t v24;
  __int16 v25;
  int64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  *a3 = 3;
  *a4 = 3;
  if (!-[SAAudioAccessory fBTDevice](self, "fBTDevice"))
  {
    v9 = TASALog;
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      return;
    *(_DWORD *)buf = 68289026;
    v20 = 0;
    v21 = 2082;
    v22 = "";
    v10 = "{\"msg%{public}.0s\":\"SAAudioAccessory in ear status - invalid BT device\"}";
    goto LABEL_8;
  }
  -[SAAudioAccessory fBTAddress](self, "fBTAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8 == 17)
  {
    -[SAAudioAccessory fBTAccessoryManager](self, "fBTAccessoryManager");
    -[SAAudioAccessory fBTDevice](self, "fBTDevice");
    if (BTAccessoryManagerGetInEarDetectionEnable())
    {
      v9 = TASALog;
      if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
        return;
      *(_DWORD *)buf = 68289026;
      v20 = 0;
      v21 = 2082;
      v22 = "";
      v10 = "{\"msg%{public}.0s\":\"SAAudioAccessory in ear status - failed to get IED setting\"}";
LABEL_8:
      _os_log_impl(&dword_1CA04F000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0x12u);
      return;
    }
    -[SAAudioAccessory fBTAccessoryManager](self, "fBTAccessoryManager");
    -[SAAudioAccessory fBTDevice](self, "fBTDevice");
    if (BTAccessoryManagerGetInEarStatus())
    {
      v14 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289026;
        v20 = 0;
        v21 = 2082;
        v22 = "";
        _os_log_impl(&dword_1CA04F000, v14, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SAAudioAccessory in ear status - failed to get inear status\"}", buf, 0x12u);
      }
      v15 = 3;
      *a3 = 3;
      goto LABEL_15;
    }
    *a3 = -[SAAudioAccessory convertToSAInEarStatus:](self, "convertToSAInEarStatus:", 0);
    *a4 = -[SAAudioAccessory convertToSAInEarStatus:](self, "convertToSAInEarStatus:", 0);
    v16 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *a3;
      v18 = *a4;
      *(_DWORD *)buf = 68289539;
      v20 = 0;
      v21 = 2082;
      v22 = "";
      v23 = 2049;
      v24 = v17;
      v25 = 2049;
      v26 = v18;
      _os_log_impl(&dword_1CA04F000, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"SAAudioAccessory received in ear status\", \"Primary\":%{private}ld, \"Secondary\":%{private}ld}", buf, 0x26u);
    }
    if (!*a3 && -[SAAudioAccessory fProductID](self, "fProductID") == 8202)
    {
      v15 = 0;
LABEL_15:
      *a4 = v15;
    }
  }
  else
  {
    v11 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      -[SAAudioAccessory fBTAddress](self, "fBTAddress");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 68289283;
      v20 = 0;
      v21 = 2082;
      v22 = "";
      v23 = 2113;
      v24 = (int64_t)v13;
      _os_log_impl(&dword_1CA04F000, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SAAudioAccessory in ear status - invalid BT address\", \"address\":\"%{private}@\"}", buf, 0x1Cu);

    }
  }
}

- (int64_t)getPrimaryBudSide
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!-[SAAudioAccessory fBTDevice](self, "fBTDevice"))
  {
    v5 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      v6 = "{\"msg%{public}.0s\":\"SAAudioAccessory in ear status - invalid BT device when get primary bud side\"}";
      goto LABEL_10;
    }
    return 2;
  }
  -[SAAudioAccessory fBTAddress](self, "fBTAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4 != 17)
  {
    v5 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      v6 = "{\"msg%{public}.0s\":\"SAAudioAccessory in ear status - invalid BT address when get primary bud side\"}";
      goto LABEL_10;
    }
    return 2;
  }
  -[SAAudioAccessory fBTAccessoryManager](self, "fBTAccessoryManager");
  -[SAAudioAccessory fBTDevice](self, "fBTDevice");
  if (BTAccessoryManagerGetPrimaryBudSide())
  {
    v5 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      v6 = "{\"msg%{public}.0s\":\"SAAudioAccessory in ear status - failed to get primary bud\"}";
LABEL_10:
      _os_log_impl(&dword_1CA04F000, v5, OS_LOG_TYPE_ERROR, v6, buf, 0x12u);
      return 2;
    }
    return 2;
  }
  return 2;
}

- (void)btSessionEventHandler:(BTSessionImpl *)a3 event:(int)a4 result:(int)a5
{
  NSObject *v6;
  int v7;
  void *v8;
  NSObject *v9;
  int v10;
  NSObject *v12;
  int Default;
  int v14;
  NSObject *v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((a4 & 0xFFFFFFFD) == 0)
  {
    if (a4 == 2)
    {
      -[SAAudioAccessory setFBTSession:](self, "setFBTSession:", 0, *(_QWORD *)&a4, *(_QWORD *)&a5);
      v6 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        v17 = 0;
        v18 = 2082;
        v19 = "";
        _os_log_impl(&dword_1CA04F000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"SAAudioAccessory BT session terminated\"}", buf, 0x12u);
      }
      -[SAAudioAccessory reset](self, "reset");
      v7 = -[SAAudioAccessory fBTSessionAttachRetryCount](self, "fBTSessionAttachRetryCount");
      -[SAAudioAccessory setFBTSessionAttachRetryCount:](self, "setFBTSessionAttachRetryCount:", (v7 + 1));
      if (v7 <= 4)
      {
        v8 = (void *)TASALog;
        if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
        {
          v9 = v8;
          v10 = -[SAAudioAccessory fBTSessionAttachRetryCount](self, "fBTSessionAttachRetryCount");
          *(_DWORD *)buf = 68289283;
          v17 = 0;
          v18 = 2082;
          v19 = "";
          v20 = 1025;
          v21 = v10;
          _os_log_impl(&dword_1CA04F000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"SAAudioAccessory BT session re-attaching\", \"Retry count\":%{private}d}", buf, 0x18u);

        }
        -[SAAudioAccessory attachBTSession](self, "attachBTSession");
      }
    }
    else
    {
      -[SAAudioAccessory setFBTSessionAttachRetryCount:](self, "setFBTSessionAttachRetryCount:", 0, *(_QWORD *)&a4, *(_QWORD *)&a5);
      -[SAAudioAccessory setFBTSession:](self, "setFBTSession:", a3);
      v12 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        v17 = 0;
        v18 = 2082;
        v19 = "";
        _os_log_impl(&dword_1CA04F000, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"SAAudioAccessory BT session attached successfully\"}", buf, 0x12u);
      }
      -[SAAudioAccessory fBTSession](self, "fBTSession");
      Default = BTAccessoryManagerGetDefault();
      if (Default)
      {
        v14 = Default;
        v15 = TASALog;
        if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68289283;
          v17 = 0;
          v18 = 2082;
          v19 = "";
          v20 = 1025;
          v21 = v14;
          _os_log_impl(&dword_1CA04F000, v15, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SAAudioAccessory Accessory Mananger unavailable.\", \"status\":%{private}d}", buf, 0x18u);
        }
      }
      else
      {
        -[SAAudioAccessory setFBTAccessoryManager:](self, "setFBTAccessoryManager:", 0);
        -[SAAudioAccessory refreshBTDevice](self, "refreshBTDevice");
      }
    }
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BTSessionImpl)fBTSession
{
  return self->_fBTSession;
}

- (void)setFBTSession:(BTSessionImpl *)a3
{
  self->_fBTSession = a3;
}

- (BTAccessoryManagerImpl)fBTAccessoryManager
{
  return self->_fBTAccessoryManager;
}

- (void)setFBTAccessoryManager:(BTAccessoryManagerImpl *)a3
{
  self->_fBTAccessoryManager = a3;
}

- (BTDeviceImpl)fBTDevice
{
  return self->_fBTDevice;
}

- (void)setFBTDevice:(BTDeviceImpl *)a3
{
  self->_fBTDevice = a3;
}

- (NSString)fBTAddress
{
  return self->_fBTAddress;
}

- (void)setFBTAddress:(id)a3
{
  objc_storeStrong((id *)&self->_fBTAddress, a3);
}

- (unsigned)fProductID
{
  return self->_fProductID;
}

- (void)setFProductID:(unsigned int)a3
{
  self->_fProductID = a3;
}

- (int)fBTSessionAttachRetryCount
{
  return self->_fBTSessionAttachRetryCount;
}

- (void)setFBTSessionAttachRetryCount:(int)a3
{
  self->_fBTSessionAttachRetryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fBTAddress, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
