@implementation UARPMetaDataTLV64

- (UARPMetaDataTLV64)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPMetaDataTLV64;
  return -[UARPMetaDataTLV init](&v3, sel_init);
}

- (id)generateTLV:(unsigned int)a3 tlvValue:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  int v11;
  int v12;

  v7 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  v12 = uarpHtonl(a3);
  objc_msgSend(v7, "appendBytes:length:", &v12, 4);
  v11 = uarpHtonl(8u);
  objc_msgSend(v7, "appendBytes:length:", &v11, 4);
  -[UARPMetaDataTLV64 tlvValue:](self, "tlvValue:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendData:", v8);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)tlvValue:(unint64_t)a3
{
  unint64_t v4;

  v4 = uarpHtonll(a3);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &v4, 8);
}

@end
