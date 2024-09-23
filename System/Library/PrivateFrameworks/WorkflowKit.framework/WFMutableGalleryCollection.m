@implementation WFMutableGalleryCollection

- (CKRecordID)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)name
{
  return self->name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)collectionDescription
{
  return self->collectionDescription;
}

- (void)setCollectionDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)workflows
{
  return self->workflows;
}

- (void)setWorkflows:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (int64_t)minVersion
{
  return self->minVersion;
}

- (void)setMinVersion:(int64_t)a3
{
  self->minVersion = a3;
}

- (NSDate)modifiedAt
{
  return self->modifiedAt;
}

- (void)setModifiedAt:(id)a3
{
  objc_storeStrong((id *)&self->modifiedAt, a3);
}

- (NSString)language
{
  return self->language;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSArray)supportedIdioms
{
  return self->supportedIdioms;
}

- (void)setSupportedIdioms:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->supportedIdioms, 0);
  objc_storeStrong((id *)&self->persistentIdentifier, 0);
  objc_storeStrong((id *)&self->base, 0);
  objc_storeStrong((id *)&self->language, 0);
  objc_storeStrong((id *)&self->modifiedAt, 0);
  objc_storeStrong((id *)&self->workflows, 0);
  objc_storeStrong((id *)&self->collectionDescription, 0);
  objc_storeStrong((id *)&self->name, 0);
  objc_storeStrong((id *)&self->identifier, 0);
}

@end
