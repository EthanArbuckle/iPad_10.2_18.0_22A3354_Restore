@implementation STSCHAlternativeCarrier

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  id v9;

  type = self->_type;
  v9 = a3;
  objc_msgSend_encodeInteger_forKey_(v9, v5, type, CFSTR("type"));
  objc_msgSend_encodeInteger_forKey_(v9, v6, self->_powerState, CFSTR("powerState"));
  objc_msgSend_encodeObject_forKey_(v9, v7, (uint64_t)self->_carrierRecord, CFSTR("carrierRecord"));
  objc_msgSend_encodeObject_forKey_(v9, v8, (uint64_t)self->_auxiliaryRecords, CFSTR("auxiliaryRecords"));

}

- (STSCHAlternativeCarrier)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  STSCHAlternativeCarrier *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  STSNDEFRecord *carrierRecord;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  NSArray *auxiliaryRecords;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)STSCHAlternativeCarrier;
  v6 = -[STSCHAlternativeCarrier init](&v21, sel_init);
  if (v6)
  {
    v6->_type = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)CFSTR("type"));
    v6->_powerState = objc_msgSend_decodeIntegerForKey_(v4, v7, (uint64_t)CFSTR("powerState"));
    v8 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v8, CFSTR("carrierRecord"));
    v10 = objc_claimAutoreleasedReturnValue();
    carrierRecord = v6->_carrierRecord;
    v6->_carrierRecord = (STSNDEFRecord *)v10;

    v12 = (void *)MEMORY[0x24BDBCF20];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend_setWithObjects_(v12, v15, v13, v14, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v17, (uint64_t)v16, CFSTR("auxiliaryRecords"));
    v18 = objc_claimAutoreleasedReturnValue();
    auxiliaryRecords = v6->_auxiliaryRecords;
    v6->_auxiliaryRecords = (NSArray *)v18;

  }
  return v6;
}

- (STSCHAlternativeCarrier)initWithNdefRecordBundle:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  STSCHAlternativeCarrier *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  int isWiFiAwareConfigurationRecord;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  int isBluetoothLEConfigurationRecord;
  void *v19;
  const char *v20;
  uint64_t v21;
  int isNfcConfigurationRecord;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  STSNDEFRecord *carrierRecord;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  NSArray *auxiliaryRecords;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)STSCHAlternativeCarrier;
  v7 = -[STSCHAlternativeCarrier init](&v35, sel_init);
  if (v7)
  {
    objc_msgSend_configurationRecord(v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    isWiFiAwareConfigurationRecord = objc_msgSend_isWiFiAwareConfigurationRecord(v8, v9, v10);

    if (isWiFiAwareConfigurationRecord)
    {
      v14 = 1;
    }
    else
    {
      objc_msgSend_configurationRecord(v4, v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      isBluetoothLEConfigurationRecord = objc_msgSend_isBluetoothLEConfigurationRecord(v15, v16, v17);

      if (isBluetoothLEConfigurationRecord)
      {
        v14 = 2;
      }
      else
      {
        objc_msgSend_configurationRecord(v4, v12, v13);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        isNfcConfigurationRecord = objc_msgSend_isNfcConfigurationRecord(v19, v20, v21);

        if (!isNfcConfigurationRecord)
        {
          v7->_type = 0;
          goto LABEL_9;
        }
        v14 = 3;
      }
    }
    v7->_type = v14;
LABEL_9:
    objc_msgSend_alternativeRecord(v4, v12, v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_powerState = objc_msgSend_getCarrierPowerStateFromAlternativeCarrierRecord(v23, v24, v25);

    objc_msgSend_configurationRecord(v4, v26, v27);
    v28 = objc_claimAutoreleasedReturnValue();
    carrierRecord = v7->_carrierRecord;
    v7->_carrierRecord = (STSNDEFRecord *)v28;

    objc_msgSend_auxiliaryRecords(v4, v30, v31);
    v32 = objc_claimAutoreleasedReturnValue();
    auxiliaryRecords = v7->_auxiliaryRecords;
    v7->_auxiliaryRecords = (NSArray *)v32;

  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  STSCHAlternativeCarrier *v4;
  STSCHAlternativeCarrier *v5;
  STSCHAlternativeCarrier *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  BOOL v16;

  v4 = (STSCHAlternativeCarrier *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v16 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v16 = 0;
    if (objc_msgSend_isEqual_(self->_carrierRecord, v7, (uint64_t)v6->_carrierRecord))
    {
      v10 = objc_msgSend_count(self->_auxiliaryRecords, v8, v9);
      if (v10 == objc_msgSend_count(v6->_auxiliaryRecords, v11, v12)
        && (!objc_msgSend_count(self->_auxiliaryRecords, v13, v14)
         || objc_msgSend_isEqualToArray_(self->_auxiliaryRecords, v15, (uint64_t)v6->_auxiliaryRecords)))
      {
        v16 = 1;
      }
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("type=%lu,powerState=%lu,carrier=%@,aux=%@"), self->_type, self->_powerState, self->_carrierRecord, self->_auxiliaryRecords);
}

+ (id)connectionHandoverAlternativeCarrierWithBundle:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t vars0;

  sub_20A02B230(OS_LOG_TYPE_ERROR, 0, (uint64_t)"+[STSCHAlternativeCarrier connectionHandoverAlternativeCarrierWithBundle:]", 87, CFSTR("Must override by subclass"), v3, v4, v5, vars0);
  return 0;
}

- (id)createAlternativeCarrierRecord
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  NSArray *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  STSNDEFRecord *v43;
  const char *v44;
  uint64_t v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  char v52;
  char v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_identifier(self->_carrierRecord, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  if (!v4)
  {
    v11 = CFSTR("Missing carrier data reference");
    v12 = 99;
    goto LABEL_5;
  }
  if ((unint64_t)objc_msgSend_length(v4, v5, v6) >= 0x100)
  {
    v11 = CFSTR("Invalid carrier reference length");
    v12 = 102;
LABEL_5:
    sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSCHAlternativeCarrier createAlternativeCarrierRecord]", v12, self, v11, v7, v8, v46);
    v13 = 0;
    goto LABEL_14;
  }
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v10, (uint64_t)"ac", 2);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = self->_powerState & 3;
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCEC8], v14, (uint64_t)&v53, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend_length(v9, v16, v17);
  objc_msgSend_appendBytes_length_(v15, v18, (uint64_t)&v53, 1);
  objc_msgSend_appendData_(v15, v19, (uint64_t)v9);
  v52 = 0;
  objc_msgSend_data(MEMORY[0x24BDBCEC8], v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v23 = self->_auxiliaryRecords;
  v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v48, v54, 16);
  if (v25)
  {
    v28 = v25;
    v29 = 0;
    v30 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v49 != v30)
          objc_enumerationMutation(v23);
        v32 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend_identifier(v32, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend_length(v33, v34, v35);

        objc_msgSend_appendBytes_length_(v22, v36, (uint64_t)&v53, 1);
        objc_msgSend_identifier(v32, v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendData_(v22, v40, (uint64_t)v39);

        v52 = ++v29;
      }
      v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v48, v54, 16);
    }
    while (v28);
  }

  objc_msgSend_appendBytes_length_(v15, v41, (uint64_t)&v52, 1);
  objc_msgSend_appendData_(v15, v42, (uint64_t)v22);
  v43 = [STSNDEFRecord alloc];
  v13 = (void *)objc_msgSend_initWithFormat_type_identifier_payload_(v43, v44, 1, v47, 0, v15);

LABEL_14:
  return v13;
}

- (id)_createCarrierConfigurationRecord
{
  return self->_carrierRecord;
}

- (id)createNdefRecordBundle
{
  STSCHNdefRecordBundle *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;

  v3 = [STSCHNdefRecordBundle alloc];
  objc_msgSend_createAlternativeCarrierRecord(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__createCarrierConfigurationRecord(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_initWithAlternativeRecord_configurationRecord_auxiliaryRecords_errorRecord_(v3, v10, (uint64_t)v6, v9, self->_auxiliaryRecords, 0);

  return v11;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)powerState
{
  return self->_powerState;
}

- (void)setPowerState:(unint64_t)a3
{
  self->_powerState = a3;
}

- (STSNDEFRecord)carrierRecord
{
  return self->_carrierRecord;
}

- (void)setCarrierRecord:(id)a3
{
  objc_storeStrong((id *)&self->_carrierRecord, a3);
}

- (NSArray)auxiliaryRecords
{
  return self->_auxiliaryRecords;
}

- (void)setAuxiliaryRecords:(id)a3
{
  objc_storeStrong((id *)&self->_auxiliaryRecords, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryRecords, 0);
  objc_storeStrong((id *)&self->_carrierRecord, 0);
}

@end
