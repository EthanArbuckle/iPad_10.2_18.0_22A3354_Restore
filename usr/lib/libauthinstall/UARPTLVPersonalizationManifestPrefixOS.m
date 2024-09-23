@implementation UARPTLVPersonalizationManifestPrefixOS

- (UARPTLVPersonalizationManifestPrefixOS)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationManifestPrefixOS;
  return -[UARPMetaDataTLVStringOS init](&v3, sel_init);
}

- (void)setTicketPrefix:(id)a3
{
  id v4;
  UARPTLVPersonalizationManifestPrefixOS *v5;
  uint64_t v6;
  NSString *ticketPrefix;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = objc_msgSend(v4, "copy");
  ticketPrefix = v5->_ticketPrefix;
  v5->_ticketPrefix = (NSString *)v6;

  objc_sync_exit(v5);
}

- (id)description
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v3 = +[UARPTLVPersonalizationManifestPrefixOS metaDataTableEntry](UARPTLVPersonalizationManifestPrefixOS, "metaDataTableEntry");
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = (id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Name"));
  v6 = (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %@>"), v5, self->_ticketPrefix);

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563389;
}

- (id)generateTLV
{
  uint64_t v3;
  NSString *ticketPrefix;
  objc_super v6;

  v3 = +[UARPTLVPersonalizationManifestPrefixOS tlvType](UARPTLVPersonalizationManifestPrefixOS, "tlvType");
  ticketPrefix = self->_ticketPrefix;
  v6.receiver = self;
  v6.super_class = (Class)UARPTLVPersonalizationManifestPrefixOS;
  return -[UARPMetaDataTLVStringOS generateTLV:tlvValue:](&v6, sel_generateTLV_tlvValue_, v3, ticketPrefix);
}

- (id)tlvValue
{
  NSString *ticketPrefix;
  objc_super v4;

  ticketPrefix = self->_ticketPrefix;
  v4.receiver = self;
  v4.super_class = (Class)UARPTLVPersonalizationManifestPrefixOS;
  return -[UARPMetaDataTLVStringOS tlvValue:](&v4, sel_tlvValue_, ticketPrefix);
}

+ (id)metaDataTableEntry
{
  id v2;
  id v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("Personalization Manifest Prefix");
  v5[0] = CFSTR("Name");
  v5[1] = CFSTR("Value");
  v2 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", +[UARPTLVPersonalizationManifestPrefixOS tlvType](UARPTLVPersonalizationManifestPrefixOS, "tlvType"));
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
    objc_msgSend(v4, "setTicketPrefix:", v3);
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
  void *v7;

  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a4, a3, 4);
  objc_msgSend(v6, "setTicketPrefix:", v7);

  return v6;
}

- (NSString)ticketPrefix
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ticketPrefix, 0);
}

@end
