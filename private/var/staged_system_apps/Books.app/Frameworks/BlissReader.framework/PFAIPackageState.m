@implementation PFAIPackageState

- (PFAIPackageState)initWithDocumentRoot:(id)a3 applePubURL:(id)a4 archive:(id)a5
{
  PFAIPackageState *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PFAIPackageState;
  v8 = -[PFAIPackageState init](&v10, "init");
  if (v8)
  {
    v8->mDocumentRoot = (THDocumentRoot *)a3;
    v8->mArchive = (PFXArchive *)a5;
    v8->mManifestEntryUriById = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v8->mManifestEntryMeidaTypeByUri = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v8->mMetadata = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v8->mApplePubURL = (NSURL *)a4;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFAIPackageState;
  -[PFAIPackageState dealloc](&v3, "dealloc");
}

- (id)entryUriForId:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->mManifestEntryUriById, "objectForKey:", a3);
}

- (id)entryMeidaTypeForEntry:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->mManifestEntryMeidaTypeByUri, "objectForKey:", a3);
}

- (void)addManifestItemAbsoluteEntryUri:(id)a3 withId:(id)a4 mediaType:(id)a5
{
  id v9;
  id v10;

  v9 = -[NSMutableDictionary objectForKey:](self->mManifestEntryUriById, "objectForKey:", a4);
  if (v9)
  {
    v10 = v9;
    -[NSMutableDictionary removeObjectForKey:](self->mManifestEntryUriById, "removeObjectForKey:", a4);
    -[NSMutableDictionary removeObjectForKey:](self->mManifestEntryMeidaTypeByUri, "removeObjectForKey:", v10);
  }
  -[NSMutableDictionary setObject:forKey:](self->mManifestEntryUriById, "setObject:forKey:", a3, a4);
  -[NSMutableDictionary setObject:forKey:](self->mManifestEntryMeidaTypeByUri, "setObject:forKey:", a5, a3);
}

- (void)setValue:(id)a3 forMetadata:(id)a4
{
  -[NSMutableDictionary setValue:forKey:](self->mMetadata, "setValue:forKey:", a3, a4);
}

- (PFXArchive)archive
{
  return self->mArchive;
}

- (THDocumentRoot)thDocumentRoot
{
  return self->mDocumentRoot;
}

- (NSURL)applePubZipURL
{
  return self->mApplePubURL;
}

- (NSString)opfEntryUri
{
  return self->mOpfUri;
}

- (void)setOpfEntryUri:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)ncxEntryUri
{
  return self->mNcxUri;
}

- (void)setNcxEntryUri:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)glossaryEntryUri
{
  return self->mGlossaryUri;
}

- (void)setGlossaryEntryUri:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)searchIndexUri
{
  return self->mSearchIndexUri;
}

- (void)setSearchIndexUri:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDictionary)metadata
{
  return &self->mMetadata->super;
}

- (NSArray)spineEntries
{
  return self->mSpineEntries;
}

- (void)setSpineEntries:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSDictionary)spineURLToCfi
{
  return self->mSpineURLToCfi;
}

- (void)setSpineURLToCfi:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (int64_t)requiredVersion
{
  return self->mRequiredVersion;
}

- (void)setRequiredVersion:(int64_t)a3
{
  self->mRequiredVersion = a3;
}

@end
