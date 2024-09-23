@implementation UIStatusBar

uint64_t __51__UIStatusBar_Base__setHidden_animationParameters___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v3, "setAlpha:", *(double *)(a1 + 40));
    v4 = *(void **)(a1 + 32);
    v5 = *(_OWORD *)(a1 + 64);
    v9 = *(_OWORD *)(a1 + 48);
    v10 = v5;
    v6 = *(_OWORD *)(a1 + 80);
  }
  else
  {
    objc_msgSend(v3, "setAlpha:", 1.0);
    v4 = *(void **)(a1 + 32);
    v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v9 = *MEMORY[0x1E0C9BAA8];
    v10 = v7;
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  v11 = v6;
  return objc_msgSend(v4, "setTransform:", &v9);
}

+ (double)_viewControllerAdjustmentForOrientation:(int64_t)a3 inWindow:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;

  v6 = a4;
  if (objc_msgSend(a1, "_shouldForwardToImplementationClassForStyle:", 0))
  {
    objc_msgSend((id)objc_msgSend(a1, "_implementationClass"), "_viewControllerAdjustmentForOrientation:inWindow:", a3, v6);
    v8 = v7;
  }
  else
  {
    _UIAppStatusBarDefaultHeight();
    v8 = 0.0 - v9;
  }

  return v8;
}

+ (double)_heightForStyle:(int64_t)a3 orientation:(int64_t)a4 forStatusBarFrame:(BOOL)a5 inWindow:(id)a6 isAzulBLinked:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  double v13;
  double v14;
  void *v15;
  double v16;

  v7 = a7;
  v8 = a5;
  v12 = a6;
  if (objc_msgSend(a1, "_shouldForwardToImplementationClassForStyle:", a3))
  {
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_implementationClass"), "_heightForStyle:orientation:forStatusBarFrame:inWindow:isAzulBLinked:", a3, a4, v8, v12, v7);
    v14 = v13;
  }
  else
  {
    objc_msgSend(a1, "_styleAttributesForStatusBarStyle:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "heightForOrientation:", a4);
    v14 = v16;

  }
  return v14;
}

+ (BOOL)_shouldForwardToImplementationClassForStyle:(int64_t)a3
{
  uint64_t v4;
  uint64_t v5;

  if ((unint64_t)(a3 - 400) < 6)
    return 0;
  v4 = objc_opt_class();
  if (v4 != objc_opt_class())
    return 0;
  v5 = objc_msgSend((id)objc_opt_class(), "_implementationClass");
  return v5 != objc_opt_class();
}

uint64_t __51__UIStatusBar_Base__setHidden_animationParameters___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

+ (id)_styleAttributesForStatusBarStyle:(int64_t)a3
{
  UIStatusBarStyleRequest *v4;
  void *v5;

  v4 = -[UIStatusBarStyleRequest initWithStyle:legibilityStyle:foregroundColor:overrideHeight:]([UIStatusBarStyleRequest alloc], "initWithStyle:legibilityStyle:foregroundColor:overrideHeight:", a3, 0, 0, 0);
  objc_msgSend(a1, "_styleAttributesForRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_styleAttributesForRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)_styleAttributesForRequest__styles;
    if (!_styleAttributesForRequest__styles)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v7 = (void *)_styleAttributesForRequest__styles;
      _styleAttributesForRequest__styles = (uint64_t)v6;

      v5 = (void *)_styleAttributesForRequest__styles;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v8 = (void *)objc_msgSend(a1, "_newStyleAttributesForRequest:", v4);
      if (v8)
        objc_msgSend((id)_styleAttributesForRequest__styles, "setObject:forKeyedSubscript:", v8, v4);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_newStyleAttributesForRequest:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  __objc2_class *v7;
  UIStatusBarExternalStyleAttributes *v8;
  uint64_t v9;
  __objc2_class *v10;
  __objc2_class *v11;
  __objc2_class *v12;
  __objc2_class *v13;
  UIStatusBarLockScreenStyleAttributes *v14;
  uint64_t v15;
  UIStatusBarExternalStyleAttributes *v16;
  double v17;
  double v18;
  double v19;
  __objc2_class *v20;
  void *v21;
  UIStatusBarLockScreenStyleAttributes *v22;
  UIStatusBarNewUIStyleAttributes *v23;
  void *v24;

  v4 = a3;
  v5 = objc_msgSend(v4, "style");
  v6 = v5;
  if (v5 > 305)
  {
    switch(v5)
    {
      case 1001:
        v10 = UIStatusBarLockScreenStyleAttributes;
LABEL_30:
        v8 = (UIStatusBarExternalStyleAttributes *)[v10 alloc];
        v17 = 0.141176471;
        v18 = 0.517647059;
        v19 = 0.909803922;
        goto LABEL_42;
      case 1002:
      case 1005:
      case 1015:
        v7 = UIStatusBarLockScreenStyleAttributes;
LABEL_6:
        v8 = (UIStatusBarExternalStyleAttributes *)[v7 alloc];
        +[UIColor systemBlueColor](UIColor, "systemBlueColor");
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_43;
      case 1003:
        v20 = UIStatusBarLockScreenStyleAttributes;
LABEL_41:
        v8 = (UIStatusBarExternalStyleAttributes *)[v20 alloc];
        v17 = 0.28627451;
        v18 = 0.0901960784;
        v19 = 0.439215686;
LABEL_42:
        +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v17, v18, v19, 1.0);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_43;
      case 1004:
      case 1006:
      case 1016:
        v11 = UIStatusBarLockScreenStyleAttributes;
LABEL_37:
        v8 = (UIStatusBarExternalStyleAttributes *)[v11 alloc];
        +[UIColor systemRedColor](UIColor, "systemRedColor");
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_43;
      case 1007:
      case 1008:
      case 1009:
      case 1010:
      case 1011:
      case 1017:
      case 1018:
      case 1019:
      case 1020:
      case 1021:
        goto LABEL_38;
      case 1012:
      case 1013:
        v12 = UIStatusBarActionableLockScreenStyleAttributes;
LABEL_18:
        v8 = (UIStatusBarExternalStyleAttributes *)[v12 alloc];
        +[UIColor systemGreenColor](UIColor, "systemGreenColor");
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_43;
      case 1014:
      case 1022:
        v13 = UIStatusBarLockScreenStyleAttributes;
LABEL_22:
        v8 = (UIStatusBarExternalStyleAttributes *)[v13 alloc];
        +[UIColor grayColor](UIColor, "grayColor");
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_43;
      default:
        if ((unint64_t)(v5 - 400) > 5)
        {
          if (v5 == 306)
          {
LABEL_26:
            v14 = [UIStatusBarLockScreenStyleAttributes alloc];
            +[UIColor whiteColor](UIColor, "whiteColor");
            v15 = objc_claimAutoreleasedReturnValue();
LABEL_35:
            v21 = (void *)v15;
            v22 = v14;
          }
          else
          {
LABEL_38:
            v23 = [UIStatusBarNewUIStyleAttributes alloc];
            if ((objc_msgSend(a1, "_isLightContentStyle:", v6) & 1) != 0)
              +[UIColor whiteColor](UIColor, "whiteColor");
            else
              +[UIColor blackColor](UIColor, "blackColor");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = (UIStatusBarLockScreenStyleAttributes *)v23;
          }
          v16 = -[UIStatusBarNewUIStyleAttributes initWithRequest:backgroundColor:foregroundColor:](v22, "initWithRequest:backgroundColor:foregroundColor:", v4, 0, v21);
        }
        else
        {
          if (((1 << (v5 + 112)) & 0x2D) != 0)
          {
            v8 = [UIStatusBarExternalStyleAttributes alloc];
            +[UIColor blackColor](UIColor, "blackColor");
          }
          else
          {
            v8 = [UIStatusBarExternalStyleAttributes alloc];
            +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.9);
          }
          v9 = objc_claimAutoreleasedReturnValue();
LABEL_43:
          v21 = (void *)v9;
          +[UIColor whiteColor](UIColor, "whiteColor");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[UIStatusBarNewUIStyleAttributes initWithRequest:backgroundColor:foregroundColor:](v8, "initWithRequest:backgroundColor:foregroundColor:", v4, v21, v24);

        }
        break;
    }
  }
  else
  {
    switch(v5)
    {
      case 200:
      case 208:
      case 222:
      case 223:
        v12 = UIStatusBarNewUIDoubleHeightStyleAttributes;
        goto LABEL_18;
      case 201:
      case 202:
      case 203:
      case 204:
      case 205:
      case 206:
      case 211:
        v11 = UIStatusBarNewUIDoubleHeightStyleAttributes;
        goto LABEL_37;
      case 207:
      case 214:
      case 224:
        v10 = UIStatusBarNewUIDoubleHeightStyleAttributes;
        goto LABEL_30;
      case 209:
      case 210:
      case 212:
      case 215:
      case 216:
      case 217:
      case 219:
      case 226:
      case 227:
        v7 = UIStatusBarNewUIDoubleHeightStyleAttributes;
        goto LABEL_6;
      case 213:
        v20 = UIStatusBarNewUIDoubleHeightStyleAttributes;
        goto LABEL_41;
      case 218:
      case 225:
        v13 = UIStatusBarNewUIDoubleHeightStyleAttributes;
        goto LABEL_22;
      case 220:
      case 221:
        v8 = [UIStatusBarNewUIDoubleHeightStyleAttributes alloc];
        +[UIColor systemGrayColor](UIColor, "systemGrayColor");
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_43;
      default:
        switch(v5)
        {
          case 'e':
            v11 = UIStatusBarNewUIStyleAttributes;
            goto LABEL_37;
          case 'f':
          case 'h':
          case 'p':
            v10 = UIStatusBarNewUIStyleAttributes;
            goto LABEL_30;
          case 'g':
          case 'j':
          case 'k':
          case 'n':
            goto LABEL_38;
          case 'i':
            v20 = UIStatusBarNewUIStyleAttributes;
            goto LABEL_41;
          case 'l':
            goto LABEL_26;
          case 'm':
            v14 = [UIStatusBarLockScreenStyleAttributes alloc];
            +[UIColor grayColor](UIColor, "grayColor");
            v15 = objc_claimAutoreleasedReturnValue();
            goto LABEL_35;
          case 'o':
            v11 = UIStatusBarNewUIActionableStyleAttributes;
            goto LABEL_37;
          case 'q':
          case 'r':
            v10 = UIStatusBarNewUIActionableStyleAttributes;
            goto LABEL_30;
          default:
            if (v5 != -1)
              goto LABEL_38;
            v16 = 0;
            break;
        }
        break;
    }
  }

  return v16;
}

uint64_t __51__UIStatusBar_Base__setHidden_animationParameters___block_invoke_4(uint64_t a1)
{
  void *v1;
  int v2;
  double v3;

  v1 = *(void **)(a1 + 32);
  v2 = objc_msgSend(v1, "isHidden");
  v3 = 1.0;
  if (v2)
    v3 = 0.0;
  return objc_msgSend(v1, "setAlpha:", v3);
}

+ (void)getData:(id *)a3 forRequestedData:(id *)a4 withOverrides:(id *)a5
{
  uint64_t i;
  int v11;
  int v12;
  uint64_t v13;
  char v14;
  char v15;
  int v16;
  int v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  unsigned int var21;
  char v27;
  void *v28;

  if (!a3 || !a4 || !a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIStatusBar.m"), 214, CFSTR("cannot call without valid pointers for data=%p, requestedData=%p and overrides=%p"), a3, a4, a5);

  }
  if (a3 != a4)
    memcpy(a3, a4, sizeof($6C45178016D353444451090973A2A97F));
  for (i = 0; i != 46; ++i)
  {
    if (a5->var0[i])
      a3->var0[i] = a5->var36.var0[i];
  }
  v11 = *(_DWORD *)((char *)a5 + 46);
  if ((v11 & 1) != 0)
  {
    strncpy(a3->var1, a5->var36.var1, 0x40uLL);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a5->var36.var1);
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      v20 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setLocale:", v21);

      objc_msgSend(v20, "setDateStyle:", 0);
      objc_msgSend(v20, "setTimeStyle:", 1);
      objc_msgSend(v20, "dateFromString:", v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = (void *)objc_msgSend(v20, "copy");
        objc_msgSend(v23, "setLocalizedDateFormatFromTemplate:", CFSTR("Jmm"));
        objc_msgSend(v23, "stringFromDate:", v22);
        v24 = objc_claimAutoreleasedReturnValue();

        v19 = (void *)v24;
      }
      v25 = objc_retainAutorelease(v19);
      strncpy(a3->var2, (const char *)objc_msgSend(v25, "UTF8String"), 0x40uLL);

    }
    v11 = *(_DWORD *)((char *)a5 + 46);
    if ((v11 & 2) == 0)
    {
LABEL_12:
      if ((v11 & 4) == 0)
        goto LABEL_13;
      goto LABEL_45;
    }
  }
  else if ((v11 & 2) == 0)
  {
    goto LABEL_12;
  }
  strncpy(a3->var3, a5->var36.var3, 0x100uLL);
  v11 = *(_DWORD *)((char *)a5 + 46);
  if ((v11 & 4) == 0)
  {
LABEL_13:
    if ((v11 & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_46;
  }
LABEL_45:
  a3->var4 = a5->var36.var4;
  v11 = *(_DWORD *)((char *)a5 + 46);
  if ((v11 & 0x10) == 0)
  {
LABEL_14:
    if ((v11 & 8) == 0)
      goto LABEL_15;
    goto LABEL_47;
  }
LABEL_46:
  a3->var6 = a5->var36.var6;
  v11 = *(_DWORD *)((char *)a5 + 46);
  if ((v11 & 8) == 0)
  {
LABEL_15:
    if ((v11 & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_47:
  a3->var5 = a5->var36.var5;
  if ((*(_DWORD *)((char *)a5 + 46) & 0x20) != 0)
LABEL_16:
    a3->var7 = a5->var36.var7;
LABEL_17:
  if ((*((_BYTE *)a5 + 56) & 4) != 0)
    strncpy(a3->var44, a5->var36.var44, 0x64uLL);
  v12 = *(_DWORD *)((char *)a5 + 46);
  if ((v12 & 0x40) != 0)
  {
    strncpy(a3->var8, a5->var36.var8, 0x64uLL);
    v12 = *(_DWORD *)((char *)a5 + 46);
  }
  if ((v12 & 0x80) != 0)
    strncpy(a3->var9, a5->var36.var9, 0x64uLL);
  v13 = 0;
  v14 = 1;
  do
  {
    v15 = v14;
    if (((*(_DWORD *)((char *)a5 + 46) >> 8 >> v13) & 1) != 0)
      strncpy(a3->var12[v13], a5->var36.var12[v13], 0x64uLL);
    v14 = 0;
    v13 = 1;
  }
  while ((v15 & 1) != 0);
  v16 = *(_DWORD *)((char *)a5 + 46);
  if ((v16 & 0x400) != 0)
  {
    strncpy(a3->var13, a5->var36.var13, 0x400uLL);
    v16 = *(_DWORD *)((char *)a5 + 46);
    if ((v16 & 0x800) == 0)
    {
LABEL_29:
      if ((v16 & 0x1000) == 0)
        goto LABEL_31;
      goto LABEL_30;
    }
  }
  else if ((v16 & 0x800) == 0)
  {
    goto LABEL_29;
  }
  a3->var14 = a5->var36.var14;
  if ((*(_DWORD *)((char *)a5 + 46) & 0x1000) != 0)
LABEL_30:
    a3->var15 = a5->var36.var15;
LABEL_31:
  if ((*((_BYTE *)a5 + 56) & 8) != 0)
    *((_BYTE *)a3 + 3149) = *((_BYTE *)a3 + 3149) & 0xF7 | *((_BYTE *)&a5->var36 + 3149) & 8;
  v17 = *(_DWORD *)((char *)a5 + 46);
  if ((v17 & 0x2000) != 0)
  {
    a3->var18 = a5->var36.var18;
    v17 = *(_DWORD *)((char *)a5 + 46);
    if ((v17 & 0x4000) == 0)
    {
LABEL_35:
      if ((v17 & 0x8000) == 0)
        goto LABEL_36;
      goto LABEL_54;
    }
  }
  else if ((v17 & 0x4000) == 0)
  {
    goto LABEL_35;
  }
  a3->var19 = a5->var36.var19;
  v17 = *(_DWORD *)((char *)a5 + 46);
  if ((v17 & 0x8000) == 0)
  {
LABEL_36:
    if ((v17 & 0x10000) == 0)
      goto LABEL_37;
    goto LABEL_55;
  }
LABEL_54:
  a3->var21 = a5->var36.var21;
  v17 = *(_DWORD *)((char *)a5 + 46);
  if ((v17 & 0x10000) == 0)
  {
LABEL_37:
    if ((v17 & 0x20000) == 0)
      goto LABEL_59;
    goto LABEL_56;
  }
LABEL_55:
  a3->var22 = a5->var36.var22;
  v17 = *(_DWORD *)((char *)a5 + 46);
  if ((v17 & 0x20000) == 0)
    goto LABEL_59;
LABEL_56:
  var21 = a3->var21;
  if (var21 <= 0xE && ((1 << var21) & 0x7F9F) != 0)
  {
    a3->var0[9] = 0;
    v17 = *(_DWORD *)((char *)a5 + 46);
  }
LABEL_59:
  if ((v17 & 0x40000) != 0)
  {
    a3->var23 = a5->var36.var23;
    v17 = *(_DWORD *)((char *)a5 + 46);
    if ((v17 & 0x80000) == 0)
    {
LABEL_61:
      if ((v17 & 0x100000) == 0)
        goto LABEL_62;
      goto LABEL_81;
    }
  }
  else if ((v17 & 0x80000) == 0)
  {
    goto LABEL_61;
  }
  a3->var24 = a5->var36.var24;
  v17 = *(_DWORD *)((char *)a5 + 46);
  if ((v17 & 0x100000) == 0)
  {
LABEL_62:
    if ((v17 & 0x200000) == 0)
      goto LABEL_63;
    goto LABEL_82;
  }
LABEL_81:
  strncpy(a3->var25, a5->var36.var25, 0x96uLL);
  v17 = *(_DWORD *)((char *)a5 + 46);
  if ((v17 & 0x200000) == 0)
  {
LABEL_63:
    if ((v17 & 0x400000) == 0)
      goto LABEL_64;
    goto LABEL_83;
  }
LABEL_82:
  a3->var26 = a5->var36.var26;
  v17 = *(_DWORD *)((char *)a5 + 46);
  if ((v17 & 0x400000) == 0)
  {
LABEL_64:
    if ((v17 & 0x800000) == 0)
      goto LABEL_65;
    goto LABEL_84;
  }
LABEL_83:
  a3->var27 = a5->var36.var27;
  v17 = *(_DWORD *)((char *)a5 + 46);
  if ((v17 & 0x800000) == 0)
  {
LABEL_65:
    if ((v17 & 0x1000000) == 0)
      goto LABEL_66;
    goto LABEL_85;
  }
LABEL_84:
  *((_BYTE *)a3 + 2272) = *((_BYTE *)a3 + 2272) & 0xFD | *((_BYTE *)&a5->var36 + 2272) & 2;
  v17 = *(_DWORD *)((char *)a5 + 46);
  if ((v17 & 0x1000000) == 0)
  {
LABEL_66:
    if ((v17 & 0x2000000) == 0)
      goto LABEL_68;
    goto LABEL_67;
  }
LABEL_85:
  strncpy(a3->var31, a5->var36.var31, 0x100uLL);
  if ((*(_DWORD *)((char *)a5 + 46) & 0x2000000) != 0)
LABEL_67:
    *((_BYTE *)a3 + 2529) = *((_BYTE *)a3 + 2529) & 0xFE | *((_BYTE *)&a5->var36 + 2529) & 1;
LABEL_68:
  if (a5->var27)
    *((_BYTE *)a3 + 2536) = *((_BYTE *)a3 + 2536) & 0xFB | *((_BYTE *)&a5->var36 + 2536) & 4;
  v27 = *((_BYTE *)a5 + 56);
  if ((v27 & 1) != 0)
  {
    *((_BYTE *)a3 + 2529) = *((_BYTE *)a3 + 2529) & 0xFD | *((_BYTE *)&a5->var36 + 2529) & 2;
    v27 = *((_BYTE *)a5 + 56);
    if ((v27 & 2) == 0)
    {
LABEL_72:
      if ((v27 & 0x10) == 0)
        goto LABEL_73;
      goto LABEL_89;
    }
  }
  else if ((*((_BYTE *)a5 + 56) & 2) == 0)
  {
    goto LABEL_72;
  }
  *((_BYTE *)a3 + 2529) = *((_BYTE *)a3 + 2529) & 0xFB | *((_BYTE *)&a5->var36 + 2529) & 4;
  v27 = *((_BYTE *)a5 + 56);
  if ((v27 & 0x10) == 0)
  {
LABEL_73:
    if ((v27 & 0x20) == 0)
      goto LABEL_74;
    goto LABEL_90;
  }
LABEL_89:
  *((_BYTE *)a3 + 3160) = *((_BYTE *)a3 + 3160) & 0xFB | *((_BYTE *)&a5->var36 + 3160) & 4;
  v27 = *((_BYTE *)a5 + 56);
  if ((v27 & 0x20) == 0)
  {
LABEL_74:
    if ((v27 & 0x40) == 0)
      goto LABEL_76;
    goto LABEL_75;
  }
LABEL_90:
  strncpy(a3->var54, a5->var36.var54, 0x64uLL);
  if ((*((_BYTE *)a5 + 56) & 0x40) != 0)
LABEL_75:
    strncpy(a3->var55, a5->var36.var55, 0x64uLL);
LABEL_76:
  if (a5->var0[41])
    *((_BYTE *)a3 + 2529) = *((_BYTE *)a3 + 2529) & 0x9F | *((_BYTE *)&a5->var36 + 2529) & 0x60;
  __strlcpy_chk();
  __strlcpy_chk();
}

+ (NSDirectionalEdgeInsets)_roundedPadEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  +[_UIStatusBarVisualProvider_RoundedPad edgeInsets](_UIStatusBarVisualProvider_RoundedPad, "edgeInsets");
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

+ (NSDirectionalEdgeInsets)_regularPadEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  +[_UIStatusBarVisualProvider_Pad edgeInsets](_UIStatusBarVisualProvider_Pad, "edgeInsets");
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

+ (double)_roundedPadBaselineOffset
{
  double result;

  +[_UIStatusBarVisualProvider_RoundedPad baselineOffset](_UIStatusBarVisualProvider_RoundedPad, "baselineOffset");
  return result;
}

+ (double)_regularPadBaselineOffset
{
  double result;

  +[_UIStatusBarVisualProvider_Pad baselineOffset](_UIStatusBarVisualProvider_Pad, "baselineOffset");
  return result;
}

void __58___UIStatusBar_registerSensorActivityIndicator_forScreen___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithStrongToWeakObjects");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7B7B8;
  qword_1ECD7B7B8 = v0;

}

void __30___UIStatusBar_initWithStyle___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_updateWithAggregatedData:", v3);

}

void __46___UIStatusBar__prepareVisualProviderIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setStatusBar:", v3);
  v5 = *(void **)(a1 + 40);
  objc_msgSend(v4, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

}

void __46___UIStatusBar__prepareVisualProviderIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "orderedDisplayItemPlacementsInRegionWithIdentifier:", a2);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          +[_UIStatusBarDisplayItemState stateForDisplayItemWithIdentifier:statusBar:](_UIStatusBarDisplayItemState, "stateForDisplayItemWithIdentifier:statusBar:", v11, *(_QWORD *)(a1 + 32));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "setObject:forKeyedSubscript:", v12, v11);
        }
        objc_msgSend(v12, "addPlacement:inRegion:", v10, v5);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

void __35___UIStatusBar_resetVisualProvider__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0C99E40];
  v4 = a3;
  objc_msgSend(v3, "orderedSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayItems:", v5);

}

uint64_t __24___UIStatusBar_setMode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateStyleAttributes");
}

uint64_t __41___UIStatusBar_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateStyleAttributes");
}

uint64_t __25___UIStatusBar_setStyle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateStyleAttributes");
}

uint64_t __35___UIStatusBar_setForegroundColor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateStyleAttributes");
}

uint64_t __50___UIStatusBar__updateWithData_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 592), "updateWithData:", *(_QWORD *)(a1 + 40));
}

uint64_t __78___UIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "prepareForDataUpdate");
}

void __78___UIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "updateWithData:styleAttributes:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v4);

}

uint64_t __78___UIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "updatedDisplayItemsWithData:", *(_QWORD *)(a1 + 32));
}

uint64_t __78___UIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsUpdateConstraints");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __78___UIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __52___UIStatusBar__delayUpdatesWithKeys_fromAnimation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 592), "endDelayingUpdatesForEntryKeys:", *(_QWORD *)(a1 + 40));
}

void __43___UIStatusBar__fixupDisplayItemAttributes__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "isEnabled"))
  {
    objc_msgSend(v4, "displayItems");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_95_1);

  }
}

void __43___UIStatusBar__fixupDisplayItemAttributes__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  __int128 v3;
  _OWORD v4[3];

  v2 = a2;
  objc_msgSend(v2, "setAlpha:", 1.0);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v3;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v4);

}

uint64_t __42___UIStatusBar_resizeSubviewsWithOldSize___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "resetToPreferredPlacement");
}

void __30___UIStatusBar_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "_is_needsLayout"))
  {
    objc_msgSend(v3, "layer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setNeedsLayout");

  }
}

void __30___UIStatusBar_layoutSubviews__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v4 = v5;
  }

}

uint64_t __34___UIStatusBar__updateRegionItems__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "updatePlacement");
}

uint64_t __34___UIStatusBar__updateRegionItems__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  int v5;
  int v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "isEnabled");
  v6 = objc_msgSend(v4, "isEnabled");

  if (v5 | v6 ^ 1)
    return v5 & (v6 ^ 1u);
  else
    return -1;
}

void __41___UIStatusBar__rearrangeOverflowedItems__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  if (objc_msgSend(v11, "isEnabled") && (objc_msgSend(v11, "disableItemFrameBasedOverflow") & 1) == 0)
  {
    objc_msgSend(v11, "overflowedDisplayItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v4)
    {
LABEL_9:

      goto LABEL_10;
    }
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 520);
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (*(_QWORD *)(v9 + 40))
    {
      v10 = objc_msgSend(v8, "priority");
      if (v10 >= objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "priority"))
      {
LABEL_8:

        goto LABEL_9;
      }
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    }
    objc_storeStrong((id *)(v9 + 40), v8);
    goto LABEL_8;
  }
LABEL_10:

}

void __66___UIStatusBar_pointerInteraction_regionForRequest_defaultRegion___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  __int128 v26;

  v23 = a3;
  v7 = objc_msgSend(v23, "isEnabled");
  v8 = v23;
  if (v7)
  {
    objc_msgSend(v23, "displayItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "count"))
    {

LABEL_17:
      v8 = v23;
      goto LABEL_18;
    }
    v10 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "location");
    v11 = (void *)objc_msgSend(v10, "_cursorLocation:isInsideActionable:", v23);

    v8 = v23;
    if ((_DWORD)v11)
    {
      objc_msgSend(v23, "displayItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __66___UIStatusBar_pointerInteraction_regionForRequest_defaultRegion___block_invoke_2;
      v24[3] = &unk_1E16E2318;
      v13 = *(void **)(a1 + 40);
      v24[4] = *(_QWORD *)(a1 + 32);
      v25 = v13;
      v26 = *(_OWORD *)(a1 + 48);
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", v24);

      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      {
        objc_msgSend(v23, "action");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEnabled");
        if ((v15 & 1) == 0)
        {
          objc_msgSend(v23, "hoverAction");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v11, "isEnabled"))
            goto LABEL_14;
        }
        v16 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "location");
        if ((objc_msgSend(v16, "_cursorLocation:isInsideHoverableActionable:", v23) & 1) != 0)
        {
          objc_msgSend(v23, "contentView");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "alpha");
          v19 = v18;

          if ((v15 & 1) == 0)
          if (v19 > 0.0)
          {
            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
            objc_msgSend(v23, "identifier");
            v20 = objc_claimAutoreleasedReturnValue();
            v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v22 = *(void **)(v21 + 40);
            *(_QWORD *)(v21 + 40) = v20;

            *a4 = 1;
          }
          goto LABEL_16;
        }
        if (!v15)
LABEL_14:

      }
LABEL_16:

      goto LABEL_17;
    }
  }
LABEL_18:

}

void __66___UIStatusBar_pointerInteraction_regionForRequest_defaultRegion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v4;
  void *v8;
  char v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "action");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEnabled");
  if ((v9 & 1) == 0)
  {
    objc_msgSend(v15, "hoverAction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEnabled") & 1) == 0)
    {

      goto LABEL_9;
    }
  }
  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "location");
  v11 = objc_msgSend(v10, "_cursorLocation:isInsideHoverableActionable:", v15);
  if ((v9 & 1) != 0)
  {

    if (!v11)
      goto LABEL_9;
    goto LABEL_7;
  }

  if ((v11 & 1) != 0)
  {
LABEL_7:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    objc_msgSend(v15, "identifier");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    *a4 = 1;
  }
LABEL_9:

}

void __45___UIStatusBar_gestureRecognizerShouldBegin___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  int v14;
  id obj;
  _QWORD v16[5];
  id v17;

  obj = a3;
  v6 = objc_msgSend(obj, "isEnabled");
  v7 = obj;
  if (v6)
  {
    objc_msgSend(obj, "displayItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "count"))
    {

LABEL_10:
      v7 = obj;
      goto LABEL_11;
    }
    v9 = objc_msgSend(*(id *)(a1 + 32), "_gestureRecognizer:isInsideActionable:", *(_QWORD *)(a1 + 40), obj);

    v7 = obj;
    if (v9)
    {
      objc_msgSend(obj, "displayItems");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __45___UIStatusBar_gestureRecognizerShouldBegin___block_invoke_2;
      v16[3] = &unk_1E16E2368;
      v11 = *(void **)(a1 + 40);
      v16[4] = *(_QWORD *)(a1 + 32);
      v17 = v11;
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v16);

      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 544));
      if (WeakRetained)
      {

      }
      else
      {
        objc_msgSend(obj, "action");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEnabled");

        if (v14)
        {
          objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 544), obj);
          *a4 = 1;
        }
      }

      goto LABEL_10;
    }
  }
LABEL_11:

}

void __45___UIStatusBar_gestureRecognizerShouldBegin___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  void *v8;
  id obj;

  obj = a2;
  objc_msgSend(obj, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEnabled"))
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "_gestureRecognizer:isInsideActionable:", *(_QWORD *)(a1 + 40), obj);

    v8 = obj;
    if (v7)
    {
      objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 544), obj);
      v8 = obj;
      *a4 = 1;
    }
  }
  else
  {

    v8 = obj;
  }

}

void __47___UIStatusBar_setStyle_forPartWithIdentifier___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "styleAttributes");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_updateDisplayedItemsWithData:styleAttributes:extraAnimations:", 0, v2, MEMORY[0x1E0C9AA60]);

}

void __42___UIStatusBar_setEnabledPartIdentifiers___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v7, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  v6 = objc_msgSend(v7, "isEnabled");
  if ((_DWORD)v4)
  {
    if (v6)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    objc_msgSend(v7, "disableWithToken:", 1);
  }
  else
  {
    if ((v6 & 1) == 0)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    objc_msgSend(v7, "enableWithToken:", 1);
  }

}

uint64_t __42___UIStatusBar_setEnabledPartIdentifiers___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateWithAnimations:", MEMORY[0x1E0C9AA60]);
}

uint64_t __43___UIStatusBar_setDisabledPartIdentifiers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateWithAnimations:", MEMORY[0x1E0C9AA60]);
}

void __38___UIStatusBar_dependentDataEntryKeys__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "itemWithIdentifier:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  objc_msgSend(v3, "dependentEntryKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unionSet:", v5);

}

void __37___UIStatusBar_itemsDependingOnKeys___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "dependentEntryKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intersectsSet:", *(_QWORD *)(a1 + 32));

  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

void __56___UIStatusBar_itemIdentifiersInRegionsWithIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  +[_UIStatusBarItem itemIdentifierForDisplayItemIdentifier:](_UIStatusBarItem, "itemIdentifierForDisplayItemIdentifier:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void ___UIStatusBar_Log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.UIKit", "UIStatusBarLog");
  v1 = (void *)_MergedGlobals_11_11;
  _MergedGlobals_11_11 = (uint64_t)v0;

}

- (id)_initWithFrame:(CGRect)a3 showForegroundView:(BOOL)a4 wantsServer:(BOOL)a5 inProcessStateProvider:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  double height;
  double width;
  double y;
  double x;
  id v13;
  char *v14;
  char *v15;
  id v16;
  void *v17;
  const $6C45178016D353444451090973A2A97F *v18;
  void *v19;
  void *v20;
  objc_super v22;
  objc_super v23;

  v6 = a5;
  v7 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)UIStatusBar;
  v14 = -[UIStatusBar_Base _initWithFrame:showForegroundView:wantsServer:inProcessStateProvider:](&v23, sel__initWithFrame_showForegroundView_wantsServer_inProcessStateProvider_, v7, v6, v13, x, y, width, height);
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "setOpaque:", 0);
    v22.receiver = v15;
    v22.super_class = (Class)UIStatusBar;
    -[UIStatusBar_Base setOrientation:](&v22, sel_setOrientation_, 1);
    v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v17 = (void *)*((_QWORD *)v15 + 576);
    *((_QWORD *)v15 + 576) = v16;

    if (v13)
    {
      objc_msgSend(v13, "getStatusBarData:", v15 + 648);
    }
    else
    {
      v18 = +[UIStatusBarServer getStatusBarData](UIStatusBarServer, "getStatusBarData");
      if (v18)
        memcpy(v15 + 648, v18, 0xF28uLL);
    }
    +[UIStatusBar _setDeviceUserInterfaceLayoutDirection:](UIStatusBar, "_setDeviceUserInterfaceLayoutDirection:", ((unint64_t)v15[3184] >> 1) & 1);
    v15[600] = v7;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v15, sel__itemViewPerformButtonAction_, CFSTR("UIStatusBarItemViewPerformButtonActionNotification"), 0);
    objc_msgSend(v19, "addObserver:selector:name:object:", v15, sel__itemViewShouldBeginDisablingRasterization_, CFSTR("UIStatusBarItemViewShouldBeginDisablingRasterizationNotification"), 0);
    objc_msgSend(v19, "addObserver:selector:name:object:", v15, sel__itemViewShouldEndDisablingRasterization_, CFSTR("UIStatusBarItemViewShouldEndDisablingRasterizationNotification"), 0);
    if (_UIDeviceNativeUserInterfaceIdiom() == 1)
    {
      _UIKitUserDefaults();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObserver:forKeyPath:options:context:", v15, 0x1E176CE20, 0, 0);
      objc_msgSend(v20, "addObserver:forKeyPath:options:context:", v15, 0x1E176CE40, 0, 0);
      v15[601] = 1;

    }
    objc_msgSend(v15, "_evaluateServerRegistration");
    objc_msgSend(v15, "_updateShouldRasterize");

  }
  return v15;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIStatusBarItemViewPerformButtonActionNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIStatusBarItemViewShouldBeginDisablingRasterizationNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIStatusBarItemViewShouldEndDisablingRasterizationNotification"), 0);
  if (self->_observingDefaults)
  {
    _UIKitUserDefaults();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:forKeyPath:", self, 0x1E176CE20);
    objc_msgSend(v4, "removeObserver:forKeyPath:", self, 0x1E176CE40);

  }
  v5.receiver = self;
  v5.super_class = (Class)UIStatusBar;
  -[UIStatusBar_Base dealloc](&v5, sel_dealloc);
}

+ (void)enumerateStatusBarStyleOverridesWithBlock:(id)a3
{
  unint64_t v4;
  BOOL v5;

  v4 = 1;
  do
  {
    (*((void (**)(id, unint64_t))a3 + 2))(a3, v4);
    v5 = v4 >= 0x10000000001;
    v4 *= 2;
  }
  while (!v5);
}

+ (int64_t)lowBatteryLevel
{
  if (_UIDeviceNativeUserInterfaceIdiom() == 1)
    return 10;
  else
    return 20;
}

- (id)statusBarWindow
{
  return 0;
}

- (void)forceUpdateData:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[UIStatusBar_Base inProcessStateProvider](self, "inProcessStateProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[UIStatusBar forceUpdateToData:animated:](self, "forceUpdateToData:animated:", +[UIStatusBarServer getStatusBarData](UIStatusBarServer, "getStatusBarData"), v3);
}

- (void)forceUpdateToData:(id *)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  UIStatusBarForegroundView *foregroundView;
  id v7;

  v4 = a4;
  if (a3)
    memcpy(&self->_currentRawData, a3, sizeof(self->_currentRawData));
  +[UIStatusBar _setDeviceUserInterfaceLayoutDirection:](UIStatusBar, "_setDeviceUserInterfaceLayoutDirection:", ((unint64_t)*((unsigned __int8 *)&self->_currentRawData + 2536) >> 1) & 1);
  foregroundView = self->_foregroundView;
  -[UIStatusBar _currentComposedData](self, "_currentComposedData");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UIStatusBarForegroundView setStatusBarData:actions:animated:](foregroundView, "setStatusBarData:actions:animated:", v7, 0, v4);

}

- (void)forceUpdateDoubleHeightStatus
{
  void *v3;
  void *v4;

  -[UIStatusBar _doubleHeightStatusStringForStyle:](self, "_doubleHeightStatusStringForStyle:", -[UIStatusBar currentStyle](self, "currentStyle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[UIStatusBar _setDoubleHeightStatusString:](self, "_setDoubleHeightStatusString:", v3);
    -[UIStatusBar _adjustDoubleHeightTextVisibility](self, "_adjustDoubleHeightTextVisibility");
    v3 = v4;
  }

}

- (void)_noteStyleOverridesChangedLocally
{
  self->_waitingOnCallbackAfterChangingStyleOverridesLocally = 1;
}

- (void)forgetEitherSideHistory
{
  -[UIStatusBarForegroundView reflowItemViewsForgettingEitherSideItemHistory](self->_foregroundView, "reflowItemViewsForgettingEitherSideItemHistory");
}

- (void)setShowsOnlyCenterItems:(BOOL)a3
{
  UIStatusBarForegroundView *foregroundView;
  id v4;

  self->_showOnlyCenterItems = a3;
  foregroundView = self->_foregroundView;
  -[UIStatusBar _currentComposedData](self, "_currentComposedData");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIStatusBarForegroundView setStatusBarData:actions:animated:](foregroundView, "setStatusBarData:actions:animated:", v4, 0, 0);

}

- (double)defaultHeight
{
  UIStatusBarStyleAttributes *styleAttributes;
  double result;

  styleAttributes = self->_styleAttributes;
  if (!styleAttributes)
    return 20.0;
  -[UIStatusBarStyleAttributes heightForMetrics:](styleAttributes, "heightForMetrics:", 0);
  return result;
}

- (double)defaultDoubleHeight
{
  return 40.0;
}

- (CGRect)frameForOrientation:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGRect result;

  if (self->_waitingOnCallbackAfterChangingStyleOverridesLocally)
  {
    -[UIStatusBar forceUpdate:](self, "forceUpdate:", 1);
    self->_waitingOnCallbackAfterChangingStyleOverridesLocally = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)UIStatusBar;
  -[UIStatusBar_Base frameForOrientation:](&v9, sel_frameForOrientation_, a3);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (double)heightForOrientation:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;

  if (self->_waitingOnCallbackAfterChangingStyleOverridesLocally)
  {
    -[UIStatusBar forceUpdate:](self, "forceUpdate:", 1);
    self->_waitingOnCallbackAfterChangingStyleOverridesLocally = 0;
  }
  -[UIStatusBar _currentStyleAttributes](self, "_currentStyleAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "heightForOrientation:", a3);
  v7 = v6;

  return v7;
}

- (int64_t)currentStyle
{
  UIStatusBarStyleAttributes *styleAttributes;

  styleAttributes = self->_styleAttributes;
  if (styleAttributes)
    return -[UIStatusBarStyleAttributes style](styleAttributes, "style");
  else
    return -1;
}

- (BOOL)isDoubleHeight
{
  void *v3;
  void *v4;
  char v5;

  -[UIStatusBar styleRequest](self, "styleRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBar _styleAttributesForRequest:](self, "_styleAttributesForRequest:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDoubleHeight");

  return v5;
}

- (BOOL)isTranslucent
{
  void *v3;
  void *v4;
  char v5;

  -[UIStatusBar styleRequest](self, "styleRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBar _styleAttributesForRequest:](self, "_styleAttributesForRequest:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isTranslucent");

  return v5;
}

- (void)requestStyle:(int64_t)a3 animation:(int)a4 startTime:(double)a5 duration:(double)a6 curve:(int64_t)a7
{
  UIStatusBarStyleAnimationParameters *v9;
  uint64_t v13;
  UIStatusBarStyleAnimationParameters *v14;
  UIStatusBarStyleAnimationParameters *v15;

  v9 = 0;
  if (a4 && a6 > 0.0)
  {
    v13 = *(_QWORD *)&a4;
    v14 = -[UIStatusBarStyleAnimationParameters initWithDefaultParameters]([UIStatusBarStyleAnimationParameters alloc], "initWithDefaultParameters");
    -[UIStatusBarStyleAnimationParameters setStyleAnimation:](v14, "setStyleAnimation:", v13);
    -[UIStatusBarAnimationParameters setStartTime:](v14, "setStartTime:", a5);
    -[UIStatusBarAnimationParameters setDuration:](v14, "setDuration:", a6);
    -[UIStatusBarAnimationParameters setCurve:](v14, "setCurve:", a7);
    v9 = v14;
  }
  v15 = v9;
  -[UIStatusBar_Base requestStyle:animationParameters:](self, "requestStyle:animationParameters:", a3, v9, a7, a5, a6);

}

- (void)_requestStyle:(int64_t)a3 partStyles:(id)a4 animationParameters:(id)a5 forced:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  int64_t v16;
  _BYTE buf[12];
  __int16 v18;
  id v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v6 = a6;
  v22 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v9 = a5;
  v10 = qword_1ECD7AF90;
  if (!qword_1ECD7AF90)
  {
    v10 = __UILogCategoryGetNode("StatusBar", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v10, (unint64_t *)&qword_1ECD7AF90);
  }
  if ((*(_BYTE *)v10 & 1) != 0)
  {
    v14 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = a3;
      v18 = 2112;
      v19 = v9;
      v20 = 1024;
      v21 = v6;
      _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "Requesting status bar style %lu. Animation parameters:%@ forced: %d", buf, 0x1Cu);
    }
  }
  v11 = qword_1ECD7AF98;
  if (!qword_1ECD7AF98)
  {
    v11 = __UILogCategoryGetNode("StatusBar", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v11, (unint64_t *)&qword_1ECD7AF98);
  }
  if ((*(_BYTE *)v11 & 1) != 0)
  {
    v15 = *(NSObject **)(v11 + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = a3;
      _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "Effective status bar style: %lu", buf, 0xCu);
    }
  }
  *(_QWORD *)buf = 0;
  -[UIStatusBar_Base _getStyle:andActiveOverride:forRequestedStyle:](self, "_getStyle:andActiveOverride:forRequestedStyle:", &v16, buf, -[UIStatusBar_Base _requestStyle](self, "_requestStyle"));
  -[UIStatusBar_Base setActiveStyleOverride:](self, "setActiveStyleOverride:", *(_QWORD *)buf);
  -[UIStatusBar currentStyleRequestForStyle:](self, "currentStyleRequestForStyle:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBar _styleAttributesForRequest:](self, "_styleAttributesForRequest:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBar _updateUIWithStyleAttributes:animationParameters:forced:](self, "_updateUIWithStyleAttributes:animationParameters:forced:", v13, v9, v6);

}

- (void)_updateUIWithStyleAttributes:(id)a3 animationParameters:(id)a4
{
  -[UIStatusBar _updateUIWithStyleAttributes:animationParameters:forced:](self, "_updateUIWithStyleAttributes:animationParameters:forced:", a3, a4, 0);
}

- (void)_updateUIWithStyleAttributes:(id)a3 animationParameters:(id)a4 forced:(BOOL)a5
{
  _BOOL8 v5;
  UIStatusBarStyleAttributes *v9;
  id v10;
  UIStatusBarStyleAnimationParameters *nextTintTransition;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  BOOL v16;
  void *v17;
  BOOL v18;
  UIColor *v19;
  UIColor *v20;
  UIStatusBarStyleAttributes **p_styleAttributes;
  double v22;
  uint64_t v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  UIStatusBarForegroundView *v35;
  UIStatusBarForegroundView *v36;
  BOOL foregroundViewShouldIgnoreStatusBarDataDuringAnimation;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  id v42;
  UIStatusBarForegroundView *v43;
  void *v44;
  UIColor *v45;
  _QWORD v46[4];
  UIStatusBarForegroundView *v47;
  UIStatusBar *v48;
  id v49;
  double v50;
  double v51;
  int v52;
  BOOL v53;
  _QWORD aBlock[5];
  UIStatusBarStyleAttributes *v55;
  id v56;
  int v57;

  v5 = a5;
  v9 = (UIStatusBarStyleAttributes *)a3;
  v10 = a4;
  nextTintTransition = self->_nextTintTransition;
  self->_nextTintTransition = 0;

  -[UIStatusBar_Base manager](self, "manager");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12
    || (v13 = (void *)v12,
        -[UIStatusBar_Base manager](self, "manager"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "statusBar:shouldRequestStyleAttributes:animationParameters:forced:", self, v9, v10, v5),
        v14,
        v13,
        v15))
  {
    if (-[UIStatusBar_Base isHidden](self, "isHidden"))
    {
      v16 = -[UIStatusBar_Base suppressesHiddenSideEffects](self, "suppressesHiddenSideEffects");
      if (!v9 || !v16)
        goto LABEL_25;
    }
    else if (!v9)
    {
      goto LABEL_25;
    }
    objc_msgSend((id)UIApp, "_systemNavigationAction");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[UIStatusBarForegroundView willChangeNavigationItemDisplayWithSystemNavigationAction:](self->_foregroundView, "willChangeNavigationItemDisplayWithSystemNavigationAction:", v17);
    -[UIStatusBarStyleAttributes backgroundColorWithTintColor:](v9, "backgroundColorWithTintColor:", self->_tintColor);
    v19 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    p_styleAttributes = &self->_styleAttributes;
    if (self->_styleAttributes != v9
      || v18
      || v19 != self->_lastUsedBackgroundColor && !-[UIColor isEqual:](v19, "isEqual:"))
    {
      v22 = 0.0;
      if (v10)
      {
        v23 = objc_msgSend(v10, "styleAnimation");
        if ((_DWORD)v23)
        {
          objc_msgSend(v10, "duration");
          v22 = v24;
        }
      }
      else
      {
        v23 = 0;
      }
      -[UIStatusBar _prepareToSetStyle:animation:forced:](self, "_prepareToSetStyle:animation:forced:", v9, v23, v5, v20);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIStatusBarStyleAttributes heightForOrientation:](*p_styleAttributes, "heightForOrientation:", -[UIStatusBar_Base orientation](self, "orientation"));
      v27 = v26;
      objc_storeStrong((id *)p_styleAttributes, a3);
      -[UIStatusBarStyleAttributes heightForOrientation:](*p_styleAttributes, "heightForOrientation:", -[UIStatusBar_Base orientation](self, "orientation"));
      v29 = v28;
      -[UIStatusBarStyleAttributes foregroundStyle](*p_styleAttributes, "foregroundStyle");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "scale");
      v32 = v31;
      -[UIView layer](self, "layer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setRasterizationScale:", v32);

      if (-[UIStatusBarStyleAttributes supportsRasterization](*p_styleAttributes, "supportsRasterization"))
        -[UIStatusBar _endDisablingRasterizationForReason:](self, "_endDisablingRasterizationForReason:", CFSTR("style"));
      else
        -[UIStatusBar _beginDisablingRasterizationForReason:](self, "_beginDisablingRasterizationForReason:", CFSTR("style"));
      if (v27 != v29)
      {
        -[UIStatusBar_Base styleDelegate](self, "styleDelegate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "statusBar:willAnimateFromHeight:toHeight:duration:animation:", self, v23, v27, v29, v22);

      }
      v35 = self->_foregroundView;
      v36 = v35;
      foregroundViewShouldIgnoreStatusBarDataDuringAnimation = self->_foregroundViewShouldIgnoreStatusBarDataDuringAnimation;
      if (foregroundViewShouldIgnoreStatusBarDataDuringAnimation)
        -[UIStatusBarForegroundView startIgnoringData](v35, "startIgnoringData");
      -[UIStatusBar _doubleHeightStatusStringForStyle:](self, "_doubleHeightStatusStringForStyle:", -[UIStatusBarStyleAttributes style](v9, "style"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIStatusBar _setDoubleHeightStatusString:](self, "_setDoubleHeightStatusString:", v38);

      -[UIStatusBar _beginDisablingRasterizationForReason:](self, "_beginDisablingRasterizationForReason:", CFSTR("styleChange"));
      -[UIView _setDrawsAsBackdropOverlay:](self, "_setDrawsAsBackdropOverlay:", -[UIStatusBarStyleAttributes style](v9, "style") == 110);
      v39 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __71__UIStatusBar__updateUIWithStyleAttributes_animationParameters_forced___block_invoke;
      aBlock[3] = &unk_1E16E2B68;
      aBlock[4] = self;
      v55 = v9;
      v57 = v23;
      v40 = v25;
      v56 = v40;
      v41 = _Block_copy(aBlock);
      v46[0] = v39;
      v46[1] = 3221225472;
      v46[2] = __71__UIStatusBar__updateUIWithStyleAttributes_animationParameters_forced___block_invoke_2;
      v46[3] = &unk_1E16E2B90;
      v53 = foregroundViewShouldIgnoreStatusBarDataDuringAnimation;
      v47 = v36;
      v48 = self;
      v50 = v27;
      v51 = v29;
      v52 = v23;
      v49 = v40;
      v42 = v40;
      v43 = v36;
      v44 = _Block_copy(v46);
      -[UIStatusBar_Base _performAnimations:withParameters:completion:](self, "_performAnimations:withParameters:completion:", v41, v10, v44);

      v20 = v45;
    }

  }
LABEL_25:

}

void *__71__UIStatusBar__updateUIWithStyleAttributes_animationParameters_forced___block_invoke(uint64_t a1)
{
  void *result;

  objc_msgSend(*(id *)(a1 + 32), "_setStyle:animation:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56));
  result = *(void **)(a1 + 48);
  if (result)
    return (void *)objc_msgSend(result, "setAlpha:", 0.0);
  return result;
}

void *__71__UIStatusBar__updateUIWithStyleAttributes_animationParameters_forced___block_invoke_2(uint64_t a1)
{
  void *result;

  if (*(_BYTE *)(a1 + 76))
    objc_msgSend(*(id *)(a1 + 32), "stopIgnoringData:", 0);
  objc_msgSend(*(id *)(a1 + 40), "_endDisablingRasterizationForReason:", CFSTR("styleChange"));
  objc_msgSend(*(id *)(a1 + 40), "_finishedSettingStyleWithOldHeight:newHeight:animation:", *(unsigned int *)(a1 + 72), *(double *)(a1 + 56), *(double *)(a1 + 64));
  result = *(void **)(a1 + 48);
  if (result)
  {
    objc_msgSend(result, "removeFromSuperview");
    return (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 4528), "removeObject:", *(_QWORD *)(a1 + 48));
  }
  return result;
}

- (BOOL)_shouldUseInProcessProviderDoubleHeightStatusString
{
  void *v3;
  void *v4;
  char v5;

  -[UIStatusBar_Base inProcessStateProvider](self, "inProcessStateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIStatusBar_Base inProcessStateProvider](self, "inProcessStateProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

  }
  else
  {
    v5 = 0;
  }

  return v5 & 1;
}

- (id)_doubleHeightStatusStringForStyle:(int64_t)a3
{
  void *v5;
  void *v6;

  if (-[UIStatusBar _shouldUseInProcessProviderDoubleHeightStatusString](self, "_shouldUseInProcessProviderDoubleHeightStatusString"))
  {
    -[UIStatusBar_Base inProcessStateProvider](self, "inProcessStateProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleHeightStatusStringForStyle:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[UIStatusBarServer getDoubleHeightStatusStringForStyle:](UIStatusBarServer, "getDoubleHeightStatusStringForStyle:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)_setDoubleHeightStatusString:(id)a3
{
  NSString *v4;
  NSString *currentDoubleHeightText;
  UIStatusBarForegroundView *foregroundView;
  void *v7;
  UIStatusBarForegroundView *newStyleForegroundView;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  UILabel *doubleHeightLabel;
  UIView *v15;
  UIView *v16;
  UIView *doubleHeightLabelContainer;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  UILabel *v23;
  UILabel *v24;
  UILabel *v25;
  void *v26;
  UILabel *v27;
  void *v28;
  UILabel *v29;
  UIView *v30;
  id v31;

  v31 = a3;
  v4 = (NSString *)objc_msgSend(v31, "copy");
  currentDoubleHeightText = self->_currentDoubleHeightText;
  self->_currentDoubleHeightText = v4;

  foregroundView = self->_foregroundView;
  -[UIStatusBar _currentComposedData](self, "_currentComposedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBarForegroundView setStatusBarData:actions:animated:](foregroundView, "setStatusBarData:actions:animated:", v7, 0, 1);

  newStyleForegroundView = self->_newStyleForegroundView;
  -[UIStatusBar _currentComposedData](self, "_currentComposedData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBarForegroundView setStatusBarData:actions:animated:](newStyleForegroundView, "setStatusBarData:actions:animated:", v9, 0, 1);

  -[UIView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  v12 = v31;
  if (!v11)
  {
    v13 = objc_msgSend(v31, "length");
    doubleHeightLabel = self->_doubleHeightLabel;
    if (v13)
    {
      if (!doubleHeightLabel)
      {
        v15 = [UIView alloc];
        -[UIView bounds](self, "bounds");
        v16 = -[UIView initWithFrame:](v15, "initWithFrame:");
        doubleHeightLabelContainer = self->_doubleHeightLabelContainer;
        self->_doubleHeightLabelContainer = v16;

        -[UIView setAutoresizingMask:](self->_doubleHeightLabelContainer, "setAutoresizingMask:", 18);
        -[UIView setClipsToBounds:](self->_doubleHeightLabelContainer, "setClipsToBounds:", 1);
        -[UIView addSubview:](self, "addSubview:", self->_doubleHeightLabelContainer);
        -[UIStatusBar defaultHeight](self, "defaultHeight");
        v19 = v18;
        -[UIView bounds](self, "bounds");
        v21 = v20;
        -[UIStatusBar defaultHeight](self, "defaultHeight");
        v23 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", 0.0, v19, v21, v22 + -2.0);
        v24 = self->_doubleHeightLabel;
        self->_doubleHeightLabel = v23;

        v25 = self->_doubleHeightLabel;
        +[UIColor whiteColor](UIColor, "whiteColor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v25, "setTextColor:", v26);

        -[UILabel setTextAlignment:](self->_doubleHeightLabel, "setTextAlignment:", 1);
        -[UIView setAutoresizingMask:](self->_doubleHeightLabel, "setAutoresizingMask:", 34);
        -[UIView setBackgroundColor:](self->_doubleHeightLabel, "setBackgroundColor:", 0);
        -[UIView setOpaque:](self->_doubleHeightLabel, "setOpaque:", 0);
        v27 = self->_doubleHeightLabel;
        objc_msgSend(off_1E167A828, "systemFontOfSize:", 13.5);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v27, "setFont:", v28);

        -[UIView addSubview:](self->_doubleHeightLabelContainer, "addSubview:", self->_doubleHeightLabel);
        -[UIStatusBar _adjustDoubleHeightTextVisibility](self, "_adjustDoubleHeightTextVisibility");
        doubleHeightLabel = self->_doubleHeightLabel;
      }
      -[UILabel setText:](doubleHeightLabel, "setText:", v31);
    }
    else
    {
      -[UIView removeFromSuperview](doubleHeightLabel, "removeFromSuperview");
      v29 = self->_doubleHeightLabel;
      self->_doubleHeightLabel = 0;

      -[UIView removeFromSuperview](self->_doubleHeightLabelContainer, "removeFromSuperview");
      v30 = self->_doubleHeightLabelContainer;
      self->_doubleHeightLabelContainer = 0;

    }
    v12 = v31;
  }

}

- (void)_adjustDoubleHeightTextVisibility
{
  UIStatusBarBackgroundView *newStyleBackgroundView;
  double v4;
  double v5;
  UILabel *doubleHeightLabel;
  double v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  id v13;

  if (self->_doubleHeightLabel)
  {
    newStyleBackgroundView = self->_newStyleBackgroundView;
    if (!newStyleBackgroundView)
      newStyleBackgroundView = self->_backgroundView;
    -[UIStatusBarBackgroundView style](newStyleBackgroundView, "style");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "heightForOrientation:", -[UIStatusBar_Base orientation](self, "orientation"));
    v5 = v4;
    -[UIStatusBar defaultDoubleHeight](self, "defaultDoubleHeight");
    doubleHeightLabel = self->_doubleHeightLabel;
    if (v5 == v7)
    {
      -[UIView setAlpha:](doubleHeightLabel, "setAlpha:", 1.0);
      v8 = objc_msgSend(v13, "isPulsingAnimationEnabled");
    }
    else
    {
      -[UIView setAlpha:](doubleHeightLabel, "setAlpha:", 0.0);
      v8 = 0;
    }
    -[UIView layer](self->_doubleHeightLabel, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeAnimationForKey:", CFSTR("opacity"));
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setValues:", &unk_1E1A94B38);
      objc_msgSend(v10, "setKeyTimes:", &unk_1E1A94B50);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTimingFunction:", v11);

      objc_msgSend(v10, "setCalculationMode:", *MEMORY[0x1E0CD2938]);
      objc_msgSend(v10, "setAutoreverses:", 1);
      LODWORD(v12) = 2139095040;
      objc_msgSend(v10, "setRepeatCount:", v12);
      objc_msgSend(v10, "setDuration:", 2.0);
      objc_msgSend(v9, "addAnimation:forKey:", v10, CFSTR("opacity"));
      -[UIStatusBar _beginDisablingRasterizationForReason:](self, "_beginDisablingRasterizationForReason:", CFSTR("doubleHeight"));

    }
    else
    {
      -[UIStatusBar _endDisablingRasterizationForReason:](self, "_endDisablingRasterizationForReason:", CFSTR("doubleHeight"));
    }

  }
}

- (CGAffineTransform)_slideTransform
{
  CGFloat v4;
  CGAffineTransform *result;
  id v6;

  -[UIView window](self, "window");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  CGAffineTransformMakeTranslation(retstr, 0.0, v4);

  return result;
}

- (id)_prepareInterruptedAnimationCompositeViewIncludingForeground:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  UIView *v26;
  UIView *v27;
  void (**v28)(_QWORD);
  void *v29;
  int v30;
  UIStatusBarBackgroundView *newStyleBackgroundView;
  UIStatusBarForegroundView *newStyleForegroundView;
  NSMutableArray *interruptedAnimationCompositeViews;
  NSMutableArray *v34;
  NSMutableArray *v35;
  UIView *v36;
  _QWORD aBlock[4];
  UIView *v39;
  UIStatusBar *v40;
  BOOL v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v3 = a3;
  -[NSMutableArray lastObject](self->_interruptedAnimationCompositeViews, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView frame](self->_backgroundView, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[UIView frame](self->_newStyleBackgroundView, "frame");
  v46.origin.x = v14;
  v46.origin.y = v15;
  v46.size.width = v16;
  v46.size.height = v17;
  v42.origin.x = v7;
  v42.origin.y = v9;
  v42.size.width = v11;
  v42.size.height = v13;
  v43 = CGRectUnion(v42, v46);
  x = v43.origin.x;
  y = v43.origin.y;
  width = v43.size.width;
  height = v43.size.height;
  objc_msgSend(v5, "frame");
  v47.origin.x = v22;
  v47.origin.y = v23;
  v47.size.width = v24;
  v47.size.height = v25;
  v44.origin.x = x;
  v44.origin.y = y;
  v44.size.width = width;
  v44.size.height = height;
  v45 = CGRectUnion(v44, v47);
  v26 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v45.origin.x, v45.origin.y, v45.size.width, v45.size.height);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__UIStatusBar__prepareInterruptedAnimationCompositeViewIncludingForeground___block_invoke;
  aBlock[3] = &unk_1E16B4008;
  v27 = v26;
  v39 = v27;
  v40 = self;
  v41 = v3;
  v28 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (v5)
    -[UIView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v27, v5);
  else
    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", v27, 0);
  -[UIStatusBarBackgroundView style](self->_backgroundView, "style");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "isTranslucent");

  if (v30)
    v28[2](v28);
  -[UIView addSubview:](v27, "addSubview:", self->_newStyleBackgroundView);
  newStyleBackgroundView = self->_newStyleBackgroundView;
  self->_newStyleBackgroundView = 0;

  if (v3)
  {
    -[UIView addSubview:](v27, "addSubview:", self->_newStyleForegroundView);
    newStyleForegroundView = self->_newStyleForegroundView;
    self->_newStyleForegroundView = 0;

  }
  if ((v30 & 1) == 0)
    v28[2](v28);
  interruptedAnimationCompositeViews = self->_interruptedAnimationCompositeViews;
  if (!interruptedAnimationCompositeViews)
  {
    v34 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v35 = self->_interruptedAnimationCompositeViews;
    self->_interruptedAnimationCompositeViews = v34;

    interruptedAnimationCompositeViews = self->_interruptedAnimationCompositeViews;
  }
  -[NSMutableArray addObject:](interruptedAnimationCompositeViews, "addObject:", v27);
  v36 = v27;

  return v36;
}

void __76__UIStatusBar__prepareInterruptedAnimationCompositeViewIncludingForeground___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 608));
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v2 + 608);
  *(_QWORD *)(v2 + 608) = 0;

  v4 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v4 + 4544) || *(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(v4 + 616));
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v5 + 616);
    *(_QWORD *)(v5 + 616) = 0;

  }
}

- (void)_setVisualAltitude:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIStatusBar;
  -[UIView _setVisualAltitude:](&v4, sel__setVisualAltitude_, a3);
  -[UIStatusBar _updateBackgroundFrame](self, "_updateBackgroundFrame");
}

- (void)_setVisualAltitudeBias:(CGSize)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIStatusBar;
  -[UIView _setVisualAltitudeBias:](&v4, sel__setVisualAltitudeBias_, a3.width, a3.height);
  -[UIStatusBar _updateBackgroundFrame](self, "_updateBackgroundFrame");
}

- (CGRect)_backgroundFrameForAttributes:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  if (objc_msgSend(a3, "shouldUseVisualAltitude"))
  {
    -[UIView _visualAltitudeSensitiveBoundsWithInfiniteEdges:](self, "_visualAltitudeSensitiveBoundsWithInfiniteEdges:", 11);
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[UIView setClipsToBounds:](self, "setClipsToBounds:", 0);
  }
  else
  {
    -[UIView bounds](self, "bounds");
    v5 = v12;
    v7 = v13;
    v9 = v14;
    v11 = v15;
  }
  v16 = v5;
  v17 = v7;
  v18 = v9;
  v19 = v11;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)_updateBackgroundFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[UIStatusBar _backgroundFrameForAttributes:](self, "_backgroundFrameForAttributes:", self->_styleAttributes);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  -[UIView setFrame:](self->_newStyleBackgroundView, "setFrame:", v4, v6, v8, v10);
}

- (id)_prepareToSetStyle:(id)a3 animation:(int)a4 forced:(BOOL)a5
{
  id v8;
  void *v9;
  _BOOL8 v10;
  UIStatusBarForegroundView *newStyleForegroundView;
  void *v12;
  unint64_t v13;
  void *v14;
  UIStatusBarBackgroundView *newStyleBackgroundView;
  UIColor *v16;
  UIColor *lastUsedBackgroundColor;
  double v18;
  double v19;
  double v20;
  double v21;
  UIStatusBarBackgroundView *v22;
  UIStatusBarBackgroundView *v23;
  void *v24;
  int v25;
  UIStatusBar *slidingStatusBar;
  UIStatusBarStyleAttributes *v27;
  __int128 v28;
  double v29;
  double v30;
  double v31;
  UIStatusBar *v32;
  UIStatusBar *v33;
  UIStatusBar *v34;
  void *v35;
  NSObject *v37;
  _OWORD v38[3];
  _QWORD v39[5];
  id v40;
  id v41;
  uint8_t buf[16];
  __int128 v43;
  __int128 v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(v8, "foregroundStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    v10 = 1;
  }
  else if (self->_showsForeground)
  {
    newStyleForegroundView = self->_newStyleForegroundView;
    if (!newStyleForegroundView)
      newStyleForegroundView = self->_foregroundView;
    -[UIStatusBarForegroundView foregroundStyle](newStyleForegroundView, "foregroundStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v12 != v9;

  }
  else
  {
    v10 = 0;
  }
  v13 = _prepareToSetStyle_animation_forced____s_category;
  if (!_prepareToSetStyle_animation_forced____s_category)
  {
    v13 = __UILogCategoryGetNode("StatusBar", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v13, (unint64_t *)&_prepareToSetStyle_animation_forced____s_category);
  }
  if ((*(_BYTE *)v13 & 1) != 0)
  {
    v37 = *(NSObject **)(v13 + 8);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v10;
      _os_log_impl(&dword_185066000, v37, OS_LOG_TYPE_ERROR, "Foreground view needs changing: %d", buf, 8u);
    }
  }
  if (a4 == 1 && self->_newStyleBackgroundView)
  {
    -[UIStatusBar _prepareInterruptedAnimationCompositeViewIncludingForeground:](self, "_prepareInterruptedAnimationCompositeViewIncludingForeground:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  -[UIView removeFromSuperview](self->_newStyleBackgroundView, "removeFromSuperview");
  newStyleBackgroundView = self->_newStyleBackgroundView;
  self->_newStyleBackgroundView = 0;

  objc_msgSend(v8, "backgroundColorWithTintColor:", self->_tintColor);
  v16 = (UIColor *)objc_claimAutoreleasedReturnValue();
  lastUsedBackgroundColor = self->_lastUsedBackgroundColor;
  self->_lastUsedBackgroundColor = v16;

  -[UIStatusBar _backgroundFrameForAttributes:](self, "_backgroundFrameForAttributes:", v8);
  v22 = -[UIStatusBarBackgroundView initWithFrame:style:backgroundColor:]([UIStatusBarBackgroundView alloc], "initWithFrame:style:backgroundColor:", v8, self->_lastUsedBackgroundColor, v18, v19, v20, v21);
  v23 = self->_newStyleBackgroundView;
  self->_newStyleBackgroundView = v22;

  -[UIStatusBarBackgroundView style](self->_newStyleBackgroundView, "style");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isTranslucent");

  if (v25)
    -[UIView setAlpha:](self->_newStyleBackgroundView, "setAlpha:", 1.0);
  -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_newStyleBackgroundView, 0);
  if (v10)
  {
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __51__UIStatusBar__prepareToSetStyle_animation_forced___block_invoke;
    v39[3] = &unk_1E16B47A8;
    v39[4] = self;
    v40 = v9;
    v41 = v8;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v39);

  }
  if ((a4 & 0xFFFFFFFE) == 2)
  {
    -[UIView removeFromSuperview](self->_slidingStatusBar, "removeFromSuperview");
    slidingStatusBar = self->_slidingStatusBar;
    self->_slidingStatusBar = 0;

    -[UIView setClipsToBounds:](self, "setClipsToBounds:", 0);
    if (a4 == 2)
    {
      v27 = (UIStatusBarStyleAttributes *)v8;
      v43 = 0u;
      v44 = 0u;
      *(_OWORD *)buf = 0u;
      -[UIStatusBar _slideTransform](self, "_slideTransform");
    }
    else
    {
      v27 = self->_styleAttributes;
      v28 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)buf = *MEMORY[0x1E0C9BAA8];
      v43 = v28;
      v44 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    }
    -[UIView bounds](self, "bounds");
    v30 = v29;
    -[UIStatusBarStyleAttributes heightForOrientation:](v27, "heightForOrientation:", -[UIStatusBar_Base orientation](self, "orientation"));
    v32 = -[UIStatusBar_Base initWithFrame:showForegroundView:]([UIStatusBar alloc], "initWithFrame:showForegroundView:", 0, 0.0, 0.0, v30, v31);
    v33 = self->_slidingStatusBar;
    self->_slidingStatusBar = v32;

    -[UIStatusBar_Base requestStyle:animated:](self->_slidingStatusBar, "requestStyle:animated:", -[UIStatusBarStyleAttributes style](v27, "style"), 0);
    v34 = self->_slidingStatusBar;
    v38[0] = *(_OWORD *)buf;
    v38[1] = v43;
    v38[2] = v44;
    -[UIView setTransform:](v34, "setTransform:", v38);
    -[UIView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_slidingStatusBar, self->_foregroundView);
    if (a4 == 3)
    {
      -[UIStatusBar _setFrameForStyle:](self, "_setFrameForStyle:", v8);
      -[UIStatusBar _doubleHeightStatusStringForStyle:](self, "_doubleHeightStatusStringForStyle:", objc_msgSend(v8, "style"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIStatusBar _setDoubleHeightStatusString:](self, "_setDoubleHeightStatusString:", v35);

      -[UIStatusBar _adjustDoubleHeightTextVisibility](self, "_adjustDoubleHeightTextVisibility");
      -[UIStatusBar _swapToNewBackgroundView](self, "_swapToNewBackgroundView");
    }
    else
    {
      -[UIView setAlpha:](self->_newStyleBackgroundView, "setAlpha:", 0.0);
      -[UIView setAlpha:](self->_newStyleForegroundView, "setAlpha:", 0.0);
    }

  }
  else if (a4 == 1)
  {
    if ((objc_msgSend(v8, "shouldUseVisualAltitude") & 1) == 0)
      -[UIView setClipsToBounds:](self, "setClipsToBounds:", 1);
    if (-[UIStatusBarStyleAttributes isTranslucent](self->_styleAttributes, "isTranslucent") || v14)
    {
      -[UIView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", self->_newStyleBackgroundView, self->_backgroundView);
      -[UIView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", self->_newStyleForegroundView, self->_newStyleBackgroundView);
      -[UIView setAlpha:](self->_newStyleBackgroundView, "setAlpha:", 0.0);
      -[UIView setAlpha:](self->_newStyleForegroundView, "setAlpha:", 0.0);
    }
  }

  return v14;
}

uint64_t __51__UIStatusBar__prepareToSetStyle_animation_forced___block_invoke(uint64_t a1)
{
  UIStatusBarForegroundView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  void *v13;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 4544), "removeFromSuperview");
  v2 = [UIStatusBarForegroundView alloc];
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v7 = -[UIStatusBarForegroundView initWithFrame:foregroundStyle:usesVerticalLayout:](v2, "initWithFrame:foregroundStyle:usesVerticalLayout:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "usesVerticalLayout"), v3, v4, v5, v6);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 4544);
  *(_QWORD *)(v8 + 4544) = v7;

  objc_msgSend(*(id *)(a1 + 32), "_updatePersistentAnimationsEnabledForForegroundView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 4544));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 4544), "setIdiom:", objc_msgSend(*(id *)(a1 + 48), "idiom"));
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 4544);
  objc_msgSend(*(id *)(a1 + 48), "foregroundAlpha");
  objc_msgSend(v10, "setAlpha:");
  v11 = *(_QWORD **)(a1 + 32);
  v12 = (void *)v11[568];
  objc_msgSend(v11, "_currentComposedDataForStyle:", *(_QWORD *)(a1 + 48));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setStatusBarData:actions:animated:", v13, 0, 0);

  return objc_msgSend(*(id *)(a1 + 32), "insertSubview:aboveSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 4544), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 4536));
}

- (void)_setStyle:(id)a3 animation:(int)a4
{
  id v6;
  double v7;
  double v8;
  UIStatusBar *v9;
  __int128 v10;
  uint64_t *v11;
  UIStatusBar *slidingStatusBar;
  uint64_t v13;
  _OWORD v14[3];

  v6 = a3;
  objc_msgSend(v6, "foregroundAlpha");
  v8 = v7;
  if (a4 == 3)
  {
    slidingStatusBar = self->_slidingStatusBar;
    -[UIStatusBar _slideTransform](self, "_slideTransform");
    v11 = &v13;
    v9 = slidingStatusBar;
  }
  else
  {
    if (a4 != 2)
    {
      -[UIStatusBar _setStyle:](self, "_setStyle:", v6);
      goto LABEL_7;
    }
    v9 = self->_slidingStatusBar;
    v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v14[0] = *MEMORY[0x1E0C9BAA8];
    v14[1] = v10;
    v14[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v11 = (uint64_t *)v14;
  }
  -[UIView setTransform:](v9, "setTransform:", v11);
  -[UIStatusBar _crossfadeToNewForegroundViewWithAlpha:](self, "_crossfadeToNewForegroundViewWithAlpha:", v8);
LABEL_7:

}

- (void)_finishedSettingStyleWithOldHeight:(double)a3 newHeight:(double)a4 animation:(int)a5
{
  uint64_t v5;
  void *v9;
  UIStatusBar *slidingStatusBar;

  v5 = *(_QWORD *)&a5;
  -[UIView setClipsToBounds:](self, "setClipsToBounds:", 0);
  if (a3 != a4)
  {
    -[UIStatusBar_Base styleDelegate](self, "styleDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "statusBar:didAnimateFromHeight:toHeight:animation:", self, v5, a3, a4);

  }
  if ((_DWORD)v5 == 3)
    goto LABEL_6;
  if ((_DWORD)v5 == 2)
  {
    -[UIStatusBar _setStyle:](self, "_setStyle:", self->_styleAttributes);
LABEL_6:
    -[UIView removeFromSuperview](self->_slidingStatusBar, "removeFromSuperview");
    slidingStatusBar = self->_slidingStatusBar;
    self->_slidingStatusBar = 0;

  }
  -[UIStatusBar _swapToNewBackgroundView](self, "_swapToNewBackgroundView");
  -[UIStatusBar _swapToNewForegroundView](self, "_swapToNewForegroundView");
}

- (void)_setFrameForStyle:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  double v16;
  double v17;

  v4 = a3;
  -[UIView frame](self, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "heightForOrientation:", -[UIStatusBar_Base orientation](self, "orientation"));
  v14 = v13;
  v15 = objc_msgSend(v4, "usesVerticalLayout");

  if (v15)
    v16 = v14;
  else
    v16 = v10;
  if (v15)
    v17 = v12;
  else
    v17 = v14;
  -[UIView setFrame:](self, "setFrame:", v6, v8, v16, v17);
}

- (void)_setStyle:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "foregroundAlpha");
  -[UIStatusBar _crossfadeToNewForegroundViewWithAlpha:](self, "_crossfadeToNewForegroundViewWithAlpha:");
  -[UIStatusBar _crossfadeToNewBackgroundView](self, "_crossfadeToNewBackgroundView");
  -[UIStatusBarBackgroundView setGlowAnimationEnabled:](self->_backgroundView, "setGlowAnimationEnabled:", +[UIStatusBarServer getGlowAnimationStateForStyle:](UIStatusBarServer, "getGlowAnimationStateForStyle:", objc_msgSend(v4, "style")));
  -[UIStatusBarBackgroundView setGlowAnimationEnabled:](self->_newStyleBackgroundView, "setGlowAnimationEnabled:", +[UIStatusBarServer getGlowAnimationStateForStyle:](UIStatusBarServer, "getGlowAnimationStateForStyle:", objc_msgSend(v4, "style")));
  -[UIStatusBar _setFrameForStyle:](self, "_setFrameForStyle:", v4);

  -[UIStatusBar _adjustDoubleHeightTextVisibility](self, "_adjustDoubleHeightTextVisibility");
}

- (void)_crossfadeToNewBackgroundView
{
  UIStatusBarBackgroundView *newStyleBackgroundView;
  void *v4;
  void *v5;
  int v6;

  newStyleBackgroundView = self->_newStyleBackgroundView;
  if (newStyleBackgroundView)
  {
    -[UIView setAlpha:](newStyleBackgroundView, "setAlpha:", 1.0);
    -[UIStatusBarBackgroundView style](self->_backgroundView, "style");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isTranslucent") & 1) != 0)
    {
      -[UIStatusBarBackgroundView style](self->_newStyleBackgroundView, "style");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isTranslucent");

      if (!v6)
        return;
    }
    else
    {

    }
    -[UIView setAlpha:](self->_backgroundView, "setAlpha:", 0.0);
  }
}

- (void)_crossfadeToNewForegroundViewWithAlpha:(double)a3
{
  UIStatusBarForegroundView *newStyleForegroundView;

  newStyleForegroundView = self->_newStyleForegroundView;
  if (newStyleForegroundView)
  {
    -[UIView setAlpha:](newStyleForegroundView, "setAlpha:", a3);
    a3 = 0.0;
  }
  -[UIView setAlpha:](self->_foregroundView, "setAlpha:", a3);
}

- (void)_swapToNewBackgroundView
{
  UIStatusBarBackgroundView **p_backgroundView;
  UIStatusBarBackgroundView *newStyleBackgroundView;

  if (self->_newStyleBackgroundView)
  {
    p_backgroundView = &self->_backgroundView;
    -[UIView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
    objc_storeStrong((id *)p_backgroundView, self->_newStyleBackgroundView);
    newStyleBackgroundView = self->_newStyleBackgroundView;
    self->_newStyleBackgroundView = 0;

  }
}

- (void)_swapToNewForegroundView
{
  UIStatusBarForegroundView **p_foregroundView;
  UIStatusBarForegroundView *newStyleForegroundView;

  if (self->_newStyleForegroundView)
  {
    p_foregroundView = &self->_foregroundView;
    -[UIView removeFromSuperview](self->_foregroundView, "removeFromSuperview");
    objc_storeStrong((id *)p_foregroundView, self->_newStyleForegroundView);
    newStyleForegroundView = self->_newStyleForegroundView;
    self->_newStyleForegroundView = 0;

  }
}

- (void)setTintColor:(id)a3
{
  UIColor *v5;
  UIColor **p_tintColor;
  BOOL v7;
  UIColor *v8;

  v5 = (UIColor *)a3;
  p_tintColor = &self->_tintColor;
  if (*p_tintColor != v5)
  {
    v8 = v5;
    v7 = -[UIColor isEqual:](*p_tintColor, "isEqual:", v5);
    v5 = v8;
    if (!v7)
    {
      objc_storeStrong((id *)p_tintColor, a3);
      v5 = v8;
    }
  }

}

- (void)setTintColor:(id)a3 withDuration:(double)a4
{
  UIColor *v7;
  UIColor *tintColor;
  BOOL v9;
  UIStatusBarStyleAnimationParameters *nextTintTransition;
  int64_t v11;
  UIStatusBarStyleAnimationParameters *v12;
  UIStatusBarStyleAnimationParameters *v13;
  UIStatusBarStyleAnimationParameters *v14;
  UIStatusBarStyleAnimationParameters *v15;
  UIStatusBarStyleAnimationParameters *v16;
  UIColor *v17;

  v7 = (UIColor *)a3;
  tintColor = self->_tintColor;
  if (tintColor != v7)
  {
    v17 = v7;
    v9 = -[UIColor isEqual:](tintColor, "isEqual:", v7);
    v7 = v17;
    if (!v9)
    {
      objc_storeStrong((id *)&self->_tintColor, a3);
      nextTintTransition = self->_nextTintTransition;
      self->_nextTintTransition = 0;

      v11 = -[UIStatusBar_Base _requestStyle](self, "_requestStyle");
      v7 = v17;
      if (!v11)
      {
        v12 = [UIStatusBarStyleAnimationParameters alloc];
        if (a4 == 0.0)
        {
          v15 = -[UIStatusBarAnimationParameters initWithEmptyParameters](v12, "initWithEmptyParameters");
          v16 = self->_nextTintTransition;
          self->_nextTintTransition = v15;

        }
        else
        {
          v13 = -[UIStatusBarStyleAnimationParameters initWithDefaultParameters](v12, "initWithDefaultParameters");
          v14 = self->_nextTintTransition;
          self->_nextTintTransition = v13;

          if (a4 > 0.0)
            -[UIStatusBarAnimationParameters setDuration:](self->_nextTintTransition, "setDuration:", a4);
        }
        -[UIView setNeedsLayout](self, "setNeedsLayout");
        v7 = v17;
      }
    }
  }

}

- (void)layoutSubviews
{
  UIStatusBarStyleAnimationParameters *nextTintTransition;
  UIStatusBarStyleAnimationParameters *v4;

  nextTintTransition = self->_nextTintTransition;
  if (nextTintTransition)
  {
    self->_nextTintTransition = 0;
    v4 = nextTintTransition;

    -[UIStatusBar_Base requestStyle:animationParameters:](self, "requestStyle:animationParameters:", -[UIStatusBar_Base _requestStyle](self, "_requestStyle"), v4);
  }
}

- (void)setOrientation:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _BOOL4 v15;
  double v16;
  double v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)UIStatusBar;
  -[UIStatusBar_Base setOrientation:](&v18, sel_setOrientation_);
  -[UIStatusBar _adjustDoubleHeightTextVisibility](self, "_adjustDoubleHeightTextVisibility");
  -[UIStatusBarStyleAttributes heightForOrientation:](self->_styleAttributes, "heightForOrientation:", a3);
  v6 = v5;
  -[UIView frame](self, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = -[UIStatusBarStyleAttributes usesVerticalLayout](self->_styleAttributes, "usesVerticalLayout");
  if (v15)
    v16 = v6;
  else
    v16 = v12;
  if (v15)
    v17 = v14;
  else
    v17 = v6;
  -[UIView setFrame:](self, "setFrame:", v8, v10, v16, v17);
  -[UIStatusBarForegroundView reflowItemViews:](self->_foregroundView, "reflowItemViews:", 0);
}

- (void)_statusBarWillAnimateRotation
{
  -[UIStatusBar _beginDisablingRasterizationForReason:](self, "_beginDisablingRasterizationForReason:", CFSTR("rotation"));
}

- (void)_statusBarDidAnimateRotation
{
  -[UIStatusBar _endDisablingRasterizationForReason:](self, "_endDisablingRasterizationForReason:", CFSTR("rotation"));
}

- (void)setSuppressesHiddenSideEffects:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[UIStatusBar_Base suppressesHiddenSideEffects](self, "suppressesHiddenSideEffects") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIStatusBar;
    -[UIStatusBar_Base setSuppressesHiddenSideEffects:](&v5, sel_setSuppressesHiddenSideEffects_, v3);
    if (-[UIStatusBar_Base suppressesHiddenSideEffects](self, "suppressesHiddenSideEffects"))
    {
      if (-[UIStatusBar_Base isHidden](self, "isHidden"))
        -[UIStatusBar_Base requestStyle:animationParameters:](self, "requestStyle:animationParameters:", -[UIStatusBar_Base _requestStyle](self, "_requestStyle"), 0);
    }
  }
}

+ (BOOL)_isLightContentStyle:(int64_t)a3
{
  BOOL result;

  result = 1;
  if ((unint64_t)(a3 - 51) > 0x37 || ((1 << (a3 - 51)) & 0x90000000000001) == 0)
    return (unint64_t)(a3 - 301) < 3 || (unint64_t)(a3 - 1) < 2;
  return result;
}

- (id)_styleAttributesForRequest:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_styleAttributesForRequest:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_touchShouldProduceReturnEvent
{
  void *v3;
  BOOL v4;

  if (!-[UIStatusBarStyleAttributes shouldProduceReturnEvent](self->_styleAttributes, "shouldProduceReturnEvent"))
    return 0;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom") == 1
    || (unint64_t)(-[UIStatusBar_Base orientation](self, "orientation") - 1) < 2;

  return v4;
}

- (BOOL)_shouldSeekHigherPriorityTouchTarget
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIStatusBar;
  v3 = -[UIStatusBar_Base _shouldSeekHigherPriorityTouchTarget](&v5, sel__shouldSeekHigherPriorityTouchTarget);
  if (v3)
    LOBYTE(v3) = !-[UIStatusBar _touchShouldProduceReturnEvent](self, "_touchShouldProduceReturnEvent");
  return v3;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  int64_t v14;
  UIHandleStatusBarTapAction *v15;
  id *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  objc_super v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v11)
        objc_enumerationMutation(v8);
      if (objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v12), "type") != 1)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }

    v13 = -[UIStatusBarStyleAttributes tapButtonType](self->_styleAttributes, "tapButtonType");
    if (v13 == -1)
    {
      if (!-[UIStatusBar _touchShouldProduceReturnEvent](self, "_touchShouldProduceReturnEvent"))
        goto LABEL_20;
      if ((objc_msgSend((id)UIApp, "handleDoubleHeightStatusBarTapWithStyleOverride:", -[UIStatusBar_Base activeStyleOverride](self, "activeStyleOverride")) & 1) != 0)goto LABEL_19;
      v15 = -[UIHandleStatusBarTapAction initWithStatusBarStyle:andStatusBarStyleOverride:]([UIHandleStatusBarTapAction alloc], "initWithStatusBarStyle:andStatusBarStyleOverride:", -[UIStatusBar currentStyle](self, "currentStyle"), -[UIStatusBar_Base activeStyleOverride](self, "activeStyleOverride"));
      -[UIView window](self, "window");
      v16 = (id *)objc_claimAutoreleasedReturnValue();
      -[UIWindow _fbsScene](v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sendActions:", v18);

    }
    else
    {
      v14 = v13;
      -[UIStatusBar_Base styleDelegate](self, "styleDelegate");
      v15 = (UIHandleStatusBarTapAction *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[UIHandleStatusBarTapAction statusBar:didTriggerButtonType:withAction:](v15, "statusBar:didTriggerButtonType:withAction:", self, v14, 0);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[UIHandleStatusBarTapAction statusBar:didTriggerButtonType:withAction:context:](v15, "statusBar:didTriggerButtonType:withAction:context:", self, v14, 0, 0);
    }

LABEL_19:
    objc_msgSend(v8, "objectsPassingTest:", &__block_literal_global_100);
    v19 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v19;
    goto LABEL_20;
  }
LABEL_9:

LABEL_20:
  if (objc_msgSend(v8, "count"))
  {
    v20.receiver = self;
    v20.super_class = (Class)UIStatusBar;
    -[_UIScrollsToTopInitiatorView touchesEnded:withEvent:](&v20, sel_touchesEnded_withEvent_, v8, v7);
  }

}

- (void)setEnabledCenterItems:(id)a3 duration:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  unint64_t v15;
  _BOOL8 v16;
  unint64_t v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  id v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E1A9A290);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && (v9 = objc_msgSend(v7, "BOOLValue"), self->_currentRawData.itemIsEnabled[0] != v9))
  {
    self->_currentRawData.itemIsEnabled[0] = v9;
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E1A9A2A8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 && (v13 = objc_msgSend(v11, "BOOLValue"), self->_currentRawData.itemIsEnabled[39] != v13))
  {
    self->_currentRawData.itemIsEnabled[39] = v13;
  }
  else if (!v10)
  {
    goto LABEL_21;
  }
  -[UIStatusBar _currentComposedData](self, "_currentComposedData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIStatusBarForegroundView ignoringData](self->_newStyleForegroundView, "ignoringData")
    || -[UIStatusBarForegroundView ignoringData](self->_foregroundView, "ignoringData"))
  {
    v15 = qword_1ECD7AFA0;
    if (!qword_1ECD7AFA0)
    {
      v15 = __UILogCategoryGetNode("StatusBar", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v15, (unint64_t *)&qword_1ECD7AFA0);
    }
    if ((*(_BYTE *)v15 & 1) != 0)
    {
      v18 = *(NSObject **)(v15 + 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v20 = 138412546;
        v21 = v6;
        v22 = 2048;
        v23 = a4;
        _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "Setting center items enabled: %@, duration: %f. Pending the update instead.", (uint8_t *)&v20, 0x16u);
      }
    }
    -[UIStatusBarForegroundView setStatusBarData:actions:animated:](self->_newStyleForegroundView, "setStatusBarData:actions:animated:", v14, 64, 0);
    -[UIStatusBarForegroundView setStatusBarData:actions:animated:](self->_foregroundView, "setStatusBarData:actions:animated:", v14, 64, 0);
  }
  else
  {
    v16 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
    +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 1);
    v17 = qword_1ECD7AFA8;
    if (!qword_1ECD7AFA8)
    {
      v17 = __UILogCategoryGetNode("StatusBar", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v17, (unint64_t *)&qword_1ECD7AFA8);
    }
    if ((*(_BYTE *)v17 & 1) != 0)
    {
      v19 = *(NSObject **)(v17 + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = 138412546;
        v21 = v6;
        v22 = 2048;
        v23 = a4;
        _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "Crossfade setting center items enabled: %@, duration: %f", (uint8_t *)&v20, 0x16u);
      }
    }
    -[UIStatusBarForegroundView reflowItemViewsCrossfadingCenter:duration:](self->_newStyleForegroundView, "reflowItemViewsCrossfadingCenter:duration:", v14, a4);
    -[UIStatusBarForegroundView reflowItemViewsCrossfadingCenter:duration:](self->_foregroundView, "reflowItemViewsCrossfadingCenter:duration:", v14, a4);
    +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v16);
  }

LABEL_21:
}

- (void)animateUnlock
{
  -[UIStatusBarForegroundView animateUnlock](self->_foregroundView, "animateUnlock");
  -[UIStatusBarForegroundView animateUnlock](self->_newStyleForegroundView, "animateUnlock");
}

- (void)jiggleLockIcon
{
  -[UIStatusBarForegroundView jiggleLockIcon](self->_foregroundView, "jiggleLockIcon");
  -[UIStatusBarForegroundView jiggleLockIcon](self->_newStyleForegroundView, "jiggleLockIcon");
}

- (void)_itemViewPerformButtonAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBar_Base styleDelegate](self, "styleDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isDescendantOfView:", self))
  {
    objc_msgSend(v14, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("buttonType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

    objc_msgSend(v14, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("buttonAction"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "statusBar:didTriggerButtonType:withAction:", self, v8, v11);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v14, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("buttonContext"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "statusBar:didTriggerButtonType:withAction:context:", self, v8, v11, v13);
    }
  }

}

- (void)setRegistered:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIStatusBar;
  -[UIStatusBar_Base setRegistered:](&v4, sel_setRegistered_, a3);
  -[UIStatusBar _updatePersistentAnimationsEnabledForForegroundView:](self, "_updatePersistentAnimationsEnabledForForegroundView:", self->_foregroundView);
  -[UIStatusBar _updatePersistentAnimationsEnabledForForegroundView:](self, "_updatePersistentAnimationsEnabledForForegroundView:", self->_newStyleForegroundView);
}

- (void)_updatePersistentAnimationsEnabledForForegroundView:(id)a3
{
  _BOOL8 v4;
  id v5;

  v5 = a3;
  if (-[UIStatusBar_Base registered](self, "registered"))
    v4 = -[UIStatusBar_Base persistentAnimationsEnabled](self, "persistentAnimationsEnabled");
  else
    v4 = 0;
  objc_msgSend(v5, "setPersistentAnimationsEnabled:", v4);

}

- (void)setPersistentAnimationsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[UIStatusBar_Base persistentAnimationsEnabled](self, "persistentAnimationsEnabled") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIStatusBar;
    -[UIStatusBar_Base setPersistentAnimationsEnabled:](&v5, sel_setPersistentAnimationsEnabled_, v3);
    -[UIStatusBar _updatePersistentAnimationsEnabledForForegroundView:](self, "_updatePersistentAnimationsEnabledForForegroundView:", self->_foregroundView);
    -[UIStatusBar _updatePersistentAnimationsEnabledForForegroundView:](self, "_updatePersistentAnimationsEnabledForForegroundView:", self->_newStyleForegroundView);
  }
}

- (void)setForegroundColor:(id)a3 animationParameters:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  -[UIStatusBar_Base foregroundColor](self, "foregroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v6);

  if ((v9 & 1) == 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)UIStatusBar;
    -[UIStatusBar_Base setForegroundColor:animationParameters:](&v12, sel_setForegroundColor_animationParameters_, v6, v7);
    -[UIStatusBar styleRequest](self, "styleRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStatusBar _styleAttributesForRequest:](self, "_styleAttributesForRequest:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIStatusBar _updateUIWithStyleAttributes:animationParameters:](self, "_updateUIWithStyleAttributes:animationParameters:", v11, v7);
  }

}

- (void)setForegroundAlpha:(double)a3 animationParameters:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  -[UIStatusBar styleRequest](self, "styleRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBar _styleAttributesForRequest:](self, "_styleAttributesForRequest:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "copy");

  objc_msgSend(v9, "setForegroundAlpha:", a3);
  -[UIStatusBar _updateUIWithStyleAttributes:animationParameters:](self, "_updateUIWithStyleAttributes:animationParameters:", v9, v6);

}

- (void)setLegibilityStyle:(int64_t)a3 animationParameters:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v6 = a4;
  if (-[UIStatusBar_Base legibilityStyle](self, "legibilityStyle") != a3)
  {
    v9.receiver = self;
    v9.super_class = (Class)UIStatusBar;
    -[UIStatusBar_Base setLegibilityStyle:animationParameters:](&v9, sel_setLegibilityStyle_animationParameters_, a3, v6);
    -[UIStatusBar styleRequest](self, "styleRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStatusBar _styleAttributesForRequest:](self, "_styleAttributesForRequest:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIStatusBar _updateUIWithStyleAttributes:animationParameters:](self, "_updateUIWithStyleAttributes:animationParameters:", v8, v6);
  }

}

- (id)currentStyleRequestForStyle:(int64_t)a3
{
  double v5;
  UIStatusBarStyleRequest *v6;
  int64_t v7;
  void *v8;
  UIStatusBarStyleRequest *v9;

  if (a3 == 110)
    v5 = 0.4;
  else
    v5 = 1.0;
  v6 = [UIStatusBarStyleRequest alloc];
  v7 = -[UIStatusBar_Base legibilityStyle](self, "legibilityStyle");
  -[UIStatusBar_Base foregroundColor](self, "foregroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UIStatusBarStyleRequest initWithStyle:legibilityStyle:foregroundColor:foregroundAlpha:overrideHeight:](v6, "initWithStyle:legibilityStyle:foregroundColor:foregroundAlpha:overrideHeight:", a3, v7, v8, self->_overrideHeight, v5);

  return v9;
}

- (id)styleRequest
{
  return -[UIStatusBar currentStyleRequestForStyle:](self, "currentStyleRequestForStyle:", -[UIStatusBar currentStyle](self, "currentStyle"));
}

- (void)setStyleRequest:(id)a3 animationParameters:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIStatusBar;
  v6 = a4;
  -[UIStatusBar_Base setStyleRequest:animationParameters:](&v12, sel_setStyleRequest_animationParameters_, a3, v6);
  if (-[UIStatusBar_Base _requestStyle](self, "_requestStyle") == 2000)
  {
    v7 = 0;
LABEL_5:
    -[UIStatusBar_Base _setRequestedStyle:](self, "_setRequestedStyle:", v7);
    goto LABEL_6;
  }
  if (-[UIStatusBar_Base _requestStyle](self, "_requestStyle") == 2001)
  {
    v7 = 1;
    goto LABEL_5;
  }
LABEL_6:
  v11 = 0;
  -[UIStatusBar_Base _getStyle:andActiveOverride:forRequestedStyle:](self, "_getStyle:andActiveOverride:forRequestedStyle:", &v11, &v10, -[UIStatusBar_Base _requestStyle](self, "_requestStyle", 0));
  -[UIStatusBar_Base setActiveStyleOverride:](self, "setActiveStyleOverride:", v10);
  -[UIStatusBar currentStyleRequestForStyle:](self, "currentStyleRequestForStyle:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBar _styleAttributesForRequest:](self, "_styleAttributesForRequest:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBar _updateUIWithStyleAttributes:animationParameters:](self, "_updateUIWithStyleAttributes:animationParameters:", v9, v6);

}

- (id)_currentStyleAttributes
{
  UIStatusBarStyleAttributes *v3;
  void *v4;

  v3 = self->_styleAttributes;
  if (!v3)
  {
    -[UIStatusBar currentStyleRequestForStyle:](self, "currentStyleRequestForStyle:", -[UIStatusBar_Base styleForRequestedStyle:](self, "styleForRequestedStyle:", -[UIStatusBar_Base _requestStyle](self, "_requestStyle")));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStatusBar _styleAttributesForRequest:](self, "_styleAttributesForRequest:", v4);
    v3 = (UIStatusBarStyleAttributes *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)setAction:(id)a3 forPartWithIdentifier:(id)a4
{
  id v6;
  NSMutableDictionary *actions;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  actions = self->_actions;
  if (!actions)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = self->_actions;
    self->_actions = v8;

    actions = self->_actions;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](actions, "setObject:forKeyedSubscript:", v10, v6);

}

- (id)actionForPartWithIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_actions, "objectForKeyedSubscript:", a3);
}

- (CGRect)frameForPartWithIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect v23;
  CGRect result;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("batteryPartIdentifier")) & 1) != 0)
  {
    v5 = 12;
LABEL_5:
    -[UIStatusBarForegroundView frameForItemOfType:](self->_foregroundView, "frameForItemOfType:", v5);
LABEL_11:
    v11 = v6;
    v12 = v7;
    v13 = v8;
    v14 = v9;
    goto LABEL_12;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("clockPartIdentifier")) & 1) != 0)
  {
    v5 = 0;
    goto LABEL_5;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("fittingLeadingPartIdentifier")) & 1) != 0)
  {
    v10 = 0;
LABEL_10:
    -[UIStatusBarForegroundView frameForAllItemsInRegion:](self->_foregroundView, "frameForAllItemsInRegion:", v10);
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("fittingTrailingPartIdentifier")))
  {
    v10 = 1;
    goto LABEL_10;
  }
  v11 = *MEMORY[0x1E0C9D648];
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
LABEL_12:
  v23.origin.x = v11;
  v23.origin.y = v12;
  v23.size.width = v13;
  v23.size.height = v14;
  if (!CGRectIsEmpty(v23))
  {
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", self->_foregroundView, v11, v12, v13, v14);
    v11 = v15;
    v12 = v16;
    v13 = v17;
    v14 = v18;
  }

  v19 = v11;
  v20 = v12;
  v21 = v13;
  v22 = v14;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)setEnabledPartIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (v4 && !objc_msgSend(v4, "count"))
  {
    -[UIView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 1;
  }
  else
  {
    -[UIView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 0;
  }
  objc_msgSend(v5, "setHidden:", v7);

}

- (id)enabledPartIdentifiers
{
  void *v2;
  int v3;

  -[UIView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden");

  if (v3)
    return (id)MEMORY[0x1E0C9AA60];
  else
    return 0;
}

- (id)disabledPartIdentifiers
{
  return 0;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  char v8;
  UIStatusBarForegroundView *foregroundView;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UIStatusBar;
  if (-[UIView pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y))
  {
    v8 = 1;
  }
  else
  {
    foregroundView = self->_foregroundView;
    -[UIView convertPoint:fromView:](foregroundView, "convertPoint:fromView:", self, x, y);
    v8 = -[UIStatusBarForegroundView pointInside:withEvent:](foregroundView, "pointInside:withEvent:", v7);
  }

  return v8;
}

- (void)_didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5
{
  UIStatusBarForegroundView *foregroundView;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIStatusBar;
  -[UIView _didChangeFromIdiom:onScreen:traverseHierarchy:](&v8, sel__didChangeFromIdiom_onScreen_traverseHierarchy_, a3, a4, a5);
  foregroundView = self->_foregroundView;
  -[UIStatusBar _currentComposedData](self, "_currentComposedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBarForegroundView setStatusBarData:actions:animated:](foregroundView, "setStatusBarData:actions:animated:", v7, 0, 0);

}

+ (void)_setDeviceUserInterfaceLayoutDirection:(int64_t)a3
{
  _deviceUserInterfaceLayoutDirection = a3;
}

+ (int64_t)_deviceUserInterfaceLayoutDirection
{
  return _deviceUserInterfaceLayoutDirection;
}

- (BOOL)_shouldReverseLayoutDirection
{
  return _deviceUserInterfaceLayoutDirection == 1;
}

- (void)_setDisablesRasterization:(BOOL)a3
{
  self->_disablesRasterization = a3;
  -[UIStatusBar _updateShouldRasterize](self, "_updateShouldRasterize");
}

- (void)_updateShouldRasterize
{
  _BOOL8 v3;
  void *v4;
  int v5;
  id v6;

  if (-[NSMutableSet count](self->_disableRasterizationReasons, "count"))
    v3 = 0;
  else
    v3 = !self->_disablesRasterization;
  -[UIView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldRasterize");

  if (v3 != v5)
  {
    -[UIView layer](self, "layer");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShouldRasterize:", v3);

  }
}

- (void)_beginDisablingRasterizationForReason:(id)a3
{
  id v4;

  v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_disableRasterizationReasons, "containsObject:") & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_disableRasterizationReasons, "addObject:", v4);
    -[UIStatusBar _updateShouldRasterize](self, "_updateShouldRasterize");
  }

}

- (void)_endDisablingRasterizationForReason:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSMutableSet containsObject:](self->_disableRasterizationReasons, "containsObject:"))
  {
    -[NSMutableSet removeObject:](self->_disableRasterizationReasons, "removeObject:", v4);
    -[UIStatusBar _updateShouldRasterize](self, "_updateShouldRasterize");
  }

}

- (void)_itemViewShouldBeginDisablingRasterization:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isDescendantOfView:", self))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "item");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithUnsignedInt:", objc_msgSend(v5, "type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIStatusBar _beginDisablingRasterizationForReason:](self, "_beginDisablingRasterizationForReason:", v6);
  }

}

- (void)_itemViewShouldEndDisablingRasterization:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isDescendantOfView:", self))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "item");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithUnsignedInt:", objc_msgSend(v5, "type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIStatusBar _endDisablingRasterizationForReason:](self, "_endDisablingRasterizationForReason:", v6);
  }

}

- (void)statusBarServer:(id)a3 didReceiveStatusBarData:(id *)a4 withActions:(int)a5
{
  uint64_t v5;
  void *v8;
  _BOOL4 v9;
  BOOL *v10;
  char v11;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  UIStatusBarForegroundView *foregroundView;
  void *v17;
  UIStatusBarForegroundView *newStyleForegroundView;
  void *v19;
  id v20;

  v5 = *(_QWORD *)&a5;
  -[UIStatusBar_Base inProcessStateProvider](self, "inProcessStateProvider", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if ((_shouldAutomaticallyDetectCenterItemAnimation & 1) != 0)
    {
      if (!a4)
      {
        v20 = 0;
LABEL_20:
        foregroundView = self->_foregroundView;
        -[UIStatusBar _currentComposedData](self, "_currentComposedData");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIStatusBarForegroundView setStatusBarData:actions:animated:](foregroundView, "setStatusBarData:actions:animated:", v17, v5, 1);

        newStyleForegroundView = self->_newStyleForegroundView;
        -[UIStatusBar _currentComposedData](self, "_currentComposedData");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIStatusBarForegroundView setStatusBarData:actions:animated:](newStyleForegroundView, "setStatusBarData:actions:animated:", v19, v5, 1);

        return;
      }
      v20 = 0;
      v9 = 0;
      goto LABEL_8;
    }
    if (a4->var0[0] == self->_currentRawData.itemIsEnabled[0])
    {
      v10 = &a4->var0[39];
      if (a4->var0[39] == self->_currentRawData.itemIsEnabled[39])
      {
        v20 = 0;
        v9 = 0;
LABEL_8:
        v11 = 1;
LABEL_15:
        memcpy(&self->_currentRawData, a4, sizeof(self->_currentRawData));
        +[UIStatusBar _setDeviceUserInterfaceLayoutDirection:](UIStatusBar, "_setDeviceUserInterfaceLayoutDirection:", ((unint64_t)*((unsigned __int8 *)&self->_currentRawData + 2536) >> 1) & 1);
        if ((v11 & 1) == 0 && (_shouldAutomaticallyDetectCenterItemAnimation & 1) == 0)
        {
          if (v9)
          {
            -[UIStatusBarForegroundView animateUnlock](self->_foregroundView, "animateUnlock");
            -[UIStatusBarForegroundView animateUnlock](self->_newStyleForegroundView, "animateUnlock");
          }
          -[UIStatusBar setEnabledCenterItems:duration:](self, "setEnabledCenterItems:duration:", v20, 0.4);
        }
        goto LABEL_20;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a4->var0[0]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v12, &unk_1E1A9A290);

      v10 = &a4->var0[39];
      v13 = a4->var0[39];
      if (v13 == self->_currentRawData.itemIsEnabled[39])
      {
        v9 = 0;
        v11 = 0;
        goto LABEL_15;
      }
      v14 = (uint64_t)v20;
      if (v20)
      {
LABEL_14:
        v20 = (id)v14;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v15, &unk_1E1A9A2A8);

        v11 = 0;
        v9 = !*v10;
        goto LABEL_15;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    v13 = *v10;
    goto LABEL_14;
  }
}

- (void)statusBarServer:(id)a3 didReceiveStyleOverrides:(unint64_t)a4
{
  id v6;
  objc_super v7;

  v6 = a3;
  if (-[UIStatusBar_Base styleOverrides](self, "styleOverrides") != a4)
  {
    v7.receiver = self;
    v7.super_class = (Class)UIStatusBar;
    -[UIStatusBar_Base statusBarServer:didReceiveStyleOverrides:](&v7, sel_statusBarServer_didReceiveStyleOverrides_, v6, a4);
    -[UIStatusBar_Base requestStyle:animated:](self, "requestStyle:animated:", -[UIStatusBar_Base _requestStyle](self, "_requestStyle"), 1);
  }
  self->_waitingOnCallbackAfterChangingStyleOverridesLocally = 0;

}

- (void)statusBarServer:(id)a3 didReceiveGlowAnimationState:(BOOL)a4 forStyle:(int64_t)a5
{
  _BOOL8 v5;

  v5 = a4;
  if (-[UIStatusBar currentStyle](self, "currentStyle", a3) == a5)
    -[UIStatusBarBackgroundView setGlowAnimationEnabled:](self->_backgroundView, "setGlowAnimationEnabled:", v5);
}

- (void)statusBarServer:(id)a3 didReceiveDoubleHeightStatusString:(id)a4 forStyle:(int64_t)a5
{
  id v7;

  v7 = a4;
  if (-[UIStatusBar currentStyle](self, "currentStyle") == a5
    && !-[UIStatusBar _shouldUseInProcessProviderDoubleHeightStatusString](self, "_shouldUseInProcessProviderDoubleHeightStatusString"))
  {
    -[UIStatusBar _setDoubleHeightStatusString:](self, "_setDoubleHeightStatusString:", v7);
  }

}

- (void)statusBarStateProvider:(id)a3 didPostStatusBarData:(id *)a4 withActions:(int)a5
{
  uint64_t v5;
  UIStatusBarForegroundView *foregroundView;
  void *v8;
  UIStatusBarForegroundView *newStyleForegroundView;
  id v10;

  v5 = *(_QWORD *)&a5;
  if (a4)
    memcpy(&self->_currentRawData, a4, sizeof(self->_currentRawData));
  +[UIStatusBar _setDeviceUserInterfaceLayoutDirection:](UIStatusBar, "_setDeviceUserInterfaceLayoutDirection:", ((unint64_t)*((unsigned __int8 *)&self->_currentRawData + 2536) >> 1) & 1);
  foregroundView = self->_foregroundView;
  -[UIStatusBar _currentComposedData](self, "_currentComposedData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBarForegroundView setStatusBarData:actions:animated:](foregroundView, "setStatusBarData:actions:animated:", v8, v5, 1);

  newStyleForegroundView = self->_newStyleForegroundView;
  -[UIStatusBar _currentComposedData](self, "_currentComposedData");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[UIStatusBarForegroundView setStatusBarData:actions:animated:](newStyleForegroundView, "setStatusBarData:actions:animated:", v10, v5, 1);

}

- (void)statusBarStateProvider:(id)a3 didChangeDoubleHeightStatusStringForStyle:(int64_t)a4
{
  id v6;

  if (-[UIStatusBar currentStyle](self, "currentStyle", a3) == a4)
  {
    if (-[UIStatusBar _shouldUseInProcessProviderDoubleHeightStatusString](self, "_shouldUseInProcessProviderDoubleHeightStatusString"))
    {
      -[UIStatusBar _doubleHeightStatusStringForStyle:](self, "_doubleHeightStatusStringForStyle:", a4);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[UIStatusBar _setDoubleHeightStatusString:](self, "_setDoubleHeightStatusString:", v6);

    }
  }
}

- (id)_backgroundView
{
  return self->_backgroundView;
}

- (BOOL)_isTransparent
{
  void *v2;
  char v3;

  -[UIStatusBarBackgroundView style](self->_backgroundView, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isTransparent");

  return v3;
}

- (id)_currentComposedData
{
  return -[UIStatusBar _currentComposedDataForStyle:](self, "_currentComposedDataForStyle:", self->_styleAttributes);
}

- (id)_currentComposedDataForStyle:(id)a3
{
  id v4;
  UIStatusBarComposedData *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  _BOOL4 v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _BYTE v22[3];
  _BYTE __dst[3880];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  memset(__dst, 0, 512);
  if (-[UIStatusBar_Base localDataOverrides](self, "localDataOverrides"))
    +[UIStatusBar getData:forRequestedData:withOverrides:](UIStatusBar, "getData:forRequestedData:withOverrides:", __dst, &self->_currentRawData, -[UIStatusBar_Base localDataOverrides](self, "localDataOverrides"));
  else
    memcpy(__dst, &self->_currentRawData, sizeof(__dst));
  v5 = -[UIStatusBarComposedData initWithRawData:]([UIStatusBarComposedData alloc], "initWithRawData:", __dst);
  -[UIStatusBar_Base styleDelegate](self, "styleDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "statusBarSystemNavigationAction:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStatusBarComposedData setSystemNavigationItem:](v5, "setSystemNavigationItem:", v7);

  }
  -[UIStatusBarComposedData setDoubleHeightStatus:](v5, "setDoubleHeightStatus:", self->_currentDoubleHeightText);
  v22[0] = !self->_showOnlyCenterItems;
  v22[1] = v22[0];
  v22[2] = 1;
  v8 = objc_msgSend(v4, "idiom");
  -[UIView _screen](self, "_screen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_capabilities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 46;
  do
  {
    v12 = -[UIStatusBar_Base homeItemsDisabled](self, "homeItemsDisabled");
    if ((_DWORD)v11 == 46 && v12)
      v13 = 0;
    else
      v13 = objc_msgSend(v4, "shouldShowInternalItemType:withScreenCapabilities:", v11, v10);
    -[UIStatusBarComposedData setItem:enabled:](v5, "setItem:enabled:", v11, v13);
    v14 = +[UIStatusBarItem isItemWithTypeExclusive:outBlacklistItems:outWhitelistItems:](UIStatusBarItem, "isItemWithTypeExclusive:outBlacklistItems:outWhitelistItems:", v11, 0, 0);
    if ((_DWORD)v13 && v14)
    {
      for (i = 0; i != 3; ++i)
      {
        if (+[UIStatusBarItem itemType:idiom:appearsInRegion:](UIStatusBarItem, "itemType:idiom:appearsInRegion:", v11, v8, i))
        {
          v22[i] = 0;
        }
      }
    }
    v11 = (v11 + 1);
  }
  while ((_DWORD)v11 != 52);
  v16 = 0;
  do
  {
    if (+[UIStatusBarItem itemType:idiom:canBeEnabledForData:style:](UIStatusBarItem, "itemType:idiom:canBeEnabledForData:style:", v16, v8, v5, v4))
    {
      v17 = 0;
      while (v22[v17]
           || !+[UIStatusBarItem itemType:idiom:appearsInRegion:](UIStatusBarItem, "itemType:idiom:appearsInRegion:", v16, v8, v17))
      {
        if (++v17 == 3)
        {
          v18 = 1;
          goto LABEL_26;
        }
      }
    }
    v18 = 0;
LABEL_26:
    -[UIStatusBarComposedData setItem:enabled:](v5, "setItem:enabled:", v16, v18);
    v16 = (v16 + 1);
  }
  while ((_DWORD)v16 != 46);
  v19 = (void *)CFPreferencesCopyAppValue(CFSTR("StatusBarPrimaryNavigationTitleOverride"), CFSTR("com.apple.UIKit"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v19, "length"))
    strncpy((char *)(-[UIStatusBarComposedData rawData](v5, "rawData") + 2537), (const char *)objc_msgSend(objc_retainAutorelease(v19), "UTF8String"), 0x100uLL);
  v20 = (void *)CFPreferencesCopyAppValue(CFSTR("StatusBarSecondaryNavigationURLOverride"), CFSTR("com.apple.UIKit"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v20, "length"))
    strncpy((char *)(-[UIStatusBarComposedData rawData](v5, "rawData") + 2793), (const char *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String"), 0x100uLL);

  return v5;
}

- (void)_setOverrideHeight:(double)a3
{
  NSNumber *overrideHeight;
  double v6;
  NSNumber *v7;
  NSNumber *v8;

  overrideHeight = self->_overrideHeight;
  if (!overrideHeight || (-[NSNumber doubleValue](overrideHeight, "doubleValue"), v6 != a3))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_overrideHeight;
    self->_overrideHeight = v7;

  }
}

- (void)_clearOverrideHeight
{
  NSNumber *overrideHeight;

  overrideHeight = self->_overrideHeight;
  self->_overrideHeight = 0;

}

- (void)_performBlockWhileIgnoringForegroundViewChanges:(id)a3
{
  self->_foregroundViewShouldIgnoreStatusBarDataDuringAnimation = 1;
  if (a3)
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_foregroundViewShouldIgnoreStatusBarDataDuringAnimation = 0;
}

- (BOOL)_rectIntersectsTimeItem:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  return -[UIStatusBarForegroundView rectIntersectsTimeItem:](self->_foregroundView, "rectIntersectsTimeItem:")
      || -[UIStatusBarForegroundView rectIntersectsTimeItem:](self->_newStyleForegroundView, "rectIntersectsTimeItem:", x, y, width, height);
}

- (void)_dateTimePreferencesUpdated
{
  UIStatusBarForegroundView *foregroundView;
  id v3;

  foregroundView = self->_foregroundView;
  -[UIStatusBar _currentComposedData](self, "_currentComposedData");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIStatusBarForegroundView setStatusBarData:actions:animated:](foregroundView, "setStatusBarData:actions:animated:", v3, 512, 0);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  objc_super v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  _UIKitUserDefaults();
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v11)
  {
    -[UIStatusBar _dateTimePreferencesUpdated](self, "_dateTimePreferencesUpdated");
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)UIStatusBar;
    -[UIStatusBar observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (BOOL)disablesRasterization
{
  return self->_disablesRasterization;
}

- (BOOL)isTimeHidden
{
  return self->_timeHidden;
}

- (void)setTimeHidden:(BOOL)a3
{
  self->_timeHidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_disableRasterizationReasons, 0);
  objc_storeStrong((id *)&self->_overrideHeight, 0);
  objc_storeStrong((id *)&self->_nextTintTransition, 0);
  objc_storeStrong((id *)&self->_lastUsedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_slidingStatusBar, 0);
  objc_storeStrong((id *)&self->_newStyleForegroundView, 0);
  objc_storeStrong((id *)&self->_newStyleBackgroundView, 0);
  objc_storeStrong((id *)&self->_interruptedAnimationCompositeViews, 0);
  objc_storeStrong((id *)&self->_currentDoubleHeightText, 0);
  objc_storeStrong((id *)&self->_doubleHeightLabelContainer, 0);
  objc_storeStrong((id *)&self->_doubleHeightLabel, 0);
  objc_storeStrong((id *)&self->_foregroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

uint64_t __51__UIStatusBar_Base__setHidden_animationParameters___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__UIStatusBar_Base__performAnimations_withParameters_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__UIStatusBar_Base__performAnimations_withParameters_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "isCancelled") ^ 1);
}

uint64_t __91__UIStatusBar_Modern__initWithFrame_showForegroundView_wantsServer_inProcessStateProvider___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  void *v3;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "styleDelegate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = 1;
  if (WeakRetained && v2 && (objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "statusBarShouldDisableRegionActions:", WeakRetained) ^ 1;

  return v4;
}

uint64_t __106__UIStatusBar_Modern__requestStyle_partStyles_legibilityStyle_foregroundColor_animationParameters_forced___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  void *v4;
  _QWORD v5[5];

  v2 = *(_QWORD *)(a1 + 56);
  result = objc_msgSend(*(id *)(a1 + 32), "_requestStyle");
  if (v2 == result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateWithData:force:", 0, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "setStyle:", *(_QWORD *)(a1 + 64));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "setForegroundColor:", *(_QWORD *)(a1 + 40));
    v4 = *(void **)(a1 + 48);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __106__UIStatusBar_Modern__requestStyle_partStyles_legibilityStyle_foregroundColor_animationParameters_forced___block_invoke_2;
    v5[3] = &unk_1E16C80B8;
    v5[4] = *(_QWORD *)(a1 + 32);
    return objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);
  }
  return result;
}

void __106__UIStatusBar_Modern__requestStyle_partStyles_legibilityStyle_foregroundColor_animationParameters_forced___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "setStyle:forPartWithIdentifier:", objc_msgSend(a3, "integerValue"), v5);

}

uint64_t __61__UIStatusBar_Modern_setForegroundAlpha_animationParameters___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "setAlpha:", *(double *)(a1 + 40));
}

uint64_t __34__UIStatusBar_Modern_forceUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateWithData:force:", 0, 1);
}

uint64_t __38__UIStatusBar_Modern_forceUpdateData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateWithData:force:", *(_QWORD *)(a1 + 40), 0);
}

@end
