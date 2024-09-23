@implementation UARPTLVPersonalizationSoCLiveNonce

- (UARPTLVPersonalizationSoCLiveNonce)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationSoCLiveNonce;
  return -[UARPMetaDataTLV8 init](&v3, sel_init);
}

- (void)setLiveNonce:(unsigned __int8)a3
{
  UARPTLVPersonalizationSoCLiveNonce *obj;

  obj = self;
  objc_sync_enter(obj);
  *((_BYTE *)&obj->super.super._tlvLength + 4) = a3;
  objc_sync_exit(obj);

}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  +[UARPTLVPersonalizationSoCLiveNonce metaDataTableEntry](UARPTLVPersonalizationSoCLiveNonce, "metaDataTableEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Name"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (*((_BYTE *)&self->super.super._tlvLength + 4))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %@>"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (unsigned)tlvType
{
  return -2001563368;
}

- (id)generateTLV
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v3 = +[UARPTLVPersonalizationSoCLiveNonce tlvType](UARPTLVPersonalizationSoCLiveNonce, "tlvType");
  v4 = *((unsigned __int8 *)&self->super.super._tlvLength + 4);
  v6.receiver = self;
  v6.super_class = (Class)UARPTLVPersonalizationSoCLiveNonce;
  -[UARPMetaDataTLV8 generateTLV:tlvValue:](&v6, sel_generateTLV_tlvValue_, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tlvValue
{
  uint64_t v2;
  objc_super v4;

  v2 = *((unsigned __int8 *)&self->super.super._tlvLength + 4);
  v4.receiver = self;
  v4.super_class = (Class)UARPTLVPersonalizationSoCLiveNonce;
  -[UARPMetaDataTLV8 tlvValue:](&v4, sel_tlvValue_, v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)metaDataTableEntry
{
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("Personalization SoC Live Nonce");
  v5[0] = CFSTR("Name");
  v5[1] = CFSTR("Value");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", +[UARPTLVPersonalizationSoCLiveNonce tlvType](UARPTLVPersonalizationSoCLiveNonce, "tlvType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

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

    objc_msgSend(v5, "setLiveNonce:", v6);
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
    objc_msgSend(v5, "setLiveNonce:", *(unsigned __int8 *)a4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (unsigned)liveNonce
{
  return *((_BYTE *)&self->super.super._tlvLength + 4);
}

@end
