@implementation PAReplayKitAccess

+ (id)accessWithAccessor:(id)a3 fromBroadcaster:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAccessor:fromBroadcaster:", v7, v6);

  return v8;
}

+ (id)accessWithAccessor:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAccessor:", v4);

  return v5;
}

+ (id)eventStreamIdentifier
{
  return CFSTR("com.apple.privacy.accounting.stream.replay-kit");
}

- (PAReplayKitAccess)initWithAccessor:(id)a3 fromBroadcaster:(id)a4
{
  id v7;
  PAReplayKitAccess *v8;
  PAReplayKitAccess *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PAReplayKitAccess;
  v8 = -[PAAccess initWithAccessor:](&v11, sel_initWithAccessor_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_broadcaster, a4);

  return v9;
}

- (PAReplayKitAccess)initWithAccessor:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAReplayKitAccess;
  return -[PAAccess initWithAccessor:](&v4, sel_initWithAccessor_, a3);
}

- (PAReplayKitAccess)initWithAccessor:(id)a3 broadcaster:(id)a4 identifier:(id)a5 kind:(int64_t)a6
{
  id v11;
  PAReplayKitAccess *v12;
  PAReplayKitAccess *v13;
  objc_super v15;

  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PAReplayKitAccess;
  v12 = -[PAAccess initWithAccessor:identifier:kind:](&v15, sel_initWithAccessor_identifier_kind_, a3, a5, a6);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_broadcaster, a4);

  return v13;
}

- (id)category
{
  return CFSTR("screenRecording");
}

- (id)JSONObject
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PAReplayKitAccess;
  -[PAAccess JSONObject](&v7, sel_JSONObject);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[PAApplication JSONObject](self->_broadcaster, "JSONObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("broadcaster"));

  return v4;
}

- (unint64_t)hashWithOptions:(unint64_t)a3
{
  unint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAReplayKitAccess;
  v4 = -[PAAccess hashWithOptions:](&v6, sel_hashWithOptions_, a3);
  return -[PAApplication hash](self->_broadcaster, "hash") - v4 + 32 * v4;
}

- (BOOL)isEqualToAccess:(id)a3 withOptions:(unint64_t)a4
{
  id v6;
  PAApplication *broadcaster;
  PAApplication *v8;
  PAApplication *v9;
  void *v10;
  char v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PAReplayKitAccess;
  if (-[PAAccess isEqualToAccess:withOptions:](&v13, sel_isEqualToAccess_withOptions_, v6, a4))
  {
    broadcaster = self->_broadcaster;
    objc_msgSend(v6, "broadcaster");
    v8 = (PAApplication *)objc_claimAutoreleasedReturnValue();
    if (broadcaster == v8)
    {
      v11 = 1;
    }
    else
    {
      v9 = self->_broadcaster;
      objc_msgSend(v6, "broadcaster");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PAApplication isEqual:](v9, "isEqual:", v10);

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)copyWithNewBroadcaster:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a3;
  v6 = -[PAReplayKitAccess copy](self, "copy");
  v7 = (void *)v6;
  if (v6)
    objc_storeStrong((id *)(v6 + 72), a3);

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PAReplayKitAccess;
  -[PAAccess description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ broadcaster:<%@>"), v4, self->_broadcaster);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PAReplayKitAccess)initWithCoder:(id)a3
{
  id v4;
  PAReplayKitAccess *v5;
  uint64_t v6;
  PAApplication *broadcaster;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PAReplayKitAccess;
  v5 = -[PAAccess initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("broadcaster"));
    v6 = objc_claimAutoreleasedReturnValue();
    broadcaster = v5->_broadcaster;
    v5->_broadcaster = (PAApplication *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PAReplayKitAccess;
  v4 = a3;
  -[PAAccess encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_broadcaster, CFSTR("broadcaster"), v5.receiver, v5.super_class);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PAReplayKitAccess;
  v5 = -[PAAccess copyWithZone:](&v9, sel_copyWithZone_);
  if (v5)
  {
    v6 = -[PAApplication copyWithZone:](self->_broadcaster, "copyWithZone:", a3);
    v7 = (void *)v5[9];
    v5[9] = v6;

  }
  return v5;
}

- (PAReplayKitAccess)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  PAApplication *v7;
  void *v8;
  PAApplication *v9;
  PAApplication *broadcaster;
  PAReplayKitAccess *v11;
  PAReplayKitAccess *v12;
  objc_super v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "access");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14.receiver = self;
    v14.super_class = (Class)PAReplayKitAccess;
    self = -[PAAccess initWithProto:](&v14, sel_initWithProto_, v6);

    if (self)
    {
      v7 = [PAApplication alloc];
      objc_msgSend(v5, "broadcaster");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PAApplication initWithProto:](v7, "initWithProto:", v8);
      broadcaster = self->_broadcaster;
      self->_broadcaster = v9;

      v11 = self;
    }

    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (PAReplayKitAccess)initWithProtoData:(id)a3
{
  id v4;
  PAPBReplayKitAccess *v5;
  PAReplayKitAccess *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[PAPBReplayKitAccess initWithData:]([PAPBReplayKitAccess alloc], "initWithData:", v4);

    v6 = -[PAReplayKitAccess initWithProto:](self, "initWithProto:", v5);
    self = v6;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v8;

  v3 = (void *)objc_opt_new();
  v8.receiver = self;
  v8.super_class = (Class)PAReplayKitAccess;
  -[PAAccess proto](&v8, sel_proto);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "setAccess:", v4);
    -[PAApplication proto](self->_broadcaster, "proto");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBroadcaster:", v5);

    v6 = v3;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (PAApplication)broadcaster
{
  return self->_broadcaster;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_broadcaster, 0);
}

@end
