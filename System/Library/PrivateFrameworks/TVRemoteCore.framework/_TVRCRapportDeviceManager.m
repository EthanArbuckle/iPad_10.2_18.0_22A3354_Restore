@implementation _TVRCRapportDeviceManager

- (_TVRCRapportDeviceManager)init
{
  _TVRCRapportDeviceManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *deviceRecords;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVRCRapportDeviceManager;
  v2 = -[_TVRCRapportDeviceManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    deviceRecords = v2->_deviceRecords;
    v2->_deviceRecords = v3;

  }
  return v2;
}

- (id)recordForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  NSObject *v22;
  NSObject *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_TVRCRapportDeviceManager _identifierForDevice:](self, "_identifierForDevice:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5
    || (-[_TVRCRapportDeviceManager deviceRecords](self, "deviceRecords"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "objectForKey:", v5),
        v7 = (id)objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[NSMutableDictionary allValues](self->_deviceRecords, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v9)
    {
      v10 = v9;
      v25 = v5;
      v11 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v13, "device");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "idsDeviceIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "idsDeviceIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "isEqualToString:", v16);

          if (v17)
          {
            objc_msgSend(v13, "device");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "model");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "model");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v19, "isEqualToString:", v20);

            v5 = v25;
            if ((v21 & 1) == 0)
            {
              _TVRCRapportLog();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
                -[_TVRCRapportDeviceManager recordForDevice:].cold.1();

            }
            _TVRCRapportLog();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v31 = v13;
              v32 = 2114;
              v33 = v4;
              _os_log_impl(&dword_21A51B000, v23, OS_LOG_TYPE_DEFAULT, "Found Duplicate record: %{public}@ for device: %{public}@", buf, 0x16u);
            }

            v7 = v13;
            goto LABEL_20;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v10)
          continue;
        break;
      }
      v7 = 0;
      v5 = v25;
    }
    else
    {
      v7 = 0;
    }
LABEL_20:

  }
  return v7;
}

- (BOOL)createOrUpdateRecordForDevice:(id)a3
{
  char *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  _TVRCRapportDeviceRecord *v8;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  int v15;
  const char *v16;
  __int16 v17;
  char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  _TVRCRapportLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315394;
    v16 = "-[_TVRCRapportDeviceManager createOrUpdateRecordForDevice:]";
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "%s device=%@", (uint8_t *)&v15, 0x16u);
  }

  -[_TVRCRapportDeviceManager _identifierForDevice:](self, "_identifierForDevice:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVRCRapportDeviceManager recordForDevice:](self, "recordForDevice:", v4);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[_TVRCRapportDeviceManager _checkIfDuplicateNameButDifferentIDSIdentifier:device:](self, "_checkIfDuplicateNameButDifferentIDSIdentifier:device:", v7, v4);
    v8 = (_TVRCRapportDeviceRecord *)v7;
  }
  else
  {
    v8 = -[_TVRCRapportDeviceRecord initWithDevice:]([_TVRCRapportDeviceRecord alloc], "initWithDevice:", v4);
    _TVRCRapportLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[_TVRCRapportDeviceManager deviceRecords](self, "deviceRecords");
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v4;
      v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "Creating new internal record with device=%{public}@, deviceRecords=%{public}@", (uint8_t *)&v15, 0x16u);

    }
  }
  -[_TVRCRapportDeviceRecord updateTransportsForStatusFlags:](v8, "updateTransportsForStatusFlags:", objc_msgSend(v4, "statusFlags"));
  _TVRCRapportLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[_TVRCRapportDeviceManager createOrUpdateRecordForDevice:].cold.2(self);

  -[_TVRCRapportDeviceManager deviceRecords](self, "deviceRecords");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v8, v6);

  _TVRCRapportLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[_TVRCRapportDeviceManager createOrUpdateRecordForDevice:].cold.1(self);

  return v7 == 0;
}

- (BOOL)removeDeviceRecordForDevice:(id)a3
{
  id v4;
  NSObject *v5;
  char *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  char *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  BOOL v19;
  int v21;
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRCRapportLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 136315394;
    v22 = "-[_TVRCRapportDeviceManager removeDeviceRecordForDevice:]";
    v23 = 2114;
    v24 = v4;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "%s device=%{public}@", (uint8_t *)&v21, 0x16u);
  }

  -[_TVRCRapportDeviceManager _identifierForDevice:](self, "_identifierForDevice:", v4);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  -[_TVRCRapportDeviceManager deviceRecords](self, "deviceRecords");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _TVRCRapportLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "name");
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412546;
    v22 = v10;
    v23 = 2112;
    v24 = v11;
    _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "Record id to be removed = %@ for device id = %@", (uint8_t *)&v21, 0x16u);

  }
  if (v8
    && (objc_msgSend(v8, "name"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "name"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v12, "isEqualToString:", v13),
        v13,
        v12,
        v14))
  {
    _TVRCRapportLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[_TVRCRapportDeviceManager removeDeviceRecordForDevice:].cold.3(self);

    -[_TVRCRapportDeviceManager deviceRecords](self, "deviceRecords");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObjectForKey:", v6);

    _TVRCRapportLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[_TVRCRapportDeviceManager removeDeviceRecordForDevice:].cold.2(self);

    _TVRCRapportLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138543362;
      v22 = v6;
      _os_log_impl(&dword_21A51B000, v18, OS_LOG_TYPE_DEFAULT, "Removed %{public}@", (uint8_t *)&v21, 0xCu);
    }
    v19 = 1;
  }
  else
  {
    _TVRCRapportLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[_TVRCRapportDeviceManager removeDeviceRecordForDevice:].cold.1((uint64_t)v4, self);
    v19 = 0;
  }

  return v19;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVRCRapportDeviceManager deviceRecords](self, "deviceRecords");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("deviceRecords"));

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_identifierForDevice:(id)a3
{
  id v3;
  char v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "flags");
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(v5, "stringByAppendingString:", CFSTR(" UnAuth"));
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return v5;
}

- (void)_checkIfDuplicateNameButDifferentIDSIdentifier:(id)a3 device:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v5 = a4;
  objc_msgSend(a3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "idsDeviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "isEqualToString:", v7);
  if ((v5 & 1) == 0)
  {
    _TVRCRapportLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[_TVRCRapportDeviceManager _checkIfDuplicateNameButDifferentIDSIdentifier:device:].cold.1();

  }
}

- (NSMutableDictionary)deviceRecords
{
  return self->_deviceRecords;
}

- (void)setDeviceRecords:(id)a3
{
  objc_storeStrong((id *)&self->_deviceRecords, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceRecords, 0);
}

- (void)recordForDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_0(&dword_21A51B000, v0, v1, "Found different device models with same IDS identifiers", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)createOrUpdateRecordForDevice:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "deviceRecords");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_5(&dword_21A51B000, v2, v3, "After adding - DeviceRecords: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_3();
}

- (void)createOrUpdateRecordForDevice:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "deviceRecords");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_5(&dword_21A51B000, v2, v3, "Before adding - DeviceRecords: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_3();
}

- (void)removeDeviceRecordForDevice:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "deviceRecords");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_21A51B000, v2, v3, "Asked to remove device we don't already know about, device=%{public}@. devices:%@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)removeDeviceRecordForDevice:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "deviceRecords");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_5(&dword_21A51B000, v2, v3, "After removing - DeviceRecords: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_3();
}

- (void)removeDeviceRecordForDevice:(void *)a1 .cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "deviceRecords");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_5(&dword_21A51B000, v2, v3, "Before removing - DeviceRecords: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_3();
}

- (void)_checkIfDuplicateNameButDifferentIDSIdentifier:device:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_0(&dword_21A51B000, v0, v1, "Discovered two devices with the same name and different IDS identifiers: <rdar://53121642>", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

@end
