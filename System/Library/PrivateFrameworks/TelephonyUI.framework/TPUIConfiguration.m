@implementation TPUIConfiguration

+ (id)defaultFont
{
  if (defaultFont_onceToken != -1)
    dispatch_once(&defaultFont_onceToken, &__block_literal_global_3);
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", *(double *)&defaultFont_defaultFontSize, *MEMORY[0x1E0DC1440]);
}

void __32__TPUIConfiguration_defaultFont__block_invoke()
{
  void *v0;
  void *v1;
  double v2;
  int v3;
  BOOL v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "currentMode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "size");
  v3 = (int)v2;

  v4 = v3 > 2207 || v3 == 1334;
  v5 = 13.0;
  if (v4)
    v5 = 16.0;
  defaultFont_defaultFontSize = *(_QWORD *)&v5;
}

+ (unint64_t)screenSize
{
  if (screenSize_onceToken != -1)
    dispatch_once(&screenSize_onceToken, &__block_literal_global_5);
  return screenSize_screenSize;
}

void __31__TPUIConfiguration_screenSize__block_invoke()
{
  void *v0;
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  BOOL v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD2728], "mainDisplay");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bounds");
  v2 = v1;
  v4 = v3;

  if (v2 >= v4)
    v5 = v2;
  else
    v5 = v4;
  v6 = (int)v5;
  v7 = MGGetProductType();
  if (v6 == 1136)
  {
LABEL_5:
    v8 = 0;
LABEL_47:
    screenSize_screenSize = v8;
    goto LABEL_48;
  }
  if (v7 <= 2795618602)
  {
    if (v7 > 851437780)
    {
      if (v7 <= 2688879998)
      {
        if (v7 != 851437781)
        {
          if (v7 != 1169082144)
            goto LABEL_23;
          goto LABEL_42;
        }
LABEL_32:
        v10 = v6 == 2556;
        goto LABEL_45;
      }
      if (v7 != 2688879999)
      {
        if (v7 != 2793418701)
          goto LABEL_23;
        goto LABEL_32;
      }
      goto LABEL_33;
    }
    if (v7 == 133314240)
      goto LABEL_32;
    if (v7 != 330877086)
    {
      v9 = 574536383;
LABEL_22:
      if (v7 != v9)
        goto LABEL_23;
LABEL_33:
      v11 = v6 == 2796;
      goto LABEL_34;
    }
    v11 = v6 == 2868;
LABEL_34:
    v8 = 14;
    if (!v11)
      v8 = 15;
    goto LABEL_47;
  }
  if (v7 <= 3001488777)
  {
    if (v7 == 2795618603)
    {
      v10 = v6 == 2622;
LABEL_45:
      v8 = 9;
      if (v10)
        v8 = 12;
      goto LABEL_47;
    }
    if (v7 == 2940697645)
      goto LABEL_32;
    v9 = 2941181571;
    goto LABEL_22;
  }
  if (v7 <= 3885279869)
  {
    if (v7 == 3001488778)
    {
LABEL_42:
      v10 = v6 == 2532;
      goto LABEL_45;
    }
    v9 = 3825599860;
    goto LABEL_22;
  }
  if (v7 == 4201643249)
  {
    v11 = v6 == 2778;
    goto LABEL_34;
  }
  if (v7 == 3885279870)
  {
    v8 = 9;
    if (v6 == 2436)
      v8 = 10;
    goto LABEL_47;
  }
LABEL_23:
  if (v6 <= 2223)
  {
    v8 = 2;
    if (v6 > 2000)
    {
      if (v6 > 2078)
      {
        if (v6 == 2079)
        {
          v8 = 9;
          goto LABEL_47;
        }
        if (v6 == 2208)
        {
          v8 = 6;
          goto LABEL_47;
        }
        goto LABEL_48;
      }
      if (v6 != 2001)
      {
        if (v6 == 2048)
          goto LABEL_47;
        goto LABEL_48;
      }
    }
    else
    {
      if (v6 > 1623)
      {
        if (v6 == 1624)
          goto LABEL_78;
        if (v6 == 1792)
        {
LABEL_70:
          v8 = 5;
          goto LABEL_47;
        }
        goto LABEL_48;
      }
      if (v6 == 1024)
        goto LABEL_47;
      if (v6 != 1334)
        goto LABEL_48;
    }
    v8 = 1;
    goto LABEL_47;
  }
  if (v6 > 2435)
  {
    if (v6 > 2687)
    {
      if (v6 != 2688)
      {
        if (v6 == 2732)
        {
          v8 = 7;
        }
        else
        {
          if (v6 != 2778)
            goto LABEL_48;
          v8 = 14;
        }
        goto LABEL_47;
      }
      goto LABEL_70;
    }
    if (v6 != 2436)
    {
      if (v6 == 2532)
      {
        v8 = 12;
        goto LABEL_47;
      }
      goto LABEL_48;
    }
LABEL_78:
    v8 = 4;
    goto LABEL_47;
  }
  if (v6 > 2359)
  {
    if (v6 == 2360 || v6 == 2388)
    {
      v8 = 8;
      goto LABEL_47;
    }
  }
  else
  {
    if (v6 == 2224)
    {
      v8 = 3;
      goto LABEL_47;
    }
    if (v6 == 2272)
      goto LABEL_5;
  }
LABEL_48:
  TPDefaultLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134218240;
    v14 = screenSize_screenSize;
    v15 = 1024;
    v16 = v6;
    _os_log_impl(&dword_1BCFA3000, v12, OS_LOG_TYPE_DEFAULT, "Determined screen size to be %ld for screenHeight: %d", (uint8_t *)&v13, 0x12u);
  }

}

+ (unint64_t)inCallBottomBarSpacing
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__TPUIConfiguration_inCallBottomBarSpacing__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (inCallBottomBarSpacing_onceToken != -1)
    dispatch_once(&inCallBottomBarSpacing_onceToken, block);
  return inCallBottomBarSpacing_spacing;
}

unint64_t __43__TPUIConfiguration_inCallBottomBarSpacing__block_invoke(uint64_t a1)
{
  unint64_t result;
  uint64_t v2;

  result = objc_msgSend(*(id *)(a1 + 32), "screenSize");
  if (result > 0xF)
    v2 = 1;
  else
    v2 = qword_1BCFE71A0[result];
  inCallBottomBarSpacing_spacing = v2;
  return result;
}

+ (unint64_t)pipStatusBarPadding
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__TPUIConfiguration_pipStatusBarPadding__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (pipStatusBarPadding_onceToken != -1)
    dispatch_once(&pipStatusBarPadding_onceToken, block);
  return (unint64_t)*(double *)&pipStatusBarPadding_padding;
}

uint64_t __40__TPUIConfiguration_pipStatusBarPadding__block_invoke(uint64_t a1)
{
  uint64_t result;
  double v2;

  result = objc_msgSend(*(id *)(a1 + 32), "screenSize");
  v2 = 1.0;
  if ((unint64_t)(result - 1) <= 0xE)
    v2 = dbl_1BCFE7220[result - 1];
  pipStatusBarPadding_padding = *(_QWORD *)&v2;
  return result;
}

+ (double)defaultHeight
{
  unint64_t v2;
  double result;
  unint64_t v4;

  v2 = +[TPUIConfiguration screenSize](TPUIConfiguration, "screenSize") - 10;
  if (v2 < 6)
    return dbl_1BCFE7298[v2];
  if (+[TPUIConfiguration inCallBottomBarSpacing](TPUIConfiguration, "inCallBottomBarSpacing") == 6)
    return 82.0;
  v4 = +[TPUIConfiguration inCallBottomBarSpacing](TPUIConfiguration, "inCallBottomBarSpacing");
  result = 72.0;
  if (v4 == 3)
    return 82.0;
  return result;
}

@end
