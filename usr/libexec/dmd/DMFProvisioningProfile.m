@implementation DMFProvisioningProfile

- (id)initWithProfileRef:(void *)a3
{
  uint64_t UUID;
  uint64_t Name;
  uint64_t ExpirationDate;

  UUID = MISProvisioningProfileGetUUID(a3, a2);
  Name = MISProvisioningProfileGetName(a3);
  ExpirationDate = MISProvisioningProfileGetExpirationDate(a3);
  return -[DMFProvisioningProfile initWithUUID:name:expirationDate:](self, "initWithUUID:name:expirationDate:", UUID, Name, ExpirationDate);
}

@end
