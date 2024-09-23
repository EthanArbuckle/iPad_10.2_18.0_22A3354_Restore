@implementation SFSafariAttributes

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setHideReason:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_hideReason = a3;
}

- (BOOL)hasHideReason
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFSafariAttributes)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBSafariAttributes *v6;
  SFSafariAttributes *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBSafariAttributes initWithData:]([_SFPBSafariAttributes alloc], "initWithData:", v5);
  v7 = -[SFSafariAttributes initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBSafariAttributes *v6;

  v4 = a3;
  v6 = -[_SFPBSafariAttributes initWithFacade:]([_SFPBSafariAttributes alloc], "initWithFacade:", self);
  -[_SFPBSafariAttributes data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBSafariAttributes *v2;
  void *v3;

  v2 = -[_SFPBSafariAttributes initWithFacade:]([_SFPBSafariAttributes alloc], "initWithFacade:", self);
  -[_SFPBSafariAttributes dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBSafariAttributes *v2;
  void *v3;

  v2 = -[_SFPBSafariAttributes initWithFacade:]([_SFPBSafariAttributes alloc], "initWithFacade:", self);
  -[_SFPBSafariAttributes jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setHideReason:", -[SFSafariAttributes hideReason](self, "hideReason"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFSafariAttributes *v4;
  SFSafariAttributes *v5;
  int v6;
  int v7;
  BOOL v8;

  v4 = (SFSafariAttributes *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (-[SFSafariAttributes isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[SFSafariAttributes hideReason](self, "hideReason");
    v7 = -[SFSafariAttributes hideReason](v5, "hideReason");

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
  return -[SFSafariAttributes hideReason](self, "hideReason");
}

- (int)hideReason
{
  return self->_hideReason;
}

- (SFSafariAttributes)initWithProtobuf:(id)a3
{
  id v4;
  SFSafariAttributes *v5;
  SFSafariAttributes *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFSafariAttributes;
  v5 = -[SFSafariAttributes init](&v8, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "hideReason"))
      -[SFSafariAttributes setHideReason:](v5, "setHideReason:", objc_msgSend(v4, "hideReason"));
    v6 = v5;
  }

  return v5;
}

@end
