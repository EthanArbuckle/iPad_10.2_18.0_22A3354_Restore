@implementation UARPTLVHostPersonalizationRequiredOS

- (UARPTLVHostPersonalizationRequiredOS)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPTLVHostPersonalizationRequiredOS;
  return -[UARPMetaDataTLV8OS init](&v3, sel_init);
}

- (void)setIsRequired:(unsigned __int8)a3
{
  UARPTLVHostPersonalizationRequiredOS *v4;

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
  void *v6;
  const __CFString *v7;
  id v8;

  v3 = +[UARPTLVHostPersonalizationRequiredOS metaDataTableEntry](UARPTLVHostPersonalizationRequiredOS, "metaDataTableEntry");
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = (id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Name"));
  v6 = v5;
  if (*((_BYTE *)&self->super.super._tlvLength + 4))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %@>"), v5, v7);

  return v8;
}

+ (unsigned)tlvType
{
  return -2001563352;
}

- (id)generateTLV
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v3 = +[UARPTLVHostPersonalizationRequiredOS tlvType](UARPTLVHostPersonalizationRequiredOS, "tlvType");
  v4 = *((unsigned __int8 *)&self->super.super._tlvLength + 4);
  v6.receiver = self;
  v6.super_class = (Class)UARPTLVHostPersonalizationRequiredOS;
  return -[UARPMetaDataTLV8OS generateTLV:tlvValue:](&v6, sel_generateTLV_tlvValue_, v3, v4);
}

- (id)tlvValue
{
  uint64_t v2;
  objc_super v4;

  v2 = *((unsigned __int8 *)&self->super.super._tlvLength + 4);
  v4.receiver = self;
  v4.super_class = (Class)UARPTLVHostPersonalizationRequiredOS;
  return -[UARPMetaDataTLV8OS tlvValue:](&v4, sel_tlvValue_, v2);
}

+ (id)metaDataTableEntry
{
  id v2;
  id v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("Host Personalization Required");
  v5[0] = CFSTR("Name");
  v5[1] = CFSTR("Value");
  v2 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", +[UARPTLVHostPersonalizationRequiredOS tlvType](UARPTLVHostPersonalizationRequiredOS, "tlvType"));
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

    objc_msgSend(v5, "setIsRequired:", v6);
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
    objc_msgSend(v5, "setIsRequired:", *(unsigned __int8 *)a4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (unsigned)isRequired
{
  return *((_BYTE *)&self->super.super._tlvLength + 4);
}

@end
