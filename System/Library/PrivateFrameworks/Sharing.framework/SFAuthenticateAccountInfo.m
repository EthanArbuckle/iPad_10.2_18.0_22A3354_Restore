@implementation SFAuthenticateAccountInfo

- (SFAuthenticateAccountInfo)initWithType:(unsigned int)a3 altDSID:(id)a4
{
  id v7;
  SFAuthenticateAccountInfo *v8;
  SFAuthenticateAccountInfo *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SFAuthenticateAccountInfo;
  v8 = -[SFAuthenticateAccountInfo init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_altDSID, a4);
  }

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: {type: %d, altDSID=%@}"), v5, self->_type, self->_altDSID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unsigned)type
{
  return self->_type;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
