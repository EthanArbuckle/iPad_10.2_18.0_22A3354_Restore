@implementation STSCHBluetoothAlternativeCarrier

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STSCHBluetoothAlternativeCarrier;
  v4 = a3;
  -[STSCHAlternativeCarrier encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_leAddr, CFSTR("leAddr"), v7.receiver, v7.super_class);
  objc_msgSend_encodeInteger_forKey_(v4, v6, self->_leRole, CFSTR("leRole"));

}

- (STSCHBluetoothAlternativeCarrier)initWithCoder:(id)a3
{
  id v4;
  STSCHBluetoothAlternativeCarrier *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSData *leAddr;
  const char *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)STSCHBluetoothAlternativeCarrier;
  v5 = -[STSCHAlternativeCarrier initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("leAddr"));
    v8 = objc_claimAutoreleasedReturnValue();
    leAddr = v5->_leAddr;
    v5->_leAddr = (NSData *)v8;

    v5->_leRole = objc_msgSend_decodeIntegerForKey_(v4, v10, (uint64_t)CFSTR("leRole"));
  }

  return v5;
}

- (STSCHBluetoothAlternativeCarrier)initWithAddress:(id)a3 advertiseUUID:(id)a4 role:(unint64_t)a5 powerState:(unint64_t)a6 auxiliaryRecords:(id)a7
{
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  STSCHBluetoothAlternativeCarrier *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  STSCHBluetoothAlternativeCarrier *v30;
  objc_super v32;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v32.receiver = self;
  v32.super_class = (Class)STSCHBluetoothAlternativeCarrier;
  v18 = -[STSCHBluetoothAlternativeCarrier init](&v32, sel_init);
  if (v18)
  {
    if (v13 && objc_msgSend_length(v13, v16, v17) != 7)
    {
      sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSCHBluetoothAlternativeCarrier initWithAddress:advertiseUUID:role:powerState:auxiliaryRecords:]", 47, v18, CFSTR("Invalid leAddr: %@"), v19, v20, (uint64_t)v13);
    }
    else
    {
      if (!v14 || objc_msgSend_length(v14, v16, v17) == 16)
      {
        objc_storeStrong((id *)&v18->_leAddr, a3);
        objc_storeStrong((id *)&v18->_advertiseUUID, a4);
        v18->_leRole = a5;
        objc_msgSend_setAuxiliaryRecords_(v18, v23, (uint64_t)v15);
        objc_msgSend_setType_(v18, v24, 2);
        if (a6 >= 3)
          objc_msgSend_setPowerState_(v18, v25, 3);
        else
          objc_msgSend_setPowerState_(v18, v25, a6);
        objc_msgSend__createCarrierConfigurationRecord(v18, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setCarrierRecord_(v18, v29, (uint64_t)v28);

        goto LABEL_10;
      }
      sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSCHBluetoothAlternativeCarrier initWithAddress:advertiseUUID:role:powerState:auxiliaryRecords:]", 52, v18, CFSTR("Invalid advertiseUUID: %@"), v21, v22, (uint64_t)v14);
    }
    v30 = 0;
    goto LABEL_14;
  }
LABEL_10:
  v30 = v18;
LABEL_14:

  return v30;
}

- (STSCHBluetoothAlternativeCarrier)initWithNdefRecordBundle:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  STSCHBluetoothAlternativeCarrier *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  unsigned __int8 *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  unsigned __int8 *v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)STSCHBluetoothAlternativeCarrier;
  v7 = -[STSCHAlternativeCarrier initWithNdefRecordBundle:](&v36, sel_initWithNdefRecordBundle_, v4);
  if (v7)
  {
    objc_msgSend_configurationRecord(v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_payload(v8, v9, v10);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = (unsigned __int8 *)objc_msgSend_bytes(v11, v12, v13);

    objc_msgSend_configurationRecord(v4, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_payload(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend_length(v20, v21, v22);

    if (v23 >= 2)
    {
      while (1)
      {
        v27 = v14 + 2;
        v28 = v23 - 2;
        v29 = *v14 - 1;
        v30 = __OFSUB__(v23 - 2, v29);
        v23 = v23 - 2 - v29;
        if (v23 < 0 != v30)
        {
          sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSCHBluetoothAlternativeCarrier initWithNdefRecordBundle:]", 87, v7, CFSTR("Not enough room for TLV: %ld expected %d"), v25, v26, v28);
          goto LABEL_20;
        }
        v31 = v14[1];
        if (v31 == 7)
          break;
        if (v31 == 28)
        {
          if (*v14 == 2)
            v7->_leRole = objc_msgSend_roleFromSpec_(v7, v24, *v27);
          else
            sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSCHBluetoothAlternativeCarrier initWithNdefRecordBundle:]", 102, v7, CFSTR("Invalid role length : %d"), v25, v26, *v14 - 1);
          goto LABEL_17;
        }
        if (v31 == 27)
        {
          if (*v14 != 8)
          {
            sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSCHBluetoothAlternativeCarrier initWithNdefRecordBundle:]", 95, v7, CFSTR("Invalid address length : %d"), v25, v26, *v14 - 1);
            goto LABEL_17;
          }
          objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v24, (uint64_t)(v14 + 2), 7);
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = 40;
LABEL_11:
          v34 = *(Class *)((char *)&v7->super.super.isa + v33);
          *(Class *)((char *)&v7->super.super.isa + v33) = (Class)v32;

        }
LABEL_17:
        v14 = &v27[v29];
        if (v23 <= 1)
          goto LABEL_20;
      }
      if (*v14 != 17)
      {
        sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSCHBluetoothAlternativeCarrier initWithNdefRecordBundle:]", 108, v7, CFSTR("Invalid advertise UUID length: %d"), v25, v26, *v14 - 1);
        goto LABEL_17;
      }
      objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v24, (uint64_t)(v14 + 2), 16);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = 48;
      goto LABEL_11;
    }
  }
LABEL_20:

  return v7;
}

+ (id)connectionHandoverAlternativeCarrierWithBundle:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  int isBluetoothLEConfigurationRecord;
  id v11;
  const char *v12;
  void *v13;

  v4 = a3;
  objc_msgSend_configurationRecord(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isBluetoothLEConfigurationRecord = objc_msgSend_isBluetoothLEConfigurationRecord(v7, v8, v9);

  if (isBluetoothLEConfigurationRecord)
  {
    v11 = objc_alloc((Class)a1);
    v13 = (void *)objc_msgSend_initWithNdefRecordBundle_(v11, v12, (uint64_t)v4);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSData)humanReadableLEAddress
{
  uint64_t v2;
  void *leAddr;

  leAddr = self->_leAddr;
  if (leAddr)
  {
    objc_msgSend_STS_reverseBytes(leAddr, a2, v2);
    leAddr = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSData *)leAddr;
}

- (NSData)humanReadableAdvertiseUUID
{
  uint64_t v2;
  void *advertiseUUID;

  advertiseUUID = self->_advertiseUUID;
  if (advertiseUUID)
  {
    objc_msgSend_STS_reverseBytes(advertiseUUID, a2, v2);
    advertiseUUID = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSData *)advertiseUUID;
}

- (unsigned)specRole
{
  unint64_t leRole;

  leRole = self->_leRole;
  if (leRole >= 4)
    LOBYTE(leRole) = 1;
  return leRole;
}

- (unint64_t)roleFromSpec:(unsigned __int8)a3
{
  if (a3 >= 4u)
    return 4;
  else
    return a3;
}

- (id)roleString
{
  unint64_t v2;

  v2 = self->_leRole - 1;
  if (v2 > 3)
    return CFSTR("Peripheral");
  else
    return off_24C2B30D0[v2];
}

- (id)_createCarrierConfigurationRecord
{
  void *v3;
  const char *v4;
  void *v5;
  unint64_t leRole;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  int v11;
  const char *v12;
  uint64_t v13;
  BOOL v15;
  _DWORD *v16;
  int v17;
  unsigned int v18;
  char *v20;
  const char *v21;
  void *v22;
  STSNDEFRecord *v23;
  const char *v24;
  void *v25;
  uint64_t v27;
  _OWORD v28[2];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], a2, (uint64_t)"application/vnd.bluetooth.le.oob", 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataUsingEncoding_(CFSTR("0"), v4, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v28, 0, sizeof(v28));
  leRole = self->_leRole;
  objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], v7, v8, 0, 0, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_BOOLForKey_(v9, v10, (uint64_t)CFSTR("BTOOBDataExtras"));

  v15 = (leRole == 4 || leRole == 1) && v11 == 0;
  if (v15 || objc_msgSend_length(self->_leAddr, v12, v13) != 7)
  {
    v18 = 0;
  }
  else
  {
    LOWORD(v28[0]) = 6920;
    v16 = (_DWORD *)objc_msgSend_bytes(self->_leAddr, v12, v13, *(_QWORD *)&v28[0]);
    v17 = *(_DWORD *)((char *)v16 + 3);
    *(_DWORD *)((char *)v28 + 2) = *v16;
    *(_DWORD *)((char *)v28 + 5) = v17;
    v18 = 9;
  }
  if (leRole != 1 && leRole != 4)
  {
    v27 = objc_msgSend_length(self->_advertiseUUID, v12, v13);
    if (v27 == 16)
    {
      *(_WORD *)((unint64_t)v28 | v18) = 1809;
      *(_OWORD *)((unint64_t)v28 | v18 | 2) = *(_OWORD *)objc_msgSend_bytes(self->_advertiseUUID, v12, v13);
      v18 |= 0x12u;
    }
  }
  v20 = (char *)v28 + v18;
  *(_WORD *)v20 = 7170;
  v20[2] = objc_msgSend_specRole(self, v12, v13);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v21, (uint64_t)v28, v18 + 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = [STSNDEFRecord alloc];
  v25 = (void *)objc_msgSend_initWithFormat_type_identifier_payload_(v23, v24, 2, v3, v5, v22);

  return v25;
}

- (id)description
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  NSData *leAddr;
  NSData *advertiseUUID;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_msgSend_powerState(self, a2, v2);
  objc_msgSend_roleString(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  leAddr = self->_leAddr;
  advertiseUUID = self->_advertiseUUID;
  objc_msgSend_auxiliaryRecords(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v14, (uint64_t)CFSTR("{ type=ble,powerState=%lu,role=%@,leAddr=%@,advertiseUUID=%@,aux=%@ }"), v5, v8, leAddr, advertiseUUID, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSData)leAddr
{
  return self->_leAddr;
}

- (void)setLeAddr:(id)a3
{
  objc_storeStrong((id *)&self->_leAddr, a3);
}

- (NSData)advertiseUUID
{
  return self->_advertiseUUID;
}

- (void)setAdvertiseUUID:(id)a3
{
  objc_storeStrong((id *)&self->_advertiseUUID, a3);
}

- (void)setHumanReadableAdvertiseUUID:(id)a3
{
  objc_storeStrong((id *)&self->_humanReadableAdvertiseUUID, a3);
}

- (unint64_t)leRole
{
  return self->_leRole;
}

- (void)setLeRole:(unint64_t)a3
{
  self->_leRole = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_humanReadableAdvertiseUUID, 0);
  objc_storeStrong((id *)&self->_advertiseUUID, 0);
  objc_storeStrong((id *)&self->_leAddr, 0);
}

@end
