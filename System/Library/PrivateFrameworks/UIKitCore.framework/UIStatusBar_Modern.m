@implementation UIStatusBar_Modern

+ (double)_heightForStyle:(int64_t)a3 orientation:(int64_t)a4 forStatusBarFrame:(BOOL)a5 inWindow:(id)a6 isAzulBLinked:(BOOL)a7
{
  _BOOL8 v7;
  void *v10;
  double v11;
  double v12;

  v7 = a7;
  +[UIScreen mainScreen](UIScreen, "mainScreen", a3, a4, a5, a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBar intrinsicContentSizeForTargetScreen:orientation:onLockScreen:isAzulBLinked:](_UIStatusBar, "intrinsicContentSizeForTargetScreen:orientation:onLockScreen:isAzulBLinked:", v10, a4, a3 == 306, v7);
  v12 = v11;

  return v12;
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
  id v14;
  _UIStatusBar *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;
  objc_super v23;

  v6 = a5;
  v7 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)UIStatusBar_Modern;
  v14 = -[UIStatusBar_Base _initWithFrame:showForegroundView:wantsServer:inProcessStateProvider:](&v23, sel__initWithFrame_showForegroundView_wantsServer_inProcessStateProvider_, v7, v6, v13, x, y, width, height);
  if (v14)
  {
    v15 = -[_UIStatusBar initWithStyle:]([_UIStatusBar alloc], "initWithStyle:", 0);
    objc_msgSend(v14, "addSubview:", v15);
    objc_msgSend(v14, "_setRequestedStyle:", 0);
    objc_initWeak(&location, v14);
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __91__UIStatusBar_Modern__initWithFrame_showForegroundView_wantsServer_inProcessStateProvider___block_invoke;
    v20 = &unk_1E16B6588;
    objc_copyWeak(&v21, &location);
    -[_UIStatusBar setRegionActionValidationBlock:](v15, "setRegionActionValidationBlock:", &v17);
    objc_msgSend(v14, "setStatusBar:", v15, v17, v18, v19, v20);
    objc_msgSend(v14, "_evaluateServerRegistration");
    objc_msgSend(v14, "setNeedsLayout");
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
  return v14;
}

+ (int64_t)_defaultStyleForRequestedStyle:(int64_t)a3 styleOverrides:(unint64_t)a4 activeStyleOverride:(unint64_t *)a5
{
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___UIStatusBar_Modern;
  objc_msgSendSuper2(&v7, sel__defaultStyleForRequestedStyle_styleOverrides_activeStyleOverride_, a3, a4, a5);
  return a3;
}

- (void)_updateSemanticContentAttributeFromLegacyData:(id *)a3
{
  uint64_t v3;

  if ((*((_BYTE *)a3 + 2536) & 2) != 0)
    v3 = 4;
  else
    v3 = 3;
  -[_UIStatusBar setSemanticContentAttribute:](self->_statusBar, "setSemanticContentAttribute:", v3);
}

- (id)_dataFromLegacyData:(id *)a3
{
  void *v5;
  const $6C45178016D353444451090973A2A97F *v6;
  void *v7;
  _OWORD v9[242];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[UIStatusBar_Base localDataOverrides](self, "localDataOverrides"))
  {
    memset(&v9[30], 0, 32);
    +[UIStatusBar getData:forRequestedData:withOverrides:](UIStatusBar, "getData:forRequestedData:withOverrides:", v9, a3, -[UIStatusBar_Base localDataOverrides](self, "localDataOverrides", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0));
    -[_UIStatusBar currentData](self->_statusBar, "currentData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (const $6C45178016D353444451090973A2A97F *)v9;
  }
  else
  {
    -[_UIStatusBar currentData](self->_statusBar, "currentData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a3;
  }
  +[_UIStatusBarDataConverter convertData:fromReferenceData:](_UIStatusBarDataConverter, "convertData:fromReferenceData:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)_effectiveStyleFromStyle:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  int64_t result;

  switch(a3)
  {
    case 300:
    case 304:
    case 305:
LABEL_5:
      a3 = 0;
      goto LABEL_10;
    case 301:
    case 302:
    case 303:
    case 306:
LABEL_9:
      a3 = 1;
LABEL_10:
      result = a3;
      break;
    default:
      switch(a3)
      {
        case 'g':
        case 'j':
        case 'l':
          goto LABEL_9;
        case 'h':
        case 'i':
          goto LABEL_12;
        case 'k':
          goto LABEL_5;
        case 'm':
          a3 = 3;
          goto LABEL_10;
        case 'n':
          a3 = 110;
          goto LABEL_10;
        default:
          if ((unint64_t)a3 > 0x33)
            goto LABEL_12;
          if (((1 << a3) & 0xB) != 0)
            goto LABEL_10;
          if (((1 << a3) & 0x8000000000004) != 0)
            goto LABEL_9;
LABEL_12:
          result = _UIStatusBarStyleFromResolvedStyle(-[_UIStatusBar style](self->_statusBar, "style", v3, v4));
          break;
      }
      break;
  }
  return result;
}

- (id)_effectiveDataFromData:(id)a3 activeOverride:(unint64_t)a4 canUpdateBackgroundActivity:(BOOL)a5
{
  _BOOL4 v5;
  _UIStatusBarData *v8;
  _UIStatusBarDataBackgroundActivityEntry *v9;
  _UIStatusBarDataBackgroundActivityEntry *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  double v15;
  void *v16;
  void *v17;
  _UIStatusBarData *v18;

  v5 = a5;
  v8 = (_UIStatusBarData *)a3;
  v9 = objc_alloc_init(_UIStatusBarDataBackgroundActivityEntry);
  v10 = v9;
  if ((uint64_t)a4 >= 0x200000)
  {
    if ((uint64_t)a4 <= 0x7FFFFFFF)
    {
      if ((uint64_t)a4 <= 0x3FFFFFF)
      {
        if ((uint64_t)a4 < 0x800000)
        {
          if (a4 == 0x200000)
          {
            v11 = 31;
            goto LABEL_96;
          }
          if (a4 == 0x400000)
          {
            v11 = 27;
            goto LABEL_96;
          }
        }
        else
        {
          switch(a4)
          {
            case 0x800000uLL:
              v11 = 28;
              goto LABEL_96;
            case 0x1000000uLL:
              v11 = 11;
              goto LABEL_96;
            case 0x2000000uLL:
              v11 = 12;
              goto LABEL_96;
          }
        }
        goto LABEL_111;
      }
      if ((uint64_t)a4 <= 0xFFFFFFF)
      {
        if (a4 == 0x4000000)
        {
          v11 = 13;
          goto LABEL_96;
        }
        if (a4 == 0x8000000)
        {
          v11 = 2;
          goto LABEL_96;
        }
        goto LABEL_111;
      }
      if (a4 == 0x10000000)
      {
        v11 = 3;
        goto LABEL_96;
      }
      if (a4 == 0x20000000)
      {
        v11 = 0;
        goto LABEL_96;
      }
      v12 = 0x40000000;
    }
    else
    {
      if ((uint64_t)a4 > 0xFFFFFFFFFLL)
      {
        if ((uint64_t)a4 > 0x7FFFFFFFFFLL)
        {
          switch(a4)
          {
            case 0x8000000000uLL:
              v11 = 5;
              goto LABEL_96;
            case 0x10000000000uLL:
              v11 = 21;
              goto LABEL_96;
            case 0x20000000000uLL:
              v11 = 16;
              goto LABEL_96;
          }
        }
        else
        {
          switch(a4)
          {
            case 0x1000000000uLL:
              v11 = 8;
              goto LABEL_96;
            case 0x2000000000uLL:
              v11 = 9;
              goto LABEL_96;
            case 0x4000000000uLL:
              v11 = 4;
LABEL_96:
              -[_UIStatusBarDataBackgroundActivityEntry setType:](v9, "setType:", v11);
              goto LABEL_97;
          }
        }
        goto LABEL_111;
      }
      if ((uint64_t)a4 > 0x1FFFFFFFFLL)
      {
        if (a4 != 0x200000000)
        {
          if (a4 == 0x400000000)
          {
            v11 = 22;
            goto LABEL_96;
          }
          if (a4 == 0x800000000)
          {
            v11 = 1;
            goto LABEL_96;
          }
          goto LABEL_111;
        }
LABEL_73:
        v11 = 20;
        goto LABEL_96;
      }
      if (a4 == 0x80000000)
        goto LABEL_73;
      v12 = 0x100000000;
    }
    if (a4 == v12)
    {
      v11 = 19;
      goto LABEL_96;
    }
    goto LABEL_111;
  }
  if ((uint64_t)a4 > 2047)
  {
    if ((uint64_t)a4 >= 0x10000)
    {
      if ((uint64_t)a4 < 0x40000)
      {
        if (a4 == 0x10000)
        {
          v11 = 36;
          goto LABEL_96;
        }
        if (a4 == 0x20000)
        {
          v11 = 10;
          goto LABEL_96;
        }
      }
      else
      {
        switch(a4)
        {
          case 0x40000uLL:
            v11 = 35;
            goto LABEL_96;
          case 0x80000uLL:
            v11 = 37;
            goto LABEL_96;
          case 0x100000uLL:
            v11 = 26;
            goto LABEL_96;
        }
      }
    }
    else if ((uint64_t)a4 < 0x2000)
    {
      if (a4 == 2048)
      {
        v11 = 15;
        goto LABEL_96;
      }
      if (a4 == 4096)
      {
        v11 = 32;
        goto LABEL_96;
      }
    }
    else
    {
      switch(a4)
      {
        case 0x2000uLL:
          v11 = 29;
          goto LABEL_96;
        case 0x4000uLL:
          v11 = 25;
          goto LABEL_96;
        case 0x8000uLL:
          v11 = 30;
          goto LABEL_96;
      }
    }
  }
  else if ((uint64_t)a4 > 63)
  {
    if ((uint64_t)a4 <= 255)
    {
      if (a4 == 64 || a4 == 128)
      {
        v11 = 14;
        goto LABEL_96;
      }
    }
    else
    {
      switch(a4)
      {
        case 0x100uLL:
          v11 = 33;
          goto LABEL_96;
        case 0x200uLL:
          v11 = 23;
          goto LABEL_96;
        case 0x400uLL:
          v11 = 18;
          goto LABEL_96;
      }
    }
  }
  else if ((uint64_t)a4 <= 7)
  {
    if (a4 == 1)
    {
      v11 = 6;
      goto LABEL_96;
    }
    if (a4 == 4)
    {
      v11 = 17;
      goto LABEL_96;
    }
  }
  else
  {
    switch(a4)
    {
      case 8uLL:
        v11 = 34;
        goto LABEL_96;
      case 0x10uLL:
        v11 = 7;
        goto LABEL_96;
      case 0x20uLL:
        v11 = 24;
        goto LABEL_96;
    }
  }
LABEL_111:
  -[_UIStatusBarDataEntry setEnabled:](v9, "setEnabled:", 0);
LABEL_97:
  if (-[_UIStatusBarDataEntry isEnabled](v10, "isEnabled"))
  {
    +[UIStatusBarServer getDoubleHeightStatusStringForStyle:](UIStatusBarServer, "getDoubleHeightStatusStringForStyle:", +[UIStatusBar_Base _defaultStyleForRequestedStyle:styleOverrides:activeStyleOverride:](UIStatusBar, "_defaultStyleForRequestedStyle:styleOverrides:activeStyleOverride:", 0, a4, 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarDataBackgroundActivityEntry setDetailString:](v10, "setDetailString:", v13);

    if (objc_msgSend((id)_effectiveDataFromData_activeOverride_canUpdateBackgroundActivity__lastBackgroundActivityEntry, "isEnabled")&& (v14 = -[_UIStatusBarDataBackgroundActivityEntry type](v10, "type"), v14 == objc_msgSend((id)_effectiveDataFromData_activeOverride_canUpdateBackgroundActivity__lastBackgroundActivityEntry, "type")))
    {
      objc_msgSend((id)_effectiveDataFromData_activeOverride_canUpdateBackgroundActivity__lastBackgroundActivityEntry, "displayStartDate");
    }
    else
    {
      v15 = CACurrentMediaTime();
    }
    -[_UIStatusBarDataBackgroundActivityEntry setDisplayStartDate:](v10, "setDisplayStartDate:", v15);
  }
  if (v5)
    objc_storeStrong((id *)&_effectiveDataFromData_activeOverride_canUpdateBackgroundActivity__lastBackgroundActivityEntry, v10);
  -[_UIStatusBar currentData](self->_statusBar, "currentData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "backgroundActivityEntry");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v8;
  if (!-[_UIStatusBarDataBackgroundActivityEntry isEqual:](v10, "isEqual:", v17))
  {
    if (v8)
    {
      v18 = (_UIStatusBarData *)-[_UIStatusBarData copy](v8, "copy");

    }
    else
    {
      v18 = objc_alloc_init(_UIStatusBarData);
    }
    -[_UIStatusBarData setBackgroundActivityEntry:](v18, "setBackgroundActivityEntry:", v10);
  }

  return v18;
}

- (unint64_t)_implicitStyleOverrideForStyle:(int64_t)a3
{
  unint64_t result;

  result = 0x20000000;
  switch(a3)
  {
    case 200:
LABEL_18:
      result = 1;
      break;
    case 201:
    case 228:
    case 229:
LABEL_32:
      result = 0;
      break;
    case 202:
LABEL_11:
      result = 0x20000;
      break;
    case 203:
LABEL_12:
      result = 0x1000000;
      break;
    case 204:
LABEL_13:
      result = 0x2000000;
      break;
    case 205:
LABEL_14:
      result = 0x4000000;
      break;
    case 206:
LABEL_9:
      result = 4;
      break;
    case 207:
LABEL_4:
      result = 8;
      break;
    case 208:
LABEL_17:
      result = 16;
      break;
    case 209:
      result = 64;
      break;
    case 210:
      result = 128;
      break;
    case 211:
      result = 1024;
      break;
    case 212:
LABEL_7:
      result = 2048;
      break;
    case 213:
LABEL_8:
      result = 0x2000;
      break;
    case 214:
      result = 0x4000;
      break;
    case 215:
      result = 0x8000;
      break;
    case 216:
      result = 0x200000;
      break;
    case 217:
LABEL_10:
      result = 0x10000;
      break;
    case 218:
LABEL_19:
      result = 0x80000;
      break;
    case 219:
LABEL_20:
      result = 0x40000;
      break;
    case 220:
LABEL_16:
      result = 0x8000000;
      break;
    case 221:
LABEL_15:
      result = 0x10000000;
      break;
    case 222:
    case 223:
      return result;
    case 224:
LABEL_21:
      result = 0x40000000;
      break;
    case 225:
LABEL_22:
      result = 0x400000000;
      break;
    case 226:
LABEL_23:
      result = 0x1000000000;
      break;
    case 227:
LABEL_24:
      result = 0x2000000000;
      break;
    case 230:
LABEL_25:
      result = 0x20000000000;
      break;
    default:
      switch(a3)
      {
        case 1001:
          goto LABEL_4;
        case 1002:
          goto LABEL_7;
        case 1003:
          goto LABEL_8;
        case 1004:
          goto LABEL_9;
        case 1005:
          goto LABEL_10;
        case 1006:
          goto LABEL_11;
        case 1007:
          goto LABEL_12;
        case 1008:
          goto LABEL_13;
        case 1009:
          goto LABEL_14;
        case 1010:
          goto LABEL_15;
        case 1011:
          goto LABEL_16;
        case 1012:
          goto LABEL_17;
        case 1013:
          goto LABEL_18;
        case 1014:
          goto LABEL_19;
        case 1015:
          goto LABEL_20;
        case 1016:
        case 1020:
        case 1021:
        case 1025:
        case 1026:
          goto LABEL_32;
        case 1017:
        case 1018:
          return result;
        case 1019:
          goto LABEL_21;
        case 1022:
          goto LABEL_22;
        case 1023:
          goto LABEL_23;
        case 1024:
          goto LABEL_24;
        case 1027:
          goto LABEL_25;
        default:
          switch(a3)
          {
            case 'h':
              result = 32;
              break;
            case 'i':
              result = 256;
              break;
            case 'o':
              result = 0x100000;
              break;
            case 'p':
              result = 4096;
              break;
            case 'q':
              result = 0x400000;
              break;
            case 'r':
              result = 0x800000;
              break;
            default:
              goto LABEL_32;
          }
          break;
      }
      break;
  }
  return result;
}

- (void)_updateWithData:(id)a3 force:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  _UIStatusBarData *v11;
  unint64_t v12;

  v4 = a4;
  v6 = a3;
  if (!v6)
  {
    -[_UIStatusBar currentData](self->_statusBar, "currentData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_11;
  }
  v12 = 0;
  -[UIStatusBar_Base styleDelegate](self, "styleDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v12 = -[UIStatusBar_Base styleOverrides](self, "styleOverrides");
    if (v12)
      goto LABEL_6;
    goto LABEL_5;
  }
  -[UIStatusBar_Base _getStyle:andActiveOverride:forRequestedStyle:](self, "_getStyle:andActiveOverride:forRequestedStyle:", 0, &v12, _UIStatusBarStyleFromResolvedStyle(-[_UIStatusBar style](self->_statusBar, "style")));
  if (!v12)
LABEL_5:
    v12 = -[UIStatusBar_Modern _implicitStyleOverrideForStyle:](self, "_implicitStyleOverrideForStyle:", -[UIStatusBar_Base _requestStyle](self, "_requestStyle"));
LABEL_6:
  -[UIStatusBar_Base setActiveStyleOverride:](self, "setActiveStyleOverride:");
  v9 = -[UIStatusBar_Base activeStyleOverride](self, "activeStyleOverride");
  -[UIStatusBar_Base styleDelegate](self, "styleDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBar_Modern _effectiveDataFromData:activeOverride:canUpdateBackgroundActivity:](self, "_effectiveDataFromData:activeOverride:canUpdateBackgroundActivity:", v6, v9, v10 != 0);
  v11 = (_UIStatusBarData *)objc_claimAutoreleasedReturnValue();

  if (v11 || v4)
  {
    if (!v11)
      v11 = objc_alloc_init(_UIStatusBarData);
    -[_UIStatusBar updateWithData:](self->_statusBar, "updateWithData:", v11);

  }
LABEL_11:

}

- (void)_requestStyle:(int64_t)a3 partStyles:(id)a4 legibilityStyle:(int64_t)a5 foregroundColor:(id)a6 animationParameters:(id)a7 forced:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  id v26;
  int64_t v27;
  uint64_t v28;

  v8 = a8;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  -[UIStatusBar_Base manager](self, "manager");
  v17 = objc_claimAutoreleasedReturnValue();
  if (!v17
    || (v18 = (void *)v17,
        -[UIStatusBar_Base manager](self, "manager"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend(v19, "statusBar:shouldRequestStyle:animationParameters:forced:", self, a3, v16, v8),
        v19,
        v18,
        v20))
  {
    v21 = -[UIStatusBar_Base styleForRequestedStyle:](self, "styleForRequestedStyle:", -[UIStatusBar_Modern _effectiveStyleFromStyle:](self, "_effectiveStyleFromStyle:", a3));
    if (a5 == 1)
      v22 = 1;
    else
      v22 = -1;
    if (a5 == 2)
      v22 = 3;
    if (!a5)
      v22 = v21;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __106__UIStatusBar_Modern__requestStyle_partStyles_legibilityStyle_foregroundColor_animationParameters_forced___block_invoke;
    v24[3] = &unk_1E16C1C58;
    if (v22 == 1)
      v23 = 1;
    else
      v23 = 2 * (v22 == 3);
    v27 = a3;
    v28 = v23;
    v24[4] = self;
    v25 = v15;
    v26 = v14;
    -[UIStatusBar_Base _performAnimations:withParameters:completion:](self, "_performAnimations:withParameters:completion:", v24, v16, 0);

  }
}

- (void)_requestStyle:(int64_t)a3 partStyles:(id)a4 animationParameters:(id)a5 forced:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  int64_t v12;
  id v13;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = -[UIStatusBar_Base legibilityStyle](self, "legibilityStyle");
  -[UIStatusBar_Base foregroundColor](self, "foregroundColor");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[UIStatusBar_Modern _requestStyle:partStyles:legibilityStyle:foregroundColor:animationParameters:forced:](self, "_requestStyle:partStyles:legibilityStyle:foregroundColor:animationParameters:forced:", a3, v11, v12, v13, v10, v6);

}

- (int64_t)currentStyle
{
  return _UIStatusBarStyleFromResolvedStyle(-[_UIStatusBar style](self->_statusBar, "style"));
}

- (void)setStyleRequest:(id)a3 animationParameters:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIStatusBar_Modern;
  v6 = a4;
  v7 = a3;
  -[UIStatusBar_Base setStyleRequest:animationParameters:](&v11, sel_setStyleRequest_animationParameters_, v7, v6);
  v8 = objc_msgSend(v7, "style", v11.receiver, v11.super_class);
  v9 = objc_msgSend(v7, "legibilityStyle");
  objc_msgSend(v7, "foregroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIStatusBar_Modern _requestStyle:partStyles:legibilityStyle:foregroundColor:animationParameters:forced:](self, "_requestStyle:partStyles:legibilityStyle:foregroundColor:animationParameters:forced:", v8, 0, v9, v10, v6, 0);
}

- (void)setForegroundColor:(id)a3 animationParameters:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIStatusBar_Modern;
  v6 = a4;
  v7 = a3;
  -[UIStatusBar_Base setForegroundColor:animationParameters:](&v8, sel_setForegroundColor_animationParameters_, v7, v6);
  -[UIStatusBar_Modern _requestStyle:partStyles:legibilityStyle:foregroundColor:animationParameters:forced:](self, "_requestStyle:partStyles:legibilityStyle:foregroundColor:animationParameters:forced:", -[UIStatusBar_Base _requestStyle](self, "_requestStyle", v8.receiver, v8.super_class), 0, -[UIStatusBar_Base legibilityStyle](self, "legibilityStyle"), v7, v6, 0);

}

- (void)setForegroundAlpha:(double)a3 animationParameters:(id)a4
{
  id v6;
  _QWORD v7[6];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIStatusBar_Modern;
  v6 = a4;
  -[UIStatusBar_Base setForegroundAlpha:animationParameters:](&v8, sel_setForegroundAlpha_animationParameters_, v6, a3);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__UIStatusBar_Modern_setForegroundAlpha_animationParameters___block_invoke;
  v7[3] = &unk_1E16B1888;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  -[UIStatusBar_Base _performAnimations:withParameters:completion:](self, "_performAnimations:withParameters:completion:", v7, v6, 0);

}

- (void)setLegibilityStyle:(int64_t)a3 animationParameters:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIStatusBar_Modern;
  v6 = a4;
  -[UIStatusBar_Base setLegibilityStyle:animationParameters:](&v9, sel_setLegibilityStyle_animationParameters_, a3, v6);
  v7 = -[UIStatusBar_Base _requestStyle](self, "_requestStyle", v9.receiver, v9.super_class);
  -[UIStatusBar_Base foregroundColor](self, "foregroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBar_Modern _requestStyle:partStyles:legibilityStyle:foregroundColor:animationParameters:forced:](self, "_requestStyle:partStyles:legibilityStyle:foregroundColor:animationParameters:forced:", v7, 0, a3, v8, v6, 0);

}

- (void)setAvoidanceFrame:(CGRect)a3 animationSettings:(id)a4 options:(unint64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)UIStatusBar_Modern;
  v11 = a4;
  -[UIStatusBar_Base setAvoidanceFrame:animationSettings:options:](&v12, sel_setAvoidanceFrame_animationSettings_options_, v11, a5, x, y, width, height);
  -[_UIStatusBar setAvoidanceFrame:animationSettings:options:](self->_statusBar, "setAvoidanceFrame:animationSettings:options:", v11, a5, x, y, width, height, v12.receiver, v12.super_class);

}

- (double)defaultDoubleHeight
{
  return 0.0;
}

- (void)setMode:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIStatusBar_Modern;
  -[UIStatusBar_Base setMode:](&v5, sel_setMode_);
  -[_UIStatusBar setMode:](self->_statusBar, "setMode:", a3);
}

+ (void)registerSensorActivityIndicator:(id)a3 forScreen:(id)a4
{
  +[_UIStatusBar registerSensorActivityIndicator:forScreen:](_UIStatusBar, "registerSensorActivityIndicator:forScreen:", a3, a4);
}

+ (id)sensorActivityIndicatorForScreen:(id)a3
{
  return +[_UIStatusBar sensorActivityIndicatorForScreen:](_UIStatusBar, "sensorActivityIndicatorForScreen:", a3);
}

+ (void)setSensorActivityIndicator:(id)a3
{
  objc_msgSend(a1, "registerSensorActivityIndicator:forScreen:", a3, 0);
}

+ (UIView)sensorActivityIndicator
{
  return (UIView *)objc_msgSend(a1, "sensorActivityIndicatorForScreen:", 0);
}

- (id)clockFont
{
  void *v2;
  void *v3;

  -[_UIStatusBar visualProvider](self->_statusBar, "visualProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clockFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setOrientation:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIStatusBar_Modern;
  -[UIStatusBar_Base setOrientation:](&v5, sel_setOrientation_);
  -[_UIStatusBar setOrientation:](self->_statusBar, "setOrientation:", a3);
}

- (void)jiggleLockIcon
{
  void *v3;
  void *v4;
  void *v5;
  _UIStatusBarData *v6;

  v6 = objc_alloc_init(_UIStatusBarData);
  -[_UIStatusBar currentData](self->_statusBar, "currentData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lockEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v5, "setUnlockFailureCount:", objc_msgSend(v5, "unlockFailureCount") + 1);
  -[_UIStatusBarData setLockEntry:](v6, "setLockEntry:", v5);
  -[_UIStatusBar updateWithData:](self->_statusBar, "updateWithData:", v6);

}

- (void)setAction:(id)a3 forPartWithIdentifier:(id)a4
{
  -[_UIStatusBar setAction:forPartWithIdentifier:](self->_statusBar, "setAction:forPartWithIdentifier:", a3, a4);
}

- (id)actionForPartWithIdentifier:(id)a3
{
  return -[_UIStatusBar actionForPartWithIdentifier:](self->_statusBar, "actionForPartWithIdentifier:", a3);
}

- (void)setOffset:(UIOffset)a3 forPartWithIdentifier:(id)a4
{
  -[_UIStatusBar setOffset:forPartWithIdentifier:](self->_statusBar, "setOffset:forPartWithIdentifier:", a4, a3.horizontal, a3.vertical);
}

- (UIOffset)offsetForPartWithIdentifier:(id)a3
{
  double v3;
  double v4;
  UIOffset result;

  -[_UIStatusBar offsetForPartWithIdentifier:](self->_statusBar, "offsetForPartWithIdentifier:", a3);
  result.vertical = v4;
  result.horizontal = v3;
  return result;
}

- (void)setAlpha:(double)a3 forPartWithIdentifier:(id)a4
{
  -[_UIStatusBar setAlpha:forPartWithIdentifier:](self->_statusBar, "setAlpha:forPartWithIdentifier:", a4, a3);
}

- (double)alphaForPartWithIdentifier:(id)a3
{
  double result;

  -[_UIStatusBar alphaForPartWithIdentifier:](self->_statusBar, "alphaForPartWithIdentifier:", a3);
  return result;
}

- (void)setEnabledPartIdentifiers:(id)a3
{
  -[_UIStatusBar setEnabledPartIdentifiers:](self->_statusBar, "setEnabledPartIdentifiers:", a3);
}

- (id)enabledPartIdentifiers
{
  return -[_UIStatusBar enabledPartIdentifiers](self->_statusBar, "enabledPartIdentifiers");
}

- (void)setDisabledPartIdentifiers:(id)a3
{
  -[_UIStatusBar setDisabledPartIdentifiers:](self->_statusBar, "setDisabledPartIdentifiers:", a3);
}

- (id)disabledPartIdentifiers
{
  return -[_UIStatusBar disabledPartIdentifiers](self->_statusBar, "disabledPartIdentifiers");
}

- (CGRect)frameForPartWithIdentifier:(id)a3
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
  double v15;
  double v16;
  CGRect result;

  v4 = a3;
  -[UIView layoutIfNeeded](self, "layoutIfNeeded");
  -[_UIStatusBar frameForPartWithIdentifier:](self->_statusBar, "frameForPartWithIdentifier:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)layoutSubviews
{
  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](self->_statusBar, "setFrame:");
}

- (void)forceUpdate:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[7];

  if (a3)
  {
    -[UIStatusBar_Modern _updateWithData:force:](self, "_updateWithData:force:", 0, 1);
  }
  else
  {
    v5[5] = v3;
    v5[6] = v4;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __34__UIStatusBar_Modern_forceUpdate___block_invoke;
    v5[3] = &unk_1E16B1B28;
    v5[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v5);
  }
}

- (void)forceUpdateData:(BOOL)a3
{
  _BOOL4 v3;
  const $6C45178016D353444451090973A2A97F *v5;
  const $6C45178016D353444451090973A2A97F *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v3 = a3;
  v5 = +[UIStatusBarServer getStatusBarData](UIStatusBarServer, "getStatusBarData");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    while (!v5->var0[v7])
    {
      if (++v7 == 52)
        return;
    }
    -[UIStatusBar_Modern _updateSemanticContentAttributeFromLegacyData:](self, "_updateSemanticContentAttributeFromLegacyData:", v5);
    -[UIStatusBar_Modern _dataFromLegacyData:](self, "_dataFromLegacyData:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v3)
    {
      -[UIStatusBar_Modern _updateWithData:force:](self, "_updateWithData:force:", v8, 0);
    }
    else
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __38__UIStatusBar_Modern_forceUpdateData___block_invoke;
      v10[3] = &unk_1E16B1B50;
      v10[4] = self;
      v11 = v8;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v10);

    }
  }
}

- (void)statusBarServer:(id)a3 didReceiveStatusBarData:(id *)a4 withActions:(int)a5
{
  id v7;

  -[UIStatusBar_Modern _updateSemanticContentAttributeFromLegacyData:](self, "_updateSemanticContentAttributeFromLegacyData:", a4);
  -[UIStatusBar_Modern _dataFromLegacyData:](self, "_dataFromLegacyData:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UIStatusBar_Modern _updateWithData:force:](self, "_updateWithData:force:", v7, 0);

}

- (void)statusBarServer:(id)a3 didReceiveStyleOverrides:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  objc_super v8;
  uint8_t buf[4];
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[UIStatusBar_Base styleOverrides](self, "styleOverrides") == a4)
  {
    _UIStatusBar_Log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v10 = a4;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "Duplicate StatusBar_Modern overrides receieved: %llu", buf, 0xCu);
    }

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIStatusBar_Modern;
    -[UIStatusBar_Base statusBarServer:didReceiveStyleOverrides:](&v8, sel_statusBarServer_didReceiveStyleOverrides_, v6, a4);
    -[UIStatusBar_Modern forceUpdate:](self, "forceUpdate:", 1);
  }

}

- (void)statusBarStateProvider:(id)a3 didPostStatusBarData:(id *)a4 withActions:(int)a5
{
  id v7;

  -[UIStatusBar_Modern _updateSemanticContentAttributeFromLegacyData:](self, "_updateSemanticContentAttributeFromLegacyData:", a4);
  -[UIStatusBar_Modern _dataFromLegacyData:](self, "_dataFromLegacyData:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UIStatusBar_Modern _updateWithData:force:](self, "_updateWithData:force:", v7, 0);

}

- (void)statusBarServer:(id)a3 didReceiveDoubleHeightStatusString:(id)a4 forStyle:(int64_t)a5
{
  -[UIStatusBar_Modern forceUpdate:](self, "forceUpdate:", 0, a4, a5);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[_UIStatusBar intrinsicContentSize](self->_statusBar, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (_UIStatusBar)statusBar
{
  return self->_statusBar;
}

- (void)setStatusBar:(id)a3
{
  objc_storeStrong((id *)&self->_statusBar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBar, 0);
}

@end
