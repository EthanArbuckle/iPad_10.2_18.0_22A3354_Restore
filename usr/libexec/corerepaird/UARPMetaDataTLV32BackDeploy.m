@implementation UARPMetaDataTLV32BackDeploy

- (UARPMetaDataTLV32BackDeploy)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPMetaDataTLV32BackDeploy;
  return -[UARPMetaDataTLVBackDeploy init](&v3, "init");
}

- (id)generateTLV:(unsigned int)a3 tlvValue:(unsigned int)a4
{
  uint64_t v4;
  id v7;
  id v8;
  NSData *v9;
  int v11;
  int v12;

  v4 = *(_QWORD *)&a4;
  v7 = objc_alloc_init((Class)NSMutableData);
  v12 = uarpHtonl(a3);
  objc_msgSend(v7, "appendBytes:length:", &v12, 4);
  v11 = uarpHtonl(4u);
  objc_msgSend(v7, "appendBytes:length:", &v11, 4);
  v8 = -[UARPMetaDataTLV32BackDeploy tlvValue:](self, "tlvValue:", v4);
  objc_msgSend(v7, "appendData:", v8);
  v9 = +[NSData dataWithData:](NSData, "dataWithData:", v7);

  return v9;
}

- (id)tlvValue:(unsigned int)a3
{
  int v4;

  v4 = uarpHtonl(a3);
  return objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v4, 4);
}

@end
