@implementation _NIRangingPeer

- (_NIRangingPeer)init
{

  return 0;
}

- (_NIRangingPeer)initWithMacAddressAsData:(id)a3 secureRangingKeyID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _NIRangingPeerInternal *v9;
  NSObject *internal;
  uint64_t v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v11 = auto_unlock_log(v7);
    internal = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(internal, OS_LOG_TYPE_FAULT))
      sub_1001BCD84(internal);
    goto LABEL_6;
  }
  v13.receiver = self;
  v13.super_class = (Class)_NIRangingPeer;
  self = -[_NIRangingPeer init](&v13, "init");
  if (self)
  {
    v9 = -[_NIRangingPeerInternal initWithMacAddressAsData:secureRangingKeyID:]([_NIRangingPeerInternal alloc], "initWithMacAddressAsData:secureRangingKeyID:", v6, v8);
    internal = self->_internal;
    self->_internal = v9;
LABEL_6:

  }
  return self;
}

- (NSData)macAddress
{
  return (NSData *)*((id *)self->_internal + 1);
}

- (NSData)secureRangingKeyID
{
  return (NSData *)*((id *)self->_internal + 2);
}

- (id)getMacAddressAsString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_NIRangingPeer macAddress](self, "macAddress"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_NIRangingPeer hexStringMacAddressFromData:](_NIRangingPeer, "hexStringMacAddressFromData:", v2));

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "initWithMacAddressAsData:secureRangingKeyID:", *((_QWORD *)self->_internal + 1), *((_QWORD *)self->_internal + 2));
}

- (_NIRangingPeer)initWithCoder:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _NIRangingPeer *v10;
  void *v12;

  v5 = a3;
  if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SDAutoUnlockNIRangingPeer.m"), 157, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[aDecoder allowsKeyedCoding]"));

  }
  v6 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("kNICodingKeyRangingPeerMacAddress"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("kNICodingKeyRangingPeerSecureRangingKeyID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = -[_NIRangingPeer initWithMacAddressAsData:secureRangingKeyID:](self, "initWithMacAddressAsData:secureRangingKeyID:", v7, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  _QWORD *internal;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(v9, "allowsKeyedCoding") & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SDAutoUnlockNIRangingPeer.m"), 167, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[aCoder allowsKeyedCoding]"));

  }
  internal = self->_internal;
  v6 = internal[1];
  v7 = internal;
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("kNICodingKeyRangingPeerMacAddress"));
  objc_msgSend(v9, "encodeObject:forKey:", v7[2], CFSTR("kNICodingKeyRangingPeerSecureRangingKeyID"));

}

- (id)description
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  void *v7;

  v3 = self->_internal;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_NIRangingPeer getMacAddressAsString](self, "getMacAddressAsString"));
  v5 = v3[2];

  v6 = "Yes";
  if (!v5)
    v6 = "No";
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Peer:%@ hasKey:%s"), v4, v6));

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_NIRangingPeer macAddress](self, "macAddress"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_NIRangingPeer secureRangingKeyID](self, "secureRangingKeyID"));
  v6 = (unint64_t)objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqualToPeer:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _NIRangingPeer *v8;
  _NIRangingPeer *v9;
  void *v10;
  int v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = (_NIRangingPeer *)a3;
  v9 = v8;
  if (self == v8)
  {
    v12 = 1;
    goto LABEL_25;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_NIRangingPeer macAddress](v8, "macAddress"));
  if (v10
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[_NIRangingPeer macAddress](self, "macAddress")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[_NIRangingPeer macAddress](v9, "macAddress")),
        (objc_msgSend(v3, "isEqualToData:", v4) & 1) != 0))
  {
    v11 = 0;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_NIRangingPeer macAddress](v9, "macAddress"));
    if (v13)
    {
      v12 = 0;
LABEL_21:

      goto LABEL_22;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_NIRangingPeer macAddress](self, "macAddress"));
    if (v14)
    {

      v12 = 0;
      goto LABEL_22;
    }
    v11 = 1;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_NIRangingPeer secureRangingKeyID](v9, "secureRangingKeyID"));
  if (v15)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_NIRangingPeer secureRangingKeyID](self, "secureRangingKeyID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_NIRangingPeer secureRangingKeyID](v9, "secureRangingKeyID"));
    if ((objc_msgSend(v5, "isEqualToData:", v6) & 1) != 0)
    {
      v12 = 1;
      goto LABEL_16;
    }
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_NIRangingPeer secureRangingKeyID](v9, "secureRangingKeyID"));
  if (v16)
  {

    v12 = 0;
    if (v15)
      goto LABEL_16;
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_NIRangingPeer secureRangingKeyID](self, "secureRangingKeyID"));
    v12 = v17 == 0;

    if (v15)
    {
LABEL_16:

      if ((v11 & 1) == 0)
        goto LABEL_22;
      goto LABEL_20;
    }
  }
  if (v11)
  {
LABEL_20:
    v13 = 0;
    goto LABEL_21;
  }
LABEL_22:
  if (v10)
  {

  }
LABEL_25:

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  _NIRangingPeer *v4;
  _NIRangingPeer *v5;
  uint64_t v6;
  BOOL v7;

  v4 = (_NIRangingPeer *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = -[_NIRangingPeer isEqualToPeer:](self, "isEqualToPeer:", v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)hexStringMacAddressFromData:(id)a3
{
  NSString *v3;
  ether_addr v5;

  *(_WORD *)&v5.octet[4] = 0;
  *(_DWORD *)v5.octet = 0;
  objc_msgSend(a3, "getBytes:length:", &v5, 6);
  v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", ether_ntoa(&v5));
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_internal, 0);
}

@end
