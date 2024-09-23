@implementation WBSReaderFont(SafariSharedUI)

- (uint64_t)isReadyToUse
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "familyNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "familyName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "containsObject:", v3) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(a1, "isInstalled");

  return v4;
}

- (void)isInstalledWithCompletionHandler:()SafariSharedUI
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const __CTFontDescriptor *v8;
  id v9;
  uint64_t v10;
  CFArrayRef MatchingFontDescriptors;
  const __CFArray *v12;
  _QWORD progressBlock[4];
  id v14;
  _QWORD *v15;
  _QWORD v16[3];
  char v17;
  _QWORD v18[5];
  const __CTFontDescriptor *v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20[0] = *MEMORY[0x1E0CA8300];
  objc_msgSend(a1, "familyName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CA82D8];
  v21[0] = v5;
  v21[1] = MEMORY[0x1E0C9AAB0];
  v7 = *MEMORY[0x1E0CA82E0];
  v20[1] = v6;
  v20[2] = v7;
  v21[2] = MEMORY[0x1E0C9AAB0];
  v8 = CTFontDescriptorCreateWithAttributes((CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3));

  v9 = objc_alloc_init(MEMORY[0x1E0D8A1C8]);
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __66__WBSReaderFont_SafariSharedUI__isInstalledWithCompletionHandler___block_invoke;
  v18[3] = &__block_descriptor_40_e5_v8__0l;
  v18[4] = v8;
  objc_msgSend(v9, "setHandler:", v18);
  MatchingFontDescriptors = CTFontDescriptorCreateMatchingFontDescriptors(v8, 0);
  if (-[__CFArray count](MatchingFontDescriptors, "count"))
  {
    v19 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
    v12 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    v17 = 0;
    progressBlock[0] = v10;
    progressBlock[1] = 3221225472;
    progressBlock[2] = __66__WBSReaderFont_SafariSharedUI__isInstalledWithCompletionHandler___block_invoke_2;
    progressBlock[3] = &unk_1E5447F78;
    v15 = v16;
    v14 = v4;
    CTFontDescriptorMatchFontDescriptorsWithProgressHandler(v12, 0, progressBlock);

    _Block_object_dispose(v16, 8);
  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (id)fontOfSize:()SafariSharedUI
{
  void *v2;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = objc_msgSend(a1, "type");
  switch(v5)
  {
    case 2:
      objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fontDescriptor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fontDescriptorWithDesign:", *MEMORY[0x1E0CEB500]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v9, a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    case 1:
      objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      return v2;
    case 0:
      v6 = (void *)MEMORY[0x1E0CEA5E8];
      objc_msgSend(a1, "familyName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fontWithName:size:", v7, a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

      break;
  }
  return v2;
}

@end
