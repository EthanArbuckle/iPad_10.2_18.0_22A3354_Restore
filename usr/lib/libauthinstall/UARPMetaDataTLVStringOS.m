@implementation UARPMetaDataTLVStringOS

- (UARPMetaDataTLVStringOS)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPMetaDataTLVStringOS;
  return -[UARPMetaDataTLVOS init](&v3, sel_init);
}

- (id)generateTLV:(unsigned int)a3 tlvValue:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  int v12;
  int v13;

  v6 = (objc_class *)MEMORY[0x24BDBCEC8];
  v7 = a4;
  v8 = objc_alloc_init(v6);
  v13 = uarpHtonl(a3);
  objc_msgSend(v8, "appendBytes:length:", &v13, 4);
  v12 = uarpHtonl(objc_msgSend(v7, "length"));
  objc_msgSend(v8, "appendBytes:length:", &v12, 4);
  v9 = -[UARPMetaDataTLVStringOS tlvValue:](self, "tlvValue:", v7);

  objc_msgSend(v8, "appendData:", v9);
  v10 = (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v8);

  return v10;
}

- (id)tlvValue:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (objc_class *)MEMORY[0x24BDBCE50];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "UTF8String");
  v8 = objc_msgSend(v6, "length");

  return (id)objc_msgSend(v5, "initWithBytes:length:", v7, v8);
}

@end
