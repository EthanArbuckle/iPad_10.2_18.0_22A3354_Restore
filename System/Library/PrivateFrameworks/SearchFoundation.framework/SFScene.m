@implementation SFScene

- (SFScene)initWithProtobuf:(id)a3
{
  id v4;
  SFScene *v5;
  SFScene *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFScene;
  v5 = -[SFScene init](&v8, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "sceneIdentifier"))
      -[SFScene setSceneIdentifier:](v5, "setSceneIdentifier:", objc_msgSend(v4, "sceneIdentifier"));
    if (objc_msgSend(v4, "sceneType"))
      -[SFScene setSceneType:](v5, "setSceneType:", objc_msgSend(v4, "sceneType"));
    v6 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setSceneIdentifier:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sceneIdentifier = a3;
}

- (BOOL)hasSceneIdentifier
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSceneType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_sceneType = a3;
}

- (BOOL)hasSceneType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (SFScene)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBScene *v6;
  SFScene *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBScene initWithData:]([_SFPBScene alloc], "initWithData:", v5);
  v7 = -[SFScene initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBScene *v6;

  v4 = a3;
  v6 = -[_SFPBScene initWithFacade:]([_SFPBScene alloc], "initWithFacade:", self);
  -[_SFPBScene data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBScene *v2;
  void *v3;

  v2 = -[_SFPBScene initWithFacade:]([_SFPBScene alloc], "initWithFacade:", self);
  -[_SFPBScene dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBScene *v2;
  void *v3;

  v2 = -[_SFPBScene initWithFacade:]([_SFPBScene alloc], "initWithFacade:", self);
  -[_SFPBScene jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setSceneIdentifier:", -[SFScene sceneIdentifier](self, "sceneIdentifier"));
  objc_msgSend(v4, "setSceneType:", -[SFScene sceneType](self, "sceneType"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFScene *v4;
  SFScene *v5;
  unint64_t v6;
  int v7;
  BOOL v8;

  v4 = (SFScene *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (-[SFScene isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[SFScene sceneIdentifier](self, "sceneIdentifier");
    if (v6 == -[SFScene sceneIdentifier](v5, "sceneIdentifier"))
    {
      v7 = -[SFScene sceneType](self, "sceneType");
      v8 = v7 == -[SFScene sceneType](v5, "sceneType");
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[SFScene sceneIdentifier](self, "sceneIdentifier");
  return v3 ^ -[SFScene sceneType](self, "sceneType");
}

- (unint64_t)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (int)sceneType
{
  return self->_sceneType;
}

@end
