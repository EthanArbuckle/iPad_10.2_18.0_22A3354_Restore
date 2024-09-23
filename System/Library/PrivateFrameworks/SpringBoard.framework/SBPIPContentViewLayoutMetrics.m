@implementation SBPIPContentViewLayoutMetrics

+ (void)videoContentLandscapeSizePreferences:(id *)a3 portraitSizePreferences:(id *)a4 squareSizePreferences:(id *)a5
{
  char IsMoreSpace;
  _QWORD block[4];
  char v10;

  SBHScreenTypeForCurrentDevice();
  IsMoreSpace = SBHScreenTypeIsMoreSpace();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __125__SBPIPContentViewLayoutMetrics_Pegasus__videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v10 = IsMoreSpace;
  if (videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences__onceToken == -1)
  {
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences__onceToken, block);
  if (a3)
LABEL_3:
    *a3 = objc_retainAutorelease((id)videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref);
LABEL_4:
  if (a4)
    *a4 = objc_retainAutorelease((id)videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____portraitPIPSizePref);
  if (a5)
    *a5 = objc_retainAutorelease((id)videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____squarePIPSizePref);
}

void __125__SBPIPContentViewLayoutMetrics_Pegasus__videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences___block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  uint64_t v4;
  int v5;
  char v6;
  SBPIPContentViewLayoutSizePreferences *v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  SBPIPContentViewLayoutSizePreferences *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  SBPIPContentViewLayoutSizePreferences *v17;
  double v18;
  double v19;
  int v20;
  char v21;
  double v22;
  double v23;
  double v24;
  double v25;
  SBPIPContentViewLayoutSizePreferences *v26;
  void *v27;
  SBPIPContentViewLayoutSizePreferences *v28;
  void *v29;
  SBPIPContentViewLayoutSizePreferences *v30;
  double v31;
  SBPIPContentViewLayoutSizePreferences *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    v7 = [SBPIPContentViewLayoutSizePreferences alloc];
    if (_SBHalfPortraitScreenWidthMinusPadding_onceToken != -1)
      dispatch_once(&_SBHalfPortraitScreenWidthMinusPadding_onceToken, &__block_literal_global_29);
    v8 = *(double *)&_SBHalfPortraitScreenWidthMinusPadding___size;
    if (_SBThreeFourthsPortraitScreenWidthMinusPadding_onceToken != -1)
      dispatch_once(&_SBThreeFourthsPortraitScreenWidthMinusPadding_onceToken, &__block_literal_global_26_0);
    v9 = *(double *)&_SBThreeFourthsPortraitScreenWidthMinusPadding___size;
    if (_SBPortraitScreenWidthMinusPadding_onceToken != -1)
      dispatch_once(&_SBPortraitScreenWidthMinusPadding_onceToken, &__block_literal_global_27);
    v10 = -[SBPIPContentViewLayoutSizePreferences initWithLongSideMinimumSize:longSideDefaultSize:longSideMaximumSize:shortSideMinimumSize:](v7, "initWithLongSideMinimumSize:longSideDefaultSize:longSideMaximumSize:shortSideMinimumSize:", v8, v9, *(double *)&_SBPortraitScreenWidthMinusPadding___size, 96.0);
    v11 = (void *)videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref;
    videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref = v10;

    v12 = [SBPIPContentViewLayoutSizePreferences alloc];
    if (_SBFiveEighthsPortraitScreenWidthMinusPadding_onceToken != -1)
      dispatch_once(&_SBFiveEighthsPortraitScreenWidthMinusPadding_onceToken, &__block_literal_global_28_0);
    v13 = _SBFiveEighthsPortraitScreenWidthMinusPadding___size;
    if (_SBSevenEighthsPortraitScreenWidthMinusPadding_onceToken != -1)
      dispatch_once(&_SBSevenEighthsPortraitScreenWidthMinusPadding_onceToken, &__block_literal_global_29_0);
    v14 = _SBSevenEighthsPortraitScreenWidthMinusPadding___size;
    if (_SBPortraitScreenWidthMinusPadding_onceToken != -1)
      dispatch_once(&_SBPortraitScreenWidthMinusPadding_onceToken, &__block_literal_global_27);
    v15 = *(double *)&_SBPortraitScreenWidthMinusPadding___size;
    v16 = 96.0;
    v17 = v12;
    v18 = *(double *)&v13;
    v19 = *(double *)&v14;
    goto LABEL_30;
  }
  v5 = __sb__runningInSpringBoard();
  v6 = v5;
  if (v5)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_29;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v4, "userInterfaceIdiom") != 1)
    {

LABEL_29:
      v31 = dbl_1D0E887C0[*(_BYTE *)(a1 + 32) == 0];
      v32 = -[SBPIPContentViewLayoutSizePreferences initWithLongSideMinimumSize:longSideDefaultSize:longSideMaximumSize:shortSideMinimumSize:]([SBPIPContentViewLayoutSizePreferences alloc], "initWithLongSideMinimumSize:longSideDefaultSize:longSideMaximumSize:shortSideMinimumSize:", 220.0, 335.0, v31, 136.0);
      v33 = (void *)videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref;
      videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref = (uint64_t)v32;

      v17 = [SBPIPContentViewLayoutSizePreferences alloc];
      v19 = 400.0;
      v18 = 335.0;
      v15 = v31;
      v16 = 136.0;
LABEL_30:
      v34 = -[SBPIPContentViewLayoutSizePreferences initWithLongSideMinimumSize:longSideDefaultSize:longSideMaximumSize:shortSideMinimumSize:](v17, "initWithLongSideMinimumSize:longSideDefaultSize:longSideMaximumSize:shortSideMinimumSize:", v18, v19, v15, v16);
      v35 = (void *)videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____portraitPIPSizePref;
      videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____portraitPIPSizePref = v34;

      v30 = (SBPIPContentViewLayoutSizePreferences *)(id)videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref;
      goto LABEL_31;
    }
  }
  v20 = __sb__runningInSpringBoard();
  v21 = v20;
  if (v20)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v23 = v22;
  v24 = *(double *)(MEMORY[0x1E0DAB260] + 264);
  if ((v21 & 1) == 0)

  if ((v6 & 1) == 0)
  if (v23 < v24)
    goto LABEL_29;
  v25 = dbl_1D0E887D0[*(_BYTE *)(a1 + 32) == 0];
  v26 = -[SBPIPContentViewLayoutSizePreferences initWithLongSideMinimumSize:longSideDefaultSize:longSideMaximumSize:shortSideMinimumSize:]([SBPIPContentViewLayoutSizePreferences alloc], "initWithLongSideMinimumSize:longSideDefaultSize:longSideMaximumSize:shortSideMinimumSize:", 280.0, 400.0, v25, 136.0);
  v27 = (void *)videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref;
  videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref = (uint64_t)v26;

  v28 = -[SBPIPContentViewLayoutSizePreferences initWithLongSideMinimumSize:longSideDefaultSize:longSideMaximumSize:shortSideMinimumSize:]([SBPIPContentViewLayoutSizePreferences alloc], "initWithLongSideMinimumSize:longSideDefaultSize:longSideMaximumSize:shortSideMinimumSize:", 400.0, 467.0, v25, 136.0);
  v29 = (void *)videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____portraitPIPSizePref;
  videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____portraitPIPSizePref = (uint64_t)v28;

  v30 = -[SBPIPContentViewLayoutSizePreferences initWithLongSideMinimumSize:longSideDefaultSize:longSideMaximumSize:shortSideMinimumSize:]([SBPIPContentViewLayoutSizePreferences alloc], "initWithLongSideMinimumSize:longSideDefaultSize:longSideMaximumSize:shortSideMinimumSize:", 220.0, 335.0, v25, 136.0);
LABEL_31:
  v36 = (void *)videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____squarePIPSizePref;
  videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____squarePIPSizePref = (uint64_t)v30;

}

+ (void)videoCallLandscapeSizePreferences:(id *)a3 portraitSizePreferences:(id *)a4 squareSizePreferences:(id *)a5
{
  char IsMoreSpace;
  _QWORD block[4];
  char v10;

  SBHScreenTypeForCurrentDevice();
  IsMoreSpace = SBHScreenTypeIsMoreSpace();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __122__SBPIPContentViewLayoutMetrics_Pegasus__videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v10 = IsMoreSpace;
  if (videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences__onceToken == -1)
  {
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences__onceToken, block);
  if (a3)
LABEL_3:
    *a3 = objc_retainAutorelease((id)videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref);
LABEL_4:
  if (a4)
    *a4 = objc_retainAutorelease((id)videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____portraitPIPSizePref);
  if (a5)
    *a5 = objc_retainAutorelease((id)videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____squarePIPSizePref);
}

void __122__SBPIPContentViewLayoutMetrics_Pegasus__videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences___block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  uint64_t v4;
  int v5;
  char v6;
  SBPIPContentViewLayoutSizePreferences *v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  SBPIPContentViewLayoutSizePreferences *v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  SBPIPContentViewLayoutSizePreferences *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  SBPIPContentViewLayoutSizePreferences *v22;
  double v23;
  double v24;
  int v25;
  char v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  SBPIPContentViewLayoutSizePreferences *v33;
  void *v34;
  SBPIPContentViewLayoutSizePreferences *v35;
  void *v36;
  double v37;
  double v38;
  SBPIPContentViewLayoutSizePreferences *v39;
  void *v40;
  SBPIPContentViewLayoutSizePreferences *v41;
  void *v42;
  uint64_t v43;
  void *v44;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v5 = __sb__runningInSpringBoard();
    v6 = v5;
    if (v5)
    {
      if (SBFEffectiveDeviceClass() != 2)
        goto LABEL_38;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v4 = objc_claimAutoreleasedReturnValue();
      if (objc_msgSend((id)v4, "userInterfaceIdiom") != 1)
      {

        goto LABEL_38;
      }
    }
    v25 = __sb__runningInSpringBoard();
    v26 = v25;
    if (v25)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "_referenceBounds");
    }
    BSSizeRoundForScale();
    v28 = v27;
    v29 = *(double *)(MEMORY[0x1E0DAB260] + 264);
    if ((v26 & 1) == 0)

    if ((v6 & 1) == 0)
    if (v28 >= v29)
    {
      if (*(_BYTE *)(a1 + 32))
        v30 = 464.0;
      else
        v30 = 400.0;
      v31 = dbl_1D0E887E0[*(_BYTE *)(a1 + 32) == 0];
      *(double *)&v32 = 220.0;
      v33 = -[SBPIPContentViewLayoutSizePreferences initWithLongSideMinimumSize:longSideDefaultSize:longSideMaximumSize:shortSideMinimumSize:]([SBPIPContentViewLayoutSizePreferences alloc], "initWithLongSideMinimumSize:longSideDefaultSize:longSideMaximumSize:shortSideMinimumSize:", 220.0, 280.0, dbl_1D0E887C0[*(_BYTE *)(a1 + 32) == 0], 136.0);
      v34 = (void *)videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref;
      videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref = (uint64_t)v33;

      v35 = -[SBPIPContentViewLayoutSizePreferences initWithLongSideMinimumSize:longSideDefaultSize:longSideMaximumSize:shortSideMinimumSize:]([SBPIPContentViewLayoutSizePreferences alloc], "initWithLongSideMinimumSize:longSideDefaultSize:longSideMaximumSize:shortSideMinimumSize:", 220.0, 280.0, v30, 136.0);
      v36 = (void *)videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____portraitPIPSizePref;
      videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____portraitPIPSizePref = (uint64_t)v35;

      v22 = [SBPIPContentViewLayoutSizePreferences alloc];
      v23 = 160.0;
      goto LABEL_42;
    }
LABEL_38:
    if (*(_BYTE *)(a1 + 32))
      v37 = 464.0;
    else
      v37 = 400.0;
    v38 = dbl_1D0E887E0[*(_BYTE *)(a1 + 32) == 0];
    v31 = dbl_1D0E887F0[*(_BYTE *)(a1 + 32) == 0];
    *(double *)&v32 = 160.0;
    v39 = -[SBPIPContentViewLayoutSizePreferences initWithLongSideMinimumSize:longSideDefaultSize:longSideMaximumSize:shortSideMinimumSize:]([SBPIPContentViewLayoutSizePreferences alloc], "initWithLongSideMinimumSize:longSideDefaultSize:longSideMaximumSize:shortSideMinimumSize:", 160.0, 220.0, v37, 136.0);
    v40 = (void *)videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref;
    videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref = (uint64_t)v39;

    v41 = -[SBPIPContentViewLayoutSizePreferences initWithLongSideMinimumSize:longSideDefaultSize:longSideMaximumSize:shortSideMinimumSize:]([SBPIPContentViewLayoutSizePreferences alloc], "initWithLongSideMinimumSize:longSideDefaultSize:longSideMaximumSize:shortSideMinimumSize:", 160.0, 220.0, v38, 136.0);
    v42 = (void *)videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____portraitPIPSizePref;
    videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____portraitPIPSizePref = (uint64_t)v41;

    v22 = [SBPIPContentViewLayoutSizePreferences alloc];
    v23 = 160.0;
LABEL_42:
    v24 = *(double *)&v32;
    v20 = v31;
    v21 = 136.0;
    goto LABEL_43;
  }
  v7 = [SBPIPContentViewLayoutSizePreferences alloc];
  if (_SBHalfPortraitScreenWidthMinusPadding_onceToken != -1)
    dispatch_once(&_SBHalfPortraitScreenWidthMinusPadding_onceToken, &__block_literal_global_29);
  v8 = *(double *)&_SBHalfPortraitScreenWidthMinusPadding___size;
  if (_SBFiveEighthsPortraitScreenWidthMinusPadding_onceToken != -1)
    dispatch_once(&_SBFiveEighthsPortraitScreenWidthMinusPadding_onceToken, &__block_literal_global_28_0);
  v9 = *(double *)&_SBFiveEighthsPortraitScreenWidthMinusPadding___size;
  if (_SBPortraitScreenWidthMinusPadding_onceToken != -1)
    dispatch_once(&_SBPortraitScreenWidthMinusPadding_onceToken, &__block_literal_global_27);
  v10 = -[SBPIPContentViewLayoutSizePreferences initWithLongSideMinimumSize:longSideDefaultSize:longSideMaximumSize:shortSideMinimumSize:](v7, "initWithLongSideMinimumSize:longSideDefaultSize:longSideMaximumSize:shortSideMinimumSize:", v8, v9, *(double *)&_SBPortraitScreenWidthMinusPadding___size, 96.0);
  v11 = (void *)videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref;
  videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref = v10;

  v12 = [SBPIPContentViewLayoutSizePreferences alloc];
  if (_SBHalfPortraitScreenWidthMinusPadding_onceToken != -1)
    dispatch_once(&_SBHalfPortraitScreenWidthMinusPadding_onceToken, &__block_literal_global_29);
  v13 = *(double *)&_SBHalfPortraitScreenWidthMinusPadding___size;
  if (_SBThreeFourthsPortraitScreenWidthMinusPadding_onceToken != -1)
    dispatch_once(&_SBThreeFourthsPortraitScreenWidthMinusPadding_onceToken, &__block_literal_global_26_0);
  v14 = *(double *)&_SBThreeFourthsPortraitScreenWidthMinusPadding___size;
  if (_SBSevenEighthsPortraitScreenWidthMinusPadding_onceToken != -1)
    dispatch_once(&_SBSevenEighthsPortraitScreenWidthMinusPadding_onceToken, &__block_literal_global_29_0);
  v15 = -[SBPIPContentViewLayoutSizePreferences initWithLongSideMinimumSize:longSideDefaultSize:longSideMaximumSize:shortSideMinimumSize:](v12, "initWithLongSideMinimumSize:longSideDefaultSize:longSideMaximumSize:shortSideMinimumSize:", v13, v14, *(double *)&_SBSevenEighthsPortraitScreenWidthMinusPadding___size, 96.0);
  v16 = (void *)videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____portraitPIPSizePref;
  videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____portraitPIPSizePref = v15;

  v17 = [SBPIPContentViewLayoutSizePreferences alloc];
  if (_SBSeventeenFiftiethsScreenWidthMinusPadding_onceToken != -1)
    dispatch_once(&_SBSeventeenFiftiethsScreenWidthMinusPadding_onceToken, &__block_literal_global_30);
  v18 = _SBSeventeenFiftiethsScreenWidthMinusPadding___size;
  if (_SBHalfPortraitScreenWidthMinusPadding_onceToken != -1)
    dispatch_once(&_SBHalfPortraitScreenWidthMinusPadding_onceToken, &__block_literal_global_29);
  v19 = _SBHalfPortraitScreenWidthMinusPadding___size;
  if (_SBThreeFourthsPortraitScreenWidthMinusPadding_onceToken != -1)
    dispatch_once(&_SBThreeFourthsPortraitScreenWidthMinusPadding_onceToken, &__block_literal_global_26_0);
  v20 = *(double *)&_SBThreeFourthsPortraitScreenWidthMinusPadding___size;
  v21 = 96.0;
  v22 = v17;
  v23 = *(double *)&v18;
  v24 = *(double *)&v19;
LABEL_43:
  v43 = -[SBPIPContentViewLayoutSizePreferences initWithLongSideMinimumSize:longSideDefaultSize:longSideMaximumSize:shortSideMinimumSize:](v22, "initWithLongSideMinimumSize:longSideDefaultSize:longSideMaximumSize:shortSideMinimumSize:", v23, v24, v20, v21);
  v44 = (void *)videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____squarePIPSizePref;
  videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____squarePIPSizePref = v43;

}

+ (void)microPIPLandscapeSizePreferences:(id *)a3 portraitSizePreferences:(id *)a4 squareSizePreferences:(id *)a5
{
  char IsMoreSpace;
  _QWORD block[4];
  char v10;

  SBHScreenTypeForCurrentDevice();
  IsMoreSpace = SBHScreenTypeIsMoreSpace();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __121__SBPIPContentViewLayoutMetrics_Pegasus__microPIPLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v10 = IsMoreSpace;
  if (microPIPLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences__onceToken == -1)
  {
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&microPIPLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences__onceToken, block);
  if (a3)
LABEL_3:
    *a3 = objc_retainAutorelease((id)microPIPLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref);
LABEL_4:
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
}

void __121__SBPIPContentViewLayoutMetrics_Pegasus__microPIPLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences___block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  uint64_t v4;
  int v5;
  char v6;
  SBPIPContentViewLayoutSizePreferences *v7;
  double v8;
  int v9;
  char v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    v7 = [SBPIPContentViewLayoutSizePreferences alloc];
    v8 = 66.0;
    goto LABEL_21;
  }
  v5 = __sb__runningInSpringBoard();
  v6 = v5;
  if (v5)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_17;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v4, "userInterfaceIdiom") != 1)
    {

      goto LABEL_17;
    }
  }
  v9 = __sb__runningInSpringBoard();
  v10 = v9;
  if (v9)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v12 = v11;
  v13 = *(double *)(MEMORY[0x1E0DAB260] + 264);
  if ((v10 & 1) == 0)

  if ((v6 & 1) == 0)
  if (v12 >= v13)
  {
    v7 = [SBPIPContentViewLayoutSizePreferences alloc];
    v14 = *(_BYTE *)(a1 + 32) == 0;
    v15 = 102.0;
    v16 = 88.0;
    goto LABEL_18;
  }
LABEL_17:
  v7 = [SBPIPContentViewLayoutSizePreferences alloc];
  v14 = *(_BYTE *)(a1 + 32) == 0;
  v15 = 84.0;
  v16 = 72.0;
LABEL_18:
  if (v14)
    v8 = v16;
  else
    v8 = v15;
LABEL_21:
  v17 = -[SBPIPContentViewLayoutSizePreferences initWithLongSideMinimumSize:longSideDefaultSize:longSideMaximumSize:shortSideMinimumSize:](v7, "initWithLongSideMinimumSize:longSideDefaultSize:longSideMaximumSize:shortSideMinimumSize:", 44.0, 44.0, v8, 0.0);
  v18 = (void *)microPIPLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref;
  microPIPLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref = v17;

}

+ (id)pegasusDefaultMetrics
{
  id v2;
  id v3;
  id v4;
  SBPIPContentViewLayoutMetricsSizePolicy *v5;
  SBPIPContentViewLayoutMetrics *v6;
  double v7;
  SBPIPContentViewLayoutMetrics *v8;
  id v10;
  id v11;
  id v12;

  v11 = 0;
  v12 = 0;
  v10 = 0;
  objc_msgSend(a1, "videoContentLandscapeSizePreferences:portraitSizePreferences:squareSizePreferences:", &v12, &v11, &v10);
  v2 = v12;
  v3 = v11;
  v4 = v10;
  v5 = -[SBPIPContentViewLayoutMetricsSizePolicy initWithSizePreferencesForLandscape:portrait:square:]([SBPIPContentViewLayoutMetricsSizePolicy alloc], "initWithSizePreferencesForLandscape:portrait:square:", v2, v3, v4);

  v6 = [SBPIPContentViewLayoutMetrics alloc];
  v7 = _SBPIPContentViewPaddingWhileStashed(0);
  v8 = -[SBPIPContentViewLayoutMetrics initWithContentTypeIdentifier:padding:paddingWhileStashed:minimumStashedTabSize:defaultCornerRadius:sizePolicy:defaultPosition:](v6, "initWithContentTypeIdentifier:padding:paddingWhileStashed:minimumStashedTabSize:defaultCornerRadius:sizePolicy:defaultPosition:", CFSTR("VideoContent"), v5, 3, v7, _SBPIPContentViewPaddingWhileStashed(1), 24.0, 96.0, 0.0);

  return v8;
}

+ (id)pegasusVideoCallMetrics
{
  id v2;
  id v3;
  id v4;
  SBPIPContentViewLayoutMetricsSizePolicy *v5;
  SBPIPContentViewLayoutMetrics *v6;
  double v7;
  SBPIPContentViewLayoutMetrics *v8;
  id v10;
  id v11;
  id v12;

  v11 = 0;
  v12 = 0;
  v10 = 0;
  objc_msgSend(a1, "videoCallLandscapeSizePreferences:portraitSizePreferences:squareSizePreferences:", &v12, &v11, &v10);
  v2 = v12;
  v3 = v11;
  v4 = v10;
  v5 = -[SBPIPContentViewLayoutMetricsSizePolicy initWithSizePreferencesForLandscape:portrait:square:]([SBPIPContentViewLayoutMetricsSizePolicy alloc], "initWithSizePreferencesForLandscape:portrait:square:", v2, v3, v4);

  v6 = [SBPIPContentViewLayoutMetrics alloc];
  v7 = _SBPIPContentViewPaddingWhileStashed(0);
  v8 = -[SBPIPContentViewLayoutMetrics initWithContentTypeIdentifier:padding:paddingWhileStashed:minimumStashedTabSize:defaultCornerRadius:sizePolicy:defaultPosition:](v6, "initWithContentTypeIdentifier:padding:paddingWhileStashed:minimumStashedTabSize:defaultCornerRadius:sizePolicy:defaultPosition:", CFSTR("VideoCall"), v5, 3, v7, _SBPIPContentViewPaddingWhileStashed(1), 24.0, 96.0, 0.0);

  return v8;
}

+ (id)pegasusScreenSharingMetrics
{
  id v2;
  id v3;
  id v4;
  SBPIPContentViewLayoutMetricsSizePolicy *v5;
  SBPIPContentViewLayoutMetrics *v6;
  double v7;
  SBPIPContentViewLayoutMetrics *v8;
  id v10;
  id v11;
  id v12;

  v11 = 0;
  v12 = 0;
  v10 = 0;
  objc_msgSend(a1, "screenSharingLandscapeSizePreferences:portraitSizePreferences:squareSizePreferences:", &v12, &v11, &v10);
  v2 = v12;
  v3 = v11;
  v4 = v10;
  v5 = -[SBPIPContentViewLayoutMetricsSizePolicy initWithSizePreferencesForLandscape:portrait:square:]([SBPIPContentViewLayoutMetricsSizePolicy alloc], "initWithSizePreferencesForLandscape:portrait:square:", v2, v3, v4);

  v6 = [SBPIPContentViewLayoutMetrics alloc];
  v7 = _SBPIPContentViewPaddingWhileStashed(0);
  v8 = -[SBPIPContentViewLayoutMetrics initWithContentTypeIdentifier:padding:paddingWhileStashed:minimumStashedTabSize:defaultCornerRadius:sizePolicy:defaultPosition:](v6, "initWithContentTypeIdentifier:padding:paddingWhileStashed:minimumStashedTabSize:defaultCornerRadius:sizePolicy:defaultPosition:", CFSTR("ScreenSharing"), v5, 3, v7, _SBPIPContentViewPaddingWhileStashed(1), 24.0, 96.0, 0.0);

  return v8;
}

+ (id)pegasusDefaultMicroPIPMetrics
{
  id v2;
  id v3;
  id v4;
  SBPIPContentViewLayoutMetricsSizePolicy *v5;
  SBPIPContentViewLayoutMetrics *v6;
  SBPIPContentViewLayoutMetrics *v7;
  id v9;
  id v10;
  id v11;

  v10 = 0;
  v11 = 0;
  v9 = 0;
  objc_msgSend(a1, "microPIPLandscapeSizePreferences:portraitSizePreferences:squareSizePreferences:", &v11, &v10, &v9);
  v2 = v11;
  v3 = v10;
  v4 = v9;
  v5 = -[SBPIPContentViewLayoutMetricsSizePolicy initWithSizePreferencesForLandscape:portrait:square:]([SBPIPContentViewLayoutMetricsSizePolicy alloc], "initWithSizePreferencesForLandscape:portrait:square:", v2, v3, v4);

  v6 = [SBPIPContentViewLayoutMetrics alloc];
  v7 = -[SBPIPContentViewLayoutMetrics initWithContentTypeIdentifier:padding:paddingWhileStashed:minimumStashedTabSize:defaultCornerRadius:sizePolicy:defaultPosition:](v6, "initWithContentTypeIdentifier:padding:paddingWhileStashed:minimumStashedTabSize:defaultCornerRadius:sizePolicy:defaultPosition:", CFSTR("MicroPIP"), v5, 3, 0.0, 0.0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), 0.0);

  return v7;
}

+ (id)pegasusQNBacklinkMetrics
{
  SBPIPContentViewLayoutSizePreferences *v2;
  SBPIPContentViewLayoutMetricsSizePolicy *v3;
  uint64_t v4;
  SBPIPContentViewLayoutMetrics *v5;
  double v6;
  SBPIPContentViewLayoutMetrics *v7;

  v2 = -[SBPIPContentViewLayoutSizePreferences initWithLongSideMinimumSize:longSideDefaultSize:longSideMaximumSize:shortSideMinimumSize:]([SBPIPContentViewLayoutSizePreferences alloc], "initWithLongSideMinimumSize:longSideDefaultSize:longSideMaximumSize:shortSideMinimumSize:", 112.0, 112.0, 112.0, 112.0);
  v3 = -[SBPIPContentViewLayoutMetricsSizePolicy initWithSizePreferencesForLandscape:portrait:square:]([SBPIPContentViewLayoutMetricsSizePolicy alloc], "initWithSizePreferencesForLandscape:portrait:square:", v2, v2, v2);

  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    v4 = 1;
  else
    v4 = 2;
  v5 = [SBPIPContentViewLayoutMetrics alloc];
  v6 = _SBPIPContentViewPaddingWhileStashed(0);
  v7 = -[SBPIPContentViewLayoutMetrics initWithContentTypeIdentifier:padding:paddingWhileStashed:minimumStashedTabSize:defaultCornerRadius:sizePolicy:defaultPosition:prefersDefaultPosition:](v5, "initWithContentTypeIdentifier:padding:paddingWhileStashed:minimumStashedTabSize:defaultCornerRadius:sizePolicy:defaultPosition:prefersDefaultPosition:", CFSTR("QNBacklink"), v3, v4, 1, v6, _SBPIPContentViewPaddingWhileStashed(1), 24.0, 96.0, 0.0);

  return v7;
}

+ (id)pegasusMetricsForContentType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      objc_msgSend(a1, "pegasusDefaultMetrics", v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      objc_msgSend(a1, "pegasusVideoCallMetrics", v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      objc_msgSend(a1, "pegasusScreenSharingMetrics", v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      objc_msgSend(a1, "pegasusQNBacklinkMetrics", v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return a1;
  }
  return a1;
}

- (SBPIPContentViewLayoutMetrics)initWithContentTypeIdentifier:(id)a3 padding:(double)a4 paddingWhileStashed:(double)a5 minimumStashedTabSize:(CGSize)a6 defaultCornerRadius:(double)a7 sizePolicy:(id)a8 defaultPosition:(unint64_t)a9 prefersDefaultPosition:(BOOL)a10
{
  CGFloat height;
  CGFloat width;
  id v19;
  id v20;
  SBPIPContentViewLayoutMetrics *v21;
  uint64_t v22;
  NSString *contentTypeIdentifier;
  objc_super v25;

  height = a6.height;
  width = a6.width;
  v19 = a3;
  v20 = a8;
  v25.receiver = self;
  v25.super_class = (Class)SBPIPContentViewLayoutMetrics;
  v21 = -[SBPIPContentViewLayoutMetrics init](&v25, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v19, "copy");
    contentTypeIdentifier = v21->_contentTypeIdentifier;
    v21->_contentTypeIdentifier = (NSString *)v22;

    v21->_padding = a4;
    v21->_paddingWhileStashed = a5;
    v21->_minimumStashedTabSize.width = width;
    v21->_minimumStashedTabSize.height = height;
    v21->_defaultCornerRadius = a7;
    objc_storeStrong((id *)&v21->_sizePolicy, a8);
    v21->_defaultPosition = a9;
    v21->_prefersDefaultPosition = a10;
  }

  return v21;
}

- (SBPIPContentViewLayoutMetrics)initWithContentTypeIdentifier:(id)a3 padding:(double)a4 paddingWhileStashed:(double)a5 minimumStashedTabSize:(CGSize)a6 defaultCornerRadius:(double)a7 sizePolicy:(id)a8 defaultPosition:(unint64_t)a9
{
  return -[SBPIPContentViewLayoutMetrics initWithContentTypeIdentifier:padding:paddingWhileStashed:minimumStashedTabSize:defaultCornerRadius:sizePolicy:defaultPosition:prefersDefaultPosition:](self, "initWithContentTypeIdentifier:padding:paddingWhileStashed:minimumStashedTabSize:defaultCornerRadius:sizePolicy:defaultPosition:prefersDefaultPosition:", a3, a8, a9, 0, a4, a5, a6.width, a6.height, a7);
}

+ (double)minimumLandscapePadding
{
  double v2;
  void *v3;

  if (__sb__runningInSpringBoard())
  {
    if (!SBFEffectiveDeviceClass() || (v2 = 0.0, SBFEffectiveDeviceClass() == 1))
    {
      if (SBFEffectiveHomeButtonType() == 2)
        return 16.0;
      else
        return 0.0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = 0.0;
    if (!objc_msgSend(v3, "userInterfaceIdiom"))
    {
      if (SBFEffectiveHomeButtonType() == 2)
        v2 = 16.0;
      else
        v2 = 0.0;
    }

  }
  return v2;
}

+ (double)unstashedPeripheryPadding
{
  return 4.0;
}

- (NSString)contentTypeIdentifier
{
  return self->_contentTypeIdentifier;
}

- (double)padding
{
  return self->_padding;
}

- (double)paddingWhileStashed
{
  return self->_paddingWhileStashed;
}

- (CGSize)minimumStashedTabSize
{
  double width;
  double height;
  CGSize result;

  width = self->_minimumStashedTabSize.width;
  height = self->_minimumStashedTabSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)defaultCornerRadius
{
  return self->_defaultCornerRadius;
}

- (SBPIPContentViewLayoutMetricsSizePolicy)sizePolicy
{
  return self->_sizePolicy;
}

- (unint64_t)defaultPosition
{
  return self->_defaultPosition;
}

- (BOOL)prefersDefaultPosition
{
  return self->_prefersDefaultPosition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizePolicy, 0);
  objc_storeStrong((id *)&self->_contentTypeIdentifier, 0);
}

+ (id)systemNotesMetricsForPresentationMode:(int64_t)a3
{
  const __CFString *v3;
  double v4;
  double v5;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  SBPIPContentViewLayoutSizePreferences *v14;
  SBPIPContentViewLayoutMetricsSizePolicy *v15;
  SBPIPContentViewLayoutMetrics *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  SBPIPContentViewLayoutMetrics *v26;

  if (a3 == 1)
  {
    v3 = CFSTR("SystemNotes-Thumbnail");
    v5 = 121.0;
    v4 = 121.0;
  }
  else if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SBSSystemNotesPresentationModeDescription();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBPIPContentViewLayoutMetrics+SystemNotes.m"), 73, CFSTR("invalid presentationMode %@ received"), v9);

    v3 = 0;
    v5 = 0.0;
    v4 = 0.0;
  }
  else
  {
    v3 = CFSTR("SystemNotes-Window");
    v4 = 560.0;
    v5 = 455.0;
  }
  v10 = SBSystemNotesMaximumWindowSize();
  v11 = SBSystemNotesMaximumWindowSize();
  if (v10 < v12)
    v10 = v12;
  +[SBPIPContentViewLayoutMetrics pegasusDefaultMetrics](SBPIPContentViewLayoutMetrics, "pegasusDefaultMetrics", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SBPIPContentViewLayoutSizePreferences initWithLongSideMinimumSize:longSideDefaultSize:longSideMaximumSize:shortSideMinimumSize:]([SBPIPContentViewLayoutSizePreferences alloc], "initWithLongSideMinimumSize:longSideDefaultSize:longSideMaximumSize:shortSideMinimumSize:", v4, v5, v10, v5);
  v15 = -[SBPIPContentViewLayoutMetricsSizePolicy initWithSizePreferencesForLandscape:portrait:square:]([SBPIPContentViewLayoutMetricsSizePolicy alloc], "initWithSizePreferencesForLandscape:portrait:square:", v14, 0, 0);
  v16 = [SBPIPContentViewLayoutMetrics alloc];
  objc_msgSend(v13, "padding");
  v18 = v17;
  objc_msgSend(v13, "paddingWhileStashed");
  v20 = v19;
  objc_msgSend(v13, "minimumStashedTabSize");
  v22 = v21;
  v24 = v23;
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    v25 = 1;
  else
    v25 = 2;
  v26 = -[SBPIPContentViewLayoutMetrics initWithContentTypeIdentifier:padding:paddingWhileStashed:minimumStashedTabSize:defaultCornerRadius:sizePolicy:defaultPosition:](v16, "initWithContentTypeIdentifier:padding:paddingWhileStashed:minimumStashedTabSize:defaultCornerRadius:sizePolicy:defaultPosition:", v3, v15, v25, v18, v20, v22, v24, 34.0);

  return v26;
}

@end
