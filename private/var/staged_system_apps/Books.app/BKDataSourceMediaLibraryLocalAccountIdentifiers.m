@implementation BKDataSourceMediaLibraryLocalAccountIdentifiers

- (NSString)purchasedDSID
{
  return self->_purchasedDSID;
}

- (void)setPurchasedDSID:(id)a3
{
  objc_storeStrong((id *)&self->_purchasedDSID, a3);
}

- (NSString)downloadedDSID
{
  return self->_downloadedDSID;
}

- (void)setDownloadedDSID:(id)a3
{
  objc_storeStrong((id *)&self->_downloadedDSID, a3);
}

- (NSString)familyID
{
  return self->_familyID;
}

- (void)setFamilyID:(id)a3
{
  objc_storeStrong((id *)&self->_familyID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyID, 0);
  objc_storeStrong((id *)&self->_downloadedDSID, 0);
  objc_storeStrong((id *)&self->_purchasedDSID, 0);
}

@end
