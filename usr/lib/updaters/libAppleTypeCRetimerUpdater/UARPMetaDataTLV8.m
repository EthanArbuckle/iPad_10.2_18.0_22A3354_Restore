@implementation UARPMetaDataTLV8

- (UARPMetaDataTLV8)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPMetaDataTLV8;
  return -[UARPMetaDataTLV init](&v3, sel_init);
}

- (id)generateTLV:(unsigned int)a3 tlvValue:(unsigned __int8)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  void *v9;
  int v11;
  int v12;

  v4 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  v12 = uarpHtonl(a3);
  objc_msgSend(v7, "appendBytes:length:", &v12, 4);
  v11 = uarpHtonl(1u);
  objc_msgSend(v7, "appendBytes:length:", &v11, 4);
  -[UARPMetaDataTLV8 tlvValue:](self, "tlvValue:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendData:", v8);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)tlvValue:(unsigned __int8)a3
{
  unsigned __int8 v4;

  v4 = a3;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &v4, 1);
}

@end
