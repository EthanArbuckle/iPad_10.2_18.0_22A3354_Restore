@implementation SCDAElectionParticipantIdVendor

- (SCDAElectionParticipantIdVendor)init
{
  SCDAElectionParticipantIdVendor *v2;
  NSObject *v3;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v5.receiver = self;
  v5.super_class = (Class)SCDAElectionParticipantIdVendor;
  v2 = -[SCDAElectionParticipantIdVendor init](&v5, sel_init);
  if (v2)
  {
    v3 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[SCDAElectionParticipantIdVendor init]";
      _os_log_debug_impl(&dword_246211000, v3, OS_LOG_TYPE_DEBUG, "%s #scda ElectionParticipantIdVendor init", buf, 0xCu);
    }
    v2->_deallocInProgress = 0;
    -[SCDAElectionParticipantIdVendor _init](v2, "_init");
  }
  return v2;
}

- (void)_init
{
  CBAdvertiser *v3;
  CBAdvertiser *cbAdvertiser;
  uint64_t v5;
  CBAdvertiser *v6;
  CBAdvertiser *v7;
  CBAdvertiser *v8;
  CBAdvertiser *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;
  _QWORD v15[5];
  _QWORD v16[5];

  self->_reinitialize = 0;
  v3 = (CBAdvertiser *)objc_alloc_init(MEMORY[0x24BDBB218]);
  cbAdvertiser = self->_cbAdvertiser;
  self->_cbAdvertiser = v3;

  v5 = MEMORY[0x24BDAC760];
  v6 = self->_cbAdvertiser;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __40__SCDAElectionParticipantIdVendor__init__block_invoke;
  v16[3] = &unk_25174AD68;
  v16[4] = self;
  -[CBAdvertiser setInterruptionHandler:](v6, "setInterruptionHandler:", v16);
  v7 = self->_cbAdvertiser;
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __40__SCDAElectionParticipantIdVendor__init__block_invoke_21;
  v15[3] = &unk_25174AD68;
  v15[4] = self;
  -[CBAdvertiser setInvalidationHandler:](v7, "setInvalidationHandler:", v15);
  objc_initWeak(&location, self);
  v8 = self->_cbAdvertiser;
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __40__SCDAElectionParticipantIdVendor__init__block_invoke_22;
  v12[3] = &unk_25174A568;
  objc_copyWeak(&v13, &location);
  -[CBAdvertiser setAdvertisingAddressChangedHandler:](v8, "setAdvertisingAddressChangedHandler:", v12);
  v9 = self->_cbAdvertiser;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __40__SCDAElectionParticipantIdVendor__init__block_invoke_2;
  v10[3] = &unk_25174A590;
  v10[4] = self;
  objc_copyWeak(&v11, &location);
  -[CBAdvertiser activateWithCompletion:](v9, "activateWithCompletion:", v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_reinit
{
  NSObject *v3;
  NSData *bleAddress;
  NSData *rotatedBLEAddress;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (!self->_deallocInProgress)
  {
    v3 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
    {
      v6 = 136315138;
      v7 = "-[SCDAElectionParticipantIdVendor _reinit]";
      _os_log_debug_impl(&dword_246211000, v3, OS_LOG_TYPE_DEBUG, "%s #scda ElectionParticipantIdVendor reinit", (uint8_t *)&v6, 0xCu);
    }
    bleAddress = self->_bleAddress;
    self->_bleAddress = 0;

    rotatedBLEAddress = self->_rotatedBLEAddress;
    self->_rotatedBLEAddress = 0;

    -[SCDAElectionParticipantIdVendor _clearCBAdvertiser](self, "_clearCBAdvertiser");
    -[SCDAElectionParticipantIdVendor _init](self, "_init");
  }
}

- (void)fetchBTLEAddressIfRequired
{
  if (self->_reinitialize)
    -[SCDAElectionParticipantIdVendor _reinit](self, "_reinit");
  if (!self->_bleAddress)
    -[SCDAElectionParticipantIdVendor _fetchBTLEAddress](self, "_fetchBTLEAddress");
}

- (void)_fetchBTLEAddress
{
  CBAdvertiser *cbAdvertiser;
  void *v4;
  NSData *v5;
  void *v6;
  NSData *bleAddress;
  NSData **p_bleAddress;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  SCDAElectionParticipantIdVendor *v17;
  uint64_t v18;
  SCDAElectionParticipantIdVendor *v19;
  NSData **p_rotatedBLEAddress;
  uint64_t v21;
  SCDAElectionParticipantIdVendor *v22;
  uint64_t v23;
  NSData *v24;
  NSDate *lastAddressChange;
  NSData *v26;
  NSData *v27;
  int v28;
  const char *v29;
  __int16 v30;
  NSData *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  cbAdvertiser = self->_cbAdvertiser;
  if (cbAdvertiser)
  {
    -[CBAdvertiser advertisingAddressDataNonConnectable](cbAdvertiser, "advertisingAddressDataNonConnectable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSData *)objc_msgSend(v4, "copy");

    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v13 = SCDALogContextCore;
      if (!os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
      {
LABEL_15:

        return;
      }
      v28 = 136315138;
      v29 = "-[SCDAElectionParticipantIdVendor _fetchBTLEAddress]";
      v14 = "%s #scda BTLE address is not available";
      v15 = v13;
      v16 = 12;
LABEL_18:
      _os_log_debug_impl(&dword_246211000, v15, OS_LOG_TYPE_DEBUG, v14, (uint8_t *)&v28, v16);
      goto LABEL_15;
    }
    p_bleAddress = &self->_bleAddress;
    bleAddress = self->_bleAddress;
    if (bleAddress)
    {
      if (-[NSData isEqualToData:](bleAddress, "isEqualToData:", v5))
      {
        v9 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
        {
          v28 = 136315138;
          v29 = "-[SCDAElectionParticipantIdVendor _fetchBTLEAddress]";
          v10 = "%s #scda Ignoring duplicate BTLE address change";
          v11 = v9;
          v12 = 12;
LABEL_20:
          _os_log_debug_impl(&dword_246211000, v11, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v28, v12);
        }
      }
      else
      {
        v19 = self;
        objc_sync_enter(v19);
        p_rotatedBLEAddress = &v19->_rotatedBLEAddress;
        objc_storeStrong((id *)&v19->_rotatedBLEAddress, self->_bleAddress);
        objc_storeStrong((id *)&v19->_lastRotatedAddressChange, v19->_lastAddressChange);
        objc_storeStrong((id *)&self->_bleAddress, v5);
        objc_storeStrong((id *)&v19->_lastAddressChange, v6);
        objc_sync_exit(v19);

        v21 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
        {
          v26 = *p_rotatedBLEAddress;
          v27 = *p_bleAddress;
          v28 = 136315650;
          v29 = "-[SCDAElectionParticipantIdVendor _fetchBTLEAddress]";
          v30 = 2112;
          v31 = v26;
          v32 = 2112;
          v33 = v27;
          v10 = "%s #scda BTLE address changed from %@ to %@";
          v11 = v21;
          v12 = 32;
          goto LABEL_20;
        }
      }
    }
    else
    {
      v17 = self;
      objc_sync_enter(v17);
      objc_storeStrong((id *)&self->_bleAddress, v5);
      objc_storeStrong((id *)&v17->_lastAddressChange, v6);
      objc_sync_exit(v17);

      v18 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
      {
        v28 = 136315394;
        v29 = "-[SCDAElectionParticipantIdVendor _fetchBTLEAddress]";
        v30 = 2112;
        v31 = v5;
        v10 = "%s #scda BTLE address initialized to %@ due to address change";
        v11 = v18;
        v12 = 22;
        goto LABEL_20;
      }
    }
    v22 = self;
    objc_sync_enter(v22);
    objc_storeStrong((id *)&self->_bleAddress, v5);
    if (self->_bleAddress)
      objc_storeStrong((id *)&v22->_lastAddressChange, v6);
    objc_sync_exit(v22);

    v23 = SCDALogContextCore;
    if (!os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
      goto LABEL_15;
    v24 = *p_bleAddress;
    lastAddressChange = v22->_lastAddressChange;
    v28 = 136315650;
    v29 = "-[SCDAElectionParticipantIdVendor _fetchBTLEAddress]";
    v30 = 2112;
    v31 = v24;
    v32 = 2112;
    v33 = lastAddressChange;
    v14 = "%s #scda BTLE address initialized to %@ lastChange:%@";
    v15 = v23;
    v16 = 32;
    goto LABEL_18;
  }
}

- (id)computeIds:(id)a3
{
  id v4;
  SCDAElectionParticipantIdVendor *v5;
  NSData *v6;
  NSDate *v7;
  NSData *v8;
  NSDate *v9;
  double v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v18;
  double v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  const char *v23;
  __int16 v24;
  _BYTE v25[10];
  NSData *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SCDAElectionParticipantIdVendor fetchBTLEAddressIfRequired](self, "fetchBTLEAddressIfRequired");
  v5 = self;
  objc_sync_enter(v5);
  v6 = v5->_bleAddress;
  v7 = v5->_lastAddressChange;
  v8 = v5->_rotatedBLEAddress;
  v9 = v5->_lastRotatedAddressChange;
  objc_sync_exit(v5);

  if (!v4 || !v6)
  {
    v13 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
    {
      v22 = 136315650;
      v23 = "-[SCDAElectionParticipantIdVendor computeIds:]";
      v24 = 1024;
      *(_DWORD *)v25 = v6 == 0;
      *(_WORD *)&v25[4] = 1024;
      *(_DWORD *)&v25[6] = v4 == 0;
      _os_log_debug_impl(&dword_246211000, v13, OS_LOG_TYPE_DEBUG, "%s #scda Returning null sentinel id. addressNil?%d payloadNil?%d", (uint8_t *)&v22, 0x18u);
    }
    v12 = (void *)_nullId;
    goto LABEL_10;
  }
  -[NSDate timeIntervalSinceNow](v7, "timeIntervalSinceNow");
  if (v10 < -1202.0)
  {
    v11 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
    {
      v22 = 136315394;
      v23 = "-[SCDAElectionParticipantIdVendor computeIds:]";
      v24 = 2112;
      *(_QWORD *)v25 = v7;
      _os_log_debug_impl(&dword_246211000, v11, OS_LOG_TYPE_DEBUG, "%s #scda Returning stale sentinel id. lastChange: %@", (uint8_t *)&v22, 0x16u);
    }
    v12 = (void *)_staleId;
LABEL_10:
    v14 = v12;
LABEL_11:
    v15 = 0;
    goto LABEL_12;
  }
  +[SCDAElectionParticipantIdVendor computeId:withPayload:](SCDAElectionParticipantIdVendor, "computeId:withPayload:", v6, v4);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v18 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    v22 = 136315906;
    v23 = "-[SCDAElectionParticipantIdVendor computeIds:]";
    v24 = 2112;
    *(_QWORD *)v25 = v14;
    *(_WORD *)&v25[8] = 2112;
    v26 = v6;
    v27 = 2112;
    v28 = v4;
    _os_log_debug_impl(&dword_246211000, v18, OS_LOG_TYPE_DEBUG, "%s #scda Primary electionParticipantId: %@ from address %@ and payload %@", (uint8_t *)&v22, 0x2Au);
    if (!v8)
      goto LABEL_11;
  }
  else if (!v8)
  {
    goto LABEL_11;
  }
  -[NSDate timeIntervalSinceNow](v9, "timeIntervalSinceNow");
  if (v19 < -1202.0)
  {
    v20 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
    {
      v22 = 136315394;
      v23 = "-[SCDAElectionParticipantIdVendor computeIds:]";
      v24 = 2112;
      *(_QWORD *)v25 = v9;
      _os_log_debug_impl(&dword_246211000, v20, OS_LOG_TYPE_DEBUG, "%s #scda Ignoring stale rotated address. lastChange: %@", (uint8_t *)&v22, 0x16u);
    }
    goto LABEL_11;
  }
  +[SCDAElectionParticipantIdVendor computeId:withPayload:](SCDAElectionParticipantIdVendor, "computeId:withPayload:", v8, v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    v22 = 136315650;
    v23 = "-[SCDAElectionParticipantIdVendor computeIds:]";
    v24 = 2112;
    *(_QWORD *)v25 = v15;
    *(_WORD *)&v25[8] = 2112;
    v26 = v8;
    _os_log_debug_impl(&dword_246211000, v21, OS_LOG_TYPE_DEBUG, "%s #scda Rotated electionParticipantId: %@ from address %@", (uint8_t *)&v22, 0x20u);
  }
LABEL_12:
  v16 = -[SCDAElectionParticipantIds init:rotatedElectionParticipantId:]([SCDAElectionParticipantIds alloc], "init:rotatedElectionParticipantId:", v14, v15);

  return v16;
}

- (void)_clearCBAdvertiser
{
  CBAdvertiser *cbAdvertiser;
  CBAdvertiser *v3;

  cbAdvertiser = self->_cbAdvertiser;
  if (cbAdvertiser)
  {
    self->_cbAdvertiser = 0;
    v3 = cbAdvertiser;

    -[CBAdvertiser setInvalidationHandler:](v3, "setInvalidationHandler:", 0);
    -[CBAdvertiser setInterruptionHandler:](v3, "setInterruptionHandler:", 0);
    -[CBAdvertiser setAdvertisingAddressChangedHandler:](v3, "setAdvertisingAddressChangedHandler:", 0);
    -[CBAdvertiser invalidate](v3, "invalidate");

  }
}

- (void)dealloc
{
  NSData *bleAddress;
  NSData *rotatedBLEAddress;
  objc_super v5;

  self->_deallocInProgress = 1;
  bleAddress = self->_bleAddress;
  self->_bleAddress = 0;

  rotatedBLEAddress = self->_rotatedBLEAddress;
  self->_rotatedBLEAddress = 0;

  -[SCDAElectionParticipantIdVendor _clearCBAdvertiser](self, "_clearCBAdvertiser");
  v5.receiver = self;
  v5.super_class = (Class)SCDAElectionParticipantIdVendor;
  -[SCDAElectionParticipantIdVendor dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRotatedAddressChange, 0);
  objc_storeStrong((id *)&self->_rotatedBLEAddress, 0);
  objc_storeStrong((id *)&self->_lastAddressChange, 0);
  objc_storeStrong((id *)&self->_bleAddress, 0);
  objc_storeStrong((id *)&self->_cbAdvertiser, 0);
}

void __40__SCDAElectionParticipantIdVendor__init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v3 = 136315138;
    v4 = "-[SCDAElectionParticipantIdVendor _init]_block_invoke";
    _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s #scda CBAdvertiser interrupted. Will flag for reinitialization", (uint8_t *)&v3, 0xCu);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
}

void __40__SCDAElectionParticipantIdVendor__init__block_invoke_21(uint64_t a1)
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v3 = 136315138;
    v4 = "-[SCDAElectionParticipantIdVendor _init]_block_invoke";
    _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s #scda CBAdvertiser invalidated. Will flag for reinitialization", (uint8_t *)&v3, 0xCu);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
}

void __40__SCDAElectionParticipantIdVendor__init__block_invoke_22(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_fetchBTLEAddress");

}

void __40__SCDAElectionParticipantIdVendor__init__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
    v4 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[SCDAElectionParticipantIdVendor _init]_block_invoke_2";
      v8 = 2112;
      v9 = v3;
      _os_log_error_impl(&dword_246211000, v4, OS_LOG_TYPE_ERROR, "%s #scda CBAdvertiser activation failed with %@; BTLE address may not be available",
        (uint8_t *)&v6,
        0x16u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_fetchBTLEAddress");

  }
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
  v3 = (void *)_nullId;
  _nullId = v2;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF"));
  v5 = (void *)_staleId;
  _staleId = v4;

}

+ (NSUUID)nullId
{
  return (NSUUID *)(id)_nullId;
}

+ (NSUUID)staleId
{
  return (NSUUID *)(id)_staleId;
}

+ (id)computeId:(id)a3 withPayload:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  CC_LONG v8;
  void *v9;
  id v10;
  const void *v11;
  CC_LONG v12;
  id v13;
  const void *v14;
  CC_SHA1_CTX v16;
  unsigned __int8 md[6];
  char v18;
  char v19;
  _QWORD data[3];

  data[2] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(v5, "length");
  if (v7 >= 8)
    v8 = 8;
  else
    v8 = v7;
  data[0] = 0;
  data[1] = 0;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("73fa281b-4376-5284-8d9f-dc7ec5ad068f"));
  objc_msgSend(v9, "getUUIDBytes:", data);

  memset(&v16, 0, sizeof(v16));
  CC_SHA1_Init(&v16);
  CC_SHA1_Update(&v16, data, 0x10u);
  v10 = objc_retainAutorelease(v6);
  v11 = (const void *)objc_msgSend(v10, "bytes");
  v12 = objc_msgSend(v10, "length");

  CC_SHA1_Update(&v16, v11, v12);
  v13 = objc_retainAutorelease(v5);
  v14 = (const void *)objc_msgSend(v13, "bytes");

  CC_SHA1_Update(&v16, v14, v8);
  CC_SHA1_Final(md, &v16);
  v18 = v18 & 0xF | 0x50;
  v19 = v19 & 0x3F | 0x80;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", md);
}

@end
