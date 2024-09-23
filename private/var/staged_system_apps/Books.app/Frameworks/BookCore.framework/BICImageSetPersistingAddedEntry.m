@implementation BICImageSetPersistingAddedEntry

- (BICImageSetPersistingAddedEntry)initWithDescribedImage:(id)a3 imageEntry:(id)a4
{
  id v7;
  id v8;
  BICImageSetPersistingAddedEntry *v9;
  BICImageSetPersistingAddedEntry *v10;
  uint64_t v11;
  NSString *entryLocation;
  uint64_t v13;
  NSString *storedData;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BICImageSetPersistingAddedEntry;
  v9 = -[BICImageSetPersistingAddedEntry init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_imageDescription, a3);
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "entryLocation"));
    entryLocation = v10->_entryLocation;
    v10->_entryLocation = (NSString *)v11;

    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataStoreInformation"));
    storedData = v10->_storedData;
    v10->_storedData = (NSString *)v13;

  }
  return v10;
}

- (BICDescribedImage)imageDescription
{
  return self->_imageDescription;
}

- (void)setImageDescription:(id)a3
{
  objc_storeStrong((id *)&self->_imageDescription, a3);
}

- (NSString)entryLocation
{
  return self->_entryLocation;
}

- (void)setEntryLocation:(id)a3
{
  objc_storeStrong((id *)&self->_entryLocation, a3);
}

- (NSString)storedData
{
  return self->_storedData;
}

- (void)setStoredData:(id)a3
{
  objc_storeStrong((id *)&self->_storedData, a3);
}

- (BOOL)permanent
{
  return self->_permanent;
}

- (void)setPermanent:(BOOL)a3
{
  self->_permanent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storedData, 0);
  objc_storeStrong((id *)&self->_entryLocation, 0);
  objc_storeStrong((id *)&self->_imageDescription, 0);
}

@end
