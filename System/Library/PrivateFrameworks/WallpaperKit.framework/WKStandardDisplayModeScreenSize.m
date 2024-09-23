@implementation WKStandardDisplayModeScreenSize

void __WKStandardDisplayModeScreenSize_block_invoke()
{
  void *v0;
  void *v1;
  float v2;
  float v3;
  double v4;
  void *v5;
  float v6;
  float v7;
  double v8;
  void *v9;
  int v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v19 = (id)MGCopyAnswer();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("default"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "count") == 4)
  {
    objc_msgSend(v0, "objectAtIndexedSubscript:", 1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "floatValue");
    v3 = v2;
    v4 = v2;

    objc_msgSend(v0, "objectAtIndexedSubscript:", 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v7 = v6;
    v8 = v6;

    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "sf_isiPad");
    v11 = v3 > v7;

    if ((v10 & v11) != 0)
      *(double *)&v12 = v4;
    else
      *(double *)&v12 = v8;
    if ((v10 & v11) != 0)
      *(double *)&v13 = v8;
    else
      *(double *)&v13 = v4;
    WKStandardDisplayModeScreenSize_standardDisplayModeScreenSize_0 = v13;
    WKStandardDisplayModeScreenSize_standardDisplayModeScreenSize_1 = v12;
  }
  else
  {
    v13 = WKStandardDisplayModeScreenSize_standardDisplayModeScreenSize_0;
    v12 = WKStandardDisplayModeScreenSize_standardDisplayModeScreenSize_1;
  }
  if (*(double *)&v13 == *MEMORY[0x1E0C9D820] && *(double *)&v12 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen", *(double *)&v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fixedCoordinateSpace");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    WKStandardDisplayModeScreenSize_standardDisplayModeScreenSize_0 = v17;
    WKStandardDisplayModeScreenSize_standardDisplayModeScreenSize_1 = v18;

  }
}

@end
