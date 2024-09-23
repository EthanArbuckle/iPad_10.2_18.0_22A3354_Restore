@implementation TCBundleResourcePackageEntry

- (TCBundleResourcePackageEntry)initWithZipEntry:(id)a3
{
  id v5;
  TCBundleResourcePackageEntry *v6;
  TCBundleResourcePackageEntry *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TCBundleResourcePackageEntry;
  v6 = -[TCBundleResourcePackageEntry init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->mZipEntry, a3);

  return v7;
}

- (void)dealloc
{
  _xmlDoc *mXmlDocument;
  objc_super v4;

  mXmlDocument = self->mXmlDocument;
  if (mXmlDocument)
    xmlFreeDoc(mXmlDocument);
  v4.receiver = self;
  v4.super_class = (Class)TCBundleResourcePackageEntry;
  -[TCBundleResourcePackageEntry dealloc](&v4, sel_dealloc);
}

- (id)data
{
  -[OISFUZipEntry data](self->mZipEntry, "data");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (_xmlDoc)xmlDocument
{
  if (!self->mXmlDocument)
    self->mXmlDocument = -[OISFUDataRepresentation xmlDocument](self->mZipEntry, "xmlDocument");
  return self->mXmlDocument;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mZipEntry, 0);
}

@end
