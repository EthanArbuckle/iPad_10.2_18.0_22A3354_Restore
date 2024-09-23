@implementation UARPMetaDataTLV8BackDeploy

- (UARPMetaDataTLV8BackDeploy)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPMetaDataTLV8BackDeploy;
  return -[UARPMetaDataTLVBackDeploy init](&v3, "init");
}

- (id)generateTLV:(unsigned int)a3 tlvValue:(unsigned __int8)a4
{
  uint64_t v4;
  id v7;
  id v8;
  NSData *v9;
  int v11;
  int v12;

  v4 = a4;
  v7 = objc_alloc_init((Class)NSMutableData);
  v12 = uarpHtonl(a3);
  objc_msgSend(v7, "appendBytes:length:", &v12, 4);
  v11 = uarpHtonl(1u);
  objc_msgSend(v7, "appendBytes:length:", &v11, 4);
  v8 = -[UARPMetaDataTLV8BackDeploy tlvValue:](self, "tlvValue:", v4);
  objc_msgSend(v7, "appendData:", v8);
  v9 = +[NSData dataWithData:](NSData, "dataWithData:", v7);

  return v9;
}

- (id)tlvValue:(unsigned __int8)a3
{
  unsigned __int8 v4;

  v4 = a3;
  return objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v4, 1);
}

@end
