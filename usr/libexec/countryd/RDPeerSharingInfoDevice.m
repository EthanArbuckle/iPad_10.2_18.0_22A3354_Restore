@implementation RDPeerSharingInfoDevice

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RDPeerSharingInfoDevice sharedCountryCode](self, "sharedCountryCode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RDPeerSharingInfoDevice lastShareDate](self, "lastShareDate"));
  v7 = objc_msgSend(v4, "initWithCountryCode:andDate:", v5, v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RDPeerSharingInfoDevice)initWithCountryCode:(id)a3 andDate:(id)a4
{
  id v7;
  id v8;
  RDPeerSharingInfoDevice *v9;
  RDPeerSharingInfoDevice *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RDPeerSharingInfoDevice;
  v9 = -[RDPeerSharingInfoDevice init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sharedCountryCode, a3);
    objc_storeStrong((id *)&v10->_lastShareDate, a4);
  }

  return v10;
}

- (RDPeerSharingInfoDevice)initWithCoder:(id)a3
{
  id v4;
  RDPeerSharingInfoDevice *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RDPeerSharingInfoDevice;
  v5 = -[RDPeerSharingInfoDevice init](&v10, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectForKey:", CFSTR("kRDPeerSharingInfoDeviceKeyCountry")));
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("kRDPeerSharingInfoDeviceKeyDate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v5 = -[RDPeerSharingInfoDevice initWithCountryCode:andDate:](v5, "initWithCountryCode:andDate:", v6, v8);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RDPeerSharingInfoDevice sharedCountryCode](self, "sharedCountryCode"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kRDPeerSharingInfoDeviceKeyCountry"));

  v6 = (id)objc_claimAutoreleasedReturnValue(-[RDPeerSharingInfoDevice lastShareDate](self, "lastShareDate"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kRDPeerSharingInfoDeviceKeyDate"));

}

- (NSString)sharedCountryCode
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSharedCountryCode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDate)lastShareDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLastShareDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastShareDate, 0);
  objc_storeStrong((id *)&self->_sharedCountryCode, 0);
}

@end
