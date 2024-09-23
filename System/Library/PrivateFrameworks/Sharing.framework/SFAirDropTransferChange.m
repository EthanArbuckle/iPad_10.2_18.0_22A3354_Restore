@implementation SFAirDropTransferChange

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAirDropTransferChange)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  float v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  SFAirDropTransferChange *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("proxyIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("progress"));
  v7 = v6;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("status"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));

  v11 = -[SFAirDropTransferChange initWithState:progress:proxyIdentifier:displayName:status:](self, "initWithState:progress:proxyIdentifier:displayName:status:", v10, v5, v8, v9, v7);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *proxyIdentifier;
  double progress;
  id v6;

  proxyIdentifier = self->_proxyIdentifier;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", proxyIdentifier, CFSTR("proxyIdentifier"));
  progress = self->_progress;
  *(float *)&progress = progress;
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("progress"), progress);
  objc_msgSend(v6, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_status, CFSTR("status"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_state, CFSTR("state"));

}

- (SFAirDropTransferChange)initWithState:(int64_t)a3 progress:(double)a4 proxyIdentifier:(id)a5 displayName:(id)a6 status:(id)a7
{
  id v13;
  id v14;
  id v15;
  SFAirDropTransferChange *v16;
  SFAirDropTransferChange *v17;
  objc_super v19;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)SFAirDropTransferChange;
  v16 = -[SFAirDropTransferChange init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_state = a3;
    v16->_progress = a4;
    objc_storeStrong((id *)&v16->_proxyIdentifier, a5);
    objc_storeStrong((id *)&v17->_displayName, a6);
    objc_storeStrong((id *)&v17->_status, a7);
  }

  return v17;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t state;
  const __CFString *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)SFAirDropTransferChange;
  -[SFAirDropTransferChange description](&v10, sel_description);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  state = self->_state;
  if (state > 7)
    v7 = &stru_1E483B8E8;
  else
    v7 = off_1E482FC28[state];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ state:%@ progress:%f proxyIdentifier:%@ displayName:%@ status:%@>"), v4, v7, *(_QWORD *)&self->_progress, self->_proxyIdentifier, self->_displayName, self->_status);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (SFAirDropTransferChange)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  SFAirDropTransferChange *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("proxyIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("progress"));
  v7 = v6;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("status"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("state"));

  v11 = -[SFAirDropTransferChange initWithState:progress:proxyIdentifier:displayName:status:](self, "initWithState:progress:proxyIdentifier:displayName:status:", v10, v5, v8, v9, v7);
  return v11;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  NSUUID *proxyIdentifier;
  id v5;

  proxyIdentifier = self->_proxyIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", proxyIdentifier, CFSTR("proxyIdentifier"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("progress"), self->_progress);
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_status, CFSTR("status"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_state, CFSTR("state"));

}

- (int64_t)state
{
  return self->_state;
}

- (double)progress
{
  return self->_progress;
}

- (NSUUID)proxyIdentifier
{
  return self->_proxyIdentifier;
}

- (SFProxyText)displayName
{
  return self->_displayName;
}

- (SFProxyText)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_proxyIdentifier, 0);
}

@end
