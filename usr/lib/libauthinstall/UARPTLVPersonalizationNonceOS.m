@implementation UARPTLVPersonalizationNonceOS

- (UARPTLVPersonalizationNonceOS)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationNonceOS;
  return -[UARPMetaDataTLVDataOS init](&v3, sel_init);
}

- (void)setNonce:(id)a3
{
  id v4;
  UARPTLVPersonalizationNonceOS *v5;
  uint64_t v6;
  NSData *nonce;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = objc_msgSend(v4, "copy");
  nonce = v5->_nonce;
  v5->_nonce = (NSData *)v6;

  objc_sync_exit(v5);
}

- (id)description
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v3 = +[UARPTLVPersonalizationNonceOS metaDataTableEntry](UARPTLVPersonalizationNonceOS, "metaDataTableEntry");
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = (id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Name"));
  v6 = (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %@>"), v5, self->_nonce);

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563385;
}

- (id)generateTLV
{
  uint64_t v3;
  NSData *nonce;
  objc_super v6;

  v3 = +[UARPTLVPersonalizationNonceOS tlvType](UARPTLVPersonalizationNonceOS, "tlvType");
  nonce = self->_nonce;
  v6.receiver = self;
  v6.super_class = (Class)UARPTLVPersonalizationNonceOS;
  return -[UARPMetaDataTLVDataOS generateTLV:tlvValue:](&v6, sel_generateTLV_tlvValue_, v3, nonce);
}

- (id)tlvValue
{
  return self->_nonce;
}

+ (id)metaDataTableEntry
{
  id v2;
  id v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("Personalization Nonce");
  v5[0] = CFSTR("Name");
  v5[1] = CFSTR("Value");
  v2 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", +[UARPTLVPersonalizationNonceOS tlvType](UARPTLVPersonalizationNonceOS, "tlvType"));
  v6[1] = v2;
  v3 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);

  return v3;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setNonce:", v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  void *v6;
  id v7;

  v6 = (void *)objc_opt_new();
  v7 = (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a4, a3);
  objc_msgSend(v6, "setNonce:", v7);

  return v6;
}

- (NSData)nonce
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonce, 0);
}

@end
