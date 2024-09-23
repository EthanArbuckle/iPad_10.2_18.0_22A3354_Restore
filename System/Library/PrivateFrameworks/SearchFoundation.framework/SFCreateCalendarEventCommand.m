@implementation SFCreateCalendarEventCommand

- (SFCreateCalendarEventCommand)initWithProtobuf:(id)a3
{
  id v4;
  SFCreateCalendarEventCommand *v5;
  void *v6;
  SFCalendarEvent *v7;
  void *v8;
  SFCalendarEvent *v9;
  SFCreateCalendarEventCommand *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFCreateCalendarEventCommand;
  v5 = -[SFCreateCalendarEventCommand init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "event");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFCalendarEvent alloc];
      objc_msgSend(v4, "event");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SFCalendarEvent initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[SFCreateCalendarEventCommand setEvent:](v5, "setEvent:", v9);

    }
    v10 = v5;
  }

  return v5;
}

- (SFCreateCalendarEventCommand)initWithCoder:(id)a3
{
  id v4;
  SFCreateCalendarEventCommand *v5;
  void *v6;
  _SFPBCommand *v7;
  SFCommand *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = -[SFCreateCalendarEventCommand init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCommand initWithData:]([_SFPBCommand alloc], "initWithData:", v6);
  v8 = -[SFCommand initWithProtobuf:]([SFCommand alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCommand event](v8, "event");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCreateCalendarEventCommand setEvent:](v5, "setEvent:", v9);

    -[SFCommand commandDetail](v8, "commandDetail");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandDetail:](v5, "setCommandDetail:", v10);

    -[SFCommand normalizedTopic](v8, "normalizedTopic");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setNormalizedTopic:](v5, "setNormalizedTopic:", v11);

    -[SFCommand backendData](v8, "backendData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setBackendData:](v5, "setBackendData:", v12);

    -[SFCommand commandReference](v8, "commandReference");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandReference:](v5, "setCommandReference:", v13);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFCreateCalendarEventCommand;
  -[SFCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBCreateCalendarEventCommand *v2;
  void *v3;

  v2 = -[_SFPBCreateCalendarEventCommand initWithFacade:]([_SFPBCreateCalendarEventCommand alloc], "initWithFacade:", self);
  -[_SFPBCreateCalendarEventCommand dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBCreateCalendarEventCommand *v2;
  void *v3;

  v2 = -[_SFPBCreateCalendarEventCommand initWithFacade:]([_SFPBCreateCalendarEventCommand alloc], "initWithFacade:", self);
  -[_SFPBCreateCalendarEventCommand jsonData](v2, "jsonData");
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
  v8.super_class = (Class)SFCreateCalendarEventCommand;
  v4 = -[SFCommand copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SFCreateCalendarEventCommand event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setEvent:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFCreateCalendarEventCommand *v4;
  SFCreateCalendarEventCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = (SFCreateCalendarEventCommand *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else if (-[SFCreateCalendarEventCommand isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
         && (v13.receiver = self,
             v13.super_class = (Class)SFCreateCalendarEventCommand,
             -[SFCommand isEqual:](&v13, sel_isEqual_, v4)))
  {
    v5 = v4;
    -[SFCreateCalendarEventCommand event](self, "event");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCreateCalendarEventCommand event](v5, "event");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 == 0) == (v7 != 0))
    {
      v11 = 0;
    }
    else
    {
      -[SFCreateCalendarEventCommand event](self, "event");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[SFCreateCalendarEventCommand event](self, "event");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCreateCalendarEventCommand event](v5, "event");
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
  v7.super_class = (Class)SFCreateCalendarEventCommand;
  v3 = -[SFCommand hash](&v7, sel_hash);
  -[SFCreateCalendarEventCommand event](self, "event");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (SFCalendarEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
