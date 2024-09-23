@implementation _NIRangingPeerInternal

- (_NIRangingPeerInternal)initWithMacAddressAsData:(id)a3 secureRangingKeyID:(id)a4
{
  id v6;
  NSData *v7;
  _NIRangingPeerInternal *v8;
  NSData *v9;
  NSData *macAddress;
  NSData *v11;
  NSData *secureRangingKeyID;
  _NIRangingPeerInternal *v13;
  objc_super v15;

  v6 = a3;
  v7 = (NSData *)a4;
  v15.receiver = self;
  v15.super_class = (Class)_NIRangingPeerInternal;
  v8 = -[_NIRangingPeerInternal init](&v15, "init");
  if (v8)
  {
    v9 = (NSData *)objc_msgSend(v6, "copy");
    macAddress = v8->_macAddress;
    v8->_macAddress = v9;

    if (v8->_secureRangingKeyID != v7)
    {
      v11 = (NSData *)-[NSData copy](v7, "copy");
      secureRangingKeyID = v8->_secureRangingKeyID;
      v8->_secureRangingKeyID = v11;

    }
    v13 = v8;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "initWithMacAddressAsData:secureRangingKeyID:", self->_macAddress, self->_secureRangingKeyID);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureRangingKeyID, 0);
  objc_storeStrong((id *)&self->_macAddress, 0);
}

@end
