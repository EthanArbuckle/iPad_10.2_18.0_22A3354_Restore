@implementation _UITextFieldVisualStyle_tvOS

- (id)defaultTextColor
{
  void *v3;
  char v4;
  void *v5;

  -[_UITextFieldVisualStyle styleSubject](self, "styleSubject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_shouldDetermineInterfaceStyleTextColor");

  if ((v4 & 1) != 0 && dyld_program_sdk_at_least())
  {
    -[_UITextFieldVisualStyle_tvOS _defaultTextColorForUserInterfaceStyle](self, "_defaultTextColorForUserInterfaceStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UITextFieldVisualStyle_tvOS defaultTextColorForKeyboardAppearance](self, "defaultTextColorForKeyboardAppearance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)defaultTextColorForKeyboardAppearance
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[_UITextFieldVisualStyle styleSubject](self, "styleSubject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_keyboardAppearance");

  if (v4 == 1)
  {
    -[_UITextFieldVisualStyle_tvOS _defaultTextColorDarkKeyboard](self, "_defaultTextColorDarkKeyboard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v4 == 10)
  {
    -[_UITextFieldVisualStyle_tvOS _defaultTextColorForUserInterfaceStyle](self, "_defaultTextColorForUserInterfaceStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4 == 9)
      -[_UITextFieldVisualStyle_tvOS _defaultTextColorBlackKeyboard](self, "_defaultTextColorBlackKeyboard");
    else
      -[_UITextFieldVisualStyle_tvOS _defaultTextColorLightKeyboard](self, "_defaultTextColorLightKeyboard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)defaultFocusedTextColor
{
  return +[UIColor blackColor](UIColor, "blackColor");
}

- (id)placeholderColor
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v14;

  -[_UITextFieldVisualStyle styleSubject](self, "styleSubject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "_isFocused") & 1) != 0)
  {
    -[_UITextFieldVisualStyle styleSubject](self, "styleSubject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_fieldEditorAttached");

    if (!v5)
    {
      -[_UITextFieldVisualStyle_tvOS _placeholderTextColorFocused](self, "_placeholderTextColorFocused");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v12 = (id)v6;
      return v12;
    }
  }
  else
  {

  }
  -[_UITextFieldVisualStyle styleSubject](self, "styleSubject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_keyboardAppearance");

  -[_UITextFieldVisualStyle styleSubject](self, "styleSubject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "_userInterfaceStyle");

  if (v8 == 1)
  {
    -[_UITextFieldVisualStyle_tvOS _placeholderTextColorDarkKeyboard](self, "_placeholderTextColorDarkKeyboard");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (v8 != 10)
  {
    if (v8 == 9)
      -[_UITextFieldVisualStyle_tvOS _placeholderTextColorBlackKeyboard](self, "_placeholderTextColorBlackKeyboard");
    else
      -[_UITextFieldVisualStyle_tvOS _placeholderTextColorLightKeyboard](self, "_placeholderTextColorLightKeyboard");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (v10 == 1000 || v10 == 2)
  {
    -[_UITextFieldVisualStyle_tvOS _placeholderTextColorDarkKeyboard](self, "_placeholderTextColorDarkKeyboard");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UITextFieldVisualStyle_tvOS _placeholderTextColorLightKeyboard](self, "_placeholderTextColorLightKeyboard");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v11;
  v12 = v11;

  return v12;
}

- (id)parentViewForTextContentView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[_UITextFieldVisualStyle styleSubject](self, "styleSubject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UITextFieldVisualStyle styleSubject](self, "styleSubject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_contentBackdropView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && -[_UITextFieldVisualStyle_tvOS textShouldUseVibrancy](self, "textShouldUseVibrancy"))
  {
    v8 = v7;

    v4 = v8;
  }
  objc_msgSend(v4, "setClipsToBounds:", 0);

  return v4;
}

- (void)handleTextVibrancy
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  -[_UITextFieldVisualStyle styleSubject](self, "styleSubject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_fieldEditorAttached");

  if ((v4 & 1) == 0)
  {
    -[_UITextFieldVisualStyle styleSubject](self, "styleSubject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_textCanvasView");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (-[_UITextFieldVisualStyle_tvOS textShouldUseVibrancy](self, "textShouldUseVibrancy"))
    {
      -[_UITextFieldVisualStyle styleSubject](self, "styleSubject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_currentTextColor");
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v8 = objc_msgSend(v7, "CGColor");
      objc_msgSend(v10, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setContentsMultiplyColor:", v8);

    }
    else
    {
      objc_msgSend(v10, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setContentsMultiplyColor:", 0);
    }

  }
}

- (BOOL)textShouldUseVibrancy
{
  void *v3;
  char isKindOfClass;
  void *v6;
  char v7;

  -[_UITextFieldVisualStyle styleSubject](self, "styleSubject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    return 0;
  -[_UITextFieldVisualStyle styleSubject](self, "styleSubject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_textShouldUseVibrancy");

  return v7;
}

- (id)editingProcessorOverridingEditingAttributes:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;

  v4 = (void *)objc_opt_new();
  -[_UITextFieldVisualStyle styleSubject](self, "styleSubject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_hasFloatingFieldEditor");

  if (v6)
  {
    -[_UITextFieldVisualStyle_tvOS defaultTextColorForKeyboardAppearance](self, "defaultTextColorForKeyboardAppearance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *(_QWORD *)off_1E1678D98);
  }
  else
  {
    v7 = 0;
  }
  -[_UITextFieldVisualStyle styleSubject](self, "styleSubject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_shouldOverrideEditingFont");

  if (v9)
  {
    -[_UITextFieldVisualStyle_tvOS _defaultEditingFont](self, "_defaultEditingFont");
    v10 = objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, *(_QWORD *)off_1E1678D90);
      v7 = (void *)v10;
    }
    else
    {
      v7 = 0;
    }
  }

  return v4;
}

- (id)_defaultTextColorForUserInterfaceStyle
{
  void *v3;
  uint64_t v4;

  -[_UITextFieldVisualStyle styleSubject](self, "styleSubject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_userInterfaceStyle");

  if (v4 == 2)
    -[_UITextFieldVisualStyle_tvOS _defaultTextColorDarkKeyboard](self, "_defaultTextColorDarkKeyboard");
  else
    -[_UITextFieldVisualStyle_tvOS _defaultTextColorLightKeyboard](self, "_defaultTextColorLightKeyboard");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_defaultTextColorLightKeyboard
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.6);
}

- (id)_defaultTextColorDarkKeyboard
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.6);
}

- (id)_defaultTextColorBlackKeyboard
{
  return +[UIColor whiteColor](UIColor, "whiteColor");
}

- (id)_placeholderTextColorLightKeyboard
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.3);
}

- (id)_placeholderTextColorDarkKeyboard
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.25);
}

- (id)_placeholderTextColorBlackKeyboard
{
  return +[UIColor whiteColor](UIColor, "whiteColor");
}

- (id)_placeholderTextColorFocused
{
  return +[UIColor _systemMidGrayTintColor](UIColor, "_systemMidGrayTintColor");
}

- (id)_defaultEditingFont
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[_UITextFieldVisualStyle styleSubject](self, "styleSubject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_textShouldFillFieldEditorHeight");

  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleHeadline"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[_UITextFieldVisualStyle styleSubject](self, "styleSubject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_fieldEditorHeight");
    objc_msgSend(v5, "fontWithSize:");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  return v5;
}

@end
