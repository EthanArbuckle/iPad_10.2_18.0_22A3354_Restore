@implementation _ICMusicSubscriptionLeaseIdentityCacheKey

- (_ICMusicSubscriptionLeaseIdentityCacheKey)initWithDSID:(id)a3 carrierBundleDeviceIdentifier:(id)a4 delegatedDSID:(id)a5
{
  id v8;
  id v9;
  id v10;
  _ICMusicSubscriptionLeaseIdentityCacheKey *v11;
  uint64_t v12;
  NSString *carrierBundleDeviceIdentifier;
  uint64_t v14;
  NSNumber *delegatedDSID;
  uint64_t v16;
  NSNumber *DSID;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_ICMusicSubscriptionLeaseIdentityCacheKey;
  v11 = -[_ICMusicSubscriptionLeaseIdentityCacheKey init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    carrierBundleDeviceIdentifier = v11->_carrierBundleDeviceIdentifier;
    v11->_carrierBundleDeviceIdentifier = (NSString *)v12;

    v14 = objc_msgSend(v10, "copy");
    delegatedDSID = v11->_delegatedDSID;
    v11->_delegatedDSID = (NSNumber *)v14;

    v16 = objc_msgSend(v8, "copy");
    DSID = v11->_DSID;
    v11->_DSID = (NSNumber *)v16;

  }
  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_carrierBundleDeviceIdentifier, "hash");
  v4 = -[NSNumber hash](self->_DSID, "hash") ^ v3;
  return v4 ^ -[NSNumber hash](self->_delegatedDSID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _ICMusicSubscriptionLeaseIdentityCacheKey *v4;
  NSNumber *DSID;
  NSNumber *delegatedDSID;
  NSString *carrierBundleDeviceIdentifier;
  char v8;

  v4 = (_ICMusicSubscriptionLeaseIdentityCacheKey *)a3;
  if (v4 == self)
    goto LABEL_10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (DSID = self->_DSID, DSID != v4->_DSID) && !-[NSNumber isEqual:](DSID, "isEqual:")
    || (delegatedDSID = self->_delegatedDSID, delegatedDSID != v4->_delegatedDSID)
    && !-[NSNumber isEqual:](delegatedDSID, "isEqual:"))
  {
    v8 = 0;
    goto LABEL_11;
  }
  carrierBundleDeviceIdentifier = self->_carrierBundleDeviceIdentifier;
  if (carrierBundleDeviceIdentifier == v4->_carrierBundleDeviceIdentifier)
  {
LABEL_10:
    v8 = 1;
    goto LABEL_11;
  }
  v8 = -[NSString isEqual:](carrierBundleDeviceIdentifier, "isEqual:");
LABEL_11:

  return v8;
}

- (NSNumber)delegatedDSID
{
  return self->_delegatedDSID;
}

- (NSNumber)DSID
{
  return self->_DSID;
}

- (NSString)carrierBundleDeviceIdentifier
{
  return self->_carrierBundleDeviceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierBundleDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_DSID, 0);
  objc_storeStrong((id *)&self->_delegatedDSID, 0);
}

@end
