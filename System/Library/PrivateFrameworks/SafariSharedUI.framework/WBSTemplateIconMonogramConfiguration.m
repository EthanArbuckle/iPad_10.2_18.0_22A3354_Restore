@implementation WBSTemplateIconMonogramConfiguration

+ (WBSTemplateIconMonogramConfiguration)configurationWithIconSize:(CGSize)a3 fontSize:(double)a4 fontWeight:(int64_t)a5 fontDesign:(int64_t)a6 baselineOffset:(double)a7 backgroundColor:(id)a8 cornerRadius:(double)a9
{
  double height;
  double width;
  id v16;
  WBSTemplateIconMonogramConfiguration *v17;

  height = a3.height;
  width = a3.width;
  v16 = a8;
  v17 = objc_alloc_init(WBSTemplateIconMonogramConfiguration);
  -[WBSTemplateIconMonogramConfiguration setIconSize:](v17, "setIconSize:", width, height);
  -[WBSTemplateIconMonogramConfiguration setFontSize:](v17, "setFontSize:", a4);
  -[WBSTemplateIconMonogramConfiguration setFontWeight:](v17, "setFontWeight:", a5);
  -[WBSTemplateIconMonogramConfiguration setFontDesign:](v17, "setFontDesign:", a6);
  -[WBSTemplateIconMonogramConfiguration setBaselineOffset:](v17, "setBaselineOffset:", a7);
  -[WBSTemplateIconMonogramConfiguration setBackgroundColor:](v17, "setBackgroundColor:", v16);
  -[WBSTemplateIconMonogramConfiguration setCornerRadius:](v17, "setCornerRadius:", a9);

  return v17;
}

+ (WBSTemplateIconMonogramConfiguration)configurationWithBackgroundColor:(id)a3
{
  objc_msgSend(a1, "configurationWithIconSize:fontSize:fontWeight:fontDesign:baselineOffset:backgroundColor:cornerRadius:", 1, 0, a3, 16.0, 16.0, 11.0, 4.0, 4.0);
  return (WBSTemplateIconMonogramConfiguration *)(id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double *p_cornerRadius;

  v3 = 0;
  result = self->_skipMonogramGeneration;
  do
    result = *((char *)&self->_iconSize.width + v3++) | (result << 8);
  while ((_DWORD)v3 != 16);
  v5 = 0;
  do
    result = *((char *)&self->_fontSize + v5++) | (result << 8);
  while ((_DWORD)v5 != 8);
  v6 = 0;
  do
    result = *((char *)&self->_fontWeight + v6++) | (result << 8);
  while ((_DWORD)v6 != 8);
  v7 = 0;
  do
    result = *((char *)&self->_baselineOffset + v7++) | (result << 8);
  while ((_DWORD)v7 != 8);
  v8 = 0;
  p_cornerRadius = &self->_cornerRadius;
  do
    result = *((char *)p_cornerRadius + v8++) | (result << 8);
  while ((_DWORD)v8 != 8);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  WBSTemplateIconMonogramConfiguration *v4;
  WBSTemplateIconMonogramConfiguration *v5;
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int64_t v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  char v23;
  double v24;
  double v25;
  double v26;

  v4 = (WBSTemplateIconMonogramConfiguration *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[WBSTemplateIconMonogramConfiguration skipMonogramGeneration](self, "skipMonogramGeneration");
      if (v6 != -[WBSTemplateIconMonogramConfiguration skipMonogramGeneration](v5, "skipMonogramGeneration"))
        goto LABEL_13;
      -[WBSTemplateIconMonogramConfiguration iconSize](self, "iconSize");
      v8 = v7;
      v10 = v9;
      -[WBSTemplateIconMonogramConfiguration iconSize](v5, "iconSize");
      v12 = 0;
      if (v8 != v13 || v10 != v11)
        goto LABEL_14;
      -[WBSTemplateIconMonogramConfiguration fontSize](self, "fontSize");
      v15 = v14;
      -[WBSTemplateIconMonogramConfiguration fontSize](v5, "fontSize");
      if (v15 != v16)
        goto LABEL_13;
      v17 = -[WBSTemplateIconMonogramConfiguration fontWeight](self, "fontWeight");
      if (v17 != -[WBSTemplateIconMonogramConfiguration fontWeight](v5, "fontWeight"))
        goto LABEL_13;
      -[WBSTemplateIconMonogramConfiguration baselineOffset](self, "baselineOffset");
      v19 = v18;
      -[WBSTemplateIconMonogramConfiguration baselineOffset](v5, "baselineOffset");
      if (v19 != v20)
        goto LABEL_13;
      -[WBSTemplateIconMonogramConfiguration backgroundColor](self, "backgroundColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSTemplateIconMonogramConfiguration backgroundColor](v5, "backgroundColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "isEqual:", v22);

      if ((v23 & 1) != 0)
      {
        -[WBSTemplateIconMonogramConfiguration cornerRadius](self, "cornerRadius");
        v25 = v24;
        -[WBSTemplateIconMonogramConfiguration cornerRadius](v5, "cornerRadius");
        v12 = v25 == v26;
      }
      else
      {
LABEL_13:
        v12 = 0;
      }
LABEL_14:

      goto LABEL_15;
    }
    v12 = 0;
  }
LABEL_15:

  return v12;
}

- (BOOL)skipMonogramGeneration
{
  return self->_skipMonogramGeneration;
}

- (void)setSkipMonogramGeneration:(BOOL)a3
{
  self->_skipMonogramGeneration = a3;
}

- (CGSize)iconSize
{
  double width;
  double height;
  CGSize result;

  width = self->_iconSize.width;
  height = self->_iconSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setIconSize:(CGSize)a3
{
  self->_iconSize = a3;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (int64_t)fontWeight
{
  return self->_fontWeight;
}

- (void)setFontWeight:(int64_t)a3
{
  self->_fontWeight = a3;
}

- (int64_t)fontDesign
{
  return self->_fontDesign;
}

- (void)setFontDesign:(int64_t)a3
{
  self->_fontDesign = a3;
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (void)setBaselineOffset:(double)a3
{
  self->_baselineOffset = a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setForegroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundColor, a3);
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
