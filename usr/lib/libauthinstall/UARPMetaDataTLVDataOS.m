@implementation UARPMetaDataTLVDataOS

- (UARPMetaDataTLVDataOS)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPMetaDataTLVDataOS;
  return -[UARPMetaDataTLVOS init](&v3, sel_init);
}

- (id)generateTLV:(unsigned int)a3 tlvValue:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  int v10;
  int v11;

  v5 = (objc_class *)MEMORY[0x24BDBCEC8];
  v6 = a4;
  v7 = objc_alloc_init(v5);
  v11 = uarpHtonl(a3);
  objc_msgSend(v7, "appendBytes:length:", &v11, 4);
  v10 = uarpHtonl(objc_msgSend(v6, "length"));
  objc_msgSend(v7, "appendBytes:length:", &v10, 4);
  objc_msgSend(v7, "appendData:", v6);

  v8 = (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v7);
  return v8;
}

@end
