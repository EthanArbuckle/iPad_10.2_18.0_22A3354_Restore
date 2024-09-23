@implementation NRDDecryptedIdentifier

- (id)description
{
  id v3;
  uint64_t version;
  NSUUID *v5;
  NSUUID *nrUUID;
  id v7;

  v3 = objc_alloc((Class)NSString);
  if (self)
  {
    version = self->_version;
    v5 = self->_identity;
    nrUUID = self->_nrUUID;
  }
  else
  {
    v5 = 0;
    version = 0;
    nrUUID = 0;
  }
  v7 = objc_msgSend(v3, "initWithFormat:", CFSTR("%u/%@/%@"), version, v5, nrUUID);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nrUUID, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

@end
