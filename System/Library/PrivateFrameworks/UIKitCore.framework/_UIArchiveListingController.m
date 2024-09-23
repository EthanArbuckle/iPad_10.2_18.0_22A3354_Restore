@implementation _UIArchiveListingController

- (_UIArchiveListingController)initWithArchivePath:(id)a3
{
  id v5;
  _UIArchiveListingController *v6;
  _UIArchiveListingController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIArchiveListingController;
  v6 = -[_UIArchiveListingController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_archivePath, a3);
    v7->_appleDoubleIdentificationType = 1;
    v7->_excludeDotFilesFromResults = 0;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[_UILibArchiveStreamingReader close](self->_archiveReader, "close");
  v3.receiver = self;
  v3.super_class = (Class)_UIArchiveListingController;
  -[_UIArchiveListingController dealloc](&v3, sel_dealloc);
}

- (BOOL)determineIsReadableArchive
{
  BOOL result;
  _UILibArchiveStreamingReader *v4;
  _UILibArchiveStreamingReader *archiveReader;

  if (self->_archiveReader)
    return self->_isValidArchive;
  v4 = -[_UILibArchiveStreamingReader initForReadingArchivePath:]([_UILibArchiveStreamingReader alloc], "initForReadingArchivePath:", self->_archivePath);
  archiveReader = self->_archiveReader;
  self->_archiveReader = v4;

  result = -[_UILibArchiveStreamingReader open](self->_archiveReader, "open");
  self->_isValidArchive = result;
  return result;
}

- (BOOL)enumerateLogicalItemsWithBlock:(id)a3 error:(id *)a4
{
  id v6;
  _UILibArchiveStreamingReader *archiveReader;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _UILibArchiveStreamingReader *v12;
  id v14;
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[_UIArchiveListingController determineIsReadableArchive](self, "determineIsReadableArchive"))
  {
    -[_UILibArchiveStreamingReader setAppleDoubleIdentificationType:](self->_archiveReader, "setAppleDoubleIdentificationType:", -[_UIArchiveListingController appleDoubleIdentificationType](self, "appleDoubleIdentificationType"));
    archiveReader = self->_archiveReader;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __68___UIArchiveListingController_enumerateLogicalItemsWithBlock_error___block_invoke;
    v15[3] = &unk_1E16C39C8;
    v15[4] = self;
    v16 = v6;
    v14 = 0;
    -[_UILibArchiveStreamingReader readLogicalItemsWithBlock:error:](archiveReader, "readLogicalItemsWithBlock:error:", v15, &v14);
    v8 = v14;
    -[_UILibArchiveStreamingReader close](self->_archiveReader, "close");

    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  v9 = (void *)MEMORY[0x1E0CB35C8];
  v17 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to open %@ for reading"), self->_archivePath);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("_UIArchiveReaderErrorDomain"), -1, v11);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (a4)
LABEL_5:
    *a4 = objc_retainAutorelease(v8);
LABEL_6:
  v12 = self->_archiveReader;
  self->_archiveReader = 0;

  return v8 == 0;
}

- (BOOL)_shouldVisitItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  int v8;

  v4 = a3;
  if (-[_UIArchiveListingController excludeDotFilesFromResults](self, "excludeDotFilesFromResults"))
  {
    objc_msgSend(v4, "pathInArchive");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasPrefix:", CFSTR("."));

    if ((v7 & 1) != 0 || (objc_msgSend(v5, "hasPrefix:", CFSTR(".")) & 1) != 0)
      LOBYTE(v8) = 0;
    else
      v8 = objc_msgSend(v5, "containsString:", CFSTR("/.")) ^ 1;

  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (NSString)archivePath
{
  return self->_archivePath;
}

- (int64_t)appleDoubleIdentificationType
{
  return self->_appleDoubleIdentificationType;
}

- (void)setAppleDoubleIdentificationType:(int64_t)a3
{
  self->_appleDoubleIdentificationType = a3;
}

- (BOOL)excludeDotFilesFromResults
{
  return self->_excludeDotFilesFromResults;
}

- (void)setExcludeDotFilesFromResults:(BOOL)a3
{
  self->_excludeDotFilesFromResults = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archivePath, 0);
  objc_storeStrong((id *)&self->_archiveReader, 0);
}

@end
