@implementation BDRegistrationStatus

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;

  v4 = a3;
  v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = -[BDRegistrationStatus service](self, "service");
    if (v7 == objc_msgSend(v6, "service"))
    {
      v9 = -[BDRegistrationStatus roaming](self, "roaming");
      v8 = v9 ^ objc_msgSend(v6, "roaming") ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<service:%d roaming:%d>"), -[BDRegistrationStatus service](self, "service"), -[BDRegistrationStatus roaming](self, "roaming"));
}

- (BOOL)service
{
  return self->_service;
}

- (void)setService:(BOOL)a3
{
  self->_service = a3;
}

- (BOOL)roaming
{
  return self->_roaming;
}

- (void)setRoaming:(BOOL)a3
{
  self->_roaming = a3;
}

@end
