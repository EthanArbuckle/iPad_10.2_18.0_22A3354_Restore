@implementation UILibArchiveAppleDoublePathSet

void __111___UILibArchiveAppleDoublePathSet_confirmExactAppleDoubleFilesAppearingAfterRealFilesByPrescanningArchivePath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "pathInArchive");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  _appleDoublePathForRealPath_DotUnderscore(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
  {
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    _appleDoublePathForRealPath_DotUnderscore(v3);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v13 = (void *)v7;
    objc_msgSend(v6, "addObject:", v7);

    goto LABEL_13;
  }
  if (!_isPossibleAppleDoublePath_MACOSX(v3))
  {
    if (!_isPossibleAppleDoublePath_DotUnderscore(v3))
      goto LABEL_13;
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
LABEL_11:
    objc_msgSend(v14, "pathInArchive");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  objc_msgSend(v14, "fileType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB2B28]);

  objc_msgSend(v14, "pathInArchive");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("__MACOSX"));

  if ((_isPossibleAppleDoublePath_DotUnderscore(v3) & 1) != 0 || !v9 || (v12 & 1) != 0)
  {
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    goto LABEL_11;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
LABEL_13:

}

@end
