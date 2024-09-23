@implementation TVRCDeviceInfo

- (BOOL)containsID:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  v5 = v4;
  v6 = self->_mediaRemoteID && (objc_msgSend(v4, "isEqualToString:") & 1) != 0
    || self->_airplayID && objc_msgSend(v5, "isEqualToString:");

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v4 = v3;
  if (self->_mediaRemoteID)
    objc_msgSend(v3, "appendFormat:", CFSTR("; mediaRemoteID=%@"), self->_mediaRemoteID);
  if (self->_airplayID)
    objc_msgSend(v4, "appendFormat:", CFSTR("; airplayID=%@"), self->_airplayID);
  if (self->_idsID)
    objc_msgSend(v4, "appendFormat:", CFSTR("; idsID=%@"), self->_idsID);
  objc_msgSend(v4, "appendString:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (void)_populateValidIdentifiers:(id)a3
{
  id v4;
  NSString *v5;
  NSString *mediaRemoteID;
  NSString *v7;
  NSString *airplayID;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("MediaRemoteID"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  mediaRemoteID = self->_mediaRemoteID;
  self->_mediaRemoteID = v5;

  objc_msgSend(v4, "objectForKey:", CFSTR("AirplayID"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  airplayID = self->_airplayID;
  self->_airplayID = v7;

}

- (NSString)mediaRemoteID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)airplayID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)idsID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsID, 0);
  objc_storeStrong((id *)&self->_airplayID, 0);
  objc_storeStrong((id *)&self->_mediaRemoteID, 0);
}

@end
