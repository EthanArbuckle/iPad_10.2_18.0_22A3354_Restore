@implementation PUIImmutableTextLayoutConfiguration

- (PUIImmutableTextLayoutConfiguration)initWithFontConfiguration:(id)a3 preferredAlignment:(unint64_t)a4 preferredLayout:(unint64_t)a5 style:(id)a6 styleColor:(id)a7 numberingSystemType:(id)a8 userConfigured:(BOOL)a9 contentsLuminance:(double)a10 alternateDateEnabled:(BOOL)a11 groupName:(id)a12
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  PUIImmutableTextLayoutConfiguration *v24;
  uint64_t v25;
  PUIFontConfiguration *fontConfiguration;
  uint64_t v27;
  PUIStyle *style;
  uint64_t v29;
  PUIStyleColor *styleColor;
  uint64_t v31;
  NSString *numberingSystemType;
  uint64_t v33;
  NSString *groupName;
  __int16 v36;
  objc_super v37;

  v19 = a3;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a12;
  v37.receiver = self;
  v37.super_class = (Class)PUIImmutableTextLayoutConfiguration;
  HIBYTE(v36) = a11;
  LOBYTE(v36) = a9;
  v24 = -[PUITextLayoutConfiguration initWithFontConfiguration:preferredAlignment:preferredLayout:style:styleColor:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](&v37, sel_initWithFontConfiguration_preferredAlignment_preferredLayout_style_styleColor_numberingSystemType_userConfigured_contentsLuminance_alternateDateEnabled_groupName_, v19, a4, a5, v20, v21, v22, a10, v36, v23);
  if (v24)
  {
    v25 = objc_msgSend(v19, "copy");
    fontConfiguration = v24->_fontConfiguration;
    v24->_fontConfiguration = (PUIFontConfiguration *)v25;

    v24->_preferredAlignment = a4;
    v24->_preferredLayout = a5;
    v27 = objc_msgSend(v20, "copy");
    style = v24->_style;
    v24->_style = (PUIStyle *)v27;

    v29 = objc_msgSend(v21, "copy");
    styleColor = v24->_styleColor;
    v24->_styleColor = (PUIStyleColor *)v29;

    v31 = objc_msgSend(v22, "copy");
    numberingSystemType = v24->_numberingSystemType;
    v24->_numberingSystemType = (NSString *)v31;

    v24->_userConfigured = a9;
    v24->_contentsLuminance = a10;
    v33 = objc_msgSend(v23, "copy");
    groupName = v24->_groupName;
    v24->_groupName = (NSString *)v33;

    v24->_alternateDateEnabled = a11;
  }

  return v24;
}

- (id)fontConfiguration
{
  return self->_fontConfiguration;
}

- (unint64_t)preferredAlignment
{
  return self->_preferredAlignment;
}

- (unint64_t)preferredLayout
{
  return self->_preferredLayout;
}

- (id)styleColor
{
  return self->_styleColor;
}

- (id)style
{
  return self->_style;
}

- (id)numberingSystemType
{
  return self->_numberingSystemType;
}

- (BOOL)isUserConfigured
{
  return self->_userConfigured;
}

- (double)contentsLuminance
{
  return self->_contentsLuminance;
}

- (id)groupName
{
  return self->_groupName;
}

- (BOOL)isAlternateDateEnabled
{
  return self->_alternateDateEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_numberingSystemType, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_styleColor, 0);
  objc_storeStrong((id *)&self->_fontConfiguration, 0);
}

@end
