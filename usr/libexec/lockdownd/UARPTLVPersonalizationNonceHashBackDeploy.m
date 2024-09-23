@implementation UARPTLVPersonalizationNonceHashBackDeploy

- (UARPTLVPersonalizationNonceHashBackDeploy)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationNonceHashBackDeploy;
  return -[UARPMetaDataTLVDataBackDeploy init](&v3, "init");
}

- (void)setNonceHash:(id)a3
{
  id v4;
  UARPTLVPersonalizationNonceHashBackDeploy *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = objc_msgSend(v4, "copy");
  v7 = *(void **)(&v5->super.super._tlvLength + 1);
  *(_QWORD *)(&v5->super.super._tlvLength + 1) = v6;

  objc_sync_exit(v5);
}

- (id)description
{
  id v3;
  id v4;
  NSString *v5;

  v3 = +[UARPTLVPersonalizationNonceHashBackDeploy metaDataTableEntry](UARPTLVPersonalizationNonceHashBackDeploy, "metaDataTableEntry");
  v4 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Name"));
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %@>"), v4, *(_QWORD *)(&self->super.super._tlvLength + 1));

  return v5;
}

+ (unsigned)tlvType
{
  return -2001563384;
}

- (id)generateTLV
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v3 = +[UARPTLVPersonalizationNonceHashBackDeploy tlvType](UARPTLVPersonalizationNonceHashBackDeploy, "tlvType");
  v4 = *(_QWORD *)(&self->super.super._tlvLength + 1);
  v6.receiver = self;
  v6.super_class = (Class)UARPTLVPersonalizationNonceHashBackDeploy;
  return -[UARPMetaDataTLVDataBackDeploy generateTLV:tlvValue:](&v6, "generateTLV:tlvValue:", v3, v4);
}

- (id)tlvValue
{
  return *(id *)(&self->super.super._tlvLength + 1);
}

+ (id)metaDataTableEntry
{
  NSNumber *v2;
  NSDictionary *v3;
  _QWORD v5[2];
  _QWORD v6[2];

  v6[0] = CFSTR("Personalization Nonce Hash");
  v5[0] = CFSTR("Name");
  v5[1] = CFSTR("Value");
  v2 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", +[UARPTLVPersonalizationNonceHashBackDeploy tlvType](UARPTLVPersonalizationNonceHashBackDeploy, "tlvType"));
  v6[1] = v2;
  v3 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 2);

  return v3;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  id v3;
  uint64_t v4;
  UARPTLVPersonalizationNonceHashBackDeploy *v5;

  v3 = a3;
  v4 = objc_opt_class(NSData);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = objc_opt_new(UARPTLVPersonalizationNonceHashBackDeploy);
    -[UARPTLVPersonalizationNonceHashBackDeploy setNonceHash:](v5, "setNonceHash:", v3);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  UARPTLVPersonalizationNonceHashBackDeploy *v6;
  NSData *v7;

  v6 = objc_opt_new(UARPTLVPersonalizationNonceHashBackDeploy);
  v7 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a4, a3);
  -[UARPTLVPersonalizationNonceHashBackDeploy setNonceHash:](v6, "setNonceHash:", v7);

  return v6;
}

- (NSData)nonceHash
{
  return (NSData *)objc_getProperty(self, a2, 28, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)(&self->super.super._tlvLength + 1), 0);
}

@end
