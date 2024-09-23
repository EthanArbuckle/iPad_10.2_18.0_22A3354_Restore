@implementation SBContinuitySessionLaunchEvent

- (SBContinuitySessionLaunchEvent)initWithType:(id)a3 payload:(id)a4
{
  id v6;
  id v7;
  SBContinuitySessionLaunchEvent *v8;
  uint64_t v9;
  NSString *type;
  uint64_t v11;
  NSUUID *identifier;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBContinuitySessionLaunchEvent;
  v8 = -[SBContinuitySessionLaunchEvent init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    type = v8->_type;
    v8->_type = (NSString *)v9;

    objc_storeStrong((id *)&v8->_payload, a4);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = objc_claimAutoreleasedReturnValue();
    identifier = v8->_identifier;
    v8->_identifier = (NSUUID *)v11;

  }
  return v8;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_type, CFSTR("type"));
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)type
{
  return self->_type;
}

- (NSData)payload
{
  return self->_payload;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
