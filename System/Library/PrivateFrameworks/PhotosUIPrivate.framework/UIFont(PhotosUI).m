@implementation UIFont(PhotosUI)

- (id)pu_fontWithMonospacedNumbers
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fontDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0DC1380];
  v3 = *MEMORY[0x1E0DC13D0];
  v11[0] = *MEMORY[0x1E0DC13D8];
  v11[1] = v3;
  v12[0] = &unk_1E59BC480;
  v12[1] = &unk_1E59BC498;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorByAddingAttributes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(a1, "pointSize");
  objc_msgSend(v8, "fontWithDescriptor:size:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (double)pu_scaledValue:()PhotosUI usingFontOfAttributedString:
{
  id v5;
  void *v6;
  double v7;
  BOOL v8;
  void *v9;
  double v10;
  double v11;

  v5 = a4;
  v6 = v5;
  v7 = 0.0;
  v8 = a1 == 0.0 || v5 == 0;
  if (!v8 && objc_msgSend(v5, "length"))
  {
    objc_msgSend(v6, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1138], 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_scaledValueForValue:", a1);
    v11 = v10;
    if (PUMainScreenScale_onceToken != -1)
      dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
    v7 = round(*(double *)&PUMainScreenScale_screenScale * v11) / *(double *)&PUMainScreenScale_screenScale;

  }
  return v7;
}

@end
