@implementation UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy

- (UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy;
  return -[UARPMetaDataTLV8BackDeploy init](&v3, "init");
}

- (void)setTicketNeedsLogicalUnitNumber:(unsigned __int8)a3
{
  UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy *v4;

  v4 = self;
  objc_sync_enter(v4);
  *((_BYTE *)&v4->super.super._tlvLength + 4) = a3;
  objc_sync_exit(v4);

}

- (id)description
{
  id v3;
  id v4;
  void *v5;
  const __CFString *v6;
  NSString *v7;

  v3 = +[UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy metaDataTableEntry](UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy, "metaDataTableEntry");
  v4 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Name"));
  v5 = v4;
  if (*((_BYTE *)&self->super.super._tlvLength + 4))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %@>"), v4, v6);

  return v7;
}

+ (unsigned)tlvType
{
  return -2001563354;
}

- (id)generateTLV
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v3 = +[UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy tlvType](UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy, "tlvType");
  v4 = *((unsigned __int8 *)&self->super.super._tlvLength + 4);
  v6.receiver = self;
  v6.super_class = (Class)UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy;
  return -[UARPMetaDataTLV8BackDeploy generateTLV:tlvValue:](&v6, "generateTLV:tlvValue:", v3, v4);
}

- (id)tlvValue
{
  uint64_t v2;
  objc_super v4;

  v2 = *((unsigned __int8 *)&self->super.super._tlvLength + 4);
  v4.receiver = self;
  v4.super_class = (Class)UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy;
  return -[UARPMetaDataTLV8BackDeploy tlvValue:](&v4, "tlvValue:", v2);
}

+ (id)metaDataTableEntry
{
  NSNumber *v2;
  NSDictionary *v3;
  _QWORD v5[2];
  _QWORD v6[2];

  v6[0] = CFSTR("Personalization Ticket Needs Logical Unit Number");
  v5[0] = CFSTR("Name");
  v5[1] = CFSTR("Value");
  v2 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", +[UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy tlvType](UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy, "tlvType"));
  v6[1] = v2;
  v3 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 2);

  return v3;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy *v6;
  id v7;

  v3 = a3;
  v4 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = v3;
    v6 = objc_opt_new(UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy);
    v7 = objc_msgSend(v5, "unsignedCharValue");

    -[UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy setTicketNeedsLogicalUnitNumber:](v6, "setTicketNeedsLogicalUnitNumber:", v7);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy *v5;

  if (a3 == 1)
  {
    v5 = objc_opt_new(UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy);
    -[UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy setTicketNeedsLogicalUnitNumber:](v5, "setTicketNeedsLogicalUnitNumber:", *(unsigned __int8 *)a4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (unsigned)ticketNeedsLogicalUnitNumber
{
  return *((_BYTE *)&self->super.super._tlvLength + 4);
}

@end
