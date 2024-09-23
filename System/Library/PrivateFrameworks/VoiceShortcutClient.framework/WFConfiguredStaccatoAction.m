@implementation WFConfiguredStaccatoAction

- (WFConfiguredStaccatoAction)initWithIdentifier:(id)a3 sectionIdentifier:(id)a4 associatedBundleIdentifier:(id)a5 name:(id)a6 systemImageName:(id)a7 shortcutsMetadata:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  WFSymbolIcon *v18;
  void *v19;
  WFConfiguredStaccatoAction *v20;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a8;
  if (a7)
  {
    v17 = a7;
    v18 = [WFSymbolIcon alloc];
    +[WFColor colorWithSystemColor:](WFColor, "colorWithSystemColor:", 21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    a7 = -[WFSymbolIcon initWithSymbolName:symbolColor:](v18, "initWithSymbolName:symbolColor:", v17, v19);

  }
  v20 = -[WFConfiguredStaccatoAction initWithIdentifier:associatedBundleIdentifier:name:previewIcon:shortcutsMetadata:](self, "initWithIdentifier:associatedBundleIdentifier:name:previewIcon:shortcutsMetadata:", v13, v14, v15, a7, v16);

  return v20;
}

- (WFColor)tintColor
{
  void *v2;
  void *v3;

  -[WFConfiguredStaccatoAction sectionIdentifier](self, "sectionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFStaccatoTintColorForSectionIdentifier(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFColor *)v3;
}

- (BOOL)isSystemStaccatoAction
{
  __CFString *v2;
  BOOL v3;

  -[WFConfiguredStaccatoAction sectionIdentifier](self, "sectionIdentifier");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != CFSTR("Shortcuts");

  return v3;
}

- (NSString)sectionIdentifier
{
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  int v21;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSString *)CFSTR("Nothing");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSString *)CFSTR("Controls");
  -[WFConfiguredStaccatoAction identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.ShortcutsActions.SetSilentModeAction"));

  if ((v5 & 1) != 0)
    return (NSString *)CFSTR("SilentMode");
  -[WFConfiguredStaccatoAction identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.springboard.Focus"));

  if ((v7 & 1) != 0)
    return (NSString *)CFSTR("Focus");
  -[WFConfiguredStaccatoAction identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.springboard.OpenCamera"));

  if ((v9 & 1) != 0)
    return (NSString *)CFSTR("Camera");
  -[WFConfiguredStaccatoAction identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.VoiceMemos.ToggleRecording"));

  if ((v11 & 1) != 0)
    return (NSString *)CFSTR("VoiceMemos");
  -[WFConfiguredStaccatoAction identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.springboard.ToggleFlashlight"));

  if ((v13 & 1) != 0)
    return (NSString *)CFSTR("Flashlight");
  -[WFConfiguredStaccatoAction identifier](self, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.AccessibilityUIServer.ToggleAccessibilityFeatureIntent"));

  if ((v15 & 1) != 0)
    return (NSString *)CFSTR("Accessibility");
  -[WFConfiguredStaccatoAction identifier](self, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.musicrecognition.RecognizeMusicIntent"));

  if ((v17 & 1) != 0)
    return (NSString *)CFSTR("MusicRecognition");
  -[WFConfiguredStaccatoAction identifier](self, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.Translate.ToggleSpeechTranslationIntent"));

  if ((v19 & 1) != 0)
    return (NSString *)CFSTR("Translate");
  -[WFConfiguredStaccatoAction identifier](self, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.Magnifier.MagnifierIntent"));

  if (v21)
    return (NSString *)CFSTR("Magnifier");
  else
    return (NSString *)CFSTR("Shortcuts");
}

- (NSString)systemImageName
{
  return (NSString *)CFSTR("app.2.stack.3d");
}

- (WFConfiguredStaccatoAction)initWithIdentifier:(id)a3 associatedBundleIdentifier:(id)a4 name:(id)a5 previewIcon:(id)a6 shortcutsMetadata:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  WFConfiguredStaccatoAction *v18;
  uint64_t v19;
  NSString *identifier;
  uint64_t v21;
  NSString *name;
  uint64_t v23;
  NSString *associatedBundleIdentifier;
  uint64_t v25;
  NSData *shortcutsMetadata;
  WFConfiguredStaccatoAction *v27;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (v13)
  {
    if (v15)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFConfiguredSystemAction.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

    if (v14)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFConfiguredSystemAction.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  if (!v15)
    goto LABEL_8;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFConfiguredSystemAction.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("associatedBundleIdentifier"));

LABEL_4:
  v32.receiver = self;
  v32.super_class = (Class)WFConfiguredStaccatoAction;
  v18 = -[WFConfiguredStaccatoAction init](&v32, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v13, "copy");
    identifier = v18->_identifier;
    v18->_identifier = (NSString *)v19;

    v21 = objc_msgSend(v15, "copy");
    name = v18->_name;
    v18->_name = (NSString *)v21;

    v23 = objc_msgSend(v14, "copy");
    associatedBundleIdentifier = v18->_associatedBundleIdentifier;
    v18->_associatedBundleIdentifier = (NSString *)v23;

    v25 = objc_msgSend(v17, "copy");
    shortcutsMetadata = v18->_shortcutsMetadata;
    v18->_shortcutsMetadata = (NSData *)v25;

    objc_storeStrong((id *)&v18->_previewIcon, a6);
    v27 = v18;
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[WFConfiguredStaccatoAction identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[WFConfiguredStaccatoAction name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("name"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_previewIcon, CFSTR("previewIcon"));
  -[WFConfiguredStaccatoAction associatedBundleIdentifier](self, "associatedBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("associatedBundleIdentifier"));

  -[WFConfiguredStaccatoAction shortcutsMetadata](self, "shortcutsMetadata");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("shortcutsMetadata"));

}

- (WFConfiguredStaccatoAction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  WFConfiguredStaccatoAction *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedBundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("previewIcon"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortcutsMetadata"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  if (v5 && v7 && v6)
  {
    self = -[WFConfiguredStaccatoAction initWithIdentifier:associatedBundleIdentifier:name:previewIcon:shortcutsMetadata:](self, "initWithIdentifier:associatedBundleIdentifier:name:previewIcon:shortcutsMetadata:", v5, v6, v7, v8, v9);
    v10 = self;
  }

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[WFConfiguredStaccatoAction identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFConfiguredStaccatoAction name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFConfiguredStaccatoAction associatedBundleIdentifier](self, "associatedBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%p): id: %@ name: %@, bundle: %@>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  WFConfiguredStaccatoAction *v4;
  WFConfiguredStaccatoAction *v5;
  WFConfiguredStaccatoAction *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v37;
  void *v38;
  id v39;
  id v40;

  v4 = (WFConfiguredStaccatoAction *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        -[WFConfiguredStaccatoAction identifier](self, "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFConfiguredStaccatoAction identifier](v6, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v7;
        v10 = v8;
        v11 = v10;
        if (v9 == v10)
        {

        }
        else
        {
          LOBYTE(v12) = 0;
          v13 = v10;
          v14 = v9;
          if (!v9 || !v10)
            goto LABEL_42;
          v15 = objc_msgSend(v9, "isEqualToString:", v10);

          if (!v15)
          {
            LOBYTE(v12) = 0;
LABEL_43:

            goto LABEL_44;
          }
        }
        -[WFConfiguredStaccatoAction name](self, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFConfiguredStaccatoAction name](v6, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v16;
        v18 = v17;
        v13 = v18;
        if (v14 == v18)
        {

        }
        else
        {
          LOBYTE(v12) = 0;
          v19 = v18;
          v20 = v14;
          if (!v14 || !v18)
            goto LABEL_41;
          v21 = objc_msgSend(v14, "isEqualToString:", v18);

          if (!v21)
          {
            LOBYTE(v12) = 0;
LABEL_42:

            goto LABEL_43;
          }
        }
        -[WFConfiguredStaccatoAction associatedBundleIdentifier](self, "associatedBundleIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFConfiguredStaccatoAction associatedBundleIdentifier](v6, "associatedBundleIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v22;
        v24 = v23;
        v19 = v24;
        v40 = v20;
        if (v20 == v24)
        {

        }
        else
        {
          LOBYTE(v12) = 0;
          v25 = v24;
          if (!v20 || !v24)
            goto LABEL_40;
          v12 = objc_msgSend(v20, "isEqualToString:", v24);

          if (!v12)
            goto LABEL_41;
        }
        -[WFConfiguredStaccatoAction previewIcon](self, "previewIcon", v19);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFConfiguredStaccatoAction previewIcon](v6, "previewIcon");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v26;
        v29 = v27;
        v38 = v29;
        v39 = v28;
        if (v28 == v29)
        {

        }
        else
        {
          LOBYTE(v12) = 0;
          if (!v28)
          {
            v30 = v29;
            v19 = v37;
            goto LABEL_38;
          }
          v30 = v29;
          v19 = v37;
          if (!v29)
          {
LABEL_38:

            goto LABEL_39;
          }
          v31 = objc_msgSend(v28, "isEqual:", v29);

          if (!v31)
          {
            LOBYTE(v12) = 0;
            v19 = v37;
LABEL_39:
            v25 = v38;
            v20 = v39;
LABEL_40:

            v20 = v40;
LABEL_41:

            goto LABEL_42;
          }
        }
        -[WFConfiguredStaccatoAction shortcutsMetadata](self, "shortcutsMetadata");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFConfiguredStaccatoAction shortcutsMetadata](v6, "shortcutsMetadata");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v32;
        v34 = v33;
        v35 = v34;
        if (v28 == v34)
        {
          LOBYTE(v12) = 1;
        }
        else
        {
          LOBYTE(v12) = 0;
          if (v28)
          {
            v19 = v37;
            if (v34)
              LOBYTE(v12) = objc_msgSend(v28, "isEqual:", v34);
            goto LABEL_36;
          }
        }
        v19 = v37;
LABEL_36:

        v30 = v35;
        goto LABEL_38;
      }
    }
    LOBYTE(v12) = 0;
  }
LABEL_44:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  unint64_t v14;

  v3 = (void *)objc_opt_new();
  -[WFConfiguredStaccatoAction identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "combine:", v4);

  -[WFConfiguredStaccatoAction name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "combine:", v6);

  -[WFConfiguredStaccatoAction previewIcon](self, "previewIcon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "combine:", v8);

  -[WFConfiguredStaccatoAction associatedBundleIdentifier](self, "associatedBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "combine:", v10);

  -[WFConfiguredStaccatoAction shortcutsMetadata](self, "shortcutsMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "combine:", v12);

  v14 = objc_msgSend(v3, "finalize");
  return v14;
}

- (BOOL)usesPreviewIconSymbolOverride
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  void *v8;
  char v9;

  -[WFConfiguredStaccatoAction associatedBundleIdentifier](self, "associatedBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilenotes"));

  if ((v4 & 1) != 0)
    return 1;
  -[WFConfiguredStaccatoAction associatedBundleIdentifier](self, "associatedBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilephone"));

  if ((v6 & 1) != 0)
    return 1;
  -[WFConfiguredStaccatoAction identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("is.workflow.actions.runworkflow"));

  return v9;
}

- (WFIcon)previewIcon
{
  void *v3;
  void *v4;
  void *v5;
  WFSymbolIcon *v6;
  WFIcon *v7;
  WFSymbolIcon *v8;
  void *v9;
  void *v10;
  void *v11;
  WFSymbolIcon *v12;
  void *v13;
  void *v14;
  void *v15;
  WFSymbolIcon *v16;
  WFAppIcon *v17;
  void *v18;
  WFSymbolIcon *v19;
  void *v20;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v22[0] = CFSTR("Camera");
  v22[1] = CFSTR("Magnifier");
  v23[0] = CFSTR("camera.fill");
  v23[1] = CFSTR("plus.magnifyingglass");
  v22[2] = CFSTR("Accessibility");
  v23[2] = CFSTR("accessibility.fill");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFConfiguredStaccatoAction sectionIdentifier](self, "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v7 = self->_previewIcon;
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (-[WFConfiguredStaccatoAction usesPreviewIconSymbolOverride](self, "usesPreviewIconSymbolOverride"))
      {
        -[WFConfiguredStaccatoAction associatedBundleIdentifier](self, "associatedBundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFColor tintColorForBundleIdentifier:](WFColor, "tintColorForBundleIdentifier:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          v12 = v10;
        }
        else
        {
          +[WFColor whiteColor](WFColor, "whiteColor");
          v12 = (WFSymbolIcon *)objc_claimAutoreleasedReturnValue();
        }
        v16 = v12;

        v19 = [WFSymbolIcon alloc];
        -[WFIcon symbolName](v7, "symbolName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[WFSymbolIcon initWithSymbolName:symbolColor:](v19, "initWithSymbolName:symbolColor:", v20, v16);

        goto LABEL_14;
      }
    }
    else
    {

      v7 = 0;
    }
    -[WFConfiguredStaccatoAction identifier](self, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFConfiguredStaccatoAction associatedBundleIdentifier](self, "associatedBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFSymbolIcon symbolIconForActionIdentifier:bundleIdentifier:](WFSymbolIcon, "symbolIconForActionIdentifier:bundleIdentifier:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = v15;
      v8 = v16;
    }
    else
    {
      v17 = [WFAppIcon alloc];
      -[WFConfiguredStaccatoAction associatedBundleIdentifier](self, "associatedBundleIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[WFAppIcon initWithBundleIdentifier:](v17, "initWithBundleIdentifier:", v18);

      v16 = 0;
    }
LABEL_14:

    goto LABEL_15;
  }
  v6 = [WFSymbolIcon alloc];
  +[WFColor whiteColor](WFColor, "whiteColor");
  v7 = (WFIcon *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFSymbolIcon initWithSymbolName:symbolColor:](v6, "initWithSymbolName:symbolColor:", v5, v7);
LABEL_15:

  return (WFIcon *)v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setPreviewIcon:(id)a3
{
  objc_storeStrong((id *)&self->_previewIcon, a3);
}

- (NSString)associatedBundleIdentifier
{
  return self->_associatedBundleIdentifier;
}

- (void)setAssociatedBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)shortcutsMetadata
{
  return self->_shortcutsMetadata;
}

- (void)setShortcutsMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutsMetadata, 0);
  objc_storeStrong((id *)&self->_associatedBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_previewIcon, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
