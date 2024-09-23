@implementation PRPeer

- (PRPeer)init
{
  -[PRPeer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (PRPeer)initWithUUID:(id)a3
{
  id v5;
  PRPeer *v6;
  PRPeer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRPeer;
  v6 = -[PRPeer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_uuid, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRPeer)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  PRPeer *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PRPeer initWithUUID:](self, "initWithUUID:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_uuid, CFSTR("UUID"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PRPeer initWithUUID:]([PRPeer alloc], "initWithUUID:", self->_uuid);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UUID: %@"), self->_uuid);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PRPeer uuid](self, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
