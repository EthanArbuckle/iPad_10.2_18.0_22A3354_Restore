@implementation TUCallRecordingRequest

- (TUCallRecordingRequest)initWithCall:(id)a3
{
  id v4;
  TUCallRecordingRequest *v5;
  uint64_t v6;
  NSUUID *UUID;
  id v8;
  void *v9;
  uint64_t v10;
  NSUUID *callUUID;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TUCallRecordingRequest;
  v5 = -[TUCallRecordingRequest init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    v8 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v4, "uniqueProxyIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithUUIDString:", v9);
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
  -[TUCallRecordingRequest UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" UUID=%@"), v4);

  -[TUCallRecordingRequest callUUID](self, "callUUID");
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

- (TUCallRecordingRequest)initWithCoder:(id)a3
{
  id v4;
  TUCallRecordingRequest *v5;
  uint64_t v6;
  NSUUID *UUID;
  uint64_t v8;
  NSUUID *callUUID;

  v4 = a3;
  v5 = -[TUCallRecordingRequest init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callUUID"));
    v8 = objc_claimAutoreleasedReturnValue();
    callUUID = v5->_callUUID;
    v5->_callUUID = (NSUUID *)v8;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[TUCallRecordingRequest UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUUID:", v5);

  -[TUCallRecordingRequest callUUID](self, "callUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCallUUID:", v6);

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
