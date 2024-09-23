@implementation _UILibArchiveStreamingReader

- (id)initForReadingArchivePath:(id)a3
{
  id v5;
  _UILibArchiveStreamingReader *v6;
  _UILibArchiveStreamingReader *v7;
  uint64_t v8;
  NSMutableArray *readableLoadedItemEntryQueue;
  NSString *laArchiveTypeName;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UILibArchiveStreamingReader;
  v6 = -[_UILibArchiveStreamingReader init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_archivePath, a3);
    v7->_state = 0;
    v7->_laProcessingState = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    readableLoadedItemEntryQueue = v7->_readableLoadedItemEntryQueue;
    v7->_readableLoadedItemEntryQueue = (NSMutableArray *)v8;

    v7->_appleDoubleIdentificationType = 1;
    v7->_laArchiveType = -1;
    laArchiveTypeName = v7->_laArchiveTypeName;
    v7->_laArchiveTypeName = (NSString *)CFSTR("** Unknown **");

  }
  return v7;
}

- (BOOL)readAllItemsWithBlock:(id)a3 error:(id *)a4
{
  return -[_UILibArchiveStreamingReader _readItemsWithShouldVisitBlock:visitorBlock:error:](self, "_readItemsWithShouldVisitBlock:visitorBlock:error:", &__block_literal_global_158, a3, a4);
}

- (BOOL)readLogicalItemsWithBlock:(id)a3 error:(id *)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64___UILibArchiveStreamingReader_readLogicalItemsWithBlock_error___block_invoke;
  v5[3] = &unk_1E16C39A0;
  v5[4] = self;
  return -[_UILibArchiveStreamingReader _readItemsWithShouldVisitBlock:visitorBlock:error:](self, "_readItemsWithShouldVisitBlock:visitorBlock:error:", v5, a3, a4);
}

- (BOOL)_readItemsWithShouldVisitBlock:(id)a3 visitorBlock:(id)a4 error:(id *)a5
{
  unsigned int (**v9)(id, void *, void *);
  void (**v10)(id, void *, _BYTE *);
  NSError *readError;
  void *v12;
  void *v13;
  NSError *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  char v21;

  v9 = (unsigned int (**)(id, void *, void *))a3;
  v10 = (void (**)(id, void *, _BYTE *))a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UILibArchiveStreamingReader.m"), 94, CFSTR("Invalid parameter"));

  }
  readError = self->_readError;
  self->_readError = 0;

  v12 = (void *)objc_opt_new();
  v13 = v12;
  if (self->_appleDoubleIdentificationType == 1)
    objc_msgSend(v12, "confirmExactAppleDoubleFilesAppearingAfterRealFilesByPrescanningArchivePath:", self->_archivePath);
  v14 = self->_readError;
  if (!v14)
  {
    v15 = 0;
    do
    {
      v16 = v15;
      -[_UILibArchiveStreamingReader _nextSimpleItemFromPendingQueueOrLibArchiveRead](self, "_nextSimpleItemFromPendingQueueOrLibArchiveRead");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
        break;
      if (self->_appleDoubleIdentificationType == 1)
        objc_msgSend(v13, "confirmExactAppleDoubleFilesForItem:", v15);
      objc_msgSend(v13, "pathToRealFileIfConfirmedAppleDoubleItem:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setPathToAppleDoubleRealFileCounterpart:", v17);

      objc_msgSend(v15, "pathToAppleDoubleRealFileCounterpart");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setIsAppleDoubleFile:", objc_msgSend(v18, "length") != 0);

      if (v9[2](v9, v15, v13))
      {
        v21 = 0;
        v10[2](v10, v15, &v21);
        if (v21)
          break;
      }
    }
    while (!self->_readError);
    v14 = self->_readError;

  }
  if (a5)
  {
    *a5 = objc_retainAutorelease(v14);
    v14 = self->_readError;
  }

  return v14 == 0;
}

- (NSString)openedArchiveUnderlyingFormatName
{
  return self->_laArchiveTypeName;
}

- (BOOL)_shouldReportAsLogicalItem:(id)a3 withConfirmedAppleDoubleFiles:(id)a4
{
  id v6;
  char v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  if (-[_UILibArchiveStreamingReader _shouldReportAsAppleDoubleItem:withConfirmedAppleDoubleFiles:](self, "_shouldReportAsAppleDoubleItem:withConfirmedAppleDoubleFiles:", v6, a4))
  {
    v7 = 0;
  }
  else
  {
    if (qword_1ECD7D700 != -1)
      dispatch_once(&qword_1ECD7D700, &__block_literal_global_22_0);
    v8 = _MergedGlobals_1014;
    objc_msgSend(v6, "pathInArchive");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = objc_msgSend((id)v8, "containsObject:", v9);

    v7 = v8 ^ 1;
  }

  return v7;
}

- (BOOL)_shouldReportAsAppleDoubleItem:(id)a3 withConfirmedAppleDoubleFiles:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t appleDoubleIdentificationType;
  char v10;
  BOOL v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  appleDoubleIdentificationType = self->_appleDoubleIdentificationType;
  if (appleDoubleIdentificationType == 2)
  {
    v10 = +[_UILibArchiveAppleDoublePathSet isPossibleAppleDoubleByApplyingMatchingHeuristicToItem:](_UILibArchiveAppleDoublePathSet, "isPossibleAppleDoubleByApplyingMatchingHeuristicToItem:", v6);
  }
  else
  {
    if (appleDoubleIdentificationType != 1)
    {
      v11 = 0;
      goto LABEL_7;
    }
    v10 = objc_msgSend(v7, "isConfirmedExactAppleDoubleItem:", v6);
  }
  v11 = v10;
LABEL_7:

  return v11;
}

- (BOOL)_openArchive
{
  uint64_t *p_laArchive;
  ui_archive *v5;
  int v6;
  int v7;
  int v8;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *readableLoadedItemEntryQueue;
  NSString *laArchiveTypeName;
  int v13;
  NSString *v14;
  NSString *v15;

  if (self->_state < 1)
  {
    ui_archive_read_new();
    self->_laArchive = v5;
    p_laArchive = (uint64_t *)&self->_laArchive;
    self->_laProcessingState = 0;
    self->_state = 1;
    if (v5)
    {
      ui_archive_read_support_compression_all((uint64_t)v5);
      if (v6 || (ui_archive_read_support_format_all(*p_laArchive), v7))
        -[_UILibArchiveStreamingReader _closeArchive](self, "_closeArchive");
      if (*p_laArchive)
      {
        ui_archive_read_open_filename(*p_laArchive, self->_archivePath, 0x2000);
        if (v8)
          -[_UILibArchiveStreamingReader _closeArchive](self, "_closeArchive");
        if (*p_laArchive)
        {
          -[_UILibArchiveStreamingReader _nextSimpleItemFromPendingQueueOrLibArchiveRead](self, "_nextSimpleItemFromPendingQueueOrLibArchiveRead");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v9);
            v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
            readableLoadedItemEntryQueue = self->_readableLoadedItemEntryQueue;
            self->_readableLoadedItemEntryQueue = v10;

          }
          if (self->_readError)
          {
            self->_laArchiveType = -1;
            laArchiveTypeName = self->_laArchiveTypeName;
            self->_laArchiveTypeName = (NSString *)CFSTR("** Invalid **");

            -[_UILibArchiveStreamingReader _closeArchive](self, "_closeArchive");
          }
          else
          {
            ui_archive_format((uint64_t)self->_laArchive);
            self->_laArchiveType = v13;
            ui_archive_format_name((uint64_t)self->_laArchive);
            v14 = (NSString *)objc_claimAutoreleasedReturnValue();
            v15 = self->_laArchiveTypeName;
            self->_laArchiveTypeName = v14;

          }
        }
      }
    }
  }
  else
  {
    p_laArchive = (uint64_t *)&self->_laArchive;
  }
  return *p_laArchive != 0;
}

- (void)_closeArchive
{
  ui_archive *laArchive;

  laArchive = self->_laArchive;
  if (laArchive)
  {
    ui_archive_read_close((uint64_t)laArchive);
    ui_archive_read_finish((uint64_t)self->_laArchive);
    self->_laProcessingState = 1;
    self->_state = 2;
    self->_laArchive = 0;
  }
}

- (id)_nextSimpleItemFromPendingQueueOrLibArchiveRead
{
  void *v3;
  id v4;
  void *v5;
  int v7;
  NSError *v8;
  NSError *readError;
  uint64_t v10;

  -[NSMutableArray firstObject](self->_readableLoadedItemEntryQueue, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (!self->_laProcessingState)
    {
      v10 = 0;
      ui_archive_read_next_header((uint64_t)self->_laArchive, (uint64_t)&v10);
      self->_laProcessingState = v7;
      if (!v7)
      {
        -[_UILibArchiveStreamingReader _loadItemByReadingAttributesFromUnderlyingArchiveEntry:](self, "_loadItemByReadingAttributesFromUnderlyingArchiveEntry:", v10);
        v4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      }
      if (v7 != 1)
      {
        ui_archive_error((uint64_t)self->_laArchive, CFSTR("_UIArchiveExtractorErrorDomain"), v7, CFSTR("Unable to read archive header"));
        v8 = (NSError *)objc_claimAutoreleasedReturnValue();
        readError = self->_readError;
        self->_readError = v8;

      }
    }
    v5 = 0;
    goto LABEL_6;
  }
  -[NSMutableArray removeObjectAtIndex:](self->_readableLoadedItemEntryQueue, "removeObjectAtIndex:", 0);
  v4 = v3;
LABEL_3:
  v5 = v4;
LABEL_6:

  return v5;
}

- (id)_loadItemByReadingAttributesFromUnderlyingArchiveEntry:(ui_archive_entry *)a3
{
  void *v4;

  +[_UILibArchiveItem itemByReadingAttributesFromUnderlyingArchiveEntry:archive:](_UILibArchiveReaderLoadedItem, "itemByReadingAttributesFromUnderlyingArchiveEntry:archive:", a3, self->_laArchive);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSequenceIndex:", self->_nextLoadedItemEntrySequenceIndex++);
  return v4;
}

- (id)_debugLoadAndPrintAllRemainingItems
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v3 = -[_UILibArchiveStreamingReader initForReadingArchivePath:]([_UILibArchiveStreamingReader alloc], "initForReadingArchivePath:", self->_archivePath);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "open");
  objc_msgSend(v3, "_nextSimpleItemFromPendingQueueOrLibArchiveRead");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      if (objc_msgSend(v6, "sequenceIndex") >= self->_nextLoadedItemEntrySequenceIndex)
        objc_msgSend(v4, "addObject:", v6);
      objc_msgSend(v3, "_nextSimpleItemFromPendingQueueOrLibArchiveRead");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    while (v7);
  }
  objc_msgSend(v3, "close");
  NSLog(CFSTR("remainingItems: %@"), 0);

  return v4;
}

- (NSString)archivePath
{
  return self->_archivePath;
}

- (ui_archive)underlyingArchive
{
  return self->_underlyingArchive;
}

- (int64_t)appleDoubleIdentificationType
{
  return self->_appleDoubleIdentificationType;
}

- (void)setAppleDoubleIdentificationType:(int64_t)a3
{
  self->_appleDoubleIdentificationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archivePath, 0);
  objc_storeStrong((id *)&self->_readError, 0);
  objc_storeStrong((id *)&self->_readableLoadedItemEntryQueue, 0);
  objc_storeStrong((id *)&self->_laArchiveTypeName, 0);
}

@end
