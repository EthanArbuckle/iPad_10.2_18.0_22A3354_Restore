@implementation BRCDatabaseBackupRecord

- (BRCDatabaseBackupRecord)initWithRelativePath:(id)a3 fileID:(id)a4 docID:(id)a5 genCount:(unsigned int)a6 isDirectory:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  BRCDatabaseBackupRecord *v16;
  BRCDatabaseBackupRecord *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BRCDatabaseBackupRecord;
  v16 = -[BRCDatabaseBackupRecord init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_relativePath, a3);
    objc_storeStrong((id *)&v17->_fileID, a4);
    objc_storeStrong((id *)&v17->_docID, a5);
    v17->_genCount = a6;
    v17->_isDirectory = a7;
  }

  return v17;
}

- (BRCDatabaseBackupRecord)initWithPQLResultSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  BRCDatabaseBackupRecord *v10;

  v4 = a3;
  objc_msgSend(v4, "stringAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberAtIndex:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberAtIndex:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "unsignedIntAtIndex:", 3);
  v9 = objc_msgSend(v4, "BOOLAtIndex:", 4);

  v10 = -[BRCDatabaseBackupRecord initWithRelativePath:fileID:docID:genCount:isDirectory:](self, "initWithRelativePath:fileID:docID:genCount:isDirectory:", v5, v6, v7, v8, v9);
  return v10;
}

- (id)description
{
  void *v3;
  const char *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BRCDatabaseBackupRecord;
  -[BRCDatabaseBackupRecord description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = "d";
  if (!self->_isDirectory)
    v4 = "-";
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %s %@ - %@ - %@ - %d"), v3, v4, self->_relativePath, self->_fileID, self->_docID, self->_genCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)relativePath
{
  return self->_relativePath;
}

- (void)setRelativePath:(id)a3
{
  objc_storeStrong((id *)&self->_relativePath, a3);
}

- (NSNumber)fileID
{
  return self->_fileID;
}

- (void)setFileID:(id)a3
{
  objc_storeStrong((id *)&self->_fileID, a3);
}

- (NSNumber)docID
{
  return self->_docID;
}

- (void)setDocID:(id)a3
{
  objc_storeStrong((id *)&self->_docID, a3);
}

- (unsigned)genCount
{
  return self->_genCount;
}

- (void)setGenCount:(unsigned int)a3
{
  self->_genCount = a3;
}

- (BOOL)isDirectory
{
  return self->_isDirectory;
}

- (void)setIsDirectory:(BOOL)a3
{
  self->_isDirectory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_docID, 0);
  objc_storeStrong((id *)&self->_fileID, 0);
  objc_storeStrong((id *)&self->_relativePath, 0);
}

@end
