@implementation _UIArchiveExtractionController

- (_UIArchiveExtractionController)initWithSourceArchivePath:(id)a3 destinationExtractionRootPath:(id)a4
{
  id v7;
  id v8;
  _UIArchiveExtractionController *v9;
  _UIArchiveExtractionController *v10;
  NSString *sourceArchiveExtractionRootPath;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UIArchiveExtractionController;
  v9 = -[_UIArchiveExtractionController init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceArchivePath, a3);
    sourceArchiveExtractionRootPath = v10->_sourceArchiveExtractionRootPath;
    v10->_sourceArchiveExtractionRootPath = (NSString *)CFSTR(".");

    objc_storeStrong((id *)&v10->_destinationExtractionRootPath, a4);
    objc_storeStrong((id *)&v10->_destinationContentProtectionType, (id)*MEMORY[0x1E0CB2AB8]);
  }

  return v10;
}

- (BOOL)extractArchiveContent:(id *)a3
{
  id v5;
  int v6;
  NSArray *v7;
  NSArray *extractedContentAbsolutePaths;

  if (-[_UIArchiveExtractionController _createDestinationRoot:](self, "_createDestinationRoot:"))
  {
    v5 = -[_UILibArchiveStreamingExtractor initForExtractingArchivePath:]([_UILibArchiveStreamingExtractor alloc], "initForExtractingArchivePath:", self->_sourceArchivePath);
    v6 = objc_msgSend(v5, "extractArchivePath:toDirectory:error:", self->_sourceArchiveExtractionRootPath, self->_destinationExtractionRootPath, a3);
    if (v6)
    {
      objc_msgSend(v5, "extractedContentAbsolutePaths");
      v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
      extractedContentAbsolutePaths = self->_extractedContentAbsolutePaths;
      self->_extractedContentAbsolutePaths = v7;

    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (id)extractedContentAbsolutePathsMatchingPredicate:(id)a3
{
  id v4;
  void *v5;
  NSArray *extractedContentAbsolutePaths;
  void *v7;
  NSArray *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = v4;
  extractedContentAbsolutePaths = self->_extractedContentAbsolutePaths;
  if (v4)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __81___UIArchiveExtractionController_extractedContentAbsolutePathsMatchingPredicate___block_invoke;
    v10[3] = &unk_1E16C39F0;
    v11 = v4;
    -[NSArray indexesOfObjectsPassingTest:](extractedContentAbsolutePaths, "indexesOfObjectsPassingTest:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectsAtIndexes:](extractedContentAbsolutePaths, "objectsAtIndexes:", v7);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = extractedContentAbsolutePaths;
  }

  return v8;
}

- (BOOL)_createDestinationRoot:(id *)a3
{
  void *v5;
  NSString *destinationContentProtectionType;
  void *v7;
  int v8;
  NSString *destinationExtractionRootPath;
  char v10;
  id v11;
  void *v12;
  BOOL v13;
  char v14;
  id v15;
  void *v16;
  id v18;
  id v19;
  char v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  destinationContentProtectionType = self->_destinationContentProtectionType;
  v21 = *MEMORY[0x1E0CB2AD8];
  v22[0] = destinationContentProtectionType;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v8 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", self->_destinationExtractionRootPath, &v20);
  destinationExtractionRootPath = self->_destinationExtractionRootPath;
  if (v8)
  {
    v19 = 0;
    v10 = objc_msgSend(v5, "setAttributes:ofItemAtPath:error:", v7, destinationExtractionRootPath, &v19);
    v11 = v19;
    v12 = v11;
    if ((v10 & 1) != 0)
    {
      v13 = 1;
      goto LABEL_8;
    }
    objc_msgSend(v11, "localizedDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Failed setting data protection on extraction root - %@"), v16);
  }
  else
  {
    v18 = 0;
    v13 = 1;
    v14 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", destinationExtractionRootPath, 1, v7, &v18);
    v15 = v18;
    v12 = v15;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    objc_msgSend(v15, "localizedDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Failed to create extraction root - %@"), v16);
  }

  v13 = 0;
LABEL_8:
  if (a3)
    *a3 = objc_retainAutorelease(v12);

  return v13;
}

- (NSString)sourceArchivePath
{
  return self->_sourceArchivePath;
}

- (NSString)destinationExtractionRootPath
{
  return self->_destinationExtractionRootPath;
}

- (void)setDestinationExtractionRootPath:(id)a3
{
  objc_storeStrong((id *)&self->_destinationExtractionRootPath, a3);
}

- (NSString)destinationContentProtectionType
{
  return self->_destinationContentProtectionType;
}

- (void)setDestinationContentProtectionType:(id)a3
{
  objc_storeStrong((id *)&self->_destinationContentProtectionType, a3);
}

- (NSString)sourceArchiveExtractionRootPath
{
  return self->_sourceArchiveExtractionRootPath;
}

- (void)setSourceArchiveExtractionRootPath:(id)a3
{
  objc_storeStrong((id *)&self->_sourceArchiveExtractionRootPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceArchiveExtractionRootPath, 0);
  objc_storeStrong((id *)&self->_destinationContentProtectionType, 0);
  objc_storeStrong((id *)&self->_destinationExtractionRootPath, 0);
  objc_storeStrong((id *)&self->_sourceArchivePath, 0);
  objc_storeStrong((id *)&self->_extractedContentAbsolutePaths, 0);
}

@end
