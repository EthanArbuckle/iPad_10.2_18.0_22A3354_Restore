@implementation UARPTLVPersonalizationPayloadTagOS

- (UARPTLVPersonalizationPayloadTagOS)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationPayloadTagOS;
  return -[UARPMetaDataTLVOS init](&v3, sel_init);
}

- (void)setTag:(id)a3
{
  id v4;
  UARPTLVPersonalizationPayloadTagOS *v5;
  uint64_t v6;
  UARPAssetTagOS *tag;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = objc_msgSend(v4, "copy");
  tag = v5->_tag;
  v5->_tag = (UARPAssetTagOS *)v6;

  objc_sync_exit(v5);
}

- (id)description
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v3 = +[UARPTLVPersonalizationPayloadTagOS metaDataTableEntry](UARPTLVPersonalizationPayloadTagOS, "metaDataTableEntry");
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = (id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Name"));
  v6 = (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %@>"), v5, self->_tag);

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563391;
}

- (id)generateTLV
{
  id v3;
  id v4;
  id v5;
  int v7;
  int v8;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  v8 = uarpHtonl(+[UARPTLVPersonalizationPayloadTagOS tlvType](UARPTLVPersonalizationPayloadTagOS, "tlvType"));
  objc_msgSend(v3, "appendBytes:length:", &v8, 4);
  v7 = uarpHtonl(4u);
  objc_msgSend(v3, "appendBytes:length:", &v7, 4);
  v4 = -[UARPTLVPersonalizationPayloadTagOS tlvValue](self, "tlvValue");
  objc_msgSend(v3, "appendData:", v4);

  v5 = (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v3);
  return v5;
}

- (id)tlvValue
{
  unsigned int v3;

  v3 = -[UARPAssetTagOS tag](self->_tag, "tag");
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &v3, 4);
}

+ (id)metaDataTableEntry
{
  id v2;
  id v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("Personalization Payload Tag");
  v5[0] = CFSTR("Name");
  v5[1] = CFSTR("Value");
  v2 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", +[UARPTLVPersonalizationPayloadTagOS tlvType](UARPTLVPersonalizationPayloadTagOS, "tlvType"));
  v6[1] = v2;
  v3 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);

  return v3;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  id v3;
  id v4;
  char *v5;
  void *v6;
  UARPAssetTagOS *v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    if (objc_msgSend(v4, "length") == 4)
    {
      v5 = (char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
      v6 = (void *)objc_opt_new();
      v7 = -[UARPAssetTagOS initWithChar1:char2:char3:char4:]([UARPAssetTagOS alloc], "initWithChar1:char2:char3:char4:", *v5, v5[1], v5[2], v5[3]);
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
  UARPAssetTagOS *v6;

  if (a3 == 4)
  {
    v5 = (void *)objc_opt_new();
    v6 = -[UARPAssetTagOS initWithChar1:char2:char3:char4:]([UARPAssetTagOS alloc], "initWithChar1:char2:char3:char4:", *(char *)a4, *((char *)a4 + 1), *((char *)a4 + 2), *((char *)a4 + 3));
    objc_msgSend(v5, "setTag:", v6);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (UARPAssetTagOS)tag
{
  return (UARPAssetTagOS *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
}

@end
