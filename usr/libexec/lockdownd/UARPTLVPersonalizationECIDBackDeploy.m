@implementation UARPTLVPersonalizationECIDBackDeploy

- (UARPTLVPersonalizationECIDBackDeploy)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationECIDBackDeploy;
  return -[UARPMetaDataTLV64BackDeploy init](&v3, "init");
}

- (void)setEcID:(unint64_t)a3
{
  UARPTLVPersonalizationECIDBackDeploy *v4;

  v4 = self;
  objc_sync_enter(v4);
  *(_QWORD *)(&v4->super.super._tlvLength + 1) = a3;
  objc_sync_exit(v4);

}

- (id)description
{
  id v3;
  id v4;
  NSString *v5;

  v3 = +[UARPTLVPersonalizationECIDBackDeploy metaDataTableEntry](UARPTLVPersonalizationECIDBackDeploy, "metaDataTableEntry");
  v4 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Name"));
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: 0x%016llx>"), v4, *(_QWORD *)(&self->super.super._tlvLength + 1));

  return v5;
}

+ (unsigned)tlvType
{
  return -2001563386;
}

- (id)generateTLV
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v3 = +[UARPTLVPersonalizationECIDBackDeploy tlvType](UARPTLVPersonalizationECIDBackDeploy, "tlvType");
  v4 = *(_QWORD *)(&self->super.super._tlvLength + 1);
  v6.receiver = self;
  v6.super_class = (Class)UARPTLVPersonalizationECIDBackDeploy;
  return -[UARPMetaDataTLV64BackDeploy generateTLV:tlvValue:](&v6, "generateTLV:tlvValue:", v3, v4);
}

- (id)tlvValue
{
  uint64_t v2;
  objc_super v4;

  v2 = *(_QWORD *)(&self->super.super._tlvLength + 1);
  v4.receiver = self;
  v4.super_class = (Class)UARPTLVPersonalizationECIDBackDeploy;
  return -[UARPMetaDataTLV64BackDeploy tlvValue:](&v4, "tlvValue:", v2);
}

+ (id)metaDataTableEntry
{
  NSNumber *v2;
  NSDictionary *v3;
  _QWORD v5[2];
  _QWORD v6[2];

  v6[0] = CFSTR("Personalization ECID");
  v5[0] = CFSTR("Name");
  v5[1] = CFSTR("Value");
  v2 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", +[UARPTLVPersonalizationECIDBackDeploy tlvType](UARPTLVPersonalizationECIDBackDeploy, "tlvType"));
  v6[1] = v2;
  v3 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 2);

  return v3;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  UARPTLVPersonalizationECIDBackDeploy *v6;
  id v7;

  v3 = a3;
  v4 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = v3;
    v6 = objc_opt_new(UARPTLVPersonalizationECIDBackDeploy);
    v7 = objc_msgSend(v5, "unsignedLongLongValue");

    -[UARPTLVPersonalizationECIDBackDeploy setEcID:](v6, "setEcID:", v7);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  UARPTLVPersonalizationECIDBackDeploy *v5;

  if (a3 == 8)
  {
    v5 = objc_opt_new(UARPTLVPersonalizationECIDBackDeploy);
    -[UARPTLVPersonalizationECIDBackDeploy setEcID:](v5, "setEcID:", uarpNtohll(*(_QWORD *)a4));
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (unint64_t)ecID
{
  return *(_QWORD *)(&self->super.super._tlvLength + 1);
}

@end
