@implementation PXStoryTVWatchNextCellSpec

- (id)memoryTitleFont
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[3];
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12 = *MEMORY[0x1E0DC13C0];
  v10[0] = *MEMORY[0x1E0DC1478];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CA8510]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v10[1] = *MEMORY[0x1E0DC1458];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1420]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = *MEMORY[0x1E0DC1408];
  v4 = *MEMORY[0x1E0DC1398];
  v11[1] = v3;
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC1358]), "initWithFontAttributes:", v6);
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v7, 34.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (double)memoryTitleLeading
{
  return 32.0;
}

- (double)memoryTitleTracking
{
  return 1.37;
}

- (id)memorySubtitleFont
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[3];
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12 = *MEMORY[0x1E0DC13C0];
  v10[0] = *MEMORY[0x1E0DC1478];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CA8530]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v10[1] = *MEMORY[0x1E0DC1458];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1438]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = *MEMORY[0x1E0DC1408];
  v4 = *MEMORY[0x1E0DC1398];
  v11[1] = v3;
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC1358]), "initWithFontAttributes:", v6);
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v7, 17.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (double)memorySubtitleLeading
{
  return 0.0;
}

- (double)memorySubtitleTracking
{
  return 2.0;
}

@end
