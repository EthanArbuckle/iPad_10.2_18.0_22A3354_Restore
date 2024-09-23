@implementation STSCHWiFiAwareAlternativeCarrier

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
  v7.super_class = (Class)STSCHWiFiAwareAlternativeCarrier;
  v4 = a3;
  -[STSCHAlternativeCarrier encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_securityInfo, CFSTR("securityInfos"), v7.receiver, v7.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_discoveryChannelInfo, CFSTR("discoveryChannelInfo"));

}

- (STSCHWiFiAwareAlternativeCarrier)initWithCoder:(id)a3
{
  id v4;
  STSCHWiFiAwareAlternativeCarrier *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  STSCHWiFiAwareSecurityInfo *securityInfo;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  STSCHWiFiAwareDiscoveryChannelInfo *discoveryChannelInfo;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)STSCHWiFiAwareAlternativeCarrier;
  v5 = -[STSCHAlternativeCarrier initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend_setWithObjects_(v6, v9, v7, v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v11, (uint64_t)v10, CFSTR("securityInfos"));
    v12 = objc_claimAutoreleasedReturnValue();
    securityInfo = v5->_securityInfo;
    v5->_securityInfo = (STSCHWiFiAwareSecurityInfo *)v12;

    v14 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, CFSTR("discoveryChannelInfo"));
    v16 = objc_claimAutoreleasedReturnValue();
    discoveryChannelInfo = v5->_discoveryChannelInfo;
    v5->_discoveryChannelInfo = (STSCHWiFiAwareDiscoveryChannelInfo *)v16;

  }
  return v5;
}

- (void)_initWithCarrierConfiguration:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  unsigned __int8 *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  int v32;
  unsigned __int8 *v33;
  void *v34;
  unint64_t v35;
  uint64_t v36;
  unsigned __int8 *v37;
  unsigned int v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  STSDiffieHellmanParameter *v42;
  const char *v43;
  const char *v44;
  void *v45;
  const char *v46;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  const char *v52;
  void *v53;
  STSCHWiFiAwareDiscoveryChannelInfo *v54;
  const char *v55;
  STSCHWiFiAwareDiscoveryChannelInfo *v56;
  STSCHWiFiAwareDiscoveryChannelInfo *discoveryChannelInfo;
  STSCHWiFiAwareSecurityInfo *v58;
  const char *v59;
  STSCHWiFiAwareSecurityInfo *v60;
  STSCHWiFiAwareSecurityInfo *securityInfo;
  uint64_t v62;
  STSCHWiFiAwareAlternativeCarrier *v63;
  unsigned int v64;
  unsigned int v65;
  unsigned int v66;
  void *v67;
  id v68;

  v68 = a3;
  if ((objc_msgSend_isWiFiAwareConfigurationRecord(v68, v4, v5) & 1) != 0)
  {
    objc_msgSend_payload(v68, v6, v7);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (unsigned __int8 *)objc_msgSend_bytes(v10, v11, v12);

    objc_msgSend_payload(v68, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_length(v16, v17, v18);

    objc_msgSend_array(MEMORY[0x24BDBCEB8], v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x24BDBCEB8], v23, v24);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 < 1)
    {
      v49 = 0;
      v29 = 0;
      v48 = 0;
    }
    else
    {
      v63 = self;
      v29 = 0;
      v64 = -1;
      v65 = -1;
      v30 = 0x24BDBC000uLL;
      v66 = -1;
      do
      {
        v31 = *v13;
        v32 = v13[1];
        v33 = v13 + 2;
        switch(v32)
        {
          case 3:
            if (v31 >= 2)
            {
              objc_msgSend_dataWithBytes_length_(*(void **)(v30 + 3664), v25, (uint64_t)(v13 + 2), (v31 - 1));
              v41 = objc_claimAutoreleasedReturnValue();

              v29 = (void *)v41;
            }
            break;
          case 2:
            v42 = objc_alloc_init(STSDiffieHellmanParameter);
            objc_msgSend_setPublicKeyGroup_(v42, v43, __rev16(*((unsigned __int16 *)v13 + 1)));
            if (v31 >= 4)
            {
              objc_msgSend_dataWithBytes_length_(*(void **)(v30 + 3664), v44, (uint64_t)(v13 + 4), (v31 - 3));
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setPublicKey_(v42, v46, (uint64_t)v45);

            }
            objc_msgSend_addObject_(v28, v44, (uint64_t)v42);

            break;
          case 1:
            if (v31 >= 2)
            {
              v67 = v29;
              v34 = v28;
              v35 = v30;
              v36 = (v31 - 1);
              v37 = v33;
              do
              {
                v38 = *v37++;
                objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v25, v38);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObject_(v22, v40, (uint64_t)v39);

                --v36;
              }
              while (v36);
              v30 = v35;
              v28 = v34;
              v29 = v67;
            }
            break;
          default:
            if (v32 == 4 && (_DWORD)v31 == 2)
            {
              v66 = *v33;
            }
            else if (v32 == 5 && (_DWORD)v31 == 3)
            {
              v64 = v13[2];
              v65 = v13[3];
            }
            else if (v32 != 221)
            {
              sub_20A02B138(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSCHWiFiAwareAlternativeCarrier _initWithCarrierConfiguration:]", 359, v63, CFSTR("Unknown tag:%d"), v26, v27, v13[1]);
            }
            break;
        }
        v13 = &v33[v31 - 1];
        v19 = v19 - 2 - (v31 - 1);
      }
      while (v19 > 0);
      if ((v66 & 0x80000000) != 0)
      {
        v48 = 0;
      }
      else
      {
        objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v25, v66);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if ((v64 & 0x80000000) != 0)
      {
        v49 = 0;
      }
      else
      {
        objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v25, v64);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
      }
      self = v63;
      if ((v65 & 0x80000000) == 0)
      {
        objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v25, v65);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (v48)
          goto LABEL_44;
        goto LABEL_40;
      }
    }
    v50 = 0;
    if (v48)
      goto LABEL_44;
LABEL_40:
    if (!v49 && !v50)
    {
      if (!v29)
      {
LABEL_45:
        v53 = 0;
        goto LABEL_46;
      }
LABEL_43:
      v51 = objc_alloc(MEMORY[0x24BDD17C8]);
      v53 = (void *)objc_msgSend_initWithData_encoding_(v51, v52, (uint64_t)v29, 4);
LABEL_46:
      v58 = [STSCHWiFiAwareSecurityInfo alloc];
      v60 = (STSCHWiFiAwareSecurityInfo *)objc_msgSend_initWithCipherSuites_dhInfo_passphrase_(v58, v59, (uint64_t)v22, v28, v53);
      securityInfo = self->_securityInfo;
      self->_securityInfo = v60;

      goto LABEL_47;
    }
LABEL_44:
    v54 = [STSCHWiFiAwareDiscoveryChannelInfo alloc];
    v56 = (STSCHWiFiAwareDiscoveryChannelInfo *)objc_msgSend_initWithSupportedBands_operatingClass_channelNumber_(v54, v55, (uint64_t)v48, v49, v50);
    discoveryChannelInfo = self->_discoveryChannelInfo;
    self->_discoveryChannelInfo = v56;

    if (!v29)
      goto LABEL_45;
    goto LABEL_43;
  }
  sub_20A02B138(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSCHWiFiAwareAlternativeCarrier _initWithCarrierConfiguration:]", 313, self, CFSTR("Not WiFi Aware Carrier Configuration record"), v8, v9, v62);
LABEL_47:

}

- (STSCHWiFiAwareAlternativeCarrier)initWithSecurityInfo:(id)a3 discoveryChannelInfo:(id)a4 powerState:(unint64_t)a5 auxiliaryRecords:(id)a6
{
  id v11;
  id v12;
  id v13;
  STSCHWiFiAwareAlternativeCarrier *v14;
  STSCHWiFiAwareAlternativeCarrier *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)STSCHWiFiAwareAlternativeCarrier;
  v14 = -[STSCHWiFiAwareAlternativeCarrier init](&v24, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_securityInfo, a3);
    objc_storeStrong((id *)&v15->_discoveryChannelInfo, a4);
    objc_msgSend_setType_(v15, v16, 1);
    if (a5 >= 3)
      objc_msgSend_setPowerState_(v15, v17, 3);
    else
      objc_msgSend_setPowerState_(v15, v17, a5);
    objc_msgSend_setAuxiliaryRecords_(v15, v18, (uint64_t)v13);
    objc_msgSend__createCarrierConfigurationRecord(v15, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCarrierRecord_(v15, v22, (uint64_t)v21);

  }
  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  _QWORD *v6;
  STSCHWiFiAwareSecurityInfo *securityInfo;
  uint64_t v8;
  BOOL v9;
  STSCHWiFiAwareDiscoveryChannelInfo *discoveryChannelInfo;
  uint64_t v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STSCHWiFiAwareAlternativeCarrier;
  if (-[STSCHAlternativeCarrier isEqual:](&v13, sel_isEqual_, v4))
  {
    v6 = v4;
    securityInfo = self->_securityInfo;
    v8 = v6[5];
    if (securityInfo)
    {
      if (!v8 || (objc_msgSend_isEqual_(securityInfo, v5, v8) & 1) == 0)
        goto LABEL_13;
    }
    else if (v8)
    {
      goto LABEL_13;
    }
    discoveryChannelInfo = self->_discoveryChannelInfo;
    v11 = v6[6];
    if (discoveryChannelInfo)
    {
      if (v11 && (objc_msgSend_isEqual_(discoveryChannelInfo, v5, v11) & 1) != 0)
        goto LABEL_11;
    }
    else if (!v11)
    {
LABEL_11:
      v9 = 1;
LABEL_14:

      goto LABEL_15;
    }
LABEL_13:
    v9 = 0;
    goto LABEL_14;
  }
  v9 = 0;
LABEL_15:

  return v9;
}

- (id)description
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_msgSend_powerState(self, a2, v2);
  objc_msgSend_description(self->_securityInfo, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(self->_discoveryChannelInfo, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_auxiliaryRecords(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v18, (uint64_t)CFSTR("{ type=wifi,powerState=%lu,securityInfo={%@},discoveryInfo={%@},aux=%@ }"), v5, v8, v11, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (STSCHWiFiAwareAlternativeCarrier)initWithNdefRecordBundle:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  STSCHWiFiAwareAlternativeCarrier *v7;
  void *v8;
  const char *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STSCHWiFiAwareAlternativeCarrier;
  v7 = -[STSCHAlternativeCarrier initWithNdefRecordBundle:](&v11, sel_initWithNdefRecordBundle_, v4);
  if (v7)
  {
    objc_msgSend_configurationRecord(v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__initWithCarrierConfiguration_(v7, v9, (uint64_t)v8);

  }
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
  int isWiFiAwareConfigurationRecord;
  id v11;
  const char *v12;
  void *v13;

  v4 = a3;
  objc_msgSend_configurationRecord(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isWiFiAwareConfigurationRecord = objc_msgSend_isWiFiAwareConfigurationRecord(v7, v8, v9);

  if (isWiFiAwareConfigurationRecord)
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

- (id)_createCarrierConfigurationRecord
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  STSNDEFRecord *v20;
  const char *v21;
  void *v22;

  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], a2, (uint64_t)"application/vnd.wfa.nanapplication/vnd.bluetooth.le.oob", 23);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataUsingEncoding_(CFSTR("W"), v4, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_data(MEMORY[0x24BDBCEC8], v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_asData(self->_securityInfo, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendData_(v8, v12, (uint64_t)v11);

  objc_msgSend_discoveryChannelInfo(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_asData(v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendData_(v8, v19, (uint64_t)v18);

  v20 = [STSNDEFRecord alloc];
  v22 = (void *)objc_msgSend_initWithFormat_type_identifier_payload_(v20, v21, 2, v3, v5, v8);

  return v22;
}

- (STSCHWiFiAwareSecurityInfo)securityInfo
{
  return self->_securityInfo;
}

- (void)setSecurityInfo:(id)a3
{
  objc_storeStrong((id *)&self->_securityInfo, a3);
}

- (STSCHWiFiAwareDiscoveryChannelInfo)discoveryChannelInfo
{
  return self->_discoveryChannelInfo;
}

- (void)setDiscoveryChannelInfo:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryChannelInfo, a3);
}

- (NSData)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_serviceIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_discoveryChannelInfo, 0);
  objc_storeStrong((id *)&self->_securityInfo, 0);
}

@end
