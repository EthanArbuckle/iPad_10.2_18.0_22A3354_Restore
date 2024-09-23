@implementation UARPTLVPersonalizationFTABSubfileLongnameOS

- (UARPTLVPersonalizationFTABSubfileLongnameOS)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationFTABSubfileLongnameOS;
  return -[UARPMetaDataTLVStringOS init](&v3, sel_init);
}

- (void)setLongname:(id)a3
{
  id v4;
  UARPTLVPersonalizationFTABSubfileLongnameOS *v5;
  uint64_t v6;
  NSString *longname;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = objc_msgSend(v4, "copy");
  longname = v5->_longname;
  v5->_longname = (NSString *)v6;

  objc_sync_exit(v5);
}

- (id)description
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v3 = +[UARPTLVPersonalizationFTABSubfileLongnameOS metaDataTableEntry](UARPTLVPersonalizationFTABSubfileLongnameOS, "metaDataTableEntry");
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = (id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Name"));
  v6 = (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %@>"), v5, self->_longname);

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563374;
}

- (id)generateTLV
{
  uint64_t v3;
  NSString *longname;
  objc_super v6;

  v3 = +[UARPTLVPersonalizationFTABSubfileLongnameOS tlvType](UARPTLVPersonalizationFTABSubfileLongnameOS, "tlvType");
  longname = self->_longname;
  v6.receiver = self;
  v6.super_class = (Class)UARPTLVPersonalizationFTABSubfileLongnameOS;
  return -[UARPMetaDataTLVStringOS generateTLV:tlvValue:](&v6, sel_generateTLV_tlvValue_, v3, longname);
}

- (id)tlvValue
{
  NSString *longname;
  objc_super v4;

  longname = self->_longname;
  v4.receiver = self;
  v4.super_class = (Class)UARPTLVPersonalizationFTABSubfileLongnameOS;
  return -[UARPMetaDataTLVStringOS tlvValue:](&v4, sel_tlvValue_, longname);
}

+ (id)metaDataTableEntry
{
  id v2;
  id v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("Personalization FTAB Payload Longname");
  v5[0] = CFSTR("Name");
  v5[1] = CFSTR("Value");
  v2 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", +[UARPTLVPersonalizationFTABSubfileLongnameOS tlvType](UARPTLVPersonalizationFTABSubfileLongnameOS, "tlvType"));
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
    objc_msgSend(v4, "setLongname:", v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  char *v4;
  void *v5;
  id v6;

  v4 = strndup((const char *)a4, a3);
  v5 = (void *)objc_opt_new();
  v6 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4);
  objc_msgSend(v5, "setLongname:", v6);

  free(v4);
  return v5;
}

- (NSString)longname
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longname, 0);
}

@end
