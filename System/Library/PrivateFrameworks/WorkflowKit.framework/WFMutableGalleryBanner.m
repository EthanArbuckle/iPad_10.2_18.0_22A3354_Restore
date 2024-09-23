@implementation WFMutableGalleryBanner

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

- (NSString)subtitle
{
  return self->subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (CKRecordID)detailPage
{
  return self->detailPage;
}

- (void)setDetailPage:(id)a3
{
  objc_storeStrong((id *)&self->detailPage, a3);
}

- (NSString)language
{
  return self->language;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSArray)supportedIdioms
{
  return self->supportedIdioms;
}

- (void)setSupportedIdioms:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->supportedIdioms, 0);
  objc_storeStrong((id *)&self->persistentIdentifier, 0);
  objc_storeStrong((id *)&self->base, 0);
  objc_storeStrong((id *)&self->language, 0);
  objc_storeStrong((id *)&self->detailPage, 0);
  objc_storeStrong((id *)&self->subtitle, 0);
  objc_storeStrong((id *)&self->name, 0);
  objc_storeStrong((id *)&self->identifier, 0);
}

@end
