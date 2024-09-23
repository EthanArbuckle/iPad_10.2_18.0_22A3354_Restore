@implementation SFCalendarColor

- (SFCalendarColor)initWithCoder:(id)a3
{
  id v4;
  SFCalendarColor *v5;
  void *v6;
  _SFPBColor *v7;
  SFColor *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = -[SFCalendarColor init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBColor initWithData:]([_SFPBColor alloc], "initWithData:", v6);
  v8 = -[SFColor initWithProtobuf:]([SFColor alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFColor eventIdentifier](v8, "eventIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCalendarColor setEventIdentifier:](v5, "setEventIdentifier:", v9);

    -[SFColor redComponent](v8, "redComponent");
    -[SFColor setRedComponent:](v5, "setRedComponent:");
    -[SFColor greenComponent](v8, "greenComponent");
    -[SFColor setGreenComponent:](v5, "setGreenComponent:");
    -[SFColor blueComponent](v8, "blueComponent");
    -[SFColor setBlueComponent:](v5, "setBlueComponent:");
    -[SFColor alphaComponent](v8, "alphaComponent");
    -[SFColor setAlphaComponent:](v5, "setAlphaComponent:");
    -[SFColor setColorTintStyle:](v5, "setColorTintStyle:", -[SFColor colorTintStyle](v8, "colorTintStyle"));
    -[SFColor darkModeColor](v8, "darkModeColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFColor setDarkModeColor:](v5, "setDarkModeColor:", v10);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFCalendarColor;
  -[SFColor encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBCalendarColor *v2;
  void *v3;

  v2 = -[_SFPBCalendarColor initWithFacade:]([_SFPBCalendarColor alloc], "initWithFacade:", self);
  -[_SFPBCalendarColor dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBCalendarColor *v2;
  void *v3;

  v2 = -[_SFPBCalendarColor initWithFacade:]([_SFPBCalendarColor alloc], "initWithFacade:", self);
  -[_SFPBCalendarColor jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFCalendarColor;
  v4 = -[SFColor copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SFCalendarColor eventIdentifier](self, "eventIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setEventIdentifier:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFCalendarColor *v4;
  SFCalendarColor *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = (SFCalendarColor *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else if (-[SFCalendarColor isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
         && (v13.receiver = self,
             v13.super_class = (Class)SFCalendarColor,
             -[SFColor isEqual:](&v13, sel_isEqual_, v4)))
  {
    v5 = v4;
    -[SFCalendarColor eventIdentifier](self, "eventIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCalendarColor eventIdentifier](v5, "eventIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 == 0) == (v7 != 0))
    {
      v11 = 0;
    }
    else
    {
      -[SFCalendarColor eventIdentifier](self, "eventIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[SFCalendarColor eventIdentifier](self, "eventIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCalendarColor eventIdentifier](v5, "eventIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 1;
      }

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFCalendarColor;
  v3 = -[SFColor hash](&v7, sel_hash);
  -[SFCalendarColor eventIdentifier](self, "eventIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (void)setEventIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFCalendarColor)initWithProtobuf:(id)a3
{
  id v4;
  SFCalendarColor *v5;
  void *v6;
  void *v7;
  SFCalendarColor *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFCalendarColor;
  v5 = -[SFCalendarColor init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "eventIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "eventIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCalendarColor setEventIdentifier:](v5, "setEventIdentifier:", v7);

    }
    v8 = v5;
  }

  return v5;
}

@end
