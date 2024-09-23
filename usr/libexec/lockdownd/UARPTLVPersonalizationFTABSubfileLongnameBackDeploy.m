@implementation UARPTLVPersonalizationFTABSubfileLongnameBackDeploy

- (UARPTLVPersonalizationFTABSubfileLongnameBackDeploy)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationFTABSubfileLongnameBackDeploy;
  return -[UARPMetaDataTLVStringBackDeploy init](&v3, "init");
}

- (void)setLongname:(id)a3
{
  id v4;
  UARPTLVPersonalizationFTABSubfileLongnameBackDeploy *v5;
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

  v3 = +[UARPTLVPersonalizationFTABSubfileLongnameBackDeploy metaDataTableEntry](UARPTLVPersonalizationFTABSubfileLongnameBackDeploy, "metaDataTableEntry");
  v4 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Name"));
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %@>"), v4, *(_QWORD *)(&self->super.super._tlvLength + 1));

  return v5;
}

+ (unsigned)tlvType
{
  return -2001563374;
}

- (id)generateTLV
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v3 = +[UARPTLVPersonalizationFTABSubfileLongnameBackDeploy tlvType](UARPTLVPersonalizationFTABSubfileLongnameBackDeploy, "tlvType");
  v4 = *(_QWORD *)(&self->super.super._tlvLength + 1);
  v6.receiver = self;
  v6.super_class = (Class)UARPTLVPersonalizationFTABSubfileLongnameBackDeploy;
  return -[UARPMetaDataTLVStringBackDeploy generateTLV:tlvValue:](&v6, "generateTLV:tlvValue:", v3, v4);
}

- (id)tlvValue
{
  uint64_t v2;
  objc_super v4;

  v2 = *(_QWORD *)(&self->super.super._tlvLength + 1);
  v4.receiver = self;
  v4.super_class = (Class)UARPTLVPersonalizationFTABSubfileLongnameBackDeploy;
  return -[UARPMetaDataTLVStringBackDeploy tlvValue:](&v4, "tlvValue:", v2);
}

+ (id)metaDataTableEntry
{
  NSNumber *v2;
  NSDictionary *v3;
  _QWORD v5[2];
  _QWORD v6[2];

  v6[0] = CFSTR("Personalization FTAB Payload Longname");
  v5[0] = CFSTR("Name");
  v5[1] = CFSTR("Value");
  v2 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", +[UARPTLVPersonalizationFTABSubfileLongnameBackDeploy tlvType](UARPTLVPersonalizationFTABSubfileLongnameBackDeploy, "tlvType"));
  v6[1] = v2;
  v3 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 2);

  return v3;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  id v3;
  uint64_t v4;
  UARPTLVPersonalizationFTABSubfileLongnameBackDeploy *v5;

  v3 = a3;
  v4 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = objc_opt_new(UARPTLVPersonalizationFTABSubfileLongnameBackDeploy);
    -[UARPTLVPersonalizationFTABSubfileLongnameBackDeploy setLongname:](v5, "setLongname:", v3);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  char *v4;
  UARPTLVPersonalizationFTABSubfileLongnameBackDeploy *v5;
  NSString *v6;

  v4 = strndup((const char *)a4, a3);
  v5 = objc_opt_new(UARPTLVPersonalizationFTABSubfileLongnameBackDeploy);
  v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v4);
  -[UARPTLVPersonalizationFTABSubfileLongnameBackDeploy setLongname:](v5, "setLongname:", v6);

  free(v4);
  return v5;
}

- (NSString)longname
{
  return (NSString *)objc_getProperty(self, a2, 28, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)(&self->super.super._tlvLength + 1), 0);
}

@end
