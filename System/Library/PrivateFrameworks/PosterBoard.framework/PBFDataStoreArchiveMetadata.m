@implementation PBFDataStoreArchiveMetadata

- (PBFDataStoreArchiveMetadata)initWithURL:(id)a3
{
  id v4;
  PBFDataStoreArchiveMetadata *v5;
  uint64_t v6;
  NSURL *archiveURL;
  void *v8;
  int v9;
  NSDate *v10;
  id v11;
  NSString *archiveName;
  id v13;
  NSDate *creationDate;
  NSDate *v15;
  PBFDataStoreArchiveMetadata *v16;
  id v18;
  id v19;
  unint64_t v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PBFDataStoreArchiveMetadata;
  v5 = -[PBFDataStoreArchiveMetadata init](&v21, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    archiveURL = v5->_archiveURL;
    v5->_archiveURL = (NSURL *)v6;

    objc_msgSend(v4, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v20 = 0;
    v18 = 0;
    v9 = _PBFDistillFileNameIntoArchiveComponents(v8, &v20, &v19, &v18);
    v10 = (NSDate *)v19;
    v11 = v18;
    if (!v9)
    {

      v16 = 0;
      goto LABEL_6;
    }
    archiveName = v5->_archiveName;
    v5->_archiveName = (NSString *)v11;
    v13 = v11;

    v5->_version = v20;
    creationDate = v5->_creationDate;
    v5->_creationDate = v10;
    v15 = v10;

  }
  v16 = v5;
LABEL_6:

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  PBFDataStoreArchiveMetadata *v4;
  void *v5;
  char isKindOfClass;
  char v7;

  v4 = (PBFDataStoreArchiveMetadata *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      v7 = -[NSURL isEqual:](v4->_archiveURL, "isEqual:", self->_archiveURL);
    else
      v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSURL hash](self->_archiveURL, "hash");
}

- (unint64_t)version
{
  return self->_version;
}

- (NSString)archiveName
{
  return self->_archiveName;
}

- (NSURL)archiveURL
{
  return self->_archiveURL;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_archiveURL, 0);
  objc_storeStrong((id *)&self->_archiveName, 0);
}

@end
