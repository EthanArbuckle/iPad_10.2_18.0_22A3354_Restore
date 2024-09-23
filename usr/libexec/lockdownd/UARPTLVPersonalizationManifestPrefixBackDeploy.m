@implementation UARPTLVPersonalizationManifestPrefixBackDeploy

- (UARPTLVPersonalizationManifestPrefixBackDeploy)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationManifestPrefixBackDeploy;
  return -[UARPMetaDataTLVStringBackDeploy init](&v3, "init");
}

- (void)setTicketPrefix:(id)a3
{
  id v4;
  UARPTLVPersonalizationManifestPrefixBackDeploy *v5;
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

  v3 = +[UARPTLVPersonalizationManifestPrefixBackDeploy metaDataTableEntry](UARPTLVPersonalizationManifestPrefixBackDeploy, "metaDataTableEntry");
  v4 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Name"));
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %@>"), v4, *(_QWORD *)(&self->super.super._tlvLength + 1));

  return v5;
}

+ (unsigned)tlvType
{
  return -2001563389;
}

- (id)generateTLV
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v3 = +[UARPTLVPersonalizationManifestPrefixBackDeploy tlvType](UARPTLVPersonalizationManifestPrefixBackDeploy, "tlvType");
  v4 = *(_QWORD *)(&self->super.super._tlvLength + 1);
  v6.receiver = self;
  v6.super_class = (Class)UARPTLVPersonalizationManifestPrefixBackDeploy;
  return -[UARPMetaDataTLVStringBackDeploy generateTLV:tlvValue:](&v6, "generateTLV:tlvValue:", v3, v4);
}

- (id)tlvValue
{
  uint64_t v2;
  objc_super v4;

  v2 = *(_QWORD *)(&self->super.super._tlvLength + 1);
  v4.receiver = self;
  v4.super_class = (Class)UARPTLVPersonalizationManifestPrefixBackDeploy;
  return -[UARPMetaDataTLVStringBackDeploy tlvValue:](&v4, "tlvValue:", v2);
}

+ (id)metaDataTableEntry
{
  NSNumber *v2;
  NSDictionary *v3;
  _QWORD v5[2];
  _QWORD v6[2];

  v6[0] = CFSTR("Personalization Manifest Prefix");
  v5[0] = CFSTR("Name");
  v5[1] = CFSTR("Value");
  v2 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", +[UARPTLVPersonalizationManifestPrefixBackDeploy tlvType](UARPTLVPersonalizationManifestPrefixBackDeploy, "tlvType"));
  v6[1] = v2;
  v3 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 2);

  return v3;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  id v3;
  uint64_t v4;
  UARPTLVPersonalizationManifestPrefixBackDeploy *v5;

  v3 = a3;
  v4 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = objc_opt_new(UARPTLVPersonalizationManifestPrefixBackDeploy);
    -[UARPTLVPersonalizationManifestPrefixBackDeploy setTicketPrefix:](v5, "setTicketPrefix:", v3);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  UARPTLVPersonalizationManifestPrefixBackDeploy *v6;
  id v7;

  v6 = objc_opt_new(UARPTLVPersonalizationManifestPrefixBackDeploy);
  v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", a4, a3, 4);
  -[UARPTLVPersonalizationManifestPrefixBackDeploy setTicketPrefix:](v6, "setTicketPrefix:", v7);

  return v6;
}

- (NSString)ticketPrefix
{
  return (NSString *)objc_getProperty(self, a2, 28, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)(&self->super.super._tlvLength + 1), 0);
}

@end
