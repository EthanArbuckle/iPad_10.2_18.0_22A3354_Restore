@implementation STUIStatusBar_Wrapper

- (void)_getStyle:(int64_t *)a3 andActiveOverride:(unint64_t *)a4 forRequestedStyle:(int64_t)a5
{
  -[STUIStatusBar_Wrapper _getStyle:andActiveOverride:andActiveBackgroundActivity:forRequestedStyle:updatingBackgroundActivity:](self, "_getStyle:andActiveOverride:andActiveBackgroundActivity:forRequestedStyle:updatingBackgroundActivity:", a3, a4, 0, a5, 1);
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
  v12.super_class = (Class)STUIStatusBar_Wrapper;
  v11 = a4;
  -[STUIStatusBar_Wrapper setAvoidanceFrame:animationSettings:options:](&v12, sel_setAvoidanceFrame_animationSettings_options_, v11, a5, x, y, width, height);
  -[STUIStatusBar setAvoidanceFrame:animationSettings:options:](self->_statusBar, "setAvoidanceFrame:animationSettings:options:", v11, a5, x, y, width, height, v12.receiver, v12.super_class);

}

- (STUIStatusBar)statusBar
{
  return self->_statusBar;
}

- (void)setEnabledPartIdentifiers:(id)a3
{
  -[STUIStatusBar setEnabledPartIdentifiers:](self->_statusBar, "setEnabledPartIdentifiers:", a3);
}

- (void)setAction:(id)a3 forPartWithIdentifier:(id)a4
{
  -[STUIStatusBar setAction:forPartWithIdentifier:](self->_statusBar, "setAction:forPartWithIdentifier:", a3, a4);
}

- (void)_requestStyle:(int64_t)a3 partStyles:(id)a4 animationParameters:(id)a5 forced:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v6 = a6;
  v9 = a5;
  v10 = a4;
  v11 = _UIStatusBarResolvedStyleFromStyle();
  v12 = -[STUIStatusBar_Wrapper legibilityStyle](self, "legibilityStyle");
  -[STUIStatusBar_Wrapper foregroundColor](self, "foregroundColor");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBar_Wrapper _requestStyle:partStyles:legibilityStyle:foregroundColor:animationParameters:forced:](self, "_requestStyle:partStyles:legibilityStyle:foregroundColor:animationParameters:forced:", v11, v10, v12, v13, v9, v6);

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
  v11.super_class = (Class)STUIStatusBar_Wrapper;
  v6 = a4;
  v7 = a3;
  -[STUIStatusBar_Wrapper setStyleRequest:animationParameters:](&v11, sel_setStyleRequest_animationParameters_, v7, v6);
  v8 = objc_msgSend(v7, "resolvedStyle", v11.receiver, v11.super_class);
  v9 = objc_msgSend(v7, "legibilityStyle");
  objc_msgSend(v7, "foregroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[STUIStatusBar_Wrapper _requestStyle:partStyles:legibilityStyle:foregroundColor:animationParameters:forced:](self, "_requestStyle:partStyles:legibilityStyle:foregroundColor:animationParameters:forced:", v8, 0, v9, v10, v6, 0);
}

- (void)requestResolvedStyle:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  id v7;

  v5 = -[STUIStatusBar_Wrapper legibilityStyle](self, "legibilityStyle");
  -[STUIStatusBar_Wrapper foregroundColor](self, "foregroundColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CD8]), "initWithDefaultParameters");
  -[STUIStatusBar_Wrapper _requestStyle:partStyles:legibilityStyle:foregroundColor:animationParameters:forced:](self, "_requestStyle:partStyles:legibilityStyle:foregroundColor:animationParameters:forced:", a3, 0, v5, v7, v6, 0);

}

- (id)_effectiveDataFromData:(id)a3 activeOverride:(unint64_t)a4 activeBackgroundActivity:(id)a5 canUpdateBackgroundActivity:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void **v14;
  uint64_t v15;
  id v16;
  id v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;

  v6 = a6;
  v10 = a3;
  v11 = a5;
  v12 = v10;
  v13 = v11;
  if (v11)
  {
LABEL_98:
    v16 = v13;
    if (objc_msgSend((id)_effectiveDataFromData_activeOverride_activeBackgroundActivity_canUpdateBackgroundActivity__lastBackgroundActivityEntry, "isEnabled")&& (objc_msgSend((id)_effectiveDataFromData_activeOverride_activeBackgroundActivity_canUpdateBackgroundActivity__lastBackgroundActivityEntry, "backgroundActivityIdentifier"), v17 = (id)objc_claimAutoreleasedReturnValue(), v17, v16 == v17))
    {
      objc_msgSend((id)_effectiveDataFromData_activeOverride_activeBackgroundActivity_canUpdateBackgroundActivity__lastBackgroundActivityEntry, "displayStartDate");
    }
    else
    {
      v18 = CACurrentMediaTime();
    }
    v19 = v18;
    v20 = (void *)MEMORY[0x1E0DB0980];
    v21 = (void *)MEMORY[0x1E0DC3CD0];
    objc_msgSend(0, "backgroundActivityIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stui_getDoubleHeightStatusStringBackgroundActivityWithIdentifier:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "entryWithBackgroundActivityIdentifier:displayStartDate:detailString:", v16, v23, v19);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_103;
    goto LABEL_102;
  }
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
            v14 = (void **)MEMORY[0x1E0DB0B70];
            goto LABEL_97;
          }
          if (a4 == 0x400000)
          {
            v14 = (void **)MEMORY[0x1E0DB0AE8];
            goto LABEL_97;
          }
        }
        else
        {
          switch(a4)
          {
            case 0x800000uLL:
              v14 = (void **)MEMORY[0x1E0DB0AE0];
              goto LABEL_97;
            case 0x1000000uLL:
              v14 = (void **)MEMORY[0x1E0DB0C10];
              goto LABEL_97;
            case 0x2000000uLL:
              v14 = (void **)MEMORY[0x1E0DB0B40];
              goto LABEL_97;
          }
        }
        goto LABEL_110;
      }
      if ((uint64_t)a4 <= 0xFFFFFFF)
      {
        if (a4 == 0x4000000)
        {
          v14 = (void **)MEMORY[0x1E0DB0B38];
          goto LABEL_97;
        }
        if (a4 == 0x8000000)
        {
          v14 = (void **)MEMORY[0x1E0DB0B00];
          goto LABEL_97;
        }
        goto LABEL_110;
      }
      if (a4 == 0x10000000)
      {
        v14 = (void **)MEMORY[0x1E0DB0C00];
        goto LABEL_97;
      }
      if (a4 == 0x20000000)
      {
        v14 = (void **)MEMORY[0x1E0DB0BA8];
        goto LABEL_97;
      }
      v15 = 0x40000000;
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
              v14 = (void **)MEMORY[0x1E0DB0BF8];
              goto LABEL_97;
            case 0x10000000000uLL:
              v14 = (void **)MEMORY[0x1E0DB0BD8];
              goto LABEL_97;
            case 0x20000000000uLL:
              v14 = (void **)MEMORY[0x1E0DB0B90];
              goto LABEL_97;
          }
        }
        else
        {
          switch(a4)
          {
            case 0x1000000000uLL:
              v14 = (void **)MEMORY[0x1E0DB0AC8];
              goto LABEL_97;
            case 0x2000000000uLL:
              v14 = (void **)MEMORY[0x1E0DB0B50];
              goto LABEL_97;
            case 0x4000000000uLL:
              v14 = (void **)MEMORY[0x1E0DB0AF8];
LABEL_97:
              v13 = *v14;
              goto LABEL_98;
          }
        }
        goto LABEL_110;
      }
      if ((uint64_t)a4 > 0x1FFFFFFFFLL)
      {
        if (a4 != 0x200000000)
        {
          if (a4 == 0x400000000)
          {
            v14 = (void **)MEMORY[0x1E0DB0B98];
            goto LABEL_97;
          }
          if (a4 == 0x800000000)
          {
            v14 = (void **)MEMORY[0x1E0DB0BB0];
            goto LABEL_97;
          }
          goto LABEL_110;
        }
LABEL_74:
        v14 = (void **)MEMORY[0x1E0DB0BE0];
        goto LABEL_97;
      }
      if (a4 == 0x80000000)
        goto LABEL_74;
      v15 = 0x100000000;
    }
    if (a4 == v15)
    {
      v14 = (void **)MEMORY[0x1E0DB0BD0];
      goto LABEL_97;
    }
    goto LABEL_110;
  }
  if ((uint64_t)a4 > 2047)
  {
    if ((uint64_t)a4 >= 0x10000)
    {
      if ((uint64_t)a4 < 0x40000)
      {
        if (a4 == 0x10000)
        {
          v14 = (void **)MEMORY[0x1E0DB0B18];
          goto LABEL_97;
        }
        if (a4 == 0x20000)
        {
          v14 = (void **)MEMORY[0x1E0DB0C18];
          goto LABEL_97;
        }
      }
      else
      {
        switch(a4)
        {
          case 0x40000uLL:
            v14 = (void **)MEMORY[0x1E0DB0AD0];
            goto LABEL_97;
          case 0x80000uLL:
            v14 = (void **)MEMORY[0x1E0DB0B28];
            goto LABEL_97;
          case 0x100000uLL:
            v14 = (void **)MEMORY[0x1E0DB0BB8];
            goto LABEL_97;
        }
      }
    }
    else if ((uint64_t)a4 < 0x2000)
    {
      if (a4 == 2048)
      {
        v14 = (void **)MEMORY[0x1E0DB0AF0];
        goto LABEL_97;
      }
      if (a4 == 4096)
      {
        v14 = (void **)MEMORY[0x1E0DB0B10];
        goto LABEL_97;
      }
    }
    else
    {
      switch(a4)
      {
        case 0x2000uLL:
          v14 = (void **)MEMORY[0x1E0DB0BE8];
          goto LABEL_97;
        case 0x4000uLL:
          v14 = (void **)MEMORY[0x1E0DB0BC8];
          goto LABEL_97;
        case 0x8000uLL:
          v14 = (void **)MEMORY[0x1E0DB0B30];
          goto LABEL_97;
      }
    }
  }
  else if ((uint64_t)a4 > 63)
  {
    if ((uint64_t)a4 <= 255)
    {
      if (a4 == 64 || a4 == 128)
      {
        v14 = (void **)MEMORY[0x1E0DB0B78];
        goto LABEL_97;
      }
    }
    else
    {
      switch(a4)
      {
        case 0x100uLL:
          v14 = (void **)MEMORY[0x1E0DB0AD8];
          goto LABEL_97;
        case 0x200uLL:
          v14 = (void **)MEMORY[0x1E0DB0C08];
          goto LABEL_97;
        case 0x400uLL:
          v14 = (void **)MEMORY[0x1E0DB0B48];
          goto LABEL_97;
      }
    }
  }
  else if ((uint64_t)a4 <= 7)
  {
    if (a4 == 1)
    {
      v14 = (void **)MEMORY[0x1E0DB0B58];
      goto LABEL_97;
    }
    if (a4 == 4)
    {
      v14 = (void **)MEMORY[0x1E0DB0BA0];
      goto LABEL_97;
    }
  }
  else
  {
    switch(a4)
    {
      case 8uLL:
        v14 = (void **)MEMORY[0x1E0DB0BF0];
        goto LABEL_97;
      case 0x10uLL:
        v14 = (void **)MEMORY[0x1E0DB0B60];
        goto LABEL_97;
      case 0x20uLL:
        v14 = (void **)MEMORY[0x1E0DB0BC0];
        goto LABEL_97;
    }
  }
LABEL_110:
  objc_msgSend(MEMORY[0x1E0DB0980], "disabledEntry");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  if (v6)
LABEL_102:
    objc_storeStrong((id *)&_effectiveDataFromData_activeOverride_activeBackgroundActivity_canUpdateBackgroundActivity__lastBackgroundActivityEntry, v24);
LABEL_103:
  -[STUIStatusBar currentData](self->_statusBar, "currentData");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "backgroundActivityEntry");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = v12;
  if ((BSEqualObjects() & 1) == 0)
  {
    if (v12)
      v28 = (id)objc_msgSend(v12, "mutableCopy");
    else
      v28 = objc_alloc_init(MEMORY[0x1E0DB0950]);
    v29 = v28;
    objc_msgSend(v28, "setBackgroundActivityEntry:", v24);
    objc_msgSend(v29, "immutableCopy");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v27;
}

- (void)_updateWithData:(id)a3 force:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;

  v4 = a4;
  v6 = a3;
  if (!v6)
  {
    -[STUIStatusBar currentData](self->_statusBar, "currentData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_15;
  }
  v16 = 0;
  -[STUIStatusBar_Wrapper styleDelegate](self, "styleDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v15 = 0;
    -[STUIStatusBar style](self->_statusBar, "style");
    -[STUIStatusBar_Wrapper _getStyle:andActiveOverride:andActiveBackgroundActivity:forRequestedStyle:updatingBackgroundActivity:](self, "_getStyle:andActiveOverride:andActiveBackgroundActivity:forRequestedStyle:updatingBackgroundActivity:", 0, &v16, &v15, _UIStatusBarStyleFromResolvedStyle(), 0);
    v9 = v15;
    if (v9)
    {
      v10 = v9;
      -[STUIStatusBar_Wrapper setActiveBackgroundActivity:](self, "setActiveBackgroundActivity:", v9);
      goto LABEL_9;
    }
    v11 = v16;
    if (!v16)
      goto LABEL_7;
  }
  else
  {
    v11 = -[STUIStatusBar_Wrapper styleOverrides](self, "styleOverrides");
    v16 = v11;
    if (!v11)
    {
LABEL_7:
      v11 = -[STUIStatusBar_Wrapper _implicitStyleOverrideForStyle:](self, "_implicitStyleOverrideForStyle:", -[STUIStatusBar_Wrapper _requestStyle](self, "_requestStyle", v11));
      v16 = v11;
    }
  }
  -[STUIStatusBar_Wrapper setActiveStyleOverride:](self, "setActiveStyleOverride:", v11);
  v10 = 0;
LABEL_9:
  v12 = -[STUIStatusBar_Wrapper activeStyleOverride](self, "activeStyleOverride");
  -[STUIStatusBar_Wrapper styleDelegate](self, "styleDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBar_Wrapper _effectiveDataFromData:activeOverride:activeBackgroundActivity:canUpdateBackgroundActivity:](self, "_effectiveDataFromData:activeOverride:activeBackgroundActivity:canUpdateBackgroundActivity:", v6, v12, v10, v13 != 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14 || v4)
  {
    if (!v14)
      v14 = objc_alloc_init(MEMORY[0x1E0DB0970]);
    -[STUIStatusBar updateWithData:](self->_statusBar, "updateWithData:", v14);

  }
LABEL_15:

}

- (void)_getStyle:(int64_t *)a3 andActiveOverride:(unint64_t *)a4 andActiveBackgroundActivity:(id *)a5 forRequestedStyle:(int64_t)a6 updatingBackgroundActivity:(BOOL)a7
{
  void *v12;
  _BOOL8 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  -[STUIStatusBar_Wrapper styleDelegate](self, "styleDelegate", a3, a4, a5, a6, a7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v14 = a6 == 306 || (a6 & 0xFFFFFFFFFFFFFFFELL) == 108;
    -[STUIStatusBar_Wrapper backgroundActivities](self, "backgroundActivities");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "statusBar:effectiveBackgroundActivitiesForBackgroundActiviesWithIdentifiers:", self, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DB0890], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "resolvedBackgroundActivityFromBackgroundActivities:inPrecedenceScope:", v16, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
      *a4 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v18);
    if (a3)
      *a3 = a6;

  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)STUIStatusBar_Wrapper;
    -[STUIStatusBar_Wrapper _getStyle:andActiveOverride:forRequestedStyle:](&v19, sel__getStyle_andActiveOverride_forRequestedStyle_, a3, a4, a6);
  }

}

- (NSSet)backgroundActivities
{
  return self->_backgroundActivities;
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

- (void)_requestStyle:(int64_t)a3 partStyles:(id)a4 legibilityStyle:(int64_t)a5 foregroundColor:(id)a6 animationParameters:(id)a7 forced:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  _QWORD v23[5];
  id v24;
  id v25;
  int64_t v26;

  v8 = a8;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  if (a3 || (-[STUIStatusBar_Wrapper _requestedResolvedStyle](self, "_requestedResolvedStyle") & 0x3F) != 0)
    -[STUIStatusBar_Wrapper _setRequestedResolvedStyle:](self, "_setRequestedResolvedStyle:", a3);
  else
    a3 = -[STUIStatusBar_Wrapper _requestedResolvedStyle](self, "_requestedResolvedStyle");
  v17 = _UIStatusBarStyleFromResolvedStyle();
  -[STUIStatusBar_Wrapper manager](self, "manager");
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18
    || (v19 = (void *)v18,
        -[STUIStatusBar_Wrapper manager](self, "manager"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v21 = objc_msgSend(v20, "statusBar:shouldRequestStyle:animationParameters:forced:", self, v17, v16, v8),
        v20,
        v19,
        v21))
  {
    v22 = -[STUIStatusBar_Wrapper styleForRequestedStyle:](self, "styleForRequestedStyle:", -[STUIStatusBar_Wrapper _effectiveStyleFromStyle:](self, "_effectiveStyleFromStyle:", v17));
    if (a5)
    {
      _UIStatusBarStyleFromLegibilityStyle();
    }
    else if (v22 == v17)
    {
LABEL_10:
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __109__STUIStatusBar_Wrapper__requestStyle_partStyles_legibilityStyle_foregroundColor_animationParameters_forced___block_invoke;
      v23[3] = &unk_1E8D63220;
      v26 = a3;
      v23[4] = self;
      v24 = v15;
      v25 = v14;
      -[STUIStatusBar_Wrapper _performAnimations:withParameters:completion:](self, "_performAnimations:withParameters:completion:", v23, v16, 0);

      goto LABEL_11;
    }
    a3 = _UIStatusBarResolvedStyleFromStyle();
    goto LABEL_10;
  }
LABEL_11:

}

- (int64_t)_requestedResolvedStyle
{
  return self->_requestedResolvedStyle;
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
          -[STUIStatusBar style](self->_statusBar, "style", v3, v4);
          result = _UIStatusBarStyleFromResolvedStyle();
          break;
      }
      break;
  }
  return result;
}

- (void)_setRequestedResolvedStyle:(int64_t)a3
{
  self->_requestedResolvedStyle = a3;
}

+ (double)_heightForStyle:(int64_t)a3 orientation:(int64_t)a4 forStatusBarFrame:(BOOL)a5 inWindow:(id)a6 isAzulBLinked:(BOOL)a7
{
  _BOOL8 v7;
  void *v10;
  double v11;
  double v12;

  v7 = a7;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen", a3, a4, a5, a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBar intrinsicContentSizeForTargetScreen:orientation:onLockScreen:isAzulBLinked:](STUIStatusBar, "intrinsicContentSizeForTargetScreen:orientation:onLockScreen:isAzulBLinked:", v10, a4, a3 == 306, v7);
  v12 = v11;

  return v12;
}

- (void)setHidden:(BOOL)a3 animationParameters:(id)a4
{
  _BOOL8 v4;
  STUIStatusBar *statusBar;
  id v7;
  objc_super v8;

  v4 = a3;
  statusBar = self->_statusBar;
  v7 = a4;
  -[STUIStatusBar setHidden:animationParameters:](statusBar, "setHidden:animationParameters:", v4, v7);
  v8.receiver = self;
  v8.super_class = (Class)STUIStatusBar_Wrapper;
  -[STUIStatusBar_Wrapper setHidden:animationParameters:](&v8, sel_setHidden_animationParameters_, v4, v7);

}

- (void)layoutSubviews
{
  -[STUIStatusBar_Wrapper bounds](self, "bounds");
  -[STUIStatusBar setFrame:](self->_statusBar, "setFrame:");
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
  STUIStatusBar *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  id location;
  objc_super v24;

  v6 = a5;
  v7 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)STUIStatusBar_Wrapper;
  v14 = -[STUIStatusBar_Wrapper _initWithFrame:showForegroundView:wantsServer:inProcessStateProvider:](&v24, sel__initWithFrame_showForegroundView_wantsServer_inProcessStateProvider_, v7, v6, v13, x, y, width, height);
  if (v14)
  {
    v15 = -[STUIStatusBar initWithStyle:]([STUIStatusBar alloc], "initWithStyle:", 0);
    objc_msgSend(v14, "addSubview:", v15);
    objc_msgSend(v14, "_setRequestedStyle:", 0);
    objc_initWeak(&location, v14);
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __94__STUIStatusBar_Wrapper__initWithFrame_showForegroundView_wantsServer_inProcessStateProvider___block_invoke;
    v21 = &unk_1E8D631D0;
    objc_copyWeak(&v22, &location);
    -[STUIStatusBar setRegionActionValidationBlock:](v15, "setRegionActionValidationBlock:", &v18);
    objc_msgSend(v14, "setStatusBar:", v15, v18, v19, v20, v21);
    objc_msgSend(MEMORY[0x1E0DB0890], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addBackgroundActivityClient:", v14);

    objc_msgSend(v14, "_evaluateServerRegistration");
    objc_msgSend(v14, "setNeedsLayout");
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

  }
  return v14;
}

- (void)setStatusBar:(id)a3
{
  objc_storeStrong((id *)&self->_statusBar, a3);
}

- (void)forceUpdateData:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v3 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0DC3CD0], "getStatusBarData");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    while (!*(_BYTE *)(v5 + v7))
    {
      if (++v7 == 52)
        return;
    }
    -[STUIStatusBar_Wrapper _updateSemanticContentAttributeFromLegacyData:](self, "_updateSemanticContentAttributeFromLegacyData:", v5);
    -[STUIStatusBar_Wrapper _dataFromLegacyData:](self, "_dataFromLegacyData:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    if (v3)
    {
      -[STUIStatusBar_Wrapper _updateWithData:force:](self, "_updateWithData:force:", v8, 0);
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0DC3F10];
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __41__STUIStatusBar_Wrapper_forceUpdateData___block_invoke;
      v11[3] = &unk_1E8D62C88;
      v11[4] = self;
      v12 = v8;
      objc_msgSend(v9, "performWithoutAnimation:", v11);

    }
  }
}

- (void)statusBarServer:(id)a3 didReceiveStatusBarData:(id *)a4 withActions:(int)a5
{
  id v7;

  -[STUIStatusBar_Wrapper _updateSemanticContentAttributeFromLegacyData:](self, "_updateSemanticContentAttributeFromLegacyData:", a4);
  -[STUIStatusBar_Wrapper _dataFromLegacyData:](self, "_dataFromLegacyData:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBar_Wrapper _updateWithData:force:](self, "_updateWithData:force:", v7, 0);

}

- (void)_updateSemanticContentAttributeFromLegacyData:(id *)a3
{
  uint64_t v3;

  if ((*((_BYTE *)a3 + 2536) & 2) != 0)
    v3 = 4;
  else
    v3 = 3;
  -[STUIStatusBar setSemanticContentAttribute:](self->_statusBar, "setSemanticContentAttribute:", v3);
}

- (id)_dataFromLegacyData:(id *)a3
{
  void *v5;
  const $6C45178016D353444451090973A2A97F *v6;
  void *v7;
  _OWORD v9[242];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[STUIStatusBar_Wrapper localDataOverrides](self, "localDataOverrides"))
  {
    memset(&v9[30], 0, 32);
    objc_msgSend(MEMORY[0x1E0DC3CB0], "getData:forRequestedData:withOverrides:", v9, a3, -[STUIStatusBar_Wrapper localDataOverrides](self, "localDataOverrides", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
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
    -[STUIStatusBar currentData](self->_statusBar, "currentData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (const $6C45178016D353444451090973A2A97F *)v9;
  }
  else
  {
    -[STUIStatusBar currentData](self->_statusBar, "currentData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a3;
  }
  +[STUIStatusBarDataConverter convertData:fromReferenceData:](STUIStatusBarDataConverter, "convertData:fromReferenceData:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)activeBackgroundActivitiesDidUpdate:(id)a3
{
  NSSet *v4;
  NSSet *backgroundActivities;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  backgroundActivities = self->_backgroundActivities;
  self->_backgroundActivities = v4;

  -[STUIStatusBar_Wrapper forceUpdate:](self, "forceUpdate:", 1);
}

- (void)forceUpdate:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[7];

  if (a3)
  {
    -[STUIStatusBar_Wrapper _updateWithData:force:](self, "_updateWithData:force:", 0, 1);
  }
  else
  {
    v5[5] = v3;
    v5[6] = v4;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __37__STUIStatusBar_Wrapper_forceUpdate___block_invoke;
    v5[3] = &unk_1E8D62A38;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v5);
  }
}

- (void)setForegroundColor:(id)a3 animationParameters:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STUIStatusBar_Wrapper;
  v6 = a4;
  v7 = a3;
  -[STUIStatusBar_Wrapper setForegroundColor:animationParameters:](&v8, sel_setForegroundColor_animationParameters_, v7, v6);
  -[STUIStatusBar_Wrapper _requestStyle:partStyles:legibilityStyle:foregroundColor:animationParameters:forced:](self, "_requestStyle:partStyles:legibilityStyle:foregroundColor:animationParameters:forced:", -[STUIStatusBar_Wrapper _requestedResolvedStyle](self, "_requestedResolvedStyle", v8.receiver, v8.super_class), 0, -[STUIStatusBar_Wrapper legibilityStyle](self, "legibilityStyle"), v7, v6, 0);

}

- (void)setLegibilityStyle:(int64_t)a3 animationParameters:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)STUIStatusBar_Wrapper;
  v6 = a4;
  -[STUIStatusBar_Wrapper setLegibilityStyle:animationParameters:](&v9, sel_setLegibilityStyle_animationParameters_, a3, v6);
  v7 = -[STUIStatusBar_Wrapper _requestedResolvedStyle](self, "_requestedResolvedStyle", v9.receiver, v9.super_class);
  -[STUIStatusBar_Wrapper foregroundColor](self, "foregroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBar_Wrapper _requestStyle:partStyles:legibilityStyle:foregroundColor:animationParameters:forced:](self, "_requestStyle:partStyles:legibilityStyle:foregroundColor:animationParameters:forced:", v7, 0, a3, v8, v6, 0);

}

- (void)setOrientation:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBar_Wrapper;
  -[STUIStatusBar_Wrapper setOrientation:](&v5, sel_setOrientation_);
  -[STUIStatusBar setOrientation:](self->_statusBar, "setOrientation:", a3);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0DB0890], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeBackgroundActivityClient:", self);

  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBar_Wrapper;
  -[STUIStatusBar_Wrapper dealloc](&v4, sel_dealloc);
}

+ (int64_t)_defaultStyleForRequestedStyle:(int64_t)a3 styleOverrides:(unint64_t)a4 activeStyleOverride:(unint64_t *)a5
{
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___STUIStatusBar_Wrapper;
  objc_msgSendSuper2(&v7, sel__defaultStyleForRequestedStyle_styleOverrides_activeStyleOverride_, a3, a4, a5);
  return a3;
}

- (int64_t)currentStyle
{
  -[STUIStatusBar style](self->_statusBar, "style");
  return _UIStatusBarStyleFromResolvedStyle();
}

- (void)setForegroundAlpha:(double)a3 animationParameters:(id)a4
{
  id v6;
  _QWORD v7[6];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STUIStatusBar_Wrapper;
  v6 = a4;
  -[STUIStatusBar_Wrapper setForegroundAlpha:animationParameters:](&v8, sel_setForegroundAlpha_animationParameters_, v6, a3);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__STUIStatusBar_Wrapper_setForegroundAlpha_animationParameters___block_invoke;
  v7[3] = &unk_1E8D63248;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  -[STUIStatusBar_Wrapper _performAnimations:withParameters:completion:](self, "_performAnimations:withParameters:completion:", v7, v6, 0);

}

- (double)defaultDoubleHeight
{
  return 0.0;
}

- (void)setMode:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBar_Wrapper;
  -[STUIStatusBar_Wrapper setMode:](&v5, sel_setMode_);
  -[STUIStatusBar setMode:](self->_statusBar, "setMode:", a3);
}

+ (void)registerSensorActivityIndicator:(id)a3 forScreen:(id)a4
{
  +[STUIStatusBar registerSensorActivityIndicator:forScreen:](STUIStatusBar, "registerSensorActivityIndicator:forScreen:", a3, a4);
}

+ (id)sensorActivityIndicatorForScreen:(id)a3
{
  return +[STUIStatusBar sensorActivityIndicatorForScreen:](STUIStatusBar, "sensorActivityIndicatorForScreen:", a3);
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

  -[STUIStatusBar visualProvider](self->_statusBar, "visualProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clockFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)jiggleLockIcon
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = objc_alloc_init(MEMORY[0x1E0DB0950]);
  -[STUIStatusBar currentData](self->_statusBar, "currentData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lockEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0DB09D8], "entryWithUnlockFailureCount:", objc_msgSend(v4, "unlockFailureCount") + 1);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  objc_msgSend(v6, "setLockEntry:", v4);
  -[STUIStatusBar updateWithData:](self->_statusBar, "updateWithData:", v6);

}

- (id)actionForPartWithIdentifier:(id)a3
{
  return -[STUIStatusBar actionForPartWithIdentifier:](self->_statusBar, "actionForPartWithIdentifier:", a3);
}

- (void)setOffset:(UIOffset)a3 forPartWithIdentifier:(id)a4
{
  -[STUIStatusBar setOffset:forPartWithIdentifier:](self->_statusBar, "setOffset:forPartWithIdentifier:", a4, a3.horizontal, a3.vertical);
}

- (UIOffset)offsetForPartWithIdentifier:(id)a3
{
  double v3;
  double v4;
  UIOffset result;

  -[STUIStatusBar offsetForPartWithIdentifier:](self->_statusBar, "offsetForPartWithIdentifier:", a3);
  result.vertical = v4;
  result.horizontal = v3;
  return result;
}

- (void)setAlpha:(double)a3 forPartWithIdentifier:(id)a4
{
  -[STUIStatusBar setAlpha:forPartWithIdentifier:](self->_statusBar, "setAlpha:forPartWithIdentifier:", a4, a3);
}

- (double)alphaForPartWithIdentifier:(id)a3
{
  double result;

  -[STUIStatusBar alphaForPartWithIdentifier:](self->_statusBar, "alphaForPartWithIdentifier:", a3);
  return result;
}

- (id)enabledPartIdentifiers
{
  return -[STUIStatusBar enabledPartIdentifiers](self->_statusBar, "enabledPartIdentifiers");
}

- (void)setDisabledPartIdentifiers:(id)a3
{
  -[STUIStatusBar setDisabledPartIdentifiers:](self->_statusBar, "setDisabledPartIdentifiers:", a3);
}

- (id)disabledPartIdentifiers
{
  return -[STUIStatusBar disabledPartIdentifiers](self->_statusBar, "disabledPartIdentifiers");
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
  -[STUIStatusBar_Wrapper layoutIfNeeded](self, "layoutIfNeeded");
  -[STUIStatusBar frameForPartWithIdentifier:](self->_statusBar, "frameForPartWithIdentifier:", v4);
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
  if (-[STUIStatusBar_Wrapper styleOverrides](self, "styleOverrides") == a4)
  {
    _STUIStatusBar_BackgroundActivity_Log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v10 = a4;
      _os_log_impl(&dword_1CFE2E000, v7, OS_LOG_TYPE_DEFAULT, "Duplicate StatusBar_Modern overrides receieved: %llu", buf, 0xCu);
    }

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)STUIStatusBar_Wrapper;
    -[STUIStatusBar_Wrapper statusBarServer:didReceiveStyleOverrides:](&v8, sel_statusBarServer_didReceiveStyleOverrides_, v6, a4);
    -[STUIStatusBar_Wrapper forceUpdate:](self, "forceUpdate:", 1);
  }

}

- (void)statusBarStateProvider:(id)a3 didPostStatusBarData:(id *)a4 withActions:(int)a5
{
  id v7;

  -[STUIStatusBar_Wrapper _updateSemanticContentAttributeFromLegacyData:](self, "_updateSemanticContentAttributeFromLegacyData:", a4);
  -[STUIStatusBar_Wrapper _dataFromLegacyData:](self, "_dataFromLegacyData:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBar_Wrapper _updateWithData:force:](self, "_updateWithData:force:", v7, 0);

}

- (void)statusBarServer:(id)a3 didReceiveDoubleHeightStatusString:(id)a4 forStyle:(int64_t)a5
{
  -[STUIStatusBar_Wrapper forceUpdate:](self, "forceUpdate:", 0, a4, a5);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[STUIStatusBar intrinsicContentSize](self->_statusBar, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSString)activeBackgroundActivity
{
  return self->_activeBackgroundActivity;
}

- (void)setActiveBackgroundActivity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 608);
}

- (void)setBackgroundActivities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 616);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundActivities, 0);
  objc_storeStrong((id *)&self->_activeBackgroundActivity, 0);
  objc_storeStrong((id *)&self->_statusBar, 0);
}

@end
