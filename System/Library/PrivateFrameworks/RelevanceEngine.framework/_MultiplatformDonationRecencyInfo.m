@implementation _MultiplatformDonationRecencyInfo

- (id)identifierForMostRecentData
{
  NSDate *localDonationCreationDate;
  void *v4;
  int v5;
  uint64_t v6;

  if (self->_remoteDonationCreationDate)
  {
    localDonationCreationDate = self->_localDonationCreationDate;
    if (localDonationCreationDate)
    {
      -[NSDate laterDate:](localDonationCreationDate, "laterDate:");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isEqual:", self->_localDonationCreationDate);

      v6 = 8;
      if (v5)
        v6 = 16;
    }
    else
    {
      v6 = 8;
    }
  }
  else
  {
    v6 = 16;
  }
  return *(id *)((char *)&self->super.isa + v6);
}

- (NSString)remoteBundleIdentifier
{
  return self->_remoteBundleIdentifier;
}

- (void)setRemoteBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)localBundleIdentifier
{
  return self->_localBundleIdentifier;
}

- (void)setLocalBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)remoteDonationCreationDate
{
  return self->_remoteDonationCreationDate;
}

- (void)setRemoteDonationCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDonationCreationDate, a3);
}

- (NSDate)localDonationCreationDate
{
  return self->_localDonationCreationDate;
}

- (void)setLocalDonationCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_localDonationCreationDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDonationCreationDate, 0);
  objc_storeStrong((id *)&self->_remoteDonationCreationDate, 0);
  objc_storeStrong((id *)&self->_localBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteBundleIdentifier, 0);
}

@end
