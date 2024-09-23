@implementation DAWiFiNetwork

- (BOOL)isEqual:(id)a3
{
  DAWiFiNetwork *v4;
  DAWiFiNetwork *v5;
  DAWiFiNetwork *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned int v10;
  unsigned int v11;

  v4 = (DAWiFiNetwork *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    v6 = v4;
    if (-[DAWiFiNetwork isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class(self, v7)))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[DAWiFiNetwork SSID](v6, "SSID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DAWiFiNetwork SSID](self, "SSID"));
      if (objc_msgSend(v8, "isEqualToString:", v9))
      {
        v10 = -[DAWiFiNetwork isUnsecured](v6, "isUnsecured");
        v11 = v10 ^ -[DAWiFiNetwork isUnsecured](self, "isUnsecured") ^ 1;
      }
      else
      {
        LOBYTE(v11) = 0;
      }

    }
    else
    {
      LOBYTE(v11) = 0;
    }

  }
  return v11;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_SSID, "hash");
}

- (id)description
{
  return -[DAWiFiNetwork descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  int v4;
  uint64_t v5;
  __CFString *v6;
  NSString *SSID;
  NSString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v14;
  __CFString *v15;
  id v16;
  int v17;

  if ((a3 & 0x8000000) != 0)
    v4 = 8;
  else
    v4 = 12;
  v17 = v4;
  if ((a3 & 0x8000000) != 0)
  {
    v6 = 0;
  }
  else
  {
    v16 = 0;
    v5 = objc_opt_class(self, a2);
    CUAppendF(&v16, &v17, "%@", v5);
    v6 = (__CFString *)v16;
  }
  SSID = self->_SSID;
  if (SSID)
  {
    v15 = v6;
    v8 = SSID;
    CUAppendF(&v15, &v17, "SSID %@", v8);
    v9 = v15;

    v6 = v9;
  }
  if (self->_unsecured)
  {
    v14 = v6;
    CUAppendF(&v14, &v17, "unsecured %s", "yes");
    v10 = v14;

    v6 = v10;
  }
  v11 = &stru_100039F08;
  if (v6)
    v11 = v6;
  v12 = v11;

  return v12;
}

- (NSString)SSID
{
  return self->_SSID;
}

- (void)setSSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isUnsecured
{
  return self->_unsecured;
}

- (void)setUnsecured:(BOOL)a3
{
  self->_unsecured = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SSID, 0);
}

@end
