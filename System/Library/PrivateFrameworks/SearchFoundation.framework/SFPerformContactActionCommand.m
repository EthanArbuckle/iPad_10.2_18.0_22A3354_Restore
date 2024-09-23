@implementation SFPerformContactActionCommand

- (SFPerformContactActionCommand)initWithProtobuf:(id)a3
{
  id v4;
  SFPerformContactActionCommand *v5;
  SFPerformContactActionCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFPerformContactActionCommand;
  v5 = -[SFPerformContactActionCommand init](&v8, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "contactActionType"))
      -[SFPerformContactActionCommand setContactActionType:](v5, "setContactActionType:", objc_msgSend(v4, "contactActionType"));
    if (objc_msgSend(v4, "didDisplayHandleOptions"))
      -[SFPerformContactActionCommand setDidDisplayHandleOptions:](v5, "setDidDisplayHandleOptions:", objc_msgSend(v4, "didDisplayHandleOptions"));
    if (objc_msgSend(v4, "didSelectFromOptionsMenu"))
      -[SFPerformContactActionCommand setDidSelectFromOptionsMenu:](v5, "setDidSelectFromOptionsMenu:", objc_msgSend(v4, "didSelectFromOptionsMenu"));
    v6 = v5;
  }

  return v5;
}

- (void)setContactActionType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_contactActionType = a3;
}

- (BOOL)hasContactActionType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setDidDisplayHandleOptions:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_didDisplayHandleOptions = a3;
}

- (BOOL)hasDidDisplayHandleOptions
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDidSelectFromOptionsMenu:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_didSelectFromOptionsMenu = a3;
}

- (BOOL)hasDidSelectFromOptionsMenu
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (SFPerformContactActionCommand)initWithCoder:(id)a3
{
  id v4;
  SFPerformContactActionCommand *v5;
  void *v6;
  _SFPBCommand *v7;
  SFCommand *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = -[SFPerformContactActionCommand init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCommand initWithData:]([_SFPBCommand alloc], "initWithData:", v6);
  v8 = -[SFCommand initWithProtobuf:]([SFCommand alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFPerformContactActionCommand setContactActionType:](v5, "setContactActionType:", -[SFCommand contactActionType](v8, "contactActionType"));
    -[SFPerformContactActionCommand setDidDisplayHandleOptions:](v5, "setDidDisplayHandleOptions:", -[SFCommand didDisplayHandleOptions](v8, "didDisplayHandleOptions"));
    -[SFPerformContactActionCommand setDidSelectFromOptionsMenu:](v5, "setDidSelectFromOptionsMenu:", -[SFCommand didSelectFromOptionsMenu](v8, "didSelectFromOptionsMenu"));
    -[SFCommand commandDetail](v8, "commandDetail");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandDetail:](v5, "setCommandDetail:", v9);

    -[SFCommand normalizedTopic](v8, "normalizedTopic");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setNormalizedTopic:](v5, "setNormalizedTopic:", v10);

    -[SFCommand backendData](v8, "backendData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setBackendData:](v5, "setBackendData:", v11);

    -[SFCommand commandReference](v8, "commandReference");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandReference:](v5, "setCommandReference:", v12);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFPerformContactActionCommand;
  -[SFCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBPerformContactActionCommand *v2;
  void *v3;

  v2 = -[_SFPBPerformContactActionCommand initWithFacade:]([_SFPBPerformContactActionCommand alloc], "initWithFacade:", self);
  -[_SFPBPerformContactActionCommand dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBPerformContactActionCommand *v2;
  void *v3;

  v2 = -[_SFPBPerformContactActionCommand initWithFacade:]([_SFPBPerformContactActionCommand alloc], "initWithFacade:", self);
  -[_SFPBPerformContactActionCommand jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFPerformContactActionCommand;
  v4 = -[SFCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setContactActionType:", -[SFPerformContactActionCommand contactActionType](self, "contactActionType"));
  objc_msgSend(v4, "setDidDisplayHandleOptions:", -[SFPerformContactActionCommand didDisplayHandleOptions](self, "didDisplayHandleOptions"));
  objc_msgSend(v4, "setDidSelectFromOptionsMenu:", -[SFPerformContactActionCommand didSelectFromOptionsMenu](self, "didSelectFromOptionsMenu"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFPerformContactActionCommand *v4;
  SFPerformContactActionCommand *v5;
  int v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  objc_super v11;

  v4 = (SFPerformContactActionCommand *)a3;
  if (self == v4)
  {
    LOBYTE(v8) = 1;
  }
  else if (-[SFPerformContactActionCommand isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
         && (v11.receiver = self,
             v11.super_class = (Class)SFPerformContactActionCommand,
             -[SFCommand isEqual:](&v11, sel_isEqual_, v4)))
  {
    v5 = v4;
    v6 = -[SFPerformContactActionCommand contactActionType](self, "contactActionType");
    if (v6 == -[SFPerformContactActionCommand contactActionType](v5, "contactActionType")
      && (v7 = -[SFPerformContactActionCommand didDisplayHandleOptions](self, "didDisplayHandleOptions"),
          v7 == -[SFPerformContactActionCommand didDisplayHandleOptions](v5, "didDisplayHandleOptions")))
    {
      v9 = -[SFPerformContactActionCommand didSelectFromOptionsMenu](self, "didSelectFromOptionsMenu");
      v8 = v9 ^ -[SFPerformContactActionCommand didSelectFromOptionsMenu](v5, "didSelectFromOptionsMenu") ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFPerformContactActionCommand;
  v3 = -[SFCommand hash](&v7, sel_hash);
  v4 = -[SFPerformContactActionCommand contactActionType](self, "contactActionType");
  v5 = v4 ^ -[SFPerformContactActionCommand didDisplayHandleOptions](self, "didDisplayHandleOptions");
  return v3 ^ v5 ^ -[SFPerformContactActionCommand didSelectFromOptionsMenu](self, "didSelectFromOptionsMenu");
}

- (int)contactActionType
{
  return self->_contactActionType;
}

- (BOOL)didDisplayHandleOptions
{
  return self->_didDisplayHandleOptions;
}

- (BOOL)didSelectFromOptionsMenu
{
  return self->_didSelectFromOptionsMenu;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
