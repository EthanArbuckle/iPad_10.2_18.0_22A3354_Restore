@implementation UITextMagnifierRangedRenderer

- (id)visualsForMagnifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v8;
  const __CFString *v9;
  __CFString *v10;
  const __CFString *v11;
  __CFString *v12;
  const __CFString *v13;
  __CFString *v14;
  const __CFString *v15;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v14 = CFSTR("UITextMagnifierFilename");
  v15 = CFSTR("RangedMagnifierMask_Horizontal_Normal.png");
  v16[0] = 0x1E1778FE0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v2;
  v16[1] = 0x1E1778FA0;
  v12 = CFSTR("UITextMagnifierFilename");
  v13 = CFSTR("RangedMagnifierGlass_Horizontal_Normal.png");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v3;
  v16[2] = 0x1E1779040;
  v10 = CFSTR("UITextMagnifierFilename");
  v11 = CFSTR("RangedMagnifierMask_Vertical_Normal.png");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v4;
  v16[3] = 0x1E1779000;
  v8 = CFSTR("UITextMagnifierFilename");
  v9 = CFSTR("RangedMagnifierGlass_Vertical_Normal.png");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
