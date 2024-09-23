@implementation WFMutableGalleryPage

- (CKRecordID)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)name
{
  return self->name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)minVersion
{
  return self->minVersion;
}

- (void)setMinVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)isRoot
{
  return self->isRoot;
}

- (void)setIsRoot:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSArray)banners
{
  return self->banners;
}

- (void)setBanners:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSArray)collections
{
  return self->collections;
}

- (void)setCollections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)language
{
  return self->language;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (CKRecordID)base
{
  return self->base;
}

- (void)setBase:(id)a3
{
  objc_storeStrong((id *)&self->base, a3);
}

- (NSString)persistentIdentifier
{
  return self->persistentIdentifier;
}

- (void)setPersistentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSArray)donations
{
  return self->donations;
}

- (void)setDonations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSArray)donationsGroupedByApp
{
  return self->donationsGroupedByApp;
}

- (void)setDonationsGroupedByApp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->donationsGroupedByApp, 0);
  objc_storeStrong((id *)&self->donations, 0);
  objc_storeStrong((id *)&self->persistentIdentifier, 0);
  objc_storeStrong((id *)&self->base, 0);
  objc_storeStrong((id *)&self->language, 0);
  objc_storeStrong((id *)&self->collections, 0);
  objc_storeStrong((id *)&self->banners, 0);
  objc_storeStrong((id *)&self->isRoot, 0);
  objc_storeStrong((id *)&self->minVersion, 0);
  objc_storeStrong((id *)&self->name, 0);
  objc_storeStrong((id *)&self->identifier, 0);
}

@end
