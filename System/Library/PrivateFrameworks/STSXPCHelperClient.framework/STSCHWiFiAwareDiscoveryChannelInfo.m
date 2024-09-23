@implementation STSCHWiFiAwareDiscoveryChannelInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *supportedBands;
  const char *v5;
  const char *v6;
  const char *v7;
  id v8;

  supportedBands = self->_supportedBands;
  v8 = a3;
  objc_msgSend_encodeObject_forKey_(v8, v5, (uint64_t)supportedBands, CFSTR("supportedBands"));
  objc_msgSend_encodeObject_forKey_(v8, v6, (uint64_t)self->_operatingClass, CFSTR("operatingClass"));
  objc_msgSend_encodeObject_forKey_(v8, v7, (uint64_t)self->_channelNumber, CFSTR("channelNumber"));

}

- (STSCHWiFiAwareDiscoveryChannelInfo)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  STSCHWiFiAwareDiscoveryChannelInfo *v6;
  uint64_t v7;
  NSNumber *supportedBands;
  const char *v9;
  uint64_t v10;
  NSNumber *operatingClass;
  const char *v12;
  uint64_t v13;
  NSNumber *channelNumber;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)STSCHWiFiAwareDiscoveryChannelInfo;
  v6 = -[STSCHWiFiAwareDiscoveryChannelInfo init](&v16, sel_init);
  if (v6)
  {
    objc_msgSend_decodeObjectForKey_(v4, v5, (uint64_t)CFSTR("supportedBands"));
    v7 = objc_claimAutoreleasedReturnValue();
    supportedBands = v6->_supportedBands;
    v6->_supportedBands = (NSNumber *)v7;

    objc_msgSend_decodeObjectForKey_(v4, v9, (uint64_t)CFSTR("operatingClass"));
    v10 = objc_claimAutoreleasedReturnValue();
    operatingClass = v6->_operatingClass;
    v6->_operatingClass = (NSNumber *)v10;

    objc_msgSend_decodeObjectForKey_(v4, v12, (uint64_t)CFSTR("channelNumber"));
    v13 = objc_claimAutoreleasedReturnValue();
    channelNumber = v6->_channelNumber;
    v6->_channelNumber = (NSNumber *)v13;

  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  STSCHWiFiAwareDiscoveryChannelInfo *v4;
  STSCHWiFiAwareDiscoveryChannelInfo *v5;
  STSCHWiFiAwareDiscoveryChannelInfo *v6;
  const char *v7;
  uint64_t v8;
  STSCHWiFiAwareDiscoveryChannelInfo *v9;
  void *v10;
  NSNumber *supportedBands;
  void *v12;
  const char *v13;
  char isEqual;
  const char *v15;
  uint64_t v16;
  BOOL v17;
  void *v18;
  void *v19;
  NSNumber *operatingClass;
  void *v21;
  const char *v22;
  char v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSNumber *channelNumber;
  void *v29;
  const char *v30;
  char v31;
  void *v32;

  v4 = (STSCHWiFiAwareDiscoveryChannelInfo *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v17 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        v9 = v6;
        if (self->_supportedBands)
        {
          objc_msgSend_supportedBands(v6, v7, v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          supportedBands = self->_supportedBands;
          if (v10)
          {
            objc_msgSend_supportedBands(v9, v7, v8);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            isEqual = objc_msgSend_isEqual_(supportedBands, v13, (uint64_t)v12);

            if ((isEqual & 1) == 0)
              goto LABEL_24;
            goto LABEL_12;
          }
          if (supportedBands)
            goto LABEL_24;
        }
        objc_msgSend_supportedBands(v9, v7, v8);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
          goto LABEL_24;
LABEL_12:
        if (self->_operatingClass)
        {
          objc_msgSend_operatingClass(v9, v15, v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          operatingClass = self->_operatingClass;
          if (v19)
          {
            objc_msgSend_operatingClass(v9, v15, v16);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend_isEqual_(operatingClass, v22, (uint64_t)v21);

            if ((v23 & 1) == 0)
              goto LABEL_24;
            goto LABEL_18;
          }
          if (operatingClass)
            goto LABEL_24;
        }
        objc_msgSend_operatingClass(v9, v15, v16);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
          goto LABEL_24;
LABEL_18:
        if (self->_channelNumber)
        {
          objc_msgSend_channelNumber(v9, v24, v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          channelNumber = self->_channelNumber;
          if (v27)
          {
            objc_msgSend_channelNumber(v9, v24, v25);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend_isEqual_(channelNumber, v30, (uint64_t)v29);

            if ((v31 & 1) != 0)
              goto LABEL_27;
            goto LABEL_24;
          }
          if (channelNumber)
            goto LABEL_24;
        }
        objc_msgSend_channelNumber(v9, v24, v25);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v32)
        {
LABEL_27:
          v17 = 1;
          goto LABEL_25;
        }
LABEL_24:
        v17 = 0;
LABEL_25:

        goto LABEL_26;
      }
    }
    v17 = 0;
  }
LABEL_26:

  return v17;
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("bands=%@,class=%@,channel=%@"), self->_supportedBands, self->_operatingClass, self->_channelNumber);
}

- (STSCHWiFiAwareDiscoveryChannelInfo)initWithSupportedBands:(id)a3 operatingClass:(id)a4 channelNumber:(id)a5
{
  id v9;
  id v10;
  id v11;
  STSCHWiFiAwareDiscoveryChannelInfo *v12;
  STSCHWiFiAwareDiscoveryChannelInfo *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)STSCHWiFiAwareDiscoveryChannelInfo;
  v12 = -[STSCHWiFiAwareDiscoveryChannelInfo init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_supportedBands, a3);
    objc_storeStrong((id *)&v13->_operatingClass, a4);
    objc_storeStrong((id *)&v13->_channelNumber, a5);
  }

  return v13;
}

- (id)asData
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  NSNumber *supportedBands;
  const char *v8;
  NSNumber *operatingClass;
  const char *v10;
  uint64_t v11;
  const char *v12;
  __int16 v14;
  char v15;
  char v16;
  __int16 v17;
  char v18;

  objc_msgSend_data(MEMORY[0x24BDBCEC8], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  supportedBands = self->_supportedBands;
  if (supportedBands)
  {
    v17 = 1026;
    v18 = objc_msgSend_intValue(supportedBands, v4, v5);
    objc_msgSend_appendBytes_length_(v6, v8, (uint64_t)&v17, 3);
  }
  operatingClass = self->_operatingClass;
  if (operatingClass && self->_channelNumber)
  {
    v14 = 1283;
    v15 = objc_msgSend_intValue(operatingClass, v4, v5);
    v16 = objc_msgSend_intValue(self->_channelNumber, v10, v11);
    objc_msgSend_appendBytes_length_(v6, v12, (uint64_t)&v14, 4);
  }
  return v6;
}

- (NSNumber)supportedBands
{
  return self->_supportedBands;
}

- (void)setSupportedBands:(id)a3
{
  objc_storeStrong((id *)&self->_supportedBands, a3);
}

- (NSNumber)operatingClass
{
  return self->_operatingClass;
}

- (void)setOperatingClass:(id)a3
{
  objc_storeStrong((id *)&self->_operatingClass, a3);
}

- (NSNumber)channelNumber
{
  return self->_channelNumber;
}

- (void)setChannelNumber:(id)a3
{
  objc_storeStrong((id *)&self->_channelNumber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelNumber, 0);
  objc_storeStrong((id *)&self->_operatingClass, 0);
  objc_storeStrong((id *)&self->_supportedBands, 0);
}

@end
