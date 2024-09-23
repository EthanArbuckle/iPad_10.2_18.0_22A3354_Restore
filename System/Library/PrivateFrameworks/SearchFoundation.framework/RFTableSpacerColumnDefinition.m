@implementation RFTableSpacerColumnDefinition

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RFTableSpacerColumnDefinition)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFTableSpacerColumnDefinition *v6;
  RFTableSpacerColumnDefinition *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFTableSpacerColumnDefinition initWithData:]([_SFPBRFTableSpacerColumnDefinition alloc], "initWithData:", v5);
  v7 = -[RFTableSpacerColumnDefinition initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFTableSpacerColumnDefinition *v6;

  v4 = a3;
  v6 = -[_SFPBRFTableSpacerColumnDefinition initWithFacade:]([_SFPBRFTableSpacerColumnDefinition alloc], "initWithFacade:", self);
  -[_SFPBRFTableSpacerColumnDefinition data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFTableSpacerColumnDefinition *v2;
  void *v3;

  v2 = -[_SFPBRFTableSpacerColumnDefinition initWithFacade:]([_SFPBRFTableSpacerColumnDefinition alloc], "initWithFacade:", self);
  -[_SFPBRFTableSpacerColumnDefinition dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFTableSpacerColumnDefinition *v2;
  void *v3;

  v2 = -[_SFPBRFTableSpacerColumnDefinition initWithFacade:]([_SFPBRFTableSpacerColumnDefinition alloc], "initWithFacade:", self);
  -[_SFPBRFTableSpacerColumnDefinition jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char v4;

  if (self == a3)
    return 1;
  v3 = a3;
  v4 = objc_msgSend(v3, "isMemberOfClass:", objc_opt_class());

  return v4;
}

- (unint64_t)hash
{
  return 0;
}

- (RFTableSpacerColumnDefinition)initWithProtobuf:(id)a3
{
  RFTableSpacerColumnDefinition *v3;
  RFTableSpacerColumnDefinition *v4;
  RFTableSpacerColumnDefinition *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RFTableSpacerColumnDefinition;
  v3 = -[RFTableSpacerColumnDefinition init](&v7, sel_init, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

@end
