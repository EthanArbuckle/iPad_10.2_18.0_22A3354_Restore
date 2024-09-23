@implementation UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberBackDeploy

- (UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberBackDeploy)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberBackDeploy;
  return -[UARPMetaDataTLV8BackDeploy init](&v3, "init");
}

- (void)setPrefixNeedsLogicalUnitNumber:(unsigned __int8)a3
{
  UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberBackDeploy *v4;

  v4 = self;
  objc_sync_enter(v4);
  *((_BYTE *)&v4->super.super._tlvLength + 4) = a3;
  objc_sync_exit(v4);

}

+ (unsigned)tlvType
{
  return -2001563359;
}

- (id)generateTLV
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v3 = +[UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberBackDeploy tlvType](UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberBackDeploy, "tlvType");
  v4 = *((unsigned __int8 *)&self->super.super._tlvLength + 4);
  v6.receiver = self;
  v6.super_class = (Class)UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberBackDeploy;
  return -[UARPMetaDataTLV8BackDeploy generateTLV:tlvValue:](&v6, "generateTLV:tlvValue:", v3, v4);
}

- (id)tlvValue
{
  uint64_t v2;
  objc_super v4;

  v2 = *((unsigned __int8 *)&self->super.super._tlvLength + 4);
  v4.receiver = self;
  v4.super_class = (Class)UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberBackDeploy;
  return -[UARPMetaDataTLV8BackDeploy tlvValue:](&v4, "tlvValue:", v2);
}

+ (id)metaDataTableEntry
{
  NSNumber *v2;
  NSDictionary *v3;
  _QWORD v5[2];
  _QWORD v6[2];

  v6[0] = CFSTR("Personalization Prefix Needs Logical Unit Number");
  v5[0] = CFSTR("Name");
  v5[1] = CFSTR("Value");
  v2 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", +[UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberBackDeploy tlvType](UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberBackDeploy, "tlvType"));
  v6[1] = v2;
  v3 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 2);

  return v3;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberBackDeploy *v6;
  id v7;

  v3 = a3;
  v4 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = v3;
    v6 = objc_opt_new(UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberBackDeploy);
    v7 = objc_msgSend(v5, "unsignedCharValue");

    -[UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberBackDeploy setPrefixNeedsLogicalUnitNumber:](v6, "setPrefixNeedsLogicalUnitNumber:", v7);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberBackDeploy *v5;

  if (a3 == 1)
  {
    v5 = objc_opt_new(UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberBackDeploy);
    -[UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberBackDeploy setPrefixNeedsLogicalUnitNumber:](v5, "setPrefixNeedsLogicalUnitNumber:", *(unsigned __int8 *)a4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (unsigned)prefixNeedsLogicalUnitNumber
{
  return *((_BYTE *)&self->super.super._tlvLength + 4);
}

@end
