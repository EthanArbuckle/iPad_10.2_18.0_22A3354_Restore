@implementation PSEditableTableCell

+ (int64_t)cellStyle
{
  return 1000;
}

- (PSEditableTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  PSEditableTableCell *v5;
  PSEditableTableCell *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PSEditableTableCell;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v9, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[PSEditableTableCell setSelectionStyle:](v5, "setSelectionStyle:", 0);
    -[PSEditableTableCell setAccessoryType:](v6, "setAccessoryType:", 0);
    -[PSEditableTableCell defaultTextFieldIndentation](v6, "defaultTextFieldIndentation");
    -[PSEditableTableCell setTextFieldOffset:](v6, "setTextFieldOffset:");
    -[PSEditableTableCell editableTextField](v6, "editableTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", v6);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[PSEditableTableCell editableTextField](self, "editableTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB360], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB330], 0);

  v6.receiver = self;
  v6.super_class = (Class)PSEditableTableCell;
  -[PSTableCell dealloc](&v6, sel_dealloc);
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  char isKindOfClass;
  id *v22;
  void *v23;
  id WeakRetained;
  char v25;
  void *v26;
  void *v27;
  SEL v28;
  id v29;
  char v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  PSEditableTableCell *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  char v68;
  id v69;
  uint64_t v70;
  id *v71;
  uint8_t buf[8];
  objc_super v73;
  uint64_t v74;
  _QWORD v75[2];

  v75[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v73.receiver = self;
  v73.super_class = (Class)PSEditableTableCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v73, sel_refreshCellContentsWithSpecifier_, v4);
  -[PSEditableTableCell textField](self, "textField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  if (*((_QWORD *)v4 + 7) == 12)
  {
    objc_msgSend(v4, "propertyForKey:", CFSTR("overrideDevicePasscodeEntryPreset"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v9 = MEMORY[0x1E0C81028];
        v10 = "will not set devicePasscodeEntry (refreshCellContentsWithSpecifier)";
LABEL_10:
        _os_log_impl(&dword_1A3819000, v9, OS_LOG_TYPE_ERROR, v10, buf, 2u);
      }
    }
    else
    {
      objc_msgSend(v5, "setDevicePasscodeEntry:", 1);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v9 = MEMORY[0x1E0C81028];
        v10 = "set devicePasscodeEntry (refreshCellContentsWithSpecifier)";
        goto LABEL_10;
      }
    }
    objc_msgSend(v5, "setSecureTextEntry:", 1);
    objc_msgSend(v5, "setAutocapitalizationType:", 0);
    objc_msgSend(v5, "setAutocorrectionType:", 1);
    v13 = *((_QWORD *)v4 + 12);
    switch(v13)
    {
      case 3:
        v14 = v5;
        v15 = 2;
        break;
      case 2:
        v14 = v5;
        v15 = 11;
        break;
      case 1:
        v14 = v5;
        v15 = 3;
        break;
      default:
        if (*((uint64_t *)v4 + 9) < 1 || (v16 = objc_msgSend(v5, "keyboardType"), v15 = *((_QWORD *)v4 + 9), v16 == v15))
        {
          v14 = v5;
          v15 = 1;
        }
        else
        {
          v14 = v5;
        }
        break;
    }
    objc_msgSend(v14, "setKeyboardType:", v15);
    goto LABEL_37;
  }
  if (*((_QWORD *)v4 + 12))
  {
    objc_msgSend(v5, "setAutocorrectionType:", 1);
    objc_msgSend(v5, "setAutocapitalizationType:", 0);
    switch(*((_QWORD *)v4 + 12))
    {
      case 1:
        v11 = v5;
        v12 = 3;
        goto LABEL_30;
      case 2:
        v11 = v5;
        v12 = 11;
        goto LABEL_30;
      case 3:
        v11 = v5;
        v12 = 2;
        goto LABEL_30;
      case 4:
      case 5:
        v11 = v5;
        v12 = 7;
        goto LABEL_30;
      case 6:
        v11 = v5;
        v12 = 8;
LABEL_30:
        objc_msgSend(v11, "setKeyboardType:", v12);
        break;
      default:
        break;
    }
  }
  else
  {
    if (objc_msgSend(v5, "autocapitalizationType") != *((_QWORD *)v4 + 10))
      objc_msgSend(v5, "setAutocapitalizationType:");
    if (objc_msgSend(v5, "keyboardType") != *((_QWORD *)v4 + 9))
      objc_msgSend(v5, "setKeyboardType:");
    if (objc_msgSend(v5, "autocorrectionType") != *((_QWORD *)v4 + 11))
      objc_msgSend(v5, "setAutocorrectionType:");
  }
  objc_msgSend(v4, "propertyForKey:", CFSTR("noAutoCorrect"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  if (v18)
  {
    objc_msgSend(v5, "setAutocorrectionType:", 1);
    objc_msgSend(v5, "setAutocapitalizationType:", 0);
  }
  objc_msgSend(v4, "propertyForKey:", CFSTR("textContentType"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v4, "propertyForKey:", CFSTR("textContentType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextContentType:", v20);

  }
LABEL_37:
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v22 = (id *)v4;
    objc_msgSend(v22, "placeholder");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "length"))
      -[PSEditableTableCell setPlaceholderText:](self, "setPlaceholderText:", v23);

  }
  else
  {
    v22 = 0;
  }
  if (*((_QWORD *)v4 + 2))
  {
    WeakRetained = objc_loadWeakRetained((id *)v4 + 1);
    v25 = objc_opt_respondsToSelector();

    if ((v25 & 1) != 0)
    {
      objc_msgSend(v4, "performGetter");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26 != 0 || (isKindOfClass & 1) == 0)
        goto LABEL_51;
      if (v22[26])
        goto LABEL_78;
      objc_msgSend(v22, "propertyForKey:", CFSTR("bestGuess"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (SEL)objc_msgSend(v27, "length");
      if (v28)
        v28 = NSSelectorFromString((NSString *)v27);
      v22[26] = (id)v28;

      if (v22[26])
      {
LABEL_78:
        v29 = objc_loadWeakRetained(v22 + 1);
        v30 = objc_opt_respondsToSelector();

        if ((v30 & 1) != 0)
        {
          v31 = objc_loadWeakRetained(v22 + 1);
          SFPerformSelector();
          v26 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_51:
          if (v26)
          {
            -[PSEditableTableCell setValue:](self, "setValue:", v26);

          }
        }
      }
    }
  }
  +[PSListController appearance](PSListController, "appearance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "editablePlaceholderTextColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend(v5, "placeholder");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      v35 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(v5, "placeholder");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = *MEMORY[0x1E0CEA0A0];
      +[PSListController appearance](PSListController, "appearance");
      v71 = v22;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "editablePlaceholderTextColor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSEditableTableCell _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v38);
      v39 = v4;
      v40 = v5;
      v41 = self;
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v75[0] = v42;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, &v74, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (void *)objc_msgSend(v35, "initWithString:attributes:", v36, v43);

      self = v41;
      v5 = v40;
      v4 = v39;

      v22 = v71;
      objc_msgSend(v5, "setAttributedPlaceholder:", v44);

    }
  }
  +[PSListController appearance](PSListController, "appearance");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "editableTextColor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    +[PSListController appearance](PSListController, "appearance");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "editableTextColor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSEditableTableCell _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v49);

  }
  +[PSListController appearance](PSListController, "appearance");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "editableInsertionPointColor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    +[PSListController appearance](PSListController, "appearance");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "editableInsertionPointColor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSEditableTableCell _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInsertionPointColor:", v54);

  }
  +[PSListController appearance](PSListController, "appearance");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "editableSelectionBarColor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    +[PSListController appearance](PSListController, "appearance");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "editableSelectionBarColor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSEditableTableCell _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSelectionBarColor:", v59);

  }
  +[PSListController appearance](PSListController, "appearance");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "editableSelectionHighlightColor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61)
  {
    +[PSListController appearance](PSListController, "appearance");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "editableSelectionHighlightColor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSEditableTableCell _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSelectionHighlightColor:", v64);

  }
  objc_msgSend(v4, "propertyForKey:", CFSTR("alignment"));
  v65 = objc_claimAutoreleasedReturnValue();
  if (v65)
  {
    v66 = (void *)v65;
    objc_msgSend(v4, "propertyForKey:", CFSTR("alignment"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v68 = objc_opt_isKindOfClass();

    if ((v68 & 1) != 0)
    {
      objc_msgSend(v4, "propertyForKey:", CFSTR("alignment"));
      v69 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v69, "isEqualToString:", CFSTR("left")) & 1) != 0)
      {
        v70 = 0;
      }
      else if ((objc_msgSend(v69, "isEqualToString:", CFSTR("center")) & 1) != 0)
      {
        v70 = 1;
      }
      else if (objc_msgSend(v69, "isEqualToString:", CFSTR("right")))
      {
        v70 = 2;
      }
      else
      {
        v70 = 4;
      }

      objc_msgSend(v5, "setTextAlignment:", v70);
    }
  }

}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  -[PSEditableTableCell textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSecureTextEntry:", 0);
  objc_msgSend(v3, "setKeyboardType:", 0);
  objc_msgSend(v3, "setAutocorrectionType:", 0);
  objc_msgSend(v3, "setAutocapitalizationType:", 2);
  -[PSEditableTableCell setPlaceholderText:](self, "setPlaceholderText:", 0);
  v4.receiver = self;
  v4.super_class = (Class)PSEditableTableCell;
  -[PSTableCell prepareForReuse](&v4, sel_prepareForReuse);

}

- (BOOL)canReload
{
  return -[PSEditableTableCell isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class());
}

- (void)controlChanged:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  objc_msgSend(a3, "value");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained(&self->_realTarget);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    -[PSTableCell specifier](self, "specifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = objc_loadWeakRetained(&self->_realTarget);
      -[PSTableCell specifier](self, "specifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)SFPerformSelector2();

    }
  }

}

- (void)endEditingAndSave
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB360], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB330], 0);

  if (self->_valueChanged)
  {
    -[PSEditableTableCell controlChanged:](self, "controlChanged:", self);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0CEBD20];
    -[PSEditableTableCell editableTextField](self, "editableTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, v6, v7);

  }
  if (self->_delaySpecifierRelease)
    -[PSTableCell setSpecifier:](self, "setSpecifier:", 0);
}

- (void)cellRemovedFromView
{
  void *v3;
  objc_super v4;

  -[PSTableCell specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4.receiver = self;
  v4.super_class = (Class)PSEditableTableCell;
  -[PSTableCell cellRemovedFromView](&v4, sel_cellRemovedFromView);
  if (-[PSEditableTableCell isTextFieldEditing](self, "isTextFieldEditing")
    || -[PSEditableTableCell isFirstResponder](self, "isFirstResponder"))
  {
    if (v3)
    {
      -[PSTableCell setSpecifier:](self, "setSpecifier:", v3);
      self->_delaySpecifierRelease = 1;
    }
  }

}

- (void)_setValueChanged
{
  uint64_t v3;
  void *v4;
  id v5;

  if (-[PSEditableTableCell isTextFieldEditing](self, "isTextFieldEditing"))
    self->_valueChanged = 1;
  else
    -[PSEditableTableCell controlChanged:](self, "controlChanged:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0CEBD20];
  -[PSEditableTableCell editableTextField](self, "editableTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, v3, v4);

}

- (void)textFieldDidBeginEditing:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[PSEditableTableCell superview](self, "superview", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && UIKeyboardAutomaticIsOnScreen())
  {
    objc_msgSend(v10, "indexPathForCell:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scrollToRowAtIndexPath:atScrollPosition:animated:", v4, 2, 1);

  }
  self->_valueChanged = 0;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CEBD20];
  -[PSEditableTableCell editableTextField](self, "editableTextField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__setValueChanged, v6, v7);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__saveForExit, *MEMORY[0x1E0CEB360], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__saveForExit, *MEMORY[0x1E0CEB330], 0);

}

- (BOOL)textFieldShouldClear:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  if (!-[PSEditableTableCell isTextFieldEditing](self, "isTextFieldEditing", a3))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0CEBD20];
    -[PSEditableTableCell editableTextField](self, "editableTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__setValueChanged, v5, v6);

  }
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id WeakRetained;
  void *v5;
  int v6;
  void *v7;
  id v8;
  id v9;

  -[PSEditableTableCell endEditingAndSave](self, "endEditingAndSave", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->super._specifier);
  objc_msgSend(WeakRetained, "propertyForKey:", CFSTR("textFieldShouldPopOnReturn"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    if (self->_returnKeyTapped)
    {
      v9 = objc_loadWeakRetained((id *)&self->_controllerDelegate);
      objc_msgSend(v9, "navigationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)objc_msgSend(v7, "popViewControllerAnimated:", 1);

    }
  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id WeakRetained;
  void *v4;
  char v5;

  self->_returnKeyTapped = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._specifier);
  objc_msgSend(WeakRetained, "propertyForKey:", CFSTR("textFieldShouldPopOnReturn"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setValueChangedTarget:(id)a3 action:(SEL)a4 specifier:(id)a5
{
  id obj;

  obj = a3;
  -[PSTableCell setCellTarget:](self, "setCellTarget:", self);
  -[PSTableCell setCellAction:](self, "setCellAction:", sel_controlChanged_);
  self->_targetSetter = a4;
  objc_storeWeak(&self->_realTarget, obj);

}

- (id)_defaultTextColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[PSListController appearance](PSListController, "appearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "editableTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PSEditableTableCell _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSEditableTableCell _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)setCellEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  UIColor *textColor;
  void *v7;
  void *v8;
  void *v9;
  UIColor *v10;
  UIColor *v11;
  uint64_t v12;
  void *v13;
  objc_super v14;

  if (self->super._cellEnabled != a3)
  {
    v3 = a3;
    v14.receiver = self;
    v14.super_class = (Class)PSEditableTableCell;
    -[PSTableCell setCellEnabled:](&v14, sel_setCellEnabled_);
    -[PSEditableTableCell editableTextField](self, "editableTextField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", v3);

    if (v3)
    {
      textColor = self->_textColor;
      -[PSEditableTableCell editableTextField](self, "editableTextField");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (textColor)
      {
        objc_msgSend(v7, "setTextColor:", self->_textColor);

        v8 = self->_textColor;
        self->_textColor = 0;
LABEL_8:

        return;
      }
      -[PSEditableTableCell _defaultTextColor](self, "_defaultTextColor");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PSEditableTableCell editableTextField](self, "editableTextField");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textColor");
      v10 = (UIColor *)objc_claimAutoreleasedReturnValue();
      v11 = self->_textColor;
      self->_textColor = v10;

      -[PSEditableTableCell editableTextField](self, "editableTextField");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "tableCellGrayTextColor");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v13 = (void *)v12;
    objc_msgSend(v8, "setTextColor:", v12);

    goto LABEL_8;
  }
}

- (void)setTitle:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PSEditableTableCell;
  v4 = a3;
  -[PSTableCell setTitle:](&v10, sel_setTitle_, v4);
  v5 = objc_msgSend(v4, "length", v10.receiver, v10.super_class);

  -[PSTableCell textFieldOffset](self, "textFieldOffset");
  v7 = v6;
  if (v5)
  {
    -[PSEditableTableCell minTextFieldIndentation](self, "minTextFieldIndentation");
    if (v7 == v8)
      return;
    -[PSEditableTableCell minTextFieldIndentation](self, "minTextFieldIndentation");
  }
  else
  {
    -[PSEditableTableCell defaultTextFieldIndentation](self, "defaultTextFieldIndentation");
    if (v7 == v9)
      return;
    -[PSEditableTableCell defaultTextFieldIndentation](self, "defaultTextFieldIndentation");
  }
  -[PSEditableTableCell setTextFieldOffset:](self, "setTextFieldOffset:");
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (double)minTextFieldIndentation
{
  return 105.0;
}

- (double)defaultTextFieldIndentation
{
  return 9.0;
}

- (double)textFieldHorizontalPadding
{
  return 8.0;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSString *v7;
  BOOL IsAccessibilityCategory;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  double v16;
  double v17;
  float v18;
  void *v19;
  double v20;
  _BOOL4 v21;
  float v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PSEditableTableCell;
  -[PSTableCell layoutSubviews](&v23, sel_layoutSubviews);
  -[PSTableCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[PSEditableTableCell traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredContentSizeCategory");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

    if (!IsAccessibilityCategory)
    {
      objc_msgSend(v3, "frame");
      v10 = v9;
      v12 = v11;
      objc_msgSend(v3, "sizeToFit");
      objc_msgSend(v3, "frame");
      v14 = v13;
      objc_msgSend(v3, "setFrame:", v10, v12);
      v15 = -[PSEditableTableCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
      -[PSEditableTableCell textFieldHorizontalPadding](self, "textFieldHorizontalPadding");
      if ((v15 & 1) != 0)
        v17 = v10 - v16;
      else
        v17 = v10 + v14 + v16;
      v18 = ceil(v17);
      -[PSEditableTableCell editableTextField](self, "editableTextField");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "frame");
      if (v15)
        v21 = v20 > v18;
      else
        v21 = v20 < v18;
      if (v21)
      {
        v22 = v18 - v20;
        objc_msgSend(v19, "setFrame:", v20 + v22);
      }

    }
  }

}

- (BOOL)canBecomeFirstResponder
{
  void *v2;
  char v3;

  -[PSEditableTableCell editableTextField](self, "editableTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canBecomeFirstResponder");

  return v3;
}

- (BOOL)canResignFirstResponder
{
  void *v2;
  char v3;

  -[PSEditableTableCell editableTextField](self, "editableTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canResignFirstResponder");

  return v3;
}

- (BOOL)isFirstResponder
{
  void *v2;
  char v3;

  -[PSEditableTableCell editableTextField](self, "editableTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFirstResponder");

  return v3;
}

- (BOOL)becomeFirstResponder
{
  void *v2;
  char v3;

  -[PSEditableTableCell editableTextField](self, "editableTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "becomeFirstResponder");

  return v3;
}

- (BOOL)resignFirstResponder
{
  char v3;
  void *v4;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PSEditableTableCell;
  if (-[PSEditableTableCell isFirstResponder](&v7, sel_isFirstResponder))
  {
    v6.receiver = self;
    v6.super_class = (Class)PSEditableTableCell;
    return -[PSEditableTableCell resignFirstResponder](&v6, sel_resignFirstResponder);
  }
  else
  {
    -[PSEditableTableCell editableTextField](self, "editableTextField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "resignFirstResponder");

  }
  return v3;
}

- (BOOL)isTextFieldEditing
{
  void *v2;
  char v3;

  -[PSEditableTableCell editableTextField](self, "editableTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEditing");

  return v3;
}

- (BOOL)_cellIsEditing
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PSEditableTableCell;
  return -[PSEditableTableCell isEditing](&v3, sel_isEditing);
}

- (id)value
{
  void *v2;
  void *v3;

  -[PSEditableTableCell editableTextField](self, "editableTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setValue:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  -[PSEditableTableCell detailTextLabel](self, "detailTextLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v14;
  if (v5 != v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PSEditableTableCell editableTextField](self, "editableTextField");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = v14;
LABEL_4:
      objc_msgSend(v7, "setText:", v9);
LABEL_7:

      v6 = v14;
      goto LABEL_8;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PSEditableTableCell editableTextField](self, "editableTextField");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setText:", v10);

      goto LABEL_7;
    }
    v6 = v14;
    if (!v14)
    {
      -[PSEditableTableCell editableTextField](self, "editableTextField");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");

      v6 = 0;
      if (v13)
      {
        -[PSEditableTableCell editableTextField](self, "editableTextField");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = 0;
        goto LABEL_4;
      }
    }
  }
LABEL_8:

}

- (BOOL)returnKeyTapped
{
  return self->_returnKeyTapped;
}

- (PSListController)controllerDelegate
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_controllerDelegate);
}

- (void)setControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_controllerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controllerDelegate);
  objc_destroyWeak(&self->_realTarget);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_textColor, 0);
}

@end
