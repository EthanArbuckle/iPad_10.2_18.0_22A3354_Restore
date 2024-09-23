@implementation DAPartialIP

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DAPartialIP)initWithAddress:(id)a3 mask:(id)a4
{
  id v6;
  id v7;
  void *v8;
  DAPartialIP *v9;
  NSData *v10;
  NSData *address;
  NSData *v12;
  NSData *mask;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v15.receiver = self;
    v15.super_class = (Class)DAPartialIP;
    self = -[DAPartialIP init](&v15, "init");
    if (self
      && (unint64_t)objc_msgSend(v6, "length") <= 0x10
      && (unint64_t)objc_msgSend(v8, "length") <= 0x10)
    {
      v10 = (NSData *)objc_msgSend(v6, "copy");
      address = self->_address;
      self->_address = v10;

      v12 = (NSData *)objc_msgSend(v8, "copy");
      mask = self->_mask;
      self->_mask = v12;

      self = self;
      v9 = self;
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (DAPartialIP)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  DAPartialIP *v7;
  uint64_t v8;
  DAPartialIP *v9;
  DAPartialIP *v10;
  uint64_t v12;
  uint64_t v13;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DAPartialIP;
  v7 = -[DAPartialIP init](&v14, "init");
  v9 = v7;
  if (!v7)
  {
    if (a4)
    {
      v12 = objc_opt_class(0, v8);
      v13 = DAErrorF(350001, "%@ super init failed", v12);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v13);
      goto LABEL_5;
    }
LABEL_8:
    v10 = 0;
    goto LABEL_5;
  }
  if (!CUXPCDecodeNSData(v6, "ipAd", &v7->_address, a4)
    || !CUXPCDecodeNSData(v6, "ipMa", &v9->_mask, a4))
  {
    goto LABEL_8;
  }
  v10 = v9;
LABEL_5:

  return v10;
}

- (void)encodeWithXPCObject:(id)a3
{
  NSData *address;
  NSData *v5;
  const char *v6;
  const char *v7;
  NSUInteger v8;
  NSData *mask;
  NSData *v10;
  id v11;
  NSData *v12;
  const char *v13;
  const char *v14;
  NSUInteger v15;
  xpc_object_t xdict;

  xdict = a3;
  address = self->_address;
  if (address)
  {
    v5 = objc_retainAutorelease(address);
    v6 = -[NSData bytes](v5, "bytes");
    if (v6)
      v7 = v6;
    else
      v7 = "";
    v8 = -[NSData length](v5, "length");

    xpc_dictionary_set_data(xdict, "ipAd", v7, v8);
  }
  mask = self->_mask;
  if (mask)
  {
    v10 = objc_retainAutorelease(mask);
    v11 = xdict;
    v12 = v10;
    v13 = -[NSData bytes](v12, "bytes");
    if (v13)
      v14 = v13;
    else
      v14 = "";
    v15 = -[NSData length](v12, "length");

    xpc_dictionary_set_data(v11, "ipMa", v14, v15);
  }

}

- (void)encodeWithCoder:(id)a3
{
  NSData *address;
  id v5;

  address = self->_address;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", address, CFSTR("address"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mask, CFSTR("mask"));

}

- (DAPartialIP)initWithCoder:(id)a3
{
  id v4;
  DAPartialIP *v5;
  NSData *v6;
  NSData *v7;
  NSData *v8;
  NSData *address;
  NSData *v10;
  NSData *mask;
  DAPartialIP *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DAPartialIP;
  v5 = -[DAPartialIP init](&v14, "init");
  if (v5)
  {
    v6 = (NSData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectForKey:", CFSTR("address")));
    v7 = (NSData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectForKey:", CFSTR("mask")));
    v8 = v7;
    if (!v6 || !v7)
    {

      v12 = 0;
      goto LABEL_6;
    }
    address = v5->_address;
    v5->_address = v6;
    v10 = v6;

    mask = v5->_mask;
    v5->_mask = v8;

  }
  v12 = v5;
LABEL_6:

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  DAPartialIP *v5;
  uint64_t v6;
  DAPartialIP *v7;
  NSData *address;
  void *v9;
  NSData *mask;
  void *v11;
  BOOL v12;

  v5 = (DAPartialIP *)a3;
  if (self == v5)
    goto LABEL_5;
  v6 = objc_opt_class(DAPartialIP, v4);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
    goto LABEL_7;
  v7 = v5;
  address = self->_address;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DAPartialIP address](v7, "address"));
  if (!-[NSData isEqualToData:](address, "isEqualToData:", v9))
  {

    goto LABEL_7;
  }
  mask = self->_mask;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DAPartialIP mask](v7, "mask"));
  LOBYTE(mask) = -[NSData isEqualToData:](mask, "isEqualToData:", v11);

  if ((mask & 1) == 0)
  {
LABEL_7:
    v12 = 0;
    goto LABEL_8;
  }
LABEL_5:
  v12 = 1;
LABEL_8:

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSData description](self->_address, "description"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSData description](self->_mask, "description"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("addr: %@, mask: %@"), v3, v4));

  return v5;
}

- (NSData)address
{
  return self->_address;
}

- (NSData)mask
{
  return self->_mask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mask, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end
