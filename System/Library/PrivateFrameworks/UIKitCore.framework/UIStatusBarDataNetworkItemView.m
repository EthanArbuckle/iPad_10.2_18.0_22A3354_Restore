@implementation UIStatusBarDataNetworkItemView

- (double)extraLeftPadding
{
  double v3;
  double v4;
  void *v5;
  int v6;
  int dataNetworkType;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIStatusBarDataNetworkItemView;
  -[UIStatusBarItemView extraLeftPadding](&v10, sel_extraLeftPadding);
  v4 = v3;
  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "usesVerticalLayout");

  dataNetworkType = self->_dataNetworkType;
  if (v6)
  {
    if (dataNetworkType != 5)
      return v4 + -3.0;
  }
  else if (dataNetworkType != 5)
  {
    if (dataNetworkType == 6)
      v8 = 1.0;
    else
      v8 = 4.0;
    return v4 + v8;
  }
  return v4;
}

- (double)extraRightPadding
{
  double v3;
  double v4;
  void *v5;
  int v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIStatusBarDataNetworkItemView;
  -[UIStatusBarItemView extraRightPadding](&v8, sel_extraRightPadding);
  v4 = v3;
  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "usesVerticalLayout");

  if (v6 && self->_dataNetworkType != 5)
    return v4 + -3.0;
  return v4;
}

- (double)maximumOverlap
{
  void *v3;
  char v4;
  double result;

  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "usesVerticalLayout");

  if ((v4 & 1) != 0)
    return 0.0;
  -[UIStatusBarItemView standardPadding](self, "standardPadding");
  return result;
}

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  uint64_t v5;

  v5 = objc_msgSend(a3, "rawData");
  return -[UIStatusBarDataNetworkItemView _updateWithData:networkType:](self, "_updateWithData:networkType:", v5, *(unsigned int *)(v5 + 2096));
}

- (BOOL)_updateWithData:(id *)a3 networkType:(int)a4
{
  unsigned int v5;
  int var18;
  int var19;
  unsigned int v8;
  unsigned int showRSSI;
  int dataNetworkType;
  _BOOL4 v11;
  int v12;
  int v13;
  int v14;
  int v15;

  v5 = *((unsigned __int8 *)a3 + 3149);
  var18 = a3->var18;
  if (a3->var19 >= 3)
    var19 = 3;
  else
    var19 = a3->var19;
  v8 = *((unsigned __int8 *)a3 + 2529);
  showRSSI = self->_showRSSI;
  dataNetworkType = self->_dataNetworkType;
  v11 = dataNetworkType != a4;
  if (dataNetworkType != a4)
    self->_dataNetworkType = a4;
  if (((v8 >> 2) & 1) != self->_enableRSSI)
  {
    showRSSI = v8 & 4;
    self->_enableRSSI = showRSSI >> 2;
    -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", showRSSI != 0);
  }
  if (showRSSI)
    v12 = (self->_dataNetworkType - 5) < 2;
  else
    v12 = 0;
  v13 = self->_showRSSI;
  if (v13 != v12)
  {
    self->_showRSSI = v12;
    v11 = 1;
    v13 = v12;
  }
  v14 = var19 & ~(var19 >> 31);
  if (var18 != self->_wifiStrengthRaw)
  {
    self->_wifiStrengthRaw = var18;
    v11 = (v13 | v11) != 0;
  }
  if (v14 != self->_wifiStrengthBars)
  {
    self->_wifiStrengthBars = v14;
    v15 = v13 ^ 1;
    if (self->_dataNetworkType != 5)
      v15 = 0;
    LOBYTE(v11) = (v15 | v11) != 0;
  }
  if (((v5 >> 3) & 1) != self->_wifiLinkWarning)
  {
    self->_wifiLinkWarning = (v5 & 8) != 0;
    LOBYTE(v11) = 1;
  }
  return v11;
}

- (id)contentsImage
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;

  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textForNetworkType:", self->_dataNetworkType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self->_showRSSI && v4 == 0)
  {
    -[UIStatusBarDataNetworkItemView _dataNetworkImage](self, "_dataNetworkImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self->_showRSSI)
    {
      -[UIStatusBarDataNetworkItemView _stringForRSSI](self, "_stringForRSSI");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = v4;
    }
    v8 = v6;
    -[UIStatusBarItemView imageWithText:](self, "imageWithText:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (self->_enableRSSI && (self->_dataNetworkType - 5) <= 1)
  {
    self->_showRSSI ^= 1u;
    -[UIStatusBarItemView updateContentsAndWidth](self, "updateContentsAndWidth");
    if (v8 != 0.0)
    {
      v9 = v8;
      -[UIStatusBarItemView layoutManager](self, "layoutManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "itemView:sizeChangedBy:", self, v9);

    }
  }
  v11.receiver = self;
  v11.super_class = (Class)UIStatusBarDataNetworkItemView;
  -[UIResponder touchesEnded:withEvent:](&v11, sel_touchesEnded_withEvent_, v6, v7);

}

- (id)_dataNetworkImageName
{
  id result;

  switch(self->_dataNetworkType)
  {
    case 0:
      result = CFSTR("DataTypeGPRS");
      break;
    case 1:
      result = CFSTR("DataTypeEDGE");
      break;
    case 2:
      result = CFSTR("DataTypeUMTS");
      break;
    case 3:
      result = CFSTR("DataType4G");
      break;
    case 4:
      result = CFSTR("DataTypeLTE");
      break;
    case 5:
      if (self->_wifiLinkWarning)
      {
        result = CFSTR("WiFiWarning");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d_WifiBars"), self->_wifiStrengthBars);
        result = (id)objc_claimAutoreleasedReturnValue();
      }
      break;
    case 6:
      result = CFSTR("DataTypeiOSHotspot");
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)_dataNetworkImage
{
  void *v3;
  void *v4;

  -[UIStatusBarDataNetworkItemView _dataNetworkImageName](self, "_dataNetworkImageName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBarItemView imageWithShadowNamed:](self, "imageWithShadowNamed:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_stringForRSSI
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), self->_wifiStrengthRaw);
}

- (id)accessibilityHUDRepresentation
{
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  UIAccessibilityHUDItem *v7;
  UIAccessibilityHUDItem *v8;
  void *v10;
  void *v11;

  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textForNetworkType:", self->_dataNetworkType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
LABEL_10:
    v7 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:", v4, 0, 0.0, 0.0, 0.0, 0.0);
  }
  else
  {
    switch(self->_dataNetworkType)
    {
      case 0:
        v5 = CFSTR("GPRS");
        goto LABEL_8;
      case 4:
        v5 = CFSTR("LTE");
        goto LABEL_8;
      case 8:
        v5 = CFSTR("5GE");
        v6 = CFSTR("5G   ");
        goto LABEL_9;
      case 9:
        v5 = CFSTR("LTE-A");
        goto LABEL_8;
      case 0xA:
        v5 = CFSTR("LTE+");
LABEL_8:
        v6 = v5;
LABEL_9:
        _UINSLocalizedStringWithDefaultValue(v5, v6);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4)
          goto LABEL_10;
        goto LABEL_12;
      default:
LABEL_12:
        -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIStatusBarDataNetworkItemView _dataNetworkImageName](self, "_dataNetworkImageName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "accessibilityHUDImageNamed:", v11);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:scaleImage:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:scaleImage:", 0, v4, 1, 0.0, 0.0, 0.0, 0.0);
        break;
    }
  }
  v8 = v7;

  return v8;
}

@end
