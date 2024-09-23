@implementation _UIColorPickerViewControllerConfiguration

- (_UIColorPickerViewControllerConfiguration)init
{
  _UIColorPickerViewControllerConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIColorPickerViewControllerConfiguration;
  result = -[_UIColorPickerViewControllerConfiguration init](&v3, sel_init);
  if (result)
  {
    result->_showsAlpha = 1;
    result->__showsEyedropper = 1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setShowsAlpha:", -[_UIColorPickerViewControllerConfiguration showsAlpha](self, "showsAlpha"));
  -[_UIColorPickerViewControllerConfiguration title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  objc_msgSend(v4, "set_userInterfaceStyleForGrid:", -[_UIColorPickerViewControllerConfiguration _userInterfaceStyleForGrid](self, "_userInterfaceStyleForGrid"));
  objc_msgSend(v4, "set_shouldUseDarkGridInDarkMode:", -[_UIColorPickerViewControllerConfiguration _shouldUseDarkGridInDarkMode](self, "_shouldUseDarkGridInDarkMode"));
  objc_msgSend(v4, "set_isEmbedded:", -[_UIColorPickerViewControllerConfiguration _isEmbedded](self, "_isEmbedded"));
  objc_msgSend(v4, "set_useLandscapeLayout:", -[_UIColorPickerViewControllerConfiguration _useLandscapeLayout](self, "_useLandscapeLayout"));
  -[_UIColorPickerViewControllerConfiguration _preferredWidth](self, "_preferredWidth");
  objc_msgSend(v4, "set_preferredWidth:");
  -[_UIColorPickerViewControllerConfiguration _suggestedColors](self, "_suggestedColors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set_suggestedColors:", v6);

  objc_msgSend(v4, "set_allowsNoColor:", -[_UIColorPickerViewControllerConfiguration _allowsNoColor](self, "_allowsNoColor"));
  objc_msgSend(v4, "set_showsEyedropper:", -[_UIColorPickerViewControllerConfiguration _showsEyedropper](self, "_showsEyedropper"));
  objc_msgSend(v4, "set_showsGridOnly:", -[_UIColorPickerViewControllerConfiguration _showsGridOnly](self, "_showsGridOnly"));
  objc_msgSend(v4, "set_isInPopoverPresentation:", -[_UIColorPickerViewControllerConfiguration _isInPopoverPresentation](self, "_isInPopoverPresentation"));
  objc_msgSend(v4, "set_isInSheetPresentation:", -[_UIColorPickerViewControllerConfiguration _isInSheetPresentation](self, "_isInSheetPresentation"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _UIColorPickerViewControllerConfiguration *v4;
  _UIColorPickerViewControllerConfiguration *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  int v14;
  _BOOL4 v15;
  int64_t v16;
  _BOOL4 v17;
  _BOOL4 v18;
  double v19;
  double v20;
  double v21;
  _BOOL4 v22;
  _BOOL4 v23;
  _BOOL4 v24;
  _BOOL4 v25;
  _BOOL4 v27;

  v4 = (_UIColorPickerViewControllerConfiguration *)a3;
  if (self == v4)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[_UIColorPickerViewControllerConfiguration showsAlpha](self, "showsAlpha");
      if (v6 != -[_UIColorPickerViewControllerConfiguration showsAlpha](v5, "showsAlpha"))
      {
        LOBYTE(v7) = 0;
LABEL_29:

        goto LABEL_30;
      }
      -[_UIColorPickerViewControllerConfiguration title](self, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIColorPickerViewControllerConfiguration title](v5, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v8;
      v11 = v9;
      v12 = v11;
      if (v10 == v11)
      {

      }
      else
      {
        LOBYTE(v7) = 0;
        v13 = v10;
        if (!v10 || !v11)
          goto LABEL_27;
        v14 = objc_msgSend(v10, "isEqual:", v11);

        if (!v14)
        {
LABEL_20:
          LOBYTE(v7) = 0;
LABEL_28:

          goto LABEL_29;
        }
      }
      v15 = -[_UIColorPickerViewControllerConfiguration _shouldUseDarkGridInDarkMode](self, "_shouldUseDarkGridInDarkMode");
      if (v15 != -[_UIColorPickerViewControllerConfiguration _shouldUseDarkGridInDarkMode](v5, "_shouldUseDarkGridInDarkMode"))goto LABEL_20;
      v16 = -[_UIColorPickerViewControllerConfiguration _userInterfaceStyleForGrid](self, "_userInterfaceStyleForGrid");
      if (v16 != -[_UIColorPickerViewControllerConfiguration _userInterfaceStyleForGrid](v5, "_userInterfaceStyleForGrid"))goto LABEL_20;
      v17 = -[_UIColorPickerViewControllerConfiguration _isEmbedded](self, "_isEmbedded");
      if (v17 != -[_UIColorPickerViewControllerConfiguration _isEmbedded](v5, "_isEmbedded"))
        goto LABEL_20;
      v18 = -[_UIColorPickerViewControllerConfiguration _useLandscapeLayout](self, "_useLandscapeLayout");
      if (v18 != -[_UIColorPickerViewControllerConfiguration _useLandscapeLayout](v5, "_useLandscapeLayout"))
        goto LABEL_20;
      -[_UIColorPickerViewControllerConfiguration _preferredWidth](self, "_preferredWidth");
      v20 = v19;
      -[_UIColorPickerViewControllerConfiguration _preferredWidth](v5, "_preferredWidth");
      if (v20 != v21)
        goto LABEL_20;
      -[_UIColorPickerViewControllerConfiguration _suggestedColors](self, "_suggestedColors");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[_UIColorPickerViewControllerConfiguration _suggestedColors](v5, "_suggestedColors");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (v13 == v11)
      {
        v22 = -[_UIColorPickerViewControllerConfiguration _allowsNoColor](self, "_allowsNoColor");
        if (v22 == -[_UIColorPickerViewControllerConfiguration _allowsNoColor](v5, "_allowsNoColor")
          && (v23 = -[_UIColorPickerViewControllerConfiguration _showsEyedropper](self, "_showsEyedropper"),
              v23 == -[_UIColorPickerViewControllerConfiguration _showsEyedropper](v5, "_showsEyedropper"))
          && (v24 = -[_UIColorPickerViewControllerConfiguration _showsGridOnly](self, "_showsGridOnly"),
              v24 == -[_UIColorPickerViewControllerConfiguration _showsGridOnly](v5, "_showsGridOnly"))
          && (v25 = -[_UIColorPickerViewControllerConfiguration _isInPopoverPresentation](self, "_isInPopoverPresentation"), v25 == -[_UIColorPickerViewControllerConfiguration _isInPopoverPresentation](v5, "_isInPopoverPresentation")))
        {
          v27 = -[_UIColorPickerViewControllerConfiguration _isInSheetPresentation](self, "_isInSheetPresentation");
          v7 = v27 ^ -[_UIColorPickerViewControllerConfiguration _isInSheetPresentation](v5, "_isInSheetPresentation") ^ 1;
        }
        else
        {
          LOBYTE(v7) = 0;
        }
        v11 = v13;
      }
      else
      {
        LOBYTE(v7) = 0;
      }
LABEL_27:

      goto LABEL_28;
    }
    LOBYTE(v7) = 0;
  }
LABEL_30:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  int64_t v13;
  double v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  unint64_t v30;

  v3 = -[_UIColorPickerViewControllerConfiguration showsAlpha](self, "showsAlpha");
  -[_UIColorPickerViewControllerConfiguration title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  v6 = v5 ^ (2
           * -[_UIColorPickerViewControllerConfiguration _userInterfaceStyleForGrid](self, "_userInterfaceStyleForGrid"));
  if (-[_UIColorPickerViewControllerConfiguration _shouldUseDarkGridInDarkMode](self, "_shouldUseDarkGridInDarkMode"))
    v7 = 8;
  else
    v7 = 0;
  v8 = -[_UIColorPickerViewControllerConfiguration _isEmbedded](self, "_isEmbedded");
  v9 = 16;
  if (!v8)
    v9 = 0;
  v10 = v7 ^ v9;
  v11 = -[_UIColorPickerViewControllerConfiguration _useLandscapeLayout](self, "_useLandscapeLayout");
  v12 = 32;
  if (!v11)
    v12 = 0;
  v13 = v6 ^ v10 ^ v12;
  -[_UIColorPickerViewControllerConfiguration _preferredWidth](self, "_preferredWidth");
  v15 = v13 ^ ((unint64_t)v14 << 6);
  if (-[_UIColorPickerViewControllerConfiguration _allowsNoColor](self, "_allowsNoColor"))
    v16 = 128;
  else
    v16 = 0;
  v17 = -[_UIColorPickerViewControllerConfiguration _showsEyedropper](self, "_showsEyedropper");
  v18 = 256;
  if (!v17)
    v18 = 0;
  v19 = v16 ^ v18;
  v20 = -[_UIColorPickerViewControllerConfiguration _showsGridOnly](self, "_showsGridOnly");
  v21 = 512;
  if (!v20)
    v21 = 0;
  v22 = v19 ^ v21;
  v23 = -[_UIColorPickerViewControllerConfiguration _isInPopoverPresentation](self, "_isInPopoverPresentation");
  v24 = 1024;
  if (!v23)
    v24 = 0;
  v25 = v22 ^ v24;
  v26 = -[_UIColorPickerViewControllerConfiguration _isInSheetPresentation](self, "_isInSheetPresentation");
  v27 = 2048;
  if (!v26)
    v27 = 0;
  v28 = v25 ^ v27;
  -[_UIColorPickerViewControllerConfiguration _suggestedColors](self, "_suggestedColors");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v15 ^ v28 ^ objc_msgSend(v29, "hash");

  return v30;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  double v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeBool:forKey:", -[_UIColorPickerViewControllerConfiguration showsAlpha](self, "showsAlpha"), CFSTR("ShowsAlpha"));
  -[_UIColorPickerViewControllerConfiguration title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("_Title"));

  objc_msgSend(v7, "encodeInt:forKey:", -[_UIColorPickerViewControllerConfiguration _userInterfaceStyleForGrid](self, "_userInterfaceStyleForGrid"), CFSTR("_interfaceStyle"));
  objc_msgSend(v7, "encodeBool:forKey:", -[_UIColorPickerViewControllerConfiguration _shouldUseDarkGridInDarkMode](self, "_shouldUseDarkGridInDarkMode"), CFSTR("_UseDarkGrid"));
  objc_msgSend(v7, "encodeBool:forKey:", -[_UIColorPickerViewControllerConfiguration _isEmbedded](self, "_isEmbedded"), CFSTR("_IsEmbedded"));
  objc_msgSend(v7, "encodeBool:forKey:", -[_UIColorPickerViewControllerConfiguration _useLandscapeLayout](self, "_useLandscapeLayout"), CFSTR("_UseLandscapeLayout"));
  -[_UIColorPickerViewControllerConfiguration _preferredWidth](self, "_preferredWidth");
  *(float *)&v5 = v5;
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("_PreferredWidth"), v5);
  -[_UIColorPickerViewControllerConfiguration _suggestedColors](self, "_suggestedColors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("_SuggestedColors"));

  objc_msgSend(v7, "encodeBool:forKey:", -[_UIColorPickerViewControllerConfiguration _allowsNoColor](self, "_allowsNoColor"), CFSTR("_AllowsNoColor"));
  objc_msgSend(v7, "encodeBool:forKey:", -[_UIColorPickerViewControllerConfiguration _showsEyedropper](self, "_showsEyedropper"), CFSTR("_ShowsEyedropper"));
  objc_msgSend(v7, "encodeBool:forKey:", -[_UIColorPickerViewControllerConfiguration _showsGridOnly](self, "_showsGridOnly"), CFSTR("_ShowsGridOnly"));
  objc_msgSend(v7, "encodeBool:forKey:", -[_UIColorPickerViewControllerConfiguration _isInPopoverPresentation](self, "_isInPopoverPresentation"), CFSTR("_IsInPopoverPresentation"));
  objc_msgSend(v7, "encodeBool:forKey:", -[_UIColorPickerViewControllerConfiguration _isInSheetPresentation](self, "_isInSheetPresentation"), CFSTR("_IsInSheetPresentation"));

}

- (_UIColorPickerViewControllerConfiguration)initWithCoder:(id)a3
{
  id v4;
  _UIColorPickerViewControllerConfiguration *v5;
  void *v6;
  float v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIColorPickerViewControllerConfiguration;
  v5 = -[_UIColorPickerViewControllerConfiguration init](&v13, sel_init);
  if (v5)
  {
    -[_UIColorPickerViewControllerConfiguration setShowsAlpha:](v5, "setShowsAlpha:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ShowsAlpha")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_Title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIColorPickerViewControllerConfiguration setTitle:](v5, "setTitle:", v6);

    -[_UIColorPickerViewControllerConfiguration set_userInterfaceStyleForGrid:](v5, "set_userInterfaceStyleForGrid:", (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("_interfaceStyle")));
    -[_UIColorPickerViewControllerConfiguration set_shouldUseDarkGridInDarkMode:](v5, "set_shouldUseDarkGridInDarkMode:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_UseDarkGrid")));
    -[_UIColorPickerViewControllerConfiguration set_isEmbedded:](v5, "set_isEmbedded:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_IsEmbedded")));
    -[_UIColorPickerViewControllerConfiguration set_useLandscapeLayout:](v5, "set_useLandscapeLayout:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_UseLandscapeLayout")));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_PreferredWidth"));
    -[_UIColorPickerViewControllerConfiguration set_preferredWidth:](v5, "set_preferredWidth:", v7);
    v8 = (void *)MEMORY[0x1E0C99E60];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_SuggestedColors"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIColorPickerViewControllerConfiguration set_suggestedColors:](v5, "set_suggestedColors:", v11);

    -[_UIColorPickerViewControllerConfiguration set_allowsNoColor:](v5, "set_allowsNoColor:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_AllowsNoColor")));
    -[_UIColorPickerViewControllerConfiguration set_showsEyedropper:](v5, "set_showsEyedropper:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_ShowsEyedropper")));
    -[_UIColorPickerViewControllerConfiguration set_showsGridOnly:](v5, "set_showsGridOnly:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_ShowsGridOnly")));
    -[_UIColorPickerViewControllerConfiguration set_isInPopoverPresentation:](v5, "set_isInPopoverPresentation:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_IsInPopoverPresentation")));
    -[_UIColorPickerViewControllerConfiguration set_isInSheetPresentation:](v5, "set_isInSheetPresentation:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_IsInSheetPresentation")));
  }

  return v5;
}

- (BOOL)_shouldUseDarkGridInDarkMode
{
  return self->__shouldUseDarkGridInDarkMode;
}

- (void)set_shouldUseDarkGridInDarkMode:(BOOL)a3
{
  self->__shouldUseDarkGridInDarkMode = a3;
}

- (int64_t)_userInterfaceStyleForGrid
{
  return self->__userInterfaceStyleForGrid;
}

- (void)set_userInterfaceStyleForGrid:(int64_t)a3
{
  self->__userInterfaceStyleForGrid = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)showsAlpha
{
  return self->_showsAlpha;
}

- (void)setShowsAlpha:(BOOL)a3
{
  self->_showsAlpha = a3;
}

- (BOOL)_isEmbedded
{
  return self->__isEmbedded;
}

- (void)set_isEmbedded:(BOOL)a3
{
  self->__isEmbedded = a3;
}

- (BOOL)_useLandscapeLayout
{
  return self->__useLandscapeLayout;
}

- (void)set_useLandscapeLayout:(BOOL)a3
{
  self->__useLandscapeLayout = a3;
}

- (double)_preferredWidth
{
  return self->__preferredWidth;
}

- (void)set_preferredWidth:(double)a3
{
  self->__preferredWidth = a3;
}

- (NSArray)_suggestedColors
{
  return self->__suggestedColors;
}

- (void)set_suggestedColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)_allowsNoColor
{
  return self->__allowsNoColor;
}

- (void)set_allowsNoColor:(BOOL)a3
{
  self->__allowsNoColor = a3;
}

- (BOOL)_showsEyedropper
{
  return self->__showsEyedropper;
}

- (void)set_showsEyedropper:(BOOL)a3
{
  self->__showsEyedropper = a3;
}

- (BOOL)_showsGridOnly
{
  return self->__showsGridOnly;
}

- (void)set_showsGridOnly:(BOOL)a3
{
  self->__showsGridOnly = a3;
}

- (BOOL)_isInPopoverPresentation
{
  return self->__isInPopoverPresentation;
}

- (void)set_isInPopoverPresentation:(BOOL)a3
{
  self->__isInPopoverPresentation = a3;
}

- (BOOL)_isInSheetPresentation
{
  return self->__isInSheetPresentation;
}

- (void)set_isInSheetPresentation:(BOOL)a3
{
  self->__isInSheetPresentation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__suggestedColors, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
