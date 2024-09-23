@implementation PaceInfo

- (id)description
{
  id v3;
  const char *v4;
  void *v5;
  __CFString *v6;
  const char *v7;
  int64_t version;
  void *v9;

  if (self)
  {
    v3 = objc_getProperty(self, a2, 32, 1);
    if (v3)
    {
      v5 = v3;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", parameterId=%@"), objc_getProperty(self, v4, 32, 1));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = &stru_1E7D801F8;
    }
    v7 = off_1E7D7F648[self->_protocol];
    version = self->_version;
  }
  else
  {
    version = 0;
    v6 = &stru_1E7D801F8;
    v7 = "DH_GM_3DES_CBC_CBC";
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PACEInfo: protocol=%s, version=%ld%@"), v7, version, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setProtocol:(int64_t)a3
{
  self->_protocol = a3;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (void)setOptionalParameter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionalParameter, 0);
}

@end
