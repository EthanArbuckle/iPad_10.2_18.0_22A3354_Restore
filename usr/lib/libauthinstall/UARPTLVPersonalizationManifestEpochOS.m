@implementation UARPTLVPersonalizationManifestEpochOS

- (UARPTLVPersonalizationManifestEpochOS)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationManifestEpochOS;
  return -[UARPMetaDataTLV8OS init](&v3, sel_init);
}

- (void)setManifestEpoch:(unsigned __int8)a3
{
  UARPTLVPersonalizationManifestEpochOS *v4;

  v4 = self;
  objc_sync_enter(v4);
  *((_BYTE *)&v4->super.super._tlvLength + 4) = a3;
  objc_sync_exit(v4);

}

- (id)description
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v3 = +[UARPTLVPersonalizationManifestEpochOS metaDataTableEntry](UARPTLVPersonalizationManifestEpochOS, "metaDataTableEntry");
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = (id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Name"));
  v6 = (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: 0x%02x>"), v5, *((unsigned __int8 *)&self->super.super._tlvLength + 4));

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563341;
}

- (id)generateTLV
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v3 = +[UARPTLVPersonalizationManifestEpochOS tlvType](UARPTLVPersonalizationManifestEpochOS, "tlvType");
  v4 = *((unsigned __int8 *)&self->super.super._tlvLength + 4);
  v6.receiver = self;
  v6.super_class = (Class)UARPTLVPersonalizationManifestEpochOS;
  return -[UARPMetaDataTLV8OS generateTLV:tlvValue:](&v6, sel_generateTLV_tlvValue_, v3, v4);
}

- (id)tlvValue
{
  uint64_t v2;
  objc_super v4;

  v2 = *((unsigned __int8 *)&self->super.super._tlvLength + 4);
  v4.receiver = self;
  v4.super_class = (Class)UARPTLVPersonalizationManifestEpochOS;
  return -[UARPMetaDataTLV8OS tlvValue:](&v4, sel_tlvValue_, v2);
}

+ (id)metaDataTableEntry
{
  id v2;
  id v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("Personalization Manifest Epoch");
  v5[0] = CFSTR("Name");
  v5[1] = CFSTR("Value");
  v2 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", +[UARPTLVPersonalizationManifestEpochOS tlvType](UARPTLVPersonalizationManifestEpochOS, "tlvType"));
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
    v6 = objc_msgSend(v4, "unsignedCharValue");

    objc_msgSend(v5, "setManifestEpoch:", v6);
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

  if (a3 == 1)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setManifestEpoch:", *(unsigned __int8 *)a4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (unsigned)manifestEpoch
{
  return *((_BYTE *)&self->super.super._tlvLength + 4);
}

@end
