@implementation UARPMetaDataTLVDataBackDeploy

- (UARPMetaDataTLVDataBackDeploy)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPMetaDataTLVDataBackDeploy;
  return -[UARPMetaDataTLVBackDeploy init](&v3, "init");
}

- (id)generateTLV:(unsigned int)a3 tlvValue:(id)a4
{
  id v5;
  id v6;
  NSData *v7;
  int v9;
  int v10;

  v5 = a4;
  v6 = objc_alloc_init((Class)NSMutableData);
  v10 = uarpHtonl(a3);
  objc_msgSend(v6, "appendBytes:length:", &v10, 4);
  v9 = uarpHtonl(objc_msgSend(v5, "length"));
  objc_msgSend(v6, "appendBytes:length:", &v9, 4);
  objc_msgSend(v6, "appendData:", v5);

  v7 = +[NSData dataWithData:](NSData, "dataWithData:", v6);
  return v7;
}

@end
