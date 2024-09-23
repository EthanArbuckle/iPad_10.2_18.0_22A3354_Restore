@implementation PUPhotoEditNotchButton

- (PUPhotoEditNotchButton)initWithFrame:(CGRect)a3
{
  PUPhotoEditNotchButton *v3;
  PUPhotoEditNotchButton *v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUPhotoEditNotchButton;
  v3 = -[PUPhotoEditNotchButton initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PUPhotoEditNotchButton setAutomaticallyUpdatesConfiguration:](v3, "setAutomaticallyUpdatesConfiguration:", 1);
    -[PUPhotoEditNotchButton setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUPhotoEditNotchButton baseConfiguration](v4, "baseConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditNotchButton setConfiguration:](v4, "setConfiguration:", v5);

    -[PUPhotoEditNotchButton setShowsLargeContentViewer:](v4, "setShowsLargeContentViewer:", 1);
    v6 = objc_alloc_init(MEMORY[0x1E0DC3998]);
    -[PUPhotoEditNotchButton addInteraction:](v4, "addInteraction:", v6);

  }
  return v4;
}

- (id)baseConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCornerStyle:", 2);
  -[PUPhotoEditNotchButton buttonTitle](self, "buttonTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {

  }
  else
  {
    -[PUPhotoEditNotchButton buttonSymbolName](self, "buttonSymbolName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      -[PUPhotoEditNotchButton imageConfiguration](self, "imageConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0DC3870];
      -[PUPhotoEditNotchButton buttonSymbolName](self, "buttonSymbolName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "systemImageNamed:withConfiguration:", v12, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setImage:", v13);

      goto LABEL_16;
    }
  }
  -[PUPhotoEditNotchButton textColor](self, "textColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v7;

  v33[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 14.0, *MEMORY[0x1E0DC1420]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v14;
  v33[1] = *MEMORY[0x1E0DC1140];
  v15 = -[PUPhotoEditNotchButton isEnabled](self, "isEnabled");
  v16 = v10;
  if ((v15 & 1) == 0)
  {
    objc_msgSend(v10, "colorWithAlphaComponent:", 0.4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v15 & 1) == 0)

  v17 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[PUPhotoEditNotchButton buttonTitle](self, "buttonTitle");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = (const __CFString *)v18;
  else
    v20 = &stru_1E58AD278;
  v21 = (void *)objc_msgSend(v17, "initWithString:attributes:", v20, v12);
  objc_msgSend(v3, "setAttributedTitle:", v21);

LABEL_16:
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditNotchButton backgroundColor](self, "backgroundColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    v25 = v23;
  }
  else
  {
    objc_msgSend(v22, "photoEditingNotchButtonBackgroundColor");
    v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  v26 = v25;

  if ((-[PUPhotoEditNotchButton isEnabled](self, "isEnabled") & 1) == 0)
  {
    -[PUPhotoEditNotchButton backgroundColor](self, "backgroundColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      -[PUPhotoEditNotchButton backgroundColor](self, "backgroundColor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "colorWithAlphaComponent:", 0.4);
      v29 = objc_claimAutoreleasedReturnValue();

      v26 = v28;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
      v29 = objc_claimAutoreleasedReturnValue();
    }

    v26 = (void *)v29;
  }
  objc_msgSend(v3, "setImagePadding:", 3.0);
  objc_msgSend(v3, "setButtonSize:", 2);
  objc_msgSend(v3, "setTitleLineBreakMode:", 4);
  objc_msgSend(v3, "setCornerStyle:", 4);
  objc_msgSend(v3, "background");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setBackgroundColor:", v26);

  -[PUPhotoEditNotchButton titleLabel](self, "titleLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v3, "contentInsets");
  objc_msgSend(v3, "setContentInsets:");

  return v3;
}

- (id)imageConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 11.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationWithFont:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithWeight:", 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configurationWithPaletteColors:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "configurationByApplyingConfiguration:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configurationByApplyingConfiguration:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)updateConfiguration
{
  id v3;

  -[PUPhotoEditNotchButton baseConfiguration](self, "baseConfiguration");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditNotchButton setConfiguration:](self, "setConfiguration:", v3);

}

- (void)setTitle:(id)a3 fallbackSymbolName:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (setTitle_fallbackSymbolName__onceToken != -1)
    dispatch_once(&setTitle_fallbackSymbolName__onceToken, &__block_literal_global_235);
  if (setTitle_fallbackSymbolName__forceFallback && objc_msgSend(v6, "length"))
    v7 = 0;
  else
    v7 = v8;
  -[PUPhotoEditNotchButton setButtonTitle:](self, "setButtonTitle:", v7);
  -[PUPhotoEditNotchButton setButtonSymbolName:](self, "setButtonSymbolName:", v6);
  -[PUPhotoEditNotchButton setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");

}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
  -[PUPhotoEditNotchButton setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (void)setButtonTitle:(id)a3
{
  objc_storeStrong((id *)&self->_buttonTitle, a3);
}

- (NSString)buttonSymbolName
{
  return self->_buttonSymbolName;
}

- (void)setButtonSymbolName:(id)a3
{
  objc_storeStrong((id *)&self->_buttonSymbolName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonSymbolName, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

void __54__PUPhotoEditNotchButton_setTitle_fallbackSymbolName___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  setTitle_fallbackSymbolName__forceFallback = objc_msgSend(v0, "BOOLForKey:", CFSTR("NSDoubleLocalizedStrings"));

}

@end
