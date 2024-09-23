@implementation UARPMetaDataTLVStringBackDeploy

- (UARPMetaDataTLVStringBackDeploy)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPMetaDataTLVStringBackDeploy;
  return -[UARPMetaDataTLVBackDeploy init](&v3, "init");
}

- (id)generateTLV:(unsigned int)a3 tlvValue:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSData *v9;
  int v11;
  int v12;

  v6 = a4;
  v7 = objc_alloc_init((Class)NSMutableData);
  v12 = uarpHtonl(a3);
  objc_msgSend(v7, "appendBytes:length:", &v12, 4);
  v11 = uarpHtonl(objc_msgSend(v6, "length"));
  objc_msgSend(v7, "appendBytes:length:", &v11, 4);
  v8 = -[UARPMetaDataTLVStringBackDeploy tlvValue:](self, "tlvValue:", v6);

  objc_msgSend(v7, "appendData:", v8);
  v9 = +[NSData dataWithData:](NSData, "dataWithData:", v7);

  return v9;
}

- (id)tlvValue:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;

  v3 = a3;
  v4 = objc_alloc((Class)NSData);
  v5 = objc_retainAutorelease(v3);
  v6 = objc_msgSend(v5, "UTF8String");
  v7 = objc_msgSend(v5, "length");

  return objc_msgSend(v4, "initWithBytes:length:", v6, v7);
}

@end
