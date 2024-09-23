@implementation UARPTLVPersonalizationFTABSubfileLongname

- (UARPTLVPersonalizationFTABSubfileLongname)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationFTABSubfileLongname;
  return -[UARPMetaDataTLVString init](&v3, sel_init);
}

- (void)setLongname:(id)a3
{
  UARPTLVPersonalizationFTABSubfileLongname *v4;
  uint64_t v5;
  NSString *longname;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  longname = v4->_longname;
  v4->_longname = (NSString *)v5;

  objc_sync_exit(v4);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[UARPTLVPersonalizationFTABSubfileLongname metaDataTableEntry](UARPTLVPersonalizationFTABSubfileLongname, "metaDataTableEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %@>"), v5, self->_longname);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

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

  v3 = +[UARPTLVPersonalizationFTABSubfileLongname tlvType](UARPTLVPersonalizationFTABSubfileLongname, "tlvType");
  longname = self->_longname;
  v6.receiver = self;
  v6.super_class = (Class)UARPTLVPersonalizationFTABSubfileLongname;
  -[UARPMetaDataTLVString generateTLV:tlvValue:](&v6, sel_generateTLV_tlvValue_, v3, longname);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tlvValue
{
  NSString *longname;
  objc_super v4;

  longname = self->_longname;
  v4.receiver = self;
  v4.super_class = (Class)UARPTLVPersonalizationFTABSubfileLongname;
  -[UARPMetaDataTLVString tlvValue:](&v4, sel_tlvValue_, longname);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)metaDataTableEntry
{
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("Personalization FTAB Payload Longname");
  v5[0] = CFSTR("Name");
  v5[1] = CFSTR("Value");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", +[UARPTLVPersonalizationFTABSubfileLongname tlvType](UARPTLVPersonalizationFTABSubfileLongname, "tlvType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

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
  void *v6;

  v4 = strndup((const char *)a4, a3);
  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
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
