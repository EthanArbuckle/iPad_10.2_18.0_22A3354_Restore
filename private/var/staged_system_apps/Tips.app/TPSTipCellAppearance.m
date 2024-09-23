@implementation TPSTipCellAppearance

- (void)updateMediaSizeType
{
  double v3;
  double v4;

  -[TPSTipCellAppearance size](self, "size");
  if (v4 != CGSizeZero.width || v3 != CGSizeZero.height)
  {
    self->_useBookendsRegularTitleBaseline = 0;
    if (+[TPSAppearance isPhoneUI](TPSAppearance, "isPhoneUI"))
    {
      self->_displayType = 0;
      -[TPSTipCellAppearance setMediaSizeType:](self, "setMediaSizeType:", 1);
    }
    else
    {
      -[TPSTipCellAppearance setMediaSizeType:](self, "setMediaSizeType:", 1);
      self->_displayType = 2;
    }
    self->_bookendsMediaSizeType = 1;
  }
}

- (BOOL)isBookendsCompactLayout
{
  return self->_bookendsMediaSizeType == 1;
}

- (void)updateAppearanceWithSize:(CGSize)a3
{
  double width;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  _BOOL4 v30;
  unsigned int v31;
  double *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  objc_super v39;

  width = a3.width;
  v39.receiver = self;
  v39.super_class = (Class)TPSTipCellAppearance;
  -[TPSTipCellAppearance updateAppearanceWithSize:](&v39, "updateAppearanceWithSize:", a3.width, a3.height);
  -[TPSTipCellAppearance updateMediaSizeType](self, "updateMediaSizeType");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipCellAppearance traitCollection](self, "traitCollection"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TPSUIAppController sharedInstance](TPSUIAppController, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetSizes"));

    if (+[TPSAppearance isPhoneUI](TPSAppearance, "isPhoneUI"))
    {
      self->_outroTextLabelTopPadding = 26.0;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance"));
      v9 = objc_msgSend(v8, "assetRatioType");

      if (v9)
      {
        self->_outroWidthMultiplier = 2.31466667;
        v10 = 1.28019324;
        v11 = 1.99466667;
      }
      else
      {
        v10 = 0.938666667;
        v11 = 1.608;
      }
      self->_bookendsHeightMultiplier = v11;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tip"));
      -[TPSTipCellAppearance heightToWidthRatioFromSizes:mediaSizeType:defaultValue:](self, "heightToWidthRatioFromSizes:mediaSizeType:defaultValue:", v22, -[TPSTipCellAppearance mediaSizeType](self, "mediaSizeType"), v10);
      v24 = v23;

      v25 = ceil(width * v24);
      v26 = 30.0;
      v27 = 30.0;
    }
    else
    {
      -[TPSTipCellAppearance size](self, "size");
      v13 = v12;
      -[TPSTipCellAppearance size](self, "size");
      v15 = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v16, "bounds");
      v18 = v17;
      v20 = v19;

      if (v13 > v15 && v15 == v20)
      {
        v21 = 33.0;
      }
      else if (v18 <= v20)
      {
        v21 = 40.0;
      }
      else if (v13 / v18 <= 0.6)
      {
        v21 = 40.0;
      }
      else
      {
        v21 = 33.0;
      }
      v28 = v18 / width;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance"));
      v30 = objc_msgSend(v29, "assetRatioType") == 0;

      self->_outroTextLabelTopPadding = v21;
      v31 = -[TPSTipCellAppearance isBookendsCompactLayout](self, "isBookendsCompactLayout");
      v32 = (double *)&unk_100078810;
      if (v31)
        v32 = (double *)&unk_100078820;
      self->_bookendsHeightMultiplier = v32[v30];
      if (v28 == 1.0)
      {
        v27 = 30.0;
      }
      else
      {
        self->_outroTextLabelTopPadding = ceil(self->_outroTextLabelTopPadding / v28);
        v27 = ceil(30.0 / v28);
      }
      v33 = round((v13 + -672.0) * 0.5);
      if (v13 <= 834.0)
        v26 = 56.0;
      else
        v26 = v33;
      v34 = v13 * 0.9644;
      if (v15 >= v13 * 0.9644 + 89.95)
      {
        v36 = -110.05;
      }
      else
      {
        -[TPSTipCellAppearance topSafeAreaHeight](self, "topSafeAreaHeight");
        v34 = v15 - v35;
        v36 = -200.0;
      }
      v25 = round(v34 + v36);
    }
    self->_assetHeight = v25;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tipIntro"));
    -[TPSTipCellAppearance heightToWidthRatioFromSizes:mediaSizeType:defaultValue:](self, "heightToWidthRatioFromSizes:mediaSizeType:defaultValue:", v37, self->_bookendsMediaSizeType, self->_bookendsHeightMultiplier);
    self->_bookendsHeightMultiplier = v38;

    self->_contentSidePadding = v26;
    self->_bookendsContentSidePadding = v27;

  }
}

- (unint64_t)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(unint64_t)a3
{
  self->_displayType = a3;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (unint64_t)bookendsMediaSizeType
{
  return self->_bookendsMediaSizeType;
}

- (void)setBookendsMediaSizeType:(unint64_t)a3
{
  self->_bookendsMediaSizeType = a3;
}

- (BOOL)useBookendsRegularTitleBaseline
{
  return self->_useBookendsRegularTitleBaseline;
}

- (void)setUseBookendsRegularTitleBaseline:(BOOL)a3
{
  self->_useBookendsRegularTitleBaseline = a3;
}

- (double)contentSidePadding
{
  return self->_contentSidePadding;
}

- (void)setContentSidePadding:(double)a3
{
  self->_contentSidePadding = a3;
}

- (double)bookendsContentSidePadding
{
  return self->_bookendsContentSidePadding;
}

- (void)setBookendsContentSidePadding:(double)a3
{
  self->_bookendsContentSidePadding = a3;
}

- (double)outroWidthMultiplier
{
  return self->_outroWidthMultiplier;
}

- (void)setOutroWidthMultiplier:(double)a3
{
  self->_outroWidthMultiplier = a3;
}

- (double)outroTextLabelTopPadding
{
  return self->_outroTextLabelTopPadding;
}

- (void)setOutroTextLabelTopPadding:(double)a3
{
  self->_outroTextLabelTopPadding = a3;
}

- (double)bookendsHeightMultiplier
{
  return self->_bookendsHeightMultiplier;
}

- (void)setBookendsHeightMultiplier:(double)a3
{
  self->_bookendsHeightMultiplier = a3;
}

- (double)assetHeight
{
  return self->_assetHeight;
}

- (void)setAssetHeight:(double)a3
{
  self->_assetHeight = a3;
}

- (double)topSafeAreaHeight
{
  return self->_topSafeAreaHeight;
}

- (void)setTopSafeAreaHeight:(double)a3
{
  self->_topSafeAreaHeight = a3;
}

@end
