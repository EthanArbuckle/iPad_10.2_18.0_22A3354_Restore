@implementation TUScreeningRequest

- (TUScreeningRequest)initWithTUCallUpdate:(id)a3
{
  id v4;
  TUScreeningRequest *v5;
  void *v6;
  uint64_t v7;
  NSUUID *UUID;
  void *v9;
  uint64_t v10;
  NSUUID *callUUID;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TUScreeningRequest;
  v5 = -[TUScreeningRequest init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v7;

    objc_msgSend(v4, "callUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    callUUID = v5->_callUUID;
    v5->_callUUID = (NSUUID *)v10;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUScreeningRequest UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" UUID=%@"), v4);

  -[TUScreeningRequest callUUID](self, "callUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" callUUID=%@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *UUID;
  id v5;

  UUID = self->_UUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", UUID, CFSTR("UUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_callUUID, CFSTR("callUUID"));

}

- (TUScreeningRequest)initWithCoder:(id)a3
{
  id v4;
  TUScreeningRequest *v5;
  void *v6;
  uint64_t v7;
  NSUUID *UUID;
  void *v9;
  uint64_t v10;
  NSUUID *callUUID;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TUScreeningRequest;
  v5 = -[TUScreeningRequest init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callUUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    callUUID = v5->_callUUID;
    v5->_callUUID = (NSUUID *)v10;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TUScreeningRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = -[TUScreeningRequest init](+[TUScreeningRequest allocWithZone:](TUScreeningRequest, "allocWithZone:", a3), "init");
  -[TUScreeningRequest UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[TUScreeningRequest setUUID:](v4, "setUUID:", v6);

  -[TUScreeningRequest callUUID](self, "callUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[TUScreeningRequest setCallUUID:](v4, "setCallUUID:", v8);

  return v4;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_storeStrong((id *)&self->_UUID, a3);
}

- (NSUUID)callUUID
{
  return self->_callUUID;
}

- (void)setCallUUID:(id)a3
{
  objc_storeStrong((id *)&self->_callUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callUUID, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
