@implementation UARPTLVPersonalizationChipIDOS

- (UARPTLVPersonalizationChipIDOS)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationChipIDOS;
  return -[UARPMetaDataTLV32OS init](&v3, sel_init);
}

- (void)setChipID:(unsigned int)a3
{
  UARPTLVPersonalizationChipIDOS *v4;

  v4 = self;
  objc_sync_enter(v4);
  *(&v4->super.super._tlvLength + 1) = a3;
  objc_sync_exit(v4);

}

- (id)description
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v3 = +[UARPTLVPersonalizationChipIDOS metaDataTableEntry](UARPTLVPersonalizationChipIDOS, "metaDataTableEntry");
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = (id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Name"));
  v6 = (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: 0x%08x>"), v5, *(&self->super.super._tlvLength + 1));

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563387;
}

- (id)generateTLV
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v3 = +[UARPTLVPersonalizationChipIDOS tlvType](UARPTLVPersonalizationChipIDOS, "tlvType");
  v4 = *(&self->super.super._tlvLength + 1);
  v6.receiver = self;
  v6.super_class = (Class)UARPTLVPersonalizationChipIDOS;
  return -[UARPMetaDataTLV32OS generateTLV:tlvValue:](&v6, sel_generateTLV_tlvValue_, v3, v4);
}

- (id)tlvValue
{
  uint64_t v2;
  objc_super v4;

  v2 = *(&self->super.super._tlvLength + 1);
  v4.receiver = self;
  v4.super_class = (Class)UARPTLVPersonalizationChipIDOS;
  return -[UARPMetaDataTLV32OS tlvValue:](&v4, sel_tlvValue_, v2);
}

+ (id)metaDataTableEntry
{
  id v2;
  id v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("Personalization Chip ID");
  v5[0] = CFSTR("Name");
  v5[1] = CFSTR("Value");
  v2 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", +[UARPTLVPersonalizationChipIDOS tlvType](UARPTLVPersonalizationChipIDOS, "tlvType"));
  v6[1] = v2;
  v3 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);

  return v3;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = (void *)objc_opt_new();
    v6 = objc_msgSend(v4, "unsignedLongValue");

    objc_msgSend(v5, "setChipID:", v6);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  void *v5;

  if (a3 == 4)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setChipID:", uarpHtonl(*(_DWORD *)a4));
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (unsigned)chipID
{
  return *(&self->super.super._tlvLength + 1);
}

@end
