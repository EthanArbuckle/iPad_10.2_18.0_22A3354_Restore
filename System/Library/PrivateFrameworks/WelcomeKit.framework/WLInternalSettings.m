@implementation WLInternalSettings

- (WLInternalSettings)initWithJSONDictionary:(id)a3
{
  id v4;
  WLInternalSettings *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)WLInternalSettings;
  v5 = -[WLInternalSettings init](&v7, sel_init);
  if (v5)
  {
    -[WLInternalSettings setEnableAccessibilityDisplayInversion:](v5, "setEnableAccessibilityDisplayInversion:", objc_msgSend(v4, "wl_BOOLForKey:", CFSTR("accessibility_display_inversion_enabled")));
    -[WLInternalSettings setEnableDisplayDarkMode:](v5, "setEnableDisplayDarkMode:", objc_msgSend(v4, "wl_BOOLForKey:", CFSTR("display_dark_mode_enabled")));
    -[WLInternalSettings setEnableDisplayZoom:](v5, "setEnableDisplayZoom:", objc_msgSend(v4, "wl_BOOLForKey:", CFSTR("display_zoom_enabled")));
    objc_msgSend(v4, "wl_floatForKey:", CFSTR("accessibility_font_scale"));
    -[WLInternalSettings setAccessibilityFontScale:](v5, "setAccessibilityFontScale:");
  }

  return v5;
}

+ (id)settingsWithData:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  BOOL v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  WLInternalSettings *v20;
  char isKindOfClass;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  id v29;

  v9 = a3;
  if (v9)
  {
    v29 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v9, 0, &v29);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v29;
    if (v11)
      v12 = 1;
    else
      v12 = v10 == 0;
    if (v12)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v9, 4);
      objc_msgSend(v11, "description");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      _WLLog(v3, 0, CFSTR("did fail to convert json to object %@\n%@"), v15, v16, v17, v18, v19, (uint64_t)v14);

    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
      {
        v20 = -[WLInternalSettings initWithJSONDictionary:]([WLInternalSettings alloc], "initWithJSONDictionary:", v10);
LABEL_13:

        goto LABEL_14;
      }
      _WLLog(v3, 0, CFSTR("expected a dictionary but got a wrong type"), v22, v23, v24, v25, v26, v28);
    }
    v20 = 0;
    goto LABEL_13;
  }
  _WLLog(v3, 0, CFSTR("data was nil and did skip"), v4, v5, v6, v7, v8, v28);
  v20 = 0;
LABEL_14:

  return v20;
}

- (BOOL)enableAccessibilityDisplayInversion
{
  return self->_enableAccessibilityDisplayInversion;
}

- (void)setEnableAccessibilityDisplayInversion:(BOOL)a3
{
  self->_enableAccessibilityDisplayInversion = a3;
}

- (BOOL)enableDisplayZoom
{
  return self->_enableDisplayZoom;
}

- (void)setEnableDisplayZoom:(BOOL)a3
{
  self->_enableDisplayZoom = a3;
}

- (BOOL)enableDisplayDarkMode
{
  return self->_enableDisplayDarkMode;
}

- (void)setEnableDisplayDarkMode:(BOOL)a3
{
  self->_enableDisplayDarkMode = a3;
}

- (double)accessibilityFontScale
{
  return self->_accessibilityFontScale;
}

- (void)setAccessibilityFontScale:(double)a3
{
  self->_accessibilityFontScale = a3;
}

@end
