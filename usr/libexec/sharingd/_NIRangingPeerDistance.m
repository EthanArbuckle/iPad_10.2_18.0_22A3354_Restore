@implementation _NIRangingPeerDistance

- (_NIRangingPeerDistance)init
{

  return 0;
}

- (_NIRangingPeerDistance)initWithPeer:(id)a3 distanceMeters:(id)a4 initiator:(BOOL)a5 shouldUnlock:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  _NIRangingPeerDistance *v12;
  _NIRangingPeerDistanceInternal *v13;
  id internal;
  _NIRangingPeerDistance *v15;
  objc_super v17;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_NIRangingPeerDistance;
  v12 = -[_NIRangingPeerDistance init](&v17, "init");
  if (v12)
  {
    v13 = -[_NIRangingPeerDistanceInternal initWithPeer:distanceMeters:initiator:shouldUnlock:]([_NIRangingPeerDistanceInternal alloc], "initWithPeer:distanceMeters:initiator:shouldUnlock:", v10, v11, v7, v6);
    internal = v12->_internal;
    v12->_internal = v13;

    v15 = v12;
  }

  return v12;
}

- (_NIRangingPeer)peer
{
  return (_NIRangingPeer *)*((id *)self->_internal + 1);
}

- (NSNumber)distanceMeters
{
  return (NSNumber *)*((id *)self->_internal + 2);
}

- (BOOL)shouldUnlock
{
  return *((_BYTE *)self->_internal + 25);
}

- (BOOL)initiator
{
  return *((_BYTE *)self->_internal + 24);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "initWithPeer:distanceMeters:initiator:shouldUnlock:", *((_QWORD *)self->_internal + 1), *((_QWORD *)self->_internal + 2), *((unsigned __int8 *)self->_internal + 24), *((unsigned __int8 *)self->_internal + 25));
}

- (_NIRangingPeerDistance)initWithCoder:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _NIRangingPeerDistance *v12;
  void *v14;

  v5 = a3;
  if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SDAutoUnlockNIRangingPeer.m"), 286, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[aDecoder allowsKeyedCoding]"));

  }
  v6 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(_NIRangingPeer), CFSTR("kNICodingKeyRangingPeerDistancePeer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("kNICodingKeyRangingPeerDistanceDistance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("kNICodingKeyRangingPeerDistanceInitiator"));
  v11 = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("kNICodingKeyRangingPeerDistanceUnlock"));

  v12 = -[_NIRangingPeerDistance initWithPeer:distanceMeters:initiator:shouldUnlock:](self, "initWithPeer:distanceMeters:initiator:shouldUnlock:", v7, v9, v10, v11);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  _QWORD *internal;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  if ((objc_msgSend(v10, "allowsKeyedCoding") & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SDAutoUnlockNIRangingPeer.m"), 298, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[aCoder allowsKeyedCoding]"));

  }
  internal = self->_internal;
  v6 = internal[1];
  v7 = internal;
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("kNICodingKeyRangingPeerDistancePeer"));
  objc_msgSend(v10, "encodeObject:forKey:", v7[2], CFSTR("kNICodingKeyRangingPeerDistanceDistance"));
  objc_msgSend(v10, "encodeBool:forKey:", *((unsigned __int8 *)v7 + 24), CFSTR("kNICodingKeyRangingPeerDistanceInitiator"));
  v8 = *((unsigned __int8 *)v7 + 25);

  objc_msgSend(v10, "encodeBool:forKey:", v8, CFSTR("kNICodingKeyRangingPeerDistanceUnlock"));
}

- (id)description
{
  id *internal;
  id v3;
  id *v4;
  void *v5;
  float v6;
  double v7;
  const char *v8;
  void *v9;
  const char *v10;
  int v11;
  const char *v12;
  void *v13;

  internal = (id *)self->_internal;
  v3 = internal[1];
  v4 = internal;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getMacAddressAsString"));
  objc_msgSend(v4[2], "floatValue");
  v7 = v6;
  if (*((_BYTE *)v4 + 25))
    v8 = "Yes";
  else
    v8 = "No";
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(internal[1], "secureRangingKeyID"));
  if (v9)
    v10 = "Yes";
  else
    v10 = "No";
  v11 = *((unsigned __int8 *)v4 + 24);

  if (v11)
    v12 = "Yes";
  else
    v12 = "No";
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Peer: %@ distance[m]:%.02f unlock:%s secure:%s initiator:%s"), v5, *(_QWORD *)&v7, v8, v10, v12));

  return v13;
}

- (BOOL)isInitiator
{
  return self->_initiator;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_internal, 0);
}

@end
