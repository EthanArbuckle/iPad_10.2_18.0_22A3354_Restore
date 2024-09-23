@implementation SPBeaconShare

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPBeaconShare)initWithIdentifier:(id)a3 beaconIdentifier:(id)a4 sharingCircleIdentifier:(id)a5 peerTrustIdentifier:(id)a6 owner:(id)a7 sharee:(id)a8 state:(int64_t)a9 creationDate:(id)a10 expirationDate:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  SPBeaconShare *v24;
  SPBeaconShare *v25;
  id obj;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  objc_super v33;

  v18 = a3;
  obj = a4;
  v19 = a4;
  v28 = a5;
  v20 = a5;
  v29 = a6;
  v32 = a6;
  v30 = a7;
  v31 = a7;
  v21 = a8;
  v22 = a10;
  v23 = a11;
  v33.receiver = self;
  v33.super_class = (Class)SPBeaconShare;
  v24 = -[SPBeaconShare init](&v33, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_identifier, a3);
    objc_storeStrong((id *)&v25->_beaconIdentifier, obj);
    objc_storeStrong((id *)&v25->_sharingCircleIdentifier, v28);
    objc_storeStrong((id *)&v25->_peerTrustIdentifier, v29);
    objc_storeStrong((id *)&v25->_owner, v30);
    objc_storeStrong((id *)&v25->_sharee, a8);
    v25->_state = a9;
    objc_storeStrong((id *)&v25->_creationDate, a10);
    objc_storeStrong((id *)&v25->_expirationDate, a11);
  }

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  SPBeaconShare *v4;
  SPBeaconShare *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int64_t v20;
  BOOL v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v4 = (SPBeaconShare *)a3;
  if (v4 == self)
  {
    v21 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SPBeaconShare identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPBeaconShare identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[SPBeaconShare beaconIdentifier](self, "beaconIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPBeaconShare beaconIdentifier](v5, "beaconIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqual:", v9))
        {
          -[SPBeaconShare sharingCircleIdentifier](self, "sharingCircleIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SPBeaconShare sharingCircleIdentifier](v5, "sharingCircleIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "isEqual:", v11))
          {
            -[SPBeaconShare peerTrustIdentifier](self, "peerTrustIdentifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[SPBeaconShare peerTrustIdentifier](v5, "peerTrustIdentifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = v12;
            if (objc_msgSend(v12, "isEqual:", v30))
            {
              -[SPBeaconShare owner](self, "owner");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              -[SPBeaconShare owner](v5, "owner");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = v13;
              if (objc_msgSend(v13, "isEqual:", v28))
              {
                -[SPBeaconShare sharee](self, "sharee");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                -[SPBeaconShare sharee](v5, "sharee");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = v14;
                if (objc_msgSend(v14, "isEqual:", v26))
                {
                  -[SPBeaconShare creationDate](self, "creationDate");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SPBeaconShare creationDate](v5, "creationDate");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = v15;
                  if (objc_msgSend(v15, "isEqual:", v24))
                  {
                    -[SPBeaconShare expirationDate](self, "expirationDate");
                    v16 = objc_claimAutoreleasedReturnValue();
                    -[SPBeaconShare expirationDate](v5, "expirationDate");
                    v17 = objc_claimAutoreleasedReturnValue();
                    v23 = (void *)v16;
                    v18 = (void *)v16;
                    v19 = (void *)v17;
                    if (objc_msgSend(v18, "isEqual:", v17))
                    {
                      v20 = -[SPBeaconShare state](self, "state");
                      v21 = v20 == -[SPBeaconShare state](v5, "state");
                    }
                    else
                    {
                      v21 = 0;
                    }

                  }
                  else
                  {
                    v21 = 0;
                  }

                }
                else
                {
                  v21 = 0;
                }

              }
              else
              {
                v21 = 0;
              }

            }
            else
            {
              v21 = 0;
            }

          }
          else
          {
            v21 = 0;
          }

        }
        else
        {
          v21 = 0;
        }

      }
      else
      {
        v21 = 0;
      }

    }
    else
    {
      v21 = 0;
    }
  }

  return v21;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v20;

  -[SPBeaconShare identifier](self, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v20, "hash");
  -[SPBeaconShare beaconIdentifier](self, "beaconIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[SPBeaconShare sharingCircleIdentifier](self, "sharingCircleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[SPBeaconShare peerTrustIdentifier](self, "peerTrustIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");
  -[SPBeaconShare owner](self, "owner");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  -[SPBeaconShare sharee](self, "sharee");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash");
  -[SPBeaconShare creationDate](self, "creationDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v9 ^ v13 ^ objc_msgSend(v14, "hash");
  -[SPBeaconShare expirationDate](self, "expirationDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hash");
  v18 = v15 ^ v17 ^ -[SPBeaconShare state](self, "state");

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPBeaconShare *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  SPBeaconShare *v14;

  v4 = [SPBeaconShare alloc];
  -[SPBeaconShare identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconShare beaconIdentifier](self, "beaconIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconShare sharingCircleIdentifier](self, "sharingCircleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconShare peerTrustIdentifier](self, "peerTrustIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconShare owner](self, "owner");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconShare sharee](self, "sharee");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SPBeaconShare state](self, "state");
  -[SPBeaconShare creationDate](self, "creationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconShare expirationDate](self, "expirationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SPBeaconShare initWithIdentifier:beaconIdentifier:sharingCircleIdentifier:peerTrustIdentifier:owner:sharee:state:creationDate:expirationDate:](v4, "initWithIdentifier:beaconIdentifier:sharingCircleIdentifier:peerTrustIdentifier:owner:sharee:state:creationDate:expirationDate:", v5, v6, v7, v8, v9, v10, v11, v12, v13);

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_beaconIdentifier, CFSTR("beaconIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sharingCircleIdentifier, CFSTR("sharingCircleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_peerTrustIdentifier, CFSTR("peerTrustIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_owner, CFSTR("owner"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sharee, CFSTR("sharee"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("creationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));

}

- (SPBeaconShare)initWithCoder:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *identifier;
  NSUUID *v7;
  NSUUID *beaconIdentifier;
  NSUUID *v9;
  NSUUID *sharingCircleIdentifier;
  NSUUID *v11;
  NSUUID *peerTrustIdentifier;
  SPHandle *v13;
  SPHandle *owner;
  SPHandle *v15;
  SPHandle *sharee;
  NSDate *v17;
  NSDate *creationDate;
  NSDate *v19;
  NSDate *expirationDate;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("beaconIdentifier"));
  v7 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  beaconIdentifier = self->_beaconIdentifier;
  self->_beaconIdentifier = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharingCircleIdentifier"));
  v9 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  sharingCircleIdentifier = self->_sharingCircleIdentifier;
  self->_sharingCircleIdentifier = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("peerTrustIdentifier"));
  v11 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  peerTrustIdentifier = self->_peerTrustIdentifier;
  self->_peerTrustIdentifier = v11;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("owner"));
  v13 = (SPHandle *)objc_claimAutoreleasedReturnValue();
  owner = self->_owner;
  self->_owner = v13;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharee"));
  v15 = (SPHandle *)objc_claimAutoreleasedReturnValue();
  sharee = self->_sharee;
  self->_sharee = v15;

  self->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
  v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
  creationDate = self->_creationDate;
  self->_creationDate = v17;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
  v19 = (NSDate *)objc_claimAutoreleasedReturnValue();

  expirationDate = self->_expirationDate;
  self->_expirationDate = v19;

  return self;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[SPBeaconShare identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconShare owner](self, "owner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@ %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSUUID)beaconIdentifier
{
  return self->_beaconIdentifier;
}

- (void)setBeaconIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SPHandle)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SPHandle)sharee
{
  return self->_sharee;
}

- (void)setSharee:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSUUID)sharingCircleIdentifier
{
  return self->_sharingCircleIdentifier;
}

- (void)setSharingCircleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSUUID)peerTrustIdentifier
{
  return self->_peerTrustIdentifier;
}

- (void)setPeerTrustIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerTrustIdentifier, 0);
  objc_storeStrong((id *)&self->_sharingCircleIdentifier, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_sharee, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_beaconIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
