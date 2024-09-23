@implementation RFTextEncapsulation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setStyle:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_style = a3;
}

- (BOOL)hasStyle
{
  return *(_BYTE *)&self->_has & 1;
}

- (RFTextEncapsulation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFTextEncapsulation *v6;
  RFTextEncapsulation *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFTextEncapsulation initWithData:]([_SFPBRFTextEncapsulation alloc], "initWithData:", v5);
  v7 = -[RFTextEncapsulation initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFTextEncapsulation *v6;

  v4 = a3;
  v6 = -[_SFPBRFTextEncapsulation initWithFacade:]([_SFPBRFTextEncapsulation alloc], "initWithFacade:", self);
  -[_SFPBRFTextEncapsulation data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFTextEncapsulation *v2;
  void *v3;

  v2 = -[_SFPBRFTextEncapsulation initWithFacade:]([_SFPBRFTextEncapsulation alloc], "initWithFacade:", self);
  -[_SFPBRFTextEncapsulation dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFTextEncapsulation *v2;
  void *v3;

  v2 = -[_SFPBRFTextEncapsulation initWithFacade:]([_SFPBRFTextEncapsulation alloc], "initWithFacade:", self);
  -[_SFPBRFTextEncapsulation jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setStyle:", -[RFTextEncapsulation style](self, "style"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RFTextEncapsulation *v4;
  RFTextEncapsulation *v5;
  int v6;
  int v7;
  BOOL v8;

  v4 = (RFTextEncapsulation *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (-[RFTextEncapsulation isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[RFTextEncapsulation style](self, "style");
    v7 = -[RFTextEncapsulation style](v5, "style");

    v8 = v6 == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return -[RFTextEncapsulation style](self, "style");
}

- (int)style
{
  return self->_style;
}

- (RFTextEncapsulation)initWithProtobuf:(id)a3
{
  id v4;
  RFTextEncapsulation *v5;
  RFTextEncapsulation *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RFTextEncapsulation;
  v5 = -[RFTextEncapsulation init](&v8, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "style"))
      -[RFTextEncapsulation setStyle:](v5, "setStyle:", objc_msgSend(v4, "style"));
    v6 = v5;
  }

  return v5;
}

@end
