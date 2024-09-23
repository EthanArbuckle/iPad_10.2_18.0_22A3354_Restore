@implementation TUScreenSharingRequest

- (TUScreenSharingRequest)initWithHandle:(id)a3 shareMyScreen:(BOOL)a4 originType:(int64_t)a5 shouldSendLegacyInvite:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  TUScreenSharingRequest *v13;

  v6 = a6;
  if (a4)
    v9 = 2;
  else
    v9 = 1;
  v10 = (void *)MEMORY[0x1E0CB3A28];
  v11 = a3;
  objc_msgSend(v10, "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[TUScreenSharingRequest initWithHandle:type:originType:UUID:participantIdentifier:shouldSendLegacyInvite:](self, "initWithHandle:type:originType:UUID:participantIdentifier:shouldSendLegacyInvite:", v11, v9, a5, v12, 0, v6);

  return v13;
}

- (TUScreenSharingRequest)initWithHandle:(id)a3 type:(int64_t)a4 originType:(int64_t)a5 UUID:(id)a6 participantIdentifier:(unint64_t)a7
{
  return -[TUScreenSharingRequest initWithHandle:type:originType:UUID:participantIdentifier:shouldSendLegacyInvite:](self, "initWithHandle:type:originType:UUID:participantIdentifier:shouldSendLegacyInvite:", a3, a4, a5, a6, a7, 0);
}

- (TUScreenSharingRequest)initWithHandle:(id)a3 type:(int64_t)a4 originType:(int64_t)a5 UUID:(id)a6 participantIdentifier:(unint64_t)a7 shouldSendLegacyInvite:(BOOL)a8
{
  id v15;
  id v16;
  TUScreenSharingRequest *v17;
  TUScreenSharingRequest *v18;
  objc_super v20;

  v15 = a3;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)TUScreenSharingRequest;
  v17 = -[TUScreenSharingRequest init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_handle, a3);
    v18->_type = a4;
    v18->_originType = a5;
    objc_storeStrong((id *)&v18->_UUID, a6);
    v18->_participantIdentifier = a7;
    v18->_shouldSendLegacyInvite = a8;
  }

  return v18;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUScreenSharingRequest UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" UUID=%@"), v4);

  -[TUScreenSharingRequest handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" handle=%@"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(" type=%lu"), -[TUScreenSharingRequest type](self, "type"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" originType=%lu"), -[TUScreenSharingRequest originType](self, "originType"));
  if (-[TUScreenSharingRequest isLocallyOriginated](self, "isLocallyOriginated"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR(" locallyOriginated=%@"), v6);
  objc_msgSend(v3, "appendFormat:", CFSTR(" participantIdentifier=%llu"), -[TUScreenSharingRequest participantIdentifier](self, "participantIdentifier"));
  if (-[TUScreenSharingRequest shouldSendLegacyInvite](self, "shouldSendLegacyInvite"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR(" shouldSendLegacyInvite=%@"), v7);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isLocallyOriginated
{
  return -[TUScreenSharingRequest type](self, "type") == 2 || -[TUScreenSharingRequest type](self, "type") == 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[TUScreenSharingRequest handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TUScreenSharingRequest type](self, "type");
  v7 = -[TUScreenSharingRequest originType](self, "originType");
  -[TUScreenSharingRequest UUID](self, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithHandle:type:originType:UUID:participantIdentifier:shouldSendLegacyInvite:", v5, v6, v7, v8, -[TUScreenSharingRequest participantIdentifier](self, "participantIdentifier"), -[TUScreenSharingRequest shouldSendLegacyInvite](self, "shouldSendLegacyInvite"));

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  _BOOL8 v15;
  id v16;

  v4 = a3;
  -[TUScreenSharingRequest handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_handle);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  v7 = -[TUScreenSharingRequest type](self, "type");
  NSStringFromSelector(sel_type);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v7, v8);

  v9 = -[TUScreenSharingRequest originType](self, "originType");
  NSStringFromSelector(sel_originType);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v9, v10);

  -[TUScreenSharingRequest UUID](self, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_UUID);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  v13 = -[TUScreenSharingRequest participantIdentifier](self, "participantIdentifier");
  NSStringFromSelector(sel_participantIdentifier);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v13, v14);

  v15 = -[TUScreenSharingRequest shouldSendLegacyInvite](self, "shouldSendLegacyInvite");
  NSStringFromSelector(sel_shouldSendLegacyInvite);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v15, v16);

}

- (TUScreenSharingRequest)initWithCoder:(id)a3
{
  id v4;
  TUScreenSharingRequest *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  TUHandle *handle;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSUUID *UUID;
  void *v16;
  void *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TUScreenSharingRequest;
  v5 = -[TUScreenSharingRequest init](&v19, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_handle);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (TUHandle *)v8;

    NSStringFromSelector(sel_type);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", v10);

    NSStringFromSelector(sel_originType);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_originType = objc_msgSend(v4, "decodeIntegerForKey:", v11);

    v12 = objc_opt_class();
    NSStringFromSelector(sel_UUID);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v14;

    NSStringFromSelector(sel_participantIdentifier);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_participantIdentifier = objc_msgSend(v4, "decodeIntegerForKey:", v16);

    NSStringFromSelector(sel_shouldSendLegacyInvite);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldSendLegacyInvite = objc_msgSend(v4, "decodeBoolForKey:", v17);

  }
  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  -[TUScreenSharingRequest handle](self, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[TUScreenSharingRequest type](self, "type");
  v6 = v5 ^ -[TUScreenSharingRequest originType](self, "originType") ^ v4;
  -[TUScreenSharingRequest UUID](self, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = v6 ^ v8 ^ -[TUScreenSharingRequest participantIdentifier](self, "participantIdentifier");
  v10 = v9 ^ -[TUScreenSharingRequest shouldSendLegacyInvite](self, "shouldSendLegacyInvite");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  TUScreenSharingRequest *v4;
  BOOL v5;

  v4 = (TUScreenSharingRequest *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TUScreenSharingRequest isEqualToRequest:](self, "isEqualToRequest:", v4);
  }

  return v5;
}

- (BOOL)isEqualToRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  _BOOL4 v12;
  int v13;

  v4 = a3;
  -[TUScreenSharingRequest handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToHandle:", v6)
    && (v7 = -[TUScreenSharingRequest type](self, "type"), v7 == objc_msgSend(v4, "type"))
    && (v8 = -[TUScreenSharingRequest originType](self, "originType"), v8 == objc_msgSend(v4, "originType")))
  {
    -[TUScreenSharingRequest UUID](self, "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqual:", v10)
      && (v11 = -[TUScreenSharingRequest participantIdentifier](self, "participantIdentifier"),
          v11 == objc_msgSend(v4, "participantIdentifier")))
    {
      v12 = -[TUScreenSharingRequest shouldSendLegacyInvite](self, "shouldSendLegacyInvite");
      v13 = v12 ^ objc_msgSend(v4, "shouldSendLegacyInvite") ^ 1;
    }
    else
    {
      LOBYTE(v13) = 0;
    }

  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (TUHandle)handle
{
  return self->_handle;
}

- (unint64_t)participantIdentifier
{
  return self->_participantIdentifier;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)originType
{
  return self->_originType;
}

- (BOOL)shouldSendLegacyInvite
{
  return self->_shouldSendLegacyInvite;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
