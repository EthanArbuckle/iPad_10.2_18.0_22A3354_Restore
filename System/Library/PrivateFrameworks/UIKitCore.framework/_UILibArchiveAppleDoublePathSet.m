@implementation _UILibArchiveAppleDoublePathSet

- (_UILibArchiveAppleDoublePathSet)init
{
  _UILibArchiveAppleDoublePathSet *v2;
  uint64_t v3;
  NSMutableSet *confirmAppleDoublePaths;
  uint64_t v5;
  NSMutableSet *pathsWithDotUnderscorePrefixedFilenames;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UILibArchiveAppleDoublePathSet;
  v2 = -[_UILibArchiveAppleDoublePathSet init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    confirmAppleDoublePaths = v2->_confirmAppleDoublePaths;
    v2->_confirmAppleDoublePaths = (NSMutableSet *)v3;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    pathsWithDotUnderscorePrefixedFilenames = v2->_pathsWithDotUnderscorePrefixedFilenames;
    v2->_pathsWithDotUnderscorePrefixedFilenames = (NSMutableSet *)v5;

  }
  return v2;
}

- (void)confirmExactAppleDoubleFilesAppearingAfterRealFilesByPrescanningArchivePath:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v4 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v5 = -[_UILibArchiveStreamingReader initForReadingArchivePath:]([_UILibArchiveStreamingReader alloc], "initForReadingArchivePath:", v4);
  objc_msgSend(v5, "setAppleDoubleIdentificationType:", 0);
  objc_msgSend(v5, "open");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __111___UILibArchiveAppleDoublePathSet_confirmExactAppleDoubleFilesAppearingAfterRealFilesByPrescanningArchivePath___block_invoke;
  v6[3] = &unk_1E16C3708;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v5, "readAllItemsWithBlock:error:", v6, 0);
  objc_msgSend(v5, "close");
  if (*((_BYTE *)v8 + 24))
    -[NSMutableSet removeObject:](self->_confirmAppleDoublePaths, "removeObject:", CFSTR("__MACOSX"));

  _Block_object_dispose(&v7, 8);
}

- (void)confirmExactAppleDoubleFilesForItem:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "pathInArchive");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _appleDoublePathForRealPath_DotUnderscore(v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (-[NSMutableSet containsObject:](self->_pathsWithDotUnderscorePrefixedFilenames, "containsObject:", v5))-[NSMutableSet addObject:](self->_confirmAppleDoublePaths, "addObject:", v5);
}

- (id)pathToRealFileIfConfirmedAppleDoubleItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  if (-[_UILibArchiveAppleDoublePathSet isConfirmedExactAppleDoubleItem:](self, "isConfirmedExactAppleDoubleItem:", v4))
  {
    objc_msgSend(v4, "pathInArchive");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("._"));

    if (v8)
    {
      v9 = objc_msgSend(v6, "indexOfObjectPassingTest:", &__block_literal_global_156);
      v10 = (void *)objc_msgSend(v6, "mutableCopy");
      v11 = v10;
      if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v10, "removeObjectAtIndex:", v9);
      objc_msgSend(v11, "lastObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "substringFromIndex:", objc_msgSend(CFSTR("._"), "length"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "removeLastObject");
      objc_msgSend(v11, "addObject:", v13);
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("/"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByStandardizingPath");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)isConfirmedExactAppleDoubleItem:(id)a3
{
  NSMutableSet *confirmAppleDoublePaths;
  void *v4;

  confirmAppleDoublePaths = self->_confirmAppleDoublePaths;
  objc_msgSend(a3, "pathInArchive");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(confirmAppleDoublePaths) = -[NSMutableSet containsObject:](confirmAppleDoublePaths, "containsObject:", v4);

  return (char)confirmAppleDoublePaths;
}

+ (BOOL)isPossibleAppleDoubleByApplyingMatchingHeuristicToItem:(id)a3
{
  void *v3;
  char isPossibleAppleDoublePath_DotUnderscore;

  objc_msgSend(a3, "pathInArchive");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_isPossibleAppleDoublePath_MACOSX(v3) & 1) != 0)
    isPossibleAppleDoublePath_DotUnderscore = 1;
  else
    isPossibleAppleDoublePath_DotUnderscore = _isPossibleAppleDoublePath_DotUnderscore(v3);

  return isPossibleAppleDoublePath_DotUnderscore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathsWithDotUnderscorePrefixedFilenames, 0);
  objc_storeStrong((id *)&self->_confirmAppleDoublePaths, 0);
}

@end
