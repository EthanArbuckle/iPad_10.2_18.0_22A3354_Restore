@implementation UITextMagnifierCaretRenderer

- (id)visualsForMagnifier
{
  void *v2;
  void *v3;
  uint64_t i;
  uint64_t j;
  __CFString *v7;
  const __CFString *v8;
  __CFString *v9;
  const __CFString *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("UITextMagnifierHorizontalHi");
  v14[1] = CFSTR("UITextMagnifierHorizontalMask");
  v14[2] = CFSTR("UITextMagnifierHorizontalLo");
  v11[0] = 0x1E1779060;
  v11[1] = 0x1E1779080;
  v12[0] = CFSTR("kb-loupe-hi.png");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 4.0, 0.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v13[0] = objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("UITextMagnifierFilename");
  v10 = CFSTR("kb-loupe-mask.png");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v13[1] = objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("UITextMagnifierFilename");
  v8 = CFSTR("kb-loupe-lo.png");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v13[2] = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v14, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 2; i != -1; --i)

  for (j = 2; j != -1; --j)
  return v3;
}

@end
