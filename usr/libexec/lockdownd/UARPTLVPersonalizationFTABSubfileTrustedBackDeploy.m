@implementation UARPTLVPersonalizationFTABSubfileTrustedBackDeploy

- (UARPTLVPersonalizationFTABSubfileTrustedBackDeploy)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationFTABSubfileTrustedBackDeploy;
  return -[UARPMetaDataTLV16BackDeploy init](&v3, "init");
}

- (void)setTrusted:(unsigned __int16)a3
{
  UARPTLVPersonalizationFTABSubfileTrustedBackDeploy *v4;

  v4 = self;
  objc_sync_enter(v4);
  *((_WORD *)&v4->super.super._tlvLength + 2) = a3;
  objc_sync_exit(v4);

}

- (id)description
{
  id v3;
  id v4;
  NSString *v5;

  v3 = +[UARPTLVPersonalizationFTABSubfileTrustedBackDeploy metaDataTableEntry](UARPTLVPersonalizationFTABSubfileTrustedBackDeploy, "metaDataTableEntry");
  v4 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Name"));
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %u>"), v4, *((unsigned __int16 *)&self->super.super._tlvLength + 2));

  return v5;
}

+ (unsigned)tlvType
{
  return -2001563369;
}

- (id)generateTLV
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v3 = +[UARPTLVPersonalizationFTABSubfileTrustedBackDeploy tlvType](UARPTLVPersonalizationFTABSubfileTrustedBackDeploy, "tlvType");
  v4 = *((unsigned __int16 *)&self->super.super._tlvLength + 2);
  v6.receiver = self;
  v6.super_class = (Class)UARPTLVPersonalizationFTABSubfileTrustedBackDeploy;
  return -[UARPMetaDataTLV16BackDeploy generateTLV:tlvValue:](&v6, "generateTLV:tlvValue:", v3, v4);
}

- (id)tlvValue
{
  uint64_t v2;
  objc_super v4;

  v2 = *((unsigned __int16 *)&self->super.super._tlvLength + 2);
  v4.receiver = self;
  v4.super_class = (Class)UARPTLVPersonalizationFTABSubfileTrustedBackDeploy;
  return -[UARPMetaDataTLV16BackDeploy tlvValue:](&v4, "tlvValue:", v2);
}

+ (id)metaDataTableEntry
{
  NSNumber *v2;
  NSDictionary *v3;
  _QWORD v5[2];
  _QWORD v6[2];

  v6[0] = CFSTR("Personalization FTAB Payload Trusted");
  v5[0] = CFSTR("Name");
  v5[1] = CFSTR("Value");
  v2 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", +[UARPTLVPersonalizationFTABSubfileTrustedBackDeploy tlvType](UARPTLVPersonalizationFTABSubfileTrustedBackDeploy, "tlvType"));
  v6[1] = v2;
  v3 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 2);

  return v3;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  UARPTLVPersonalizationFTABSubfileTrustedBackDeploy *v6;
  id v7;

  v3 = a3;
  v4 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = v3;
    v6 = objc_opt_new(UARPTLVPersonalizationFTABSubfileTrustedBackDeploy);
    v7 = objc_msgSend(v5, "unsignedShortValue");

    -[UARPTLVPersonalizationFTABSubfileTrustedBackDeploy setTrusted:](v6, "setTrusted:", v7);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  UARPTLVPersonalizationFTABSubfileTrustedBackDeploy *v5;

  if (a3 == 2)
  {
    v5 = objc_opt_new(UARPTLVPersonalizationFTABSubfileTrustedBackDeploy);
    -[UARPTLVPersonalizationFTABSubfileTrustedBackDeploy setTrusted:](v5, "setTrusted:", uarpNtohs(*(unsigned __int16 *)a4));
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (unsigned)trusted
{
  return *((_WORD *)&self->super.super._tlvLength + 2);
}

@end
