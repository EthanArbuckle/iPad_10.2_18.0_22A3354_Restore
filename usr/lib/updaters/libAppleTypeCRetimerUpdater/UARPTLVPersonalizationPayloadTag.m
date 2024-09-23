@implementation UARPTLVPersonalizationPayloadTag

- (UARPTLVPersonalizationPayloadTag)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationPayloadTag;
  return -[UARPMetaDataTLV init](&v3, sel_init);
}

- (void)setTag:(id)a3
{
  UARPTLVPersonalizationPayloadTag *v4;
  uint64_t v5;
  UARPAssetTag *tag;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  tag = v4->_tag;
  v4->_tag = (UARPAssetTag *)v5;

  objc_sync_exit(v4);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[UARPTLVPersonalizationPayloadTag metaDataTableEntry](UARPTLVPersonalizationPayloadTag, "metaDataTableEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %@>"), v5, self->_tag);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563391;
}

- (id)generateTLV
{
  id v3;
  void *v4;
  void *v5;
  int v7;
  int v8;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  v8 = uarpHtonl(+[UARPTLVPersonalizationPayloadTag tlvType](UARPTLVPersonalizationPayloadTag, "tlvType"));
  objc_msgSend(v3, "appendBytes:length:", &v8, 4);
  v7 = uarpHtonl(4u);
  objc_msgSend(v3, "appendBytes:length:", &v7, 4);
  -[UARPTLVPersonalizationPayloadTag tlvValue](self, "tlvValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendData:", v4);

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tlvValue
{
  unsigned int v3;

  v3 = -[UARPAssetTag tag](self->_tag, "tag");
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &v3, 4);
}

+ (id)metaDataTableEntry
{
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("Personalization Payload Tag");
  v5[0] = CFSTR("Name");
  v5[1] = CFSTR("Value");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", +[UARPTLVPersonalizationPayloadTag tlvType](UARPTLVPersonalizationPayloadTag, "tlvType"));
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
  char *v5;
  void *v6;
  UARPAssetTag *v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    if (objc_msgSend(v4, "length") == 4)
    {
      v5 = (char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
      v6 = (void *)objc_opt_new();
      v7 = -[UARPAssetTag initWithChar1:char2:char3:char4:]([UARPAssetTag alloc], "initWithChar1:char2:char3:char4:", *v5, v5[1], v5[2], v5[3]);
      objc_msgSend(v6, "setTag:", v7);

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  void *v5;
  UARPAssetTag *v6;

  if (a3 == 4)
  {
    v5 = (void *)objc_opt_new();
    v6 = -[UARPAssetTag initWithChar1:char2:char3:char4:]([UARPAssetTag alloc], "initWithChar1:char2:char3:char4:", *(char *)a4, *((char *)a4 + 1), *((char *)a4 + 2), *((char *)a4 + 3));
    objc_msgSend(v5, "setTag:", v6);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (UARPAssetTag)tag
{
  return (UARPAssetTag *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
}

@end
